@implementation BKSMutableWindowServerHitTestSecurityAnalysis

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSWindowServerHitTestSecurityAnalysis _initWithCopyOf:]([BKSWindowServerHitTestSecurityAnalysis alloc], self);
}

- (void)setCumulativeLayerTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m21 = v5;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m13 = v4;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m11 = v3;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m41 = v8;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m33 = v7;
  *(_OWORD *)&self->super._cumulativeLayerTransform.m31 = v6;
}

- (void)setCumulativeOpacity:(float)a3
{
  self->super._cumulativeOpacity = a3;
}

- (void)setHasInsecureFilter:(BOOL)a3
{
  self->super._hasInsecureFilter = a3;
}

- (void)setParentsHaveInsecureLayerProperties:(BOOL)a3
{
  self->super._parentsHaveInsecureLayerProperties = a3;
}

- (void)setOcclusionMask:(unsigned int)a3
{
  self->super._occlusionMask = a3;
}

- (void)setOcclusionPercentage:(float)a3
{
  self->super._occlusionPercentage = a3;
}

- (void)setOcclusionType:(int64_t)a3
{
  self->super._occlusionType = a3;
}

@end
