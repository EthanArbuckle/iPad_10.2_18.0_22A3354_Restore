@implementation ARInertialState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARInertialState)initWithCovarianceMatrix:(double *)a3
{
  ARInertialState *v4;
  ARInertialState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARInertialState;
  v4 = -[ARInertialState init](&v7, sel_init);
  v5 = v4;
  if (v4)
    memcpy(v4->_covarianceMatrix, a3, sizeof(v4->_covarianceMatrix));
  return v5;
}

- (double)covarianceMatrix
{
  return self->_covarianceMatrix;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double *covarianceMatrix;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0C99D50];
  covarianceMatrix = self->_covarianceMatrix;
  v6 = a3;
  objc_msgSend(v4, "dataWithBytesNoCopy:length:freeWhenDone:", covarianceMatrix, 1800, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("covarianceMatrix"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &self[1], 96, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("orientation"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_position, 32, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("position"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_velocity, 32, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("velocity"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_accelerometerBias, 32, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("accelerometerBias"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_gyroscopeBias, 32, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("gyroscopeBias"));
}

- (ARInertialState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  ARInertialState *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ARInertialState *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("covarianceMatrix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") == 1800)
  {
    v6 = objc_retainAutorelease(v5);
    v7 = -[ARInertialState initWithCovarianceMatrix:](self, "initWithCovarianceMatrix:", objc_msgSend(v6, "bytes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orientation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "getBytes:length:", &v7[1], 96);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("position"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "getBytes:length:", v7->_position, 32);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("velocity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "getBytes:length:", v7->_velocity, 32);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accelerometerBias"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "getBytes:length:", v7->_accelerometerBias, 32);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gyroscopeBias"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "getBytes:length:", v7->_gyroscopeBias, 32);
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float64x2_t *v5;
  int64x2_t v6;
  int64x2_t v7;
  int64x2_t v8;
  int64x2_t v9;
  unint64_t v10;
  int64x2_t v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float64x2_t *)v4;
    if (!memcmp(self->_covarianceMatrix, &v5->f64[1], 0x708uLL)
      && (v6 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[3], v5[123]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1].super.isa, v5[121])), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[7], v5[125])), (vandq_s8((int8x16_t)vdupq_laneq_s64(v6, 1), vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[5], v5[124]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[1], v5[122])), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[9], v5[126])), (int8x16_t)v6)).u64[0] & 0x8000000000000000) != 0)&& (v7 = vceqq_f64(*(float64x2_t *)self->_position, v5[113]), (vandq_s8((int8x16_t)vdupq_laneq_s64(v7, 1), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_position[16], v5[114]), (int8x16_t)v7)).u64[0] & 0x8000000000000000) != 0)&& (v8 = vceqq_f64(*(float64x2_t *)self->_velocity, v5[115]), (vandq_s8(
             (int8x16_t)vdupq_laneq_s64(v8, 1),
             vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_velocity[16], v5[116]), (int8x16_t)v8)).u64[0] & 0x8000000000000000) != 0)
      && (v9 = vceqq_f64(*(float64x2_t *)self->_accelerometerBias, v5[117]),
          (vandq_s8((int8x16_t)vdupq_laneq_s64(v9, 1), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_accelerometerBias[16], v5[118]), (int8x16_t)v9)).u64[0] & 0x8000000000000000) != 0))
    {
      v12 = vceqq_f64(*(float64x2_t *)self->_gyroscopeBias, v5[119]);
      v10 = vandq_s8((int8x16_t)vdupq_laneq_s64(v12, 1), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_gyroscopeBias[16], v5[120]), (int8x16_t)v12)).u64[0] >> 63;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (__n128)orientation
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 1984);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 1968);
  *(_OWORD *)(a2 + 48) = v2;
  v3 = *(_OWORD *)(a1 + 2016);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 2000);
  *(_OWORD *)(a2 + 80) = v3;
  result = *(__n128 *)(a1 + 1936);
  v5 = *(_OWORD *)(a1 + 1952);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)setOrientation:(__int128 *)a3
{
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v3 = *a3;
  *(_OWORD *)(a1 + 1952) = a3[1];
  *(_OWORD *)(a1 + 1936) = v3;
  result = (__n128)a3[2];
  v5 = a3[3];
  v6 = a3[4];
  *(_OWORD *)(a1 + 2016) = a3[5];
  *(_OWORD *)(a1 + 2000) = v6;
  *(_OWORD *)(a1 + 1984) = v5;
  *(__n128 *)(a1 + 1968) = result;
  return result;
}

- (__n128)position
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 1808);
  v3 = *(_OWORD *)(a1 + 1824);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setPosition:(ARInertialState *)self
{
  __int128 *v2;
  __int128 v3;

  v3 = *v2;
  *(_OWORD *)&self->_position[16] = v2[1];
  *(_OWORD *)self->_position = v3;
}

- (__n128)velocity
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 1840);
  v3 = *(_OWORD *)(a1 + 1856);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setVelocity:(ARInertialState *)self
{
  __int128 *v2;
  __int128 v3;

  v3 = *v2;
  *(_OWORD *)&self->_velocity[16] = v2[1];
  *(_OWORD *)self->_velocity = v3;
}

- (__n128)accelerometerBias
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 1872);
  v3 = *(_OWORD *)(a1 + 1888);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setAccelerometerBias:(ARInertialState *)self
{
  __int128 *v2;
  __int128 v3;

  v3 = *v2;
  *(_OWORD *)&self->_accelerometerBias[16] = v2[1];
  *(_OWORD *)self->_accelerometerBias = v3;
}

- (__n128)gyroscopeBias
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 1904);
  v3 = *(_OWORD *)(a1 + 1920);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setGyroscopeBias:(ARInertialState *)self
{
  __int128 *v2;
  __int128 v3;

  v3 = *v2;
  *(_OWORD *)&self->_gyroscopeBias[16] = v2[1];
  *(_OWORD *)self->_gyroscopeBias = v3;
}

@end
