@implementation NRDevicePairingManagerInfo

- (NRDevicePairingManagerInfo)init
{
  NRDevicePairingManagerInfo *v2;
  NRDevicePairingManagerInfo *v3;
  void *v4;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NRDevicePairingManagerInfo;
  v2 = -[NRDevicePairingManagerInfo init](&v17, sel_init);
  if (!v2)
  {
    v6 = nrCopyLogObj_1090();
    v7 = v6;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v15 = _os_log_pack_fill();
        *(_DWORD *)v15 = 136446210;
        *(_QWORD *)(v15 + 4) = "-[NRDevicePairingManagerInfo init]";
        v16 = nrCopyLogObj_1090();
        _NRLogAbortWithPack(v16);
      }
    }
    v9 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v10, v11, v12, v13, v14, (uint64_t)");

    goto LABEL_8;
  }
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingManagerInfo setUuid:](v3, "setUuid:", v4);

  return v3;
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NRDevicePairingManagerInfo uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v5);

  -[NRDevicePairingManagerInfo identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setIdentifier:", v7);

  -[NRDevicePairingManagerInfo pairingCriteria](self, "pairingCriteria");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v4, "setPairingCriteria:", v9);

  -[NRDevicePairingManagerInfo metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v4, "setMetadata:", v11);

  return v4;
}

- (NRDevicePairingManagerInfo)initWithCoder:(id)a3
{
  id v4;
  NRDevicePairingManagerInfo *v5;
  NRDevicePairingManagerInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NRDevicePairingManagerInfo;
  v5 = -[NRDevicePairingManagerInfo init](&v23, sel_init);
  if (!v5)
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
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v21 = _os_log_pack_fill();
        *(_DWORD *)v21 = 136446210;
        *(_QWORD *)(v21 + 4) = "-[NRDevicePairingManagerInfo initWithCoder:]";
        v22 = nrCopyLogObj_1090();
        _NRLogAbortWithPack(v22);
      }
    }
    v15 = nrCopyLogObj_1090();
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v16, v17, v18, v19, v20, (uint64_t)");

    goto LABEL_8;
  }
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingManagerInfo setUuid:](v6, "setUuid:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingManagerInfo setIdentifier:](v6, "setIdentifier:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingCriteria"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingManagerInfo setPairingCriteria:](v6, "setPairingCriteria:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevicePairingManagerInfo setMetadata:](v6, "setMetadata:", v10);

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
  -[NRDevicePairingManagerInfo uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  -[NRDevicePairingManagerInfo identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[NRDevicePairingManagerInfo pairingCriteria](self, "pairingCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pairingCriteria"));

  -[NRDevicePairingManagerInfo metadata](self, "metadata");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("metadata"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NRDevicePairingManagerInfo uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
    -[NRDevicePairingManagerInfo uuid](self, "uuid");
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NRDevicePairingManagerInfo uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("NRDevicePairingManager[%@]"), v4);

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

  -[NRDevicePairingManagerInfo description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NRDevicePairingManagerInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NRDevicePairingManagerInfo identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" Identifier %@"), v6);

  }
  -[NRDevicePairingManagerInfo metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NRDevicePairingManagerInfo metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" Metadata %@"), v8);

  }
  -[NRDevicePairingManagerInfo pairingCriteria](self, "pairingCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" Pairing Criteria %@"), v9);

  return (NSString *)v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NRDevicePairingCriteria)pairingCriteria
{
  return self->_pairingCriteria;
}

- (void)setPairingCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_pairingCriteria, a3);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_pairingCriteria, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
