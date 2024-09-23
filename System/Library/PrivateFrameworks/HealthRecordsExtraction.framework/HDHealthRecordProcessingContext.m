@implementation HDHealthRecordProcessingContext

- (HDHealthRecordProcessingContext)initWithRuleset:(id)a3 resources:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HDHealthRecordProcessingContext *v11;
  HDHealthRecordProcessingContext *v12;
  uint64_t v13;
  NSMutableArray *mutableResources;
  NSMutableDictionary *v15;
  NSMutableDictionary *parentResourcesByResource;
  NSMutableDictionary *v17;
  NSMutableDictionary *clinicalItemsByType;
  NSMutableDictionary *v19;
  NSMutableDictionary *medicalRecordsByOriginalResource;
  NSMutableDictionary *v21;
  NSMutableDictionary *clinicalRecordsByMedicalRecord;
  void *v24;
  void *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ruleset"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resources"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)HDHealthRecordProcessingContext;
  v11 = -[HDHealthRecordProcessingContext init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extractionRuleset, a3);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v10);
    mutableResources = v12->_mutableResources;
    v12->_mutableResources = (NSMutableArray *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    parentResourcesByResource = v12->_parentResourcesByResource;
    v12->_parentResourcesByResource = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clinicalItemsByType = v12->_clinicalItemsByType;
    v12->_clinicalItemsByType = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    medicalRecordsByOriginalResource = v12->_medicalRecordsByOriginalResource;
    v12->_medicalRecordsByOriginalResource = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clinicalRecordsByMedicalRecord = v12->_clinicalRecordsByMedicalRecord;
    v12->_clinicalRecordsByMedicalRecord = v21;

  }
  return v12;
}

- (id)createExtractionResultWithError:(id *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *obj;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_medicalRecordsByOriginalResource;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_medicalRecordsByOriginalResource, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __67__HDHealthRecordProcessingContext_createExtractionResultWithError___block_invoke;
        v16[3] = &unk_24ECF5368;
        v16[4] = self;
        objc_msgSend(v10, "hk_map:", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE48958]), "initWithOriginalFHIRResource:units:flags:", v9, v11, 0);
        objc_msgSend(v4, "addObject:", v12);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE48950]), "initWithItems:", v4);
  return v13;
}

id __67__HDHealthRecordProcessingContext_createExtractionResultWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE48960];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithMedicalRecord:clinicalRecord:downloadableAttachments:", v4, v6, 0);

  return v7;
}

- (BOOL)foundResource:(id)a3 parentResource:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentResource"));

LABEL_3:
  if (objc_msgSend(v9, "isEqual:", v11))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![resource isEqual:parentResource]"));

  }
  objc_msgSend(v9, "FHIRVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "FHIRRelease");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDHealthRecordRuleset FHIRRelease](self->_extractionRuleset, "FHIRRelease");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v14)
  {
    -[NSMutableArray addObject:](self->_mutableResources, "addObject:", v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentResourcesByResource, "setObject:forKeyedSubscript:", v11, v9);
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    -[HDHealthRecordRuleset FHIRRelease](self->_extractionRuleset, "FHIRRelease");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_assignError:code:format:", a5, 3, CFSTR("Cannot add resource from release %@ to a processing context associated with release %@"), v13, v16);

  }
  return v13 == v14;
}

- (NSArray)resources
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableResources, "copy");
}

- (id)extractedClinicalItemsForClinicalType:(int64_t)a3
{
  NSMutableDictionary *clinicalItemsByType;
  void *v4;
  void *v5;

  clinicalItemsByType = self->_clinicalItemsByType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](clinicalItemsByType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setExtractedClinicalItems:(id)a3 forClinicalType:(int64_t)a4
{
  NSMutableDictionary *clinicalItemsByType;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(a3, "copy");
  clinicalItemsByType = self->_clinicalItemsByType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](clinicalItemsByType, "setObject:forKeyedSubscript:", v8, v7);

}

- (BOOL)didProcessClinicalRecord:(id)a3 forMedicalRecord:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clinicalRecord"));

  }
  v26 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medicalRecord"));

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_medicalRecordsByOriginalResource;
  v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_medicalRecordsByOriginalResource, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __83__HDHealthRecordProcessingContext_didProcessClinicalRecord_forMedicalRecord_error___block_invoke;
        v27[3] = &unk_24ECF5390;
        v16 = v9;
        v17 = v9;
        v28 = v17;
        objc_msgSend(v15, "hk_firstObjectPassingTest:", v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {

          v21 = v26;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clinicalRecordsByMedicalRecord, "setObject:forKeyedSubscript:", v26, v17);
          v20 = 1;
          v9 = v16;
          goto LABEL_15;
        }
        v9 = v16;
      }
      v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
        continue;
      break;
    }
  }

  v19 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v9, "FHIRIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_assignError:code:format:", a5, 3, CFSTR("cannot accept a clinical record without a matching medical record, %@ is unknown to us"), v18);
  v20 = 0;
  v21 = v26;
LABEL_15:

  return v20;
}

uint64_t __83__HDHealthRecordProcessingContext_didProcessClinicalRecord_forMedicalRecord_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (BOOL)didProcessMedicalRecord:(id)a3 forResource:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medicalRecord"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordProcessingContext.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

LABEL_3:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_parentResourcesByResource, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v10;
  v14 = v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_medicalRecordsByOriginalResource, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, "addObject:", v8);
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_medicalRecordsByOriginalResource, "setObject:forKeyedSubscript:", v16, v14);
  }

  return 1;
}

- (HDHealthRecordRuleset)extractionRuleset
{
  return self->_extractionRuleset;
}

- (NSMutableArray)mutableResources
{
  return self->_mutableResources;
}

- (void)setMutableResources:(id)a3
{
  objc_storeStrong((id *)&self->_mutableResources, a3);
}

- (NSMutableDictionary)parentResourcesByResource
{
  return self->_parentResourcesByResource;
}

- (void)setParentResourcesByResource:(id)a3
{
  objc_storeStrong((id *)&self->_parentResourcesByResource, a3);
}

- (NSMutableDictionary)clinicalItemsByType
{
  return self->_clinicalItemsByType;
}

- (void)setClinicalItemsByType:(id)a3
{
  objc_storeStrong((id *)&self->_clinicalItemsByType, a3);
}

- (NSMutableDictionary)medicalRecordsByOriginalResource
{
  return self->_medicalRecordsByOriginalResource;
}

- (void)setMedicalRecordsByOriginalResource:(id)a3
{
  objc_storeStrong((id *)&self->_medicalRecordsByOriginalResource, a3);
}

- (NSMutableDictionary)clinicalRecordsByMedicalRecord
{
  return self->_clinicalRecordsByMedicalRecord;
}

- (void)setClinicalRecordsByMedicalRecord:(id)a3
{
  objc_storeStrong((id *)&self->_clinicalRecordsByMedicalRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalRecordsByMedicalRecord, 0);
  objc_storeStrong((id *)&self->_medicalRecordsByOriginalResource, 0);
  objc_storeStrong((id *)&self->_clinicalItemsByType, 0);
  objc_storeStrong((id *)&self->_parentResourcesByResource, 0);
  objc_storeStrong((id *)&self->_mutableResources, 0);
  objc_storeStrong((id *)&self->_extractionRuleset, 0);
}

@end
