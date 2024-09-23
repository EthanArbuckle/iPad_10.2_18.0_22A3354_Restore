@implementation IMDSuggestions

- (IMDSuggestions)init
{
  IMDSuggestions *v2;
  uint64_t v3;
  NSObject *sgService;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)IMDSuggestions;
  v2 = -[IMDSuggestions init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D19970], "serviceForMessages");
    v3 = objc_claimAutoreleasedReturnValue();
    sgService = v2->_sgService;
    v2->_sgService = v3;

  }
  return v2;
}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  -[IMDSuggestions sgService](self, "sgService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestionsFromMessage:options:completionHandler:", v8, a4, v9);

}

- (id)suggestionsService:(id)a3 needsContextForConversationIdentifier:(id)a4 numberOfMessagesNeeded:(unint64_t)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSObject)sgService
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setSgService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sgService, 0);
}

@end
