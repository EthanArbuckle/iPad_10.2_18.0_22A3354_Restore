@implementation BLTSectionConfigurationMessagesItem

- (unint64_t)coordinationTypeWithSubtype:(int64_t)a3
{
  unint64_t result;
  void *v5;
  _BOOL4 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLTSectionConfigurationMessagesItem;
  result = -[BLTSectionConfigurationItem coordinationTypeWithSubtype:](&v7, sel_coordinationTypeWithSubtype_);
  if (!result)
  {
    if (a3 == 5)
    {
      objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (unint64_t)objc_msgSend(v5, "bltVersion") < 6;

      return 2 * v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
