@implementation CWFANQPParameters

- (unint64_t)maximumCacheAge
{
  return self->_acceptableCacheAge / 0x3E8;
}

- (void)setMaximumCacheAge:(unint64_t)a3
{
  self->_acceptableCacheAge = 1000 * a3;
}

- (BOOL)cacheOnly
{
  return self->_acceptableCacheAge == -1;
}

- (void)setCacheOnly:(BOOL)a3
{
  self->_acceptableCacheAge = -1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("scanResults=%@, ANQPElementsIDList=%@, acceptableCacheAge=%lu, maxAge=%lu, minTimestanp=%llu, includeMatchingKnownNetworks=%d"), v2, v3, self->_scanResults, self->_ANQPElementIDList, self->_acceptableCacheAge, self->_maximumAge, self->_minimumTimestamp, self->_includeMatchingKnownNetworkProfiles);
}

- (BOOL)isEqualToANQPParameters:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  NSArray *scanResults;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  NSArray *ANQPElementIDList;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSArray *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t acceptableCacheAge;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t maximumAge;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t minimumTimestamp;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int includeMatchingKnownNetworkProfiles;
  BOOL v60;
  void *v62;

  v7 = a3;
  scanResults = self->_scanResults;
  objc_msgSend_scanResults(v7, v9, v10, v11, v12);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (scanResults == v17)
    goto LABEL_7;
  if (self->_scanResults)
  {
    objc_msgSend_scanResults(v7, v13, v14, v15, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v3 = (void *)v18;
      v23 = self->_scanResults;
      objc_msgSend_scanResults(v7, v19, v20, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(v23, v25, (uint64_t)v24, v26, v27))
      {
        v28 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v62 = v24;
LABEL_7:
      ANQPElementIDList = self->_ANQPElementIDList;
      objc_msgSend_ANQPElementIDList(v7, v13, v14, v15, v16);
      v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (ANQPElementIDList != v34)
      {
        if (!self->_ANQPElementIDList)
          goto LABEL_21;
        objc_msgSend_ANQPElementIDList(v7, v30, v31, v32, v33);
        v35 = objc_claimAutoreleasedReturnValue();
        if (!v35)
          goto LABEL_19;
        v4 = (void *)v35;
        v40 = self->_ANQPElementIDList;
        objc_msgSend_ANQPElementIDList(v7, v36, v37, v38, v39);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v40, v41, (uint64_t)v5, v42, v43))
        {
          v28 = 0;
          v24 = v62;
LABEL_16:

          goto LABEL_22;
        }
      }
      acceptableCacheAge = self->_acceptableCacheAge;
      if (acceptableCacheAge == objc_msgSend_acceptableCacheAge(v7, v30, v31, v32, v33))
      {
        maximumAge = self->_maximumAge;
        if (maximumAge == objc_msgSend_maximumAge(v7, v45, v46, v47, v48))
        {
          minimumTimestamp = self->_minimumTimestamp;
          if (minimumTimestamp == objc_msgSend_minimumTimestamp(v7, v50, v51, v52, v53))
          {
            includeMatchingKnownNetworkProfiles = self->_includeMatchingKnownNetworkProfiles;
            v28 = includeMatchingKnownNetworkProfiles == objc_msgSend_includeMatchingKnownNetworkProfiles(v7, v55, v56, v57, v58);
            v60 = ANQPElementIDList == v34;
            v24 = v62;
            if (v60)
              goto LABEL_22;
            goto LABEL_16;
          }
        }
      }
      if (ANQPElementIDList != v34)
      {

LABEL_19:
        v28 = 0;
        v24 = v62;
        if (scanResults == v17)
          goto LABEL_26;
        goto LABEL_25;
      }
LABEL_21:
      v28 = 0;
      v24 = v62;
LABEL_22:

      if (scanResults == v17)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  v28 = 0;
LABEL_26:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  CWFANQPParameters *v4;
  CWFANQPParameters *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToANQPParameters;

  v4 = (CWFANQPParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToANQPParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToANQPParameters = objc_msgSend_isEqualToANQPParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToANQPParameters = 0;
  }

  return isEqualToANQPParameters;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_hash(self->_scanResults, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_ANQPElementIDList, v7, v8, v9, v10) ^ v6 ^ self->_acceptableCacheAge ^ self->_maximumAge ^ self->_minimumTimestamp ^ self->_includeMatchingKnownNetworkProfiles;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFANQPParameters, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setScanResults_(v11, v12, (uint64_t)self->_scanResults, v13, v14);
  objc_msgSend_setANQPElementIDList_(v11, v15, (uint64_t)self->_ANQPElementIDList, v16, v17);
  objc_msgSend_setAcceptableCacheAge_(v11, v18, self->_acceptableCacheAge, v19, v20);
  objc_msgSend_setMaximumAge_(v11, v21, self->_maximumAge, v22, v23);
  objc_msgSend_setMinimumTimestamp_(v11, v24, self->_minimumTimestamp, v25, v26);
  objc_msgSend_setIncludeMatchingKnownNetworkProfiles_(v11, v27, self->_includeMatchingKnownNetworkProfiles, v28, v29);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *scanResults;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;

  scanResults = self->_scanResults;
  v29 = a3;
  objc_msgSend_encodeObject_forKey_(v29, v5, (uint64_t)scanResults, (uint64_t)CFSTR("_scanResults"), v6);
  objc_msgSend_encodeObject_forKey_(v29, v7, (uint64_t)self->_ANQPElementIDList, (uint64_t)CFSTR("_ANQPElementIDList"), v8);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v9, self->_acceptableCacheAge, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v13, (uint64_t)v12, (uint64_t)CFSTR("_acceptableCacheAge"), v14);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, self->_maximumAge, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v19, (uint64_t)v18, (uint64_t)CFSTR("_maximumAge"), v20);

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v21, self->_minimumTimestamp, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v25, (uint64_t)v24, (uint64_t)CFSTR("_minimumTimestamp"), v26);

  objc_msgSend_encodeBool_forKey_(v29, v27, self->_includeMatchingKnownNetworkProfiles, (uint64_t)CFSTR("_includeMatchingKnownNetworkProfiles"), v28);
}

- (CWFANQPParameters)initWithCoder:(id)a3
{
  id v4;
  CWFANQPParameters *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *scanResults;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *ANQPElementIDList;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CWFANQPParameters;
  v5 = -[CWFANQPParameters init](&v56, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("_scanResults"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    scanResults = v5->_scanResults;
    v5->_scanResults = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v21, v22, v19, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("_ANQPElementIDList"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    ANQPElementIDList = v5->_ANQPElementIDList;
    v5->_ANQPElementIDList = (NSArray *)v26;

    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, (uint64_t)CFSTR("_acceptableCacheAge"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_acceptableCacheAge = objc_msgSend_unsignedIntegerValue(v31, v32, v33, v34, v35);

    v36 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, (uint64_t)CFSTR("_maximumAge"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumAge = objc_msgSend_unsignedIntegerValue(v39, v40, v41, v42, v43);

    v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)CFSTR("_minimumTimestamp"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minimumTimestamp = objc_msgSend_unsignedLongLongValue(v47, v48, v49, v50, v51);

    v5->_includeMatchingKnownNetworkProfiles = objc_msgSend_decodeBoolForKey_(v4, v52, (uint64_t)CFSTR("_includeMatchingKnownNetworkProfiles"), v53, v54);
  }

  return v5;
}

- (NSArray)scanResults
{
  return self->_scanResults;
}

- (void)setScanResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)ANQPElementIDList
{
  return self->_ANQPElementIDList;
}

- (void)setANQPElementIDList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)acceptableCacheAge
{
  return self->_acceptableCacheAge;
}

- (void)setAcceptableCacheAge:(unint64_t)a3
{
  self->_acceptableCacheAge = a3;
}

- (unint64_t)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(unint64_t)a3
{
  self->_maximumAge = a3;
}

- (unint64_t)minimumTimestamp
{
  return self->_minimumTimestamp;
}

- (void)setMinimumTimestamp:(unint64_t)a3
{
  self->_minimumTimestamp = a3;
}

- (BOOL)includeMatchingKnownNetworkProfiles
{
  return self->_includeMatchingKnownNetworkProfiles;
}

- (void)setIncludeMatchingKnownNetworkProfiles:(BOOL)a3
{
  self->_includeMatchingKnownNetworkProfiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ANQPElementIDList, 0);
  objc_storeStrong((id *)&self->_scanResults, 0);
}

@end
