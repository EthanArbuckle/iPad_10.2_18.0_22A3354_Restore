@implementation CopyProperty

CFTypeRef __dataSource_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  if (CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("PSGDataSource::DevicePSGInfos")))
  {
    result = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 16);
    if (!result)
    {
LABEL_4:
      **(_QWORD **)(a1 + 48) = result;
      return result;
    }
LABEL_3:
    result = CFRetain(result);
    goto LABEL_4;
  }
  result = (CFTypeRef)CFEqual(*(CFTypeRef *)(a1 + 40), CFSTR("PSGDataSource::LocalPSGInfo"));
  if ((_DWORD)result)
  {
    result = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 24);
    if (!result)
      goto LABEL_4;
    goto LABEL_3;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12787;
  return result;
}

@end
