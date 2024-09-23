@implementation DAMailboxFetchSearchResultRequest

- (id)initRequestForBodyFormat:(int)a3 withLongID:(id)a4 withBodySizeLimit:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  DAMailboxFetchSearchResultRequest *v9;
  void *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DAMailboxFetchSearchResultRequest;
  v9 = -[DAMailboxFetchSearchResultRequest init](&v12, sel_init);
  if (v9)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    -[DAMailboxFetchSearchResultRequest setLongID:](v9, "setLongID:", v10);

    -[DAMailboxFetchSearchResultRequest setBodyFormat:](v9, "setBodyFormat:", v6);
    -[DAMailboxFetchSearchResultRequest setMaxSize:](v9, "setMaxSize:", v5);
  }

  return v9;
}

- (id)initRequestForBodyFormat:(int)a3 withFolderID:(id)a4 withServerID:(id)a5 withLongID:(id)a6 withBodySizeLimit:(int)a7
{
  uint64_t v7;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  DAMailboxFetchSearchResultRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v7 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DAMailboxFetchSearchResultRequest;
  v15 = -[DAMailboxFetchSearchResultRequest init](&v20, sel_init);
  if (v15)
  {
    v16 = (void *)objc_msgSend(v12, "copy");
    -[DAMailboxFetchSearchResultRequest setFolderID:](v15, "setFolderID:", v16);

    v17 = (void *)objc_msgSend(v13, "copy");
    -[DAMailboxFetchSearchResultRequest setServerID:](v15, "setServerID:", v17);

    v18 = (void *)objc_msgSend(v14, "copy");
    -[DAMailboxFetchSearchResultRequest setLongID:](v15, "setLongID:", v18);

    -[DAMailboxFetchSearchResultRequest setBodyFormat:](v15, "setBodyFormat:", v10);
    -[DAMailboxFetchSearchResultRequest setMaxSize:](v15, "setMaxSize:", v7);
  }

  return v15;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DAMailboxFetchSearchResultRequest longID](self, "longID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%d\n%d"), v4, -[DAMailboxFetchSearchResultRequest maxSize](self, "maxSize"), -[DAMailboxFetchSearchResultRequest bodyFormat](self, "bodyFormat"));

  v6 = objc_msgSend(v5, "hash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  int v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[DAMailboxFetchSearchResultRequest longID](self, "longID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "longID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[DAMailboxFetchSearchResultRequest longID](self, "longID"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "longID"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v11 = objc_msgSend(v7, "maxSize");
      if (v11 == -[DAMailboxFetchSearchResultRequest maxSize](self, "maxSize"))
      {
        v12 = objc_msgSend(v7, "bodyFormat");
        v10 = v12 == -[DAMailboxFetchSearchResultRequest bodyFormat](self, "bodyFormat");
      }
      else
      {
        v10 = 0;
      }
      if (v8 == v9)
        goto LABEL_11;
    }
    else
    {
      v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)DAMailboxFetchSearchResultRequest;
  -[DAMailboxFetchSearchResultRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailboxFetchSearchResultRequest longID](self, "longID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ longID \"%@\", maxSize %d, bodyFormat %d"), v4, v5, -[DAMailboxFetchSearchResultRequest maxSize](self, "maxSize"), -[DAMailboxFetchSearchResultRequest bodyFormat](self, "bodyFormat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)longID
{
  return self->_longID;
}

- (void)setLongID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)folderID
{
  return self->_folderID;
}

- (void)setFolderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)serverID
{
  return self->_serverID;
}

- (void)setServerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)bodyFormat
{
  return self->_bodyFormat;
}

- (void)setBodyFormat:(int)a3
{
  self->_bodyFormat = a3;
}

- (int)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int)a3
{
  self->_maxSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverID, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_longID, 0);
}

@end
