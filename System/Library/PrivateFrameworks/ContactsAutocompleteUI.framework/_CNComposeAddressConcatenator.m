@implementation _CNComposeAddressConcatenator

+ (id)defaultRecipientListConcatenator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___CNComposeAddressConcatenator_defaultRecipientListConcatenator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultRecipientListConcatenator_onceToken != -1)
    dispatch_once(&defaultRecipientListConcatenator_onceToken, block);
  return (id)defaultRecipientListConcatenator___context;
}

- (void)getCommaSeparatedAddressList:(id *)a3 andListSuffix:(id *)a4 withAddressCount:(unint64_t)a5 prefixForAddressAtIndex:(id)a6 stringForAddressAtIndex:(id)a7 lengthValidationBlock:(id)a8
{
  void (**v11)(id, unint64_t);
  unint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  int v20;
  char v21;
  __CFString *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t IndexInRangePassingTest;
  uint64_t v27;
  id v28;
  __CFString *v29;
  id v30;
  void *v31;
  void (**v32)(void);
  void (**v35)(id, unint64_t);
  void (**v36)(id, unint64_t);
  id v37;
  uint64_t (**v38)(id, void *, _QWORD);
  _QWORD v40[4];
  uint64_t (**v41)(id, void *, _QWORD);
  void (**v42)(void);
  uint64_t *v43;
  _QWORD v44[5];
  id v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  _QWORD v47[4];
  __CFString *v48;
  id v49;
  uint64_t *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v11 = (void (**)(id, unint64_t))a6;
  v36 = (void (**)(id, unint64_t))a7;
  v37 = 0;
  v38 = (uint64_t (**)(id, void *, _QWORD))a8;
  v12 = 0;
  v13 = &stru_1E62C0368;
  v35 = v11;
  while (v12 < a5)
  {
    if (v11)
    {
      v11[2](v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    if (v12 && !v14)
    {
      CNAUILocalizedAddressSeparator();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v14)
    {
      objc_msgSend(CFSTR("‌"), "stringByAppendingString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__1;
    v57 = __Block_byref_object_dispose__1;
    v58 = 0;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke;
    v47[3] = &unk_1E62BF648;
    v51 = v12;
    v52 = a5;
    v50 = &v53;
    v13 = v13;
    v48 = v13;
    v16 = v15;
    v49 = v16;
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E16810](v47);
    v36[2](v36, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, NSString *))v17)[2](v17, v18, self->_andNMoreFormat);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v38[2](v38, v19, v54[5]);
    v21 = v20;
    if (v20)
    {
      v22 = v19;

      v23 = (id)v54[5];
      ++v12;
      v37 = v23;
    }
    else
    {
      if (!-[__CFString length](v13, "length")
        && self->_truncatedAddressFormat
        && self->_andNMoreNoEllipsisFormat
        && (unint64_t)objc_msgSend(v18, "length") >= 2)
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_2;
        v44[3] = &unk_1E62BF670;
        v46 = v17;
        v44[4] = self;
        v24 = v18;
        v45 = v24;
        v31 = (void *)MEMORY[0x1B5E16810](v44);
        v25 = objc_msgSend(v24, "length");
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __163___CNComposeAddressConcatenator_getCommaSeparatedAddressList_andListSuffix_withAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke_3;
        v40[3] = &unk_1E62BF698;
        v41 = v38;
        v32 = v31;
        v42 = v32;
        v43 = &v53;
        if (v25 != 1)
        {
          IndexInRangePassingTest = CNComposeLastIndexInRangePassingTest(0, v25 - 2, v40);
          if (IndexInRangePassingTest)
          {
            if (IndexInRangePassingTest != 0x7FFFFFFFFFFFFFFFLL)
            {
              v32[2]();
              v27 = objc_claimAutoreleasedReturnValue();

              v28 = (id)v54[5];
              v37 = v28;
              v13 = (__CFString *)v27;
            }
          }
        }

      }
      if (-[__CFString length](v13, "length"))
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", self->_nAddressesFormat, a5);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v13 = v22;
LABEL_18:

    _Block_object_dispose(&v53, 8);
    v11 = v35;
    if ((v21 & 1) == 0)
      break;
  }
  v29 = objc_retainAutorelease(v13);
  *a3 = v29;
  v30 = objc_retainAutorelease(v37);
  *a4 = v30;

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
  _QWORD v22[4];
  id v23;

  v10 = a6;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __145___CNComposeAddressConcatenator_commaSeparatedAddressListWithAddressCount_prefixForAddressAtIndex_stringForAddressAtIndex_lengthValidationBlock___block_invoke;
  v22[3] = &unk_1E62BF6C0;
  v11 = v10;
  v23 = v11;
  v12 = a5;
  v13 = a4;
  v14 = (void *)MEMORY[0x1B5E16810](v22);
  v20 = 0;
  v21 = 0;
  -[_CNComposeAddressConcatenator getCommaSeparatedAddressList:andListSuffix:withAddressCount:prefixForAddressAtIndex:stringForAddressAtIndex:lengthValidationBlock:](self, "getCommaSeparatedAddressList:andListSuffix:withAddressCount:prefixForAddressAtIndex:stringForAddressAtIndex:lengthValidationBlock:", &v21, &v20, a3, v13, v12, v14);

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

- (NSString)andNMoreFormat
{
  return self->_andNMoreFormat;
}

- (void)setAndNMoreFormat:(id)a3
{
  objc_storeStrong((id *)&self->_andNMoreFormat, a3);
}

- (NSString)andNMoreNoEllipsisFormat
{
  return self->_andNMoreNoEllipsisFormat;
}

- (void)setAndNMoreNoEllipsisFormat:(id)a3
{
  objc_storeStrong((id *)&self->_andNMoreNoEllipsisFormat, a3);
}

- (NSString)nAddressesFormat
{
  return self->_nAddressesFormat;
}

- (void)setNAddressesFormat:(id)a3
{
  objc_storeStrong((id *)&self->_nAddressesFormat, a3);
}

- (NSString)truncatedAddressFormat
{
  return self->_truncatedAddressFormat;
}

- (void)setTruncatedAddressFormat:(id)a3
{
  objc_storeStrong((id *)&self->_truncatedAddressFormat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncatedAddressFormat, 0);
  objc_storeStrong((id *)&self->_nAddressesFormat, 0);
  objc_storeStrong((id *)&self->_andNMoreNoEllipsisFormat, 0);
  objc_storeStrong((id *)&self->_andNMoreFormat, 0);
}

@end
