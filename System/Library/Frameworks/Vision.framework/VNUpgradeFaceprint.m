@implementation VNUpgradeFaceprint

BOOL __VNUpgradeFaceprint_block_invoke(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;

  v5 = a1;
  v6 = a2;
  if (!v5 && a3)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5 != 0;
}

@end
