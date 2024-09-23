@implementation MCCTMEID

void __MCCTMEID_block_invoke()
{
  void *v0;
  id obj;

  _EquipmentInfo();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "MEID");
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(obj, "length"))
    objc_storeStrong((id *)&MCCTMEID_meid, obj);

}

@end
