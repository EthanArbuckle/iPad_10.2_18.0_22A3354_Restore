@implementation CPLResetFeedbackMessage

- (CPLResetFeedbackMessage)initWithResetType:(id)a3 reason:(id)a4 uuid:(id)a5 libraryIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  CPLResetFeedbackMessage *v13;
  uint64_t v14;
  NSString *resetType;
  uint64_t v16;
  NSString *reason;
  uint64_t v18;
  NSString *uuid;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CPLResetFeedbackMessage;
  v13 = -[CPLFeedbackMessage initWithLibraryIdentifier:](&v21, sel_initWithLibraryIdentifier_, a6);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    resetType = v13->_resetType;
    v13->_resetType = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    uuid = v13->_uuid;
    v13->_uuid = (NSString *)v18;

  }
  return v13;
}

- (id)serverMessage
{
  void *v3;
  CPLServerFeedbackKeyAndValue *v4;
  CPLServerFeedbackKeyAndValue *v5;
  CPLServerFeedbackKeyAndValue *v6;
  const __CFString *uuid;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLResetFeedbackMessage;
  -[CPLFeedbackMessage serverMessage](&v9, sel_serverMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  -[CPLServerFeedbackKeyAndValue setKey:](v4, "setKey:", CFSTR("resetType"));
  -[CPLServerFeedbackKeyAndValue setValue:](v4, "setValue:", self->_resetType);
  objc_msgSend(v3, "addKeysAndValues:", v4);
  v5 = objc_alloc_init(CPLServerFeedbackKeyAndValue);

  -[CPLServerFeedbackKeyAndValue setKey:](v5, "setKey:", CFSTR("reason"));
  -[CPLServerFeedbackKeyAndValue setValue:](v5, "setValue:", self->_reason);
  objc_msgSend(v3, "addKeysAndValues:", v5);
  v6 = objc_alloc_init(CPLServerFeedbackKeyAndValue);

  -[CPLServerFeedbackKeyAndValue setKey:](v6, "setKey:", CFSTR("resetUUID"));
  if (self->_uuid)
    uuid = (const __CFString *)self->_uuid;
  else
    uuid = CFSTR("none");
  -[CPLServerFeedbackKeyAndValue setValue:](v6, "setValue:", uuid);
  objc_msgSend(v3, "addKeysAndValues:", v6);

  return v3;
}

- (NSString)resetType
{
  return self->_resetType;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_resetType, 0);
}

+ (id)feedbackType
{
  return CFSTR("reset");
}

@end
