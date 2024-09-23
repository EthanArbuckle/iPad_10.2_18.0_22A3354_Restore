@implementation MFAddressConcatenator

+ (id)defaultRecipientListConcatenator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MFAddressConcatenator_defaultRecipientListConcatenator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultRecipientListConcatenator_onceToken != -1)
    dispatch_once(&defaultRecipientListConcatenator_onceToken, block);
  return (id)defaultRecipientListConcatenator___context;
}

void __57__MFAddressConcatenator_defaultRecipientListConcatenator__block_invoke(uint64_t a1)
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
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultRecipientListConcatenator___context;
  defaultRecipientListConcatenator___context = (uint64_t)v1;

  v3 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AND_N_MORE"), &stru_1E5A6A588, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAndNMoreFormat:", v4);

  v5 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AND_N_MORE_NO_ELLIPSIS"), &stru_1E5A6A588, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAndNMoreNoEllipsisFormat:", v6);

  v7 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("N_RECIPIENTS"), &stru_1E5A6A588, CFSTR("Main"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNAddressesFormat:", v8);

  v9 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ONE_RECIPIENT"), &stru_1E5A6A588, CFSTR("Main"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOneAddressFormat:", v10);

  v11 = (void *)defaultRecipientListConcatenator___context;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TRUNCATED_RECIPIENT_FORMAT"), &stru_1E5A6A588, CFSTR("Main"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTruncatedAddressFormat:", v12);

}

- (void)setTruncatedAddressFormat:(id)a3
{
  objc_storeStrong((id *)&self->_truncatedAddressFormat, a3);
}

- (void)setOneAddressFormat:(id)a3
{
  objc_storeStrong((id *)&self->_oneAddressFormat, a3);
}

- (void)setNAddressesFormat:(id)a3
{
  objc_storeStrong((id *)&self->_nAddressesFormat, a3);
}

- (void)setAndNMoreNoEllipsisFormat:(id)a3
{
  objc_storeStrong((id *)&self->_andNMoreNoEllipsisFormat, a3);
}

- (void)setAndNMoreFormat:(id)a3
{
  objc_storeStrong((id *)&self->_andNMoreFormat, a3);
}

- (void)getCommaSeparatedAddressList:(id *)a3 andListSuffix:(id *)a4 withAddressCount:(unint64_t)a5 prefixForAddressAtIndex:(id)a6 stringForAddressAtIndex:(id)a7 lengthValidationBlock:(id)a8
{
  void (**v11)(id, unint64_t);
  uint64_t (**v12)(id, void *, _QWORD);
  MFAddressConcatenator *v13;
  unint64_t v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void (**v21)(void *, void *, _QWORD);
  void *v22;
  void *v23;
  int v24;
  char v25;
  __CFString *v26;
  id v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  __CFString *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void (**v38)(void);
  MFAddressConcatenator *v41;
  void (**v42)(id, unint64_t);
  void (**v43)(id, unint64_t);
  id v44;
  uint64_t (**v45)(id, void *, _QWORD);
  _QWORD v47[4];
  uint64_t (**v48)(id, void *, _QWORD);
  void (**v49)(void);
  uint64_t *v50;
  _QWORD v51[5];
  id v52;
  void (**v53)(void *, void *, _QWORD);
  _QWORD aBlock[4];
  __CFString *v55;
  id v56;
  uint64_t *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v11 = (void (**)(id, unint64_t))a6;
  v43 = (void (**)(id, unint64_t))a7;
  v12 = (uint64_t (**)(id, void *, _QWORD))a8;
  v13 = self;
  v44 = 0;
  v45 = v12;
  v14 = 0;
  v15 = &stru_1E5A6A588;
  v16 = MEMORY[0x1E0C809B0];
  v41 = self;
  v42 = v11;
  while (v14 < a5)
  {
    if (v11)
    {
      v11[2](v11, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_7;
    }
    else
    {
      v17 = 0;
      if (v14)
      {
LABEL_7:
        if (!v17)
        {
          MFLocalizedAddressSeparator();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    if (v17)
    {
      objc_msgSend(CFSTR("‌"), "stringByAppendingString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__9;
    v64 = __Block_byref_object_dispose__9;
    v65 = 0;
    v19 = v16;
    aBlock[0] = v16;
    aBlock[1] = 3221225472;
    aBlock[2] = __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke;
    aBlock[3] = &unk_1E5A69A10;
    v58 = v14;
    v59 = a5;
    v57 = &v60;
    v15 = v15;
    v55 = v15;
    v20 = v18;
    v56 = v20;
    v21 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
    v43[2](v43, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, void *, NSString *))v21)[2](v21, v22, v13->_andNMoreFormat);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v45[2](v45, v23, v61[5]);
    v25 = v24;
    if (v24)
    {
      v26 = v23;

      v27 = (id)v61[5];
      ++v14;
      v15 = v26;
      v13 = v41;
      v44 = v27;
    }
    else
    {
      if (!-[__CFString length](v15, "length")
        && v13->_truncatedAddressFormat
        && v13->_andNMoreNoEllipsisFormat
        && (unint64_t)objc_msgSend(v22, "length") >= 2)
      {
        v51[0] = v19;
        v51[1] = 3221225472;
        v51[2] = __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_2;
        v51[3] = &unk_1E5A69A38;
        v53 = v21;
        v51[4] = v13;
        v37 = v22;
        v52 = v37;
        v35 = _Block_copy(v51);
        v36 = objc_msgSend(v37, "length") - 1;
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_3;
        v47[3] = &unk_1E5A69A60;
        v48 = v45;
        v38 = v35;
        v49 = v38;
        v50 = &v60;
        v30 = MFLastIndexPassingTest(v36, v47);
        v13 = v41;
        if (v30 && v30 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v38[2]();
          v31 = objc_claimAutoreleasedReturnValue();

          v32 = (id)v61[5];
          v15 = (__CFString *)v31;
          v44 = v32;
          v13 = v41;
        }

      }
      if (!-[__CFString length](v15, "length"))
      {
        if (a5 >= 2 && v13->_nAddressesFormat)
        {
          objc_msgSend(MEMORY[0x1E0CB37F0], "ef_formatInteger:withGrouping:", a5, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13->_nAddressesFormat, v28);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v29 = v13->_oneAddressFormat;

        }
        v15 = v29;
        v13 = v41;
      }
    }

    _Block_object_dispose(&v60, 8);
    v16 = v19;
    v11 = v42;
    if ((v25 & 1) == 0)
      break;
  }
  v33 = objc_retainAutorelease(v15);
  *a3 = v33;
  v34 = objc_retainAutorelease(v44);
  *a4 = v34;

}

id __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64) - 1;
  if (v8 <= v7)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "ef_formatInteger:withGrouping:", v8 - v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v14 = *(const __CFString **)(a1 + 40);
  v15 = &stru_1E5A6A588;
  if (!v14)
    v14 = &stru_1E5A6A588;
  if (v5)
    v15 = v5;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", CFSTR("%@%@"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __155__MFAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_3(_QWORD *a1)
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

- (id)commaSeparatedAddressListWithAddressCount:(unint64_t)a3 prefixForAddressAtIndex:(id)a4 stringForAddressAtIndex:(id)a5 lengthValidationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__MFAddressConcatenator_commaSeparatedAddressListWithAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke;
  aBlock[3] = &unk_1E5A69A88;
  v13 = v12;
  v23 = v13;
  v14 = _Block_copy(aBlock);
  v20 = 0;
  v21 = 0;
  -[MFAddressConcatenator getCommaSeparatedAddressList:andListSuffix:withAddressCount:prefixForAddressAtIndex:stringForAddressAtIndex:lengthValidationBlock:](self, "getCommaSeparatedAddressList:andListSuffix:withAddressCount:prefixForAddressAtIndex:stringForAddressAtIndex:lengthValidationBlock:", &v21, &v20, a3, v10, v11, v14);
  v15 = v21;
  v16 = v20;
  if (v16)
  {
    objc_msgSend(v15, "stringByAppendingString:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v15;
  }
  v18 = v17;

  return v18;
}

uint64_t __137__MFAddressConcatenator_commaSeparatedAddressListWithAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v5, "stringByAppendingString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  if (v6)

  return v9;
}

- (NSString)andNMoreFormat
{
  return self->_andNMoreFormat;
}

- (NSString)andNMoreNoEllipsisFormat
{
  return self->_andNMoreNoEllipsisFormat;
}

- (NSString)oneAddressFormat
{
  return self->_oneAddressFormat;
}

- (NSString)nAddressesFormat
{
  return self->_nAddressesFormat;
}

- (NSString)truncatedAddressFormat
{
  return self->_truncatedAddressFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncatedAddressFormat, 0);
  objc_storeStrong((id *)&self->_nAddressesFormat, 0);
  objc_storeStrong((id *)&self->_oneAddressFormat, 0);
  objc_storeStrong((id *)&self->_andNMoreNoEllipsisFormat, 0);
  objc_storeStrong((id *)&self->_andNMoreFormat, 0);
}

@end
