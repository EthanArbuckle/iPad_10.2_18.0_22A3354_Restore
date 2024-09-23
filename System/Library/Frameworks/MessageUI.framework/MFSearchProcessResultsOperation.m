@implementation MFSearchProcessResultsOperation

uint64_t __40___MFSearchProcessResultsOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = _shouldCancel(*(void **)(a1 + 32), *(void **)(*(_QWORD *)(a1 + 32) + 248));
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "_didFinishSearchForType:", a2);
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "_appendSortedResultsOfType:excluding:toResults:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  return result;
}

@end
