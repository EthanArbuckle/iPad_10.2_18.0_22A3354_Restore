@implementation BMDSL(BMDSLPersistentDerivatives)

- (BMDSLPersistentDerivatives)trackDerivatesInDBAtURL:()BMDSLPersistentDerivatives derivedTableName:
{
  id v6;
  id v7;
  BMDSLPersistentDerivatives *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BMDSLPersistentDerivatives initWithUpstream:databaseURL:derivedTableName:]([BMDSLPersistentDerivatives alloc], "initWithUpstream:databaseURL:derivedTableName:", a1, v7, v6);

  return v8;
}

@end
