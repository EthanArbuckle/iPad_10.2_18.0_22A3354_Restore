@implementation PHLocalIdentifierMapping

- (PHLocalIdentifierMapping)initWithLocalIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  PHLocalIdentifierMapping *v8;
  uint64_t v9;
  NSString *localIdentifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHLocalIdentifierMapping;
  v8 = -[PHLocalIdentifierMapping init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
