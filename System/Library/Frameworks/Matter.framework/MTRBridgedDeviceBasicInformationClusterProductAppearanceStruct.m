@implementation MTRBridgedDeviceBasicInformationClusterProductAppearanceStruct

- (MTRBridgedDeviceBasicInformationClusterProductAppearanceStruct)init
{
  MTRBridgedDeviceBasicInformationClusterProductAppearanceStruct *v2;
  MTRBridgedDeviceBasicInformationClusterProductAppearanceStruct *v3;
  NSNumber *finish;
  NSNumber *primaryColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRBridgedDeviceBasicInformationClusterProductAppearanceStruct;
  v2 = -[MTRBridgedDeviceBasicInformationClusterProductAppearanceStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    finish = v2->_finish;
    v2->_finish = (NSNumber *)&unk_250591B18;

    primaryColor = v3->_primaryColor;
    v3->_primaryColor = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRBridgedDeviceBasicInformationClusterProductAppearanceStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRBridgedDeviceBasicInformationClusterProductAppearanceStruct);
  objc_msgSend_finish(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFinish_(v4, v8, (uint64_t)v7);

  objc_msgSend_primaryColor(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrimaryColor_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: finish:%@; primaryColor:%@; >"),
    v5,
    self->_finish,
    self->_primaryColor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)finish
{
  return self->_finish;
}

- (void)setFinish:(NSNumber *)finish
{
  objc_setProperty_nonatomic_copy(self, a2, finish, 8);
}

- (NSNumber)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(NSNumber *)primaryColor
{
  objc_setProperty_nonatomic_copy(self, a2, primaryColor, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_finish, 0);
}

@end
