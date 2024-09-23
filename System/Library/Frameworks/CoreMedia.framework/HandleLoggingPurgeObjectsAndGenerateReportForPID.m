@implementation HandleLoggingPurgeObjectsAndGenerateReportForPID

void __HandleLoggingPurgeObjectsAndGenerateReportForPID_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t xarray, uint64_t a4, unsigned int a5)
{
  __CFString *v9;
  size_t count;

  v9 = *(__CFString **)(a1 + 40);
  if (xarray)
    count = xpc_array_get_count(xarray);
  else
    count = 0;
  CFStringAppendFormat(v9, 0, CFSTR("|%-80s|%-20ld|%-64lld|%-32d|\n"), a2, count, a4, a5);
  if (a5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

@end
