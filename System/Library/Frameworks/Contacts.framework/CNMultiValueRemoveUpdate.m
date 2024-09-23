@implementation CNMultiValueRemoveUpdate

- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CNMultiValueSingleUpdate value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[CN indexOfUnifiedIdentifier:onNonUnifiedMultiValue:withIdentifierMap:](CN, "indexOfUnifiedIdentifier:onNonUnifiedMultiValue:withIdentifierMap:", v8, v10, v6);

  if (v9 < objc_msgSend(v10, "count"))
    objc_msgSend(v10, "removeObjectAtIndex:", v9);

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
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a7;
  -[CNMultiValueSingleUpdate value](self, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "key");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applyContactUpdateOfKind:value:property:", "multi value remove", v15, v16);

  -[CNMultiValueSingleUpdate value](self, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CNMultiValueUpdate multiValueIndexForValue:inMultiValue:identifier:](self, "multiValueIndexForValue:inMultiValue:identifier:", v17, a4, 0);

  if (v18 == -1 && a6)
  {
    v19 = 1;
  }
  else
  {
    if (v18 == -1)
    {
      v19 = 0;
      if (!a8)
        goto LABEL_10;
    }
    else
    {
      v19 = ABMultiValueRemoveValueAndLabelAtIndex(a4, v18);
      if (!a8)
        goto LABEL_10;
    }
    if (!v19)
    {
      v26 = CFSTR("CNKeyPaths");
      objc_msgSend(v13, "key");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v22, v23);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      v19 = 0;
    }
  }
LABEL_10:

  return v19;
}

@end
