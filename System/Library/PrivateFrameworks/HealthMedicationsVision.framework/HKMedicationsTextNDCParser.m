@implementation HKMedicationsTextNDCParser

- (HKMedicationsTextNDCParser)init
{
  HKMedicationsTextNDCParser *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSArray *NDC10RegularExpressions;
  uint64_t v11;
  id v12;
  NSRegularExpression *NDC11RegularExpression;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationsTextNDCParser;
  v2 = -[HKMedicationsTextNDCParser init](&v19, sel_init);
  if (v2)
  {
    v18 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("\\b([0-9]{4})[\\ -]([0-9]{4})[\\ -]([0-9]{2})\\b"), 1, &v18);
    v4 = v18;
    v20[0] = v3;
    v17 = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("\\b([0-9]{5})[\\ -]([0-9]{3})[\\ -]([0-9]{2})\\b"), 1, &v17);
    v6 = v17;

    v20[1] = v5;
    v16 = v6;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("\\b([0-9]{5})[\\ -]([0-9]{4})[\\ -]([0-9]{1})\\b"), 1, &v16);
    v8 = v16;

    v20[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
    v9 = objc_claimAutoreleasedReturnValue();
    NDC10RegularExpressions = v2->_NDC10RegularExpressions;
    v2->_NDC10RegularExpressions = (NSArray *)v9;

    v15 = v8;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("\\b([0-9]{5})[\\ -]([0-9]{4})[\\ -]([0-9]{2})\\b"), 1, &v15);
    v12 = v15;

    NDC11RegularExpression = v2->_NDC11RegularExpression;
    v2->_NDC11RegularExpression = (NSRegularExpression *)v11;

  }
  return v2;
}

- (id)parsedNDCCodeFromString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  unint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v4 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  -[HKMedicationsTextNDCParser NDC11RegularExpression](self, "NDC11RegularExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  v7 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __54__HKMedicationsTextNDCParser_parsedNDCCodeFromString___block_invoke;
  v33[3] = &unk_24EC1A0C0;
  v35 = &v36;
  v8 = v4;
  v34 = v8;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v6, v33);

  v9 = (void *)v37[5];
  if (v9)
  {
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24EC1A5E0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v37[5];
    v37[5] = v10;

    objc_msgSend((id)v37[5], "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24EC1A5E0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v37[5];
    v37[5] = v12;

    v14 = (id)v37[5];
  }
  else
  {
    for (i = 0; ; ++i)
    {
      -[HKMedicationsTextNDCParser NDC10RegularExpressions](self, "NDC10RegularExpressions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (i >= v17)
      {
        v14 = 0;
        goto LABEL_11;
      }
      -[HKMedicationsTextNDCParser NDC10RegularExpressions](self, "NDC10RegularExpressions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v8, "length");
      v30[0] = v7;
      v30[1] = 3221225472;
      v30[2] = __54__HKMedicationsTextNDCParser_parsedNDCCodeFromString___block_invoke_2;
      v30[3] = &unk_24EC1A0C0;
      v32 = &v36;
      v31 = v8;
      objc_msgSend(v19, "enumerateMatchesInString:options:range:usingBlock:", v31, 0, 0, v20, v30);
      v21 = (void *)v37[5];
      if (v21)
        break;

    }
    if (i < 3)
    {
      v22 = qword_2231451E8[i];
      v23 = (void *)objc_msgSend(v21, "mutableCopy");
      objc_msgSend(v23, "insertString:atIndex:", CFSTR("0"), v22);
      v24 = (void *)v37[5];
      v37[5] = (uint64_t)v23;

      v21 = (void *)v37[5];
    }
    objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24EC1A5E0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v37[5];
    v37[5] = v25;

    objc_msgSend((id)v37[5], "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24EC1A5E0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v37[5];
    v37[5] = v27;

    v14 = (id)v37[5];
  }
LABEL_11:

  _Block_object_dispose(&v36, 8);
  return v14;
}

void __54__HKMedicationsTextNDCParser_parsedNDCCodeFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(a2, "range");
  objc_msgSend(v6, "substringWithRange:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  *a4 = 1;
}

void __54__HKMedicationsTextNDCParser_parsedNDCCodeFromString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(a2, "range");
  objc_msgSend(v6, "substringWithRange:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  *a4 = 1;
}

- (NSArray)NDC10RegularExpressions
{
  return self->_NDC10RegularExpressions;
}

- (void)setNDC10RegularExpressions:(id)a3
{
  objc_storeStrong((id *)&self->_NDC10RegularExpressions, a3);
}

- (NSRegularExpression)NDC11RegularExpression
{
  return self->_NDC11RegularExpression;
}

- (void)setNDC11RegularExpression:(id)a3
{
  objc_storeStrong((id *)&self->_NDC11RegularExpression, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_NDC11RegularExpression, 0);
  objc_storeStrong((id *)&self->_NDC10RegularExpressions, 0);
}

@end
