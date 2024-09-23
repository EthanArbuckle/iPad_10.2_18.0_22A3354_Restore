@implementation CMISmartStyleColorManagementMetadata

- (CMISmartStyleColorManagementMetadata)init
{
  char *v2;
  CMISmartStyleColorManagementMetadata *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMISmartStyleColorManagementMetadata;
  v2 = -[CMISmartStyleColorManagementMetadata init](&v6, sel_init);
  v3 = (CMISmartStyleColorManagementMetadata *)v2;
  if (v2)
  {
    *(_QWORD *)(v2 + 20) = 0;
    *(_QWORD *)(v2 + 12) = 0;
    v4 = v2;
  }

  return v3;
}

- (int)yccMatrixType
{
  return self->_yccMatrixType;
}

- (void)setYccMatrixType:(int)a3
{
  self->_yccMatrixType = a3;
}

- ($40D96BF5EB78816D40700A151EB9B357)colorSpace
{
  float transferFunctionGamma;
  uint64_t v3;
  $40D96BF5EB78816D40700A151EB9B357 result;

  transferFunctionGamma = self->_colorSpace.transferFunctionGamma;
  v3 = *(_QWORD *)&self->_colorSpace.colorPrimaries;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = transferFunctionGamma;
  return result;
}

- (void)setColorSpace:(id)a3
{
  self->_colorSpace = ($A0EF750D1FF737B3605F28887701E945)a3;
}

- (BOOL)cscYCCConversionEnabled
{
  return self->_cscYCCConversionEnabled;
}

- (void)setCscYCCConversionEnabled:(BOOL)a3
{
  self->_cscYCCConversionEnabled = a3;
}

- (BOOL)cscTransferFunctionEnabled
{
  return self->_cscTransferFunctionEnabled;
}

- (void)setCscTransferFunctionEnabled:(BOOL)a3
{
  self->_cscTransferFunctionEnabled = a3;
}

@end
