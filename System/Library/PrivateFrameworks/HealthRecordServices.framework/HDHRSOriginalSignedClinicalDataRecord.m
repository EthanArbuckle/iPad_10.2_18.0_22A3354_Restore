@implementation HDHRSOriginalSignedClinicalDataRecord

- (HDHRSOriginalSignedClinicalDataRecord)initWithRawContent:(id)a3 sourceType:(int64_t)a4 sourceURL:(id)a5 issuerIdentifier:(id)a6 credentialTypes:(id)a7 syncIdentifier:(id)a8 metadata:(id)a9 receivedDate:(id)a10 receivedDateTimeZone:(id)a11 signatureStatus:(int64_t)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  HDHRSOriginalSignedClinicalDataRecord *v26;
  uint64_t v27;
  NSData *rawContent;
  uint64_t v29;
  NSURL *sourceURL;
  uint64_t v31;
  NSString *issuerIdentifier;
  uint64_t v33;
  NSArray *credentialTypes;
  uint64_t v35;
  NSUUID *syncIdentifier;
  uint64_t v37;
  NSDictionary *metadata;
  uint64_t v39;
  NSDate *receivedDate;
  uint64_t v41;
  NSTimeZone *receivedDateTimeZone;
  objc_super v44;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v44.receiver = self;
  v44.super_class = (Class)HDHRSOriginalSignedClinicalDataRecord;
  v26 = -[HDHRSOriginalSignedClinicalDataRecord init](&v44, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v18, "copy");
    rawContent = v26->_rawContent;
    v26->_rawContent = (NSData *)v27;

    v26->_sourceType = a4;
    v29 = objc_msgSend(v19, "copy");
    sourceURL = v26->_sourceURL;
    v26->_sourceURL = (NSURL *)v29;

    v31 = objc_msgSend(v20, "copy");
    issuerIdentifier = v26->_issuerIdentifier;
    v26->_issuerIdentifier = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    credentialTypes = v26->_credentialTypes;
    v26->_credentialTypes = (NSArray *)v33;

    v35 = objc_msgSend(v22, "copy");
    syncIdentifier = v26->_syncIdentifier;
    v26->_syncIdentifier = (NSUUID *)v35;

    v37 = objc_msgSend(v23, "copy");
    metadata = v26->_metadata;
    v26->_metadata = (NSDictionary *)v37;

    v39 = objc_msgSend(v24, "copy");
    receivedDate = v26->_receivedDate;
    v26->_receivedDate = (NSDate *)v39;

    v41 = objc_msgSend(v25, "copy");
    receivedDateTimeZone = v26->_receivedDateTimeZone;
    v26->_receivedDateTimeZone = (NSTimeZone *)v41;

    v26->_signatureStatus = a12;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HDHRSOriginalSignedClinicalDataRecord *v5;
  HDHRSOriginalSignedClinicalDataRecord *v6;
  HDHRSOriginalSignedClinicalDataRecord *v7;
  NSData *rawContent;
  NSData *v9;
  uint64_t v10;
  void *v11;
  NSData *v12;
  int64_t v13;
  BOOL v14;
  int64_t sourceType;
  NSURL *sourceURL;
  NSURL *v17;
  uint64_t v18;
  NSURL *v19;
  uint64_t v20;
  NSURL *v21;
  void *v22;
  NSString *issuerIdentifier;
  NSString *v24;
  uint64_t v25;
  NSURL *v26;
  NSString *v27;
  NSURL *v28;
  NSString *v29;
  void *v30;
  NSArray *credentialTypes;
  uint64_t v32;
  void *v33;
  NSArray *v34;
  uint64_t v35;
  NSArray *v36;
  void *v37;
  NSUUID *syncIdentifier;
  uint64_t v39;
  void *v40;
  NSUUID *v41;
  uint64_t v42;
  NSUUID *v43;
  void *v44;
  NSDictionary *metadata;
  uint64_t v46;
  void *v47;
  NSString *v48;
  NSURL *v49;
  void *v50;
  NSDictionary *v51;
  void *receivedDate;
  uint64_t v53;
  NSDate *v54;
  void *v55;
  NSTimeZone *receivedDateTimeZone;
  uint64_t v57;
  uint64_t v58;
  NSTimeZone *v59;
  uint64_t v60;
  NSTimeZone *v61;
  void *v62;
  int64_t v63;
  int64_t signatureStatus;
  NSDictionary *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSDictionary *v77;
  void *v78;
  void *v79;
  NSDictionary *v80;
  NSUUID *v81;
  void *v82;
  void *v83;
  NSUUID *v84;
  NSArray *v85;
  void *v86;
  void *v87;
  NSURL *v88;
  NSURL *v89;
  NSURL *v90;
  void *v91;
  void *v92;
  NSArray *v93;
  NSString *v94;
  void *v95;
  void *v96;

  v5 = (HDHRSOriginalSignedClinicalDataRecord *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_80:

      goto LABEL_81;
    }
    rawContent = self->_rawContent;
    -[HDHRSOriginalSignedClinicalDataRecord rawContent](v7, "rawContent");
    v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (rawContent == v9)
    {
      sourceType = self->_sourceType;
      if (sourceType == -[HDHRSOriginalSignedClinicalDataRecord sourceType](v7, "sourceType"))
        goto LABEL_11;
    }
    else
    {
      -[HDHRSOriginalSignedClinicalDataRecord rawContent](v7, "rawContent");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = self->_rawContent;
        -[HDHRSOriginalSignedClinicalDataRecord rawContent](v7, "rawContent");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSData isEqual:](v12, "isEqual:", v3) & 1) == 0
          || (v13 = self->_sourceType, v13 != -[HDHRSOriginalSignedClinicalDataRecord sourceType](v7, "sourceType")))
        {
          v14 = 0;
LABEL_78:

          goto LABEL_79;
        }
        v96 = v11;
LABEL_11:
        sourceURL = self->_sourceURL;
        -[HDHRSOriginalSignedClinicalDataRecord sourceURL](v7, "sourceURL");
        v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
        if (sourceURL != v17)
        {
          -[HDHRSOriginalSignedClinicalDataRecord sourceURL](v7, "sourceURL");
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
            goto LABEL_75;
          v95 = (void *)v18;
          v19 = self->_sourceURL;
          -[HDHRSOriginalSignedClinicalDataRecord sourceURL](v7, "sourceURL");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v19;
          v22 = (void *)v20;
          if ((-[NSURL isEqual:](v21, "isEqual:", v20) & 1) == 0)
          {

LABEL_74:
            goto LABEL_75;
          }
          v92 = v22;
        }
        issuerIdentifier = self->_issuerIdentifier;
        -[HDHRSOriginalSignedClinicalDataRecord issuerIdentifier](v7, "issuerIdentifier");
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        v94 = issuerIdentifier;
        if (issuerIdentifier != v24)
        {
          -[HDHRSOriginalSignedClinicalDataRecord issuerIdentifier](v7, "issuerIdentifier");
          v25 = objc_claimAutoreleasedReturnValue();
          if (!v25)
          {

            if (sourceURL == v17)
            {

LABEL_76:
              v14 = 0;
              goto LABEL_77;
            }
            goto LABEL_73;
          }
          v87 = v3;
          v86 = (void *)v25;
          v26 = v17;
          v27 = v24;
          v28 = sourceURL;
          v29 = self->_issuerIdentifier;
          -[HDHRSOriginalSignedClinicalDataRecord issuerIdentifier](v7, "issuerIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](v29, "isEqualToString:", v30))
          {

            if (v28 == v26)
            {

            }
            else
            {

            }
            v14 = 0;
            v11 = v96;
            v3 = v87;
            if (rawContent == v9)
              goto LABEL_79;
            goto LABEL_78;
          }
          sourceURL = v28;
          v24 = v27;
          v17 = v26;
          v83 = v30;
          v3 = v87;
        }
        credentialTypes = self->_credentialTypes;
        -[HDHRSOriginalSignedClinicalDataRecord credentialTypes](v7, "credentialTypes");
        v93 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v85 = credentialTypes;
        if (credentialTypes != v93)
        {
          -[HDHRSOriginalSignedClinicalDataRecord credentialTypes](v7, "credentialTypes");
          v32 = objc_claimAutoreleasedReturnValue();
          if (!v32)
          {

            if (v94 == v24)
            {

              goto LABEL_72;
            }
LABEL_70:

LABEL_71:
LABEL_72:
            if (sourceURL != v17)
            {
LABEL_73:

              goto LABEL_74;
            }
LABEL_75:

            goto LABEL_76;
          }
          v82 = (void *)v32;
          v88 = sourceURL;
          v33 = v3;
          v34 = self->_credentialTypes;
          -[HDHRSOriginalSignedClinicalDataRecord credentialTypes](v7, "credentialTypes");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v34;
          v37 = (void *)v35;
          if (!-[NSArray isEqualToArray:](v36, "isEqualToArray:", v35))
          {

            v3 = v33;
            if (v94 == v24)
            {

            }
            else
            {

            }
            v11 = v96;
            if (v88 == v17)
              goto LABEL_58;
            goto LABEL_57;
          }
          v79 = v37;
          v3 = v33;
          sourceURL = v88;
        }
        syncIdentifier = self->_syncIdentifier;
        -[HDHRSOriginalSignedClinicalDataRecord syncIdentifier](v7, "syncIdentifier");
        v81 = syncIdentifier;
        v84 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        if (syncIdentifier == v84)
          goto LABEL_36;
        -[HDHRSOriginalSignedClinicalDataRecord syncIdentifier](v7, "syncIdentifier");
        v39 = objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v78 = (void *)v39;
          v89 = sourceURL;
          v40 = v3;
          v41 = self->_syncIdentifier;
          -[HDHRSOriginalSignedClinicalDataRecord syncIdentifier](v7, "syncIdentifier");
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = v41;
          v44 = (void *)v42;
          if ((-[NSUUID isEqual:](v43, "isEqual:", v42) & 1) != 0)
          {
            v75 = v44;
            v3 = v40;
            sourceURL = v89;
LABEL_36:
            metadata = self->_metadata;
            -[HDHRSOriginalSignedClinicalDataRecord metadata](v7, "metadata");
            v80 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            v77 = metadata;
            if (metadata != v80)
            {
              -[HDHRSOriginalSignedClinicalDataRecord metadata](v7, "metadata");
              v46 = objc_claimAutoreleasedReturnValue();
              if (!v46)
              {
                v14 = 0;
                goto LABEL_91;
              }
              v74 = (void *)v46;
              v47 = v83;
              v90 = v17;
              v48 = v24;
              v49 = sourceURL;
              v50 = v3;
              v51 = self->_metadata;
              -[HDHRSOriginalSignedClinicalDataRecord metadata](v7, "metadata");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (!-[NSDictionary isEqual:](v51, "isEqual:"))
              {
                v14 = 0;
                v3 = v50;
                sourceURL = v49;
                v24 = v48;
                v17 = v90;
                goto LABEL_67;
              }
              v3 = v50;
              sourceURL = v49;
              v24 = v48;
              v17 = v90;
            }
            receivedDate = self->_receivedDate;
            -[HDHRSOriginalSignedClinicalDataRecord receivedDate](v7, "receivedDate");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            if (receivedDate == v76)
            {
              v72 = receivedDate;
              v91 = v3;
            }
            else
            {
              -[HDHRSOriginalSignedClinicalDataRecord receivedDate](v7, "receivedDate");
              v53 = objc_claimAutoreleasedReturnValue();
              if (!v53)
              {
LABEL_100:

                v14 = 0;
LABEL_103:
                if (v77 != v80)
                {

                }
                if (v81 != v84)
                {

                }
                if (v85 != v93)
                {

                }
                goto LABEL_109;
              }
              v71 = (void *)v53;
              v72 = receivedDate;
              v91 = v3;
              v54 = self->_receivedDate;
              -[HDHRSOriginalSignedClinicalDataRecord receivedDate](v7, "receivedDate");
              receivedDate = (void *)objc_claimAutoreleasedReturnValue();
              if (!-[NSDate isEqualToDate:](v54, "isEqualToDate:", receivedDate))
              {
                v69 = receivedDate;
                v14 = 0;
                v3 = v91;
                v55 = v76;

LABEL_89:
                v66 = v77;
                if (v77 == v80)
                {
LABEL_92:

                  if (v81 != v84)
                  {

                  }
                  if (v85 != v93)
                  {

                  }
LABEL_109:

                  if (v94 != v24)
                  {

                  }
                  if (sourceURL != v17)
                  {

                  }
LABEL_77:
                  v11 = v96;
                  if (rawContent != v9)
                    goto LABEL_78;
LABEL_79:

                  goto LABEL_80;
                }

LABEL_91:
                v66 = v80;
                goto LABEL_92;
              }
            }
            receivedDateTimeZone = self->_receivedDateTimeZone;
            -[HDHRSOriginalSignedClinicalDataRecord receivedDateTimeZone](v7, "receivedDateTimeZone");
            v57 = objc_claimAutoreleasedReturnValue();
            if (receivedDateTimeZone == (NSTimeZone *)v57)
            {
              v70 = receivedDate;
              signatureStatus = self->_signatureStatus;
              v14 = signatureStatus == -[HDHRSOriginalSignedClinicalDataRecord signatureStatus](v7, "signatureStatus");

              v55 = v76;
              v3 = v91;
              if (v72 != v76)
                goto LABEL_88;
            }
            else
            {
              v68 = (void *)v57;
              -[HDHRSOriginalSignedClinicalDataRecord receivedDateTimeZone](v7, "receivedDateTimeZone");
              v58 = objc_claimAutoreleasedReturnValue();
              if (v58)
              {
                v67 = (void *)v58;
                v59 = self->_receivedDateTimeZone;
                -[HDHRSOriginalSignedClinicalDataRecord receivedDateTimeZone](v7, "receivedDateTimeZone");
                v60 = objc_claimAutoreleasedReturnValue();
                v61 = v59;
                v62 = (void *)v60;
                if (-[NSTimeZone isEqual:](v61, "isEqual:"))
                {
                  v70 = receivedDate;
                  v63 = self->_signatureStatus;
                  v14 = v63 == -[HDHRSOriginalSignedClinicalDataRecord signatureStatus](v7, "signatureStatus");

                  v55 = v76;
                  if (v72 != v76)
                  {
                    v3 = v91;
LABEL_88:

                    goto LABEL_89;
                  }

                  v66 = v77;
                  v3 = v91;
                  if (v77 == v80)
                    goto LABEL_92;
                  v47 = v83;
LABEL_67:
                  v83 = v47;

                  goto LABEL_91;
                }

              }
              if (v72 != v76)
              {

                v3 = v91;
                goto LABEL_100;
              }
              v14 = 0;
              v3 = v91;
              v55 = v76;
            }

            goto LABEL_103;
          }

          v3 = v40;
          if (v85 == v93)
          {

          }
          else
          {

          }
          v11 = v96;
          if (v94 != v24)
          {

          }
          if (v89 == v17)
          {
LABEL_58:

            v14 = 0;
            if (rawContent == v9)
              goto LABEL_79;
            goto LABEL_78;
          }
LABEL_57:

          goto LABEL_58;
        }

        if (v85 == v93)
        {

        }
        else
        {

        }
        if (v94 == v24)
          goto LABEL_71;
        goto LABEL_70;
      }
    }
    v14 = 0;
    goto LABEL_79;
  }
  v14 = 1;
LABEL_81:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *rawContent;
  id v5;

  rawContent = self->_rawContent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rawContent, CFSTR("RawContent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceType, CFSTR("SourceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURL, CFSTR("SourceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_issuerIdentifier, CFSTR("IssuerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialTypes, CFSTR("CredentialTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_syncIdentifier, CFSTR("SyncIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receivedDate, CFSTR("ReceivedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receivedDateTimeZone, CFSTR("ReceivedDateTimeZone"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_signatureStatus, CFSTR("SignatureStatus"));

}

- (HDHRSOriginalSignedClinicalDataRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HDHRSOriginalSignedClinicalDataRecord *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SourceURL"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("SignatureStatus")) & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RawContent"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SourceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IssuerIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SyncIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)v8;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CredentialTypes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "hk_secureCodingClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("Metadata"));
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReceivedDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReceivedDateTimeZone"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SignatureStatus"));
    v21 = (void *)v5;
    if (v5 && v7 && v10 && v9 && v12 && v13)
    {
      v15 = (void *)v22;
      v16 = v6;
      v17 = (void *)v24;
      self = -[HDHRSOriginalSignedClinicalDataRecord initWithRawContent:sourceType:sourceURL:issuerIdentifier:credentialTypes:syncIdentifier:metadata:receivedDate:receivedDateTimeZone:signatureStatus:](self, "initWithRawContent:sourceType:sourceURL:issuerIdentifier:credentialTypes:syncIdentifier:metadata:receivedDate:receivedDateTimeZone:signatureStatus:", v5, v16, v24, v7, v10, v9, v22, v12, v13, v14, v5);
      v18 = (void *)v12;
      v19 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v18 = (void *)v12;
      v19 = 0;
      v17 = (void *)v24;
      v15 = (void *)v22;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v19 = 0;
  }

  return v19;
}

- (NSData)rawContent
{
  return self->_rawContent;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (NSArray)credentialTypes
{
  return self->_credentialTypes;
}

- (NSUUID)syncIdentifier
{
  return self->_syncIdentifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSTimeZone)receivedDateTimeZone
{
  return self->_receivedDateTimeZone;
}

- (int64_t)signatureStatus
{
  return self->_signatureStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedDateTimeZone, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialTypes, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_rawContent, 0);
}

@end
