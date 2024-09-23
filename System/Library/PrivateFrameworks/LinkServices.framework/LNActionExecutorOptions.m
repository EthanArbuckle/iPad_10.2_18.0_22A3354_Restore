@implementation LNActionExecutorOptions

- (LNActionExecutorOptions)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  LNEnvironment *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LNActionExecutorOptions;
  v2 = -[LNActionExecutorOptions init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    *((_WORD *)v2 + 7) = 0;
    *(_OWORD *)(v2 + 40) = xmmword_1A19BCB50;
    v2[9] = 1;
    v5 = -[LNEnvironment initWithLocaleIdentifier:]([LNEnvironment alloc], "initWithLocaleIdentifier:", CFSTR("en"));
    v6 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v5;

    v7 = objc_opt_new();
    v8 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v7;

    *((_QWORD *)v2 + 10) = LNConnectionOperationRequestTimeout;
    v2[12] = 0;
    v9 = v2;
  }

  return (LNActionExecutorOptions *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[LNActionExecutorOptions executionUUID](self, "executionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setExecutionUUID:", v5);

  -[LNActionExecutorOptions clientLabel](self, "clientLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setClientLabel:", v6);

  objc_msgSend((id)v4, "setSource:", -[LNActionExecutorOptions source](self, "source"));
  -[LNActionExecutorOptions sourceOverride](self, "sourceOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setSourceOverride:", v7);

  objc_msgSend((id)v4, "setKind:", -[LNActionExecutorOptions kind](self, "kind"));
  objc_msgSend((id)v4, "setInteractionMode:", -[LNActionExecutorOptions interactionMode](self, "interactionMode"));
  -[LNActionExecutorOptions viewActionIdentifier](self, "viewActionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setViewActionIdentifier:", v8);

  objc_msgSend((id)v4, "setDonateToTranscript:", -[LNActionExecutorOptions donateToTranscript](self, "donateToTranscript"));
  -[LNActionExecutorOptions environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setEnvironment:", v9);

  -[LNActionExecutorOptions systemContext](self, "systemContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setSystemContext:", v10);

  -[LNActionExecutorOptions connectionOperationTimeout](self, "connectionOperationTimeout");
  objc_msgSend((id)v4, "setConnectionOperationTimeout:");
  objc_msgSend((id)v4, "setAllowsPrepareBeforePerform:", -[LNActionExecutorOptions allowsPrepareBeforePerform](self, "allowsPrepareBeforePerform"));
  objc_msgSend((id)v4, "setRequestUnlockIfNeeded:", -[LNActionExecutorOptions requestUnlockIfNeeded](self, "requestUnlockIfNeeded"));
  objc_msgSend((id)v4, "setPreferNoticePresentation:", -[LNActionExecutorOptions preferNoticePresentation](self, "preferNoticePresentation"));
  *(_BYTE *)(v4 + 8) = self->_oneShotForSpringBoardOnly;
  objc_storeStrong((id *)(v4 + 88), self->_exportedContentConfiguration);
  return (id)v4;
}

- (id)description
{
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  unsigned int v11;
  __CFString *v12;
  int64_t v13;
  __CFString *v14;
  unint64_t v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;

  v29 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  -[LNActionExecutorOptions executionUUID](self, "executionUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[LNActionExecutorOptions clientLabel](self, "clientLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LNActionExecutorOptions source](self, "source");
  if (v7 > 0xA)
    v8 = CFSTR("Application");
  else
    v8 = *(&off_1E45DBE20 + v7);
  v9 = v8;
  -[LNActionExecutorOptions sourceOverride](self, "sourceOverride");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  if (!v10)
  {
    v11 = -[LNActionExecutorOptions source](self, "source");
    if (v11 > 0xA)
      v12 = CFSTR("Application");
    else
      v12 = *(&off_1E45DBE20 + v11);
    v10 = v12;
  }
  v13 = -[LNActionExecutorOptions kind](self, "kind");
  v14 = CFSTR("Unknown");
  if (v13 == 1)
    v14 = CFSTR("Custom Shortcut");
  if (v13 == 2)
    v14 = CFSTR("App Shortcut");
  v27 = v14;
  v15 = -[LNActionExecutorOptions interactionMode](self, "interactionMode") - 1;
  v30 = (void *)v5;
  v31 = (void *)v4;
  v28 = v9;
  if (v15 > 3)
    v16 = CFSTR("unknown");
  else
    v16 = off_1E45DC7B8[v15];
  -[LNActionExecutorOptions viewActionIdentifier](self, "viewActionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LNActionExecutorOptions donateToTranscript](self, "donateToTranscript"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  -[LNActionExecutorOptions environment](self, "environment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionExecutorOptions systemContext](self, "systemContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LNActionExecutorOptions allowsPrepareBeforePerform](self, "allowsPrepareBeforePerform"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  if (-[LNActionExecutorOptions requestUnlockIfNeeded](self, "requestUnlockIfNeeded"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  if (-[LNActionExecutorOptions preferNoticePresentation](self, "preferNoticePresentation"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@: %p, executionUUID: %@, clientLabel: %@, source: %@, sourceOverride: %@, kind: %@, interactionMode: %@, viewActionIdentifier: %@, donateToTranscript: %@, environment: %@, systemContext: %@, allowsPrepareBeforePerform: %@, requestUnlockIfNeeded: %@, preferNoticePresentation: %@>"), v31, self, v30, v6, v28, v10, v27, v16, v17, v18, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[LNActionExecutorOptions executionUUID](self, "executionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("executionUUID"));

  -[LNActionExecutorOptions clientLabel](self, "clientLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("clientLabel"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionExecutorOptions source](self, "source"), CFSTR("source"));
  -[LNActionExecutorOptions sourceOverride](self, "sourceOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sourceOverride"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionExecutorOptions kind](self, "kind"), CFSTR("kind"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionExecutorOptions interactionMode](self, "interactionMode"), CFSTR("interactionMode"));
  -[LNActionExecutorOptions viewActionIdentifier](self, "viewActionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("viewActionIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions donateToTranscript](self, "donateToTranscript"), CFSTR("donateToTranscript"));
  -[LNActionExecutorOptions environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("environment"));

  -[LNActionExecutorOptions systemContext](self, "systemContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("systemContext"));

  -[LNActionExecutorOptions connectionOperationTimeout](self, "connectionOperationTimeout");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("connectionOperationTimeout"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions allowsPrepareBeforePerform](self, "allowsPrepareBeforePerform"), CFSTR("allowsPrepareBeforePerform"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions requestUnlockIfNeeded](self, "requestUnlockIfNeeded"), CFSTR("requestUnlockIfNeeded"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionExecutorOptions preferNoticePresentation](self, "preferNoticePresentation"), CFSTR("preferNoticePresentation"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_oneShotForSpringBoardOnly, CFSTR("oneShotForSpringBoardOnly"));
  -[LNActionExecutorOptions exportedContentConfiguration](self, "exportedContentConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("exportedContentConfiguration"));

}

- (LNActionExecutorOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LNActionExecutorOptions *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[LNActionExecutorOptions init](self, "init");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executionUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutorOptions setExecutionUUID:](self, "setExecutionUUID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutorOptions setClientLabel:](self, "setClientLabel:", v7);

    -[LNActionExecutorOptions setSource:](self, "setSource:", (unsigned __int16)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceOverride"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutorOptions setSourceOverride:](self, "setSourceOverride:", v8);

    -[LNActionExecutorOptions setKind:](self, "setKind:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kind")));
    -[LNActionExecutorOptions setInteractionMode:](self, "setInteractionMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interactionMode")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("viewActionIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutorOptions setViewActionIdentifier:](self, "setViewActionIdentifier:", v9);

    -[LNActionExecutorOptions setDonateToTranscript:](self, "setDonateToTranscript:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("donateToTranscript")));
    -[LNActionExecutorOptions setEnvironment:](self, "setEnvironment:", v5);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutorOptions setSystemContext:](self, "setSystemContext:", v10);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("connectionOperationTimeout"));
    -[LNActionExecutorOptions setConnectionOperationTimeout:](self, "setConnectionOperationTimeout:");
    -[LNActionExecutorOptions setAllowsPrepareBeforePerform:](self, "setAllowsPrepareBeforePerform:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsPrepareBeforePerform")));
    -[LNActionExecutorOptions setRequestUnlockIfNeeded:](self, "setRequestUnlockIfNeeded:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestUnlockIfNeeded")));
    -[LNActionExecutorOptions setPreferNoticePresentation:](self, "setPreferNoticePresentation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preferNoticePresentation")));
    self->_oneShotForSpringBoardOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("oneShotForSpringBoardOnly"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exportedContentConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutorOptions setExportedContentConfiguration:](self, "setExportedContentConfiguration:", v11);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSUUID)executionUUID
{
  return self->_executionUUID;
}

- (void)setExecutionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientLabel
{
  return self->_clientLabel;
}

- (void)setClientLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned __int16)a3
{
  self->_source = a3;
}

- (NSString)sourceOverride
{
  return self->_sourceOverride;
}

- (void)setSourceOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (int64_t)interactionMode
{
  return self->_interactionMode;
}

- (void)setInteractionMode:(int64_t)a3
{
  self->_interactionMode = a3;
}

- (NSNumber)viewActionIdentifier
{
  return self->_viewActionIdentifier;
}

- (void)setViewActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)donateToTranscript
{
  return self->_donateToTranscript;
}

- (void)setDonateToTranscript:(BOOL)a3
{
  self->_donateToTranscript = a3;
}

- (BOOL)requestUnlockIfNeeded
{
  return self->_requestUnlockIfNeeded;
}

- (void)setRequestUnlockIfNeeded:(BOOL)a3
{
  self->_requestUnlockIfNeeded = a3;
}

- (LNEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (LNSystemContext)systemContext
{
  return self->_systemContext;
}

- (void)setSystemContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)allowsPrepareBeforePerform
{
  return self->_allowsPrepareBeforePerform;
}

- (void)setAllowsPrepareBeforePerform:(BOOL)a3
{
  self->_allowsPrepareBeforePerform = a3;
}

- (double)connectionOperationTimeout
{
  return self->_connectionOperationTimeout;
}

- (void)setConnectionOperationTimeout:(double)a3
{
  self->_connectionOperationTimeout = a3;
}

- (LNExportedContentConfiguration)exportedContentConfiguration
{
  return self->_exportedContentConfiguration;
}

- (void)setExportedContentConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)preferNoticePresentation
{
  return self->_preferNoticePresentation;
}

- (void)setPreferNoticePresentation:(BOOL)a3
{
  self->_preferNoticePresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedContentConfiguration, 0);
  objc_storeStrong((id *)&self->_systemContext, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_viewActionIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceOverride, 0);
  objc_storeStrong((id *)&self->_clientLabel, 0);
  objc_storeStrong((id *)&self->_executionUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setOneShotForSpringBoardOnly:(BOOL)a3
{
  self->_oneShotForSpringBoardOnly = a3;
}

- (BOOL)oneShotForSpringBoardOnly
{
  return self->_oneShotForSpringBoardOnly;
}

@end
