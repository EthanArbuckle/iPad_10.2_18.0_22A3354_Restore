@implementation NEProfilePayloadBase

- (NEProfilePayloadBase)initWithPayload:(id)a3
{
  NSDictionary *v4;
  NEProfilePayloadBase *v5;
  NSDictionary *payloadAtom;
  objc_super v8;

  v4 = (NSDictionary *)a3;
  v8.receiver = self;
  v8.super_class = (Class)NEProfilePayloadBase;
  v5 = -[NEProfilePayloadBase init](&v8, sel_init);
  payloadAtom = v5->_payloadAtom;
  v5->_payloadAtom = v4;

  return v5;
}

- (id)validatePayload
{
  NSObject *v3;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ne_log_large_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[NEProfilePayloadBase payloadAtom](self, "payloadAtom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@: NEProfilePayloadBase validatePayload should be overriden, dict %@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

- (id)getPreprocessedPayloadContents
{
  return 0;
}

- (BOOL)setPostprocessedPayloadContents:(id)a3
{
  return 1;
}

- (BOOL)addCertificatePending:(id)a3 certificateTag:(id)a4
{
  return -[NEProfilePayloadBase addCertificatePending:certificateTag:accessGroup:](self, "addCertificatePending:certificateTag:accessGroup:", a3, a4, 0);
}

- (BOOL)addCertificatePending:(id)a3 certificateTag:(id)a4 accessGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingCertificates;
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_pendingCertificates
    || (v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4),
        pendingCertificates = self->_pendingCertificates,
        self->_pendingCertificates = v11,
        pendingCertificates,
        self->_pendingCertificates))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("PayloadUUID"));
    if (v10)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("AccessGroup"));
    -[NSMutableDictionary setObject:forKey:](self->_pendingCertificates, "setObject:forKey:", v13, v9);

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSDictionary)payloadAtom
{
  return self->_payloadAtom;
}

- (void)setPayloadAtom:(id)a3
{
  objc_storeStrong((id *)&self->_payloadAtom, a3);
}

- (NSMutableDictionary)pendingCertificates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPendingCertificates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)pluginUpgradeInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPluginUpgradeInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginUpgradeInfo, 0);
  objc_storeStrong((id *)&self->_pendingCertificates, 0);
  objc_storeStrong((id *)&self->_payloadAtom, 0);
}

@end
