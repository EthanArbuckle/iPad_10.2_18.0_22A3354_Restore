@implementation MDLObject(SCNModelIO)

+ (uint64_t)objectWithSCNNode:()SCNModelIO
{
  return objc_msgSend(a1, "objectWithSCNNode:bufferAllocator:", a3, 0);
}

+ (id)objectWithSCNNode:()SCNModelIO bufferAllocator:
{
  id v6;
  void *v7;
  int8x16_t v8;
  int8x16_t v9;
  uint64_t v10;
  __int32 v11;
  __int32 v12;
  int8x16_t v13;
  __int32 v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int8x16_t v39;
  int64x2_t v40;
  int32x4_t v41;
  int8x16_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(a1);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTransform:", v7);

  if (a3)
  {
    objc_msgSend(a3, "transform");
    v9 = v39;
    LODWORD(v10) = v40.i32[0];
    v11 = v39.i32[3];
    v12 = v40.i32[1];
    v14 = v41.i32[0];
    v13 = v42;
    v15 = vextq_s8(v42, (int8x16_t)vtrn2q_s32(v41, (int32x4_t)v42), 4uLL);
    v16 = (int8x16_t)vzip2q_s64((int64x2_t)v41, v40);
    v8 = vextq_s8(v9, v9, 8uLL);
    *(int8x8_t *)v8.i8 = vext_s8(*(int8x8_t *)v39.i8, *(int8x8_t *)v8.i8, 4uLL);
  }
  else
  {
    v13 = 0uLL;
    v8.i64[0] = 0;
    v12 = 0;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = 0;
    LODWORD(v10) = 0;
    v11 = 0;
    v9 = 0uLL;
    v15 = 0uLL;
    v16 = 0uLL;
  }
  v17 = vextq_s8(vextq_s8(v9, v9, 4uLL), v8, 0xCuLL);
  v17.i32[3] = v11;
  HIDWORD(v10) = v12;
  v18 = vextq_s8(v15, v16, 8uLL);
  v18.i32[0] = v14;
  v19 = (void *)objc_msgSend(v6, "transform", v10, v16.i64[1], vextq_s8(vextq_s8(v13, v13, 4uLL), v15, 0xCuLL), *(_OWORD *)&v18, *(_OWORD *)&v17);
  objc_msgSend(v19, "setMatrix:", v34, v31, v33, v32);
  objc_msgSend(v6, "setName:", objc_msgSend(a3, "name"));
  objc_setAssociatedObject(v6, CFSTR("SCNSceneKitAssociatedObject"), a3, (void *)0x301);
  objc_setAssociatedObject(a3, CFSTR("SCNSceneKitAssociatedObject"), v6, 0);
  v20 = objc_msgSend(a3, "camera");
  if (v20)
    objc_msgSend(v6, "addChild:", objc_msgSend(MEMORY[0x1E0CC7788], "cameraWithSCNCamera:", v20));
  v21 = (void *)objc_msgSend(a3, "light");
  if (v21)
  {
    v22 = v21;
    if (objc_msgSend((id)objc_msgSend(v21, "type"), "isEqualToString:", CFSTR("probe")))
      v23 = objc_msgSend(MEMORY[0x1E0CC7798], "lightProbeWithSCNLight:node:", v22, a3);
    else
      v23 = objc_msgSend(MEMORY[0x1E0CC7790], "lightWithSCNLight:", v22);
    objc_msgSend(v6, "addChild:", v23);
  }
  v24 = objc_msgSend(a3, "geometry");
  if (v24)
    objc_msgSend(v6, "addChild:", objc_msgSend(MEMORY[0x1E0CC77B0], "meshWithSCNGeometry:bufferAllocator:", v24, a4));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = (void *)objc_msgSend(a3, "childNodes");
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(v6, "addChild:", objc_msgSend(MEMORY[0x1E0CC77C8], "objectWithSCNNode:bufferAllocator:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), a4));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v27);
  }
  return v6;
}

@end
