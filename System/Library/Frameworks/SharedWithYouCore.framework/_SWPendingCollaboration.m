@implementation _SWPendingCollaboration

- (id)processSigningQueue
{
  if (processSigningQueue_onceToken != -1)
    dispatch_once(&processSigningQueue_onceToken, &__block_literal_global_1);
  return (id)processSigningQueue_internalQueue;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.SharedWithYou.SWPendingCollaboration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v11;

  v7 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.SharedWithYou.SWPendingCollaboration")))
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (!a5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = 0;
  v9 = 0;
  if (a5)
LABEL_5:
    *a5 = objc_retainAutorelease(v9);
LABEL_6:

  return v8;
}

- (id)softSigningController
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (getSLCollaborationSigningControllerClass()
    && objc_msgSend(getSLCollaborationSigningControllerClass(), "instancesRespondToSelector:", sel_initWithTargetSerialQueue_synchronous_))
  {
    v3 = objc_alloc((Class)getSLCollaborationSigningControllerClass());
    -[_SWPendingCollaboration processSigningQueue](self, "processSigningQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithTargetSerialQueue:synchronous:", v4, 1);

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.SharedWithYou.SWPendingCollaboration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.SharedWithYou.SWPendingCollaboration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __103___SWPendingCollaboration_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v17[3] = &unk_1E217B2B8;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D77B254](v17);
  -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceProcessData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    || (-[_SWPendingCollaboration softSigningController](self, "softSigningController"),
        (v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sourceProcessData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v14, 0);
  }
  else
  {
    v13 = (void *)v15;
    -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "signSourceProcessWithMetadata:timeout:completion:", v14, v10, 5.0);
  }

  return 0;
}

- (_SWPendingCollaboration)initWithFileAtURL:(id)a3
{
  id v5;
  _SWPendingCollaboration *v6;
  _SWPendingCollaboration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SWPendingCollaboration;
  v6 = -[_SWPendingCollaboration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileURL, a3);

  return v7;
}

- (_SWPendingCollaboration)initWithMetadata:(id)a3
{
  id v5;
  _SWPendingCollaboration *v6;
  _SWPendingCollaboration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SWPendingCollaboration;
  v6 = -[_SWPendingCollaboration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collaborationMetadata, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWPendingCollaboration fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" fileURL=%@"), v4);

  -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" collaborationMetadata=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[_SWPendingCollaboration isEqualToCollaborationContent:](self, "isEqualToCollaborationContent:", v4);

  return v5;
}

- (BOOL)isEqualToCollaborationContent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  -[_SWPendingCollaboration fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "fileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = 0;
      v9 = 0;
      goto LABEL_7;
    }
  }
  -[_SWPendingCollaboration fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", v4))
  {
    v9 = 1;
LABEL_7:
    -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v7, "collaborationMetadata"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collaborationMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
        goto LABEL_13;
    }
    else
    {
      v10 = 1;
    }

LABEL_13:
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:

LABEL_15:
  if (!v8)

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_SWPendingCollaboration fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[_SWPendingCollaboration fileURL](self, "fileURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc((Class)objc_opt_class());
  if (v4)
  {
    -[_SWPendingCollaboration fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithFileAtURL:", v6);
  }
  else
  {
    -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithMetadata:", v6);
  }
  v8 = (void *)v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWPendingCollaboration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _SWPendingCollaboration *v11;
  _SWPendingCollaboration *v12;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_fileURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_collaborationMetadata);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v11 = -[_SWPendingCollaboration initWithFileAtURL:](self, "initWithFileAtURL:", v7);
  else
    v11 = -[_SWPendingCollaboration initWithMetadata:](self, "initWithMetadata:", v10);
  v12 = v11;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_SWPendingCollaboration fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_SWPendingCollaboration collaborationMetadata](self, "collaborationMetadata");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationMetadata);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
