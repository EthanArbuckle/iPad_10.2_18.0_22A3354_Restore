@implementation AKCompanionKeyEnvelope

- (AKCompanionKeyEnvelope)initWithUsername:(id)a3 altDSID:(id)a4 machineID:(id)a5 continuationKey:(id)a6 passwordResetKey:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AKCompanionKeyEnvelope *v17;
  AKCompanionKeyEnvelope *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)AKCompanionKeyEnvelope;
  v17 = -[AKCompanionKeyEnvelope init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_username, a3);
    objc_storeStrong((id *)&v18->_altDSID, a4);
    objc_storeStrong((id *)&v18->_machineID, a5);
    objc_storeStrong((id *)&v18->_continuationKey, a6);
    objc_storeStrong((id *)&v18->_passwordResetKey, a7);
  }

  return v18;
}

- (AKCompanionKeyEnvelope)initWithAltDSID:(id)a3 machineID:(id)a4 continuationKey:(id)a5 passwordResetKey:(id)a6
{
  return -[AKCompanionKeyEnvelope initWithUsername:altDSID:machineID:continuationKey:passwordResetKey:](self, "initWithUsername:altDSID:machineID:continuationKey:passwordResetKey:", 0, a3, a4, a5, a6);
}

- (AKCompanionKeyEnvelope)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  AKCompanionKeyEnvelope *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("machineID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("continuationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passwordResetKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v6 || !v7 || !v8 || !v9)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKCompanionKeyEnvelope initWithCoder:].cold.1((uint64_t)v4, v11);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v12);

  }
  v13 = -[AKCompanionKeyEnvelope initWithUsername:altDSID:machineID:continuationKey:passwordResetKey:](self, "initWithUsername:altDSID:machineID:continuationKey:passwordResetKey:", v5, v6, v7, v8, v10);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AKCompanionKeyEnvelope username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("username"));

  -[AKCompanionKeyEnvelope altDSID](self, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("altDSID"));

  -[AKCompanionKeyEnvelope machineID](self, "machineID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("machineID"));

  -[AKCompanionKeyEnvelope continuationKey](self, "continuationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("continuationKey"));

  -[AKCompanionKeyEnvelope passwordResetKey](self, "passwordResetKey");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("passwordResetKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKCompanionKeyEnvelope *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AKCompanionKeyEnvelope *v14;
  void *v16;

  v4 = [AKCompanionKeyEnvelope alloc];
  -[AKCompanionKeyEnvelope username](self, "username");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v16, "copy");
  -[AKCompanionKeyEnvelope altDSID](self, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[AKCompanionKeyEnvelope machineID](self, "machineID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[AKCompanionKeyEnvelope continuationKey](self, "continuationKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[AKCompanionKeyEnvelope passwordResetKey](self, "passwordResetKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  v14 = -[AKCompanionKeyEnvelope initWithUsername:altDSID:machineID:continuationKey:passwordResetKey:](v4, "initWithUsername:altDSID:machineID:continuationKey:passwordResetKey:", v5, v7, v9, v11, v13);

  return v14;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (NSString)continuationKey
{
  return self->_continuationKey;
}

- (NSString)passwordResetKey
{
  return self->_passwordResetKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordResetKey, 0);
  objc_storeStrong((id *)&self->_continuationKey, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Failed to decode companion key envelope with coder (%@)", (uint8_t *)&v2, 0xCu);
}

@end
