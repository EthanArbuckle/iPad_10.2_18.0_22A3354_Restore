@implementation CRMLFlatModel

- (id)modelName
{
  return CFSTR("cc_flat_model.mlmodelc");
}

- (const)codeMap
{
  return (const int *)&kModelCCFCodeMap;
}

- (int)classCount
{
  return 43;
}

@end
