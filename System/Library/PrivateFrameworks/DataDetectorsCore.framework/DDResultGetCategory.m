@implementation DDResultGetCategory

uint64_t __DDResultGetCategory_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = CFSetContainsValue((CFSetRef)DDResultGetCategory_urlSet, *(const void **)(a1 + 40));
  if ((_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __DDResultGetCategory_block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = CFSetContainsValue((CFSetRef)DDResultGetCategory_eventSet, *(const void **)(a1 + 40));
  if ((_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 4;
  return result;
}

dispatch_queue_t __DDResultGetCategory_block_invoke_4()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.datadetectors.Classify.Events", 0);
  DDResultGetCategory_sQueue_52 = (uint64_t)result;
  return result;
}

dispatch_queue_t __DDResultGetCategory_block_invoke_2()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.datadetectors.Classify.Links", 0);
  DDResultGetCategory_sQueue = (uint64_t)result;
  return result;
}

CFSetRef __DDResultGetCategory_block_invoke()
{
  const CFSetCallBacks *v0;
  CFSetRef result;
  void *v2[5];
  void *values[12];

  values[11] = *(void **)MEMORY[0x1E0C80C00];
  values[0] = CFSTR("BonjourAddress");
  values[1] = CFSTR("Email");
  values[2] = CFSTR("IPAddress");
  values[3] = CFSTR("HttpURL");
  values[4] = CFSTR("WebURL");
  values[5] = CFSTR("MapsURL");
  values[6] = CFSTR("MailURL");
  values[7] = CFSTR("FileURL");
  values[8] = CFSTR("DirtyFileURL");
  values[9] = CFSTR("GenericURL");
  values[10] = CFSTR("IMScreenName");
  v0 = (const CFSetCallBacks *)MEMORY[0x1E0C9B3B0];
  DDResultGetCategory_urlSet = (uint64_t)CFSetCreate(0, (const void **)values, 11, MEMORY[0x1E0C9B3B0]);
  v2[0] = CFSTR("Date");
  v2[1] = CFSTR("DateTime");
  v2[2] = CFSTR("Time");
  v2[3] = CFSTR("DateDuration");
  v2[4] = CFSTR("TimeDuration");
  result = CFSetCreate(0, (const void **)v2, 5, v0);
  DDResultGetCategory_eventSet = (uint64_t)result;
  return result;
}

@end
