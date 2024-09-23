@implementation HDHealthRecordClinicalItem

- (HDHealthRecordClinicalItem)initWithRepresentedResource:(id)a3 clinicalType:(id)a4 rulesVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDHealthRecordClinicalItem *v12;
  HDHealthRecordClinicalItem *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *originalAttributes;
  uint64_t v17;
  HDHealthRecordClinicalType *clinicalType;
  uint64_t v19;
  NSNumber *rulesVersion;
  NSMutableDictionary *v21;
  NSMutableDictionary *medicalRecordProperties;
  void *v23;
  uint64_t v24;
  NSString *country;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HDHealthRecordClinicalItem;
  v12 = -[HDHealthRecordClinicalItem init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_representedResource, a3);
    objc_msgSend(v9, "JSONObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    originalAttributes = v13->_originalAttributes;
    v13->_originalAttributes = (NSDictionary *)v15;

    v17 = objc_msgSend(v10, "copy");
    clinicalType = v13->_clinicalType;
    v13->_clinicalType = (HDHealthRecordClinicalType *)v17;

    v19 = objc_msgSend(v11, "copy");
    rulesVersion = v13->_rulesVersion;
    v13->_rulesVersion = (NSNumber *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    medicalRecordProperties = v13->_medicalRecordProperties;
    v13->_medicalRecordProperties = v21;

    objc_msgSend(v9, "country");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    country = v13->_country;
    v13->_country = (NSString *)v24;

  }
  return v13;
}

- (id)correspondingClinicalTypeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  id result;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;

  if (self->_extractedMedicalRecord)
  {
    v4 = 0;
    switch(-[HDHealthRecordClinicalType type](self->_clinicalType, "type"))
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD39E0], "allergyRecordType");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 1:
        objc_msgSend(MEMORY[0x24BDD39E0], "clinicalNoteRecordType");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 2:
        objc_msgSend(MEMORY[0x24BDD39E0], "conditionRecordType");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 3:
        objc_msgSend(MEMORY[0x24BDD39E0], "coverageRecordType");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 4:
        objc_msgSend(MEMORY[0x24BDD39E0], "immunizationRecordType");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 5:
      case 6:
      case 7:
        objc_msgSend(MEMORY[0x24BDD39E0], "medicationRecordType");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 8:
        objc_opt_class();
        HKSafeObject();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        v9 = v8;
        if (v7)
        {
          objc_msgSend(v7, "category");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          HKDiagnosticTestResultCategoryFromNSString();
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            HKClinicalTypeForDiagnosticTestResultCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v4 = (void *)v12;
              goto LABEL_24;
            }
          }
          v14 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(v7, "category");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "hk_assignError:code:format:", a3, 3, CFSTR("unsupported Observation category: %@"), v15);

        }
        else
        {
          v13 = v8;
          v11 = v13;
          if (v13)
          {
            if (a3)
            {
              v11 = objc_retainAutorelease(v13);
              v4 = 0;
              *a3 = v11;
              goto LABEL_24;
            }
            _HKLogDroppedError();
          }
        }
        v4 = 0;
LABEL_24:

LABEL_16:
        result = v4;
        break;
      case 11:
        objc_msgSend(MEMORY[0x24BDD39E0], "procedureRecordType");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v4 = (void *)v5;
        goto LABEL_16;
      default:
        goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 3, CFSTR("can only determine corresponding clinical types after medical record extraction has produced a medical record"));
    return 0;
  }
  return result;
}

- (int64_t)type
{
  return -[HDHealthRecordClinicalType type](self->_clinicalType, "type");
}

- (Class)medicalRecordClass
{
  return -[HDHealthRecordClinicalType medicalRecordClass](self->_clinicalType, "medicalRecordClass");
}

- (void)assignExtractedMedicalRecord:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self->_extractedMedicalRecord)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[HDHealthRecordClinicalItem assignExtractedMedicalRecord:].cold.1(v5);
  }
  -[HDHealthRecordClinicalItem setExtractedMedicalRecord:](self, "setExtractedMedicalRecord:", v4);

}

- (id)candidateValueForKeyPath:(id)a3 error:(id *)a4
{
  return -[NSObject hd_valueForKeyPath:rootResource:error:](self, "hd_valueForKeyPath:rootResource:error:", a3, self->_representedResource, a4);
}

- (void)setMedicalRecordPropertyValue:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_medicalRecordProperties, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)_medicalRecordPropertyFromKey:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_medicalRecordProperties, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected %@ but found %@"), a4, objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("propertyName");
    v18[1] = v13;
    v19[0] = v8;
    v19[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 202, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15;
    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    goto LABEL_9;
  }
  v10 = v9;
LABEL_10:

  return v10;
}

- (id)_medicalRecordPropertyArrayFromKey:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _BYTE v34[128];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_medicalRecordProperties, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      if (objc_msgSend(v10, "count"))
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v11);
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("array contents expected %@ but found %@"), a4, objc_opt_class(), v28);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = (void *)MEMORY[0x24BDD1540];
                v23 = *MEMORY[0x24BDD0FC8];
                v32[0] = CFSTR("propertyName");
                v32[1] = v23;
                v33[0] = v8;
                v33[1] = v21;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 203, v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                v26 = v25;
                if (v26)
                {
                  if (a5)
                    *a5 = objc_retainAutorelease(v26);
                  else
                    _HKLogDroppedError();
                }

                goto LABEL_25;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
            if (v13)
              continue;
            break;
          }
        }

        v16 = v11;
      }
      else
      {
        v16 = (id)MEMORY[0x24BDBD1A8];
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected array but found %@"), objc_opt_class());
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0FC8];
      v35[0] = CFSTR("propertyName");
      v35[1] = v18;
      v36[0] = v8;
      v36[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("HDHealthRecordsServiceErrorDomain"), 202, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v20;
      if (v11)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v11);
        else
          _HKLogDroppedError();
      }

LABEL_25:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)medicalRecordPropertyValueForKey:(id)a3 expectedClass:(Class)a4 isArray:(BOOL)a5 error:(id *)a6
{
  if (a5)
    -[HDHealthRecordClinicalItem _medicalRecordPropertyArrayFromKey:expectedClass:error:](self, "_medicalRecordPropertyArrayFromKey:expectedClass:error:", a3, a4, a6);
  else
    -[HDHealthRecordClinicalItem _medicalRecordPropertyFromKey:expectedClass:error:](self, "_medicalRecordPropertyFromKey:expectedClass:error:", a3, a4, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (HDOriginalFHIRResourceObject)representedResource
{
  return self->_representedResource;
}

- (HKMedicalRecord)extractedMedicalRecord
{
  return self->_extractedMedicalRecord;
}

- (void)setExtractedMedicalRecord:(id)a3
{
  objc_storeStrong((id *)&self->_extractedMedicalRecord, a3);
}

- (HDFHIRResourceObject)APIResource
{
  return self->_APIResource;
}

- (void)setAPIResource:(id)a3
{
  objc_storeStrong((id *)&self->_APIResource, a3);
}

- (NSNumber)rulesVersion
{
  return self->_rulesVersion;
}

- (NSString)country
{
  return self->_country;
}

- (NSDictionary)medicalRecordMetadata
{
  return self->_medicalRecordMetadata;
}

- (void)setMedicalRecordMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)originalAttributes
{
  return self->_originalAttributes;
}

- (HDHealthRecordClinicalType)clinicalType
{
  return self->_clinicalType;
}

- (void)setClinicalType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalType, 0);
  objc_storeStrong((id *)&self->_originalAttributes, 0);
  objc_storeStrong((id *)&self->_medicalRecordMetadata, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_rulesVersion, 0);
  objc_storeStrong((id *)&self->_APIResource, 0);
  objc_storeStrong((id *)&self->_extractedMedicalRecord, 0);
  objc_storeStrong((id *)&self->_representedResource, 0);
  objc_storeStrong((id *)&self->_medicalRecordProperties, 0);
}

- (void)assignExtractedMedicalRecord:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_224DAC000, v1, OS_LOG_TYPE_ERROR, "%{public}@ already has an associated medical record, overriding", (uint8_t *)&v3, 0xCu);

}

@end
