@implementation HMDCompositeSettingPrivileges

- (HMDCompositeSettingPrivileges)initWithMinReadUserPrivilege:(unint64_t)a3
{
  HMDCompositeSettingPrivileges *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDCompositeSettingPrivileges;
  result = -[HMDCompositeSettingPrivileges init](&v5, sel_init);
  if (result)
    result->_minReadUserPrivilege = a3;
  return result;
}

- (unint64_t)minReadUserPrivilege
{
  return self->_minReadUserPrivilege;
}

@end
