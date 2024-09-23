@implementation FSEventStreamSetDispatchQueue

void __FSEventStreamSetDispatchQueue_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 188))
  {
    if (!*(_BYTE *)(v1 + 189))
      process_dir_events(*(_DWORD *)(a1 + 40), (_QWORD *)v1);
  }
}

void __FSEventStreamSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  FSEventStreamRelease(*(FSEventStreamRef *)(a1 + 40));
}

@end
