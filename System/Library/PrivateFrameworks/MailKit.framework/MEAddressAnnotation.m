@implementation MEAddressAnnotation

- (MEAddressAnnotation)initWithEmailAddressTokenIconType:(int64_t)a3 localizedDescription:(id)a4
{
  id v7;
  MEAddressAnnotation *v8;
  MEAddressAnnotation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MEAddressAnnotation;
  v8 = -[MEAddressAnnotation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_iconType = a3;
    objc_storeStrong((id *)&v8->_localizedDescription, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEAddressAnnotation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  MEAddressAnnotation *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_iconType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_localizedDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MEAddressAnnotation initWithEmailAddressTokenIconType:localizedDescription:](self, "initWithEmailAddressTokenIconType:localizedDescription:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[MEAddressAnnotation iconType](self, "iconType"), CFSTR("EFPropertyKey_iconType"));
  -[MEAddressAnnotation localizedDescription](self, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_localizedDescription"));

}

- (id)_iconTypeDescription
{
  unint64_t iconType;

  iconType = self->_iconType;
  if (iconType > 2)
    return &stru_24C4D2DE8;
  else
    return off_24C4D2598[iconType];
}

- (id)description
{
  void *v3;
  NSString *originatorExtensionDisplayName;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  originatorExtensionDisplayName = self->_originatorExtensionDisplayName;
  -[MEAddressAnnotation _iconTypeDescription](self, "_iconTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("App Extension Name:%@ IconType:%@ Description:%@}"), originatorExtensionDisplayName, v5, self->_localizedDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (MEAddressAnnotation)errorWithLocalizedDescription:(NSString *)localizedDescription
{
  NSString *v3;
  MEAddressAnnotation *v4;

  v3 = localizedDescription;
  v4 = -[MEAddressAnnotation initWithEmailAddressTokenIconType:localizedDescription:]([MEAddressAnnotation alloc], "initWithEmailAddressTokenIconType:localizedDescription:", 0, v3);

  return v4;
}

+ (MEAddressAnnotation)warningWithLocalizedDescription:(NSString *)localizedDescription
{
  NSString *v3;
  MEAddressAnnotation *v4;

  v3 = localizedDescription;
  v4 = -[MEAddressAnnotation initWithEmailAddressTokenIconType:localizedDescription:]([MEAddressAnnotation alloc], "initWithEmailAddressTokenIconType:localizedDescription:", 1, v3);

  return v4;
}

+ (MEAddressAnnotation)successWithLocalizedDescription:(NSString *)localizedDescription
{
  NSString *v3;
  MEAddressAnnotation *v4;

  v3 = localizedDescription;
  v4 = -[MEAddressAnnotation initWithEmailAddressTokenIconType:localizedDescription:]([MEAddressAnnotation alloc], "initWithEmailAddressTokenIconType:localizedDescription:", 2, v3);

  return v4;
}

- (int64_t)iconType
{
  return self->_iconType;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)originatorExtensionDisplayName
{
  return self->_originatorExtensionDisplayName;
}

- (void)setOriginatorExtensionDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorExtensionDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
}

@end
