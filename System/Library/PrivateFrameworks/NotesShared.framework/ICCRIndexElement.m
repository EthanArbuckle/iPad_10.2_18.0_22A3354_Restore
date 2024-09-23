@implementation ICCRIndexElement

+ (id)elementWithInteger:(int64_t)a3 replica:(id)a4
{
  id v5;
  ICCRIndexElement *v6;

  v5 = a4;
  v6 = -[ICCRIndexElement initWithInteger:replica:]([ICCRIndexElement alloc], "initWithInteger:replica:", a3, v5);

  return v6;
}

- (ICCRIndexElement)initWithInteger:(int64_t)a3 replica:(id)a4
{
  id v7;
  ICCRIndexElement *v8;
  ICCRIndexElement *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICCRIndexElement;
  v8 = -[ICCRIndexElement init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replica, a4);
    v9->_integer = a3;
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = -[ICCRIndexElement integer](self, "integer");
  if (v5 == objc_msgSend(v4, "integer"))
  {
    -[ICCRIndexElement replica](self, "replica");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replica");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "CR_compare:", v7);

  }
  else
  {
    v9 = -[ICCRIndexElement integer](self, "integer");
    if (v9 < objc_msgSend(v4, "integer"))
      v8 = -1;
    else
      v8 = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICCRIndexElement replica](self, "replica");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replica");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      v7 = -[ICCRIndexElement integer](self, "integer");
      v8 = v7 == objc_msgSend(v4, "integer");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[ICCRIndexElement replica](self, "replica");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[ICCRIndexElement integer](self, "integer") ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICCRIndexElement *v4;
  int64_t v5;
  void *v6;
  ICCRIndexElement *v7;

  v4 = +[ICCRIndexElement allocWithZone:](ICCRIndexElement, "allocWithZone:", a3);
  v5 = -[ICCRIndexElement integer](self, "integer");
  -[ICCRIndexElement replica](self, "replica");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICCRIndexElement initWithInteger:replica:](v4, "initWithInteger:replica:", v5, v6);

  return v7;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (void)setReplica:(id)a3
{
  objc_storeStrong((id *)&self->_replica, a3);
}

- (int64_t)integer
{
  return self->_integer;
}

- (void)setInteger:(int64_t)a3
{
  self->_integer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replica, 0);
}

@end
