@implementation ENRegionUserConsent

- (ENRegionUserConsent)initWithConsentVersion:(id)a3
{
  id v5;
  ENRegionUserConsent *v6;
  ENRegionUserConsent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENRegionUserConsent;
  v6 = -[ENRegionUserConsent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_consentVersion, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ENRegionUserConsent consentVersion](self, "consentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ENRegionUserConsent consent](self, "consent");
  if (v5 > 4)
    v6 = "?";
  else
    v6 = (&off_24C38BA28)[v5];
  -[ENRegionUserConsent consentTimestamp](self, "consentTimestamp");
  v8 = v7;
  v9 = -[ENRegionUserConsent differentialPrivacyConsent](self, "differentialPrivacyConsent");
  if (v9 > 4)
    v10 = "?";
  else
    v10 = (&off_24C38BA28)[v9];
  -[ENRegionUserConsent differentialPrivacyConsentTimestamp](self, "differentialPrivacyConsentTimestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Consent [version: %@] - %s, ConsentTimestamp: %f, DPConsent: %s, DPConsentTimestamp: %f"), v4, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ENRegionUserConsent)initWithCoder:(id)a3
{
  id v4;
  ENRegionUserConsent *v5;
  uint64_t v6;
  NSString *consentText;
  double v8;
  uint64_t v9;
  NSString *consentVersion;
  double v11;
  ENRegionUserConsent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ENRegionUserConsent;
  v5 = -[ENRegionUserConsent init](&v14, sel_init);
  if (!v5)
    goto LABEL_4;
  v5->_consent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("consent"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("consentText"));
  v6 = objc_claimAutoreleasedReturnValue();
  consentText = v5->_consentText;
  v5->_consentText = (NSString *)v6;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("consentTimestamp"));
  v5->_consentTimestamp = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("consentVersion"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    consentVersion = v5->_consentVersion;
    v5->_consentVersion = (NSString *)v9;

    v5->_differentialPrivacyConsent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("differentialPrivacyConsent"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("differentialPrivacyConsentTimestamp"));
    v5->_differentialPrivacyConsentTimestamp = v11;
LABEL_4:
    v12 = v5;
    goto LABEL_5;
  }
  if (gLogCategory_ENRegionConfiguration <= 30
    && (gLogCategory_ENRegionConfiguration != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v12 = 0;
LABEL_5:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[ENRegionUserConsent consent](self, "consent"), CFSTR("consent"));
  -[ENRegionUserConsent consentText](self, "consentText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("consentText"));

  -[ENRegionUserConsent consentTimestamp](self, "consentTimestamp");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("consentTimestamp"));
  -[ENRegionUserConsent consentVersion](self, "consentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("consentVersion"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[ENRegionUserConsent differentialPrivacyConsent](self, "differentialPrivacyConsent"), CFSTR("differentialPrivacyConsent"));
  -[ENRegionUserConsent differentialPrivacyConsentTimestamp](self, "differentialPrivacyConsentTimestamp");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("differentialPrivacyConsentTimestamp"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  ENRegionUserConsent *v4;

  v4 = -[ENRegionUserConsent initWithConsentVersion:](+[ENRegionUserConsent allocWithZone:](ENRegionUserConsent, "allocWithZone:", a3), "initWithConsentVersion:", self->_consentVersion);
  -[ENRegionUserConsent setConsent:](v4, "setConsent:", -[ENRegionUserConsent consent](self, "consent"));
  -[ENRegionUserConsent consentTimestamp](self, "consentTimestamp");
  -[ENRegionUserConsent setConsentTimestamp:](v4, "setConsentTimestamp:");
  -[ENRegionUserConsent setDifferentialPrivacyConsent:](v4, "setDifferentialPrivacyConsent:", -[ENRegionUserConsent differentialPrivacyConsent](self, "differentialPrivacyConsent"));
  -[ENRegionUserConsent differentialPrivacyConsentTimestamp](self, "differentialPrivacyConsentTimestamp");
  -[ENRegionUserConsent setDifferentialPrivacyConsentTimestamp:](v4, "setDifferentialPrivacyConsentTimestamp:");
  return v4;
}

- (id)updatedConsent:(id)a3
{
  id v3;
  void *v4;
  ENRegionUserConsent *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  ENRegionUserConsent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  ENRegionUserConsent *v25;

  v6 = (ENRegionUserConsent *)a3;
  v7 = (void *)-[ENRegionUserConsent copy](self, "copy");
  if (objc_msgSend(v7, "consent") != 4 && !-[ENRegionUserConsent consent](v6, "consent")
    || (v8 = -[ENRegionUserConsent consent](v6, "consent"),
        v9 = -[ENRegionUserConsent consent](self, "consent"),
        v10 = v6,
        v8 == v9))
  {
    v10 = self;
  }
  objc_msgSend(v7, "setConsent:", -[ENRegionUserConsent consent](v10, "consent"));
  -[ENRegionUserConsent consentText](v6, "consentText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  if (!v12)
    goto LABEL_12;
  -[ENRegionUserConsent consentText](v6, "consentText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionUserConsent consentText](self, "consentText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  v15 = v14;
  if (v3 == v15)
  {

    v4 = v3;
    goto LABEL_12;
  }
  v4 = v15;
  if ((v3 == 0) != (v15 != 0))
  {
    v16 = objc_msgSend(v3, "isEqual:", v15);

    if ((v16 & 1) == 0)
      goto LABEL_15;
LABEL_12:
    -[ENRegionUserConsent consentText](self, "consentText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConsentText:", v17);

    if (!v12)
      goto LABEL_17;
    goto LABEL_16;
  }

LABEL_15:
  -[ENRegionUserConsent consentText](v6, "consentText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConsentText:", v18);

LABEL_16:
LABEL_17:

  -[ENRegionUserConsent consentVersion](v6, "consentVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");
  if (!v20
    || (-[ENRegionUserConsent consentVersion](v6, "consentVersion"),
        v3 = (id)objc_claimAutoreleasedReturnValue(),
        -[ENRegionUserConsent consentVersion](self, "consentVersion"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0))
  {
    -[ENRegionUserConsent consentVersion](self, "consentVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConsentVersion:", v22);

    if (!v20)
      goto LABEL_22;
  }
  else
  {
    -[ENRegionUserConsent consentVersion](v6, "consentVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConsentVersion:", v21);

  }
LABEL_22:

  if (objc_msgSend(v7, "differentialPrivacyConsent") != 4
    && !-[ENRegionUserConsent differentialPrivacyConsent](v6, "differentialPrivacyConsent")
    || (v23 = -[ENRegionUserConsent differentialPrivacyConsent](v6, "differentialPrivacyConsent"),
        v24 = -[ENRegionUserConsent differentialPrivacyConsent](self, "differentialPrivacyConsent"),
        v25 = v6,
        v23 == v24))
  {
    v25 = self;
  }
  objc_msgSend(v7, "setDifferentialPrivacyConsent:", -[ENRegionUserConsent differentialPrivacyConsent](v25, "differentialPrivacyConsent"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  int64_t v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[ENRegionUserConsent consent](self, "consent");
    if (v5 == objc_msgSend(v4, "consent"))
    {
      -[ENRegionUserConsent consentText](self, "consentText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "consentText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          v12 = 0;
          v14 = v9;
          v13 = v8;
LABEL_13:

          goto LABEL_14;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
          v12 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      -[ENRegionUserConsent consentVersion](self, "consentVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "consentVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", v14))
      {
        v15 = -[ENRegionUserConsent differentialPrivacyConsent](self, "differentialPrivacyConsent");
        v12 = v15 == objc_msgSend(v4, "differentialPrivacyConsent");
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_13;
    }
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (void)setConsent:(int64_t)a3
{
  double v4;
  id v5;

  self->_consent = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  self->_consentTimestamp = v4;

}

- (void)setDifferentialPrivacyConsent:(int64_t)a3
{
  double v4;
  id v5;

  self->_differentialPrivacyConsent = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  self->_differentialPrivacyConsentTimestamp = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)consent
{
  return self->_consent;
}

- (NSString)consentText
{
  return self->_consentText;
}

- (void)setConsentText:(id)a3
{
  objc_storeStrong((id *)&self->_consentText, a3);
}

- (double)consentTimestamp
{
  return self->_consentTimestamp;
}

- (void)setConsentTimestamp:(double)a3
{
  self->_consentTimestamp = a3;
}

- (NSString)consentVersion
{
  return self->_consentVersion;
}

- (void)setConsentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_consentVersion, a3);
}

- (int64_t)differentialPrivacyConsent
{
  return self->_differentialPrivacyConsent;
}

- (double)differentialPrivacyConsentTimestamp
{
  return self->_differentialPrivacyConsentTimestamp;
}

- (void)setDifferentialPrivacyConsentTimestamp:(double)a3
{
  self->_differentialPrivacyConsentTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentVersion, 0);
  objc_storeStrong((id *)&self->_consentText, 0);
}

@end
