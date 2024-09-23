@implementation CNiOSABAllContactsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABAllContactsPredicate)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNiOSABAllContactsPredicate;
  return -[CNPredicate initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNiOSABAllContactsPredicate;
  -[CNPredicate encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  return ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(a3, 0, objc_msgSend(a4, "sortOrder"));
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CF5D88], "predicateForAllContacts", a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:withBlocks:", self, a3, &__block_literal_global_87, 0);
}

uint64_t __39__CNiOSABAllContactsPredicate_isEqual___block_invoke()
{
  return 1;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (NSString)description
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForAllContacts:]"));
  objc_msgSend(v2, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
