@implementation AUAudioUnitPreset

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_number, CFSTR("num"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (AUAudioUnitPreset)initWithCoder:(id)a3
{
  id v4;
  AUAudioUnitPreset *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitPreset;
  v5 = -[AUAudioUnitPreset init](&v9, sel_init);
  if (v5)
  {
    v5->_number = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("num"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_name, v7);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUAudioUnitPreset;
  -[AUAudioUnitPreset dealloc](&v2, sel_dealloc);
}

- (NSInteger)number
{
  return self->_number;
}

- (void)setNumber:(NSInteger)number
{
  self->_number = number;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
