@implementation HMDAccessorySettingConstraintModifyOperation

- (void)main
{
  void (**v2)(void);

  -[HMDAccessorySettingConstraintModifyOperation executionBlock](self, "executionBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (id)executionBlock
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)setExecutionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionBlock, 0);
}

@end
