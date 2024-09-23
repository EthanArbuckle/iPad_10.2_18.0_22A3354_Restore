@implementation SKCameraNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)containsNode:(SKNode *)node
{
  SKNode *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  SKCNode **v9;
  float32x4_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x4_t v13;
  simd_float4 v14;
  float32x4_t v15;
  simd_float4 v16;
  float32x2_t v18;
  float32x2_t v19;
  float32x4_t v20;
  simd_float4x4 v21;
  simd_float4x4 v22;

  v4 = node;
  -[SKNode scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[SKNode scene](v4, "scene"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SKNode scene](self, "scene"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5,
        v6 == v7))
  {
    v9 = -[SKNode _backingNode](v4, "_backingNode");
    -[SKCameraNode cameraBoundingBox](self, "cameraBoundingBox");
    v19 = v11;
    v20 = v10;
    v18 = v12;
    *(double *)v13.i64 = SKCNode::getWorldBoundingBox(v9);
    v22.columns[0] = (simd_float4)v13;
    v22.columns[1] = v14;
    v22.columns[2] = (simd_float4)v15;
    v22.columns[3] = v16;
    *(float32x2_t *)v15.f32 = vmul_f32(vsub_f32(v18, *(float32x2_t *)v20.f32), (float32x2_t)0x3F0000003F000000);
    v15.i64[1] = 0x3F80000000000000;
    *(float32x2_t *)v13.f32 = vmul_f32(vsub_f32(v19, *(float32x2_t *)v20.f32), (float32x2_t)0x3F0000003F000000);
    v13.i64[1] = 0x3F80000000000000;
    v21.columns[0] = (simd_float4)vaddq_f32(v13, vaddq_f32(v20, v15));
    v21.columns[1] = (simd_float4)v15;
    v21.columns[2] = (simd_float4)v13;
    v21.columns[3] = 0uLL;
    v8 = SKCBoundingBoxIntersectsBoundingBox(&v21, &v22);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSSet)containedNodeSet
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SKNode scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__SKCameraNode_containedNodeSet__block_invoke;
    v7[3] = &unk_1EA4FEFA8;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(v3, "enumerateChildNodesWithName:usingBlock:", CFSTR("//SKNode"), v7);
  }
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return (NSSet *)v5;
}

void __32__SKCameraNode_containedNodeSet__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsNode:"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

- (__n128)cameraBoundingBox
{
  void *v2;
  double v3;
  double v4;
  __int128 v5;
  __int128 v7;

  objc_msgSend(a1, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  objc_msgSend(a1, "cameraBoundingBoxOverridingSceneSize:", v3, v4);
  v7 = v5;

  return (__n128)v7;
}

- (double)cameraBoundingBoxOverridingSceneSize:(double)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __n128 ConversionMatrixToWorld;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[4];
  __int128 v22;

  v3 = a2 * -0.5;
  v4 = a3 * -0.5;
  v5 = a2 * 0.5;
  v6 = a3 * 0.5;
  v7 = xmmword_1DC9217E0;
  v8 = xmmword_1DC9217E0;
  *(float *)&v8 = v3;
  v9 = v8;
  *((float *)&v9 + 1) = v4;
  *(float *)&v7 = v5;
  v10 = v7;
  *((float *)&v10 + 1) = v4;
  *((float *)&v7 + 1) = v6;
  v19 = v7;
  v20 = v9;
  *((float *)&v8 + 1) = v6;
  v17 = v10;
  v18 = v8;
  ConversionMatrixToWorld = SKCNode::getConversionMatrixToWorld((SKCNode *)objc_msgSend(a1, "_backingNode"));
  v15 = 0;
  v21[0] = v20;
  v21[1] = v17;
  v21[2] = v19;
  v21[3] = v18;
  do
  {
    *(__int128 *)((char *)&v22 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)ConversionMatrixToWorld, COERCE_FLOAT(v21[v15])), v12, *(float32x2_t *)&v21[v15], 1), v13, (float32x4_t)v21[v15], 2), v14, (float32x4_t)v21[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  return *(double *)&v22;
}

@end
