@implementation INFVariantsDescriptor

- (NSString)dictionaryKey
{
  unint64_t plurality;
  const __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t gender;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;

  plurality = self->_plurality;
  if (plurality)
  {
    v4 = CFSTR("LOCPluralityNone");
    if (plurality == 1)
      v4 = CFSTR("LOCPluralityOne");
    if (plurality == 2)
      v5 = CFSTR("LOCPluralityOther");
    else
      v5 = (__CFString *)v4;
    v6 = v5;
    -[INFVariantsDescriptor append:toString:](self, "append:toString:", v6, &stru_1E9778A78);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E9778A78;
  }
  gender = self->_gender;
  if (gender)
  {
    v9 = CFSTR("LOCGenderNone");
    if (gender == 1)
      v9 = CFSTR("LOCGenderFeminine");
    if (gender == 2)
      v10 = CFSTR("LOCGenderMasculine");
    else
      v10 = (__CFString *)v9;
    v11 = v10;
    -[INFVariantsDescriptor append:toString:](self, "append:toString:", v11, v7);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v12;
  }
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", &stru_1E9778A78))
  {
    v13 = CFSTR("LOCVariantsNone");

    v7 = CFSTR("LOCVariantsNone");
  }
  return (NSString *)v7;
}

- (id)append:(id)a3 toString:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v6, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (INFVariantsDescriptor)init
{
  INFVariantsDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INFVariantsDescriptor;
  result = -[INFVariantsDescriptor init](&v3, sel_init);
  if (result)
  {
    result->_plurality = 0;
    result->_gender = 0;
  }
  return result;
}

- (INFVariantsDescriptor)initWithVariants:(unint64_t)a3
{
  char v3;
  INFVariantsDescriptor *result;

  v3 = a3;
  result = -[INFVariantsDescriptor init](self, "init");
  if (result)
  {
    if ((v3 & 1) != 0)
    {
      result->_plurality = 1;
      if ((v3 & 2) == 0)
      {
LABEL_4:
        if ((v3 & 4) == 0)
          goto LABEL_5;
        goto LABEL_10;
      }
    }
    else if ((v3 & 2) == 0)
    {
      goto LABEL_4;
    }
    result->_plurality = 2;
    if ((v3 & 4) == 0)
    {
LABEL_5:
      if ((v3 & 8) == 0)
        return result;
      goto LABEL_6;
    }
LABEL_10:
    result->_gender = 2;
    if ((v3 & 8) == 0)
      return result;
LABEL_6:
    result->_gender = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (self)
  {
    objc_msgSend(v4, "setPlurality:", self->_plurality);
    objc_msgSend(v5, "setGender:", self->_gender);
  }
  return v5;
}

- (id)variantByRemovingOneAttribute
{
  void *v2;

  v2 = (void *)-[INFVariantsDescriptor copy](self, "copy");
  if (objc_msgSend(v2, "gender"))
  {
    objc_msgSend(v2, "setGender:", 0);
  }
  else if (objc_msgSend(v2, "plurality"))
  {
    objc_msgSend(v2, "setPlurality:", 0);
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  INFVariantsDescriptor *v4;
  unint64_t gender;
  unint64_t plurality;
  BOOL v7;
  BOOL v8;

  v4 = (INFVariantsDescriptor *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    gender = self->_gender;
    if (gender != -[INFVariantsDescriptor gender](v4, "gender"))
    {
      v8 = 0;
      goto LABEL_9;
    }
    plurality = self->_plurality;
    v7 = plurality == -[INFVariantsDescriptor plurality](v4, "plurality");
  }
  else
  {
    v7 = self == v4;
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)plurality
{
  return self->_plurality;
}

- (void)setPlurality:(unint64_t)a3
{
  self->_plurality = a3;
}

- (unint64_t)gender
{
  return self->_gender;
}

- (void)setGender:(unint64_t)a3
{
  self->_gender = a3;
}

+ (id)variantWithVariants:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithVariants:", a3);
}

+ (id)variant
{
  return objc_alloc_init((Class)a1);
}

@end
