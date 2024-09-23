@implementation ABPKAlgorithmParams

- (__n128)initWithRegIntrinsics:(__n128)a3 regImageResolution:(__n128)a4
{
  ABPKAlgorithmParams *v8;
  __n128 result;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)ABPKAlgorithmParams;
  v8 = -[ABPKAlgorithmParams init](&v13, sel_init);
  *(__n128 *)&v8[1].super.isa = a2;
  v8[1]._regImageResolution = (CGSize)a3;
  result = a4;
  *(__n128 *)&v8[2].super.isa = a4;
  v8->_regImageResolution.width = a5;
  v8->_regImageResolution.height = a6;
  return result;
}

- (id)toDict
{
  id v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ABPKAlgorithmParams regIntrinsics](self, "regIntrinsics");
  simdMatrix3x3ToNSMat(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("reg_intrinsics"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[ABPKAlgorithmParams regImageResolution](self, "regImageResolution");
  objc_msgSend(v8, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[ABPKAlgorithmParams regImageResolution](self, "regImageResolution");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("reg_image_resolution"));

  return v3;
}

- (double)regIntrinsics
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 32), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setRegIntrinsics:(__n128)a3
{
  _OWORD v4[3];

  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 32), v4, 48, 1, 0);
}

- (CGSize)regImageResolution
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_regImageResolution, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setRegImageResolution:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_regImageResolution, &v3, 16, 1, 0);
}

- (ABPK2DDetectionConfiguration)config2DDetection
{
  return (ABPK2DDetectionConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig2DDetection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config2DDetection, 0);
}

@end
