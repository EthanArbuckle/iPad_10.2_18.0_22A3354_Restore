@implementation AFPeerContentTuple

- (AFPeerContentTuple)initWithInfo:(id)a3 content:(id)a4
{
  id v7;
  id v8;
  void *v9;
  AFPeerContentTuple *v10;
  uint64_t v11;
  AFPeerInfo *info;
  uint64_t v13;
  id content;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFPeerContentTuple.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("info != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFPeerContentTuple.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content != nil"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)AFPeerContentTuple;
  v10 = -[AFPeerContentTuple init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    info = v10->_info;
    v10->_info = (AFPeerInfo *)v11;

    v13 = objc_msgSend(v9, "copy");
    content = v10->_content;
    v10->_content = (id)v13;

  }
  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFPeerContentTuple;
  -[AFPeerContentTuple description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AFPeerInfoGetCompactDescription(self->_info);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (%@: %@)"), v4, v5, self->_content);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFPeerContentTuple *v4;
  AFPeerContentTuple *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (AFPeerContentTuple *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v10 = 1;
    }
    else
    {
      v5 = v4;
      -[AFPeerContentTuple info](self, "info");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFPeerContentTuple info](v5, "info");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[AFPeerContentTuple content](self, "content");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFPeerContentTuple content](v5, "content");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  AFPeerInfo *info;
  id v5;

  info = self->_info;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", info, CFSTR("AFPeerContentTuple.info"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_content, CFSTR("AFPeerContentTuple.content"));

}

- (AFPeerContentTuple)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AFPeerContentTuple *v10;
  _QWORD v12[13];

  v12[12] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerContentTuple.info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v12[6] = objc_opt_class();
  v12[7] = objc_opt_class();
  v12[8] = objc_opt_class();
  v12[9] = objc_opt_class();
  v12[10] = objc_opt_class();
  v12[11] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AFPeerContentTuple.content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AFPeerContentTuple initWithInfo:content:](self, "initWithInfo:content:", v5, v9);
  return v10;
}

- (AFPeerInfo)info
{
  return self->_info;
}

- (id)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_content, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
