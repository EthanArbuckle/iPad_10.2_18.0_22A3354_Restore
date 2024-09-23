@implementation NSValue(DockState)

+ (uint64_t)valueWithDockState:()DockState
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{DockState=i{UnsignedWide=II}{UnsignedWide=II}Q[6C]QCQQBBddBB@{?=BII}IIB}");
}

- (uint64_t)dockStateValue
{
  *(_QWORD *)(x8_0 + 128) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)(x8_0 + 64) = xmmword_1D13E8028;
  *(_OWORD *)(x8_0 + 80) = unk_1D13E8038;
  memset((void *)(x8_0 + 96), 170, 32);
  memset((void *)x8_0, 170, 64);
  return objc_msgSend(a1, "getValue:");
}

@end
