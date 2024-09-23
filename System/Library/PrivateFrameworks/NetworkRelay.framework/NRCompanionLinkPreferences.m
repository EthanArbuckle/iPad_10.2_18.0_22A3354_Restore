@implementation NRCompanionLinkPreferences

- (id)initInternalWithServiceClass:(unsigned __int8)a3 highThroughout:(BOOL)a4 includeP2P:(BOOL)a5
{
  id result;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)NRCompanionLinkPreferences;
  result = -[NRCompanionLinkPreferences init](&v21, sel_init);
  if (!result)
  {
    v10 = nrCopyLogObj_433();
    v11 = v10;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v12 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (!v12)
      {
LABEL_9:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v19 = _os_log_pack_fill();
        *(_DWORD *)v19 = 136446210;
        *(_QWORD *)(v19 + 4) = "-[NRCompanionLinkPreferences initInternalWithServiceClass:highThroughout:includeP2P:]";
        v20 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v20);
      }
    }
    v13 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v13, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v14, v15, v16, v17, v18, (uint64_t)");

    goto LABEL_9;
  }
  do
    v9 = __ldxr(&initInternalWithServiceClass_highThroughout_includeP2P__sNRLinkID);
  while (__stxr(v9 + 1, &initInternalWithServiceClass_highThroughout_includeP2P__sNRLinkID));
  *((_QWORD *)result + 2) = v9;
  *((_BYTE *)result + 11) = a3;
  *((_BYTE *)result + 9) = a4;
  *((_BYTE *)result + 10) = a5;
  return result;
}

- (NRCompanionLinkPreferences)initWithServiceClass:(unsigned __int8)a3
{
  return (NRCompanionLinkPreferences *)-[NRCompanionLinkPreferences initInternalWithServiceClass:highThroughout:includeP2P:](self, "initInternalWithServiceClass:highThroughout:includeP2P:", a3, 0, 0);
}

- (id)initForHighThroughputWithServiceClass:(unsigned __int8)a3 includeP2P:(BOOL)a4
{
  return -[NRCompanionLinkPreferences initInternalWithServiceClass:highThroughout:includeP2P:](self, "initInternalWithServiceClass:highThroughout:includeP2P:", a3, 1, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  unsigned __int8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NRCompanionLinkPreferences;
  v4 = -[NRLinkPreferences copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = -[NRCompanionLinkPreferences serviceClass](self, "serviceClass");
  if (v4)
  {
    v4[11] = v5;
    v4[9] = -[NRCompanionLinkPreferences highThroughput](self, "highThroughput");
    v4[10] = -[NRCompanionLinkPreferences includeP2P](self, "includeP2P");
  }
  else
  {
    -[NRCompanionLinkPreferences highThroughput](self, "highThroughput");
    -[NRCompanionLinkPreferences includeP2P](self, "includeP2P");
  }
  return v4;
}

- (id)copyShortDescription
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = *(_QWORD *)&self->_highThroughput;
  v5 = *(&self->super._linkType + 3);
  if (v5 >= 6)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%u)"), v5);
  else
    v6 = *(&off_1EA3F7D30 + *(&self->super._linkType + 3));
  if (*(&self->super._linkType + 1))
    v7 = " ht";
  else
    v7 = "";
  if (*(&self->super._linkType + 2))
    v8 = " p2p";
  else
    v8 = "";
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%llu %@%s%s"), v4, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  NRCompanionLinkPreferences *v4;
  NRCompanionLinkPreferences *v5;
  NRCompanionLinkPreferences *v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;

  v4 = (NRCompanionLinkPreferences *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = *(&self->super._linkType + 1);
    if (v7 == -[NRCompanionLinkPreferences highThroughput](v6, "highThroughput")
      && (v8 = *(&self->super._linkType + 2), v8 == -[NRCompanionLinkPreferences includeP2P](v6, "includeP2P")))
    {
      v9 = *(&self->super._linkType + 3);
      v10 = v9 == -[NRCompanionLinkPreferences serviceClass](v6, "serviceClass");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)highThroughput
{
  return *(&self->super._linkType + 1);
}

- (BOOL)includeP2P
{
  return *(&self->super._linkType + 2);
}

- (unsigned)serviceClass
{
  return *(&self->super._linkType + 3);
}

@end
