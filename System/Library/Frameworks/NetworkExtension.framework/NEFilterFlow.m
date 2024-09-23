@implementation NEFilterFlow

- (NEFilterFlow)initWithCoder:(id)a3
{
  id v4;
  NEFilterFlow *v5;
  uint64_t v6;
  NEFilterAbsoluteVerdict *currentVerdict;
  uint64_t v8;
  NSURL *URL;
  uint64_t v10;
  NSUUID *flowUUID;
  uint64_t v12;
  NSString *sourceAppIdentifier;
  uint64_t v14;
  NSString *sourceAppVersion;
  uint64_t v16;
  NSData *sourceAppUniqueIdentifier;
  uint64_t v18;
  NSData *crypto_signature;
  uint64_t v20;
  NSData *sourceAppAuditToken;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEFilterFlow;
  v5 = -[NEFilterFlow init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentVerdict"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentVerdict = v5->_currentVerdict;
    v5->_currentVerdict = (NEFilterAbsoluteVerdict *)v6;

    v5->_isRemediationFlow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRemediationFlow"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v8 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flowUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    flowUUID = v5->_flowUUID;
    v5->_flowUUID = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    sourceAppIdentifier = v5->_sourceAppIdentifier;
    v5->_sourceAppIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceAppVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceAppVersion = v5->_sourceAppVersion;
    v5->_sourceAppVersion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppUniqueIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    sourceAppUniqueIdentifier = v5->_sourceAppUniqueIdentifier;
    v5->_sourceAppUniqueIdentifier = (NSData *)v16;

    v5->_pid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("PID"));
    v5->_epid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("EPID"));
    v5->_inBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("inBytes"));
    v5->_outBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("OutBytes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cryptoSignature"));
    v18 = objc_claimAutoreleasedReturnValue();
    crypto_signature = v5->_crypto_signature;
    v5->_crypto_signature = (NSData *)v18;

    v5->_sourceAppIdentifierFromApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sourceAppSigningIdentifierFromApp"));
    v5->_direction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppAuditToken"));
    v20 = objc_claimAutoreleasedReturnValue();
    sourceAppAuditToken = v5->_sourceAppAuditToken;
    v5->_sourceAppAuditToken = (NSData *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  _BOOL8 isRemediationFlow;
  void *v6;
  const char *v7;
  id Property;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 sourceAppIdentifierFromApp;
  void *v14;
  id v15;

  v15 = a3;
  if (self)
  {
    objc_msgSend(v15, "encodeObject:forKey:", objc_getProperty(self, v4, 104, 1), CFSTR("currentVerdict"));
    isRemediationFlow = self->_isRemediationFlow;
  }
  else
  {
    objc_msgSend(v15, "encodeObject:forKey:", 0, CFSTR("currentVerdict"));
    isRemediationFlow = 0;
  }
  objc_msgSend(v15, "encodeBool:forKey:", isRemediationFlow, CFSTR("isRemediationFlow"));
  -[NEFilterFlow URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("URL"));

  if (self)
    Property = objc_getProperty(self, v7, 120, 1);
  else
    Property = 0;
  objc_msgSend(v15, "encodeObject:forKey:", Property, CFSTR("flowUUID"));
  -[NEFilterFlow sourceAppIdentifier](self, "sourceAppIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("sourceAppIdentifier"));

  -[NEFilterFlow sourceAppVersion](self, "sourceAppVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("SourceAppVersion"));

  -[NEFilterFlow sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("sourceAppUniqueIdentifier"));

  objc_msgSend(v15, "encodeInt:forKey:", -[NEFilterFlow pid](self, "pid"), CFSTR("PID"));
  objc_msgSend(v15, "encodeInt:forKey:", -[NEFilterFlow epid](self, "epid"), CFSTR("EPID"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[NEFilterFlow inBytes](self, "inBytes"), CFSTR("inBytes"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[NEFilterFlow outBytes](self, "outBytes"), CFSTR("OutBytes"));
  -[NEFilterFlow crypto_signature](self, "crypto_signature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("cryptoSignature"));

  if (self)
    sourceAppIdentifierFromApp = self->_sourceAppIdentifierFromApp;
  else
    sourceAppIdentifierFromApp = 0;
  objc_msgSend(v15, "encodeBool:forKey:", sourceAppIdentifierFromApp, CFSTR("sourceAppSigningIdentifierFromApp"));
  objc_msgSend(v15, "encodeInteger:forKey:", -[NEFilterFlow direction](self, "direction"), CFSTR("direction"));
  -[NEFilterFlow sourceAppAuditToken](self, "sourceAppAuditToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("sourceAppAuditToken"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  id Property;
  BOOL isRemediationFlow;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL sourceAppIdentifierFromApp;
  void *v21;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (self)
  {
    Property = objc_getProperty(self, v5, 104, 1);
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  Property = 0;
  if (v4)
LABEL_3:
    objc_setProperty_atomic((id)v6, v5, Property, 104);
LABEL_4:
  if (self)
  {
    isRemediationFlow = self->_isRemediationFlow;
    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  isRemediationFlow = 0;
  if (v6)
LABEL_6:
    *(_BYTE *)(v6 + 10) = isRemediationFlow;
LABEL_7:
  -[NEFilterFlow URL](self, "URL", Property);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  if (self)
    v12 = objc_getProperty(self, v11, 120, 1);
  else
    v12 = 0;
  objc_storeStrong((id *)(v6 + 120), v12);
  -[NEFilterFlow sourceAppIdentifier](self, "sourceAppIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  -[NEFilterFlow sourceAppVersion](self, "sourceAppVersion");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v15;

  -[NEFilterFlow sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v17;

  objc_msgSend((id)v6, "setPid:", -[NEFilterFlow pid](self, "pid"));
  objc_msgSend((id)v6, "setEpid:", -[NEFilterFlow epid](self, "epid"));
  objc_msgSend((id)v6, "setInBytes:", -[NEFilterFlow inBytes](self, "inBytes"));
  objc_msgSend((id)v6, "setOutBytes:", -[NEFilterFlow outBytes](self, "outBytes"));
  -[NEFilterFlow crypto_signature](self, "crypto_signature");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "setCrypto_signature:", v19);

  if (self)
    sourceAppIdentifierFromApp = self->_sourceAppIdentifierFromApp;
  else
    sourceAppIdentifierFromApp = 0;
  *(_BYTE *)(v6 + 13) = sourceAppIdentifierFromApp;
  objc_msgSend((id)v6, "setDirection:", -[NEFilterFlow direction](self, "direction"));
  -[NEFilterFlow sourceAppAuditToken](self, "sourceAppAuditToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "setSourceAppAuditToken:", v21);

  return (id)v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const char *v15;
  id Property;
  void *v17;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NEFilterFlow identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("identifier"), v5, a4);

  -[NEFilterFlow URL](self, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("hostname"), v5, a4 | 1);

  -[NEFilterFlow sourceAppIdentifier](self, "sourceAppIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("sourceAppIdentifier"), v5, a4);

  -[NEFilterFlow sourceAppVersion](self, "sourceAppVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("sourceAppVersion"), v5, a4);

  -[NEFilterFlow sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("sourceAppUniqueIdentifier"), v5, a4);

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterFlow pid](self, "pid"), CFSTR("procPID"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterFlow epid](self, "epid"), CFSTR("eprocPID"), v5, a4);
  if (-[NEFilterFlow direction](self, "direction") == NETrafficDirectionInbound)
  {
    v14 = CFSTR("inbound");
  }
  else
  {
    if (-[NEFilterFlow direction](self, "direction") != NETrafficDirectionOutbound)
      goto LABEL_6;
    v14 = CFSTR("outbound");
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("direction"), v5, a4);
LABEL_6:
  if (self)
    Property = objc_getProperty(self, v15, 104, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("currentVerdict"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterFlow inBytes](self, "inBytes"), CFSTR("inBytes"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterFlow outBytes](self, "outBytes"), CFSTR("outBytes"), v5, a4);
  -[NEFilterFlow crypto_signature](self, "crypto_signature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("signature"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEFilterFlow descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 1, 0);
}

- (NEFilterFlow)init
{
  NEFilterFlow *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEFilterFlow;
  result = -[NEFilterFlow init](&v3, sel_init);
  if (result)
    result->_isRemediationFlow = 0;
  return result;
}

- (NEFilterFlow)initWithURL:(id)a3 sourceAppIdentifier:(id)a4
{
  id v7;
  id v8;
  NEFilterFlow *v9;
  NEFilterFlow *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[NEFilterFlow init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_sourceAppIdentifier, a4);
  }

  return v10;
}

- (NSUUID)identifier
{
  if (self)
    self = (NEFilterFlow *)objc_getProperty(self, a2, 120, 1);
  return (NSUUID *)self;
}

- (NSString)identifierString
{
  if (self)
    self = (NEFilterFlow *)objc_getProperty(self, a2, 120, 1);
  return (NSString *)-[NEFilterFlow description](self, "description");
}

- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6
{
  return 1;
}

- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  return 1;
}

- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  return 1;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSData)sourceAppUniqueIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourceAppUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)sourceAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSourceAppIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)sourceAppVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSourceAppVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NETrafficDirection)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (NSData)sourceAppAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSourceAppAuditToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSData)sourceProcessAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSourceProcessAuditToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)inBytes
{
  return self->_inBytes;
}

- (void)setInBytes:(unint64_t)a3
{
  self->_inBytes = a3;
}

- (unint64_t)outBytes
{
  return self->_outBytes;
}

- (void)setOutBytes:(unint64_t)a3
{
  self->_outBytes = a3;
}

- (BOOL)inputComplete
{
  return self->_inputComplete;
}

- (void)setInputComplete:(BOOL)a3
{
  self->_inputComplete = a3;
}

- (BOOL)outputComplete
{
  return self->_outputComplete;
}

- (void)setOutputComplete:(BOOL)a3
{
  self->_outputComplete = a3;
}

- (NSData)crypto_signature
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCrypto_signature:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int)epid
{
  return self->_epid;
}

- (void)setEpid:(int)a3
{
  self->_epid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_savedMessageHandlerQueue, 0);
  objc_storeStrong((id *)&self->_flowUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentVerdict, 0);
  objc_storeStrong((id *)&self->_crypto_signature, 0);
  objc_storeStrong((id *)&self->_sourceProcessAuditToken, 0);
  objc_storeStrong((id *)&self->_sourceAppAuditToken, 0);
  objc_storeStrong((id *)&self->_sourceAppVersion, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)updateCurrentVerdictFromDataVerdict:(unint64_t)a3 direction:
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  SEL v10;
  SEL v11;
  uint64_t v12;
  const char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  SEL v23;
  SEL v24;
  id Property;
  uint64_t v26;
  SEL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  SEL v36;
  uint64_t v37;
  SEL v38;
  id v40;
  int v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  v7 = 0;
  if (!a1 || !v5)
    goto LABEL_28;
  if (!objc_msgSend(v5, "drop"))
  {
    v12 = objc_msgSend(v6, "passBytes");
    v14 = a3 & 0xFFFFFFFFFFFFFFFDLL;
    if (v12 == -1)
    {
      if (!v14)
      {
        objc_msgSend(objc_getProperty(a1, v13, 104, 1), "setInboundPassOffset:", -1);
        objc_msgSend(objc_getProperty(a1, v23, 104, 1), "setInboundPeekOffset:", 0);
      }
      if (a3 > 1)
        goto LABEL_27;
      objc_msgSend(objc_getProperty(a1, v13, 104, 1), "setOutboundPassOffset:", -1);
      Property = objc_getProperty(a1, v24, 104, 1);
      v26 = 0;
    }
    else
    {
      if (!v14)
      {
        v15 = objc_msgSend(objc_getProperty(a1, v13, 104, 1), "inboundPassOffset");
        v16 = objc_msgSend(v6, "passBytes");
        v17 = v15 + v16;
        if (__CFADD__(v15, v16) || (v18 = objc_msgSend(v6, "peekBytes"), v20 = v17 + v18, __CFADD__(v17, v18)))
        {
          ne_log_obj();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v41 = 138412546;
            v42 = v6;
            v43 = 2112;
            v44 = objc_getProperty(a1, v22, 104, 1);
            _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "Inbound data verdict %@ causes overflow in current verdict %@", (uint8_t *)&v41, 0x16u);
          }

        }
        else
        {
          objc_msgSend(objc_getProperty(a1, v19, 104, 1), "setInboundPassOffset:", v17);
          objc_msgSend(objc_getProperty(a1, v27, 104, 1), "setInboundPeekOffset:", v20);
        }
      }
      if (a3 > 1)
        goto LABEL_27;
      v28 = objc_msgSend(objc_getProperty(a1, v13, 104, 1), "outboundPassOffset");
      v29 = objc_msgSend(v6, "passBytes");
      v30 = v28 + v29;
      if (__CFADD__(v28, v29) || (v31 = objc_msgSend(v6, "peekBytes"), v33 = v30 + v31, __CFADD__(v30, v31)))
      {
        ne_log_obj();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v40 = objc_getProperty(a1, v35, 104, 1);
          v41 = 138412546;
          v42 = v6;
          v43 = 2112;
          v44 = v40;
          _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, "Outbound data verdict %@ causes overflow in current verdict %@", (uint8_t *)&v41, 0x16u);
        }

        goto LABEL_27;
      }
      objc_msgSend(objc_getProperty(a1, v32, 104, 1), "setOutboundPassOffset:", v30);
      Property = objc_getProperty(a1, v36, 104, 1);
      v26 = v33;
    }
    objc_msgSend(Property, "setOutboundPeekOffset:", v26);
LABEL_27:
    v37 = objc_msgSend(v6, "statisticsReportFrequency");
    objc_msgSend(objc_getProperty(a1, v38, 104, 1), "setStatisticsReportFrequency:", v37);
    v7 = (uint64_t)-[NEFilterFlow shouldCloseWithVerdict:](a1, v6);
    goto LABEL_28;
  }
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "identifierString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138412290;
    v42 = v9;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "Dropping flow %@", (uint8_t *)&v41, 0xCu);

  }
  v7 = 1;
  objc_msgSend(objc_getProperty(a1, v10, 104, 1), "setDrop:", 1);
  objc_msgSend(objc_getProperty(a1, v11, 104, 1), "setStatisticsReportFrequency:", 0);
LABEL_28:

  return v7;
}

- (_BYTE)shouldCloseWithVerdict:(_BYTE *)a1
{
  const char *v3;
  id v4;
  const char *v5;
  const char *v6;

  v4 = a2;
  if (a1)
  {
    if (objc_msgSend(objc_getProperty(a1, v3, 104, 1), "inboundPassOffset") != -1
      || objc_msgSend(objc_getProperty(a1, v5, 104, 1), "outboundPassOffset") != -1
      || objc_msgSend(objc_getProperty(a1, v6, 104, 1), "statisticsReportFrequency")
      || (a1[12] & 1) != 0)
    {
      a1 = 0;
    }
    else
    {
      a1 = (_BYTE *)(objc_msgSend(v4, "shouldReport") ^ 1);
    }
  }

  return a1;
}

- (void)updateSourceAppInfoWithCompletionHandler:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;

  v3 = a2;
  +[NEAppInfoCache sharedAppInfoCache]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_11;
  }
  v5 = a1;
  objc_msgSend(v5, "euuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "euuid");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v5, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NEGetNullUUID();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
      {
        objc_msgSend(v5, "euuid");
        v13 = objc_claimAutoreleasedReturnValue();
        NEGetNullUUID();
        v14 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v13;
        v15 = (void *)v13;
        v16 = (void *)v14;
        if ((objc_msgSend(v15, "isEqual:", v14) & 1) == 0)
        {
          objc_msgSend(v5, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "euuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v23, "isEqual:", v21);

          if ((v22 & 1) == 0)
          {
            v20 = objc_msgSend(v5, "pid");
            if (v20 == objc_msgSend(v5, "epid"))
              objc_msgSend(v5, "setEpid:", 0);
          }
          goto LABEL_9;
        }

      }
    }

  }
LABEL_9:

LABEL_11:
  v17 = objc_msgSend(a1, "epid");
  objc_msgSend(a1, "sourceAppIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__NEFilterFlow_updateSourceAppInfoWithCompletionHandler___block_invoke;
  v25[3] = &unk_1E3CC0478;
  v25[4] = a1;
  v19 = v3;
  v26 = v19;
  -[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:](v4, v17, v6, v18, v25);

}

void __57__NEFilterFlow_updateSourceAppInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  void *v14;
  __int16 v15[8];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3[3];
    objc_msgSend(*(id *)(a1 + 32), "sourceAppIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = 1;
    else
      v7 = v5 == 0;
    if (v7)
    {

    }
    else if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setSourceAppIdentifier:", v5);
    }
    v9 = (__CFString *)v4[4];
    v10 = v9;
    if (!v9 || (v11 = -[__CFString length](v9, "length"), v12 = v10, !v11))
      v12 = &stru_1E3CC53C8;
    objc_msgSend(*(id *)(a1 + 32), "setSourceAppVersion:", v12);
    v13 = v4[5];
    v14 = v13;
    if (v13 && objc_msgSend(v13, "length"))
      objc_msgSend(*(id *)(a1 + 32), "setSourceAppUniqueIdentifier:", v14);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Could not find app info, return the original flow without filling in app info", (uint8_t *)v15, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
