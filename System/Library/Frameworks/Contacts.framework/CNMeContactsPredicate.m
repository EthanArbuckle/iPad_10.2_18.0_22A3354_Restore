@implementation CNMeContactsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNMeContactsPredicate)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNMeContactsPredicate;
  return -[CNPredicate initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNMeContactsPredicate;
  -[CNPredicate encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (id)description
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForMeContact]"));
  objc_msgSend(v2, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isObject:memberOfSameClassAndEqualTo:withBlocks:", a3, self, &__block_literal_global_28, 0);
}

uint64_t __33__CNMeContactsPredicate_isEqual___block_invoke()
{
  return 1;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (id)contactsFromDonationStore:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "donatedMeCardEither");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLeft");
  v5 = (void *)MEMORY[0x1E0D13A18];
  if (v4)
  {
    objc_msgSend(v3, "left");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eitherWithLeft:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "right");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eitherWithRight:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
