@implementation DMFFetchDMDStateResultObject

- (DMFFetchDMDStateResultObject)initWithStateDescription:(id)a3
{
  id v4;
  DMFFetchDMDStateResultObject *v5;
  uint64_t v6;
  NSString *dmdStateDescription;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchDMDStateResultObject;
  v5 = -[CATTaskResultObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dmdStateDescription = v5->_dmdStateDescription;
    v5->_dmdStateDescription = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchDMDStateResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchDMDStateResultObject *v5;
  void *v6;
  uint64_t v7;
  NSString *dmdStateDescription;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchDMDStateResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("dmdStateDescription"));
    v7 = objc_claimAutoreleasedReturnValue();
    dmdStateDescription = v5->_dmdStateDescription;
    v5->_dmdStateDescription = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchDMDStateResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchDMDStateResultObject dmdStateDescription](self, "dmdStateDescription", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dmdStateDescription"));

}

- (NSString)dmdStateDescription
{
  return self->_dmdStateDescription;
}

- (void)setDmdStateDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dmdStateDescription, 0);
}

@end
