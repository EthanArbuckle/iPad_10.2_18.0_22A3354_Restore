@implementation MGRemoteQueryClientHandlerQuery

+ (id)handlerWithQuery:(id)a3 forGroupsQueryAgent:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithQuery:groupsQueryAgent:", v7, v6);

  return v8;
}

- (id)_initWithQuery:(id)a3 groupsQueryAgent:(id)a4
{
  id v7;
  id v8;
  MGRemoteQueryClientHandlerQuery *v9;
  MGRemoteQueryClientHandlerQuery *v10;
  MGGroupsMediator *v11;
  MGGroupsMediator *groupsMediator;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MGRemoteQueryClientHandlerQuery;
  v9 = -[MGRemoteQueryClientHandlerQuery init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    v10->_seenInitialResponse = 0;
    v11 = -[MGGroupsMediator initWithGroupsQueryAgent:]([MGGroupsMediator alloc], "initWithGroupsQueryAgent:", v8);
    groupsMediator = v10->_groupsMediator;
    v10->_groupsMediator = v11;

  }
  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientHandlerQuery query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryClientHandlerQuery groupsMediator](self, "groupsMediator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _query = %@, _mediator = %p>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)prepareURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "setPath:", 0x24E0ABF20);
  objc_msgSend(v11, "queryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  v6 = (void *)MEMORY[0x24BDD1838];
  -[MGRemoteQueryClientHandlerQuery query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", 0x24E0ABF60, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  objc_msgSend(v11, "setQueryItems:", v5);
}

- (BOOL)validateResponse:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[MGRemoteQueryClientHandlerQuery seenInitialResponse](self, "seenInitialResponse");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDE1220]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForHTTPHeaderField:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8 = objc_msgSend(CFSTR("application/json; charset=utf8"), "isEqual:", v7);
  }
  else
  {
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("multipart/x-mixed-replace;"));
    -[MGRemoteQueryClientHandlerQuery setSeenInitialResponse:](self, "setSeenInitialResponse:", 1);
  }

  return v8;
}

- (id)handleCompleteResponse:(id)a3 jsonPayload:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  MGRemoteQueryClientHandlerQuery *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[4];

  v51[1] = *MEMORY[0x24BDAC8D0];
  +[MGRemoteQueryReply rq_instanceFromCoded:](MGRemoteQueryReply, "rq_instanceFromCoded:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      MGLogForCategory(6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v43 = self;
        v44 = 2112;
        v45 = 0;
        _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p client handler received error in query reply %@", buf, 0x16u);
      }

      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BDD1128];
      v50 = *MEMORY[0x24BDD1398];
      v51[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 104, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v12;
    }
    else
    {
      objc_msgSend(v6, "groups");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MGRemoteQueryClientHandlerQuery groupsMediator](self, "groupsMediator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MGLogForCategory(6);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        v43 = self;
        v44 = 2048;
        v45 = objc_msgSend(v15, "count");
        v46 = 2048;
        v47 = v16;
        v48 = 2112;
        v49 = v15;
        _os_log_impl(&dword_21CBD2000, v17, OS_LOG_TYPE_DEFAULT, "%p client handler receiving %lu groups into %p: %@", buf, 0x2Au);
      }

      objc_msgSend(v16, "currentGroups");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startActivityWithName:", CFSTR("Remote Query"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v18, "allValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v37 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v16, "removeGroup:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v22);
      }

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v25 = v15;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v33 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_msgSend(v30, "rq_setSourcedRemotely:", 1, (_QWORD)v32);
            objc_msgSend(v16, "addGroup:", v30);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v27);
      }

      objc_msgSend(v16, "endActivity:", v19);
      v13 = 0;
    }

  }
  else
  {
    MGLogForCategory(6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v43 = self;
      _os_log_error_impl(&dword_21CBD2000, v14, OS_LOG_TYPE_ERROR, "%p client handler received malformed query payload content", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 94, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (MGOutstandingQuery)query
{
  return self->_query;
}

- (BOOL)seenInitialResponse
{
  return self->_seenInitialResponse;
}

- (void)setSeenInitialResponse:(BOOL)a3
{
  self->_seenInitialResponse = a3;
}

- (MGGroupsMediator)groupsMediator
{
  return self->_groupsMediator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsMediator, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
