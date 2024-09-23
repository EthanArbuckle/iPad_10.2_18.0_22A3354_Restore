@implementation LACTCCHelper

+ (int64_t)approvalStateOfFaceIDSeviceForAuditToken:(id *)a3
{
  int64_t result;
  int64_t *v4;

  result = TCCAccessPreflightWithAuditToken();
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 1)
    {
      v4 = &LACEnvironmentMechanismApprovalStateDenied;
    }
    else
    {
      if ((_DWORD)result != 2)
        return result;
      v4 = &LACEnvironmentMechanismApprovalStateUnknown;
    }
  }
  else
  {
    v4 = &LACEnvironmentMechanismApprovalStateGranted;
  }
  return *v4;
}

@end
