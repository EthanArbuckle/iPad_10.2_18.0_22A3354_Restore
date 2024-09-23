@implementation IDSPseudonymProperties

- (IDSPseudonymProperties)initWithFeatureID:(id)a3 scopeID:(id)a4 expiryEpoch:(double)a5 allowedServices:(id)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  IDSPseudonymProperties *v22;
  double v23;
  uint64_t v24;
  NSString *featureID;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  NSString *scopeID;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  NSArray *allowedServices;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  objc_super v43;

  v11 = a3;
  v12 = a4;
  v15 = a6;
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, v39, self, CFSTR("IDSPseudonym.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("featureID"));

  }
  if (!objc_msgSend_count(v15, v13, v14, v16))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, v42, self, CFSTR("IDSPseudonym.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[allowedServices count]"));

  }
  v43.receiver = self;
  v43.super_class = (Class)IDSPseudonymProperties;
  v22 = -[IDSPseudonymProperties init](&v43, sel_init);
  if (v22)
  {
    v24 = objc_msgSend_copy(v11, v20, v21, v23);
    featureID = v22->_featureID;
    v22->_featureID = (NSString *)v24;

    v29 = objc_msgSend_copy(v12, v26, v27, v28);
    scopeID = v22->_scopeID;
    v22->_scopeID = (NSString *)v29;

    v22->_expiryEpoch = a5;
    v34 = objc_msgSend_copy(v15, v31, v32, v33);
    allowedServices = v22->_allowedServices;
    v22->_allowedServices = (NSArray *)v34;

  }
  return v22;
}

- (id)withUpdatedExpiryEpoch:(double)a3
{
  IDSPseudonymProperties *v5;
  const char *v6;

  v5 = [IDSPseudonymProperties alloc];
  return (id)objc_msgSend_initWithFeatureID_scopeID_expiryEpoch_allowedServices_(v5, v6, (uint64_t)self->_featureID, a3, self->_scopeID, self->_allowedServices);
}

- (id)withUpdatedAllowedServices:(id)a3
{
  id v4;
  IDSPseudonymProperties *v5;
  const char *v6;
  void *v7;

  v4 = a3;
  v5 = [IDSPseudonymProperties alloc];
  v7 = (void *)objc_msgSend_initWithFeatureID_scopeID_expiryEpoch_allowedServices_(v5, v6, (uint64_t)self->_featureID, self->_expiryEpoch, self->_scopeID, v4);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSArray *allowedServices;
  double expiryEpoch;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  void *v19;
  __int128 v21;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(_OWORD *)&self->_featureID;
  allowedServices = self->_allowedServices;
  expiryEpoch = self->_expiryEpoch;
  objc_msgSend_expirationDate(self, v8, v9, *(double *)&self->_featureID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentLocale(MEMORY[0x1E0C99DC8], v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionWithLocale_(v10, v15, (uint64_t)v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)CFSTR("<%@: %p featureID: %@, scopeID: %@, allowedServices: %@, expiryEpoch: %fll, expirationDate: %@>"), *(double *)&v21, v5, self, v21, allowedServices, *(_QWORD *)&expiryEpoch, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSDate)expirationDate
{
  uint64_t v2;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], a2, v2, self->_expiryEpoch);
}

- (BOOL)hasBeenExpiredForAtLeast:(double)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  BOOL v10;

  objc_msgSend_expirationDate(self, a2, v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v5, v6, v7, v8);
  v10 = v9 < -a3;

  return v10;
}

- (BOOL)willBeExpiredIn:(double)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  BOOL v10;

  objc_msgSend_expirationDate(self, a2, v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v5, v6, v7, v8);
  v10 = v9 < a3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToPseudonymProperties;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToPseudonymProperties = objc_msgSend_isEqualToPseudonymProperties_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToPseudonymProperties = 0;

  return isEqualToPseudonymProperties;
}

- (BOOL)isEqualToPseudonymProperties:(id)a3
{
  const char *v4;
  uint64_t v5;
  IDSPseudonymProperties *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  char isEqualToString;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  double v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  double v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  double v57;
  const char *v58;
  uint64_t v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v6 = (IDSPseudonymProperties *)a3;
  if (self != v6)
  {
    objc_msgSend_featureID(self, v4, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_featureID(v6, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(v8, v13, (uint64_t)v12, v14))
      goto LABEL_6;
    objc_msgSend_expiryEpoch(self, v15, v16, v17);
    v19 = v18;
    objc_msgSend_expiryEpoch(v6, v20, v21, v18);
    v25 = v19 - v24;
    if (v25 < 0.0)
      v25 = -v25;
    if (v25 > 0.5)
    {
LABEL_6:
      isEqualToString = 0;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend_allowedServices(self, v22, v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imSetFromArray(v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allowedServices(v6, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imSetFromArray(v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToSet_(v31, v40, (uint64_t)v39, v41))
    {
      isEqualToString = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend_scopeID(self, v42, v43, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47)
    {
      objc_msgSend_scopeID(v6, v45, v46, v48);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v68)
      {
        v68 = 0;
        isEqualToString = 1;
LABEL_20:

        goto LABEL_21;
      }
    }
    objc_msgSend_scopeID(self, v45, v46, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v53 = (void *)v49;
      objc_msgSend_scopeID(v6, v50, v51, v52);
      v54 = objc_claimAutoreleasedReturnValue();
      if (v54)
      {
        v66 = (void *)v54;
        objc_msgSend_scopeID(self, v55, v56, v57);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_scopeID(v6, v58, v59, v60);
        v67 = v47;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v65, v62, (uint64_t)v61, v63);

        v47 = v67;
        if (!v67)
          goto LABEL_20;
LABEL_21:

        goto LABEL_22;
      }

    }
    isEqualToString = 0;
    if (!v47)
      goto LABEL_20;
    goto LABEL_21;
  }
  isEqualToString = 1;
LABEL_24:

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  double v32;
  double v33;

  objc_msgSend_featureID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8) + 31;

  objc_msgSend_scopeID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_scopeID(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_hash(v17, v18, v19, v20) - v9 + 32 * v9;

  }
  objc_msgSend_allowedServices(self, v14, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___imSetFromArray(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_hash(v25, v26, v27, v28) - v9 + 32 * v9;

  objc_msgSend_expiryEpoch(self, v30, v31, v32);
  return (unint64_t)(v33 + (double)(unint64_t)(31 * v29));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPseudonymProperties)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  IDSPseudonymProperties *v26;

  v4 = a3;
  objc_msgSend__stringForKey_(v4, v5, (uint64_t)CFSTR("f"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__stringForKey_(v4, v8, (uint64_t)CFSTR("s"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__numberForKey_(v4, v11, (uint64_t)CFSTR("p"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v13, v14, v15, v16);
  v18 = v17;

  objc_msgSend__arrayForKey_(v4, v19, (uint64_t)CFSTR("a"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend_count(v21, v22, v23, v24))
  {
    self = (IDSPseudonymProperties *)(id)objc_msgSend_initWithFeatureID_scopeID_expiryEpoch_allowedServices_(self, v25, (uint64_t)v7, v18, v10, v21);
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (IDSPseudonymProperties)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  IDSPseudonymProperties *v30;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("f"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("s"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeDoubleForKey_(v4, v13, (uint64_t)CFSTR("p"), v14);
  v16 = v15;
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, v24, CFSTR("a"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend_count(v25, v26, v27, v28))
  {
    self = (IDSPseudonymProperties *)(id)objc_msgSend_initWithFeatureID_scopeID_expiryEpoch_allowedServices_(self, v29, (uint64_t)v8, v16, v12, v25);
    v30 = self;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *featureID;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  const char *v10;
  double v11;
  id v12;

  featureID = self->_featureID;
  v12 = a3;
  objc_msgSend_encodeObject_forKey_(v12, v5, (uint64_t)featureID, v6, CFSTR("f"));
  objc_msgSend_encodeObject_forKey_(v12, v7, (uint64_t)self->_scopeID, v8, CFSTR("s"));
  objc_msgSend_encodeDouble_forKey_(v12, v9, (uint64_t)CFSTR("p"), self->_expiryEpoch);
  objc_msgSend_encodeObject_forKey_(v12, v10, (uint64_t)self->_allowedServices, v11, CFSTR("a"));

}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  NSString *v4;
  const char *v5;
  NSString *scopeID;
  void *v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = self->_featureID;
  if (v4)
  {
    CFDictionarySetValue(v3, CFSTR("f"), v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAFA5D8();
  }

  scopeID = self->_scopeID;
  if (scopeID)
    CFDictionarySetValue(v3, CFSTR("s"), scopeID);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, (uint64_t)scopeID, self->_expiryEpoch);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("p"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAFA558();
  }

  v8 = self->_allowedServices;
  if (v8)
  {
    CFDictionarySetValue(v3, CFSTR("a"), v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAFA4D8();
  }

  v12 = (void *)objc_msgSend_copy(v3, v9, v10, v11);
  return (NSDictionary *)v12;
}

- (NSString)featureID
{
  return self->_featureID;
}

- (NSString)scopeID
{
  return self->_scopeID;
}

- (NSArray)allowedServices
{
  return self->_allowedServices;
}

- (double)expiryEpoch
{
  return self->_expiryEpoch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedServices, 0);
  objc_storeStrong((id *)&self->_scopeID, 0);
  objc_storeStrong((id *)&self->_featureID, 0);
}

@end
