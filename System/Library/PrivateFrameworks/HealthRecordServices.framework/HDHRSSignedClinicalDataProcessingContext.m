@implementation HDHRSSignedClinicalDataProcessingContext

- (HDHRSSignedClinicalDataProcessingContext)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDHRSSignedClinicalDataProcessingContext)initWithRawData:(id)a3 sourceType:(int64_t)a4 sourceURL:(id)a5 issuerIdentifier:(id)a6 signingKeyID:(id)a7 JWKSData:(id)a8 JWKSOutcome:(unint64_t)a9 metadata:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HDHRSSignedClinicalDataProcessingContext *v22;
  uint64_t v23;
  NSData *rawData;
  uint64_t v25;
  NSURL *sourceURL;
  uint64_t v27;
  NSString *issuerIdentifier;
  uint64_t v29;
  NSString *signingKeyID;
  uint64_t v31;
  NSData *JWKSData;
  uint64_t v33;
  NSDictionary *metadata;
  objc_super v36;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)HDHRSSignedClinicalDataProcessingContext;
  v22 = -[HDHRSSignedClinicalDataProcessingContext init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    rawData = v22->_rawData;
    v22->_rawData = (NSData *)v23;

    v22->_sourceType = a4;
    v25 = objc_msgSend(v17, "copy");
    sourceURL = v22->_sourceURL;
    v22->_sourceURL = (NSURL *)v25;

    v27 = objc_msgSend(v18, "copy");
    issuerIdentifier = v22->_issuerIdentifier;
    v22->_issuerIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    signingKeyID = v22->_signingKeyID;
    v22->_signingKeyID = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    JWKSData = v22->_JWKSData;
    v22->_JWKSData = (NSData *)v31;

    v22->_JWKSOutcome = a9;
    v33 = objc_msgSend(v21, "copy");
    metadata = v22->_metadata;
    v22->_metadata = (NSDictionary *)v33;

  }
  return v22;
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSDictionary *metadata;
  unint64_t v9;

  v3 = self->_sourceType ^ -[NSData hash](self->_rawData, "hash");
  v4 = -[NSURL hash](self->_sourceURL, "hash");
  v5 = v3 ^ v4 ^ -[NSString hash](self->_issuerIdentifier, "hash");
  v6 = -[NSString hash](self->_signingKeyID, "hash");
  v7 = v6 ^ -[NSData hash](self->_JWKSData, "hash");
  metadata = self->_metadata;
  v9 = v5 ^ v7 ^ self->_JWKSOutcome;
  return v9 ^ -[NSDictionary hash](metadata, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HDHRSSignedClinicalDataProcessingContext *v6;
  HDHRSSignedClinicalDataProcessingContext *v7;
  HDHRSSignedClinicalDataProcessingContext *v8;
  NSData *rawData;
  NSData *v10;
  uint64_t v11;
  NSData *v12;
  void *v13;
  int64_t v14;
  char v15;
  int64_t sourceType;
  NSURL *sourceURL;
  NSURL *v18;
  uint64_t v19;
  NSURL *v20;
  uint64_t v21;
  NSURL *v22;
  NSString *issuerIdentifier;
  uint64_t v24;
  NSString *v25;
  NSURL *v26;
  NSString *signingKeyID;
  NSString *v28;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  NSString *v32;
  NSData *JWKSData;
  uint64_t v34;
  NSData *v35;
  uint64_t v36;
  NSData *v37;
  void *v38;
  NSData *v39;
  unint64_t v40;
  NSURL *v41;
  NSURL *v42;
  unint64_t JWKSOutcome;
  NSDictionary *metadata;
  uint64_t v45;
  uint64_t v46;
  NSDictionary *v47;
  void *v48;
  BOOL v49;
  NSURL *v50;
  void *v52;
  void *v53;
  void *v54;
  NSData *v55;
  void *v56;
  void *v57;
  NSURL *v58;
  void *v59;
  NSString *v60;
  void *v61;
  NSURL *v62;
  void *v63;
  NSURL *v64;
  NSString *v65;
  NSString *v66;
  NSURL *v67;
  void *v68;

  v6 = (HDHRSSignedClinicalDataProcessingContext *)a3;
  v7 = v6;
  if (v6 != self)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = 0;
LABEL_80:

      goto LABEL_81;
    }
    rawData = self->_rawData;
    -[HDHRSSignedClinicalDataProcessingContext rawData](v8, "rawData");
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (rawData == v10)
    {
      sourceType = self->_sourceType;
      if (sourceType == -[HDHRSSignedClinicalDataProcessingContext sourceType](v8, "sourceType"))
        goto LABEL_11;
    }
    else
    {
      -[HDHRSSignedClinicalDataProcessingContext rawData](v8, "rawData");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v3 = (void *)v11;
        v12 = self->_rawData;
        -[HDHRSSignedClinicalDataProcessingContext rawData](v8, "rawData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSData isEqual:](v12, "isEqual:", v13) & 1) == 0
          || (v14 = self->_sourceType, v14 != -[HDHRSSignedClinicalDataProcessingContext sourceType](v8, "sourceType")))
        {
          v15 = 0;
LABEL_78:

          goto LABEL_79;
        }
        v68 = v13;
LABEL_11:
        sourceURL = self->_sourceURL;
        -[HDHRSSignedClinicalDataProcessingContext sourceURL](v8, "sourceURL");
        v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
        if (sourceURL == v18)
        {
          v67 = sourceURL;
        }
        else
        {
          -[HDHRSSignedClinicalDataProcessingContext sourceURL](v8, "sourceURL");
          v19 = objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
LABEL_30:

LABEL_31:
            v15 = 0;
            goto LABEL_77;
          }
          v4 = (void *)v19;
          v67 = sourceURL;
          v20 = self->_sourceURL;
          -[HDHRSSignedClinicalDataProcessingContext sourceURL](v8, "sourceURL");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v20;
          sourceURL = (NSURL *)v21;
          if ((-[NSURL isEqual:](v22, "isEqual:", v21) & 1) == 0)
          {
LABEL_29:

            goto LABEL_30;
          }
        }
        issuerIdentifier = self->_issuerIdentifier;
        -[HDHRSSignedClinicalDataProcessingContext issuerIdentifier](v8, "issuerIdentifier");
        v65 = issuerIdentifier;
        v66 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (issuerIdentifier == v66)
        {
          v62 = v18;
          v64 = sourceURL;
        }
        else
        {
          -[HDHRSSignedClinicalDataProcessingContext issuerIdentifier](v8, "issuerIdentifier");
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
          {

            if (v67 == v18)
            {

              goto LABEL_31;
            }
            goto LABEL_29;
          }
          v61 = (void *)v24;
          v64 = sourceURL;
          v25 = self->_issuerIdentifier;
          -[HDHRSSignedClinicalDataProcessingContext issuerIdentifier](v8, "issuerIdentifier");
          v26 = (NSURL *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](v25, "isEqualToString:", v26))
          {

            v13 = v68;
            if (v67 == v18)
            {

            }
            else
            {

            }
            v15 = 0;
            if (rawData == v10)
              goto LABEL_79;
            goto LABEL_78;
          }
          v62 = v18;
          v18 = v26;
        }
        signingKeyID = self->_signingKeyID;
        -[HDHRSSignedClinicalDataProcessingContext signingKeyID](v8, "signingKeyID");
        v60 = signingKeyID;
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (signingKeyID == v28)
        {
          v59 = v4;
        }
        else
        {
          -[HDHRSSignedClinicalDataProcessingContext signingKeyID](v8, "signingKeyID");
          v29 = objc_claimAutoreleasedReturnValue();
          if (!v29)
          {
            v15 = 0;
            v42 = v18;
            v41 = v62;
LABEL_71:

            if (v65 != v66)
            {

            }
            if (v67 == v41)
              goto LABEL_76;
            v50 = v64;
LABEL_75:

LABEL_76:
LABEL_77:
            v13 = v68;
            if (rawData != v10)
              goto LABEL_78;
LABEL_79:

            goto LABEL_80;
          }
          v57 = (void *)v29;
          v59 = v4;
          v30 = self->_signingKeyID;
          -[HDHRSSignedClinicalDataProcessingContext signingKeyID](v8, "signingKeyID");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v30;
          v4 = (void *)v31;
          if (!-[NSString isEqualToString:](v32, "isEqualToString:", v31))
          {

            if (v65 == v66)
            {

            }
            else
            {

            }
            if (v67 != v62)
            {

            }
            goto LABEL_31;
          }
        }
        v58 = v18;
        JWKSData = self->_JWKSData;
        -[HDHRSSignedClinicalDataProcessingContext JWKSData](v8, "JWKSData");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (NSData *)v34;
        v55 = JWKSData;
        v56 = v4;
        if (JWKSData == (NSData *)v34)
        {
          v39 = (NSData *)v34;
          JWKSOutcome = self->_JWKSOutcome;
          v41 = v62;
          if (JWKSOutcome != -[HDHRSSignedClinicalDataProcessingContext JWKSOutcome](v8, "JWKSOutcome"))
          {
            v15 = 0;
            v4 = v59;
            goto LABEL_61;
          }
        }
        else
        {
          -[HDHRSSignedClinicalDataProcessingContext JWKSData](v8, "JWKSData");
          v36 = objc_claimAutoreleasedReturnValue();
          if (!v36)
          {
            v39 = v35;
            v15 = 0;
            v4 = v59;
            v41 = v62;
            goto LABEL_61;
          }
          v54 = (void *)v36;
          v37 = self->_JWKSData;
          -[HDHRSSignedClinicalDataProcessingContext JWKSData](v8, "JWKSData");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if ((-[NSData isEqual:](v37, "isEqual:", v38) & 1) == 0)
          {

            v15 = 0;
            v4 = v59;
            v49 = v60 == v28;
            v41 = v62;
            goto LABEL_69;
          }
          v53 = v38;
          v39 = v35;
          v40 = self->_JWKSOutcome;
          v41 = v62;
          if (v40 != -[HDHRSSignedClinicalDataProcessingContext JWKSOutcome](v8, "JWKSOutcome"))
          {
            v15 = 0;
            v4 = v59;
LABEL_60:

LABEL_61:
            if (v60 != v28)
            {

            }
            if (v65 != v66)
            {

            }
            v50 = v64;
            if (v67 == v41)
              goto LABEL_76;
            goto LABEL_75;
          }
        }
        metadata = self->_metadata;
        -[HDHRSSignedClinicalDataProcessingContext metadata](v8, "metadata");
        v45 = objc_claimAutoreleasedReturnValue();
        if (metadata == (NSDictionary *)v45)
        {

          v15 = 1;
        }
        else
        {
          v63 = (void *)v45;
          -[HDHRSSignedClinicalDataProcessingContext metadata](v8, "metadata");
          v46 = objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            v47 = self->_metadata;
            v52 = (void *)v46;
            -[HDHRSSignedClinicalDataProcessingContext metadata](v8, "metadata");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[NSDictionary isEqual:](v47, "isEqual:", v48);

            if (v55 == v39)
            {

            }
            else
            {

            }
            v4 = v59;
            v49 = v60 == v28;
LABEL_69:
            v42 = v58;
            if (!v49)
            {

            }
            goto LABEL_71;
          }

          v15 = 0;
        }
        v4 = v59;
        if (v55 == v39)
          goto LABEL_61;
        goto LABEL_60;
      }
    }
    v15 = 0;
    goto LABEL_79;
  }
  v15 = 1;
LABEL_81:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *rawData;
  id v5;

  rawData = self->_rawData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rawData, CFSTR("RawData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceType, CFSTR("SourceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURL, CFSTR("SourceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_issuerIdentifier, CFSTR("IssuerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signingKeyID, CFSTR("SigningKeyID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_JWKSData, CFSTR("JWKSData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_JWKSOutcome, CFSTR("JWKSOutcome"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

}

- (HDHRSSignedClinicalDataProcessingContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HDHRSSignedClinicalDataProcessingContext *v13;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RawData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("SourceType"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("JWKSOutcome")) & 1) != 0)
  {
    v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SourceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IssuerIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SigningKeyID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("JWKSData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("JWKSOutcome"));
    objc_msgSend(MEMORY[0x24BDBCE70], "hk_secureCodingClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("Metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HDHRSSignedClinicalDataProcessingContext initWithRawData:sourceType:sourceURL:issuerIdentifier:signingKeyID:JWKSData:JWKSOutcome:metadata:](self, "initWithRawData:sourceType:sourceURL:issuerIdentifier:signingKeyID:JWKSData:JWKSOutcome:metadata:", v5, v15, v6, v7, v8, v9, v10, v12);

    v13 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v13 = 0;
  }

  return v13;
}

- (NSData)rawData
{
  return self->_rawData;
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

- (NSString)signingKeyID
{
  return self->_signingKeyID;
}

- (NSData)JWKSData
{
  return self->_JWKSData;
}

- (unint64_t)JWKSOutcome
{
  return self->_JWKSOutcome;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_JWKSData, 0);
  objc_storeStrong((id *)&self->_signingKeyID, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end
