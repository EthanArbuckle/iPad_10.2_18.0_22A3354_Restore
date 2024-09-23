@implementation AACloudKitMigrationStateResponse

- (AACloudKitMigrationStateResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AACloudKitMigrationStateResponse *v4;
  AACloudKitMigrationStateResponse *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AACloudKitMigrationStateResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v10, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAResponse responseDictionary](v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
