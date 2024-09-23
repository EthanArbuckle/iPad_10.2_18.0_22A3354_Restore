@implementation CNComposeAddressConcatenator

void __65___CNComposeAddressConcatenator_defaultRecipientListConcatenator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultRecipientListConcatenator___context;
  defaultRecipientListConcatenator___context = (uint64_t)v1;

  v3 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AND_N_MORE"), &stru_1E62C0368, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAndNMoreFormat:", v5);

  v6 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AND_N_MORE_NO_ELLIPSIS"), &stru_1E62C0368, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAndNMoreNoEllipsisFormat:", v8);

  v9 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("N_RECIPIENTS"), &stru_1E62C0368, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNAddressesFormat:", v11);

  v12 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TRUNCATED_RECIPIENT_FORMAT"), &stru_1E62C0368, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTruncatedAddressFormat:", v13);

}

id __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;

  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64) - 1;
  v7 = v6 - v5;
  if (v6 <= v5)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;
    v15 = a2;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = a2;
    objc_msgSend(v9, "localizedStringWithFormat:", a3, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

  v16 = *(const __CFString **)(a1 + 40);
  v17 = &stru_1E62C0368;
  if (!v16)
    v16 = &stru_1E62C0368;
  if (a2)
    v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", CFSTR("%@%@"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = a1[4];
  (*(void (**)(void))(a1[5] + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  return v4;
}

uint64_t __145___CNComposeAddressConcatenator_commaSeparatedAddressListWithAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (!a3)
    return (*(uint64_t (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32));
  objc_msgSend(a2, "stringByAppendingString:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return v5;
}

@end
