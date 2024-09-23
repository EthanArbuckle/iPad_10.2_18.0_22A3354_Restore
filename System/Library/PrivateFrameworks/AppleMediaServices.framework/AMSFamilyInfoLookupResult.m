@implementation AMSFamilyInfoLookupResult

- (AMSFamilyInfoLookupResult)initWithDictionaryRepresentation:(id)a3 cached:(BOOL)a4
{
  id v6;
  AMSFamilyInfoLookupResult *v7;
  AMSFamilyInfoLookupResult *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSFamilyInfoLookupResult;
  v7 = -[AMSFamilyInfoLookupResult init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_cached = a4;
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("family.ICloudHohDsid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10)
      v11 = v10;
    else
      v11 = &unk_1E25AF548;
    objc_storeStrong((id *)&v8->_headOfHouseholdICloudDSID, v11);

    objc_msgSend(v6, "valueForKeyPath:", CFSTR("family.hohSharingPayment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "valueForKeyPath:", CFSTR("family.hohSharingPayment"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_headOfHouseholdSharingPayment = objc_msgSend(v13, "BOOLValue");

    }
    else
    {
      v8->_headOfHouseholdSharingPayment = 0;
    }

    +[AMSFamilyInfoLookupResult _familyMembersFromDictionaryRepresentation:](AMSFamilyInfoLookupResult, "_familyMembersFromDictionaryRepresentation:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v8->_familyMembers, v16);

  }
  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[AMSFamilyInfoLookupResult familyMembers](self, "familyMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_mapWithTransform:", &__block_literal_global_51);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("family");
  v11[0] = v4;
  v10[0] = CFSTR("members");
  v10[1] = CFSTR("hohSharingPayment");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSFamilyInfoLookupResult isHeadOfHouseholdSharingPayment](self, "isHeadOfHouseholdSharingPayment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("ICloudHohDsid");
  -[AMSFamilyInfoLookupResult headOfHouseholdICloudDSID](self, "headOfHouseholdICloudDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

uint64_t __53__AMSFamilyInfoLookupResult_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("isCached");
  if (-[AMSFamilyInfoLookupResult isCached](self, "isCached"))
    v3 = CFSTR("true");
  else
    v3 = CFSTR("false");
  v11[0] = v3;
  v10[1] = CFSTR("hohSharingPayment");
  if (-[AMSFamilyInfoLookupResult isHeadOfHouseholdSharingPayment](self, "isHeadOfHouseholdSharingPayment"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v11[1] = v4;
  v10[2] = CFSTR("ICloudHohDsid");
  -[AMSFamilyInfoLookupResult headOfHouseholdICloudDSID](self, "headOfHouseholdICloudDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("familyMembers");
  -[AMSFamilyInfoLookupResult familyMembers](self, "familyMembers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_familyMembersFromDictionaryRepresentation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  objc_msgSend(a3, "valueForKeyPath:", CFSTR("family.members"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_filterUsingTest:", &__block_literal_global_33);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiCloudAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_activeiTunesAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_DSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_3;
  v21[3] = &unk_1E2541B20;
  v14 = v9;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  objc_msgSend(v6, "ams_firstObjectPassingTest:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_4;
    v19[3] = &unk_1E2541B48;
    v20 = v15;
    objc_msgSend(v6, "ams_firstObjectPassingTest:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v16, "setCurrentSignedInUser:", 1);
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_37_0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMSFamilyMember *v3;
  AMSFamilyMember *v4;
  AMSFamilyMember *v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[AMSFamilyMember initWithDictionaryRepresentation:]([AMSFamilyMember alloc], "initWithDictionaryRepresentation:", v2);
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (AMSFamilyMember *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

BOOL __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99E38];
  v3 = a2;
  objc_msgSend(v2, "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 != v3;
}

uint64_t __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "iCloudDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToNumber:", *(_QWORD *)(a1 + 32)) && *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v4, "iTunesDSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToNumber:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  if (!*(_QWORD *)(a1 + 32))
    return 0;
  objc_msgSend(a2, "iTunesDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v5, "firstName");
    v7 = objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_11;
  }
  if ((objc_msgSend(v4, "isCurrentSignedInUser") & 1) != 0
    || (objc_msgSend(v5, "firstName"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    v7 = -1;
  }
  else if ((objc_msgSend(v5, "isCurrentSignedInUser") & 1) != 0
         || (objc_msgSend(v4, "firstName"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "localizedCaseInsensitiveCompare:", v11);

  }
LABEL_11:

  return v7;
}

- (BOOL)isCached
{
  return self->_cached;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (NSNumber)headOfHouseholdICloudDSID
{
  return self->_headOfHouseholdICloudDSID;
}

- (BOOL)isHeadOfHouseholdSharingPayment
{
  return self->_headOfHouseholdSharingPayment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headOfHouseholdICloudDSID, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end
