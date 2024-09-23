@implementation LSDatabaseGetNoServerLock

double ___LSDatabaseGetNoServerLock_block_invoke()
{
  double result;
  _OWORD *v1;

  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer") & 1) == 0
    && (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) == 0)
  {
    v1 = (_OWORD *)operator new();
    result = 0.0;
    *v1 = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    v1[3] = 0u;
    *(_QWORD *)v1 = 850045858;
    _LSDatabaseGetNoServerLock::result = (uint64_t)v1;
  }
  return result;
}

@end
