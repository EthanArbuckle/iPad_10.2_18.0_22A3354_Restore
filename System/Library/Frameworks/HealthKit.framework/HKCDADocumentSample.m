@implementation HKCDADocumentSample

+ (HKCDADocumentSample)CDADocumentSampleWithData:(NSData *)documentData startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata validationError:(NSError *)validationError
{
  NSData *v12;
  NSDate *v13;
  NSDate *v14;
  NSDictionary *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _HKCDADocumentExtractedFields *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  _HKCDADocumentExtractedFields *v25;
  NSData *v26;
  void *v27;
  int v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, _DWORD *);
  void *v34;
  NSData *v35;
  _HKCDADocumentExtractedFields *v36;

  v12 = documentData;
  v13 = startDate;
  v14 = endDate;
  v15 = metadata;
  if (v13)
  {
    -[NSDate timeIntervalSinceReferenceDate](v13, "timeIntervalSinceReferenceDate");
    v17 = v16;
    if (v14)
    {
LABEL_3:
      -[NSDate timeIntervalSinceReferenceDate](v14, "timeIntervalSinceReferenceDate");
      v19 = v18;
      goto LABEL_6;
    }
  }
  else
  {
    v17 = 2.22507386e-308;
    if (v14)
      goto LABEL_3;
  }
  v19 = 2.22507386e-308;
LABEL_6:
  v20 = -[_HKCDADocumentExtractedFields initWithDocumentData:]([_HKCDADocumentExtractedFields alloc], "initWithDocumentData:", v12);
  -[_HKCDADocumentExtractedFields extractedDate](v20, "extractedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    v19 = v23;
    v17 = v23;
  }
  +[HKObjectType documentTypeForIdentifier:](HKObjectType, "documentTypeForIdentifier:", CFSTR("HKDocumentTypeIdentifierCDA"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __92__HKCDADocumentSample_CDADocumentSampleWithData_startDate_endDate_metadata_validationError___block_invoke;
  v34 = &unk_1E37EC380;
  v35 = v12;
  v36 = v20;
  v25 = v20;
  v26 = v12;
  v27 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v24, 0, v15, &v31, v17, v19);
  v28 = objc_msgSend(v27, "_validateDocumentContentWithError:", validationError, v31, v32, v33, v34);
  v29 = 0;
  if (v28)
    v29 = v27;

  return (HKCDADocumentSample *)v29;
}

uint64_t __92__HKCDADocumentSample_CDADocumentSampleWithData_startDate_endDate_metadata_validationError___block_invoke(uint64_t a1, _DWORD *a2)
{
  a2[26] = 0;
  return objc_msgSend(a2, "_processDocumentData:extractedFields:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[HKCDADocumentSample document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9.receiver = self;
  v9.super_class = (Class)HKCDADocumentSample;
  -[HKSample description](&v9, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  if (v3)
  {
    objc_msgSend(v3, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKCDADocumentSample;
  -[HKSample _validateWithConfiguration:](&v8, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[HKCDADocumentSample document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "_validateConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)prepareForSaving:(id *)a3
{
  os_unfair_lock_s *p_contentLock;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  objc_super v12;

  p_contentLock = &self->_contentLock;
  os_unfair_lock_assert_not_owner(&self->_contentLock);
  os_unfair_lock_lock(p_contentLock);
  v12.receiver = self;
  v12.super_class = (Class)HKCDADocumentSample;
  if (-[HKObject prepareForSaving:](&v12, sel_prepareForSaving_, a3))
  {
    -[HKCDADocumentSample document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "_compressDocumentDataForTransfer:", a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("HKCDADocumentSample has no document data and can not be saved"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v9);
        else
          _HKLogDroppedError(v9);
      }

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_contentLock);
  return v8;
}

- (BOOL)prepareForDelivery:(id *)a3
{
  os_unfair_lock_s *p_contentLock;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  p_contentLock = &self->_contentLock;
  os_unfair_lock_assert_not_owner(&self->_contentLock);
  os_unfair_lock_lock(p_contentLock);
  v10.receiver = self;
  v10.super_class = (Class)HKCDADocumentSample;
  if (-[HKObject prepareForDelivery:](&v10, sel_prepareForDelivery_, a3))
  {
    -[HKCDADocumentSample document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || (self->_omittedContentFlags & 2) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "_decompressDocumentDataForDelivery:", a3);

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_contentLock);
  return v8;
}

- (BOOL)_validateDocumentContentWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[HKCDADocumentSample document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (_HKPathToValidationSchema_onceToken != -1)
    dispatch_once(&_HKPathToValidationSchema_onceToken, &__block_literal_global_32);
  +[_HKXMLValidator validatorWithPathToXSD:](_HKXMLValidator, "validatorWithPathToXSD:", _HKPathToValidationSchema__pathToValidationSchema);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  v7 = objc_msgSend(v6, "validateXML:simpleError:detailedErrors:", v5, &v16, &v15);
  v8 = v16;
  v9 = v15;
  v10 = v9;
  if ((v7 & 1) == 0 && v8 && v9)
  {
    v17[0] = *MEMORY[0x1E0CB2D50];
    v17[1] = CFSTR("HKDetailedCDAValidationErrorKey");
    v18[0] = v8;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"), 3, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError(v12);
    }

  }
  return v7;
}

- (int64_t)_omittedContentFlags
{
  return self->_omittedContentFlags;
}

- (void)_processDocumentData:(id)a3 extractedFields:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  HKCDADocument *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKCDADocument *v14;
  HKCDADocument *document;
  id v16;

  v6 = (objc_class *)MEMORY[0x1E0C99D50];
  v7 = a4;
  v8 = a3;
  v16 = (id)objc_msgSend([v6 alloc], "initWithData:", v8);

  os_unfair_lock_lock(&self->_contentLock);
  self->_omittedContentFlags = 0;
  v9 = [HKCDADocument alloc];
  objc_msgSend(v7, "extractedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extractedPatient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extractedAuthorName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extractedCustodianName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HKCDADocument initWithDocumentData:compressedDocumentData:title:patientName:authorName:custodianName:](v9, "initWithDocumentData:compressedDocumentData:title:patientName:authorName:custodianName:", v16, 0, v10, v11, v12, v13);
  document = self->_document;
  self->_document = v14;

  os_unfair_lock_unlock(&self->_contentLock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCDADocumentSample)initWithCoder:(id)a3
{
  id v4;
  HKCDADocumentSample *v5;
  HKCDADocumentSample *v6;
  uint64_t v7;
  HKCDADocument *v8;
  HKCDADocument *document;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKCDADocumentSample;
  v5 = -[HKSample initWithCoder:](&v11, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_contentLock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("omittedContentFlags"));
    v6->_omittedContentFlags = v7;
    if ((v7 & 1) != 0)
    {
      document = v6->_document;
      v6->_document = 0;
    }
    else
    {
      v8 = -[HKCDADocument initWithCoder:omittedContentFlags:]([HKCDADocument alloc], "initWithCoder:omittedContentFlags:", v4, v6->_omittedContentFlags);
      document = v6->_document;
      v6->_document = v8;
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKCDADocumentSample;
  -[HKSample encodeWithCoder:](&v8, sel_encodeWithCoder_, v5);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_omittedContentFlags, CFSTR("omittedContentFlags"));
  if ((self->_omittedContentFlags & 1) == 0)
  {
    -[HKCDADocumentSample document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCDADocumentSample.m"), 275, CFSTR("HKCDADocumentSample: attempt to transmit document that is marked as omitted."));

    }
    objc_msgSend(v6, "encodeWithCoder:omittedContentFlags:", v5, self->_omittedContentFlags);

  }
}

- (void)_applyPropertiesWithOmittedFlags:(int64_t)a3 compressedDocumentData:(id)a4 title:(id)a5 patientName:(id)a6 authorName:(id)a7 custodianName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKCDADocument *v18;
  HKCDADocument *document;
  id v20;

  v20 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  os_unfair_lock_lock(&self->_contentLock);
  self->_omittedContentFlags = a3;
  if ((a3 & 1) != 0)
  {
    document = self->_document;
    self->_document = 0;
  }
  else
  {
    v18 = -[HKCDADocument initWithDocumentData:compressedDocumentData:title:patientName:authorName:custodianName:]([HKCDADocument alloc], "initWithDocumentData:compressedDocumentData:title:patientName:authorName:custodianName:", 0, v20, v14, v15, v16, v17);
    document = self->_document;
    self->_document = v18;
  }

  os_unfair_lock_unlock(&self->_contentLock);
}

+ (BOOL)_isValidCDAKeyPath:(id)a3
{
  return objc_msgSend(&unk_1E389DC18, "containsObject:", a3);
}

+ (BOOL)_isValidOperatorType:(unint64_t)a3
{
  BOOL result;

  result = 1;
  if (a3 > 9 || ((1 << a3) & 0x3B0) == 0)
    return a3 == 99;
  return result;
}

+ (id)_globStringToRegexString:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HKCDADocumentSample__globStringToRegexString___block_invoke;
  v8[3] = &unk_1E37EC3A8;
  v10 = v11;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v8);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __48__HKCDADocumentSample__globStringToRegexString___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  const __CFString *v5;
  int v6;
  __CFString *v7;

  v3 = a2;
  v7 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("*")))
    {
      v4 = *(void **)(a1 + 32);
      v5 = CFSTR(".*");
    }
    else
    {
      v6 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("?"));
      v4 = *(void **)(a1 + 32);
      if (v6)
      {
        v5 = CFSTR("?");
      }
      else
      {
        objc_msgSend(v4, "appendString:", CFSTR("\\"));
        v4 = *(void **)(a1 + 32);
        v5 = v7;
      }
    }
    objc_msgSend(v4, "appendString:", v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("\\")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
  }

}

+ (id)_comparisonExpressionForValue:(id)a3 operatorType:(unint64_t)a4
{
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &stru_1E37FD4C0;
  switch(a4)
  {
    case 4uLL:
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^%@$"), v6);
      goto LABEL_8;
    case 6uLL:
      goto LABEL_10;
    case 7uLL:
      objc_msgSend(a1, "_globStringToRegexString:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^%@.*$"), v6);
      goto LABEL_8;
    case 9uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^.*%@$"), v6);
      goto LABEL_8;
    default:
      if (a4 != 99)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^.*?%@.*$"), v6);
LABEL_8:
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (__CFString *)v8;
LABEL_10:
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v7, 0, &v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", &stru_1E37FD4C0, 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v9;
  }
}

- (id)_fieldValueForKeyPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  v4 = a3;
  -[HKCDADocumentSample document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("title")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("patient_name")))
    {
      objc_msgSend(v5, "patientName");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("author_name")))
    {
      objc_msgSend(v5, "authorName");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("custodian_name")))
    {
      objc_msgSend(v5, "custodianName");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_11:
    v7 = CFSTR("NoFieldValue");
    goto LABEL_12;
  }
  objc_msgSend(v5, "title");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v7 = (__CFString *)v6;
LABEL_12:

  return v7;
}

- (BOOL)_predicateMatchForKeyPath:(id)a3 pattern:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  -[HKCDADocumentSample _fieldValueForKeyPath:](self, "_fieldValueForKeyPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "numberOfMatchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));

  return v8 == 1;
}

- (HKCDADocument)document
{
  return (HKCDADocument *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
}

@end
