@implementation ZN8ISOMediaL7boxListEv

_QWORD *___ZN8ISOMediaL7boxListEv_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  ISOMedia::gBoxList = (uint64_t)result;
  return result;
}

@end
