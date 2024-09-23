@implementation SCNHitTestResult

- (SCNHitTestResult)initWithResult:(__C3DHitTestResult *)a3
{
  SCNHitTestResult *v3;
  objc_super v6;

  v3 = self;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SCNHitTestResult;
    v3 = -[SCNHitTestResult init](&v6, sel_init);
    if (v3)
      v3->_result = (__C3DHitTestResult *)CFRetain(a3);
  }
  return v3;
}

- (void)dealloc
{
  __C3DHitTestResult *result;
  objc_super v4;

  result = self->_result;
  if (result)
  {
    CFRelease(result);
    self->_result = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNHitTestResult;
  -[SCNHitTestResult dealloc](&v4, sel_dealloc);
}

- (SCNNode)node
{
  SCNNode *result;

  result = (SCNNode *)C3DHitTestResultGetNode((uint64_t)self->_result);
  if (result)
    return +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", result);
  return result;
}

- (SCNNode)boneNode
{
  SCNNode *result;

  result = (SCNNode *)C3DHitTestResultGetJoint((uint64_t)self->_result);
  if (result)
    return +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", result);
  return result;
}

- (NSInteger)geometryIndex
{
  return C3DHitTestResultGetGeometryElementIndex((uint64_t)self->_result);
}

- (NSInteger)faceIndex
{
  return C3DHitTestResultGetPrimitiveIndex((uint64_t)self->_result);
}

- (SCNVector3)localCoordinates
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNHitTestResult simdLocalCoordinates](self, "simdLocalCoordinates");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldCoordinates
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNHitTestResult simdWorldCoordinates](self, "simdWorldCoordinates");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)localNormal
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNHitTestResult simdLocalNormal](self, "simdLocalNormal");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldNormal
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNHitTestResult simdWorldNormal](self, "simdWorldNormal");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (CGPoint)textureCoordinatesWithMappingChannel:(NSInteger)channel
{
  float64x2_t v3;
  double v4;
  CGPoint result;

  v3 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(C3DHitTestResultGetTextureCoordinates((uint64_t)self->_result, channel)));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGPoint)textureCoordinate
{
  double v3;
  double v4;
  CGPoint result;

  NSLog(CFSTR("textureCoordinate is deprecated - use textureCoordinateWithMappingChannel instead"), a2);
  -[SCNHitTestResult textureCoordinatesWithMappingChannel:](self, "textureCoordinatesWithMappingChannel:", 0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (SCNMatrix4)modelTransform
{
  __int128 *ModelTransform;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  SCNMatrix4 *result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  ModelTransform = (__int128 *)C3DHitTestResultGetModelTransform((uint64_t)self->_result);
  if (ModelTransform)
  {
    v5 = *ModelTransform;
    v6 = ModelTransform[1];
    v7 = ModelTransform[3];
    v11 = ModelTransform[2];
    v12 = v7;
    v9 = v5;
    v10 = v6;
  }
  else
  {
    C3DMatrix4x4MakeIdentity((uint64_t)&v9);
  }
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  C3DMatrix4x4ToSCNMatrix4((uint64_t)&v9, retstr);
  return result;
}

+ (id)hitTestResultsFromHitTestResultRef:(__CFArray *)a3
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  SCNHitTestResult *v7;

  v4 = -[__CFArray count](a3, "count");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v7 = -[SCNHitTestResult initWithResult:]([SCNHitTestResult alloc], "initWithResult:", -[__CFArray objectAtIndex:](a3, "objectAtIndex:", i));
      objc_msgSend(v5, "addObject:", v7);

    }
  }
  return v5;
}

- (id)description
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  objc_class *v10;

  -[SCNHitTestResult worldCoordinates](self, "worldCoordinates");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p <%f,%f,%f> | geometryIndex=%d node=%@ bone=%@>"), NSStringFromClass(v10), self, v4, v6, v8, -[SCNHitTestResult geometryIndex](self, "geometryIndex"), -[SCNHitTestResult node](self, "node"), -[SCNHitTestResult boneNode](self, "boneNode"));
}

- (simd_float3)simdLocalCoordinates
{
  simd_float3 *LocalPosition;

  LocalPosition = (simd_float3 *)C3DHitTestResultGetLocalPosition((uint64_t)self->_result);
  if (LocalPosition)
    return *LocalPosition;
  else
    return (simd_float3)0;
}

- (simd_float3)simdWorldCoordinates
{
  simd_float3 *WorldPosition;

  WorldPosition = (simd_float3 *)C3DHitTestResultGetWorldPosition((uint64_t)self->_result);
  if (WorldPosition)
    return *WorldPosition;
  else
    return (simd_float3)0;
}

- (simd_float3)simdLocalNormal
{
  simd_float3 *LocalNormal;

  LocalNormal = (simd_float3 *)C3DHitTestResultGetLocalNormal((uint64_t)self->_result);
  if (LocalNormal)
    return *LocalNormal;
  else
    return (simd_float3)0;
}

- (simd_float3)simdWorldNormal
{
  simd_float3 result;

  *(double *)result.i64 = C3DHitTestResultGetWorldNormal((float32x4_t *)self->_result);
  return result;
}

- (simd_float4x4)simdModelTransform
{
  uint64_t ModelTransform;
  simd_float4 *v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4 v6;
  simd_float4 v7;
  simd_float4x4 result;

  ModelTransform = C3DHitTestResultGetModelTransform((uint64_t)self->_result);
  v3 = (simd_float4 *)MEMORY[0x1E0C83FF0];
  if (ModelTransform)
    v3 = (simd_float4 *)ModelTransform;
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  result.columns[3] = v7;
  result.columns[2] = v6;
  result.columns[1] = v5;
  result.columns[0] = v4;
  return result;
}

@end
