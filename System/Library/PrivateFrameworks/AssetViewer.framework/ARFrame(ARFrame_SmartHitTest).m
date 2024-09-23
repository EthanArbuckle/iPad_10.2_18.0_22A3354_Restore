@implementation ARFrame(ARFrame_SmartHitTest)

- (__n128)cameraPosition
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "camera");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transform");
  v4 = v2;

  return (__n128)v4;
}

- (uint64_t)hitTestResult:()ARFrame_SmartHitTest isPlaneOfType:
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  if (objc_msgSend(v5, "type") == a4)
  {
    objc_msgSend(v5, "anchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isMemberOfClass:", objc_opt_class());

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (float)hitTestResultDistanceFromCamera:()ARFrame_SmartHitTest
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

- (ASVRealHitTestResult)smartHitTestResultForImagePoint:()ARFrame_SmartHitTest assetPosition:maxDistance:
{
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  ASVRealHitTestResult *v17;
  uint64_t v18;
  ASVRealHitTestResult *v19;
  double v20;
  uint64_t v21;
  ASVRealHitTestResult *v22;
  double v23;
  uint64_t v24;
  ASVRealHitTestResult *v25;
  void *v26;
  double v27;
  _QWORD v30[5];
  float v31;
  _QWORD v32[5];
  float v33;
  _QWORD v34[5];
  float v35;

  v7 = float2ToPoint(*(float32x2_t *)&a2);
  v9 = v8;
  objc_msgSend(a1, "hitTest:types:", 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke;
  v34[3] = &unk_1E9F0C368;
  v34[4] = a1;
  v35 = a4;
  v12 = objc_msgSend(v10, "indexOfObjectPassingTest:", v34);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "hitTest:types:", 16, v7, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke_2;
    v32[3] = &unk_1E9F0C368;
    v32[4] = a1;
    v33 = a4;
    v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", v32);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "hitTest:types:", 2, v7, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v11;
      v30[1] = 3221225472;
      v30[2] = __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke_3;
      v30[3] = &unk_1E9F0C368;
      v30[4] = a1;
      v31 = a4;
      v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", v30);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = 0;
      }
      else
      {
        v24 = v16;
        v25 = [ASVRealHitTestResult alloc];
        objc_msgSend(v15, "objectAtIndexedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "cameraPosition");
        v17 = -[ASVRealHitTestResult initWithHitTestResult:imagePoint:assetPosition:cameraPosition:](v25, "initWithHitTestResult:imagePoint:assetPosition:cameraPosition:", v26, a2, a3, v27);

      }
    }
    else
    {
      v21 = v14;
      v22 = [ASVRealHitTestResult alloc];
      objc_msgSend(v13, "objectAtIndexedSubscript:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "cameraPosition");
      v17 = -[ASVRealHitTestResult initWithHitTestResult:imagePoint:assetPosition:cameraPosition:](v22, "initWithHitTestResult:imagePoint:assetPosition:cameraPosition:", v15, a2, a3, v23);
    }

  }
  else
  {
    v18 = v12;
    v19 = [ASVRealHitTestResult alloc];
    objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cameraPosition");
    v17 = -[ASVRealHitTestResult initWithHitTestResult:imagePoint:assetPosition:cameraPosition:](v19, "initWithHitTestResult:imagePoint:assetPosition:cameraPosition:", v13, a2, a3, v20);
  }

  return v17;
}

@end
