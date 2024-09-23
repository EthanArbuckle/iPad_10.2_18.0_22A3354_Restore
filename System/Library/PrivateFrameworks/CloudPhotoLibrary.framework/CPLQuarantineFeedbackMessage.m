@implementation CPLQuarantineFeedbackMessage

- (CPLQuarantineFeedbackMessage)initWithClass:(Class)a3 reason:(id)a4 libraryIdentifier:(id)a5
{
  id v8;
  CPLQuarantineFeedbackMessage *v9;
  CPLQuarantineFeedbackMessage *v10;
  uint64_t v11;
  NSString *reason;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLQuarantineFeedbackMessage;
  v9 = -[CPLFeedbackMessage initWithLibraryIdentifier:](&v14, sel_initWithLibraryIdentifier_, a5);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordClass, a3);
    v11 = objc_msgSend(v8, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

  }
  return v10;
}

- (id)serverMessage
{
  void *v3;
  CPLServerFeedbackKeyAndValue *v4;
  Class recordClass;
  id v6;
  CPLServerFeedbackKeyAndValue *v7;
  objc_super v9;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v9.receiver = self;
  v9.super_class = (Class)CPLQuarantineFeedbackMessage;
  -[CPLFeedbackMessage serverMessage](&v9, sel_serverMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  -[CPLServerFeedbackKeyAndValue setKey:](v4, "setKey:", CFSTR("recordType"));
  recordClass = self->_recordClass;
  if (_CPLFeedbackRecordClassForClass_onceToken != -1)
    dispatch_once(&_CPLFeedbackRecordClassForClass_onceToken, &__block_literal_global_2316);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2317;
  v15 = __Block_byref_object_dispose__2318;
  v16 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___CPLFeedbackRecordClassForClass_block_invoke_26;
  block[3] = &unk_1E60D7E20;
  block[4] = &v11;
  block[5] = recordClass;
  dispatch_sync((dispatch_queue_t)_CPLFeedbackRecordClassForClass_queue, block);
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  -[CPLServerFeedbackKeyAndValue setValue:](v4, "setValue:", v6);
  objc_msgSend(v3, "addKeysAndValues:", v4);
  v7 = objc_alloc_init(CPLServerFeedbackKeyAndValue);

  -[CPLServerFeedbackKeyAndValue setKey:](v7, "setKey:", CFSTR("reason"));
  -[CPLServerFeedbackKeyAndValue setValue:](v7, "setValue:", self->_reason);
  objc_msgSend(v3, "addKeysAndValues:", v7);

  return v3;
}

- (NSString)reason
{
  return self->_reason;
}

- (Class)recordClass
{
  return self->_recordClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordClass, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

+ (id)feedbackType
{
  return CFSTR("quarantine");
}

@end
