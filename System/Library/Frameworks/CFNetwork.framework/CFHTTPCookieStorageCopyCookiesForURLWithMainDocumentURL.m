@implementation CFHTTPCookieStorageCopyCookiesForURLWithMainDocumentURL

intptr_t ___CFHTTPCookieStorageCopyCookiesForURLWithMainDocumentURL_block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
