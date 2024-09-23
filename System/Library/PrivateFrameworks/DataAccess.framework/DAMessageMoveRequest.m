@implementation DAMessageMoveRequest

- (id)initMoveRequestWithMessage:(id)a3 fromFolder:(id)a4 toFolder:(id)a5
{
  id v8;
  id v9;
  id v10;
  DAMessageMoveRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DAMessageMoveRequest;
  v11 = -[DAMessageMoveRequest init](&v16, sel_init);
  if (v11)
  {
    v12 = (void *)objc_msgSend(v8, "copy");
    -[DAMessageMoveRequest setMessage:](v11, "setMessage:", v12);

    v13 = (void *)objc_msgSend(v9, "copy");
    -[DAMessageMoveRequest setFromFolder:](v11, "setFromFolder:", v13);

    v14 = (void *)objc_msgSend(v10, "copy");
    -[DAMessageMoveRequest setToFolder:](v11, "setToFolder:", v14);

  }
  return v11;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DAMessageMoveRequest message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMessageMoveRequest fromFolder](self, "fromFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMessageMoveRequest toFolder](self, "toFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%@\n%@"), v4, v5, v6);

  v8 = objc_msgSend(v7, "hash");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[DAMessageMoveRequest message](self, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[DAMessageMoveRequest message](self, "message");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "message");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        v10 = 0;
        goto LABEL_17;
      }
    }
    -[DAMessageMoveRequest fromFolder](self, "fromFolder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fromFolder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v25 = v11;
    }
    else
    {
      -[DAMessageMoveRequest fromFolder](self, "fromFolder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fromFolder");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:"))
      {
        v10 = 0;
        goto LABEL_15;
      }
      v24 = v13;
      v25 = v11;
    }
    -[DAMessageMoveRequest toFolder](self, "toFolder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toFolder");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

      v10 = 1;
    }
    else
    {
      v16 = (void *)v15;
      -[DAMessageMoveRequest toFolder](self, "toFolder");
      v23 = v3;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toFolder");
      v22 = v4;
      v18 = v9;
      v19 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v17, "isEqual:", v20);

      v8 = v19;
      v9 = v18;
      v4 = v22;

      v3 = v23;
    }
    v13 = v24;
    v11 = v25;
    if (v25 == v12)
    {
LABEL_16:

      if (v8 == v9)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:

      goto LABEL_18;
    }
LABEL_15:

    goto LABEL_16;
  }
  v10 = 0;
LABEL_19:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)DAMessageMoveRequest;
  -[DAMessageMoveRequest description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMessageMoveRequest message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMessageMoveRequest fromFolder](self, "fromFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMessageMoveRequest toFolder](self, "toFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ message \"%@\", fromFolder \"%@\", toFolder \"%@\"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fromFolder
{
  return self->_fromFolder;
}

- (void)setFromFolder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)toFolder
{
  return self->_toFolder;
}

- (void)setToFolder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_toFolder, 0);
  objc_storeStrong((id *)&self->_fromFolder, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
