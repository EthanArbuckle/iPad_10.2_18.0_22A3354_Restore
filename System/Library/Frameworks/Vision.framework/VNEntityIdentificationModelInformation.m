@implementation VNEntityIdentificationModelInformation

- (VNEntityIdentificationModelInformation)initWithVersion:(unint64_t)a3 algorithm:(id)a4 lastModificationDate:(id)a5 readOnly:(BOOL)a6
{
  id v10;
  id v11;
  VNEntityIdentificationModelInformation *v12;
  VNEntityIdentificationModelInformation *v13;
  uint64_t v14;
  VNEntityIdentificationModelAlgorithm *algorithm;
  objc_super v17;

  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VNEntityIdentificationModelInformation;
  v12 = -[VNEntityIdentificationModelInformation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_version = a3;
    v14 = objc_msgSend(v10, "copy");
    algorithm = v13->_algorithm;
    v13->_algorithm = (VNEntityIdentificationModelAlgorithm *)v14;

    objc_storeStrong((id *)&v13->_lastModificationDate, a5);
    v13->_readOnly = a6;
  }

  return v13;
}

- (VNEntityIdentificationModelInformation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  VNEntityIdentificationModelInformation *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algorithm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("readOnly"));

  v9 = -[VNEntityIdentificationModelInformation initWithVersion:algorithm:lastModificationDate:readOnly:](self, "initWithVersion:algorithm:lastModificationDate:readOnly:", v5, v7, v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_algorithm, CFSTR("algorithm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastModificationDate, CFSTR("lastModDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_readOnly, CFSTR("readOnly"));

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSDate hash](self->_lastModificationDate, "hash") ^ __ROR8__(-[VNEntityIdentificationModelAlgorithm hash](self->_algorithm, "hash") ^ __ROR8__(self->_version, 51), 51);
  v4 = 43690;
  if (!self->_readOnly)
    v4 = 21845;
  return v4 ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNEntityIdentificationModelInformation *v4;
  VNEntityIdentificationModelInformation *v5;
  unint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (VNEntityIdentificationModelInformation *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNEntityIdentificationModelInformation version](self, "version");
      if (v6 != -[VNEntityIdentificationModelInformation version](v5, "version"))
        goto LABEL_9;
      v7 = -[VNEntityIdentificationModelInformation isReadOnly](self, "isReadOnly");
      if (v7 != -[VNEntityIdentificationModelInformation isReadOnly](v5, "isReadOnly"))
        goto LABEL_9;
      -[VNEntityIdentificationModelInformation algorithm](self, "algorithm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNEntityIdentificationModelInformation algorithm](v5, "algorithm");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = VisionCoreEqualOrNilObjects();

      if (v10)
      {
        -[VNEntityIdentificationModelInformation lastModificationDate](self, "lastModificationDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNEntityIdentificationModelInformation lastModificationDate](v5, "lastModificationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = VisionCoreEqualOrNilObjects();

      }
      else
      {
LABEL_9:
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)version
{
  return self->_version;
}

- (VNEntityIdentificationModelAlgorithm)algorithm
{
  return (VNEntityIdentificationModelAlgorithm *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)lastModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
