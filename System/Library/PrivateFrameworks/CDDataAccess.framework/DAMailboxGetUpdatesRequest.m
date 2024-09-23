@implementation DAMailboxGetUpdatesRequest

- (id)initRequestForBodyFormat:(int)a3 withBodySizeLimit:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  DAMailboxGetUpdatesRequest *v6;
  DAMailboxGetUpdatesRequest *v7;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)DAMailboxGetUpdatesRequest;
  v6 = -[DAMailboxRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[DAMailboxRequest setRequestType:](v6, "setRequestType:", 1);
    -[DAMailboxGetUpdatesRequest setMaxSize:](v7, "setMaxSize:", v4);
    -[DAMailboxRequest setBodyFormat:](v7, "setBodyFormat:", v5);
  }
  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d\n%d"), -[DAMailboxGetUpdatesRequest maxSize](self, "maxSize"), -[DAMailboxRequest bodyFormat](self, "bodyFormat"));
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "maxSize");
    if (v6 == -[DAMailboxGetUpdatesRequest maxSize](self, "maxSize"))
    {
      v7 = objc_msgSend(v5, "bodyFormat");
      v8 = v7 == -[DAMailboxRequest bodyFormat](self, "bodyFormat");
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)DAMailboxGetUpdatesRequest;
  -[DAMailboxGetUpdatesRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ maxSize %d, bodyFormat %d"), v4, -[DAMailboxGetUpdatesRequest maxSize](self, "maxSize"), -[DAMailboxRequest bodyFormat](self, "bodyFormat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int)a3
{
  self->_maxSize = a3;
}

@end
