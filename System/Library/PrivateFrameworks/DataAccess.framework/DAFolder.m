@implementation DAFolder

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DAFolder;
  -[DAFolder description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAFolder folderID](self, "folderID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAFolder folderName](self, "folderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAFolder parentFolderID](self, "parentFolderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DAFolder dataclass](self, "dataclass");
  v8 = -[DAFolder isDefault](self, "isDefault");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" folderID = %@, name = %@, _parentFolderID %@, _dataclass %ld, _isDefault %@"), v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DAFolder folderID](self, "folderID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "folderName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (-[DAFolder folderName](self, "folderName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v9, "folderName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAFolder folderName](self, "folderName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqualToString:", v4))
      {
        LOBYTE(v13) = 0;
        goto LABEL_39;
      }
      v28 = v11;
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v9, "folderID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (-[DAFolder folderID](self, "folderID"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v9, "folderID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAFolder folderID](self, "folderID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isEqualToString:", v6))
      {
        LOBYTE(v13) = 0;
        goto LABEL_30;
      }
      v24 = v12;
      v25 = 1;
    }
    else
    {
      v24 = v12;
      v25 = 0;
      v23 = 0;
    }
    v26 = v6;
    v27 = v5;
    objc_msgSend(v9, "parentFolderID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (-[DAFolder parentFolderID](self, "parentFolderID"), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v9, "parentFolderID", v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAFolder parentFolderID](self, "parentFolderID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqualToString:", v5))
      {
        LOBYTE(v13) = 0;
        goto LABEL_26;
      }
      v22 = v3;
      v21 = 1;
    }
    else
    {
      v22 = v3;
      v20 = 0;
      v21 = 0;
    }
    v16 = objc_msgSend(v9, "dataclass", v20);
    if (v16 == -[DAFolder dataclass](self, "dataclass"))
    {
      v17 = objc_msgSend(v9, "isDefault");
      v13 = v17 ^ -[DAFolder isDefault](self, "isDefault") ^ 1;
      if ((v21 & 1) == 0)
      {
LABEL_23:
        v3 = v22;
        goto LABEL_27;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
      if (!v21)
        goto LABEL_23;
    }
    v3 = v22;
LABEL_26:

LABEL_27:
    v6 = v26;
    v5 = v27;
    if (v15)
    {

      if (v25)
      {
LABEL_29:
        v12 = v24;
LABEL_30:

        if (v14)
          goto LABEL_31;
        goto LABEL_37;
      }
    }
    else
    {

      if ((v25 & 1) != 0)
        goto LABEL_29;
    }
    v12 = v24;
    if (v14)
    {
LABEL_31:

      if (!v12)
        goto LABEL_32;
LABEL_38:
      v11 = v28;
LABEL_39:

      if (v10)
        goto LABEL_33;
      goto LABEL_40;
    }
LABEL_37:

    if ((v12 & 1) == 0)
    {
LABEL_32:
      if (v10)
      {
LABEL_33:

        goto LABEL_34;
      }
LABEL_40:

      goto LABEL_33;
    }
    goto LABEL_38;
  }
  LOBYTE(v13) = 0;
LABEL_34:

  return v13;
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
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

- (NSString)parentFolderID
{
  return self->_parentFolderID;
}

- (void)setParentFolderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(int64_t)a3
{
  self->_dataclass = a3;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (BOOL)hasRemoteChanges
{
  return self->_hasRemoteChanges;
}

- (void)setHasRemoteChanges:(BOOL)a3
{
  self->_hasRemoteChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFolderID, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
}

@end
