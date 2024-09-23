@implementation ARGeoTrackingTechniqueStatePose

- (ARGeoTrackingTechniqueStatePose)initWithTimestamp:(double)a3 transform:(uint64_t)a4 fused:(__int128 *)a5 heading:(BOOL)a6
{
  ARGeoTrackingTechniqueStatePose *result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)ARGeoTrackingTechniqueStatePose;
  result = -[ARGeoTrackingTechniqueStatePose init](&v17, sel_init);
  if (result)
  {
    result->_timestamp = a2;
    v11 = *a5;
    v12 = a5[1];
    v13 = a5[3];
    *(_OWORD *)&result[2].super.isa = a5[2];
    *(_OWORD *)&result[2]._timestamp = v13;
    *(_OWORD *)&result[1].super.isa = v11;
    *(_OWORD *)&result[1]._timestamp = v12;
    v14 = a5[4];
    v15 = a5[5];
    v16 = a5[7];
    *(_OWORD *)&result[4].super.isa = a5[6];
    *(_OWORD *)&result[4]._timestamp = v16;
    *(_OWORD *)&result[3].super.isa = v14;
    *(_OWORD *)&result[3]._timestamp = v15;
    result->_fused = a6;
    result->_heading = a3 + ceil(a3 / -6.28318531) * 6.28318531;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__n128)transform
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

- (BOOL)fused
{
  return self->_fused;
}

- (double)heading
{
  return self->_heading;
}

@end
