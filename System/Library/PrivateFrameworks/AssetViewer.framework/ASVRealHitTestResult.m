@implementation ASVRealHitTestResult

- (ASVRealHitTestResult)initWithRaycastResult:(id)a3 imagePoint:assetPosition:cameraPosition:
{
  double v3;
  double v4;
  __int128 v5;
  double v6;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  ASVRealHitTestResult *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  __int128 v24;
  double v25;

  v24 = v5;
  v25 = v4;
  v6 = v3;
  v8 = a3;
  v9 = objc_msgSend(v8, "target");
  if (v9 > 2)
  {
    v16 = 0;
  }
  else
  {
    v10 = 2 - v9;
    objc_msgSend(v8, "anchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "anchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "anchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "alignment");

      }
      else
      {
        v15 = 0;
        v11 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v8, "worldPosition");
    v23 = v17;
    objc_msgSend(v8, "worldTransform");
    self = -[ASVRealHitTestResult initWithType:worldPosition:worldTransform:localPosition:imagePoint:assetPosition:cameraPosition:planeIdentifier:planeAlignment:](self, "initWithType:worldPosition:worldTransform:localPosition:imagePoint:assetPosition:cameraPosition:planeIdentifier:planeAlignment:", v10, v11, v15, v23, v18, v19, v20, v21, 0.0, v6, v25, v24);

    v16 = self;
  }

  return v16;
}

- (ASVRealHitTestResult)initWithHitTestResult:(id)a3 imagePoint:assetPosition:cameraPosition:
{
  double v3;
  double v4;
  __int128 v5;
  double v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  ASVRealHitTestResult *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  double v30;

  v29 = v5;
  v30 = v4;
  v6 = v3;
  v8 = a3;
  v9 = objc_msgSend(v8, "type");
  switch(v9)
  {
    case 2:
      v10 = 0;
      break;
    case 32:
      v10 = 2;
      break;
    case 16:
      v10 = 1;
      break;
    default:
      v16 = 0;
      goto LABEL_14;
  }
  objc_msgSend(v8, "anchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "anchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "anchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "alignment");

    }
    else
    {
      v15 = 0;
      v11 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v8, "worldPosition");
  v28 = v17;
  objc_msgSend(v8, "worldTransform");
  v26 = v19;
  v27 = v18;
  v24 = v21;
  v25 = v20;
  objc_msgSend(v8, "localPosition");
  self = -[ASVRealHitTestResult initWithType:worldPosition:worldTransform:localPosition:imagePoint:assetPosition:cameraPosition:planeIdentifier:planeAlignment:](self, "initWithType:worldPosition:worldTransform:localPosition:imagePoint:assetPosition:cameraPosition:planeIdentifier:planeAlignment:", v10, v11, v15, v28, v27, v26, v25, v24, v22, v6, v30, v29);

  v16 = self;
LABEL_14:

  return v16;
}

- (ASVRealHitTestResult)initWithType:(__n128)a3 worldPosition:(__n128)a4 worldTransform:(__n128)a5 localPosition:(__n128)a6 imagePoint:(__n128)a7 assetPosition:(double)a8 cameraPosition:(double)a9 planeIdentifier:(uint64_t)a10 planeAlignment:(uint64_t)a11
{
  id v22;
  ASVRealHitTestResult *v23;
  ASVRealHitTestResult *v24;
  objc_super v33;

  v22 = a12;
  v33.receiver = a1;
  v33.super_class = (Class)ASVRealHitTestResult;
  v23 = -[ASVHitTestResult initWithType:worldPosition:imagePoint:assetPosition:cameraPosition:](&v33, sel_initWithType_worldPosition_imagePoint_assetPosition_cameraPosition_, a11, a2, a8, a9, a14);
  v24 = v23;
  if (v23)
  {
    *(__n128 *)&v23[1].super.super.isa = a3;
    *(__n128 *)v23[1].super._imagePoint = a4;
    *(__n128 *)v23[1].super._worldPosition = a5;
    *(__n128 *)v23[1].super._assetPosition = a6;
    *(__n128 *)v23->_localPosition = a7;
    objc_storeStrong((id *)&v23->_planeIdentifier, a12);
    v24->_alignment = a13;
  }

  return v24;
}

- (float)distanceFromFeaturePoint
{
  float32x4_t v2;
  float32x4_t v3;

  -[ASVRealHitTestResult localPosition](self, "localPosition");
  v3 = vmulq_f32(v2, v2);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).f32[0]);
}

- (NSUUID)planeIdentifier
{
  return self->_planeIdentifier;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (__n128)worldTransform
{
  return a1[9];
}

- (__n128)localPosition
{
  return a1[8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planeIdentifier, 0);
}

@end
