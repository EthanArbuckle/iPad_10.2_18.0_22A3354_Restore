@implementation DAFolderChange

- (id)initFolderChangeWithChangeType:(unint64_t)a3 folderId:(id)a4 parentFolderId:(id)a5 displayName:(id)a6 dataclass:(int64_t)a7 consumer:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  SEL v22;
  DAFolderChange *v23;
  uint64_t v24;
  DAFolderChange *v25;
  DAFolderChange *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  objc_super v33;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (a7 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAFolderChange.m"), 23, CFSTR("Only email folder manipulation is allowed at this time"));

  }
  if (a3 == 2)
  {
    if (v15)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = CFSTR("Modify change types require a folder id");
    v22 = a2;
    v23 = self;
    v24 = 35;
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    if (v15)
    {
      if (v17)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAFolderChange.m"), 31, CFSTR("Modify change types require a folder id"));

      if (v17)
        goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = CFSTR("Modify change types require a display name");
    v22 = a2;
    v23 = self;
    v24 = 32;
    goto LABEL_15;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v32 = a3;
    v21 = CFSTR("Can't handle folder change type %ld");
    v22 = a2;
    v23 = self;
    v24 = 38;
    goto LABEL_15;
  }
  if (v16)
  {
    if (v17)
      goto LABEL_16;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAFolderChange.m"), 27, CFSTR("Add change types require a parent id"));

  if (!v17)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = CFSTR("Add change types require a display name");
    v22 = a2;
    v23 = self;
    v24 = 28;
LABEL_15:
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, CFSTR("DAFolderChange.m"), v24, v21, v32);

  }
LABEL_16:
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("70FB9178-576E-4CAA-A08E-F68D57BFD01E")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAFolderChange.m"), 45, CFSTR("Don't push changes to the temp inbox"));

  }
  v33.receiver = self;
  v33.super_class = (Class)DAFolderChange;
  v25 = -[DAFolderChange init](&v33, sel_init);
  v26 = v25;
  if (v25)
  {
    -[DAFolderChange setChangeType:](v25, "setChangeType:", a3);
    -[DAFolderChange setFolderId:](v26, "setFolderId:", v15);
    -[DAFolderChange setParentFolderId:](v26, "setParentFolderId:", v16);
    -[DAFolderChange setDisplayName:](v26, "setDisplayName:", v17);
    -[DAFolderChange setDataclass:](v26, "setDataclass:", a7);
    -[DAFolderChange setConsumer:](v26, "setConsumer:", v18);
  }

  return v26;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DAFolderChange changeType](self, "changeType");
  -[DAFolderChange folderId](self, "folderId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAFolderChange parentFolderId](self, "parentFolderId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAFolderChange displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: changeType %ld folderId %@ parentFolderId %@ displayName %@ dataclass %ld"), v5, self, v6, v7, v8, v9, -[DAFolderChange dataclass](self, "dataclass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAFolderChange)initWithCoder:(id)a3
{
  id v5;
  DAFolderChange *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAFolderChange.m"), 68, CFSTR("Who does non-keyed coding nowadays?"));

  }
  v15.receiver = self;
  v15.super_class = (Class)DAFolderChange;
  v6 = -[DAFolderChange init](&v15, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "decodeIntForKey:", CFSTR("DAFCChangeType"));
    v8 = (int)v7;
    if (v7 >= 0xA)
    {
      DALoggingwithCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v8;
        _os_log_impl(&dword_1C1D11000, v9, OS_LOG_TYPE_FAULT, "Unknown DAItemChangeType %ld", buf, 0xCu);
      }

      v8 = 1;
    }
    -[DAFolderChange setChangeType:](v6, "setChangeType:", v8);
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAFCFolderId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAFolderChange setFolderId:](v6, "setFolderId:", v10);

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAFCParentFolderId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAFolderChange setParentFolderId:](v6, "setParentFolderId:", v11);

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAFCDisplayName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAFolderChange setDisplayName:](v6, "setDisplayName:", v12);

    -[DAFolderChange setDataclass:](v6, "setDataclass:", (int)objc_msgSend(v5, "decodeIntForKey:", CFSTR("DAFCDataclass")));
    -[DAFolderChange setRenameOnCollision:](v6, "setRenameOnCollision:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("DAFCRenameOnCollision")));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAFolderChange.m"), 103, CFSTR("Who does non-keyed coding nowadays?"));

  }
  objc_msgSend(v9, "encodeInt:forKey:", -[DAFolderChange changeType](self, "changeType"), CFSTR("DAFCChangeType"));
  -[DAFolderChange folderId](self, "folderId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("DAFCFolderId"));

  -[DAFolderChange parentFolderId](self, "parentFolderId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("DAFCParentFolderId"));

  -[DAFolderChange displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("DAFCDisplayName"));

  objc_msgSend(v9, "encodeInt:forKey:", -[DAFolderChange dataclass](self, "dataclass"), CFSTR("DAFCDataclass"));
  objc_msgSend(v9, "encodeBool:forKey:", -[DAFolderChange renameOnCollision](self, "renameOnCollision"), CFSTR("DAFCRenameOnCollision"));

}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (NSString)folderId
{
  return self->_folderId;
}

- (void)setFolderId:(id)a3
{
  objc_storeStrong((id *)&self->_folderId, a3);
}

- (NSString)parentFolderId
{
  return self->_parentFolderId;
}

- (void)setParentFolderId:(id)a3
{
  objc_storeStrong((id *)&self->_parentFolderId, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (int64_t)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(int64_t)a3
{
  self->_dataclass = a3;
}

- (unsigned)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(unsigned int)a3
{
  self->_taskId = a3;
}

- (BOOL)renameOnCollision
{
  return self->_renameOnCollision;
}

- (void)setRenameOnCollision:(BOOL)a3
{
  self->_renameOnCollision = a3;
}

- (DAFolderChangeConsumer)consumer
{
  return (DAFolderChangeConsumer *)objc_loadWeakRetained((id *)&self->_consumer);
}

- (void)setConsumer:(id)a3
{
  objc_storeWeak((id *)&self->_consumer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_consumer);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_parentFolderId, 0);
  objc_storeStrong((id *)&self->_folderId, 0);
}

@end
