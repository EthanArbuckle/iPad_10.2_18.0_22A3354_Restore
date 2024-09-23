@implementation NRDevicePairingCandidate

- (id)initInternalWithUUID:(id)a3
{
  id v5;
  NRDevicePairingCandidate *v6;
  NRDevicePairingCandidate *v7;
  NRDevicePairingCandidate *v8;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v10 = nrCopyLogObj_1090();
    v11 = v10;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = os_log_type_enabled(v10, OS_LOG_TYPE_FAULT);

      if (!v23)
      {
LABEL_15:
        v8 = 0;
        goto LABEL_4;
      }
    }
    v24 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v24, 17, (uint64_t)"%s called with null uuid", v25, v26, v27, v28, v29, (uint64_t)"-[NRDevicePairingCandidate initInternalWithUUID:]");

    goto LABEL_15;
  }
  v30.receiver = self;
  v30.super_class = (Class)NRDevicePairingCandidate;
  v6 = -[NRDevicePairingCandidate init](&v30, sel_init);
  if (!v6)
  {
    v12 = nrCopyLogObj_1090();
    v13 = v12;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v14 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (!v14)
      {
LABEL_12:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v21 = _os_log_pack_fill();
        *(_DWORD *)v21 = 136446210;
        *(_QWORD *)(v21 + 4) = "-[NRDevicePairingCandidate initInternalWithUUID:]";
        v22 = nrCopyLogObj_1090();
        _NRLogAbortWithPack(v22);
      }
    }
    v15 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v16, v17, v18, v19, v20, (uint64_t)");

    goto LABEL_12;
  }
  v7 = v6;
  objc_storeStrong((id *)&v6->_uuid, a3);
  self = v7;
  v8 = self;
LABEL_4:

  return v8;
}

- (id)initInternal
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NRDevicePairingCandidate initInternalWithUUID:](self, "initInternalWithUUID:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NRDevicePairingCandidate uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initInternalWithUUID:", v5);

  if (v6)
  {
    -[NRDevicePairingCandidate identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v6, "setIdentifier:", v8);

    -[NRDevicePairingCandidate metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v6, "setMetadata:", v10);

    -[NRDevicePairingCandidate cbUUID](self, "cbUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCbUUID:", v11);

  }
  return v6;
}

- (NRDevicePairingCandidate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NRDevicePairingCandidate *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NRDevicePairingCandidate initInternalWithUUID:](self, "initInternalWithUUID:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDevicePairingCandidate setIdentifier:](v6, "setIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDevicePairingCandidate setMetadata:](v6, "setMetadata:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cbUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NRDevicePairingCandidate setCbUUID:](v6, "setCbUUID:", v9);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NRDevicePairingCandidate uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  -[NRDevicePairingCandidate identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[NRDevicePairingCandidate metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("metadata"));

  -[NRDevicePairingCandidate cbUUID](self, "cbUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cbUUID"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[NRDevicePairingCandidate uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NRDevicePairingCandidate uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NRDevicePairingCandidate uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("NRDevicePairingCandidate[%@]"), v4);

  return v5;
}

- (NSString)fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NRDevicePairingCandidate description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NRDevicePairingCandidate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NRDevicePairingCandidate identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" Identifier %@"), v6);

  }
  -[NRDevicePairingCandidate metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NRDevicePairingCandidate metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" Metadata %@"), v8);

  }
  -[NRDevicePairingCandidate cbUUID](self, "cbUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NRDevicePairingCandidate cbUUID](self, "cbUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" CBUUID %@"), v10);

  }
  return (NSString *)v4;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)cbUUID
{
  return self->_cbUUID;
}

- (void)setCbUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_cbUUID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
