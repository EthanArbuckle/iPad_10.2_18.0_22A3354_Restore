@implementation ABPKMLModelConfiguration3DLiftingLSTM

- (ABPKMLModelConfiguration3DLiftingLSTM)init
{
  ABPKMLModelConfiguration3DLiftingLSTM *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSString *mlModelPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration3DLiftingLSTM;
  v2 = -[ABPKMLModelConfiguration init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)kABPK3DLiftingLSTMNetworkName;
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
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingLSTMInputPose2dTensorName;
  v3[1] = kABPK3DLiftingLSTMInputHiddenStateTensorName;
  v3[2] = kABPK3DLiftingLSTMInputCellStateTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputTensorNames
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingLSTMOutputPose3dTensorName;
  v3[1] = kABPK3DLiftingLSTMOutputToHiddenStateTensorName;
  v3[2] = kABPK3DLiftingLSTMOutputToCellStateTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)inputPose2dTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingLSTMInputPose2dTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)inputHiddenStateTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingLSTMInputHiddenStateTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)inputCellStateTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingLSTMInputCellStateTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputPose3dTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingLSTMOutputPose3dTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputToHiddenStateTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingLSTMOutputToHiddenStateTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputToCellStateTensorNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = kABPK3DLiftingLSTMOutputToCellStateTensorName;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlModelPath, 0);
}

@end
