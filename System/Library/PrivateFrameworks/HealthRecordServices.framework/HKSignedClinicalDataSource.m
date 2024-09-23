@implementation HKSignedClinicalDataSource

- (HKSignedClinicalDataSource)init
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

- (HKSignedClinicalDataSource)initWithFile:(id)a3 type:(int64_t)a4
{
  id v6;
  HKSignedClinicalDataSource *v7;
  uint64_t v8;
  HKSignedClinicalDataFile *file;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSignedClinicalDataSource;
  v7 = -[HKSignedClinicalDataSource init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    file = v7->_file;
    v7->_file = (HKSignedClinicalDataFile *)v8;

    v7->_type = a4;
  }

  return v7;
}

- (HKSignedClinicalDataSource)initWithQRRepresentation:(id)a3
{
  id v4;
  HKSignedClinicalDataSource *v5;
  uint64_t v6;
  HKSignedClinicalDataQRRepresentation *QRRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSignedClinicalDataSource;
  v5 = -[HKSignedClinicalDataSource init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    QRRepresentation = v5->_QRRepresentation;
    v5->_QRRepresentation = (HKSignedClinicalDataQRRepresentation *)v6;

    v5->_type = objc_msgSend(v4, "sourceType");
  }

  return v5;
}

+ (id)sourceWithQRCodeValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKSignedClinicalDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hk_isRewrittenHealthCardQRCodeURL"))
  {
    objc_msgSend(v6, "fragment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "fragment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), CFSTR("shc:/"), v9);
    }
    else
    {
      objc_msgSend(v6, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "substringFromIndex:", objc_msgSend((id)*MEMORY[0x24BDD3748], "length") + 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("shc:/"), v9);
    }
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v11;
  }
  if (!objc_msgSend(v6, "hk_isRewrittenEUDigitalCOVIDCertificateQRCodeURL"))
  {
LABEL_9:
    +[HKSignedClinicalDataQRSegment segmentFromQRCodeValue:error:](HKSignedClinicalDataQRSegment, "segmentFromQRCodeValue:error:", v5, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      +[HKSignedClinicalDataQRRepresentation representationWithQRSegment:](HKSignedClinicalDataQRRepresentation, "representationWithQRSegment:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HKSignedClinicalDataSource initWithQRRepresentation:]([HKSignedClinicalDataSource alloc], "initWithQRRepresentation:", v17);

    }
    else
    {
      v12 = 0;
    }

    goto LABEL_14;
  }
  objc_msgSend(v6, "fragment");
  v12 = (HKSignedClinicalDataSource *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "fragment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), CFSTR("HC1:"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "stringByRemovingPercentEncoding");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("could not reverse encoding of EU-DCC payload"));
      v12 = 0;
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("invalid EU-DCC payload"));
LABEL_14:

LABEL_15:
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKSignedClinicalDataSource *v5;
  HKSignedClinicalDataSource *v6;
  HKSignedClinicalDataSource *v7;
  HKSignedClinicalDataFile *file;
  HKSignedClinicalDataFile *v9;
  uint64_t v10;
  HKSignedClinicalDataFile *v11;
  void *v12;
  BOOL v13;
  HKSignedClinicalDataQRRepresentation *QRRepresentation;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HKSignedClinicalDataQRRepresentation *v19;
  void *v20;
  int64_t v21;
  int64_t type;
  void *v24;

  v5 = (HKSignedClinicalDataSource *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    file = self->_file;
    -[HKSignedClinicalDataSource file](v7, "file");
    v9 = (HKSignedClinicalDataFile *)objc_claimAutoreleasedReturnValue();
    if (file != v9)
    {
      -[HKSignedClinicalDataSource file](v7, "file");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v13 = 0;
        goto LABEL_20;
      }
      v3 = (void *)v10;
      v11 = self->_file;
      -[HKSignedClinicalDataSource file](v7, "file");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[HKSignedClinicalDataFile isEqual:](v11, "isEqual:", v12))
      {
        v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v24 = v12;
    }
    QRRepresentation = self->_QRRepresentation;
    -[HKSignedClinicalDataSource QRRepresentation](v7, "QRRepresentation");
    v15 = objc_claimAutoreleasedReturnValue();
    if (QRRepresentation == (HKSignedClinicalDataQRRepresentation *)v15)
    {
      type = self->_type;
      v13 = type == -[HKSignedClinicalDataSource type](v7, "type");

    }
    else
    {
      v16 = (void *)v15;
      -[HKSignedClinicalDataSource QRRepresentation](v7, "QRRepresentation");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = self->_QRRepresentation;
        -[HKSignedClinicalDataSource QRRepresentation](v7, "QRRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[HKSignedClinicalDataQRRepresentation isEqual:](v19, "isEqual:", v20))
        {
          v21 = self->_type;
          v13 = v21 == -[HKSignedClinicalDataSource type](v7, "type");

          goto LABEL_18;
        }

      }
      v13 = 0;
    }
LABEL_18:
    v12 = v24;
    if (file != v9)
      goto LABEL_19;
LABEL_20:

    goto LABEL_21;
  }
  v13 = 1;
LABEL_22:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKSignedClinicalDataFile *file;
  id v5;

  file = self->_file;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", file, CFSTR("file"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_QRRepresentation, CFSTR("QRRepresentation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (HKSignedClinicalDataSource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKSignedClinicalDataSource *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("type")) & 1) != 0)
    {
      self = -[HKSignedClinicalDataSource initWithFile:type:](self, "initWithFile:type:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
      v6 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QRRepresentation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      self = -[HKSignedClinicalDataSource initWithQRRepresentation:](self, "initWithQRRepresentation:", v7);
      v6 = self;
    }
    else
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        -[HKSignedClinicalDataSource initWithCoder:].cold.1(v8);
      objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
      v6 = 0;
    }

  }
  return v6;
}

- (HKSignedClinicalDataFile)file
{
  return self->_file;
}

- (HKSignedClinicalDataQRRepresentation)QRRepresentation
{
  return self->_QRRepresentation;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_QRRepresentation, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2163C4000, log, OS_LOG_TYPE_ERROR, "HKSignedClinicalDataSource.initWithCoder: decoded neither a file nor a QR representation, returning nil", v1, 2u);
}

@end
