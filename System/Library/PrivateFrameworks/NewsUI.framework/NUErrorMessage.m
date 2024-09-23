@implementation NUErrorMessage

- (NUErrorMessage)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v7;
  id v8;
  NUErrorMessage *v9;
  NUErrorMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUErrorMessage;
  v9 = -[NUErrorMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_subtitle, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class();
  FCDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[NUErrorMessage title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "fc_string:isEqualToString:", v7, v8))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      -[NUErrorMessage subtitle](self, "subtitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subtitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "fc_string:isEqualToString:", v10, v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NUErrorMessage title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NUErrorMessage subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUErrorMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NUErrorMessage *v10;

  v5 = [NUErrorMessage alloc];
  -[NUErrorMessage title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[NUErrorMessage subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = -[NUErrorMessage initWithTitle:subtitle:](v5, "initWithTitle:subtitle:", v7, v9);

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
