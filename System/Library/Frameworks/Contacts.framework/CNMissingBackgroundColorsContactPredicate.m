@implementation CNMissingBackgroundColorsContactPredicate

- (id)description
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMissingBackgroundColors]"));
  objc_msgSend(v2, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)shortDebugDescription
{
  return CFSTR("MissingBackgroundColorsPredicate");
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:withBlocks:", self, a3, &__block_literal_global_84, 0);
}

uint64_t __53__CNMissingBackgroundColorsContactPredicate_isEqual___block_invoke()
{
  return 1;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNMissingBackgroundColorsContactPredicate)initWithCoder:(id)a3
{
  CNMissingBackgroundColorsContactPredicate *v3;
  CNMissingBackgroundColorsContactPredicate *v4;
  CNMissingBackgroundColorsContactPredicate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNMissingBackgroundColorsContactPredicate;
  v3 = -[CNPredicate initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNMissingBackgroundColorsContactPredicate;
  -[CNPredicate encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end
