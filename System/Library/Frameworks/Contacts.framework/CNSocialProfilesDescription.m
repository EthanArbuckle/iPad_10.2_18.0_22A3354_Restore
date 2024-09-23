@implementation CNSocialProfilesDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 54), CFSTR("_socialProfiles"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setSocialProfiles:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "socialProfiles");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF6208];
  return a3 != 0;
}

- (CNSocialProfilesDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("socialProfiles"), sel_socialProfiles, sel_setSocialProfiles_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v12 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 16; i != -8; i -= 8)

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_socialProfiles"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[54];
  v6[54] = v10;

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "socialProfiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "socialProfiles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "socialProfiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "socialProfiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;

  v5 = a4;
  v6 = a3;
  +[CN socialProfileToFoundationProfileTransform](CN, "socialProfileToFoundationProfileTransform");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v7)[2](v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CN socialProfileToFoundationProfileTransform](CN, "socialProfileToFoundationProfileTransform");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v9)[2](v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = CNSocialProfileEquivalentValues();
  return (char)v9;
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)dictionaryTransform
{
  return +[CN socialProfileToDictionaryTransform](CN, "socialProfileToDictionaryTransform");
}

- (id)fromDictionaryTransform
{
  return +[CN socialProfileFromDictionaryTransform](CN, "socialProfileFromDictionaryTransform");
}

- (id)summarizationKeys
{
  if (summarizationKeys_cn_once_token_10 != -1)
    dispatch_once(&summarizationKeys_cn_once_token_10, &__block_literal_global_587);
  return (id)summarizationKeys_cn_once_object_10;
}

void __48__CNSocialProfilesDescription_summarizationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("username"), CFSTR("userIdentifier"), CFSTR("displayname"), 0);
  v1 = (void *)summarizationKeys_cn_once_object_10;
  summarizationKeys_cn_once_object_10 = v0;

}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  id v5;
  void *v6;

  if (CNLabeledValueValueFromABMultiValueValue__cn_once_token_2 != -1)
    dispatch_once(&CNLabeledValueValueFromABMultiValueValue__cn_once_token_2, &__block_literal_global_67);
  v5 = (id)CNLabeledValueValueFromABMultiValueValue__cn_once_object_2;
  -[CNMultiValuePropertyDescription CNLabeledValueValueFromABMultiValueValue:destinationClass:settersByABKeys:](self, "CNLabeledValueValueFromABMultiValueValue:destinationClass:settersByABKeys:", a3, objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0CF6250];
  v0 = (void *)objc_msgSend(&__block_literal_global_68_0, "copy");
  v11[0] = v0;
  v10[1] = *MEMORY[0x1E0CF6228];
  v1 = (void *)objc_msgSend(&__block_literal_global_69, "copy");
  v11[1] = v1;
  v10[2] = *MEMORY[0x1E0CF6260];
  v2 = (void *)objc_msgSend(&__block_literal_global_70_1, "copy");
  v11[2] = v2;
  v10[3] = *MEMORY[0x1E0CF6258];
  v3 = (void *)objc_msgSend(&__block_literal_global_71_0, "copy");
  v11[3] = v3;
  v10[4] = *MEMORY[0x1E0CF6200];
  v4 = (void *)objc_msgSend(&__block_literal_global_72_2, "copy");
  v11[4] = v4;
  v10[5] = *MEMORY[0x1E0CF5F88];
  v5 = (void *)objc_msgSend(&__block_literal_global_73, "copy");
  v11[5] = v5;
  v10[6] = *MEMORY[0x1E0CF5F80];
  v6 = (void *)objc_msgSend(&__block_literal_global_74_1, "copy");
  v11[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)CNLabeledValueValueFromABMultiValueValue__cn_once_object_2;
  CNLabeledValueValueFromABMultiValueValue__cn_once_object_2 = v8;

}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUrlString:");
}

void __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  +[CNiOSABConstantsMapping ABToCNPersonSocialProfileConstantsMapping](CNiOSABConstantsMapping, "ABToCNPersonSocialProfileConstantsMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    +[CNiOSABConstantsMapping ABToCNPersonSocialProfileConstantsMapping](CNiOSABConstantsMapping, "ABToCNPersonSocialProfileConstantsMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mappedConstant:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setService:", v6);

}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsername:");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserIdentifier:");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayname:");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTeamIdentifier:");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBundleIdentifiers:");
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = ABMultiValueValueFromCNLabeledValueValue__cn_once_token_3;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&ABMultiValueValueFromCNLabeledValueValue__cn_once_token_3, &__block_literal_global_76_1);
  v6 = -[CNMultiValuePropertyDescription ABMultiValueValueFromCNLabeledValueValue:gettersByABKeys:](self, "ABMultiValueValueFromCNLabeledValueValue:gettersByABKeys:", v5, ABMultiValueValueFromCNLabeledValueValue__cn_once_object_3);

  return v6;
}

void __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0CF6250];
  v0 = (void *)objc_msgSend(&__block_literal_global_77_1, "copy");
  v11[0] = v0;
  v10[1] = *MEMORY[0x1E0CF6228];
  v1 = (void *)objc_msgSend(&__block_literal_global_78_2, "copy");
  v11[1] = v1;
  v10[2] = *MEMORY[0x1E0CF6260];
  v2 = (void *)objc_msgSend(&__block_literal_global_79_0, "copy");
  v11[2] = v2;
  v10[3] = *MEMORY[0x1E0CF6258];
  v3 = (void *)objc_msgSend(&__block_literal_global_80_0, "copy");
  v11[3] = v3;
  v10[4] = *MEMORY[0x1E0CF6200];
  v4 = (void *)objc_msgSend(&__block_literal_global_81, "copy");
  v11[4] = v4;
  v10[5] = *MEMORY[0x1E0CF5F88];
  v5 = (void *)objc_msgSend(&__block_literal_global_82, "copy");
  v11[5] = v5;
  v10[6] = *MEMORY[0x1E0CF5F80];
  v6 = (void *)objc_msgSend(&__block_literal_global_83_0, "copy");
  v11[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)ABMultiValueValueFromCNLabeledValueValue__cn_once_object_3;
  ABMultiValueValueFromCNLabeledValueValue__cn_once_object_3 = v8;

}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "urlString");
}

id __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNiOSABConstantsMapping CNToABPersonSocialProfileConstantsMapping](CNiOSABConstantsMapping, "CNToABPersonSocialProfileConstantsMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CNiOSABConstantsMapping CNToABPersonSocialProfileConstantsMapping](CNiOSABConstantsMapping, "CNToABPersonSocialProfileConstantsMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mappedConstant:", v2);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return v2;
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "username");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userIdentifier");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayname");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "teamIdentifier");
}

uint64_t __79__CNSocialProfilesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifiers");
}

@end
