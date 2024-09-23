@implementation CNMultiValueAddUpdate

- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CNMultiValueSingleUpdate value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  void *v18;
  const __CFString *v19;
  CFIndex Count;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char inserted;
  uint64_t v31;
  id *v32;
  const void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v47;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a7;
  -[CNMultiValueSingleUpdate value](self, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applyContactUpdateOfKind:value:property:", "multi value add", v13, v14);

  -[CNMultiValueSingleUpdate value](self, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (const void *)objc_msgSend(v11, "ABMultiValueValueFromCNLabeledValueValue:", v16);

  objc_msgSend(v15, "label");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (const __CFString *)objc_msgSend(v11, "ABMultiValueLabelFromCNLabeledValueLabel:", v18);

  Count = ABMultiValueGetCount(a4);
  objc_msgSend(v11, "key");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("addressingGrammars"));

  if (!v22 || v17)
  {
    if (-[CNMultiValueUpdate ignoreIdentifiers](self, "ignoreIdentifiers"))
    {
      inserted = ABMultiValueInsertValueAndLabelAtIndex(a4, v17, v19, Count, 0);
      v31 = ABMultiValueCopyUUIDAtIndex();
      v32 = a8;
      if (v31)
      {
        v33 = (const void *)v31;
        +[CN addLinkedIdentifier:toLabeledValue:](CN, "addLinkedIdentifier:toLabeledValue:", v31, v15);
        CFRelease(v33);
      }
    }
    else
    {
      objc_msgSend(v15, "identifier");
      inserted = ABMultiValueInsertValueAndLabelAndUUIDAtIndex();
      v32 = a8;
    }
    if (v32 && (inserted & 1) == 0)
    {
      v48 = CFSTR("CNKeyPaths");
      objc_msgSend(v11, "key");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v36, v37);
      *v32 = (id)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNMultiValueUpdate ignoreIdentifiers](self, "ignoreIdentifiers"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("multi value add, ignore identifiers = %@"), v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = objc_retainAutorelease(v40);
      v42 = objc_msgSend(v41, "UTF8String");
      -[CNMultiValueSingleUpdate value](self, "value");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "key");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "failedToApplyContactUpdateOfKind:value:property:error:", v42, v43, v44, *v32);

      inserted = 0;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNMultiValueUpdate ignoreIdentifiers](self, "ignoreIdentifiers"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("multi value add, ignore identifiers = %@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_retainAutorelease(v25);
    v27 = objc_msgSend(v26, "UTF8String");
    -[CNMultiValueSingleUpdate value](self, "value");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "failedToApplyContactUpdateOfKind:value:property:error:", v27, v28, v29, 0);

    inserted = 1;
  }

  return inserted;
}

@end
