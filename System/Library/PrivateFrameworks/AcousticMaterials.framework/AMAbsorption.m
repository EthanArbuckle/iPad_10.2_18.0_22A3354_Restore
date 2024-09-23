@implementation AMAbsorption

- (AMAbsorption)initWithValues:(id)a3 error:(id *)a4
{
  id v6;
  AMAbsorption *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSString *materialName;
  uint64_t v17;
  NSString *materialDescription;
  void *v19;
  uint64_t v20;
  NSArray *frequencyBands;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *absorptionUserData;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *absorptionReferenceData;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *uncertaintyReferenceData;
  void *v34;
  uint64_t v35;
  NSArray *numDataPointsReferenceData;
  void *v37;
  void *v38;
  void *v39;
  objc_super v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AMAbsorption;
  v7 = -[AMAbsorption init](&v41, sel_init);
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v6, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("materialName"), CFSTR("materialDescription"), CFSTR("frequencyBands"), CFSTR("absorptionUserData"), CFSTR("absorptionReferenceData"), CFSTR("uncertaintyReferenceData"), CFSTR("numDataPointsReferenceData"), CFSTR("totalNumDataSetsReferenceData"), 0);
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isSubsetOfSet:", v13);

  if ((v14 & 1) == 0)
  {
    if (!a4)
      goto LABEL_7;
    v38 = (void *)MEMORY[0x24BDD1540];
    v42 = *MEMORY[0x24BDD0FC8];
    v43[0] = CFSTR("At least one mandatory key was not found in input dictionary.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 7, v39);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("materialName"));
  v15 = objc_claimAutoreleasedReturnValue();
  materialName = v7->_materialName;
  v7->_materialName = (NSString *)v15;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("materialDescription"));
  v17 = objc_claimAutoreleasedReturnValue();
  materialDescription = v7->_materialDescription;
  v7->_materialDescription = (NSString *)v17;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("frequencyBands"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  decimalValuesFromCSV(v19);
  v20 = objc_claimAutoreleasedReturnValue();
  frequencyBands = v7->_frequencyBands;
  v7->_frequencyBands = (NSArray *)v20;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absorptionUserData"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  decimalValuesFromCSV(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  clampArrayValues(v23, &unk_24DE12670, &unk_24DE12688);
  v24 = objc_claimAutoreleasedReturnValue();
  absorptionUserData = v7->_absorptionUserData;
  v7->_absorptionUserData = (NSArray *)v24;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absorptionReferenceData"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  decimalValuesFromCSV(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  clampArrayValues(v27, &unk_24DE12670, &unk_24DE12688);
  v28 = objc_claimAutoreleasedReturnValue();
  absorptionReferenceData = v7->_absorptionReferenceData;
  v7->_absorptionReferenceData = (NSArray *)v28;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uncertaintyReferenceData"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  decimalValuesFromCSV(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  clampArrayValues(v31, &unk_24DE12670, &unk_24DE12688);
  v32 = objc_claimAutoreleasedReturnValue();
  uncertaintyReferenceData = v7->_uncertaintyReferenceData;
  v7->_uncertaintyReferenceData = (NSArray *)v32;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numDataPointsReferenceData"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  integerValuesFromCSV(v34);
  v35 = objc_claimAutoreleasedReturnValue();
  numDataPointsReferenceData = v7->_numDataPointsReferenceData;
  v7->_numDataPointsReferenceData = (NSArray *)v35;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumDataSetsReferenceData"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_totalNumDataSetsReferenceData = objc_msgSend(v37, "intValue");

  if (!-[AMAbsorption validatedWithoutError:](v7, "validatedWithoutError:", a4))
    goto LABEL_6;
  a4 = v7;
LABEL_7:

  return (AMAbsorption *)a4;
}

- (AMAbsorption)initWithMaterialName:(id)a3
{
  NSString *v4;
  AMAbsorption *v5;
  NSString *materialName;
  NSString *v7;
  NSString *materialDescription;
  NSArray *frequencyBands;
  NSArray *absorptionUserData;
  NSArray *absorptionReferenceData;
  NSArray *uncertaintyReferenceData;
  NSArray *numDataPointsReferenceData;
  objc_super v15;

  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)AMAbsorption;
  v5 = -[AMAbsorption init](&v15, sel_init);
  materialName = v5->_materialName;
  v5->_materialName = v4;
  v7 = v4;

  materialDescription = v5->_materialDescription;
  v5->_materialDescription = 0;

  frequencyBands = v5->_frequencyBands;
  v5->_frequencyBands = 0;

  absorptionUserData = v5->_absorptionUserData;
  v5->_absorptionUserData = 0;

  absorptionReferenceData = v5->_absorptionReferenceData;
  v5->_absorptionReferenceData = 0;

  uncertaintyReferenceData = v5->_uncertaintyReferenceData;
  v5->_uncertaintyReferenceData = 0;

  numDataPointsReferenceData = v5->_numDataPointsReferenceData;
  v5->_numDataPointsReferenceData = 0;

  v5->_totalNumDataSetsReferenceData = 0;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AMAbsorption *v4;
  AMAbsorption *v5;
  AMAbsorption *v6;
  NSString *materialName;
  void *v8;
  NSString *materialDescription;
  void *v10;
  NSArray *frequencyBands;
  void *v12;
  NSArray *absorptionUserData;
  void *v14;
  NSArray *absorptionReferenceData;
  void *v16;
  NSArray *uncertaintyReferenceData;
  void *v18;
  NSArray *numDataPointsReferenceData;
  void *v20;
  int totalNumDataSetsReferenceData;
  BOOL v22;

  v4 = (AMAbsorption *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v22 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    materialName = self->_materialName;
    -[AMAbsorption materialName](v6, "materialName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(materialName) = -[NSString isEqualToString:](materialName, "isEqualToString:", v8);

    if (!(_DWORD)materialName)
      goto LABEL_14;
    materialDescription = self->_materialDescription;
    -[AMAbsorption materialDescription](v6, "materialDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(materialDescription) = -[NSString isEqualToString:](materialDescription, "isEqualToString:", v10);

    if (!(_DWORD)materialDescription)
      goto LABEL_14;
    frequencyBands = self->_frequencyBands;
    -[AMAbsorption frequencyBands](v6, "frequencyBands");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(frequencyBands) = -[NSArray isEqualToArray:](frequencyBands, "isEqualToArray:", v12);

    if (!(_DWORD)frequencyBands)
      goto LABEL_14;
    absorptionUserData = self->_absorptionUserData;
    -[AMAbsorption absorptionUserData](v6, "absorptionUserData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(absorptionUserData) = -[NSArray isEqualToArray:](absorptionUserData, "isEqualToArray:", v14);

    if (!(_DWORD)absorptionUserData)
      goto LABEL_14;
    absorptionReferenceData = self->_absorptionReferenceData;
    -[AMAbsorption absorptionReferenceData](v6, "absorptionReferenceData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(absorptionReferenceData) = -[NSArray isEqualToArray:](absorptionReferenceData, "isEqualToArray:", v16);

    if (!(_DWORD)absorptionReferenceData)
      goto LABEL_14;
    uncertaintyReferenceData = self->_uncertaintyReferenceData;
    -[AMAbsorption uncertaintyReferenceData](v6, "uncertaintyReferenceData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(uncertaintyReferenceData) = -[NSArray isEqualToArray:](uncertaintyReferenceData, "isEqualToArray:", v18);

    if (!(_DWORD)uncertaintyReferenceData)
      goto LABEL_14;
    numDataPointsReferenceData = self->_numDataPointsReferenceData;
    -[AMAbsorption numDataPointsReferenceData](v6, "numDataPointsReferenceData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(numDataPointsReferenceData) = -[NSArray isEqualToArray:](numDataPointsReferenceData, "isEqualToArray:", v20);

    if ((_DWORD)numDataPointsReferenceData)
    {
      totalNumDataSetsReferenceData = self->_totalNumDataSetsReferenceData;
      v22 = totalNumDataSetsReferenceData == -[AMAbsorption totalNumDataSetsReferenceData](v6, "totalNumDataSetsReferenceData");
    }
    else
    {
LABEL_14:
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)validatedWithoutError:(id *)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL result;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL IsBetween;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[NSArray count](self->_frequencyBands, "count");
  if (-[NSArray count](self->_absorptionUserData, "count") == v5
    && -[NSArray count](self->_absorptionReferenceData, "count") == v5
    && -[NSArray count](self->_uncertaintyReferenceData, "count") == v5
    && -[NSArray count](self->_numDataPointsReferenceData, "count") == v5)
  {
    if ((-[NSString isEqual:](self->_materialName, "isEqual:", &stru_24DE11450) & 1) != 0
      || -[NSString isEqual:](self->_materialDescription, "isEqual:", &stru_24DE11450))
    {
      if (a3)
      {
        v6 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD0FC8];
        v31 = CFSTR("Name and/or description is empty.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        v9 = 4;
LABEL_11:
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), v9, v7, v25);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (self->_totalNumDataSetsReferenceData < 0)
      {
        if (!a3)
          return 0;
        v23 = (void *)MEMORY[0x24BDD1540];
        v28 = *MEMORY[0x24BDD0FC8];
        v29 = CFSTR("The value of totalNumDataSetsReferenceData is negative.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v23;
        v9 = 6;
        goto LABEL_11;
      }
      if (!v5)
        return 1;
      v12 = 0;
      v13 = 1;
      v14 = &unk_24DE12670;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_absorptionUserData, "objectAtIndexedSubscript:", v12, v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!valueIsBetween(v15, v14, &unk_24DE12688))
          break;
        -[NSArray objectAtIndexedSubscript:](self->_absorptionReferenceData, "objectAtIndexedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!valueIsBetween(v16, v14, &unk_24DE12688))
          goto LABEL_27;
        -[NSArray objectAtIndexedSubscript:](self->_uncertaintyReferenceData, "objectAtIndexedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!valueIsBetween(v17, v14, &unk_24DE12688))
        {

LABEL_27:
          break;
        }
        v18 = v13;
        -[NSArray objectAtIndexedSubscript:](self->_numDataPointsReferenceData, "objectAtIndexedSubscript:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalNumDataSetsReferenceData);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v15;
        v21 = v14;
        IsBetween = valueIsBetween(v19, v14, v20);

        if (!IsBetween)
          goto LABEL_29;
        v12 = v18;
        v13 = v18 + 1;
        result = 1;
        v14 = v21;
        if (v5 <= v18)
          return result;
      }

LABEL_29:
      if (a3)
      {
        v24 = (void *)MEMORY[0x24BDD1540];
        v26 = *MEMORY[0x24BDD0FC8];
        v27 = CFSTR("At least one value in one of the data sets lies outside the permitted value ranges.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v24;
        v9 = 7;
        goto LABEL_11;
      }
    }
  }
  else if (a3)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    v33[0] = CFSTR("Data arrays have different lengths.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    v9 = 3;
    goto LABEL_11;
  }
  return 0;
}

- (NSString)materialName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)materialDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)frequencyBands
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)absorptionUserData
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAbsorptionUserData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSArray)absorptionReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)uncertaintyReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)numDataPointsReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (int)totalNumDataSetsReferenceData
{
  return self->_totalNumDataSetsReferenceData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDataPointsReferenceData, 0);
  objc_storeStrong((id *)&self->_uncertaintyReferenceData, 0);
  objc_storeStrong((id *)&self->_absorptionReferenceData, 0);
  objc_storeStrong((id *)&self->_absorptionUserData, 0);
  objc_storeStrong((id *)&self->_frequencyBands, 0);
  objc_storeStrong((id *)&self->_materialDescription, 0);
  objc_storeStrong((id *)&self->_materialName, 0);
}

@end
