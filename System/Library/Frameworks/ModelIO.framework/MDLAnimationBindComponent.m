@implementation MDLAnimationBindComponent

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  __int128 v10;
  const char *v11;
  _OWORD var10[2];

  v4 = (void *)objc_msgSend_allocWithZone_(MDLAnimationBindComponent, a2, (uint64_t)a3);
  v7 = (void *)objc_msgSend_init(v4, v5, v6);
  objc_msgSend_setSkeleton_(v7, v8, (uint64_t)self->_skeleton);
  objc_msgSend_setJointAnimation_(v7, v9, (uint64_t)self->_jointAnimation);
  v10 = *(_OWORD *)&self[1]._jointAnimation;
  var10[0] = *(_OWORD *)&self[1].super.isa;
  var10[1] = v10;
  objc_msgSend_setGeometryBindTransform_(v7, v11, (uint64_t)var10);
  return v7;
}

- (MDLSkeleton)skeleton
{
  return self->_skeleton;
}

- (void)setSkeleton:(MDLSkeleton *)skeleton
{
  objc_storeStrong((id *)&self->_skeleton, skeleton);
}

- (id)jointAnimation
{
  return self->_jointAnimation;
}

- (void)setJointAnimation:(id)jointAnimation
{
  objc_storeStrong((id *)&self->_jointAnimation, jointAnimation);
}

- (NSArray)jointPaths
{
  return self->_jointPaths;
}

- (void)setJointPaths:(NSArray *)jointPaths
{
  objc_storeStrong((id *)&self->_jointPaths, jointPaths);
}

- (__n128)geometryBindTransform
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 80);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setGeometryBindTransform:(__int128 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[3];
  *(_OWORD *)(a1 + 64) = a3[2];
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = (__n128)a3[4];
  v7 = a3[5];
  v8 = a3[7];
  *(_OWORD *)(a1 + 128) = a3[6];
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jointPaths, 0);
  objc_storeStrong((id *)&self->_jointAnimation, 0);
  objc_storeStrong((id *)&self->_skeleton, 0);
}

@end
