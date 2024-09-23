@implementation CNiOSABContaineriOSLegacyIdentifierPredicate

- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABContaineriOSLegacyIdentifierPredicate initWithiOSLegacyIdentifier:](self, "initWithiOSLegacyIdentifier:", 0xFFFFFFFFLL);
}

- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithiOSLegacyIdentifier:(int)a3
{
  void *v5;
  CNiOSABContaineriOSLegacyIdentifierPredicate *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("iOSLegacyIdentifier == %d"), *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContaineriOSLegacyIdentifierPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v8, sel_initWithPredicate_, v5);

  if (v6)
    v6->_iOSLegacyIdentifier = a3;
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContaineriOSLegacyIdentifierPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContaineriOSLegacyIdentifierPredicate *v5;
  CNiOSABContaineriOSLegacyIdentifierPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContaineriOSLegacyIdentifierPredicate;
  v5 = -[CNPredicate initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_iOSLegacyIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_iOSLegacyIdentifier"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContaineriOSLegacyIdentifierPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_iOSLegacyIdentifier, CFSTR("_iOSLegacyIdentifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  const __CFAllocator *v4;
  void *values;

  values = (void *)ABAddressBookGetSourceWithRecordID(a3, -[CNiOSABContaineriOSLegacyIdentifierPredicate iOSLegacyIdentifier](self, "iOSLegacyIdentifier", a3, a4));
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (values)
    return CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  else
    return CFArrayCreate(v4, 0, 0, MEMORY[0x1E0C9B378]);
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForiOSLegacyIdentifier:]"));
  v5 = (id)objc_msgSend(v3, "appendName:intValue:", CFSTR("legacyIdentifier"), -[CNiOSABContaineriOSLegacyIdentifierPredicate iOSLegacyIdentifier](self, "iOSLegacyIdentifier"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

@end
