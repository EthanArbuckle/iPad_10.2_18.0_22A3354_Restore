@implementation IIODisableRAWDecoding

uint64_t __IIODisableRAWDecoding_block_invoke(IIO_ReaderHandler *a1)
{
  IIO_ReaderHandler *v1;
  IIO_ReaderHandler *ReaderHandler;
  uint64_t result;

  v1 = a1;
  if ((gIIODebugFlags & 0x4000000000000) != 0)
  {
    a1 = (IIO_ReaderHandler *)IIO_OSAppleInternalBuild();
    if ((_DWORD)a1)
      a1 = (IIO_ReaderHandler *)ImageIOLog("••• CGImageSourceDisableRAWDecoding - RAW formats will no longer be handled in this process\n");
  }
  ReaderHandler = (IIO_ReaderHandler *)IIO_ReaderHandler::GetReaderHandler(a1);
  result = IIO_ReaderHandler::disableRAWPlugins(ReaderHandler);
  *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v1 + 4) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*((_QWORD *)v1 + 4) + 8) + 24))
  {
    gPermissions &= ~2uLL;
    gPermissionsChanged = 1;
  }
  return result;
}

@end
