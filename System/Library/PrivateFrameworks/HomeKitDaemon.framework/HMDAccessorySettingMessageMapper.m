@implementation HMDAccessorySettingMessageMapper

- (HMDAccessorySettingMessageMapper)initWithIdentifier:(id)a3 queue:(id)a4 allowSharedAdminEditConstraints:(BOOL)a5
{
  HMDAccessorySettingMessageMapper *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDAccessorySettingMessageMapper;
  result = -[HMDSettingMessageMapper initWithIdentifier:queue:](&v7, sel_initWithIdentifier_queue_, a3, a4);
  if (result)
    result->_shouldAllowSharedAdminToEditConstraints = a5;
  return result;
}

- (BOOL)shouldAllowSharedAdminToEditConstraints
{
  return self->_shouldAllowSharedAdminToEditConstraints;
}

- (void)setShouldAllowSharedAdminToEditConstraints:(BOOL)a3
{
  self->_shouldAllowSharedAdminToEditConstraints = a3;
}

@end
