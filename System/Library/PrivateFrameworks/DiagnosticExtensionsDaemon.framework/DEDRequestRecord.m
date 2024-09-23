@implementation DEDRequestRecord

- (DEDRequestRecord)initWithURL:(id)a3 httpMethod:(id)a4 responseData:(id)a5
{
  id v8;
  id v9;
  id v10;
  DEDRequestRecord *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DEDRequestRecord;
  v11 = -[DEDRequestRecord init](&v16, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDRequestRecord setURL:](v11, "setURL:", v12);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDRequestRecord setDate:](v11, "setDate:", v13);

    -[DEDRequestRecord setMethod:](v11, "setMethod:", v9);
    -[DEDRequestRecord setIsFailure:](v11, "setIsFailure:", 0);
    -[DEDRequestRecord formattedBody:error:](v11, "formattedBody:error:", v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDRequestRecord setResponseBody:](v11, "setResponseBody:", v14);

  }
  return v11;
}

- (DEDRequestRecord)initWithRequest:(id)a3 response:(id)a4 session:(id)a5 cookies:(id)a6 body:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  DEDRequestRecord *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *URL;
  NSString *v29;
  uint64_t v30;
  NSDate *date;
  uint64_t v32;
  NSString *method;
  uint64_t v34;
  NSString *requestHeader;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *requestBody;
  uint64_t v40;
  NSString *responseHeader;
  uint64_t v42;
  NSString *responseBody;
  id v45;
  objc_super v46;

  v14 = a3;
  v15 = a8;
  v46.receiver = self;
  v46.super_class = (Class)DEDRequestRecord;
  v45 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = -[DEDRequestRecord init](&v46, sel_init);
  objc_msgSend(v14, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "query");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "path");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v21)
  {
    objc_msgSend(v14, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "query");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("%@%@"), CFSTR("?"), v26);
    v27 = objc_claimAutoreleasedReturnValue();
    URL = v19->_URL;
    v19->_URL = (NSString *)v27;

  }
  else
  {
    v29 = v19->_URL;
    v19->_URL = (NSString *)v23;
    v24 = v29;
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v30 = objc_claimAutoreleasedReturnValue();
  date = v19->_date;
  v19->_date = (NSDate *)v30;

  objc_msgSend(v14, "HTTPMethod");
  v32 = objc_claimAutoreleasedReturnValue();
  method = v19->_method;
  v19->_method = (NSString *)v32;

  v19->_isFailure = v15 != 0;
  -[DEDRequestRecord formattedRequestHeader:session:cookies:](v19, "formattedRequestHeader:session:cookies:", v14, v17, v16);
  v34 = objc_claimAutoreleasedReturnValue();

  requestHeader = v19->_requestHeader;
  v19->_requestHeader = (NSString *)v34;

  objc_msgSend(v14, "HTTPBody");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v14, "HTTPBody");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDRequestRecord formattedBody:error:](v19, "formattedBody:error:", v37, v15);
    v38 = objc_claimAutoreleasedReturnValue();
    requestBody = v19->_requestBody;
    v19->_requestBody = (NSString *)v38;

  }
  else
  {
    v37 = v19->_requestBody;
    v19->_requestBody = (NSString *)&stru_24D1E6AF0;
  }

  -[DEDRequestRecord formattedResponseHeader:](v19, "formattedResponseHeader:", v18);
  v40 = objc_claimAutoreleasedReturnValue();

  responseHeader = v19->_responseHeader;
  v19->_responseHeader = (NSString *)v40;

  -[DEDRequestRecord formattedBody:error:](v19, "formattedBody:error:", v45, v15);
  v42 = objc_claimAutoreleasedReturnValue();

  responseBody = v19->_responseBody;
  v19->_responseBody = (NSString *)v42;

  return v19;
}

- (id)formattedResponseHeader:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = objc_msgSend(v3, "statusCode");
  objc_msgSend(MEMORY[0x24BDD15B8], "localizedStringForStatusCode:", objc_msgSend(v3, "statusCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%ld %@\n"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "allHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_msgSend(v3, "allHeaderFields");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("%@: %@\n"), v13, v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)formattedRequestHeader:(id)a3 session:(id)a4 cookies:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43 = a5;
  v9 = (void *)MEMORY[0x24BDD16A8];
  objc_msgSend(v7, "HTTPMethod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@\n"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v7;
  objc_msgSend(v7, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR("Host: %@\n"), v15);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v45 = v8;
  objc_msgSend(v8, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "HTTPAdditionalHeaders");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v55 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v45, "configuration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "HTTPAdditionalHeaders");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@: %@\n"), v22, v25);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v19);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = v43;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "value");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@: %@\n"), v32, v33);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v28);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v44, "allHTTPHeaderFields");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
        objc_msgSend(v44, "valueForHTTPHeaderField:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@: %@\n"), v39, v40);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v36);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v13);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)formattedBody:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v9)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 1, &v14);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      if (v11)
      {
        v12 = v11;
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);

LABEL_8:
        goto LABEL_9;
      }
    }
    else
    {
      v10 = v5;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
    goto LABEL_8;
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
LABEL_9:

  return v8;
}

- (NSString)URL
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)method
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMethod:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)runtime
{
  return self->_runtime;
}

- (void)setRuntime:(int64_t)a3
{
  self->_runtime = a3;
}

- (BOOL)isFailure
{
  return self->_isFailure;
}

- (void)setIsFailure:(BOOL)a3
{
  self->_isFailure = a3;
}

- (NSString)requestHeader
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)requestBody
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)responseHeader
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResponseHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)responseBody
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResponseBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_responseHeader, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
