@implementation BLSHDisableFlipbookPowerSavingAttribute

+ (id)disablePowerSavingForReason:(unint64_t)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = objc_alloc((Class)a1);
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)BLSHDisableFlipbookPowerSavingAttribute;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4)
      v4[1] = a3;
  }
  return v4;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, CFSTR("com.apple.backlight.disableFlipbookPowerSaving"), a4);
}

- (unint64_t)reason
{
  return self->_reason;
}

@end
