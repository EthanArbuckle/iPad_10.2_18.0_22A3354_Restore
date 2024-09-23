@implementation IIODecodingSetAllowableTypes

CFArrayRef __IIODecodingSetAllowableTypes_block_invoke(IIO_ReaderHandler *a1)
{
  IIO_ReaderHandler *v1;
  CFIndex Count;
  uint64_t **ReaderHandler;
  CFArrayRef result;

  v1 = a1;
  if ((gIIODebugFlags & 0x4000000000000) != 0)
  {
    a1 = (IIO_ReaderHandler *)IIO_OSAppleInternalBuild();
    if ((_DWORD)a1)
    {
      Count = CFArrayGetCount(*((CFArrayRef *)v1 + 5));
      a1 = (IIO_ReaderHandler *)ImageIOLog("••• CGImageSourceSetAllowableTypes: limiting to %ld types\n", Count);
    }
  }
  ReaderHandler = (uint64_t **)IIO_ReaderHandler::GetReaderHandler(a1);
  *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v1 + 4) + 8) + 24) = IIO_ReaderHandler::setAllowableTypes(ReaderHandler, *((const __CFArray **)v1 + 5));
  if (gAllowedTypes)
    CFRelease((CFTypeRef)gAllowedTypes);
  result = CGImageSourceCopyTypeIdentifiers();
  gAllowedTypes = (uint64_t)result;
  gAllowedTypesChanged = 1;
  return result;
}

@end
