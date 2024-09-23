@implementation AREnvironmentProbeAnchor

- (AREnvironmentProbeAnchor)initWithTransform:(void *)a1
{
  AREnvironmentProbeAnchor *v1;
  AREnvironmentProbeAnchor *v2;
  uint64_t v3;
  NSSet *sourceKeyframeUUIDs;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)AREnvironmentProbeAnchor;
  v1 = -[ARAnchor initWithTransform:](&v6, sel_initWithTransform_);
  v2 = v1;
  if (v1)
  {
    *(int32x4_t *)v1->_extent = vdupq_n_s32(0x7F800000u);
    v3 = objc_opt_new();
    sourceKeyframeUUIDs = v2->_sourceKeyframeUUIDs;
    v2->_sourceKeyframeUUIDs = (NSSet *)v3;

  }
  return v2;
}

- (AREnvironmentProbeAnchor)initWithName:(double)a3 transform:(double)a4
{
  id v8;
  AREnvironmentProbeAnchor *v9;
  AREnvironmentProbeAnchor *v10;
  uint64_t v11;
  NSSet *sourceKeyframeUUIDs;
  objc_super v18;

  v8 = a7;
  v18.receiver = a1;
  v18.super_class = (Class)AREnvironmentProbeAnchor;
  v9 = -[ARAnchor initWithName:transform:](&v18, sel_initWithName_transform_, v8, a2, a3, a4, a5);
  v10 = v9;
  if (v9)
  {
    *(int32x4_t *)v9->_extent = vdupq_n_s32(0x7F800000u);
    v11 = objc_opt_new();
    sourceKeyframeUUIDs = v10->_sourceKeyframeUUIDs;
    v10->_sourceKeyframeUUIDs = (NSSet *)v11;

  }
  return v10;
}

- (AREnvironmentProbeAnchor)initWithIdentifier:(double)a3 transform:(double)a4
{
  id v8;
  AREnvironmentProbeAnchor *v9;
  AREnvironmentProbeAnchor *v10;
  uint64_t v11;
  NSSet *sourceKeyframeUUIDs;
  objc_super v18;

  v8 = a7;
  v18.receiver = a1;
  v18.super_class = (Class)AREnvironmentProbeAnchor;
  v9 = -[ARAnchor initWithIdentifier:transform:](&v18, sel_initWithIdentifier_transform_, v8, a2, a3, a4, a5);
  v10 = v9;
  if (v9)
  {
    *(int32x4_t *)v9->_extent = vdupq_n_s32(0x7F800000u);
    v11 = objc_opt_new();
    sourceKeyframeUUIDs = v10->_sourceKeyframeUUIDs;
    v10->_sourceKeyframeUUIDs = (NSSet *)v11;

  }
  return v10;
}

- (AREnvironmentProbeAnchor)initWithTransform:(simd_float4x4)transform extent:(simd_float3)extent
{
  AREnvironmentProbeAnchor *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AREnvironmentProbeAnchor;
  result = -[ARAnchor initWithTransform:](&v6, sel_initWithTransform_, *(double *)transform.columns[0].i64, *(double *)transform.columns[1].i64, *(double *)transform.columns[2].i64, *(double *)transform.columns[3].i64);
  if (result)
    *(simd_float3 *)result->_extent = extent;
  return result;
}

- (AREnvironmentProbeAnchor)initWithName:(NSString *)name transform:(simd_float4x4)transform extent:(simd_float3)extent
{
  AREnvironmentProbeAnchor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AREnvironmentProbeAnchor;
  result = -[ARAnchor initWithName:transform:](&v7, sel_initWithName_transform_, name, *(double *)transform.columns[0].i64, *(double *)transform.columns[1].i64, *(double *)transform.columns[2].i64, *(double *)transform.columns[3].i64);
  if (result)
    *(simd_float3 *)result->_extent = extent;
  return result;
}

- (__n128)initWithIdentifier:(double)a3 transform:(double)a4 extent:(double)a5
{
  AREnvironmentProbeAnchor *v6;
  __n128 result;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)AREnvironmentProbeAnchor;
  v6 = -[ARAnchor initWithIdentifier:transform:](&v9, sel_initWithIdentifier_transform_);
  if (v6)
  {
    result = a6;
    *(__n128 *)v6->_extent = a6;
  }
  return result;
}

- (AREnvironmentProbeAnchor)initWithIdentifier:(id)a3 onPlane:(ARTexturedPlane *)a4
{
  id v6;
  AREnvironmentProbeAnchor *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  float32x4_t v14;

  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  convert(a4, &v10);
  v7 = -[AREnvironmentProbeAnchor initWithIdentifier:transform:extent:](self, "initWithIdentifier:transform:extent:", v6, *(double *)&v10, *(double *)&v11, *(double *)&v12, *(double *)&v13, *(double *)vmulq_f32(v14, (float32x4_t)xmmword_1B3BE40D0).i64);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a4);
    -[AREnvironmentProbeAnchor setTrackedPlaneIdentifier:](v7, "setTrackedPlaneIdentifier:", v8);

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  void *v11;
  void *v12;
  __n128 v13;
  void *v14;
  void *v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;

  -[ARAnchor name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ARAnchor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ARAnchor name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARAnchor transform](self, "transform");
    ARMatrix4x4Description(0, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AREnvironmentProbeAnchor environmentTexture](self, "environmentTexture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AREnvironmentProbeAnchor extent](self, "extent");
    ARVector3Description(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p id=\"%@\" n=\"%@\" T=%@ t=%p e=%@>"), self, v5, v6, v11, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ARAnchor transform](self, "transform");
    ARMatrix4x4Description(0, v16, v17, v18, v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AREnvironmentProbeAnchor environmentTexture](self, "environmentTexture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AREnvironmentProbeAnchor extent](self, "extent");
    ARVector3Description(v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p id=\"%@\" T=%@ t=%p e=%@>"), self, v5, v6, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (AREnvironmentProbeAnchor)initWithAnchor:(id)a3
{
  id v4;
  AREnvironmentProbeAnchor *v5;
  uint64_t v6;
  MTLTexture *environmentTexture;
  float v8;
  uint64_t v9;
  ARParametricLights *parametricLights;
  uint64_t v11;
  NSSet *sourceKeyframeUUIDs;
  __int128 v13;
  uint64_t v14;
  NSUUID *trackedPlaneIdentifier;
  uint64_t v16;
  NSData *colorHistogram;
  float v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AREnvironmentProbeAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v20, sel_initWithAnchor_, v4);
  if (v5)
  {
    objc_msgSend(v4, "environmentTexture");
    v6 = objc_claimAutoreleasedReturnValue();
    environmentTexture = v5->_environmentTexture;
    v5->_environmentTexture = (MTLTexture *)v6;

    objc_msgSend(v4, "clippingPointLux");
    v5->_clippingPointLux = v8;
    objc_msgSend(v4, "parametricLights");
    v9 = objc_claimAutoreleasedReturnValue();
    parametricLights = v5->_parametricLights;
    v5->_parametricLights = (ARParametricLights *)v9;

    objc_msgSend(v4, "sourceKeyframeUUIDs");
    v11 = objc_claimAutoreleasedReturnValue();
    sourceKeyframeUUIDs = v5->_sourceKeyframeUUIDs;
    v5->_sourceKeyframeUUIDs = (NSSet *)v11;

    objc_msgSend(v4, "extent");
    *(_OWORD *)v5->_extent = v13;
    objc_msgSend(v4, "trackedPlaneIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    trackedPlaneIdentifier = v5->_trackedPlaneIdentifier;
    v5->_trackedPlaneIdentifier = (NSUUID *)v14;

    objc_msgSend(v4, "colorHistogram");
    v16 = objc_claimAutoreleasedReturnValue();
    colorHistogram = v5->_colorHistogram;
    v5->_colorHistogram = (NSData *)v16;

    objc_msgSend(v4, "opaquePixelPercentage");
    v5->_opaquePixelPercentage = v18;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AREnvironmentProbeAnchor;
  -[ARAnchor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[AREnvironmentProbeAnchor extent](self, "extent");
  objc_msgSend(v4, "ar_encodeVector3:forKey:", CFSTR("extent"));
  -[AREnvironmentProbeAnchor trackedPlaneIdentifier](self, "trackedPlaneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("trackedPlaneIdentifier"));

}

- (AREnvironmentProbeAnchor)initWithCoder:(id)a3
{
  id v4;
  AREnvironmentProbeAnchor *v5;
  __int128 v6;
  uint64_t v7;
  NSUUID *trackedPlaneIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AREnvironmentProbeAnchor;
  v5 = -[ARAnchor initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("extent"));
    *(_OWORD *)v5->_extent = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackedPlaneIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    trackedPlaneIdentifier = v5->_trackedPlaneIdentifier;
    v5->_trackedPlaneIdentifier = (NSUUID *)v7;

  }
  return v5;
}

- (void)setEnvironmentTexture:(id)a3
{
  MTLTexture *v5;
  MTLTexture *v6;

  v5 = (MTLTexture *)a3;
  if (self->_environmentTexture != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_environmentTexture, a3);
    v5 = v6;
    self->_averageIntensity = 0.0;
  }

}

- (float)averageIntensity
{
  float result;
  MTLTexture *environmentTexture;

  result = self->_averageIntensity;
  if (result == 0.0)
  {
    environmentTexture = self->_environmentTexture;
    if (environmentTexture)
    {
      result = ARAverageCubemapIntensity(environmentTexture);
      self->_averageIntensity = result;
    }
  }
  return result;
}

- (id)environmentTexture
{
  return self->_environmentTexture;
}

- (simd_float3)extent
{
  return *(simd_float3 *)self->_extent;
}

- (float)clippingPointLux
{
  return self->_clippingPointLux;
}

- (void)setClippingPointLux:(float)a3
{
  self->_clippingPointLux = a3;
}

- (ARParametricLights)parametricLights
{
  return self->_parametricLights;
}

- (void)setParametricLights:(id)a3
{
  objc_storeStrong((id *)&self->_parametricLights, a3);
}

- (NSSet)sourceKeyframeUUIDs
{
  return self->_sourceKeyframeUUIDs;
}

- (void)setSourceKeyframeUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_sourceKeyframeUUIDs, a3);
}

- (NSData)colorHistogram
{
  return self->_colorHistogram;
}

- (void)setColorHistogram:(id)a3
{
  objc_storeStrong((id *)&self->_colorHistogram, a3);
}

- (float)opaquePixelPercentage
{
  return self->_opaquePixelPercentage;
}

- (void)setOpaquePixelPercentage:(float)a3
{
  self->_opaquePixelPercentage = a3;
}

- (NSUUID)trackedPlaneIdentifier
{
  return self->_trackedPlaneIdentifier;
}

- (void)setTrackedPlaneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_trackedPlaneIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPlaneIdentifier, 0);
  objc_storeStrong((id *)&self->_colorHistogram, 0);
  objc_storeStrong((id *)&self->_sourceKeyframeUUIDs, 0);
  objc_storeStrong((id *)&self->_parametricLights, 0);
  objc_storeStrong((id *)&self->_environmentTexture, 0);
}

@end
