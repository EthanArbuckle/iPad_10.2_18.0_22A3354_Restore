@implementation CHSynthesisStyleInventoryStatus

- (CHSynthesisStyleInventoryStatus)initWithIsPersonalizationAvailable:(BOOL)a3 isPersonalizedSynthesisModelReady:(BOOL)a4 personalizedSynthesisModelVersion:(id)a5
{
  return (CHSynthesisStyleInventoryStatus *)objc_msgSend_initWithIsPersonalizationAvailable_isPersonalizedSynthesisModelReady_personalizedSynthesisModelVersion_hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath_(self, a2, a3, a4, (uint64_t)a5, 0, 0, 0, 0, 0, 0);
}

- (CHSynthesisStyleInventoryStatus)initWithIsPersonalizationAvailable:(BOOL)a3 isPersonalizedSynthesisModelReady:(BOOL)a4 personalizedSynthesisModelVersion:(id)a5 hasAllDigits:(BOOL)a6 styleSampleCount:(int64_t)a7 samplesWithoutStylePredictionCount:(int64_t)a8 characterCoverage:(id)a9 inventoryStorageURL:(id)a10 inventoryRelativePath:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  CHSynthesisStyleInventoryStatus *v19;
  CHSynthesisStyleInventoryStatus *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSSet *characterCoverage;
  objc_super v32;

  v15 = a5;
  v16 = a9;
  v17 = a10;
  v18 = a11;
  v32.receiver = self;
  v32.super_class = (Class)CHSynthesisStyleInventoryStatus;
  v19 = -[CHSynthesisStyleInventoryStatus init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_isPersonalizationAvailable = a3;
    v19->_isPersonalizedSynthesisModelReady = a4;
    objc_storeStrong((id *)&v19->_personalizedSynthesisModelVersion, a5);
    if (os_variant_has_internal_diagnostics())
    {
      v20->_hasAllDigits = a6;
      v20->_styleSampleCount = a7;
      v20->_samplesWithoutStylePredictionCount = a8;
      v26 = objc_msgSend_copy(v16, v21, v22, v23, v24, v25);
      characterCoverage = v20->_characterCoverage;
      v20->_characterCoverage = (NSSet *)v26;

      objc_storeStrong((id *)&v20->_inventoryStorageURL, a10);
      objc_storeStrong((id *)&v20->_inventoryRelativePath, a11);
    }
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  v31 = a3;
  objc_msgSend_encodeBool_forKey_(v31, v4, self->_isPersonalizationAvailable, (uint64_t)CFSTR("isPersonalizationAvailable"), v5, v6);
  objc_msgSend_encodeBool_forKey_(v31, v7, self->_isPersonalizedSynthesisModelReady, (uint64_t)CFSTR("isPersonalizedSynthesisModelReady"), v8, v9);
  objc_msgSend_encodeObject_forKey_(v31, v10, (uint64_t)self->_personalizedSynthesisModelVersion, (uint64_t)CFSTR("personalizedSynthesisModelVersion"), v11, v12);
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend_encodeBool_forKey_(v31, v13, self->_hasAllDigits, (uint64_t)CFSTR("hasAllDigits"), v14, v15);
    objc_msgSend_encodeInteger_forKey_(v31, v16, self->_styleSampleCount, (uint64_t)CFSTR("styleSampleCount"), v17, v18);
    objc_msgSend_encodeInteger_forKey_(v31, v19, self->_samplesWithoutStylePredictionCount, (uint64_t)CFSTR("sampleWithoutStylePredictionCount"), v20, v21);
    objc_msgSend_encodeObject_forKey_(v31, v22, (uint64_t)self->_characterCoverage, (uint64_t)CFSTR("characterCoverage"), v23, v24);
    objc_msgSend_encodeObject_forKey_(v31, v25, (uint64_t)self->_inventoryStorageURL, (uint64_t)CFSTR("inventoryStorageURL"), v26, v27);
    objc_msgSend_encodeObject_forKey_(v31, v28, (uint64_t)self->_inventoryRelativePath, (uint64_t)CFSTR("inventoryRelativePath"), v29, v30);
  }

}

- (CHSynthesisStyleInventoryStatus)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHSynthesisStyleInventoryStatus *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *personalizedSynthesisModelVersion;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSSet *characterCoverage;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSURL *inventoryStorageURL;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSString *inventoryRelativePath;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CHSynthesisStyleInventoryStatus;
  v9 = -[CHSynthesisStyleInventoryStatus init](&v58, sel_init);
  if (v9)
  {
    v9->_isPersonalizationAvailable = objc_msgSend_decodeBoolForKey_(v4, v5, (uint64_t)CFSTR("isPersonalizationAvailable"), v6, v7, v8);
    v9->_isPersonalizedSynthesisModelReady = objc_msgSend_decodeBoolForKey_(v4, v10, (uint64_t)CFSTR("isPersonalizedSynthesisModelReady"), v11, v12, v13);
    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("personalizedSynthesisModelVersion"), v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    personalizedSynthesisModelVersion = v9->_personalizedSynthesisModelVersion;
    v9->_personalizedSynthesisModelVersion = (NSString *)v18;

    if (os_variant_has_internal_diagnostics())
    {
      v9->_hasAllDigits = objc_msgSend_decodeBoolForKey_(v4, v20, (uint64_t)CFSTR("hasAllDigits"), v21, v22, v23);
      v9->_styleSampleCount = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("styleSampleCount"), v25, v26, v27);
      v9->_samplesWithoutStylePredictionCount = objc_msgSend_decodeIntegerForKey_(v4, v28, (uint64_t)CFSTR("sampleWithoutStylePredictionCount"), v29, v30, v31);
      v32 = (void *)MEMORY[0x1E0C99E60];
      v33 = objc_opt_class();
      v34 = objc_opt_class();
      objc_msgSend_setWithObjects_(v32, v35, v33, v36, v37, v38, v34, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClasses_forKey_(v4, v40, (uint64_t)v39, (uint64_t)CFSTR("characterCoverage"), v41, v42);
      v43 = objc_claimAutoreleasedReturnValue();
      characterCoverage = v9->_characterCoverage;
      v9->_characterCoverage = (NSSet *)v43;

      v45 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, (uint64_t)CFSTR("inventoryStorageURL"), v47, v48);
      v49 = objc_claimAutoreleasedReturnValue();
      inventoryStorageURL = v9->_inventoryStorageURL;
      v9->_inventoryStorageURL = (NSURL *)v49;

      v51 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, (uint64_t)CFSTR("inventoryRelativePath"), v53, v54);
      v55 = objc_claimAutoreleasedReturnValue();
      inventoryRelativePath = v9->_inventoryRelativePath;
      v9->_inventoryRelativePath = (NSString *)v55;

    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v83;
  const __CFString *v84;
  const __CFString *v85;
  void *v86;

  v86 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend_isPersonalizationAvailable(self, a2, v2, v3, v4, v5))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v85 = v12;
  if (objc_msgSend_isPersonalizedSynthesisModelReady(self, v7, v8, v9, v10, v11))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  v84 = v18;
  objc_msgSend_personalizedSynthesisModelVersion(self, v13, v14, v15, v16, v17);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasAllDigits(self, v19, v20, v21, v22, v23))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  v30 = objc_msgSend_styleSampleCount(self, v24, v25, v26, v27, v28);
  v36 = objc_msgSend_samplesWithoutStylePredictionCount(self, v31, v32, v33, v34, v35);
  objc_msgSend_inventoryRelativePath(self, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterCoverage(self, v43, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_count(v48, v49, v50, v51, v52, v53);
  objc_msgSend_characterCoverage(self, v55, v56, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v60, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingSelector_(v66, v67, (uint64_t)sel_compare_, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v71, v72, (uint64_t)CFSTR(","), v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v86, v77, (uint64_t)CFSTR("isPersonalizationAvailable: %@, isPersonalizedSynthesisModelReady: %@, personalizedSynthesisModelVersion: %@, hasAllDigits: %@, styleSampleCount: %ld, samplesWithoutStylePredictionCount: %ld, inventory relative path: %@, character coverage (len %ld): %@"), v78, v79, v80, v85, v84, v83, v29, v30, v36, v42, v54, v76);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  return v81;
}

- (BOOL)isPersonalizationAvailable
{
  return self->_isPersonalizationAvailable;
}

- (BOOL)isPersonalizedSynthesisModelReady
{
  return self->_isPersonalizedSynthesisModelReady;
}

- (NSString)personalizedSynthesisModelVersion
{
  return self->_personalizedSynthesisModelVersion;
}

- (BOOL)hasAllDigits
{
  return self->_hasAllDigits;
}

- (int64_t)styleSampleCount
{
  return self->_styleSampleCount;
}

- (int64_t)samplesWithoutStylePredictionCount
{
  return self->_samplesWithoutStylePredictionCount;
}

- (NSSet)characterCoverage
{
  return self->_characterCoverage;
}

- (NSURL)inventoryStorageURL
{
  return self->_inventoryStorageURL;
}

- (NSString)inventoryRelativePath
{
  return self->_inventoryRelativePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inventoryRelativePath, 0);
  objc_storeStrong((id *)&self->_inventoryStorageURL, 0);
  objc_storeStrong((id *)&self->_characterCoverage, 0);
  objc_storeStrong((id *)&self->_personalizedSynthesisModelVersion, 0);
}

@end
