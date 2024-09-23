@implementation HDFHIRJSONObject

- (BOOL)isDiagnosticTestReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;

  -[HDFHIRJSONObject detectedResourceType](self, "detectedResourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDD2C10]))
    goto LABEL_7;
  -[HDFHIRJSONObject FHIRVersion](self, "FHIRVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "FHIRRelease");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == (void *)*MEMORY[0x24BDD2C00])
  {
    v7 = -[HDFHIRJSONObject _isDiagnosticTestReportR4Lab](self, "_isDiagnosticTestReportR4Lab");

    if (v7)
    {
      v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[HDFHIRJSONObject FHIRVersion](self, "FHIRVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "FHIRRelease");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x24BDD2BF0];

  if (v10 != v11)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  -[HDFHIRJSONObject JSONObject](self, "JSONObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v13, "hk_safeValueIfExistsForKeyPath:class:error:", CFSTR("category"), objc_opt_class(), &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;

  if (v14)
  {
    v17 = v15;
    v8 = -[HDFHIRJSONObject hasCode:codeSystem:codeableConcept:error:](self, "hasCode:codeSystem:codeableConcept:error:", CFSTR("LAB"), CFSTR("http://hl7.org/fhir/ValueSet/diagnostic-service-sections"), v14, &v17);
    v16 = v17;

    v15 = v16;
  }
  else
  {
    v8 = 0;
  }

LABEL_8:
  return v8;
}

- (BOOL)isClinicalNoteRecord
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HDFHIRJSONObject FHIRVersion](self, "FHIRVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "FHIRRelease");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BDD2C00];

  if (v4 == v5)
  {
    -[HDFHIRJSONObject detectedResourceType](self, "detectedResourceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDD2C18]))
    {
      -[HDFHIRJSONObject JSONObject](self, "JSONObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v8, "hk_safeValueIfExistsForKeyPath:class:error:", CFSTR("category"), objc_opt_class(), &v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v28;

      if (!v9)
      {
        v6 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v21 = v7;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        while (2)
        {
          v15 = 0;
          v16 = v10;
          do
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15);
            v23 = v16;
            v18 = -[HDFHIRJSONObject hasCode:codeSystem:codeableConcept:error:](self, "hasCode:codeSystem:codeableConcept:error:", CFSTR("clinical-note"), CFSTR("http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category"), v17, &v23);
            v10 = v23;

            if (v18)
            {

              v6 = 1;
              goto LABEL_18;
            }
            ++v15;
            v16 = v10;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v13)
            continue;
          break;
        }
      }

      v6 = 0;
LABEL_18:
      v7 = v21;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDD2C10])
        || -[HDFHIRJSONObject _isDiagnosticTestReportR4Lab](self, "_isDiagnosticTestReportR4Lab"))
      {
        v6 = 0;
LABEL_25:

        return v6;
      }
      -[HDFHIRJSONObject JSONObject](self, "JSONObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v19, "hk_safeValueIfExistsForKeyPath:class:error:", CFSTR("presentedForm"), objc_opt_class(), &v22);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v22;

      if (v11)
        v6 = objc_msgSend(v11, "count") != 0;
      else
        v6 = 0;
    }

    goto LABEL_24;
  }
  return 0;
}

- (BOOL)_isDiagnosticTestReportR4Lab
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HDFHIRJSONObject JSONObject](self, "JSONObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v3, "hk_safeValueIfExistsForKeyPath:class:error:", CFSTR("category"), objc_opt_class(), &v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v22;

  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v7)
    {
      v8 = v7;
      v16 = v4;
      v9 = *(_QWORD *)v19;
      while (2)
      {
        v10 = 0;
        v11 = v5;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
          v17 = v11;
          v13 = -[HDFHIRJSONObject hasCode:codeSystem:codeableConcept:error:](self, "hasCode:codeSystem:codeableConcept:error:", CFSTR("LAB"), CFSTR("http://terminology.hl7.org/CodeSystem/v2-0074"), v12, &v17, v16);
          v5 = v17;

          if (v13)
          {
            v14 = 1;
            goto LABEL_12;
          }
          ++v10;
          v11 = v5;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v8)
          continue;
        break;
      }
      v14 = 0;
LABEL_12:
      v4 = v16;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isDocumentReference
{
  void *v2;
  char v3;

  -[HDFHIRJSONObject detectedResourceType](self, "detectedResourceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x24BDD2C18]);

  return v3;
}

- (BOOL)hasCode:(id)a3 codeSystem:(id)a4 codeableConcept:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "hk_safeValueIfExistsForKeyPath:class:error:", CFSTR("coding"), objc_opt_class(), a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = -[HDFHIRJSONObject hasCode:codeSystem:codings:error:](self, "hasCode:codeSystem:codings:error:", v10, v11, v13, a6);
  else
    v14 = 0;

  return v14;
}

- (BOOL)hasCode:(id)a3 codeSystem:(id)a4 codings:(id)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v19 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "hk_safeValueIfExistsForKeyPath:class:error:", CFSTR("code"), objc_opt_class(), a6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hk_safeValueIfExistsForKeyPath:class:error:", CFSTR("system"), objc_opt_class(), a6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "caseInsensitiveCompare:", v15) && !objc_msgSend(v19, "caseInsensitiveCompare:", v16))
        {

          v17 = 1;
          goto LABEL_12;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (HDFHIRJSONObject)initWithJSONObject:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDFHIRJSONObject *v11;
  uint64_t v12;
  NSDictionary *JSONObject;
  uint64_t v14;
  NSURL *sourceURL;
  uint64_t v16;
  HKFHIRVersion *FHIRVersion;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFHIRJSONObject;
  v11 = -[HDFHIRJSONObject init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    JSONObject = v11->_JSONObject;
    v11->_JSONObject = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v14;

    v16 = objc_msgSend(v10, "copy");
    FHIRVersion = v11->_FHIRVersion;
    v11->_FHIRVersion = (HKFHIRVersion *)v16;

  }
  return v11;
}

- (NSString)detectedResourceType
{
  return (NSString *)-[NSDictionary hk_safeStringIfExistsForKeyPath:error:](self->_JSONObject, "hk_safeStringIfExistsForKeyPath:error:", CFSTR("resourceType"), 0);
}

+ (id)_dataFromJSONObject:(id)a3 JSONOptions:(unint64_t)a4
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, a4, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      +[HDFHIRJSONObject _dataFromJSONObject:JSONOptions:].cold.1((uint64_t)v5, v6);
  }

  return v4;
}

- (id)_dataWithJSONOptions:(unint64_t)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_dataFromJSONObject:JSONOptions:", self->_JSONObject, a3);
}

- (NSData)data
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HDFHIRJSONObject _dataWithJSONOptions:](self, "_dataWithJSONOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSData *)v5;
}

- (NSString)sourceString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[HDFHIRJSONObject JSONObject](self, "JSONObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_stringForDisplayFromFHIRJSONObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSData)uniquenessChecksum
{
  void *v2;
  void *v3;

  -[HDFHIRJSONObject _dataWithJSONOptions:](self, "_dataWithJSONOptions:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_MD5");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HDFHIRJSONObject JSONObject](self, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("JSONObject"));

  -[HDFHIRJSONObject sourceURL](self, "sourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SourceURL"));

  -[HDFHIRJSONObject FHIRVersion](self, "FHIRVersion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("FHIRVersion"));

}

- (HDFHIRJSONObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  HDFHIRJSONObject *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1608], "hk_JSONObjectSecureCodingClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("JSONObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRVersion"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v11 = 0;
  }
  else
  {
    self = -[HDFHIRJSONObject initWithJSONObject:sourceURL:FHIRVersion:](self, "initWithJSONObject:sourceURL:FHIRVersion:", v6, v7, v8);
    v11 = self;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSDictionary hash](self->_JSONObject, "hash");
  v4 = -[NSURL hash](self->_sourceURL, "hash") ^ v3;
  return v4 ^ -[HKFHIRVersion hash](self->_FHIRVersion, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HDFHIRJSONObject *v5;
  HDFHIRJSONObject *v6;
  NSDictionary *JSONObject;
  void *v8;
  NSURL *sourceURL;
  NSURL *v10;
  uint64_t v11;
  NSURL *v12;
  void *v13;
  char v14;
  HKFHIRVersion *FHIRVersion;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HKFHIRVersion *v20;
  void *v21;
  void *v23;

  v5 = (HDFHIRJSONObject *)a3;
  if (v5 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      JSONObject = self->_JSONObject;
      -[HDFHIRJSONObject JSONObject](v6, "JSONObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSDictionary isEqualToDictionary:](JSONObject, "isEqualToDictionary:", v8))
      {
        v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
      sourceURL = self->_sourceURL;
      -[HDFHIRJSONObject sourceURL](v6, "sourceURL");
      v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
      if (sourceURL != v10)
      {
        -[HDFHIRJSONObject sourceURL](v6, "sourceURL");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
LABEL_20:

          goto LABEL_21;
        }
        v3 = (void *)v11;
        v12 = self->_sourceURL;
        -[HDFHIRJSONObject sourceURL](v6, "sourceURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSURL isEqual:](v12, "isEqual:", v13))
        {
          v14 = 0;
LABEL_19:

          goto LABEL_20;
        }
        v23 = v13;
      }
      FHIRVersion = self->_FHIRVersion;
      -[HDFHIRJSONObject FHIRVersion](v6, "FHIRVersion");
      v16 = objc_claimAutoreleasedReturnValue();
      if (FHIRVersion == (HKFHIRVersion *)v16)
      {

        v14 = 1;
      }
      else
      {
        v17 = (void *)v16;
        -[HDFHIRJSONObject FHIRVersion](v6, "FHIRVersion");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          v20 = self->_FHIRVersion;
          -[HDFHIRJSONObject FHIRVersion](v6, "FHIRVersion");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[HKFHIRVersion isEqual:](v20, "isEqual:", v21);

        }
        else
        {

          v14 = 0;
        }
      }
      v13 = v23;
      if (sourceURL == v10)
        goto LABEL_20;
      goto LABEL_19;
    }
    v14 = 0;
  }
LABEL_22:

  return v14;
}

+ (id)objectWithResourceData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "JSONDictionaryWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc((Class)a1);
    objc_msgSend(v6, "sourceURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "FHIRVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithJSONObject:sourceURL:FHIRVersion:", v7, v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)resourceTypeOfJSONObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_opt_class();
  HKSafeObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("resourceType")) & 1) != 0)
    {
      objc_msgSend(v5, "hk_safeStringForKeyPath:error:", CFSTR("resourceType"), a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        if (objc_msgSend(v7, "length"))
        {
          v9 = v8;
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("Empty \"resourceType\" in JSON"));
      }
      v9 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("Missing \"resourceType\" string in JSON"));
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (NSDictionary)JSONObject
{
  return self->_JSONObject;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
  objc_storeStrong((id *)&self->_JSONObject, 0);
}

+ (void)_dataFromJSONObject:(uint64_t)a1 JSONOptions:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2163C4000, a2, OS_LOG_TYPE_ERROR, "Failed to create FHIR resource data from JSON: %@", (uint8_t *)&v2, 0xCu);
}

@end
