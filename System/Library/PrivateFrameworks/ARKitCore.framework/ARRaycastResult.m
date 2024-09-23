@implementation ARRaycastResult

- (__n128)initWithWorldTransform:(__n128)a3 target:(__n128)a4 targetAlignment:(__n128)a5
{
  ARRaycastResult *v10;
  __n128 result;
  objc_super v16;

  v16.receiver = a1;
  v16.super_class = (Class)ARRaycastResult;
  v10 = -[ARRaycastResult init](&v16, sel_init);
  if (v10)
  {
    *(__n128 *)v10->_anon_30 = a2;
    *(__n128 *)&v10->_anon_30[16] = a3;
    result = a5;
    *(__n128 *)&v10->_anon_30[32] = a4;
    *(__n128 *)&v10->_anon_30[48] = a5;
    *(__n128 *)&v10[1].super.isa = a2;
    *(__n128 *)&v10[1]._targetAlignment = a3;
    *(__n128 *)&v10[1]._anchorIdentifier = a4;
    *(__n128 *)v10[1]._anon_30 = a5;
    v10->_target = a7;
    v10->_targetAlignment = a8;
  }
  return result;
}

- (id)_description:(BOOL)a3
{
  _BOOL4 v3;
  ARRaycastTargetAlignment v5;
  __CFString *v6;
  ARRaycastTarget v7;
  __CFString *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  void *v16;
  void *v17;

  v3 = a3;
  v5 = -[ARRaycastResult targetAlignment](self, "targetAlignment");
  if ((unint64_t)v5 > ARRaycastTargetAlignmentAny)
    v6 = 0;
  else
    v6 = off_1E66745A8[v5];
  v7 = -[ARRaycastResult target](self, "target");
  if (v7 == ARRaycastTargetEstimatedPlane)
  {
    v8 = CFSTR("estimatedPlane");
  }
  else
  {
    if (v7 == ARRaycastTargetExistingPlaneInfinite)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("existingPlaneInfinite (%@)"), v6);
    }
    else
    {
      if (v7)
      {
        v8 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("existingPlaneGeometry (%@)"), v6);
    }
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARRaycastResult worldTransform](self, "worldTransform");
  ARMatrix4x4Description(v3, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p target=%@ worldTransform=%@>"), v11, self, v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)description
{
  return -[ARRaycastResult _description:](self, "_description:", 0);
}

- (simd_float4x4)worldTransform
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4x4 result;

  v2 = *(simd_float4 *)self->_anon_30;
  v3 = *(simd_float4 *)&self->_anon_30[16];
  v4 = *(simd_float4 *)&self->_anon_30[32];
  v5 = *(simd_float4 *)&self->_anon_30[48];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (ARRaycastTarget)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_target = a3;
}

- (ARRaycastTargetAlignment)targetAlignment
{
  return self->_targetAlignment;
}

- (ARAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (__n128)localTransform
{
  return a1[7];
}

- (__n128)setLocalTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (NSUUID)anchorIdentifier
{
  return self->_anchorIdentifier;
}

- (void)setAnchorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_anchorIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorIdentifier, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
