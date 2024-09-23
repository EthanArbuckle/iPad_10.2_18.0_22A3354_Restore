@implementation AMSoundReductionIndex

- (AMSoundReductionIndex)initWithValues:(id)a3 error:(id *)a4
{
  id v6;
  AMSoundReductionIndex *v7;
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
  uint64_t v19;
  NSNumber *materialDepth;
  uint64_t v21;
  NSNumber *uncertaintyMaterialDepth;
  void *v23;
  uint64_t v24;
  NSArray *frequencyBands;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *soundReductionIndexUserData;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *soundReductionIndexReferenceData;
  void *v34;
  void *v35;
  uint64_t v36;
  NSArray *uncertaintyReferenceData;
  uint64_t v38;
  NSNumber *averageSoundReductionIndex;
  void *v40;
  uint64_t v41;
  NSArray *numDataPointsReferenceData;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)AMSoundReductionIndex;
  v7 = -[AMSoundReductionIndex init](&v47, sel_init);
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v6, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("materialName"), CFSTR("materialDescription"), CFSTR("materialDepth"), CFSTR("uncertaintyMaterialDepth"), CFSTR("frequencyBands"), CFSTR("soundReductionIndexUserData"), CFSTR("soundReductionIndexReferenceData"), CFSTR("uncertaintyReferenceData"), CFSTR("averageSoundReductionIndex"), CFSTR("numDataPointsReferenceData"), CFSTR("totalNumDataSetsReferenceData"), 0);
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isSubsetOfSet:", v13);

  if ((v14 & 1) == 0)
  {
    if (!a4)
      goto LABEL_7;
    v44 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0FC8];
    v49[0] = CFSTR("At least one mandatory key was not found in input dictionary.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), 7, v45);
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

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("materialDepth"));
  v19 = objc_claimAutoreleasedReturnValue();
  materialDepth = v7->_materialDepth;
  v7->_materialDepth = (NSNumber *)v19;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uncertaintyMaterialDepth"));
  v21 = objc_claimAutoreleasedReturnValue();
  uncertaintyMaterialDepth = v7->_uncertaintyMaterialDepth;
  v7->_uncertaintyMaterialDepth = (NSNumber *)v21;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("frequencyBands"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  decimalValuesFromCSV(v23);
  v24 = objc_claimAutoreleasedReturnValue();
  frequencyBands = v7->_frequencyBands;
  v7->_frequencyBands = (NSArray *)v24;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("soundReductionIndexUserData"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  decimalValuesFromCSV(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  clampArrayValues(v27, &unk_24DE126A0, &unk_24DE126B8);
  v28 = objc_claimAutoreleasedReturnValue();
  soundReductionIndexUserData = v7->_soundReductionIndexUserData;
  v7->_soundReductionIndexUserData = (NSArray *)v28;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("soundReductionIndexReferenceData"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  decimalValuesFromCSV(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  clampArrayValues(v31, &unk_24DE126A0, &unk_24DE126B8);
  v32 = objc_claimAutoreleasedReturnValue();
  soundReductionIndexReferenceData = v7->_soundReductionIndexReferenceData;
  v7->_soundReductionIndexReferenceData = (NSArray *)v32;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uncertaintyReferenceData"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  decimalValuesFromCSV(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  clampArrayValues(v35, &unk_24DE126A0, &unk_24DE126B8);
  v36 = objc_claimAutoreleasedReturnValue();
  uncertaintyReferenceData = v7->_uncertaintyReferenceData;
  v7->_uncertaintyReferenceData = (NSArray *)v36;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("averageSoundReductionIndex"));
  v38 = objc_claimAutoreleasedReturnValue();
  averageSoundReductionIndex = v7->_averageSoundReductionIndex;
  v7->_averageSoundReductionIndex = (NSNumber *)v38;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numDataPointsReferenceData"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  integerValuesFromCSV(v40);
  v41 = objc_claimAutoreleasedReturnValue();
  numDataPointsReferenceData = v7->_numDataPointsReferenceData;
  v7->_numDataPointsReferenceData = (NSArray *)v41;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumDataSetsReferenceData"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_totalNumDataSetsReferenceData = objc_msgSend(v43, "intValue");

  if (!-[AMSoundReductionIndex validatedWithoutError:](v7, "validatedWithoutError:", a4))
    goto LABEL_6;
  a4 = v7;
LABEL_7:

  return (AMSoundReductionIndex *)a4;
}

- (AMSoundReductionIndex)initWithMaterialName:(id)a3
{
  NSString *v4;
  AMSoundReductionIndex *v5;
  NSString *materialName;
  NSString *v7;
  NSString *materialDescription;
  NSArray *frequencyBands;
  NSNumber *materialDepth;
  NSNumber *uncertaintyMaterialDepth;
  NSArray *soundReductionIndexUserData;
  NSArray *soundReductionIndexReferenceData;
  NSArray *uncertaintyReferenceData;
  NSNumber *averageSoundReductionIndex;
  NSArray *numDataPointsReferenceData;
  objc_super v18;

  v4 = (NSString *)a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSoundReductionIndex;
  v5 = -[AMSoundReductionIndex init](&v18, sel_init);
  materialName = v5->_materialName;
  v5->_materialName = v4;
  v7 = v4;

  materialDescription = v5->_materialDescription;
  v5->_materialDescription = 0;

  frequencyBands = v5->_frequencyBands;
  v5->_frequencyBands = 0;

  materialDepth = v5->_materialDepth;
  v5->_materialDepth = 0;

  uncertaintyMaterialDepth = v5->_uncertaintyMaterialDepth;
  v5->_uncertaintyMaterialDepth = 0;

  soundReductionIndexUserData = v5->_soundReductionIndexUserData;
  v5->_soundReductionIndexUserData = 0;

  soundReductionIndexReferenceData = v5->_soundReductionIndexReferenceData;
  v5->_soundReductionIndexReferenceData = 0;

  uncertaintyReferenceData = v5->_uncertaintyReferenceData;
  v5->_uncertaintyReferenceData = 0;

  averageSoundReductionIndex = v5->_averageSoundReductionIndex;
  v5->_averageSoundReductionIndex = 0;

  numDataPointsReferenceData = v5->_numDataPointsReferenceData;
  v5->_numDataPointsReferenceData = 0;

  v5->_totalNumDataSetsReferenceData = 0;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AMSoundReductionIndex *v4;
  AMSoundReductionIndex *v5;
  AMSoundReductionIndex *v6;
  NSString *materialName;
  void *v8;
  NSString *materialDescription;
  void *v10;
  NSNumber *materialDepth;
  void *v12;
  NSNumber *uncertaintyMaterialDepth;
  void *v14;
  NSArray *frequencyBands;
  void *v16;
  NSArray *soundReductionIndexUserData;
  void *v18;
  NSArray *soundReductionIndexReferenceData;
  void *v20;
  NSArray *uncertaintyReferenceData;
  void *v22;
  NSNumber *averageSoundReductionIndex;
  void *v24;
  NSArray *numDataPointsReferenceData;
  void *v26;
  int totalNumDataSetsReferenceData;
  BOOL v28;

  v4 = (AMSoundReductionIndex *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v28 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    materialName = self->_materialName;
    -[AMSoundReductionIndex materialName](v6, "materialName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(materialName) = -[NSString isEqualToString:](materialName, "isEqualToString:", v8);

    if (!(_DWORD)materialName)
      goto LABEL_17;
    materialDescription = self->_materialDescription;
    -[AMSoundReductionIndex materialDescription](v6, "materialDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(materialDescription) = -[NSString isEqualToString:](materialDescription, "isEqualToString:", v10);

    if (!(_DWORD)materialDescription)
      goto LABEL_17;
    materialDepth = self->_materialDepth;
    -[AMSoundReductionIndex materialDepth](v6, "materialDepth");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(materialDepth) = -[NSNumber isEqualToNumber:](materialDepth, "isEqualToNumber:", v12);

    if (!(_DWORD)materialDepth)
      goto LABEL_17;
    uncertaintyMaterialDepth = self->_uncertaintyMaterialDepth;
    -[AMSoundReductionIndex uncertaintyMaterialDepth](v6, "uncertaintyMaterialDepth");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(uncertaintyMaterialDepth) = -[NSNumber isEqualToNumber:](uncertaintyMaterialDepth, "isEqualToNumber:", v14);

    if (!(_DWORD)uncertaintyMaterialDepth)
      goto LABEL_17;
    frequencyBands = self->_frequencyBands;
    -[AMSoundReductionIndex frequencyBands](v6, "frequencyBands");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(frequencyBands) = -[NSArray isEqualToArray:](frequencyBands, "isEqualToArray:", v16);

    if (!(_DWORD)frequencyBands)
      goto LABEL_17;
    soundReductionIndexUserData = self->_soundReductionIndexUserData;
    -[AMSoundReductionIndex soundReductionIndexUserData](v6, "soundReductionIndexUserData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(soundReductionIndexUserData) = -[NSArray isEqualToArray:](soundReductionIndexUserData, "isEqualToArray:", v18);

    if (!(_DWORD)soundReductionIndexUserData)
      goto LABEL_17;
    soundReductionIndexReferenceData = self->_soundReductionIndexReferenceData;
    -[AMSoundReductionIndex soundReductionIndexReferenceData](v6, "soundReductionIndexReferenceData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(soundReductionIndexReferenceData) = -[NSArray isEqualToArray:](soundReductionIndexReferenceData, "isEqualToArray:", v20);

    if (!(_DWORD)soundReductionIndexReferenceData)
      goto LABEL_17;
    uncertaintyReferenceData = self->_uncertaintyReferenceData;
    -[AMSoundReductionIndex uncertaintyReferenceData](v6, "uncertaintyReferenceData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(uncertaintyReferenceData) = -[NSArray isEqualToArray:](uncertaintyReferenceData, "isEqualToArray:", v22);

    if (!(_DWORD)uncertaintyReferenceData)
      goto LABEL_17;
    averageSoundReductionIndex = self->_averageSoundReductionIndex;
    -[AMSoundReductionIndex averageSoundReductionIndex](v6, "averageSoundReductionIndex");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(averageSoundReductionIndex) = -[NSNumber isEqualToNumber:](averageSoundReductionIndex, "isEqualToNumber:", v24);

    if (!(_DWORD)averageSoundReductionIndex)
      goto LABEL_17;
    numDataPointsReferenceData = self->_numDataPointsReferenceData;
    -[AMSoundReductionIndex numDataPointsReferenceData](v6, "numDataPointsReferenceData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(numDataPointsReferenceData) = -[NSArray isEqualToArray:](numDataPointsReferenceData, "isEqualToArray:", v26);

    if ((_DWORD)numDataPointsReferenceData)
    {
      totalNumDataSetsReferenceData = self->_totalNumDataSetsReferenceData;
      v28 = totalNumDataSetsReferenceData == -[AMSoundReductionIndex totalNumDataSetsReferenceData](v6, "totalNumDataSetsReferenceData");
    }
    else
    {
LABEL_17:
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
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
  float v12;
  float v13;
  float v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL IsBetween;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[NSArray count](self->_frequencyBands, "count");
  if (-[NSArray count](self->_soundReductionIndexUserData, "count") == v5
    && -[NSArray count](self->_soundReductionIndexReferenceData, "count") == v5
    && -[NSArray count](self->_uncertaintyReferenceData, "count") == v5
    && -[NSArray count](self->_numDataPointsReferenceData, "count") == v5)
  {
    if ((-[NSString isEqual:](self->_materialName, "isEqual:", &stru_24DE11450) & 1) != 0
      || -[NSString isEqual:](self->_materialDescription, "isEqual:", &stru_24DE11450))
    {
      if (a3)
      {
        v6 = (void *)MEMORY[0x24BDD1540];
        v36 = *MEMORY[0x24BDD0FC8];
        v37 = CFSTR("Name and or description is empty or corrupted.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        v9 = 4;
LABEL_11:
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.acousticmaterials.ErrorDomain"), v9, v7, v29);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      -[NSNumber floatValue](self->_materialDepth, "floatValue");
      if (v12 < 0.0
        || (-[NSNumber floatValue](self->_uncertaintyMaterialDepth, "floatValue"), v13 < 0.0)
        || (-[NSNumber floatValue](self->_averageSoundReductionIndex, "floatValue"), v14 < 0.0))
      {
        if (!a3)
          return 0;
        v15 = (void *)MEMORY[0x24BDD1540];
        v34 = *MEMORY[0x24BDD0FC8];
        v35 = CFSTR("The value of materialDepth, uncertainityMaterialDepth or averageSoundReductionIndex is negative.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v15;
        v9 = 5;
        goto LABEL_11;
      }
      if (self->_totalNumDataSetsReferenceData < 0)
      {
        if (!a3)
          return 0;
        v27 = (void *)MEMORY[0x24BDD1540];
        v32 = *MEMORY[0x24BDD0FC8];
        v33 = CFSTR("The value of totalNumDataSetsReferenceData is negative.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v27;
        v9 = 6;
        goto LABEL_11;
      }
      if (!v5)
        return 1;
      v16 = 0;
      v17 = 1;
      v18 = &unk_24DE126A0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_soundReductionIndexUserData, "objectAtIndexedSubscript:", v16, v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!valueIsBetween(v19, v18, &unk_24DE126B8))
          break;
        -[NSArray objectAtIndexedSubscript:](self->_soundReductionIndexReferenceData, "objectAtIndexedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!valueIsBetween(v20, v18, &unk_24DE126B8))
          goto LABEL_33;
        -[NSArray objectAtIndexedSubscript:](self->_uncertaintyReferenceData, "objectAtIndexedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!valueIsBetween(v21, v18, &unk_24DE126B8)
          || !valueIsBetween(self->_averageSoundReductionIndex, v18, &unk_24DE126B8))
        {

LABEL_33:
          break;
        }
        v22 = v17;
        -[NSArray objectAtIndexedSubscript:](self->_numDataPointsReferenceData, "objectAtIndexedSubscript:", v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalNumDataSetsReferenceData);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v19;
        v25 = v18;
        IsBetween = valueIsBetween(v23, v18, v24);

        if (!IsBetween)
          goto LABEL_35;
        v16 = v22;
        v17 = v22 + 1;
        result = 1;
        v18 = v25;
        if (v5 <= v22)
          return result;
      }

LABEL_35:
      if (a3)
      {
        v28 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD0FC8];
        v31 = CFSTR("At least one value in one of the data sets lies outside the permitted value ranges.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v28;
        v9 = 7;
        goto LABEL_11;
      }
    }
  }
  else if (a3)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    v39[0] = CFSTR("Data arrays have different lengths.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
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

- (NSNumber)materialDepth
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)uncertaintyMaterialDepth
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)frequencyBands
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)soundReductionIndexUserData
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSoundReductionIndexUserData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSArray)soundReductionIndexReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)uncertaintyReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)averageSoundReductionIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)numDataPointsReferenceData
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (int)totalNumDataSetsReferenceData
{
  return self->_totalNumDataSetsReferenceData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDataPointsReferenceData, 0);
  objc_storeStrong((id *)&self->_averageSoundReductionIndex, 0);
  objc_storeStrong((id *)&self->_uncertaintyReferenceData, 0);
  objc_storeStrong((id *)&self->_soundReductionIndexReferenceData, 0);
  objc_storeStrong((id *)&self->_soundReductionIndexUserData, 0);
  objc_storeStrong((id *)&self->_frequencyBands, 0);
  objc_storeStrong((id *)&self->_uncertaintyMaterialDepth, 0);
  objc_storeStrong((id *)&self->_materialDepth, 0);
  objc_storeStrong((id *)&self->_materialDescription, 0);
  objc_storeStrong((id *)&self->_materialName, 0);
}

@end
