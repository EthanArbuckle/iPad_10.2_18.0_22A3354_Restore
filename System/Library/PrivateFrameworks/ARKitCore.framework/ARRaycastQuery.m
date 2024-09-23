@implementation ARRaycastQuery

- (ARRaycastQuery)initWithOrigin:(simd_float3)origin direction:(simd_float3)direction allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment
{
  ARRaycastQuery *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARRaycastQuery;
  result = -[ARRaycastQuery init](&v11, sel_init);
  if (result)
  {
    *(simd_float3 *)result->_origin = origin;
    *(simd_float3 *)result->_direction = direction;
    result->_target = target;
    result->_targetAlignment = alignment;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  float32x4_t v6;
  float32x4_t v7;
  uint32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  uint32x4_t v11;
  ARRaycastTarget v12;
  ARRaycastTargetAlignment v13;
  BOOL v14;
  float32x4_t v16;
  float32x4_t v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ARRaycastQuery origin](self, "origin");
    v16 = v6;
    objc_msgSend(v5, "origin");
    v8 = (uint32x4_t)vceqq_f32(v16, v7);
    v8.i32[3] = v8.i32[2];
    if ((vminvq_u32(v8) & 0x80000000) != 0
      && (-[ARRaycastQuery direction](self, "direction"),
          v17 = v9,
          objc_msgSend(v5, "direction"),
          v11 = (uint32x4_t)vceqq_f32(v17, v10),
          v11.i32[3] = v11.i32[2],
          (vminvq_u32(v11) & 0x80000000) != 0)
      && (v12 = -[ARRaycastQuery target](self, "target"), v12 == objc_msgSend(v5, "target")))
    {
      v13 = -[ARRaycastQuery targetAlignment](self, "targetAlignment");
      v14 = v13 == objc_msgSend(v5, "targetAlignment");
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  ARRaycastTargetAlignment v3;
  __CFString *v4;
  ARRaycastTarget v5;
  __CFString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  __n128 v10;
  void *v11;
  __n128 v12;
  void *v13;
  void *v14;

  v3 = -[ARRaycastQuery targetAlignment](self, "targetAlignment");
  if ((unint64_t)v3 > ARRaycastTargetAlignmentAny)
    v4 = 0;
  else
    v4 = off_1E6674098[v3];
  v5 = -[ARRaycastQuery target](self, "target");
  if (v5 == ARRaycastTargetEstimatedPlane)
  {
    v6 = CFSTR("estimatedPlane");
  }
  else
  {
    if (v5 == ARRaycastTargetExistingPlaneInfinite)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("existingPlaneInfinite (%@)"), v4);
    }
    else
    {
      if (v5)
      {
        v6 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("existingPlaneGeometry (%@)"), v4);
    }
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARRaycastQuery origin](self, "origin");
  ARVector3Description(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARRaycastQuery direction](self, "direction");
  ARVector3Description(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p origin=%@ direction=%@ target=%@>"), v9, self, v11, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (simd_float3)origin
{
  return *(simd_float3 *)self->_origin;
}

- (simd_float3)direction
{
  return *(simd_float3 *)self->_direction;
}

- (ARRaycastTarget)target
{
  return self->_target;
}

- (ARRaycastTargetAlignment)targetAlignment
{
  return self->_targetAlignment;
}

@end
