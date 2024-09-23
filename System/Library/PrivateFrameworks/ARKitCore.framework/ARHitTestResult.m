@implementation ARHitTestResult

- (ARHitTestResult)initWithType:(unint64_t)a3
{
  ARHitTestResult *result;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARHitTestResult;
  result = -[ARHitTestResult init](&v10, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_distance = 0.0;
    v5 = MEMORY[0x1E0C83FF0];
    v6 = *MEMORY[0x1E0C83FF0];
    v7 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *(_OWORD *)result->_anon_20 = *MEMORY[0x1E0C83FF0];
    *(_OWORD *)&result->_anon_20[16] = v7;
    v8 = *(_OWORD *)(v5 + 32);
    v9 = *(_OWORD *)(v5 + 48);
    *(_OWORD *)&result->_anon_20[32] = v8;
    *(_OWORD *)&result->_anon_20[48] = v9;
    *(_OWORD *)&result[1].super.isa = v6;
    *(_OWORD *)&result[1]._distance = v7;
    *(_OWORD *)result[1]._anon_20 = v8;
    *(_OWORD *)&result[1]._anon_20[16] = v9;
  }
  return result;
}

- (id)_description:(BOOL)a3
{
  _BOOL4 v3;
  ARHitTestResultType v5;
  __CFString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  void *v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = a3;
  v5 = -[ARHitTestResult type](self, "type");
  v6 = CFSTR("featurePoint");
  switch(v5)
  {
    case 1uLL:
      break;
    case 2uLL:
      v6 = CFSTR("estimatedHorizontalPlane");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 4uLL:
      v6 = CFSTR("estimatedVerticalPlane");
      break;
    case 8uLL:
      v6 = CFSTR("existingPlane");
      break;
    default:
      if (v5 == 16)
      {
        v6 = CFSTR("existingPlaneUsingExtent");
      }
      else if (v5 == 32)
      {
        v6 = CFSTR("existingPlaneUsingGeometry");
      }
      else
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[ARHitTestResult type](self, "type"));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  v7 = (void *)MEMORY[0x1E0CB37A0];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARHitTestResult distance](self, "distance");
  v11 = v10;
  -[ARHitTestResult localTransform](self, "localTransform");
  ARMatrix4x4Description(v3, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARHitTestResult worldTransform](self, "worldTransform");
  ARMatrix4x4Description(v3, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p type=%@ distance=%f localTransform=%@ worldTransform=%@"), v9, self, v6, v11, v16, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARHitTestResult anchor](self, "anchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[ARHitTestResult anchor](self, "anchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appendFormat:", CFSTR(" anchor=%@"), v24);

  }
  objc_msgSend(v22, "appendString:", CFSTR(">"));

  return v22;
}

- (id)description
{
  return -[ARHitTestResult _description:](self, "_description:", 0);
}

- (id)debugQuickLookObject
{
  return -[ARHitTestResult _description:](self, "_description:", 1);
}

- (ARHitTestResultType)type
{
  return self->_type;
}

- (CGFloat)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (simd_float4x4)localTransform
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4x4 result;

  v2 = *(simd_float4 *)self->_anon_20;
  v3 = *(simd_float4 *)&self->_anon_20[16];
  v4 = *(simd_float4 *)&self->_anon_20[32];
  v5 = *(simd_float4 *)&self->_anon_20[48];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setLocalTransform:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

- (simd_float4x4)worldTransform
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4x4 result;

  v2 = *(simd_float4 *)&self[1].super.isa;
  v3 = *(simd_float4 *)&self[1]._distance;
  v4 = *(simd_float4 *)self[1]._anon_20;
  v5 = *(simd_float4 *)&self[1]._anon_20[16];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setWorldTransform:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  result[9] = a5;
  return result;
}

- (ARAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
