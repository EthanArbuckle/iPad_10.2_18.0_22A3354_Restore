@implementation CRMLEmbossedExpirationModel

- (id)modelName
{
  return CFSTR("cc_excnnfs_model.mlmodelc");
}

- (const)codeMap
{
  return (const int *)&kExCNNFSCodeMap;
}

- (int)classCount
{
  return 33;
}

- (id)decodeActivations:(void *)a3
{
  const int *v5;

  v5 = -[CRMLEmbossedExpirationModel codeMap](self, "codeMap");
  -[CRMLEmbossedExpirationModel classCount](self, "classCount");
  return decodeCreditCardExpirationActivations((uint64_t **)a3, v5);
}

@end
