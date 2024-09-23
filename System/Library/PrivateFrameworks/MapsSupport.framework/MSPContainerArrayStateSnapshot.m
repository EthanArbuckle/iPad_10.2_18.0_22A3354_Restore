@implementation MSPContainerArrayStateSnapshot

- (MSPContainerArrayStateSnapshot)init
{
  return -[MSPContainerArrayStateSnapshot initWithContents:](self, "initWithContents:", MEMORY[0x1E0C9AA60]);
}

- (MSPContainerArrayStateSnapshot)initWithContents:(id)a3
{
  id v4;
  MSPContainerArrayStateSnapshot *v5;
  uint64_t v6;
  NSArray *contents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSPContainerArrayStateSnapshot;
  v5 = -[MSPContainerArrayStateSnapshot init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contents = v5->_contents;
    v5->_contents = (NSArray *)v6;

  }
  return v5;
}

- (MSPContainerArrayStateSnapshot)initWithContents:(id)a3 clientIdentifier:(id)a4
{
  id v7;
  MSPContainerArrayStateSnapshot *v8;
  MSPContainerArrayStateSnapshot *v9;

  v7 = a4;
  v8 = -[MSPContainerArrayStateSnapshot initWithContents:](self, "initWithContents:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_clientIdentifier, a4);

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPContainerArrayStateSnapshot;
  -[MSPContainerArrayStateSnapshot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPContainerArrayStateSnapshot contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ - %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)contents
{
  return self->_contents;
}

- (NSUUID)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
