@implementation ASDBetaAppFeedbackMetadata

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), self->_version, self->_email);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  ASDBetaAppFeedbackMetadata *v5;
  uint64_t v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;

  v5 = (ASDBetaAppFeedbackMetadata *)a3;
  if (self == v5)
  {
    v7 = 1;
    goto LABEL_5;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[ASDBetaAppFeedbackMetadata incidentID](self, "incidentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (-[ASDBetaAppFeedbackMetadata incidentID](v5, "incidentID"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[ASDBetaAppFeedbackMetadata incidentID](self, "incidentID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDBetaAppFeedbackMetadata incidentID](v5, "incidentID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (v9)
      {

        if (!v12)
          goto LABEL_3;
      }
      else
      {

        if ((v12 & 1) == 0)
          goto LABEL_3;
      }
    }
    -[ASDBetaAppFeedbackMetadata email](self, "email");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      || (-[ASDBetaAppFeedbackMetadata email](v5, "email"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[ASDBetaAppFeedbackMetadata email](self, "email");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDBetaAppFeedbackMetadata email](v5, "email");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if (v13)
      {

        if (!v16)
          goto LABEL_3;
      }
      else
      {

        if ((v16 & 1) == 0)
          goto LABEL_3;
      }
    }
    -[ASDBetaAppFeedbackMetadata version](self, "version");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDBetaAppFeedbackMetadata version](v5, "version");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v17, "isEqual:", v18);

    goto LABEL_5;
  }
LABEL_3:
  v7 = 0;
LABEL_5:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *incidentID;
  id v5;

  incidentID = self->_incidentID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", incidentID, CFSTR("A"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_email, CFSTR("B"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("C"));

}

- (ASDBetaAppFeedbackMetadata)initWithCoder:(id)a3
{
  id v4;
  ASDBetaAppFeedbackMetadata *v5;
  uint64_t v6;
  NSString *incidentID;
  uint64_t v8;
  NSString *email;
  uint64_t v10;
  ASDBetaAppVersion *version;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDBetaAppFeedbackMetadata;
  v5 = -[ASDBetaAppFeedbackMetadata init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("A"));
    v6 = objc_claimAutoreleasedReturnValue();
    incidentID = v5->_incidentID;
    v5->_incidentID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("B"));
    v8 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("C"));
    v10 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (ASDBetaAppVersion *)v10;

  }
  return v5;
}

- (NSString)incidentID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIncidentID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)email
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmail:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (ASDBetaAppVersion)version
{
  return (ASDBetaAppVersion *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_incidentID, 0);
}

@end
