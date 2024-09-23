@implementation BMDSL(BMDSLTable)

- (BMDSLTableMap)asTableWithTransform:()BMDSLTable schema:
{
  id v6;
  id v7;
  BMDSLTableMap *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BMDSLTableMap initWithUpstream:transform:schema:]([BMDSLTableMap alloc], "initWithUpstream:transform:schema:", a1, v7, v6);

  return v8;
}

@end
