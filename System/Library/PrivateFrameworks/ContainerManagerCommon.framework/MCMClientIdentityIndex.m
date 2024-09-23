@implementation MCMClientIdentityIndex

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MCMClientIdentityIndex isEqualToClientIdentityIndex:](self, "isEqualToClientIdentityIndex:", v4);

  return v5;
}

- (BOOL)isEqualToClientIdentityIndex:(id)a3
{
  _QWORD *v4;
  NSString *personaUniqueString;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  if (!-[NSData isEqualToData:](self->_auditToken, "isEqualToData:", v4[1])
    || !-[NSData isEqualToData:](self->_proximateAuditToken, "isEqualToData:", v4[2]))
  {
    goto LABEL_8;
  }
  personaUniqueString = self->_personaUniqueString;
  v6 = v4[3];
  if (personaUniqueString)
  {
    if (v6 && -[NSString isEqualToString:](personaUniqueString, "isEqualToString:"))
      goto LABEL_6;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if (v6)
    goto LABEL_8;
LABEL_6:
  v7 = 1;
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger personaUniqueString;

  v3 = -[NSData hash](self->_auditToken, "hash");
  v4 = -[NSData hash](self->_proximateAuditToken, "hash");
  personaUniqueString = (NSUInteger)self->_personaUniqueString;
  if (personaUniqueString)
    personaUniqueString = objc_msgSend((id)personaUniqueString, "hash");
  return v4 ^ v3 ^ personaUniqueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_proximateAuditToken, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MCMClientIdentityIndex *v4;
  NSString *personaUniqueString;
  _OWORD v7[2];
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  -[NSData getBytes:length:](self->_auditToken, "getBytes:length:", &v11, 32);
  v9 = 0u;
  v10 = 0u;
  -[NSData getBytes:length:](self->_proximateAuditToken, "getBytes:length:", &v9, 32);
  v4 = [MCMClientIdentityIndex alloc];
  personaUniqueString = self->_personaUniqueString;
  v8[0] = v11;
  v8[1] = v12;
  v7[0] = v9;
  v7[1] = v10;
  return -[MCMClientIdentityIndex initWithAuditToken:proximateAuditToken:personaUniqueString:](v4, "initWithAuditToken:proximateAuditToken:personaUniqueString:", v8, v7, personaUniqueString);
}

- (MCMClientIdentityIndex)initWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5
{
  id v9;
  MCMClientIdentityIndex *v10;
  uint64_t v11;
  NSData *auditToken;
  uint64_t v13;
  NSData *proximateAuditToken;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MCMClientIdentityIndex;
  v10 = -[MCMClientIdentityIndex init](&v16, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 32);
    v11 = objc_claimAutoreleasedReturnValue();
    auditToken = v10->_auditToken;
    v10->_auditToken = (NSData *)v11;

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, 32);
    v13 = objc_claimAutoreleasedReturnValue();
    proximateAuditToken = v10->_proximateAuditToken;
    v10->_proximateAuditToken = (NSData *)v13;

    objc_storeStrong((id *)&v10->_personaUniqueString, a5);
  }

  return v10;
}

@end
