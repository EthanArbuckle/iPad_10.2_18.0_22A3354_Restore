@implementation CNMultiValueReplaceUpdate

- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CNMultiValueSingleUpdate value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[CN indexOfUnifiedIdentifier:onNonUnifiedMultiValue:withIdentifierMap:](CN, "indexOfUnifiedIdentifier:onNonUnifiedMultiValue:withIdentifierMap:", v8, v11, v6);

  if (v9 < objc_msgSend(v11, "count"))
  {
    -[CNMultiValueSingleUpdate value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v9, v10);

  }
}

- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CFIndex v18;
  BOOL v19;
  void *v20;
  const void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a7;
  -[CNMultiValueSingleUpdate value](self, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "key");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applyContactUpdateOfKind:value:property:", "multi value replace", v15, v16);

  -[CNMultiValueSingleUpdate value](self, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CNMultiValueUpdate multiValueIndexForValue:inMultiValue:identifier:](self, "multiValueIndexForValue:inMultiValue:identifier:", v17, a4, 0);
  if (v18 == -1 && a6)
  {
    v19 = 1;
  }
  else
  {
    objc_msgSend(v17, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (const void *)objc_msgSend(v13, "ABMultiValueValueFromCNLabeledValueValue:", v20);

    objc_msgSend(v17, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (const __CFString *)objc_msgSend(v13, "ABMultiValueLabelFromCNLabeledValueLabel:", v22);

    if (v18 == -1 || !ABMultiValueReplaceLabelAtIndex(a4, v23, v18))
    {
      v19 = 0;
      if (!a8)
        goto LABEL_11;
    }
    else
    {
      v19 = ABMultiValueReplaceValueAtIndex(a4, v21, v18);
      if (!a8)
        goto LABEL_11;
    }
    if (!v19)
    {
      v30 = CFSTR("CNKeyPaths");
      objc_msgSend(v13, "key");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v26, v27);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      v19 = 0;
    }
  }
LABEL_11:

  return v19;
}

@end
