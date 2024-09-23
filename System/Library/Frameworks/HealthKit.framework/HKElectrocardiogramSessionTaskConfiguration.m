@implementation HKElectrocardiogramSessionTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSessionConfiguration:", self->_sessionConfiguration);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKElectrocardiogramSessionTaskConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKElectrocardiogramSessionTaskConfiguration *v5;
  uint64_t v6;
  HKElectrocardiogramSessionConfiguration *sessionConfiguration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKElectrocardiogramSessionTaskConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionConfiguration = v5->_sessionConfiguration;
    v5->_sessionConfiguration = (HKElectrocardiogramSessionConfiguration *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKElectrocardiogramSessionTaskConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionConfiguration, CFSTR("sessionConfiguration"), v5.receiver, v5.super_class);

}

- (HKElectrocardiogramSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
}

@end
