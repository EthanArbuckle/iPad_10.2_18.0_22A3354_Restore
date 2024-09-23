@implementation CNiOSABGroupiOSLegacyIdentifierPredicate

- (CNiOSABGroupiOSLegacyIdentifierPredicate)initWithiOSLegacyIdentifier:(int)a3
{
  void *v5;
  CNiOSABGroupiOSLegacyIdentifierPredicate *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("iOSLegacyIdentifier == %d"), *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABGroupiOSLegacyIdentifierPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v8, sel_initWithPredicate_, v5);

  if (v6)
    v6->_iOSLegacyIdentifier = a3;
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABGroupiOSLegacyIdentifierPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABGroupiOSLegacyIdentifierPredicate *v5;
  CNiOSABGroupiOSLegacyIdentifierPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABGroupiOSLegacyIdentifierPredicate;
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
  v5.super_class = (Class)CNiOSABGroupiOSLegacyIdentifierPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_iOSLegacyIdentifier, CFSTR("_iOSLegacyIdentifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  __CFArray *Mutable;
  ABRecordRef GroupWithRecordID;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  GroupWithRecordID = ABAddressBookGetGroupWithRecordID(a3, -[CNiOSABGroupiOSLegacyIdentifierPredicate iOSLegacyIdentifier](self, "iOSLegacyIdentifier"));
  if (GroupWithRecordID)
    CFArrayAppendValue(Mutable, GroupWithRecordID);
  return Mutable;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNGroup predicateForiOSLegacyIdentifier:]"));
  v5 = (id)objc_msgSend(v3, "appendName:intValue:", CFSTR("legacyIdentifier"), -[CNiOSABGroupiOSLegacyIdentifierPredicate iOSLegacyIdentifier](self, "iOSLegacyIdentifier"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

@end
