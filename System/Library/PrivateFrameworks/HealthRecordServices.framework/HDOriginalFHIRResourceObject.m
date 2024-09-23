@implementation HDOriginalFHIRResourceObject

- (id)_initWithResourceIdentifier:(id)a3 JSONObject:(id)a4 uniquenessChecksum:(id)a5 sourceURL:(id)a6 FHIRVersion:(id)a7 receivedDate:(id)a8 firstSeenDate:(id)a9 extractionHints:(unint64_t)a10 originInformation:(id)a11 existingROWID:(id)a12 ingestedOnLocalDevice:(BOOL)a13 country:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  objc_super v38;

  v18 = a5;
  v19 = a9;
  v20 = a11;
  v21 = a12;
  v22 = a14;
  v38.receiver = self;
  v38.super_class = (Class)HDOriginalFHIRResourceObject;
  v23 = v19;
  v24 = -[HDFHIRResourceObject _initWithResourceIdentifier:JSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:](&v38, sel__initWithResourceIdentifier_JSONObject_sourceURL_FHIRVersion_receivedDate_extractionHints_, a3, a4, a6, a7, a8, a10);
  if (v24)
  {
    v25 = objc_msgSend(v18, "copy");
    v26 = (void *)v24[7];
    v24[7] = v25;

    v27 = objc_msgSend(v23, "copy");
    v28 = (void *)v24[9];
    v24[9] = v27;

    v29 = objc_msgSend(v20, "copy");
    v30 = (void *)v24[10];
    v24[10] = v29;

    v31 = objc_msgSend(v22, "copy");
    v32 = (void *)v24[11];
    v24[11] = v31;

    v33 = objc_msgSend(v21, "copy");
    v34 = (void *)v24[12];
    v24[12] = v33;

    *((_BYTE *)v24 + 64) = a13;
  }

  return v24;
}

- (HDOriginalFHIRResourceObject)initWithResourceData:(id)a3 receivedDate:(id)a4 firstSeenDate:(id)a5 extractionHints:(unint64_t)a6 originInformation:(id)a7 country:(id)a8 existingROWID:(id)a9 ingestedOnLocalDevice:(BOOL)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HDOriginalFHIRResourceObject *v24;

  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  +[HDFHIRResourceObject resourceObjectWithResourceData:receivedDate:extractionHints:error:](HDFHIRResourceObject, "resourceObjectWithResourceData:receivedDate:extractionHints:error:", a3, a4, a6, a11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = (void *)objc_msgSend(v21, "copyAsOriginalResourceObjectWithFirstSeenDate:originInformation:existingRowID:ingestedOnLocalDevice:country:", v17, v18, v20, a10, v19);

    self = v23;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)resourceObjectWithData:(id)a3 uniquenessChecksum:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 firstSeenDate:(id)a8 extractionHints:(unint64_t)a9 originVersion:(id *)a10 originBuild:(id)a11 country:(id)a12 existingROWID:(id)a13 ingestedOnLocalDevice:(BOOL)a14 error:(id *)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  HDFHIRResourceData *v27;
  void *v28;
  void *v29;
  HDHRSOriginInformation *v30;
  HDHRSOriginInformation *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v44;

  v41 = a4;
  v43 = a7;
  v42 = a8;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a6;
  v25 = a5;
  v26 = a3;
  v27 = -[HDFHIRResourceData initWithData:sourceURL:FHIRVersion:]([HDFHIRResourceData alloc], "initWithData:sourceURL:FHIRVersion:", v26, v25, v24);

  -[HDFHIRResourceData JSONDictionaryWithError:](v27, "JSONDictionaryWithError:", a15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend(a1, "identifierDetectedInJSONObject:error:", v28, a15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = [HDHRSOriginInformation alloc];
      v44 = *a10;
      v31 = -[HDHRSOriginInformation initWithOperatingSystemVersion:build:](v30, "initWithOperatingSystemVersion:build:", &v44, v21);
      v32 = objc_alloc((Class)a1);
      -[HDFHIRResourceData sourceURL](v27, "sourceURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDFHIRResourceData FHIRVersion](v27, "FHIRVersion");
      v40 = v21;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = a14;
      v35 = v32;
      v36 = v41;
      v37 = (void *)objc_msgSend(v35, "_initWithResourceIdentifier:JSONObject:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:firstSeenDate:extractionHints:originInformation:existingROWID:ingestedOnLocalDevice:country:", v29, v28, v41, v33, v34, v43, v42, a9, v31, v23, v39, v22);

      v21 = v40;
    }
    else
    {
      v37 = 0;
      v36 = v41;
    }

  }
  else
  {
    v37 = 0;
    v36 = v41;
  }

  return v37;
}

+ (id)resourceObjectWithStaticIdentifier:(id)a3 data:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 firstSeenDate:(id)a8 extractionHints:(unint64_t)a9 originVersion:(id *)a10 originBuild:(id)a11 country:(id)a12 error:(id *)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HDFHIRResourceData *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HDHRSOriginInformation *v30;
  uint64_t v31;
  objc_class *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v52;

  v19 = a3;
  v50 = a7;
  v51 = a8;
  v20 = a11;
  v21 = a12;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = -[HDFHIRResourceData initWithData:sourceURL:FHIRVersion:]([HDFHIRResourceData alloc], "initWithData:sourceURL:FHIRVersion:", v24, v23, v22);

  +[HDFHIRJSONObject objectWithResourceData:error:](HDFHIRJSONObject, "objectWithResourceData:error:", v25, a13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "JSONObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "identifierWithStaticIdentifier:JSONObject:error:", v19, v28, a13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [HDHRSOriginInformation alloc];
      v52 = *a10;
      v31 = -[HDHRSOriginInformation initWithOperatingSystemVersion:build:](v30, "initWithOperatingSystemVersion:build:", &v52, v20);
      v32 = (objc_class *)a1;
      v33 = v31;
      v47 = (void *)v31;
      v34 = [v32 alloc];
      objc_msgSend(v27, "JSONObject");
      v49 = v19;
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "uniquenessChecksum");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDFHIRResourceData sourceURL](v25, "sourceURL");
      v37 = v21;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDFHIRResourceData FHIRVersion](v25, "FHIRVersion");
      v48 = v20;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v46) = 1;
      v40 = v34;
      v41 = v35;
      v42 = (void *)v35;
      v43 = v50;
      v44 = (void *)objc_msgSend(v40, "_initWithResourceIdentifier:JSONObject:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:firstSeenDate:extractionHints:originInformation:existingROWID:ingestedOnLocalDevice:country:", v29, v41, v36, v38, v39, v50, v51, a9, v33, 0, v46, v37);

      v20 = v48;
      v21 = v37;

      v19 = v49;
    }
    else
    {
      v44 = 0;
      v43 = v50;
    }

  }
  else
  {
    v44 = 0;
    v43 = v50;
  }

  return v44;
}

- (id)copyWithAlteredData:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  NSData *staticUniquenessChecksum;
  void *v9;
  void *v10;
  void *v11;
  NSDate *firstSeenDate;
  HDHRSOriginInformation *originInformation;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v20[3];

  v5 = a3;
  v6 = -[HDFHIRResourceObject extractionHints](self, "extractionHints");
  v7 = (void *)objc_opt_class();
  staticUniquenessChecksum = self->_staticUniquenessChecksum;
  -[HDFHIRJSONObject sourceURL](self, "sourceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRJSONObject FHIRVersion](self, "FHIRVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  firstSeenDate = self->_firstSeenDate;
  originInformation = self->_originInformation;
  if (originInformation)
  {
    -[HDHRSOriginInformation operatingSystemVersion](originInformation, "operatingSystemVersion");
    originInformation = self->_originInformation;
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  v14 = v6 | 0x10;
  -[HDHRSOriginInformation operatingSystemBuild](originInformation, "operatingSystemBuild");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = self->_ingestedOnLocalDevice;
  objc_msgSend(v7, "resourceObjectWithData:uniquenessChecksum:sourceURL:FHIRVersion:receivedDate:firstSeenDate:extractionHints:originVersion:originBuild:country:existingROWID:ingestedOnLocalDevice:error:", v5, staticUniquenessChecksum, v9, v10, v11, firstSeenDate, v14, v20, v15, self->_country, self->_existingRowID, v18, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)uniquenessChecksum
{
  return self->_staticUniquenessChecksum;
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
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDOriginalFHIRResourceObject;
  v4 = a3;
  -[HDFHIRResourceObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_staticUniquenessChecksum, CFSTR("UniquenessChecksum"), v9.receiver, v9.super_class);
  -[HDOriginalFHIRResourceObject firstSeenDate](self, "firstSeenDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("FirstSeenDate"));

  -[HDOriginalFHIRResourceObject originInformation](self, "originInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("OriginInformation"));

  -[HDOriginalFHIRResourceObject country](self, "country");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Country"));

  -[HDOriginalFHIRResourceObject existingRowID](self, "existingRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("existingRowID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HDOriginalFHIRResourceObject ingestedOnLocalDevice](self, "ingestedOnLocalDevice"), CFSTR("ingestedOnLocalDevice"));
}

- (HDOriginalFHIRResourceObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  HDOriginalFHIRResourceObject *v11;
  HDOriginalFHIRResourceObject *v12;
  HDOriginalFHIRResourceObject *v13;
  uint64_t v14;
  NSNumber *existingRowID;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniquenessChecksum"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstSeenDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OriginInformation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Country"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  v10 = v9 || v7 == 0;
  if (!v10 && objc_msgSend(v4, "containsValueForKey:", CFSTR("ingestedOnLocalDevice")) && v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)HDOriginalFHIRResourceObject;
    v12 = -[HDFHIRResourceObject initWithCoder:](&v17, sel_initWithCoder_, v4);
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_staticUniquenessChecksum, v5);
      objc_storeStrong((id *)&v13->_firstSeenDate, v6);
      objc_storeStrong((id *)&v13->_originInformation, v7);
      objc_storeStrong((id *)&v13->_country, v8);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("existingRowID"));
      v14 = objc_claimAutoreleasedReturnValue();
      existingRowID = v13->_existingRowID;
      v13->_existingRowID = (NSNumber *)v14;

      v13->_ingestedOnLocalDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ingestedOnLocalDevice"));
    }
    self = v13;
    v11 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDOriginalFHIRResourceObject;
  v3 = -[HDFHIRResourceObject hash](&v8, sel_hash);
  v4 = -[NSData hash](self->_staticUniquenessChecksum, "hash") ^ v3;
  v5 = -[NSDate hash](self->_firstSeenDate, "hash");
  v6 = v4 ^ v5 ^ -[HDHRSOriginInformation hash](self->_originInformation, "hash");
  return v6 ^ -[NSNumber hash](self->_existingRowID, "hash") ^ self->_ingestedOnLocalDevice;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HDOriginalFHIRResourceObject *v5;
  HDOriginalFHIRResourceObject *v6;
  NSData *staticUniquenessChecksum;
  NSData *v8;
  uint64_t v9;
  NSData *v10;
  void *v11;
  BOOL v12;
  NSDate *firstSeenDate;
  NSDate *v14;
  uint64_t v15;
  NSDate *v16;
  uint64_t v17;
  NSDate *v18;
  void *v19;
  HDHRSOriginInformation *originInformation;
  uint64_t v21;
  HDHRSOriginInformation *v22;
  NSDate *v23;
  NSNumber *existingRowID;
  NSNumber *v25;
  uint64_t v26;
  NSNumber *v27;
  void *v28;
  _BOOL4 ingestedOnLocalDevice;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  NSDate *v35;
  void *v36;
  void *v37;
  void *v38;
  HDHRSOriginInformation *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  objc_super v45;

  v5 = (HDOriginalFHIRResourceObject *)a3;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45.receiver = self;
      v45.super_class = (Class)HDOriginalFHIRResourceObject;
      if (-[HDFHIRResourceObject isEqual:](&v45, sel_isEqual_, v5))
      {
        v6 = v5;
        staticUniquenessChecksum = self->_staticUniquenessChecksum;
        -[HDOriginalFHIRResourceObject uniquenessChecksum](v6, "uniquenessChecksum");
        v8 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (staticUniquenessChecksum != v8)
        {
          -[HDOriginalFHIRResourceObject uniquenessChecksum](v6, "uniquenessChecksum");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            v12 = 0;
            goto LABEL_46;
          }
          v3 = (void *)v9;
          v10 = self->_staticUniquenessChecksum;
          -[HDOriginalFHIRResourceObject uniquenessChecksum](v6, "uniquenessChecksum");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSData isEqual:](v10, "isEqual:", v11))
          {
            v12 = 0;
LABEL_45:

            goto LABEL_46;
          }
          v44 = v11;
        }
        firstSeenDate = self->_firstSeenDate;
        -[HDOriginalFHIRResourceObject firstSeenDate](v6, "firstSeenDate");
        v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
        if (firstSeenDate != v14)
        {
          -[HDOriginalFHIRResourceObject firstSeenDate](v6, "firstSeenDate");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v12 = 0;
            v11 = v44;
            goto LABEL_43;
          }
          v40 = (void *)v15;
          v16 = self->_firstSeenDate;
          -[HDOriginalFHIRResourceObject firstSeenDate](v6, "firstSeenDate");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v16;
          v19 = (void *)v17;
          if ((-[NSDate isEqual:](v18, "isEqual:", v17) & 1) == 0)
          {

            v12 = 0;
            v11 = v44;
            if (staticUniquenessChecksum == v8)
              goto LABEL_46;
            goto LABEL_45;
          }
          v41 = v19;
        }
        originInformation = self->_originInformation;
        -[HDOriginalFHIRResourceObject originInformation](v6, "originInformation");
        v39 = originInformation;
        v43 = objc_claimAutoreleasedReturnValue();
        if (originInformation == (HDHRSOriginInformation *)v43)
        {
          v38 = v3;
        }
        else
        {
          -[HDOriginalFHIRResourceObject originInformation](v6, "originInformation");
          v21 = objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            v12 = 0;
            v28 = v41;
            v23 = firstSeenDate;
            v11 = v44;
LABEL_36:
            v30 = (void *)v43;
            goto LABEL_37;
          }
          v37 = (void *)v21;
          v22 = self->_originInformation;
          -[HDOriginalFHIRResourceObject originInformation](v6, "originInformation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[HDHRSOriginInformation isEqual:](v22, "isEqual:"))
          {
            v12 = 0;
            v28 = v41;
            v30 = (void *)v43;
            v23 = firstSeenDate;
            v11 = v44;
            goto LABEL_40;
          }
          v38 = v3;
        }
        v23 = firstSeenDate;
        existingRowID = self->_existingRowID;
        -[HDOriginalFHIRResourceObject existingRowID](v6, "existingRowID");
        v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        if (existingRowID != v25)
        {
          -[HDOriginalFHIRResourceObject existingRowID](v6, "existingRowID");
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
          {

            v12 = 0;
            v30 = (void *)v43;
            v11 = v44;
            v3 = v38;
            v28 = v41;
            if (v39 == (HDHRSOriginInformation *)v43)
              goto LABEL_37;
LABEL_35:

            goto LABEL_36;
          }
          v34 = (void *)v26;
          v27 = self->_existingRowID;
          -[HDOriginalFHIRResourceObject existingRowID](v6, "existingRowID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSNumber isEqual:](v27, "isEqual:"))
          {
            v35 = v23;
            v12 = 0;
            v3 = v38;
            goto LABEL_31;
          }
        }
        v3 = v38;
        ingestedOnLocalDevice = self->_ingestedOnLocalDevice;
        v12 = ingestedOnLocalDevice == -[HDOriginalFHIRResourceObject ingestedOnLocalDevice](v6, "ingestedOnLocalDevice");
        if (existingRowID != v25)
        {
          v35 = v23;
LABEL_31:

          v30 = (void *)v43;
          v11 = v44;
          v28 = v41;
          v23 = v35;
          if (v39 == (HDHRSOriginInformation *)v43)
          {
LABEL_37:

            if (v23 != v14)
            {

LABEL_42:
            }
LABEL_43:

            goto LABEL_44;
          }
          goto LABEL_35;
        }

        v30 = (void *)v43;
        v11 = v44;
        v28 = v41;
        if (v39 == (HDHRSOriginInformation *)v43)
          goto LABEL_37;
LABEL_40:
        v42 = v28;
        v31 = v30;

        if (v23 == v14)
        {

LABEL_44:
          if (staticUniquenessChecksum != v8)
            goto LABEL_45;
LABEL_46:

          goto LABEL_47;
        }

        goto LABEL_42;
      }
    }
    v12 = 0;
  }
LABEL_47:

  return v12;
}

- (NSDate)firstSeenDate
{
  return self->_firstSeenDate;
}

- (HDHRSOriginInformation)originInformation
{
  return self->_originInformation;
}

- (NSString)country
{
  return self->_country;
}

- (NSNumber)existingRowID
{
  return self->_existingRowID;
}

- (BOOL)ingestedOnLocalDevice
{
  return self->_ingestedOnLocalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingRowID, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_originInformation, 0);
  objc_storeStrong((id *)&self->_firstSeenDate, 0);
  objc_storeStrong((id *)&self->_staticUniquenessChecksum, 0);
}

@end
