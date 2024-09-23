@implementation HMIFFArchive

- (HMIFFArchive)initWithJSONPath:(id)a3 error:(id *)a4
{
  id v6;
  HMIFFArchive *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSArray *homePersonsAndFaceCrops;
  void *v19;
  uint64_t v20;
  NSArray *photosPersonsAndFaceCrops;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *allPersonsAndFaceCrops;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *v30;
  HMIFFArchive *v31;
  id v33;
  objc_super v34;
  _QWORD v35[9];

  v35[8] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HMIFFArchive;
  v7 = -[HMIFFArchive init](&v34, sel_init);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithContentsOfURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v35[0] = objc_opt_class();
      v35[1] = objc_opt_class();
      v35[2] = objc_opt_class();
      v35[3] = objc_opt_class();
      v35[4] = objc_opt_class();
      v35[5] = objc_opt_class();
      v35[6] = objc_opt_class();
      v35[7] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v13, v10, &v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v33;

      if (v14)
      {
        objc_storeStrong((id *)&v7->_ffData, v14);
        -[HMIFFArchive ffData](v7, "ffData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("homePersonsAndFaceCrops"));
        v17 = objc_claimAutoreleasedReturnValue();
        homePersonsAndFaceCrops = v7->_homePersonsAndFaceCrops;
        v7->_homePersonsAndFaceCrops = (NSArray *)v17;

        -[HMIFFArchive ffData](v7, "ffData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("photosPersonsAndFaceCrops"));
        v20 = objc_claimAutoreleasedReturnValue();
        photosPersonsAndFaceCrops = v7->_photosPersonsAndFaceCrops;
        v7->_photosPersonsAndFaceCrops = (NSArray *)v20;

        -[HMIFFArchive homePersonsAndFaceCrops](v7, "homePersonsAndFaceCrops");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[HMIFFArchive homePersonsAndFaceCrops](v7, "homePersonsAndFaceCrops");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMIFFArchive photosPersonsAndFaceCrops](v7, "photosPersonsAndFaceCrops");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v24);
          v25 = objc_claimAutoreleasedReturnValue();
          allPersonsAndFaceCrops = v7->_allPersonsAndFaceCrops;
          v7->_allPersonsAndFaceCrops = (NSArray *)v25;

        }
        else
        {
          -[HMIFFArchive photosPersonsAndFaceCrops](v7, "photosPersonsAndFaceCrops");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v7->_allPersonsAndFaceCrops;
          v7->_allPersonsAndFaceCrops = (NSArray *)v29;

        }
      }
      else
      {
        if (a4)
          *a4 = objc_retainAutorelease(v15);
        HMIErrorLogC(v15);
      }

      if (v14)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiErrorWithCode:description:", -1, CFSTR("Failed to read json file"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (a4)
        *a4 = objc_retainAutorelease(v27);
      HMIErrorLogC(v28);

    }
    v31 = 0;
    goto LABEL_16;
  }
LABEL_14:
  v31 = v7;
LABEL_16:

  return v31;
}

- (NSArray)photosPersons
{
  void *v2;
  void *v3;

  -[HMIFFArchive photosPersonsAndFaceCrops](self, "photosPersonsAndFaceCrops");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __29__HMIFFArchive_photosPersons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("person"));
}

- (NSArray)homePersons
{
  void *v2;
  void *v3;

  -[HMIFFArchive homePersonsAndFaceCrops](self, "homePersonsAndFaceCrops");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __27__HMIFFArchive_homePersons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("person"));
}

- (NSArray)allPersons
{
  void *v2;
  void *v3;

  -[HMIFFArchive allPersonsAndFaceCrops](self, "allPersonsAndFaceCrops");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_45_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __26__HMIFFArchive_allPersons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("person"));
}

- (id)faceCropsForPerson:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMIFFArchive allPersonsAndFaceCrops](self, "allPersonsAndFaceCrops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__HMIFFArchive_faceCropsForPerson___block_invoke;
  v10[3] = &unk_24DBEAE00;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("faceCrops"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __35__HMIFFArchive_faceCropsForPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("person"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (id)sourceUUIDForPerson:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMIFFArchive allPersonsAndFaceCrops](self, "allPersonsAndFaceCrops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__HMIFFArchive_sourceUUIDForPerson___block_invoke;
  v10[3] = &unk_24DBEAE00;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourceUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __36__HMIFFArchive_sourceUUIDForPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("person"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (NSDictionary)ffData
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)homePersonsAndFaceCrops
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)photosPersonsAndFaceCrops
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)allPersonsAndFaceCrops
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPersonsAndFaceCrops, 0);
  objc_storeStrong((id *)&self->_photosPersonsAndFaceCrops, 0);
  objc_storeStrong((id *)&self->_homePersonsAndFaceCrops, 0);
  objc_storeStrong((id *)&self->_ffData, 0);
}

@end
