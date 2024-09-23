@implementation VNPersonsModelInformation

- (VNPersonsModelInformation)initWithVersion:(unint64_t)a3 lastModificationDate:(id)a4 algorithm:(id)a5 readOnly:(BOOL)a6
{
  id v11;
  id v12;
  VNPersonsModelInformation *v13;
  VNPersonsModelInformation *v14;
  uint64_t v15;
  VNPersonsModelAlgorithm *algorithm;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VNPersonsModelInformation;
  v13 = -[VNPersonsModelInformation init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_version = a3;
    objc_storeStrong((id *)&v13->_lastModificationDate, a4);
    v15 = objc_msgSend(v12, "copy");
    algorithm = v14->_algorithm;
    v14->_algorithm = (VNPersonsModelAlgorithm *)v15;

    v14->_readOnly = a6;
  }

  return v14;
}

- (VNPersonsModelInformation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  VNPersonsModelInformation *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algorithm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VNPersonsModelInformation initWithVersion:lastModificationDate:algorithm:readOnly:](self, "initWithVersion:lastModificationDate:algorithm:readOnly:", v5, v6, v7, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("readOnly")));

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastModificationDate, CFSTR("lastModDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_algorithm, CFSTR("algorithm"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_readOnly, CFSTR("readOnly"));

}

- (unint64_t)hash
{
  return -[VNPersonsModelAlgorithm hash](self->_algorithm, "hash") ^ __ROR8__(-[NSDate hash](self->_lastModificationDate, "hash") ^ __ROR8__(self->_version, 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNPersonsModelInformation *v4;
  VNPersonsModelInformation *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (VNPersonsModelInformation *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNPersonsModelInformation version](self, "version");
      if (v6 == -[VNPersonsModelInformation version](v5, "version")
        && (-[VNPersonsModelInformation lastModificationDate](self, "lastModificationDate"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            -[VNPersonsModelInformation lastModificationDate](v5, "lastModificationDate"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v7, "isEqualToDate:", v8),
            v8,
            v7,
            (v9 & 1) != 0))
      {
        -[VNPersonsModelInformation algorithm](self, "algorithm");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNPersonsModelInformation algorithm](v5, "algorithm");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (VNPersonsModelAlgorithm)algorithm
{
  return self->_algorithm;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithm, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
