@implementation ZN6WebKit16encoderToXPCDataEON3WTF9UniqueRefIN3IPC7EncoderEEE

IPC::Encoder *___ZN6WebKit16encoderToXPCDataEON3WTF9UniqueRefIN3IPC7EncoderEEE_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  IPC::Encoder *result;
  WTF *v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(IPC::Encoder **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;
  if (result)
  {
    IPC::Encoder::~Encoder(result, a2);
    return (IPC::Encoder *)WTF::fastFree(v4, v5);
  }
  return result;
}

@end
