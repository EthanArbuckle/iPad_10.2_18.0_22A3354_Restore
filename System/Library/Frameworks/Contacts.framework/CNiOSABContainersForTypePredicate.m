@implementation CNiOSABContainersForTypePredicate

- (CNiOSABContainersForTypePredicate)initWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  CNiOSABContainersForTypePredicate *v8;
  CNiOSABContainersForTypePredicate *v9;
  CNiOSABContainersForTypePredicate *v10;
  objc_super v12;

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("type == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)CNiOSABContainersForTypePredicate;
  v8 = -[CNPredicate initWithPredicate:](&v12, sel_initWithPredicate_, v7);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v10 = v8;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainersForTypePredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContainersForTypePredicate *v5;
  CNiOSABContainersForTypePredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContainersForTypePredicate;
  v5 = -[CNPredicate initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainersForTypePredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CFArrayRef v11;
  __CFArray *v12;
  _QWORD v14[4];
  id v15;

  +[CNiOSABConstantsMapping CNToABSourceTypeConstantsMapping](CNiOSABConstantsMapping, "CNToABSourceTypeConstantsMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNiOSABContainersForTypePredicate type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mappedConstant:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    if (a4)
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
      v12 = 0;
      *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v11 = ABAddressBookCopyArrayOfAllSources(a3);
    if (v11)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __74__CNiOSABContainersForTypePredicate_cn_copyContainersInAddressBook_error___block_invoke;
      v14[3] = &unk_1E29F93A0;
      v15 = v9;
      -[__CFArray _cn_filter:](v11, "_cn_filter:", v14);
      v12 = (__CFArray *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
    }

  }
  return v12;
}

BOOL __74__CNiOSABContainersForTypePredicate_cn_copyContainersInAddressBook_error___block_invoke(uint64_t a1)
{
  int IntValue;

  IntValue = ABRecordGetIntValue();
  return IntValue == objc_msgSend(*(id *)(a1 + 32), "intValue");
}

- (BOOL)includesDisabledContainers
{
  return 0;
}

- (NSString)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[CNiOSABContainersForTypePredicate type](self, "type");
  +[CNContainer descriptionForContainerType:](CNContainer, "descriptionForContainerType:", -[CNiOSABContainersForTypePredicate type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%ld(%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForContainersWithType:]"));
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", v6, CFSTR("type"));
  objc_msgSend(v7, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (int64_t)type
{
  return self->_type;
}

@end
