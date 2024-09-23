@implementation VNHumanBodyPose3DObservation

- (NSDictionary)recognizedPointsForJointsGroupName:(VNHumanBodyPose3DObservationJointsGroupName)jointsGroupName error:(NSError *)error
{
  -[VNRecognizedPoints3DObservation recognizedPointsForGroupKey:error:](self, "recognizedPointsForGroupKey:error:", jointsGroupName, error);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (VNHumanBodyPose3DObservationJointName)parentJointNameForJointName:(VNHumanBodyPose3DObservationJointName)jointName
{
  void *v3;
  void *v4;

  -[VNRecognizedPoints3DObservation recognizedPointForKey:error:](self, "recognizedPointForKey:error:", jointName, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentJoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNHumanBodyPose3DObservationJointName)v4;
}

- (VNHumanBodyRecognizedPoint3D)recognizedPointForJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error
{
  -[VNRecognizedPoints3DObservation recognizedPointForKey:error:](self, "recognizedPointForKey:error:", jointName, error);
  return (VNHumanBodyRecognizedPoint3D *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)getCameraRelativePosition:(simd_float4x4 *)modelPositionOut forJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error
{
  void *v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  NSError *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  _OWORD v27[4];
  _OWORD v28[4];

  -[VNHumanBodyPose3DObservation recognizedPointForJointName:error:](self, "recognizedPointForJointName:error:", jointName, error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "position");
  v25 = v10;
  v26 = v9;
  v23 = v12;
  v24 = v11;
  v13 = *error;
  if (!v13)
  {
    -[VNHumanBodyPose3DObservation _cameraRootTransform](self, "_cameraRootTransform");
    v14 = 0;
    v27[0] = v15;
    v27[1] = v16;
    v27[2] = v17;
    v27[3] = v18;
    do
    {
      v28[v14] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(v27[v14])), v25, *(float32x2_t *)&v27[v14], 1), v24, (float32x4_t)v27[v14], 2), v23, (float32x4_t)v27[v14], 3);
      ++v14;
    }
    while (v14 != 4);
    v19 = (simd_float4)v28[1];
    v20 = (simd_float4)v28[2];
    v21 = (simd_float4)v28[3];
    modelPositionOut->columns[0] = (simd_float4)v28[0];
    modelPositionOut->columns[1] = v19;
    modelPositionOut->columns[2] = v20;
    modelPositionOut->columns[3] = v21;
  }

  return v13 == 0;
}

- (VNPoint)pointInImageForJointName:(VNHumanBodyPose3DObservationJointName)jointName error:(NSError *)error
{
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  double v12;
  double v13;
  VNPoint *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  -[VNHumanBodyPose3DObservation recognizedPointForJointName:error:](self, "recognizedPointForJointName:error:", jointName, error);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "position");
    if (self)
    {
      -[VNRecognizedPoints3DObservation recognizedPointsSpecifier](self, "recognizedPointsSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cameraIntrinsics");
      v17 = v9;
      v18 = v8;
      v16 = v10;

      -[VNHumanBodyPose3DObservation _cameraRootTransform](self, "_cameraRootTransform");
    }
    -[VNRecognizedPoints3DObservation recognizedPointsSpecifier](self, "recognizedPointsSpecifier", v16, v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputSize");

    VisionCoreNormalizedPointForImagePoint();
    v14 = -[VNPoint initWithX:y:]([VNPoint alloc], "initWithX:y:", v13, 1.0 - v12);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (float)bodyHeight
{
  void *v2;
  float v3;
  float v4;

  -[VNRecognizedPoints3DObservation recognizedPointsSpecifier](self, "recognizedPointsSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyHeight");
  v4 = v3;

  return v4;
}

- (simd_float4x4)cameraOriginMatrix
{
  void *v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4 v6;
  simd_float4 v7;
  simd_float4 v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  simd_float4x4 result;

  -[VNRecognizedPoints3DObservation recognizedPointsSpecifier](self, "recognizedPointsSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraRenderTransformMatrix");
  v14 = v3;
  v12 = v5;
  v13 = v4;
  v11 = v6;

  v7 = v14;
  v9 = v12;
  v8 = v13;
  v10 = v11;
  result.columns[3] = v10;
  result.columns[2] = v9;
  result.columns[1] = v8;
  result.columns[0] = v7;
  return result;
}

- (__n128)_cameraRootTransform
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "recognizedPointsSpecifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cameraTransformMatrix");
  v4 = v2;

  return (__n128)v4;
}

- (__n128)_cameraIntrinsics
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "recognizedPointsSpecifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cameraIntrinsics");
  v4 = v2;

  return (__n128)v4;
}

- (CGSize)_inputSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VNRecognizedPoints3DObservation recognizedPointsSpecifier](self, "recognizedPointsSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (VNHumanBodyPose3DObservationHeightEstimation)heightEstimation
{
  void *v2;
  float v3;
  VNHumanBodyPose3DObservationHeightEstimation v4;

  -[VNRecognizedPoints3DObservation recognizedPointsSpecifier](self, "recognizedPointsSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "heightEstimatedScale");
  v4 = (unint64_t)(v3 != -1.0);

  return v4;
}

- (id)debugQuickLookObject
{
  CGMutablePathRef Mutable;
  CGPath *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGColor *v9;
  void *v11;
  objc_super v12;
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  Mutable = CGPathCreateMutable();
  if (!Mutable)
    return 0;
  v4 = Mutable;
  v12.receiver = self;
  v12.super_class = (Class)VNHumanBodyPose3DObservation;
  -[VNObservation debugQuickLookObject](&v12, sel_debugQuickLookObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = VNDebugImageSizeFromObject(v5);
    -[VNHumanBodyPose3DObservation _addAllJointsToPath:imageSize:](self, v4, v7, v8);
    v13[0] = xmmword_1A15FAF60;
    v13[1] = unk_1A15FAF70;
    v9 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v13);
    VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v4, v6, v9);
  }
  else
  {
    -[VNHumanBodyPose3DObservation _addAllJointsToPath:imageSize:](self, v4, 512.0, 512.0);
    VNDebugPathFromNormalizedCGPath((uint64_t)v4, 512.0, 512.0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CGPathRelease(v4);
  return v11;
}

- (NSArray)availableJointsGroupNames
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableJointsGroupNames, 0);
}

- (void)_addAllJointsToPath:(double)a3 imageSize:(double)a4
{
  id v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "availableJointNames");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = 0;
      v11 = 7.0 / a3;
      v12 = 7.0 / a4;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        v15 = v10;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v8);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
          v21 = v15;
          objc_msgSend(a1, "pointInImageForJointName:error:", v16, &v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v21;

          objc_msgSend(v17, "location");
          v19 = v18;
          objc_msgSend(v17, "location");
          v28.origin.x = v19 - v11 * 0.5;
          v28.origin.y = v20 - v12 * 0.5;
          v28.size.width = v11;
          v28.size.height = v12;
          CGPathAddEllipseInRect(a2, 0, v28);

          ++v14;
          v15 = v10;
        }
        while (v9 != v14);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);

    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
