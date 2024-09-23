@implementation CNiOSABContactLegacyIdentifierPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CF5D88], "predicateForContactsWithLegacyIdentifier:", self->_legacyIdentifier, a4, a5);
}

- (CNiOSABContactLegacyIdentifierPredicate)initWithLegacyIdentifier:(int)a3
{
  CNiOSABContactLegacyIdentifierPredicate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContactLegacyIdentifierPredicate;
  result = -[CNPredicate init](&v5, sel_init);
  result->_legacyIdentifier = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContactLegacyIdentifierPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContactLegacyIdentifierPredicate *v5;
  CNiOSABContactLegacyIdentifierPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContactLegacyIdentifierPredicate;
  v5 = -[CNPredicate initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_legacyIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_legacyIdentifier"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContactLegacyIdentifierPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_legacyIdentifier, CFSTR("_legacyIdentifier"), v5.receiver, v5.super_class);

}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  __CFArray *result;
  void *values;

  result = (__CFArray *)ABAddressBookGetPersonWithRecordID(a3, self->_legacyIdentifier);
  values = result;
  if (result)
    return CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  return result;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForLegacyIdentifier:]"));
  v5 = (id)objc_msgSend(v3, "appendName:intValue:", CFSTR("legacyIdentifier"), -[CNiOSABContactLegacyIdentifierPredicate legacyIdentifier](self, "legacyIdentifier"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int)legacyIdentifier
{
  return self->_legacyIdentifier;
}

@end
