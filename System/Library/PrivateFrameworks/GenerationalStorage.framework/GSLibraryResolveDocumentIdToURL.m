@implementation GSLibraryResolveDocumentIdToURL

uint64_t __GSLibraryResolveDocumentIdToURL_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  return objc_msgSend(*(id *)(a1 + 32), "handleBoolResult:error:", 1, 0);
}

@end
