@implementation CPLInfoFeedbackMessage

- (CPLInfoFeedbackMessage)initWithInfo:(id)a3 libraryIdentifier:(id)a4
{
  id v6;
  CPLInfoFeedbackMessage *v7;
  uint64_t v8;
  NSDictionary *info;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLInfoFeedbackMessage;
  v7 = -[CPLFeedbackMessage initWithLibraryIdentifier:](&v11, sel_initWithLibraryIdentifier_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    info = v7->_info;
    v7->_info = (NSDictionary *)v8;

  }
  return v7;
}

- (id)serverMessage
{
  void *v3;
  NSDictionary *info;
  id v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPLInfoFeedbackMessage;
  -[CPLFeedbackMessage serverMessage](&v9, sel_serverMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  info = self->_info;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__CPLInfoFeedbackMessage_serverMessage__block_invoke;
  v7[3] = &unk_1E60D83B0;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](info, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

void __39__CPLInfoFeedbackMessage_serverMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CPLServerFeedbackKeyAndValue *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  -[CPLServerFeedbackKeyAndValue setKey:](v7, "setKey:", v6);

  -[CPLServerFeedbackKeyAndValue setValue:](v7, "setValue:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addKeysAndValues:", v7);

}

+ (id)feedbackType
{
  return CFSTR("info");
}

@end
