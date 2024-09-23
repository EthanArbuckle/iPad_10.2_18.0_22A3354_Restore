@implementation CNiOSABLinkedContactsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABLinkedContactsPredicate)initWithCoder:(id)a3
{
  CNiOSABLinkedContactsPredicate *v3;
  CNiOSABLinkedContactsPredicate *v4;
  CNiOSABLinkedContactsPredicate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNiOSABLinkedContactsPredicate;
  v3 = -[CNLinkedContactsPredicate initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNiOSABLinkedContactsPredicate;
  -[CNLinkedContactsPredicate encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __CFArray *v15;
  const void *v16;
  const void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[CNLinkedContactsPredicate contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "isUnified");
    objc_msgSend(v9, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v10 == 0;
    if (v10)
      v13 = 0;
    else
      v13 = v11;
    if (v12)
      v14 = 0;
    else
      v14 = v11;
  }
  else
  {
    -[CNLinkedContactsPredicate contactIdentifier](self, "contactIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  if (v13 | v14)
  {
    if (v14)
    {
      v19[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v15 = (__CFArray *)ABAddressBookCopyPeopleWithUUIDs();
      goto LABEL_15;
    }
    v16 = (const void *)ABAddressBookCopyPersonMatchingInternalUUID();
    if (v16)
    {
      v17 = v16;
      v15 = ABPersonCopyArrayOfAllLinkedPeople(v16);
      CFRelease(v17);
      goto LABEL_15;
    }
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

@end
