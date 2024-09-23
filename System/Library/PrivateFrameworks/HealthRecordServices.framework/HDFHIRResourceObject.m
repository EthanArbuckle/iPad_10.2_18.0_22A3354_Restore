@implementation HDFHIRResourceObject

- (id)copyWithOriginDataFrom:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDOriginalFHIRResourceObject.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[original isKindOfClass:[HDOriginalFHIRResourceObject class]]"));

  }
  objc_msgSend(v5, "firstSeenDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "country");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDFHIRResourceObject copyAsOriginalResourceObjectWithFirstSeenDate:originInformation:existingRowID:ingestedOnLocalDevice:country:](self, "copyAsOriginalResourceObjectWithFirstSeenDate:originInformation:existingRowID:ingestedOnLocalDevice:country:", v6, v7, v8, 1, v9);

  return v10;
}

- (id)copyAsOriginalResourceObjectWithFirstSeenDate:(id)a3 originInformation:(id)a4 existingRowID:(id)a5 ingestedOnLocalDevice:(BOOL)a6 country:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  HDOriginalFHIRResourceObject *v22;
  void *v23;
  id v24;
  id v25;

  v12 = a7;
  v25 = a5;
  v24 = a4;
  v13 = a3;
  v22 = [HDOriginalFHIRResourceObject alloc];
  -[HDFHIRResourceObject identifier](self, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRJSONObject JSONObject](self, "JSONObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRJSONObject uniquenessChecksum](self, "uniquenessChecksum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRJSONObject sourceURL](self, "sourceURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRJSONObject FHIRVersion](self, "FHIRVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRResourceObject receivedDate](self, "receivedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = a6;
  v19 = -[HDOriginalFHIRResourceObject _initWithResourceIdentifier:JSONObject:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:firstSeenDate:extractionHints:originInformation:existingROWID:ingestedOnLocalDevice:country:](v22, "_initWithResourceIdentifier:JSONObject:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:firstSeenDate:extractionHints:originInformation:existingROWID:ingestedOnLocalDevice:country:", v23, v14, v15, v16, v17, v18, v13, -[HDFHIRResourceObject extractionHints](self, "extractionHints"), v24, v25, v21, v12);

  return v19;
}

- (id)_initWithResourceIdentifier:(id)a3 JSONObject:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 extractionHints:(unint64_t)a8
{
  id v14;
  id v15;
  HDFHIRResourceObject *v16;
  uint64_t v17;
  HKFHIRIdentifier *identifier;
  uint64_t v19;
  NSDate *receivedDate;
  objc_super v22;

  v14 = a3;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HDFHIRResourceObject;
  v16 = -[HDFHIRJSONObject initWithJSONObject:sourceURL:FHIRVersion:](&v22, sel_initWithJSONObject_sourceURL_FHIRVersion_, a4, a5, a6);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (HKFHIRIdentifier *)v17;

    v19 = objc_msgSend(v15, "copy");
    receivedDate = v16->_receivedDate;
    v16->_receivedDate = (NSDate *)v19;

    v16->_extractionHints = a8;
  }

  return v16;
}

+ (HDFHIRResourceObject)resourceObjectWithResourceData:(id)a3 receivedDate:(id)a4 extractionHints:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "JSONDictionaryWithError:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(a1, "identifierDetectedInJSONObject:error:", v12, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc((Class)a1);
      objc_msgSend(v10, "sourceURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "FHIRVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "_initWithResourceIdentifier:JSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:", v13, v12, v15, v16, v11, a5);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return (HDFHIRResourceObject *)v17;
}

+ (HDFHIRResourceObject)resourceObjectWithJSONObject:(id)a3 serverBaseURL:(id)a4 FHIRVersion:(id)a5 receivedDate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(a1, "identifierDetectedInJSONObject:error:", v12, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "resourceType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLByAppendingPathComponent:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResourceIdentifier:JSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:", v17, v12, v21, v14, v15, 0);
  }
  else
  {
    v22 = 0;
  }

  return (HDFHIRResourceObject *)v22;
}

+ (HDFHIRResourceObject)resourceObjectWithJSONObject:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5 receivedDate:(id)a6 extractionHints:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  objc_msgSend(a1, "identifierDetectedInJSONObject:error:", v14, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_13;
  if (!v15 || (objc_msgSend(v15, "isFileURL") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v15, "pathComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 <= 1)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hk_assignError:code:format:", a8, 3, CFSTR("Invalid sourceURL for resource %@"), v23);
LABEL_12:

LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v18, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathComponents");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v24, "isEqualToString:", v25);

  if ((v34 & 1) == 0)
  {
    v38 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathComponents");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "hk_assignError:code:format:", a8, 3, CFSTR("Invalid sourceURL for resource %@, id is not the last path component, got %@"), v23, v31);

    goto LABEL_11;
  }
  objc_msgSend(v18, "resourceType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathComponents");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathComponents");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v37, "count") - 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v26, "isEqualToString:", v27);

  if ((v33 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x24BDD1540];
    HKSensitiveLogItem();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hk_assignError:code:format:", a8, 3, CFSTR("Invalid sourceURL for resource %@, resource type is not the second to last path component in %@"), v23, v30);
LABEL_11:

    goto LABEL_12;
  }
LABEL_4:
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResourceIdentifier:JSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:", v18, v14, v15, v16, v17, a7);
LABEL_14:

  return (HDFHIRResourceObject *)v19;
}

+ (id)identifierDetectedInJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  v6 = a3;
  objc_msgSend(a1, "resourceTypeOfJSONObject:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_6;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("Empty resourceType"));
LABEL_6:
    v11 = 0;
    goto LABEL_9;
  }
  v14 = 0;
  objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("id"), &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3B88]), "initWithResourceType:identifier:", v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to instantiate resource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a4, 3, v12, v10);

    v11 = 0;
  }

LABEL_9:
  return v11;
}

+ (id)identifierWithStaticIdentifier:(id)a3 JSONObject:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  objc_msgSend(a1, "resourceTypeOfJSONObject:error:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_8;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("Empty resourceType"));
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  if (!v8 || !objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Empty staticIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, v12);

    goto LABEL_8;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3B88]), "initWithResourceType:identifier:", v10, v8);
LABEL_9:

  return v11;
}

- (NSURL)serverBaseURL
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  -[HDFHIRJSONObject sourceURL](self, "sourceURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_10;
  v4 = (void *)v3;
  -[HDFHIRJSONObject sourceURL](self, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_10:
    v16 = 0;
    return (NSURL *)v16;
  }
  -[HDFHIRJSONObject sourceURL](self, "sourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFHIRIdentifier identifier](self->_identifier, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (!v11)
  {
LABEL_7:
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[HDFHIRResourceObject serverBaseURL].cold.1(v17, self);

    goto LABEL_10;
  }
  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFHIRIdentifier resourceType](self->_identifier, "resourceType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    v8 = v12;
    goto LABEL_7;
  }
  objc_msgSend(v12, "URLByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v16;
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
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDFHIRResourceObject;
  v4 = a3;
  -[HDFHIRJSONObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HDFHIRResourceObject identifier](self, "identifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Identifier"));

  -[HDFHIRResourceObject receivedDate](self, "receivedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ReceivedDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HDFHIRResourceObject extractionHints](self, "extractionHints"), CFSTR("ExtractionHints"));
}

- (HDFHIRResourceObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  HDFHIRResourceObject *v9;
  HDFHIRResourceObject *v10;
  HDFHIRResourceObject *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReceivedDate"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || (objc_msgSend(v4, "containsValueForKey:", CFSTR("ExtractionHints")) & 1) == 0)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HDFHIRResourceObject;
    v9 = -[HDFHIRJSONObject initWithCoder:](&v13, sel_initWithCoder_, v4);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_identifier, v5);
      objc_storeStrong((id *)&v10->_receivedDate, v7);
      v10->_extractionHints = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ExtractionHints"));
    }
    self = v10;
    v11 = self;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDFHIRResourceObject;
  v3 = -[HDFHIRJSONObject hash](&v5, sel_hash);
  return -[NSDate hash](self->_receivedDate, "hash") ^ v3 ^ self->_extractionHints;
}

- (BOOL)isEqual:(id)a3
{
  HDFHIRResourceObject *v4;
  HDFHIRResourceObject *v5;
  unint64_t extractionHints;
  BOOL v7;
  objc_super v9;

  v4 = (HDFHIRResourceObject *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v9.receiver = self,
          v9.super_class = (Class)HDFHIRResourceObject,
          -[HDFHIRJSONObject isEqual:](&v9, sel_isEqual_, v4)))
    {
      v5 = v4;
      extractionHints = self->_extractionHints;
      v7 = extractionHints == -[HDFHIRResourceObject extractionHints](v5, "extractionHints")
        && -[NSDate isEqualToDate:](self->_receivedDate, "isEqualToDate:", v5->_receivedDate);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HKFHIRIdentifier resourceType](self->_identifier, "resourceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFHIRIdentifier identifier](self->_identifier, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ \"%@\">"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HKFHIRIdentifier)identifier
{
  return self->_identifier;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (unint64_t)extractionHints
{
  return self->_extractionHints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)serverBaseURL
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "sourceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_2163C4000, v3, OS_LOG_TYPE_ERROR, "Unexpected sourceURL «%@» on resource %@, cannot create serverBaseURL", (uint8_t *)&v7, 0x16u);

}

@end
