@implementation MGRemoteQueryReply

- (id)_initWithGroups:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  MGRemoteQueryReply *v8;
  uint64_t v9;
  NSArray *groups;
  uint64_t v11;
  NSError *error;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MGRemoteQueryReply;
  v8 = -[MGRemoteQueryReply init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    groups = v8->_groups;
    v8->_groups = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    error = v8->_error;
    v8->_error = (NSError *)v11;

  }
  return v8;
}

+ (id)replyWithGroups:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithGroups:error:", v4, 0);

  return v5;
}

+ (id)replyWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithGroups:error:", 0, v4);

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryReply groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[MGRemoteQueryReply error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _groups=%lu, _error=%@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSArray)groups
{
  return self->_groups;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

- (id)rq_coded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryReply groups](self, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rq_coded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGRemoteQueryReply error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rq_coded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, 0x24E0ABF80);
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, 0x24E0ABFA0);

  return v3;
}

+ (id)rq_instanceFromCoded:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "rq_arrayOfDecodedClass:forKey:", objc_opt_class(), 0x24E0ABF80);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rq_decodedObjectOfClass:forKey:", objc_opt_class(), 0x24E0ABFA0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    +[MGRemoteQueryReply replyWithGroups:](MGRemoteQueryReply, "replyWithGroups:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_9;
    }
    +[MGRemoteQueryReply replyWithError:](MGRemoteQueryReply, "replyWithError:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

@end
