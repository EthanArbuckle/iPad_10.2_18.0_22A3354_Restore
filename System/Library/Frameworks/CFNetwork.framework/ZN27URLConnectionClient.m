@implementation ZN27URLConnectionClient

_QWORD *___ZN27URLConnectionClient_Classic25_delegate_didSendBodyDataE18UploadProgressInfo_block_invoke(_QWORD *result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(a3 + 104))(a2, result[4], result[5], result[6], *(_QWORD *)(a3 + 8));
  }
  return result;
}

@end
