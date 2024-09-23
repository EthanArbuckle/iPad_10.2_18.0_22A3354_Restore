@implementation ARSession(SmartRaycast)

- (__n128)cameraPosition
{
  void *v1;
  void *v2;
  __int128 v3;
  __int128 v5;

  objc_msgSend(a1, "currentFrame");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "camera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transform");
  v5 = v3;

  return (__n128)v5;
}

- (float)raycastResultDistanceFromCamera:()SmartRaycast
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v9;

  objc_msgSend(a3, "worldPosition");
  v9 = v4;
  objc_msgSend(a1, "cameraPosition");
  v6 = vsubq_f32(v9, v5);
  v7 = vmulq_f32(v6, v6);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
}

- (ASVRealHitTestResult)smartRaycastResultForImagePoint:()SmartRaycast assetPosition:maxDistance:
{
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  ASVRealHitTestResult *v19;
  uint64_t v20;
  ASVRealHitTestResult *v21;
  void *v22;
  double v23;
  _QWORD v26[6];
  float v27;

  objc_msgSend(a1, "currentFrame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "trackingState");

  if (v11 == 2)
  {
    v12 = float2ToPoint(a3);
    v14 = v13;
    objc_msgSend(a1, "currentFrame");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raycastQueryFromPoint:allowingTarget:alignment:", 2, 2, v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "raycast:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __85__ARSession_SmartRaycast__smartRaycastResultForImagePoint_assetPosition_maxDistance___block_invoke;
    v26[3] = &unk_1E9F0CA68;
    v26[4] = a1;
    v26[5] = a2;
    v27 = a5;
    v18 = objc_msgSend(v17, "indexOfObjectPassingTest:", v26);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = 0;
    }
    else
    {
      v20 = v18;
      v21 = [ASVRealHitTestResult alloc];
      objc_msgSend(v17, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "cameraPosition");
      v19 = -[ASVRealHitTestResult initWithRaycastResult:imagePoint:assetPosition:cameraPosition:](v21, "initWithRaycastResult:imagePoint:assetPosition:cameraPosition:", v22, *(double *)&a3, a4, v23);

    }
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

@end
