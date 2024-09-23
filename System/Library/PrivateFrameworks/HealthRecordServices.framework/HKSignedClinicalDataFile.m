@implementation HKSignedClinicalDataFile

- (HKSignedClinicalDataFile)init
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

- (HKSignedClinicalDataFile)initWithFileURL:(id)a3 fileHandle:(id)a4 sourceURL:(id)a5 receivedDate:(id)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKSignedClinicalDataFile *v17;
  uint64_t v18;
  NSURL *fileURL;
  uint64_t v20;
  NSFileHandle *fileHandle;
  uint64_t v22;
  NSURL *sourceURL;
  uint64_t v24;
  NSDate *receivedDate;
  uint64_t v26;
  NSDictionary *metadata;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKSignedClinicalDataFile;
  v17 = -[HKSignedClinicalDataFile init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    fileURL = v17->_fileURL;
    v17->_fileURL = (NSURL *)v18;

    v20 = objc_msgSend(v13, "copy");
    fileHandle = v17->_fileHandle;
    v17->_fileHandle = (NSFileHandle *)v20;

    v22 = objc_msgSend(v14, "copy");
    sourceURL = v17->_sourceURL;
    v17->_sourceURL = (NSURL *)v22;

    v24 = objc_msgSend(v15, "copy");
    receivedDate = v17->_receivedDate;
    v17->_receivedDate = (NSDate *)v24;

    v26 = objc_msgSend(v16, "copy");
    metadata = v17->_metadata;
    v17->_metadata = (NSDictionary *)v26;

  }
  return v17;
}

+ (id)signedClinicalDataFileWithURL:(id)a3 sourceURL:(id)a4 receivedDate:(id)a5 countryOfOrigin:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v12, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v23[0] = CFSTR("Filename");
    objc_msgSend(v12, "lastPathComponent");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v23[1] = CFSTR("CountryOfOrigin");
    v19 = (id)*MEMORY[0x24BDD2B18];
    if (v15)
      v19 = v15;
    v24[0] = v17;
    v24[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileURL:fileHandle:sourceURL:receivedDate:metadata:", v12, v16, v13, v14, v20);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *fileURL;
  id v5;

  fileURL = self->_fileURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fileURL, CFSTR("FileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileHandle, CFSTR("FileHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURL, CFSTR("SourceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receivedDate, CFSTR("ReceivedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

}

- (HKSignedClinicalDataFile)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKSignedClinicalDataFile *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FileURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FileHandle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceURL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReceivedDate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDBCE70], "hk_secureCodingClasses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("Metadata"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          self = -[HKSignedClinicalDataFile initWithFileURL:fileHandle:sourceURL:receivedDate:metadata:](self, "initWithFileURL:fileHandle:sourceURL:receivedDate:metadata:", v5, v6, v7, v8, v10);
          v11 = self;
        }
        else
        {
          objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
          v11 = 0;
        }

      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v11 = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v11 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKSignedClinicalDataFile *v6;
  HKSignedClinicalDataFile *v7;
  HKSignedClinicalDataFile *v8;
  NSURL *fileURL;
  NSURL *v10;
  uint64_t v11;
  NSURL *v12;
  void *v13;
  char v14;
  NSURL *sourceURL;
  NSURL *v16;
  uint64_t v17;
  void *v18;
  NSURL *v19;
  NSDate *receivedDate;
  NSDate *v21;
  uint64_t v22;
  NSDate *v23;
  uint64_t v24;
  NSDate *v25;
  void *v26;
  NSDictionary *metadata;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSDictionary *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSDate *v40;
  void *v41;
  NSURL *v42;
  void *v43;

  v6 = (HKSignedClinicalDataFile *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    fileURL = self->_fileURL;
    -[HKSignedClinicalDataFile fileURL](v8, "fileURL");
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (fileURL != v10)
    {
      -[HKSignedClinicalDataFile fileURL](v8, "fileURL");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      v12 = self->_fileURL;
      -[HKSignedClinicalDataFile fileURL](v8, "fileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSURL isEqual:](v12, "isEqual:", v13))
      {
        v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    sourceURL = self->_sourceURL;
    -[HKSignedClinicalDataFile sourceURL](v8, "sourceURL");
    v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (sourceURL == v16)
    {
      v42 = sourceURL;
    }
    else
    {
      -[HKSignedClinicalDataFile sourceURL](v8, "sourceURL");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = sourceURL;
      v19 = self->_sourceURL;
      -[HKSignedClinicalDataFile sourceURL](v8, "sourceURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSURL isEqual:](v19, "isEqual:", v4) & 1) == 0)
      {

        v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    receivedDate = self->_receivedDate;
    -[HKSignedClinicalDataFile receivedDate](v8, "receivedDate");
    v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v41 = v4;
    if (receivedDate == v21)
    {
      v39 = v3;
      v40 = receivedDate;
    }
    else
    {
      -[HKSignedClinicalDataFile receivedDate](v8, "receivedDate");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:

        }
LABEL_36:

LABEL_37:
        v13 = v43;
        if (fileURL != v10)
          goto LABEL_38;
LABEL_39:

        goto LABEL_40;
      }
      v40 = receivedDate;
      v37 = (void *)v22;
      v23 = self->_receivedDate;
      -[HKSignedClinicalDataFile receivedDate](v8, "receivedDate");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      if ((-[NSDate isEqual:](v25, "isEqual:", v24) & 1) == 0)
      {

        v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    metadata = self->_metadata;
    -[HKSignedClinicalDataFile metadata](v8, "metadata", v35);
    v28 = objc_claimAutoreleasedReturnValue();
    v14 = metadata == (NSDictionary *)v28;
    if (metadata == (NSDictionary *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[HKSignedClinicalDataFile metadata](v8, "metadata");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_metadata;
        -[HKSignedClinicalDataFile metadata](v8, "metadata");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSDictionary isEqual:](v32, "isEqual:", v33);

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16)
            goto LABEL_36;
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }

    }
    if (v40 == v21)
      goto LABEL_42;

    v3 = v39;
    goto LABEL_33;
  }
  v14 = 1;
LABEL_41:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSURL hash](self->_fileURL, "hash");
  v4 = -[NSURL hash](self->_sourceURL, "hash") ^ v3;
  v5 = -[NSDate hash](self->_receivedDate, "hash");
  return v4 ^ v5 ^ -[NSDictionary hash](self->_metadata, "hash");
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
