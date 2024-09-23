@implementation PHCloudIdentifierMapping

- (PHCloudIdentifierMapping)initWithCloudIdentifier:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  PHCloudIdentifierMapping *v9;
  PHCloudIdentifierMapping *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHCloudIdentifierMapping;
  v9 = -[PHCloudIdentifierMapping init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cloudIdentifier, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (PHCloudIdentifier)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
}

@end
