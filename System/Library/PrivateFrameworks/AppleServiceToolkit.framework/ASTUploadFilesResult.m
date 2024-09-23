@implementation ASTUploadFilesResult

+ (id)resultFromSource:(id)a3 andUploadDictionaries:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  ASTUploadFilesCertsEntry *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ASTUploadFilesItemEntry *v20;
  ASTUploadFilesResult *v21;
  id v23;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v29)
  {
    v26 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cert"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_opt_class();
          v9 = &stru_24F96AF90;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("certString"));
            v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v28, "containsObject:", v9) & 1) == 0)
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pubKeyDigest"));
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sigAlgo"));
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = -[ASTUploadFilesCertsEntry initWithCert:andPubKeyDigest:andSigAlgo:]([ASTUploadFilesCertsEntry alloc], "initWithCert:andPubKeyDigest:andSigAlgo:", v9, v10, v11);
                objc_msgSend(v28, "addObject:", v9);
                objc_msgSend(v24, "addObject:", v12);

              }
            }
          }
        }
        else
        {
          v9 = &stru_24F96AF90;
        }
        v30 = (__CFString *)v9;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sig"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pubKeyDigest"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("status"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("size"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("uploadUrl"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[ASTUploadFilesItemEntry initWithId:andName:andSig:andPubKeyDigest:andStatus:andSize:andUploadUrl:]([ASTUploadFilesItemEntry alloc], "initWithId:andName:andSig:andPubKeyDigest:andStatus:andSize:andUploadUrl:", v13, v14, v15, v16, v17, v18, v19);
        objc_msgSend(v27, "addObject:", v20);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v29);
  }

  v21 = -[ASTUploadFilesResult initWithSource:andCerts:andFiles:]([ASTUploadFilesResult alloc], "initWithSource:andCerts:andFiles:", v23, v24, v27);
  return v21;
}

- (ASTUploadFilesResult)initWithSource:(id)a3 andCerts:(id)a4 andFiles:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASTUploadFilesResult *v12;
  ASTUploadFilesResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASTUploadFilesResult;
  v12 = -[ASTUploadFilesResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_source, a3);
    objc_storeStrong((id *)&v13->_certs, a4);
    objc_storeStrong((id *)&v13->_files, a5);
  }

  return v13;
}

- (id)generatePayload
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  ASTUploadFilesResult *v36;
  id obj;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[7];
  _QWORD v59[7];
  _BYTE v60[128];
  _QWORD v61[3];
  _QWORD v62[3];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v36 = self;
  -[ASTUploadFilesResult certs](self, "certs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v53 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v8, "sigAlgo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v8, "sigAlgo");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v61[0] = CFSTR("cert");
        objc_msgSend(v8, "certString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = v11;
        v61[1] = CFSTR("pubKeyDigest");
        objc_msgSend(v8, "pubKeyDigest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v61[2] = CFSTR("sigAlgo");
        v62[1] = v12;
        v62[2] = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "addObject:", v13);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v5);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[ASTUploadFilesResult files](v36, "files");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v41)
  {
    v38 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        v58[0] = CFSTR("id");
        objc_msgSend(v15, "uploadId");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v15, "uploadId");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v17 = objc_claimAutoreleasedReturnValue();
        v59[0] = v17;
        v58[1] = CFSTR("name");
        objc_msgSend(v15, "name");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v15, "name");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = objc_claimAutoreleasedReturnValue();
        v59[1] = v19;
        v58[2] = CFSTR("sig");
        objc_msgSend(v15, "sig");
        v20 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v16;
        if (v20)
          objc_msgSend(v15, "sig");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v21 = objc_claimAutoreleasedReturnValue();
        v59[2] = v21;
        v58[3] = CFSTR("pubKeyDigest");
        objc_msgSend(v15, "pubKeyDigest");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)v18;
        v46 = (void *)v17;
        if (v22)
          objc_msgSend(v15, "pubKeyDigest");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v59[3] = v23;
        v58[4] = CFSTR("status");
        objc_msgSend(v15, "status");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)v20;
        v44 = (void *)v19;
        if (v24)
          objc_msgSend(v15, "status");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v59[4] = v25;
        v58[5] = CFSTR("size");
        objc_msgSend(v15, "size");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)v21;
        if (v26)
          objc_msgSend(v15, "size");
        else
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v59[5] = v27;
        v58[6] = CFSTR("uploadUrl");
        objc_msgSend(v15, "uploadUrl");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v15, "uploadUrl");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v59[6] = v29;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 7);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "addObject:", v30);
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v41);
  }

  v56[0] = CFSTR("source");
  -[ASTUploadFilesResult source](v36, "source");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v31;
  v56[1] = CFSTR("certs");
  v32 = (void *)objc_msgSend(v40, "copy");
  v57[1] = v32;
  v56[2] = CFSTR("files");
  v33 = (void *)objc_msgSend(v39, "copy");
  v57[2] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[ASTUploadFilesResult files](self, "files");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTUploadFilesResult)initWithCoder:(id)a3
{
  id v4;
  ASTUploadFilesResult *v5;
  uint64_t v6;
  NSArray *certs;
  uint64_t v8;
  NSArray *files;

  v4 = a3;
  v5 = -[ASTUploadFilesResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certs"));
    v6 = objc_claimAutoreleasedReturnValue();
    certs = v5->_certs;
    v5->_certs = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("files"));
    v8 = objc_claimAutoreleasedReturnValue();
    files = v5->_files;
    v5->_files = (NSArray *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASTUploadFilesResult certs](self, "certs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("certs"));

  -[ASTUploadFilesResult files](self, "files");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("files"));

}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSArray)certs
{
  return self->_certs;
}

- (void)setCerts:(id)a3
{
  objc_storeStrong((id *)&self->_certs, a3);
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_certs, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
