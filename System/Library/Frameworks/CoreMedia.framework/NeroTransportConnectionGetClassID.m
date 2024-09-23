@implementation NeroTransportConnectionGetClassID

uint64_t __NeroTransportConnectionGetClassID_block_invoke()
{
  _QWORD *ClassID;

  ClassID = CMBaseGetClassID();
  return FigBaseClassRegisterClass((uint64_t)&NeroTransportConnectionGetClassID_sFigTransportConnectionClassDesc, ClassID, 1, &NeroTransportConnectionGetClassID_sFigTransportConnectionClassID);
}

@end
