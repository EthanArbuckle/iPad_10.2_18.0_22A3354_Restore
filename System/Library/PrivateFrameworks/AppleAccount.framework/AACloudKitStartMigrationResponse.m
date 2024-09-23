@implementation AACloudKitStartMigrationResponse

- (AACloudKitStartMigrationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AACloudKitStartMigrationResponse *v4;
  AACloudKitStartMigrationResponse *v5;
  void *v6;
  uint64_t v7;
  NSNumber *status;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AACloudKitStartMigrationResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v10, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAResponse responseDictionary](v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
    v7 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSNumber *)v7;

  }
  return v5;
}

- (NSNumber)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
}

@end
