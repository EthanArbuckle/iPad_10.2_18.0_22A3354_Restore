@implementation FCFetchThumbnailForIssue

uint64_t __FCFetchThumbnailForIssue_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "filePath");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
