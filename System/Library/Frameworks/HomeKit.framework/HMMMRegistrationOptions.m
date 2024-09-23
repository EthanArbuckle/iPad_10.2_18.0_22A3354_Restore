@implementation HMMMRegistrationOptions

- (HMMMRegistrationOptions)init
{
  return -[HMMMRegistrationOptions initWithUserRestriction:](self, "initWithUserRestriction:", 0);
}

- (HMMMRegistrationOptions)initWithUserRestriction:(int64_t)a3
{
  HMMMRegistrationOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMMMRegistrationOptions;
  result = -[HMMMRegistrationOptions init](&v5, sel_init);
  if (result)
    result->_userRestriction = a3;
  return result;
}

- (id)attributeDescriptions
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v4 = -[HMMMRegistrationOptions userRestriction](self, "userRestriction");
  if (v4 > 2)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E3AB00F0[v4];
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UserRestriction"), v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)userRestriction
{
  return self->_userRestriction;
}

@end
