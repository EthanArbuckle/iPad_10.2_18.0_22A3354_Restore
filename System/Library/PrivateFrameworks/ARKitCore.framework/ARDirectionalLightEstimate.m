@implementation ARDirectionalLightEstimate

- (ARDirectionalLightEstimate)initWithSphericalHarmonics:(id *)a3 ambientIntensity:(double)a4 temperature:(double)a5
{
  char *v9;
  float32x4_t *v10;
  float v11;
  __int128 v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  void *v16;
  _OWORD v18[2];
  int v19;
  objc_super v20;
  float32x4_t v21;
  __int128 v22;

  v21 = 0u;
  v22 = 0u;
  ARPrimaryLightFromSphericalHarmonics((uint64_t)a3, &v21, 1000.0, *(float32x4_t *)&a5);
  v20.receiver = self;
  v20.super_class = (Class)ARDirectionalLightEstimate;
  v9 = -[ARLightEstimate initWithAmbientIntensity:temperature:](&v20, sel_initWithAmbientIntensity_temperature_, a4, a5);
  v10 = (float32x4_t *)v9;
  if (v9)
  {
    v11 = a3->var0[8];
    v12 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)(v9 + 24) = *(_OWORD *)a3->var0;
    *(_OWORD *)(v9 + 40) = v12;
    *((float *)v9 + 14) = v11;
    v19 = 0;
    memset(v18, 0, sizeof(v18));
    ARSphericalHarmonicsByFlippingZAxis((__int128 *)a3, (uint64_t)v18);
    v13 = vnegq_f32(v21);
    v10[6] = v13;
    *(double *)v13.i64 = *(float *)&v22;
    *(double *)&v10[4].i64[1] = *(float *)&v22;
    v13.f32[0] = a5;
    ARSphericalHarmonicsDataWithCoefficients((uint64_t)v18, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v10[4].i64[0];
    v10[4].i64[0] = v15;

  }
  return (ARDirectionalLightEstimate *)v10;
}

- (ARDirectionalLightEstimate)initWithDirectionalLightEstimate:(id)a3
{
  char *v4;
  double v5;
  double v6;
  double v7;
  char *v8;
  ARDirectionalLightEstimate *v9;
  int v10;
  __int128 v11;
  objc_super v13;

  v4 = (char *)a3;
  objc_msgSend(v4, "ambientIntensity");
  v6 = v5;
  objc_msgSend(v4, "ambientColorTemperature");
  v13.receiver = self;
  v13.super_class = (Class)ARDirectionalLightEstimate;
  v8 = -[ARLightEstimate initWithAmbientIntensity:temperature:](&v13, sel_initWithAmbientIntensity_temperature_, v6, v7);
  v9 = (ARDirectionalLightEstimate *)v8;
  if (v8)
  {
    v10 = *((_DWORD *)v4 + 14);
    v11 = *(_OWORD *)(v4 + 40);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(v4 + 24);
    *(_OWORD *)(v8 + 40) = v11;
    *((_DWORD *)v8 + 14) = v10;
    *((_OWORD *)v8 + 6) = *((_OWORD *)v4 + 6);
    *((_QWORD *)v8 + 9) = *((_QWORD *)v4 + 9);
    objc_storeStrong((id *)v8 + 8, *((id *)v4 + 8));
    v9->_timestamp = *((double *)v4 + 10);
    v9->_confidenceRating = *((double *)v4 + 11);
  }

  return v9;
}

- (NSData)sphericalHarmonicsCoefficients
{
  return self->_sphericalHarmonicsCoefficients;
}

- (ARDirectionalLightEstimate)lightEstimateByApplyingRotation:(uint64_t)a1
{
  ARDirectionalLightEstimate *v3;
  double v4;
  double v5;
  double v6;
  ARDirectionalLightEstimate *v7;
  _OWORD v9[2];
  int v10;
  __int128 v11;
  __int128 v12;
  int v13;

  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  ARSphericalHarmonicsByApplyingRotation((__int128 *)(a1 + 24), (uint64_t)&v11, a2);
  v3 = [ARDirectionalLightEstimate alloc];
  objc_msgSend((id)a1, "ambientIntensity");
  v5 = v4;
  objc_msgSend((id)a1, "ambientColorTemperature");
  v9[0] = v11;
  v9[1] = v12;
  v10 = v13;
  v7 = -[ARDirectionalLightEstimate initWithSphericalHarmonics:ambientIntensity:temperature:](v3, "initWithSphericalHarmonics:ambientIntensity:temperature:", v9, v5, v6);
  objc_msgSend((id)a1, "timestamp");
  -[ARDirectionalLightEstimate setTimestamp:](v7, "setTimestamp:");
  objc_msgSend((id)a1, "confidenceRating");
  -[ARDirectionalLightEstimate setConfidenceRating:](v7, "setConfidenceRating:");
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  float v11;
  uint64_t v12;
  float v14[27];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARLightEstimate ambientIntensity](self, "ambientIntensity");
  objc_msgSend(v6, "appendFormat:", CFSTR(" ambientIntensity=%.2f"), v7);
  -[ARLightEstimate ambientColorTemperature](self, "ambientColorTemperature");
  objc_msgSend(v6, "appendFormat:", CFSTR(" ambientColorTemperature=%.2f"), v8);
  objc_msgSend(v6, "appendString:", CFSTR(" coefficients("));
  -[NSData getBytes:length:](self->_sphericalHarmonicsCoefficients, "getBytes:length:", v14, 108);
  for (i = 0; i != 27; ++i)
  {
    if ((_DWORD)i)
    {
      if ((_DWORD)i == 18)
      {
        v10 = CFSTR(", blue:");
      }
      else
      {
        if ((_DWORD)i != 9)
          goto LABEL_9;
        v10 = CFSTR(", green:");
      }
    }
    else
    {
      v10 = CFSTR("red:");
    }
    objc_msgSend(v6, "appendString:", v10);
LABEL_9:
    v11 = v14[i];
    if (v11 == 0.0)
      v12 = 0;
    else
      v12 = 6;
    objc_msgSend(v6, "appendFormat:", CFSTR(" %.*f"), v12, v11);
  }
  objc_msgSend(v6, "appendString:", CFSTR(")"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDirectionalLightEstimate:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARDirectionalLightEstimate)initWithCoder:(id)a3
{
  id v4;
  ARDirectionalLightEstimate *v5;
  uint64_t v6;
  NSData *sphericalHarmonicsCoefficients;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARDirectionalLightEstimate;
  v5 = -[ARLightEstimate initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sphericalHarmonicsCoefficients"));
    v6 = objc_claimAutoreleasedReturnValue();
    sphericalHarmonicsCoefficients = v5->_sphericalHarmonicsCoefficients;
    v5->_sphericalHarmonicsCoefficients = (NSData *)v6;

    objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("primaryLightDirection"));
    *(_OWORD *)v5->_primaryLightDirection = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("primaryLightIntensity"));
    v5->_primaryLightIntensity = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidenceRating"));
    v5->_confidenceRating = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARDirectionalLightEstimate;
  v4 = a3;
  -[ARLightEstimate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sphericalHarmonicsCoefficients, CFSTR("sphericalHarmonicsCoefficients"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", CFSTR("primaryLightDirection"), *(double *)self->_primaryLightDirection);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("primaryLightIntensity"), self->_primaryLightIntensity);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("confidenceRating"), self->_confidenceRating);

}

- (simd_float3)primaryLightDirection
{
  return *(simd_float3 *)self->_primaryLightDirection;
}

- (CGFloat)primaryLightIntensity
{
  return self->_primaryLightIntensity;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)confidenceRating
{
  return self->_confidenceRating;
}

- (void)setConfidenceRating:(double)a3
{
  self->_confidenceRating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sphericalHarmonicsCoefficients, 0);
}

@end
