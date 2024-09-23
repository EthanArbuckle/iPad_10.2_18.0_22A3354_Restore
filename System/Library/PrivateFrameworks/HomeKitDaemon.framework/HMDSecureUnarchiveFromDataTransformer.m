@implementation HMDSecureUnarchiveFromDataTransformer

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (+[HMDSecureUnarchiveFromDataTransformer isEncodedNilValue:](HMDSecureUnarchiveFromDataTransformer, "isEncodedNilValue:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDSecureUnarchiveFromDataTransformer;
    -[NSSecureUnarchiveFromDataTransformer transformedValue:](&v7, sel_transformedValue_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)allowedTopLevelClasses
{
  id v3;
  objc_super v5;

  if ((id)objc_opt_class() == a1)
  {
    if (allowedTopLevelClasses__hmf_once_t0 != -1)
      dispatch_once(&allowedTopLevelClasses__hmf_once_t0, &__block_literal_global_197340);
    v3 = (id)allowedTopLevelClasses__hmf_once_v1;
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___HMDSecureUnarchiveFromDataTransformer;
    objc_msgSendSuper2(&v5, sel_allowedTopLevelClasses);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)isEncodedNilValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  if (isEncodedNilValue__once != -1)
    dispatch_once(&isEncodedNilValue__once, &__block_literal_global_28_197329);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v4 = objc_msgSend(v3, "length"), v4 == isEncodedNilValue__encodedNilSize))
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v6 = objc_msgSend(v5, "count"), v6 == objc_msgSend((id)isEncodedNilValue__encodedNilPList, "count")))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 1;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __59__HMDSecureUnarchiveFromDataTransformer_isEncodedNilValue___block_invoke_2;
      v9[3] = &unk_24E790640;
      v9[4] = &v10;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
      v7 = *((_BYTE *)v11 + 24) != 0;
      _Block_object_dispose(&v10, 8);
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

void __59__HMDSecureUnarchiveFromDataTransformer_isEncodedNilValue___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if (objc_msgSend(v11, "isEqual:", CFSTR("$top")))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend((id)isEncodedNilValue__encodedNilPList, "objectForKeyedSubscript:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_6:

}

void __59__HMDSecureUnarchiveFromDataTransformer_isEncodedNilValue___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v4 = v0;
    isEncodedNilValue__encodedNilSize = objc_msgSend(v0, "length");
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)isEncodedNilValue__encodedNilPList;
    isEncodedNilValue__encodedNilPList = v1;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v3 = _HMFPreconditionFailure();
  __63__HMDSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke(v3);
}

void __63__HMDSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[27];

  v2[26] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  v2[15] = objc_opt_class();
  v2[16] = objc_opt_class();
  v2[17] = objc_opt_class();
  v2[18] = objc_opt_class();
  v2[19] = objc_opt_class();
  v2[20] = objc_opt_class();
  v2[21] = objc_opt_class();
  v2[22] = objc_opt_class();
  v2[23] = objc_opt_class();
  v2[24] = objc_opt_class();
  v2[25] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 26);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowedTopLevelClasses__hmf_once_v1;
  allowedTopLevelClasses__hmf_once_v1 = v0;

}

@end
