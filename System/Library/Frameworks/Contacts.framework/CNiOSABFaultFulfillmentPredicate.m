@implementation CNiOSABFaultFulfillmentPredicate

+ (id)os_log
{
  if (os_log_cn_once_token_0 != -1)
    dispatch_once(&os_log_cn_once_token_0, &__block_literal_global_1);
  return (id)os_log_cn_once_object_0;
}

void __42__CNiOSABFaultFulfillmentPredicate_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "predicates");
  v1 = (void *)os_log_cn_once_object_0;
  os_log_cn_once_object_0 = (uint64_t)v0;

}

- (CNiOSABFaultFulfillmentPredicate)initWithLegacyIdentifier:(int)a3 identifier:(id)a4
{
  NSString *v6;
  CNiOSABFaultFulfillmentPredicate *v7;
  NSString *identifier;
  objc_super v10;

  v6 = (NSString *)a4;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABFaultFulfillmentPredicate;
  v7 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, 0);
  v7->_legacyIdentifier = a3;
  identifier = v7->_identifier;
  v7->_identifier = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABFaultFulfillmentPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABFaultFulfillmentPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  CNiOSABFaultFulfillmentPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABFaultFulfillmentPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_legacyIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_legacyIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABFaultFulfillmentPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_legacyIdentifier, CFSTR("_legacyIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));

}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 1;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;

  v13 = 0;
  -[CNiOSABFaultFulfillmentPredicate cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:](self, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:", a3, a4, a5, a6, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (v8)
  {
    v11 = v8;
  }
  else if (a7)
  {
    *a7 = (__CFError *)v9;
  }

  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  ABRecordID v17;
  void *PersonWithRecordID;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  BOOL (*v24)(uint64_t, void *);
  void *v25;
  CNiOSABFaultFulfillmentPredicate *v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (-[CNiOSABFaultFulfillmentPredicate legacyIdentifier](self, "legacyIdentifier") > 0)
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke;
    aBlock[3] = &unk_1E29F7DC0;
    v13 = v11;
    v29 = v13;
    v14 = _Block_copy(aBlock);
    objc_msgSend(v10, "keysToFetch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    v23 = 3221225472;
    v24 = __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_2;
    v25 = &unk_1E29F7E38;
    v16 = v14;
    v26 = self;
    v27 = v16;
    LODWORD(v12) = objc_msgSend(v15, "_cn_any:", &v22);

    v17 = -[CNiOSABFaultFulfillmentPredicate legacyIdentifier](self, "legacyIdentifier", v22, v23, v24, v25);
    if ((_DWORD)v12)
    {
      PersonWithRecordID = (void *)ABAddressBookGetPersonWithRecordID(a3, v17);
      if (!PersonWithRecordID)
        goto LABEL_8;
    }
    else
    {
      -[CNiOSABFaultFulfillmentPredicate identifier](self, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PersonWithRecordID = (void *)ABAddressBookPrimePersonContextForIdentifier();

      if (!PersonWithRecordID)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    v30 = PersonWithRecordID;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    PersonWithRecordID = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v32 = CFSTR("CNKeyPaths");
  v31 = CFSTR("iOSLegacyIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  CNSetError(a7, 400, (uint64_t)v13);
  PersonWithRecordID = 0;
LABEL_9:

  return PersonWithRecordID;
}

BOOL __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  id v5;

  v3 = a2;
  if ((objc_msgSend(v3, "supportsABLazyLoading") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("iOSLegacyIdentifier"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v5 != v3;

  }
  return v4;
}

BOOL __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v3, "_cn_requiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_3;
  v13[3] = &unk_1E29F7DE8;
  v14 = *(id *)(a1 + 40);
  v15 = &v16;
  objc_msgSend(v4, "enumeratePropertiesUsingBlock:", v13);

  if (*((_BYTE *)v17 + 24))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "_cn_optionalKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_4;
    v10[3] = &unk_1E29F7E10;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = &v16;
    objc_msgSend(v7, "enumeratePropertiesUsingBlock:", v10);

    v6 = *((_BYTE *)v17 + 24) != 0;
  }

  _Block_object_dispose(&v16, 8);
  return v6;
}

uint64_t __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  uint8_t v8[16];

  v5 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_INFO, "Using the faultfulfillment predicate with optional keys, this may be slow.", v8, 2u);
  }

  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForFaultFulfillmentForLegacyIdentifier:identifier:]"));
  v5 = (id)objc_msgSend(v3, "appendName:intValue:", CFSTR("legacyIdentifier"), -[CNiOSABFaultFulfillmentPredicate legacyIdentifier](self, "legacyIdentifier"));
  -[CNiOSABFaultFulfillmentPredicate identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNiOSABFaultFulfillmentPredicate *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__CNiOSABFaultFulfillmentPredicate_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __44__CNiOSABFaultFulfillmentPredicate_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v7, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __44__CNiOSABFaultFulfillmentPredicate_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isInteger:equalToOther:", (int)objc_msgSend(*(id *)(a1 + 32), "legacyIdentifier"), (int)objc_msgSend(*(id *)(a1 + 40), "legacyIdentifier"));
}

uint64_t __44__CNiOSABFaultFulfillmentPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CNiOSABFaultFulfillmentPredicate_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNiOSABFaultFulfillmentPredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __40__CNiOSABFaultFulfillmentPredicate_hash__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "integerHash:", (int)objc_msgSend(*(id *)(a1 + 32), "legacyIdentifier"));
}

uint64_t __40__CNiOSABFaultFulfillmentPredicate_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (int)legacyIdentifier
{
  return self->_legacyIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
