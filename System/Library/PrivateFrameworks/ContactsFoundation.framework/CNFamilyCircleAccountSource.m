@implementation CNFamilyCircleAccountSource

- (CNFamilyCircleAccountSource)initWithFamilyCircle:(id)a3
{
  id v5;
  CNFamilyCircleAccountSource *v6;
  CNFamilyCircleAccountSource *v7;
  CNFamilyCircleAccountSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFamilyCircleAccountSource;
  v6 = -[CNFamilyCircleAccountSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_familyCircle, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("familyCircle"), self->_familyCircle);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)myFamilyMemberRecord
{
  void *v2;
  void *v3;

  -[FAFamilyCircle members](self->_familyCircle, "members");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_61);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __51__CNFamilyCircleAccountSource_myFamilyMemberRecord__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMe");
}

- (id)primaryAccount
{
  void *v2;
  void *v3;

  -[CNFamilyCircleAccountSource myFamilyMemberRecord](self, "myFamilyMemberRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*((void (**)(uint64_t, void *))CNCoreDelegateInfoFromFamilyMember + 2))((uint64_t)CNCoreDelegateInfoFromFamilyMember, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)delegateAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNFamilyCircleAccountSource myFamilyMemberRecord](self, "myFamilyMemberRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CNFamilyMember isAdministrativeGuardianFamilyMember:](CNFamilyMember, "isAdministrativeGuardianFamilyMember:", v3))
  {
    -[FAFamilyCircle members](self->_familyCircle, "members");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cn_filter:", CNFamilyMemberIsDelegateChild);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_map:", CNCoreDelegateInfoFromFamilyMember);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

@end
