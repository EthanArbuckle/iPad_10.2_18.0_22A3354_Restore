@implementation CNiOSABPreferredNameContactsPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a4;
  objc_msgSend(v6, "managedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceHasManagementRestrictions");

  if (v8)
  {
    objc_msgSend(v6, "managedConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ABAddressBookIndexSetOfAllowedSourceIdentifiersIncludingDisabledSources();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CF5D88];
    v12 = -[CNiOSABPreferredNameContactsPredicate range](self, "range");
    v14 = v13;
    v15 = objc_msgSend(v6, "sortOrder");

    objc_msgSend(v11, "predicateForContactsInRange:allowedStoreIdentifiers:sortOrder:", v12, v14, v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CF5D88];
    v18 = -[CNiOSABPreferredNameContactsPredicate range](self, "range");
    v20 = v19;
    v21 = objc_msgSend(v6, "sortOrder");

    objc_msgSend(v17, "predicateForContactsInRange:sortOrder:", v18, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (CNiOSABPreferredNameContactsPredicate)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CNiOSABPreferredNameContactsPredicate *v5;
  CNiOSABPreferredNameContactsPredicate *v6;
  CNiOSABPreferredNameContactsPredicate *v7;
  objc_super v9;

  length = a3.length;
  location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABPreferredNameContactsPredicate;
  v5 = -[CNPredicate init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_range.location = location;
    v5->_range.length = length;
    v7 = v5;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPreferredNameContactsPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABPreferredNameContactsPredicate *v5;
  CNiOSABPreferredNameContactsPredicate *v6;
  _NSRange *p_range;
  void *v8;
  NSUInteger v9;
  CNiOSABPreferredNameContactsPredicate *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNiOSABPreferredNameContactsPredicate;
  v5 = -[CNPredicate initWithCoder:](&v12, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_range = &v5->_range;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_range"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    p_range->location = objc_msgSend(v8, "rangeValue");
    v6->_range.length = v9;

    v10 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNiOSABPreferredNameContactsPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_range.location, self->_range.length, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_range"));

}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v8;
  void *v9;
  __CFArray *v10;

  v8 = a4;
  -[CNiOSABPreferredNameContactsPredicate range](self, "range");
  objc_msgSend(v8, "managedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortOrder");

  v10 = (__CFArray *)ABCopyArrayOfPreferredNamePeopleAtOffsetForManagedConfiguration();
  return v10;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSRange v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForPreferredNameInRange:]"));
  v9.location = -[CNiOSABPreferredNameContactsPredicate range](self, "range");
  NSStringFromRange(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("range"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end
