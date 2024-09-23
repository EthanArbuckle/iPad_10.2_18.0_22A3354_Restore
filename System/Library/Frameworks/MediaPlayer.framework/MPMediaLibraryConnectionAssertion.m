@implementation MPMediaLibraryConnectionAssertion

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p: %@"), self, self->_identifier);
}

- (id)_initWithMediaLibrary:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  MPMediaLibraryConnectionAssertion *v9;
  MPMediaLibraryConnectionAssertion *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPMediaLibraryConnectionAssertion;
  v9 = -[MPMediaLibraryConnectionAssertion init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[MPMediaLibrary _removeConnectionAssertion:](self->_library, "_removeConnectionAssertion:", self);
  v3.receiver = self;
  v3.super_class = (Class)MPMediaLibraryConnectionAssertion;
  -[MPMediaLibraryConnectionAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  return self->_identifier;
}

@end
