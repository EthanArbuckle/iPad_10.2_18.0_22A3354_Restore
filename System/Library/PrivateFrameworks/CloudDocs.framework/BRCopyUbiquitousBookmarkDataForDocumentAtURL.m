@implementation BRCopyUbiquitousBookmarkDataForDocumentAtURL

void __BRCopyUbiquitousBookmarkDataForDocumentAtURL_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a2;
  v7 = a4;
  v8 = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  if (v7 && *(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = v7;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
