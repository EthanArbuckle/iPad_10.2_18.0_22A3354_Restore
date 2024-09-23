@implementation CNiOSABPhoneNumberContactPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend((id)objc_opt_class(), "stringValueForPredicate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "countryCodeForPredicate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v9 = 0;
LABEL_4:
    CNSetError(a5, 400, 0);
    goto LABEL_5;
  }
  v10 = (void *)MEMORY[0x1E0CF5D88];
  -[CNPhoneNumberContactPredicate prefixHint]((uint64_t)self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhoneNumberContactPredicate groupIdentifiers]((uint64_t)self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForContactsMatchingPhoneNumber:country:homeCountryCode:prefixHint:groupIdentifiers:limitToOneResult:", v7, v8, 0, v11, v12, !-[CNPhoneNumberContactPredicate returnsMultipleResults]((_BOOL8)self));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_4;
LABEL_5:

  return v9;
}

+ (id)stringValueForPredicate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *MEMORY[0x1E0D13848];
  v4 = a3;
  -[CNPhoneNumberContactPredicate digits]((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if ((v3 & 1) != 0)
  {
    -[CNPhoneNumberContactPredicate phoneNumber]((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "digits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
  }
  else
  {
    -[CNPhoneNumberContactPredicate digits]((uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)countryCodeForPredicate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *MEMORY[0x1E0D13848];
  v4 = a3;
  -[CNPhoneNumberContactPredicate countryCode]((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if ((v3 & 1) != 0)
  {
    -[CNPhoneNumberContactPredicate phoneNumber]((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
  }
  else
  {
    -[CNPhoneNumberContactPredicate countryCode]((uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v9;
  void *v10;
  void *v11;
  __CFArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "stringValueForPredicate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "countryCodeForPredicate:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    if (a7)
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
      v12 = 0;
      *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CF5D88];
    -[CNPhoneNumberContactPredicate prefixHint]((uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhoneNumberContactPredicate groupIdentifiers]((uint64_t)self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateForContactsMatchingPhoneNumber:country:homeCountryCode:prefixHint:groupIdentifiers:limitToOneResult:", v10, v11, 0, v14, v15, !-[CNPhoneNumberContactPredicate returnsMultipleResults]((_BOOL8)self));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sortOrder");
    v12 = (__CFArray *)ABAddressBookCopyAllPeopleForBufferPredicate();

  }
  return v12;
}

@end
