@implementation DOCNodeThumbnailIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong(&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong(&self->_nodeIdentifier, 0);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  -[DOCNodeThumbnailIdentifier nodeIdentifier](self, "nodeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[DOCNodeThumbnailIdentifier modificationDate](self, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[DOCNodeThumbnailIdentifier contentVersion](self, "contentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  v9 = -[DOCNodeThumbnailIdentifier folderType](self, "folderType") - v8 + 32 * v8;
  if (-[DOCNodeThumbnailIdentifier isTopLevelSharedItem](self, "isTopLevelSharedItem"))
    v10 = 37;
  else
    v10 = 41;
  v11 = v10 - v9 + 32 * v9;
  if (-[DOCNodeThumbnailIdentifier isDownloaded](self, "isDownloaded"))
    v12 = 37;
  else
    v12 = 41;
  v13 = v12 - v11 + 32 * v11;
  -[DOCNodeThumbnailIdentifier fileExtension](self, "fileExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash") - v13 + 32 * v13;

  if (-[DOCNodeThumbnailIdentifier isActionable](self, "isActionable"))
    v16 = 37;
  else
    v16 = 41;
  return v16 - v15 + 32 * v15;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DOCNodeThumbnailIdentifier *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = (DOCNodeThumbnailIdentifier *)a3;
  if (v5 == self)
  {
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[DOCNodeThumbnailIdentifier nodeIdentifier](self, "nodeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCNodeThumbnailIdentifier nodeIdentifier](v5, "nodeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[DOCNodeThumbnailIdentifier nodeIdentifier](self, "nodeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCNodeThumbnailIdentifier nodeIdentifier](v5, "nodeIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqual:", v3))
      {
        LOBYTE(v7) = 0;
        goto LABEL_27;
      }
      v32 = v10;
    }
    -[DOCNodeThumbnailIdentifier modificationDate](self, "modificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCNodeThumbnailIdentifier modificationDate](v5, "modificationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != v12)
    {
      -[DOCNodeThumbnailIdentifier modificationDate](self, "modificationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCNodeThumbnailIdentifier modificationDate](v5, "modificationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:", v14))
      {
        LOBYTE(v7) = 0;
LABEL_25:

LABEL_26:
        v10 = v32;
        if (v8 == v9)
        {
LABEL_28:

          goto LABEL_29;
        }
LABEL_27:

        goto LABEL_28;
      }
      v30 = v14;
      v31 = v13;
    }
    -[DOCNodeThumbnailIdentifier contentVersion](self, "contentVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCNodeThumbnailIdentifier contentVersion](v5, "contentVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 != v16)
    {
      -[DOCNodeThumbnailIdentifier contentVersion](self, "contentVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCNodeThumbnailIdentifier contentVersion](v5, "contentVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "isEqual:"))
      {
        LOBYTE(v7) = 0;
        goto LABEL_23;
      }
      v28 = v17;
    }
    v18 = -[DOCNodeThumbnailIdentifier folderType](self, "folderType");
    if (v18 != -[DOCNodeThumbnailIdentifier folderType](v5, "folderType")
      || (v19 = -[DOCNodeThumbnailIdentifier isTopLevelSharedItem](self, "isTopLevelSharedItem"),
          v19 != -[DOCNodeThumbnailIdentifier isTopLevelSharedItem](v5, "isTopLevelSharedItem"))
      || (v20 = -[DOCNodeThumbnailIdentifier isDownloaded](self, "isDownloaded"),
          v20 != -[DOCNodeThumbnailIdentifier isDownloaded](v5, "isDownloaded")))
    {
      LOBYTE(v7) = 0;
      goto LABEL_20;
    }
    -[DOCNodeThumbnailIdentifier fileExtension](self, "fileExtension");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCNodeThumbnailIdentifier fileExtension](v5, "fileExtension");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 == v26
      || (-[DOCNodeThumbnailIdentifier fileExtension](self, "fileExtension"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          -[DOCNodeThumbnailIdentifier fileExtension](v5, "fileExtension"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = v22,
          objc_msgSend(v22, "isEqualToString:")))
    {
      v23 = -[DOCNodeThumbnailIdentifier isActionable](self, "isActionable");
      v7 = v23 ^ -[DOCNodeThumbnailIdentifier isActionable](v5, "isActionable") ^ 1;
      if (v27 == v26)
      {

LABEL_20:
        v17 = v28;
        if (v15 == v16)
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
    v17 = v28;

    if (v15 == v16)
    {
LABEL_24:

      v14 = v30;
      v13 = v31;
      if (v11 == v12)
        goto LABEL_26;
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  LOBYTE(v7) = 0;
LABEL_29:

  return v7;
}

- (id)nodeIdentifier
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSString)fileExtension
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNodeIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setIsTopLevelSharedItem:(BOOL)a3
{
  self->_isTopLevelSharedItem = a3;
}

- (void)setIsDownloaded:(BOOL)a3
{
  self->_isDownloaded = a3;
}

- (void)setIsActionable:(BOOL)a3
{
  self->_isActionable = a3;
}

- (void)setFolderType:(unint64_t)a3
{
  self->_folderType = a3;
}

- (void)setFileExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setContentVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)contentVersion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)folderType
{
  return self->_folderType;
}

- (BOOL)isTopLevelSharedItem
{
  return self->_isTopLevelSharedItem;
}

- (BOOL)isDownloaded
{
  return self->_isDownloaded;
}

- (BOOL)isActionable
{
  return self->_isActionable;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DOCNodeThumbnailIdentifier *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = -[DOCNodeThumbnailIdentifier init](+[DOCNodeThumbnailIdentifier allocWithZone:](DOCNodeThumbnailIdentifier, "allocWithZone:", a3), "init");
  -[DOCNodeThumbnailIdentifier nodeIdentifier](self, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[DOCNodeThumbnailIdentifier setNodeIdentifier:](v4, "setNodeIdentifier:", v6);

  -[DOCNodeThumbnailIdentifier modificationDate](self, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[DOCNodeThumbnailIdentifier setModificationDate:](v4, "setModificationDate:", v8);

  -[DOCNodeThumbnailIdentifier contentVersion](self, "contentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[DOCNodeThumbnailIdentifier setContentVersion:](v4, "setContentVersion:", v10);

  -[DOCNodeThumbnailIdentifier setFolderType:](v4, "setFolderType:", -[DOCNodeThumbnailIdentifier folderType](self, "folderType"));
  -[DOCNodeThumbnailIdentifier setIsTopLevelSharedItem:](v4, "setIsTopLevelSharedItem:", -[DOCNodeThumbnailIdentifier isTopLevelSharedItem](self, "isTopLevelSharedItem"));
  -[DOCNodeThumbnailIdentifier setIsDownloaded:](v4, "setIsDownloaded:", -[DOCNodeThumbnailIdentifier isDownloaded](self, "isDownloaded"));
  -[DOCNodeThumbnailIdentifier fileExtension](self, "fileExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[DOCNodeThumbnailIdentifier setFileExtension:](v4, "setFileExtension:", v12);

  -[DOCNodeThumbnailIdentifier setIsActionable:](v4, "setIsActionable:", -[DOCNodeThumbnailIdentifier isActionable](self, "isActionable"));
  return v4;
}

@end
