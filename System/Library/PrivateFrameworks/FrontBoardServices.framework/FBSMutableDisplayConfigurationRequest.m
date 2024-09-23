@implementation FBSMutableDisplayConfigurationRequest

- (void)setOverscanCompensation:(int64_t)a3
{
  self->super._overscanCompensation = a3;
}

- (void)setNativePixelSize:(CGSize)a3
{
  self->super._nativePixelSize = a3;
}

- (void)setPointScale:(double)a3
{
  self->super._pointScale = a3;
}

- (void)setRefreshRate:(double)a3
{
  self->super._refreshRate = a3;
}

- (void)setHdrMode:(int64_t)a3
{
  self->super._hdrMode = a3;
}

- (void)setLogicalScale:(CGSize)a3
{
  self->super._logicalScale = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[FBSDisplayConfigurationRequest init](+[FBSDisplayConfigurationRequest allocWithZone:](FBSDisplayConfigurationRequest, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->super._overscanCompensation;
  *((_OWORD *)result + 1) = self->super._nativePixelSize;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->super._pointScale;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->super._refreshRate;
  *((_QWORD *)result + 6) = self->super._hdrMode;
  *(CGSize *)((char *)result + 56) = self->super._logicalScale;
  return result;
}

@end
