@implementation ABPKMLModelConfiguration3DLifting

- (ABPKMLModelConfiguration3DLifting)init
{
  ABPKMLModelConfiguration3DLifting *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *mlModelPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration3DLifting;
  v2 = -[ABPKMLModelConfiguration init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kABPK3DLiftingNetworkName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ABPKMLModelPath(v3, v4, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    mlModelPath = v2->_mlModelPath;
    v2->_mlModelPath = (NSString *)v5;

  }
  return v2;
}

- (id)compiledMLModelPath
{
  return self->_mlModelPath;
}

- (id)inputTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingInputTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingOutputTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlModelPath, 0);
}

@end
