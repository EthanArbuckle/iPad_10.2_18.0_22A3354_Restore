@implementation AR3DSkeletonRegistrationData

- (AR3DSkeletonRegistrationData)init
{
  AR3DSkeletonRegistrationData *result;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AR3DSkeletonRegistrationData;
  result = -[AR3DSkeletonRegistrationData init](&v6, sel_init);
  if (result)
  {
    result->_estimatedScaleFactor = 1.0;
    v3 = MEMORY[0x1E0C83FF0];
    v4 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *(_OWORD *)&result[1].super.isa = *MEMORY[0x1E0C83FF0];
    *(_OWORD *)&result[1]._timestamp = v4;
    v5 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)&result[2].super.isa = *(_OWORD *)(v3 + 32);
    *(_OWORD *)&result[2]._timestamp = v5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_estimatedScaleFactor);
  v5 = *(_OWORD *)&self[1].super.isa;
  v6 = *(_OWORD *)&self[1]._timestamp;
  v7 = *(_OWORD *)&self[2]._timestamp;
  *((_OWORD *)result + 4) = *(_OWORD *)&self[2].super.isa;
  *((_OWORD *)result + 5) = v7;
  *((_OWORD *)result + 2) = v5;
  *((_OWORD *)result + 3) = v6;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_timestamp;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = v5;
    if (vabdd_f64(*((double *)v5 + 2), self->_timestamp) >= 0.00000011920929
      || vabds_f32(*((float *)v5 + 2), self->_estimatedScaleFactor) >= 0.00000011921)
    {
      v7 = 0;
    }
    else
    {
      v7 = AREqualTransforms(*((float32x4_t *)v5 + 2), *((float32x4_t *)v5 + 3), *((float32x4_t *)v5 + 4), *((float32x4_t *)v5 + 5), *(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._timestamp, *(float32x4_t *)&self[2].super.isa, *(float32x4_t *)&self[2]._timestamp);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (void)setEstimatedScaleFactor:(float)a3
{
  self->_estimatedScaleFactor = a3;
}

- (__n128)visionTransform
{
  return a1[2];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

@end
