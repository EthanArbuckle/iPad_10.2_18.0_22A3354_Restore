@implementation ENLinkedNotebookRef

- (ENLinkedNotebookRef)initWithCoder:(id)a3
{
  id v4;
  ENLinkedNotebookRef *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ENLinkedNotebookRef;
  v5 = -[ENLinkedNotebookRef init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("guid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENLinkedNotebookRef setGuid:](v5, "setGuid:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("noteStoreUrl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENLinkedNotebookRef setNoteStoreUrl:](v5, "setNoteStoreUrl:", v7);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("shardId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENLinkedNotebookRef setShardId:](v5, "setShardId:", v8);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sharedNotebookGlobalId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENLinkedNotebookRef setSharedNotebookGlobalId:](v5, "setSharedNotebookGlobalId:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ENLinkedNotebookRef guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("guid"));

  -[ENLinkedNotebookRef noteStoreUrl](self, "noteStoreUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("noteStoreUrl"));

  -[ENLinkedNotebookRef shardId](self, "shardId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("shardId"));

  -[ENLinkedNotebookRef sharedNotebookGlobalId](self, "sharedNotebookGlobalId");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sharedNotebookGlobalId"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  ENLinkedNotebookRef *v5;
  ENLinkedNotebookRef *v6;
  ENLinkedNotebookRef *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = (ENLinkedNotebookRef *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[ENLinkedNotebookRef guid](v7, "guid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENLinkedNotebookRef guid](self, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 != v9)
        {
          -[ENLinkedNotebookRef guid](v7, "guid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENLinkedNotebookRef guid](self, "guid");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v10;
          if (!objc_msgSend(v10, "isEqualToString:", v3))
          {
            v11 = 0;
            goto LABEL_26;
          }
        }
        -[ENLinkedNotebookRef noteStoreUrl](v7, "noteStoreUrl");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENLinkedNotebookRef noteStoreUrl](self, "noteStoreUrl");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v13)
        {
          -[ENLinkedNotebookRef noteStoreUrl](v7, "noteStoreUrl");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENLinkedNotebookRef noteStoreUrl](self, "noteStoreUrl");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "isEqualToString:"))
          {
            v11 = 0;
LABEL_24:

LABEL_25:
            if (v8 == v9)
            {
LABEL_27:

              goto LABEL_28;
            }
LABEL_26:

            goto LABEL_27;
          }
          v30 = v14;
        }
        -[ENLinkedNotebookRef shardId](v7, "shardId");
        v15 = objc_claimAutoreleasedReturnValue();
        -[ENLinkedNotebookRef shardId](self, "shardId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)v15;
        if ((void *)v15 == v16)
        {
          v26 = v13;
          v27 = v12;
        }
        else
        {
          -[ENLinkedNotebookRef shardId](v7, "shardId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENLinkedNotebookRef shardId](self, "shardId");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v17;
          if (!objc_msgSend(v17, "isEqualToString:"))
          {
            v11 = 0;
            v23 = v31;
            goto LABEL_22;
          }
          v26 = v13;
          v27 = v12;
        }
        -[ENLinkedNotebookRef sharedNotebookGlobalId](v7, "sharedNotebookGlobalId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENLinkedNotebookRef sharedNotebookGlobalId](self, "sharedNotebookGlobalId");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v18 == (void *)v19)
        {

          v11 = 1;
        }
        else
        {
          v20 = (void *)v19;
          -[ENLinkedNotebookRef sharedNotebookGlobalId](v7, "sharedNotebookGlobalId");
          v25 = v3;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENLinkedNotebookRef sharedNotebookGlobalId](self, "sharedNotebookGlobalId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v21, "isEqualToString:", v22);

          v3 = v25;
        }
        v23 = v31;
        v13 = v26;
        v12 = v27;
        if (v31 == v16)
        {
LABEL_23:

          v14 = v30;
          if (v12 == v13)
            goto LABEL_25;
          goto LABEL_24;
        }
LABEL_22:

        goto LABEL_23;
      }
    }
    v11 = 0;
  }
LABEL_28:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[ENLinkedNotebookRef guid](self, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ENLinkedNotebookRef noteStoreUrl](self, "noteStoreUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[ENLinkedNotebookRef shardId](self, "shardId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[ENLinkedNotebookRef sharedNotebookGlobalId](self, "sharedNotebookGlobalId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8 + 923521;

  return v10;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSString)noteStoreUrl
{
  return self->_noteStoreUrl;
}

- (void)setNoteStoreUrl:(id)a3
{
  objc_storeStrong((id *)&self->_noteStoreUrl, a3);
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setShardId:(id)a3
{
  objc_storeStrong((id *)&self->_shardId, a3);
}

- (NSString)sharedNotebookGlobalId
{
  return self->_sharedNotebookGlobalId;
}

- (void)setSharedNotebookGlobalId:(id)a3
{
  objc_storeStrong((id *)&self->_sharedNotebookGlobalId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedNotebookGlobalId, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

+ (id)linkedNotebookRefFromLinkedNotebook:(id)a3
{
  id v3;
  ENLinkedNotebookRef *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(ENLinkedNotebookRef);
  objc_msgSend(v3, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENLinkedNotebookRef setGuid:](v4, "setGuid:", v5);

  objc_msgSend(v3, "noteStoreUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENLinkedNotebookRef setNoteStoreUrl:](v4, "setNoteStoreUrl:", v6);

  objc_msgSend(v3, "shardId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENLinkedNotebookRef setShardId:](v4, "setShardId:", v7);

  objc_msgSend(v3, "sharedNotebookGlobalId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENLinkedNotebookRef setSharedNotebookGlobalId:](v4, "setSharedNotebookGlobalId:", v8);
  return v4;
}

@end
