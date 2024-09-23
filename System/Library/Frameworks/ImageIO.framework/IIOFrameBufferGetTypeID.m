@implementation IIOFrameBufferGetTypeID

uint64_t __IIOFrameBufferGetTypeID_block_invoke()
{
  uint64_t result;

  sIIOFrameBufferClass = 0;
  unk_1ECDD90D0 = "IIOFrameBuffer";
  qword_1ECDD90D8 = (uint64_t)iioFrameBufInit;
  unk_1ECDD90E0 = 0;
  qword_1ECDD90E8 = (uint64_t)iioFrameBufFinalize;
  unk_1ECDD90F0 = 0;
  qword_1ECDD90F8 = 0;
  unk_1ECDD9100 = 0;
  qword_1ECDD9108 = (uint64_t)iioFrameBufCopyDebugDesc;
  result = _CFRuntimeRegisterClass();
  sIIOFrameBufferID = result;
  return result;
}

@end
