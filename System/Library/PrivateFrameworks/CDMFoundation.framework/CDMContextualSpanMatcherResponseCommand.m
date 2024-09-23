@implementation CDMContextualSpanMatcherResponseCommand

- (CDMContextualSpanMatcherResponseCommand)initWithContextualSpanMatcherResponse:(id)a3
{
  id v5;
  CDMContextualSpanMatcherResponseCommand *v6;
  CDMContextualSpanMatcherResponseCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMContextualSpanMatcherResponseCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contextualSpanMatcherResponse, a3);

  return v7;
}

- (CDMContextualSpanMatcherResponseCommand)initWithMentions:(id)a3
{
  id v4;
  CDMContextualSpanMatcherResponseCommand *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDMContextualSpanMatcherResponseCommand;
  v5 = -[CDMBaseCommand init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE9E1B8]);
    objc_storeStrong((id *)&v5->_contextualSpanMatcherResponse, v6);
    if (v4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v6, "addContextualSpans:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v9);
      }

    }
  }

  return v5;
}

- (SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse)contextualSpanMatcherResponse
{
  return self->_contextualSpanMatcherResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualSpanMatcherResponse, 0);
}

@end
