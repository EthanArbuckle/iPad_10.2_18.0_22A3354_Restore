@implementation CDMSpanMatchProtoResponseCommand

- (CDMSpanMatchProtoResponseCommand)initWithResponse:(id)a3
{
  id v5;
  CDMSpanMatchProtoResponseCommand *v6;
  CDMSpanMatchProtoResponseCommand *v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSArray *v16;
  NSArray *matchingSpansForNL;
  NSArray *v18;
  NSObject *v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CDMSpanMatchProtoResponseCommand;
  v6 = -[CDMBaseCommand init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spanMatchResponse, a3);
    v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "matchingSpansCount"));
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "matchingSpansCount"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "matchingSpans", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (+[CDMSpanMatchUtils isSpanOnlyForExternalParsers:](CDMSpanMatchUtils, "isSpanOnlyForExternalParsers:", v15))
          {
            v16 = v9;
          }
          else
          {
            v16 = v8;
          }
          -[NSArray addObject:](v16, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v12);
    }

    matchingSpansForNL = v7->_matchingSpansForNL;
    v7->_matchingSpansForNL = v8;
    v18 = v8;

    objc_storeStrong((id *)&v7->_matchingSpansForExternalParsers, v9);
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = -[NSArray count](v9, "count");
      *(_DWORD *)buf = 136315394;
      v28 = "-[CDMSpanMatchProtoResponseCommand initWithResponse:]";
      v29 = 2048;
      v30 = v21;
      _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s Filtered %lu spans to only expose to external parsers", buf, 0x16u);
    }

  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BE9E358], "printableSpanMatchResponse:", self->_spanMatchResponse);
}

- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse
{
  return self->_spanMatchResponse;
}

- (void)setSpanMatchResponse:(id)a3
{
  objc_storeStrong((id *)&self->_spanMatchResponse, a3);
}

- (NSArray)matchingSpansForExternalParsers
{
  return self->_matchingSpansForExternalParsers;
}

- (NSArray)matchingSpansForNL
{
  return self->_matchingSpansForNL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingSpansForNL, 0);
  objc_storeStrong((id *)&self->_matchingSpansForExternalParsers, 0);
  objc_storeStrong((id *)&self->_spanMatchResponse, 0);
}

@end
