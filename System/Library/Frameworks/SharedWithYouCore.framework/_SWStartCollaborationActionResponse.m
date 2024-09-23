@implementation _SWStartCollaborationActionResponse

+ (id)responseWithURL:(id)a3 updatedMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:updatedMetadata:", v6, v5);

  return v7;
}

- (_SWStartCollaborationActionResponse)initWithURL:(id)a3 updatedMetadata:(id)a4
{
  id v7;
  id v8;
  _SWStartCollaborationActionResponse *v9;
  _SWStartCollaborationActionResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SWStartCollaborationActionResponse;
  v9 = -[_SWActionResponse initWithSuccess:error:](&v12, sel_initWithSuccess_error_, 1, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_updatedMetadata, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWStartCollaborationActionResponse)initWithCoder:(id)a3
{
  id v4;
  _SWStartCollaborationActionResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSURL *url;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SWCollaborationMetadata *updatedMetadata;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SWStartCollaborationActionResponse;
  v5 = -[_SWActionResponse initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector("url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_updatedMetadata);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    updatedMetadata = v5->_updatedMetadata;
    v5->_updatedMetadata = (SWCollaborationMetadata *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SWCollaborationMetadata *updatedMetadata;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SWStartCollaborationActionResponse;
  v4 = a3;
  -[_SWActionResponse encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[_SWStartCollaborationActionResponse url](self, "url", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  updatedMetadata = self->_updatedMetadata;
  NSStringFromSelector(sel_updatedMetadata);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", updatedMetadata, v8);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SWStartCollaborationActionResponse;
  v4 = -[_SWActionResponse copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    -[_SWStartCollaborationActionResponse url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUrl:", v5);

    objc_storeStrong(v4 + 4, self->_updatedMetadata);
  }
  return v4;
}

- (BOOL)isEqualToActionResponse:(id)a3
{
  void *v3;
  id v5;
  _QWORD *v6;
  SWCollaborationMetadata *updatedMetadata;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SWStartCollaborationActionResponse;
  if (-[_SWActionResponse isEqualToActionResponse:](&v13, sel_isEqualToActionResponse_, v5))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      updatedMetadata = self->_updatedMetadata;
      if ((unint64_t)updatedMetadata | v6[4]
        && !-[SWCollaborationMetadata isEqual:](updatedMetadata, "isEqual:"))
      {
        v11 = 0;
LABEL_14:

        goto LABEL_15;
      }
      -[_SWStartCollaborationActionResponse url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 || (objc_msgSend(v6, "url"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[_SWStartCollaborationActionResponse url](self, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "url");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v8)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        v11 = 1;
      }

      goto LABEL_13;
    }
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (_SWStartCollaborationActionResponse)initWithDestinationResponse:(id)a3
{
  id v4;
  _SWStartCollaborationActionResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SWCollaborationMetadata *updatedMetadata;
  void *v14;
  uint64_t v15;
  NSURL *url;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SWStartCollaborationActionResponse;
  v5 = -[_SWActionResponse initWithDestinationResponse:](&v18, sel_initWithDestinationResponse_, v4);
  if (v5)
  {
    objc_msgSend(v4, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForSetting:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v11, v7, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    updatedMetadata = v5->_updatedMetadata;
    v5->_updatedMetadata = (SWCollaborationMetadata *)v12;

    objc_msgSend(v4, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForSetting:", 3);
    v15 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v15;

  }
  return v5;
}

- (void)encodeWithBSActionResponseSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SWStartCollaborationActionResponse;
  v4 = a3;
  -[_SWActionResponse encodeWithBSActionResponseSettings:](&v7, sel_encodeWithBSActionResponseSettings_, v4);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_updatedMetadata, 1, 0, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v5, 2);
  -[_SWStartCollaborationActionResponse url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v6, 3);

}

- (_SWCollaborationMetadata)updatedMetadata
{
  return (_SWCollaborationMetadata *)self->_updatedMetadata;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_updatedMetadata, 0);
}

@end
