@implementation BMPersonName

- (BMPersonName)initWithName:(id)a3 nameComponents:(id)a4
{
  id v7;
  id v8;
  BMPersonName *v9;
  BMPersonName *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMPersonName;
  v9 = -[BMPersonName init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_nameComponents, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  BMNameComponents *nameComponents;
  void *v11;
  NSString *name;
  void *v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = self->_nameComponents == 0;
    objc_msgSend(v5, "nameComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

    if (v6 == v8)
      goto LABEL_8;
    if (!self->_nameComponents)
      goto LABEL_6;
    objc_msgSend(v5, "nameComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    nameComponents = self->_nameComponents;
    objc_msgSend(v5, "nameComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(nameComponents) = -[BMNameComponents isEqual:](nameComponents, "isEqual:", v11);

    if (!(_DWORD)nameComponents)
    {
LABEL_8:
      v14 = 0;
    }
    else
    {
LABEL_6:
      name = self->_name;
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NSString isEqualToString:](name, "isEqualToString:", v13);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMPersonName proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMPersonName)initWithProto:(id)a3
{
  id v4;
  id v5;
  BMNameComponents *v6;
  void *v7;
  BMNameComponents *v8;
  void *v9;
  BMPersonName *v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = [BMNameComponents alloc];
    objc_msgSend(v5, "nameComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BMNameComponents initWithProto:](v6, "initWithProto:", v7);

    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[BMPersonName initWithName:nameComponents:](self, "initWithName:nameComponents:", v9, v8);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMPersonName)initWithProtoData:(id)a3
{
  id v4;
  BMPBPersonName *v5;
  BMPersonName *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBPersonName initWithData:]([BMPBPersonName alloc], "initWithData:", v4);

    self = -[BMPersonName initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[BMPersonName name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  -[BMPersonName nameComponents](self, "nameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BMPersonName nameComponents](self, "nameComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setNameComponents:", v7);
  }
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (BMNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
