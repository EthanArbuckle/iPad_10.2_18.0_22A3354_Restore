@implementation CDMMentionResolverResponseCommand

- (CDMMentionResolverResponseCommand)initWithResponse:(id)a3
{
  id v4;
  CDMMentionResolverResponseCommand *v5;
  uint64_t v6;
  SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *response;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMMentionResolverResponseCommand;
  v5 = -[CDMBaseCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *)v6;

  }
  return v5;
}

- (CDMMentionResolverResponseCommand)initWithMentions:(id)a3
{
  id v4;
  CDMMentionResolverResponseCommand *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *response;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CDMMentionResolverResponseCommand;
  v5 = -[CDMBaseCommand init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE9E228]);
    if (v4)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v6, "addMentions:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v9);
      }

    }
    response = v5->_response;
    v5->_response = (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse *)v6;

  }
  return v5;
}

- (SIRINLUINTERNALMENTION_RESOLVERMentionResolverResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
