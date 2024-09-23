@implementation BPSPublisher(BMPersistentDerivatives)

- (BMPersistentDerivatives)trackDerivativesInDatabaseWithURL:()BMPersistentDerivatives derivedTableName:
{
  id v6;
  id v7;
  BMPersistentDerivatives *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BMPersistentDerivatives initWithUpstream:derivativeDatabaseURL:derivedTableName:]([BMPersistentDerivatives alloc], "initWithUpstream:derivativeDatabaseURL:derivedTableName:", a1, v7, v6);

  return v8;
}

@end
