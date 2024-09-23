@implementation CRMLEmbossedNumberModel

- (id)modelName
{
  return CFSTR("cc_cncnnfs_model.mlmodelc");
}

- (const)codeMap
{
  return (const int *)&kCnCNNFSCodeMap;
}

- (int)classCount
{
  return 11;
}

- (id)decodeActivations:(void *)a3
{
  const int *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[CRMLEmbossedNumberModel codeMap](self, "codeMap");
  -[CRMLEmbossedNumberModel classCount](self, "classCount");
  decodeCreditCardNumberActivations((uint64_t **)a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("arrayResult");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
