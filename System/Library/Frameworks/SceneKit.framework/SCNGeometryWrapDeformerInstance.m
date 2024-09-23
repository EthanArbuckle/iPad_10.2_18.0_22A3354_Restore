@implementation SCNGeometryWrapDeformerInstance

- (_BYTE)initWithNode:(void *)a3 drivingNode:(_QWORD *)a4 deformer:(uint64_t)a5 outputs:(uint64_t)a6 computeVertexCount:(void *)a7 context:
{
  _BYTE *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;
  uint64_t v20;
  void *v21;
  size_t v22;
  char *v23;
  unint64_t v24;
  char *v25;
  void *v26;
  void *v27;
  size_t v28;
  size_t v29;
  char *v30;
  unint64_t v31;
  char *v32;
  _QWORD v34[9];
  __int128 v35;
  objc_super v36;

  if (!a1)
    return 0;
  v36.receiver = a1;
  v36.super_class = (Class)SCNGeometryWrapDeformerInstance;
  v12 = objc_msgSendSuper2(&v36, sel_init);
  if (v12)
  {
    objc_msgSend(a4, "initParametersIfNeededForDeformedNode:", a2);
    v13 = a4[3];
    v12[256] = 1;
    *((_QWORD *)v12 + 1) = *(_QWORD *)(v13 + 16);
    *((_QWORD *)v12 + 44) = objc_msgSend(a3, "nodeRef");
    *((_QWORD *)v12 + 22) = objc_msgSend(a2, "nodeRef");
    if (*(_DWORD *)(v13 + 8) != a6)
      -[SCNGeometryWrapDeformerInstance initWithNode:drivingNode:deformer:outputs:computeVertexCount:context:].cold.1();
    *((_DWORD *)v12 + 68) = a6;
    v14 = *(_QWORD *)(v13 + 32);
    v15 = *(_QWORD *)(v13 + 56);
    if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes((void *)objc_msgSend(a7, "device")))
    {
      v14 = (*(_QWORD *)(v13 + 32) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      v15 = (*(_QWORD *)(v13 + 56) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __104__SCNGeometryWrapDeformerInstance_initWithNode_drivingNode_deformer_outputs_computeVertexCount_context___block_invoke;
    v34[3] = &unk_1EA5A1800;
    v34[4] = a7;
    v34[5] = v13;
    v34[7] = v14;
    v34[8] = v15;
    v34[6] = v12;
    v16 = *((_QWORD *)v12 + 1);
    v17 = CFSTR("deformer_wrap_legacy_relative");
    if (v16 != 1)
      v17 = 0;
    v35 = xmmword_1DD02A660;
    if (v16)
      v18 = v17;
    else
      v18 = CFSTR("deformer_wrap_legacy_absolute");
    v19 = objc_alloc_init(MEMORY[0x1E0CC6B90]);
    *((_QWORD *)v12 + 24) = (id)objc_msgSend((id)objc_msgSend(a7, "_currentResourceManager"), "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v18, v19, v34, 0, 0);

    if (v14 == *(_QWORD *)(v13 + 32))
    {
      v20 = objc_msgSend((id)objc_msgSend(a7, "device"), "newBufferWithBytes:length:options:", *(_QWORD *)(v13 + 24), *(_QWORD *)(v13 + 32) * *(unsigned int *)(v13 + 8), 0);
      v21 = 0;
    }
    else
    {
      v22 = v14 * *(unsigned int *)(v13 + 8);
      v23 = (char *)malloc_type_realloc(0, v22, 0xD2BA1DF5uLL);
      v21 = v23;
      if (*(_DWORD *)(v13 + 8))
      {
        v24 = 0;
        v25 = v23;
        do
        {
          memcpy(v25, (const void *)(*(_QWORD *)(v13 + 24) + *(_QWORD *)(v13 + 32) * v24++), *(_QWORD *)(v13 + 32));
          v25 += v14;
        }
        while (v24 < *(unsigned int *)(v13 + 8));
      }
      v20 = objc_msgSend((id)objc_msgSend(a7, "device"), "newBufferWithBytes:length:options:", v21, v22, 0);
    }
    *((_QWORD *)v12 + 25) = v20;
    if (v15 == *(_QWORD *)(v13 + 56))
    {
      v26 = (void *)objc_msgSend(a7, "device");
      v27 = *(void **)(v13 + 48);
      v28 = *(_QWORD *)(v13 + 56) * *(unsigned int *)(v13 + 8);
    }
    else
    {
      v29 = v15 * *(unsigned int *)(v13 + 8);
      v30 = (char *)malloc_type_realloc(v21, v29, 0x2E41FFD6uLL);
      v21 = v30;
      if (*(_DWORD *)(v13 + 8))
      {
        v31 = 0;
        v32 = v30;
        do
        {
          memcpy(v32, (const void *)(*(_QWORD *)(v13 + 48) + *(_QWORD *)(v13 + 56) * v31++), *(_QWORD *)(v13 + 56));
          v32 += v15;
        }
        while (v31 < *(unsigned int *)(v13 + 8));
      }
      v26 = (void *)objc_msgSend(a7, "device");
      v27 = v21;
      v28 = v29;
    }
    *((_QWORD *)v12 + 26) = objc_msgSend(v26, "newBufferWithBytes:length:options:", v27, v28, 0);
    *((_QWORD *)v12 + 45) = objc_msgSend((id)objc_msgSend(a7, "device"), "newBufferWithBytes:length:options:", *(_QWORD *)(v13 + 136), *(_QWORD *)(v13 + 144), 0);
    free(v21);
  }
  return v12;
}

- (_QWORD)initWithNode:(void *)a3 innerLayerNode:(void *)a4 outerLayerNode:(_QWORD *)a5 deformer:(uint64_t)a6 outputs:(uint64_t)a7 computeVertexCount:(void *)a8 context:
{
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  uint64_t v22;
  void *v23;
  size_t v24;
  char *v25;
  unint64_t v26;
  char *v27;
  void *v28;
  void *v29;
  size_t v30;
  size_t v31;
  char *v32;
  unint64_t v33;
  char *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t, void *);
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  unint64_t v44;
  __int128 v45;
  uint64_t v46;
  objc_super v47;

  if (!a1)
    return 0;
  v47.receiver = a1;
  v47.super_class = (Class)SCNGeometryWrapDeformerInstance;
  v14 = objc_msgSendSuper2(&v47, sel_init);
  if (v14)
  {
    objc_msgSend(a5, "initParametersIfNeededForDeformedNode:", a2);
    v15 = a5[3];
    v14[1] = *(_QWORD *)(v15 + 16);
    v14[20] = objc_msgSend(a3, "nodeRef");
    v14[21] = objc_msgSend(a4, "nodeRef");
    v14[22] = objc_msgSend(a2, "nodeRef");
    if (*(_DWORD *)(v15 + 8) != a7)
      -[SCNGeometryWrapDeformerInstance initWithNode:innerLayerNode:outerLayerNode:deformer:outputs:computeVertexCount:context:].cold.1();
    *((_DWORD *)v14 + 4) = a7;
    v16 = *(_QWORD *)(v15 + 32);
    v17 = *(_QWORD *)(v15 + 56);
    if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes((void *)objc_msgSend(a8, "device")))
    {
      v16 = (*(_QWORD *)(v15 + 32) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      v17 = (*(_QWORD *)(v15 + 56) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __122__SCNGeometryWrapDeformerInstance_initWithNode_innerLayerNode_outerLayerNode_deformer_outputs_computeVertexCount_context___block_invoke;
    v39 = &unk_1EA5A1828;
    v40 = a8;
    v41 = v15;
    v43 = v16;
    v44 = v17;
    v18 = v14[1];
    v19 = CFSTR("deformer_wrap_relative");
    v42 = v14;
    v46 = 36;
    if (v18 != 1)
      v19 = 0;
    v45 = xmmword_1DD02A670;
    if (v18)
      v20 = v19;
    else
      v20 = CFSTR("deformer_wrap_absolute");
    v21 = objc_alloc_init(MEMORY[0x1E0CC6B90]);
    v14[24] = objc_retain((id)objc_msgSend((id)objc_msgSend(a8, "_currentResourceManager", v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46), "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v20, v21, &v36, 0,
                                0));

    if (v16 == *(_QWORD *)(v15 + 32))
    {
      v22 = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(_QWORD *)(v15 + 24), *(_QWORD *)(v15 + 32) * *(unsigned int *)(v15 + 8), 0);
      v23 = 0;
    }
    else
    {
      v24 = v16 * *(unsigned int *)(v15 + 8);
      v25 = (char *)malloc_type_realloc(0, v24, 0x46E5A883uLL);
      v23 = v25;
      if (*(_DWORD *)(v15 + 8))
      {
        v26 = 0;
        v27 = v25;
        do
        {
          memcpy(v27, (const void *)(*(_QWORD *)(v15 + 24) + *(_QWORD *)(v15 + 32) * v26++), *(_QWORD *)(v15 + 32));
          v27 += v16;
        }
        while (v26 < *(unsigned int *)(v15 + 8));
      }
      v22 = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", v23, v24, 0);
    }
    v14[25] = v22;
    if (v17 == *(_QWORD *)(v15 + 56))
    {
      v28 = (void *)objc_msgSend(a8, "device");
      v29 = *(void **)(v15 + 48);
      v30 = *(_QWORD *)(v15 + 56) * *(unsigned int *)(v15 + 8);
    }
    else
    {
      v31 = v17 * *(unsigned int *)(v15 + 8);
      v32 = (char *)malloc_type_realloc(v23, v31, 0xCF914E39uLL);
      v23 = v32;
      if (*(_DWORD *)(v15 + 8))
      {
        v33 = 0;
        v34 = v32;
        do
        {
          memcpy(v34, (const void *)(*(_QWORD *)(v15 + 48) + *(_QWORD *)(v15 + 56) * v33++), *(_QWORD *)(v15 + 56));
          v34 += v17;
        }
        while (v33 < *(unsigned int *)(v15 + 8));
      }
      v28 = (void *)objc_msgSend(a8, "device");
      v29 = v23;
      v30 = v31;
    }
    v14[26] = objc_msgSend(v28, "newBufferWithBytes:length:options:", v29, v30, 0);
    v14[27] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(_QWORD *)(v15 + 72), *(_QWORD *)(v15 + 80), 0);
    if (v14[1] == 1)
    {
      v14[28] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(_QWORD *)(v15 + 88), *(_QWORD *)(v15 + 104), 0);
      v14[29] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(_QWORD *)(v15 + 96), *(_QWORD *)(v15 + 104), 0);
      v14[30] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(_QWORD *)(v15 + 112), *(_QWORD *)(v15 + 128), 0);
      v14[31] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(_QWORD *)(v15 + 120), *(_QWORD *)(v15 + 128), 0);
    }
    free(v23);
  }
  return v14;
}

uint64_t __104__SCNGeometryWrapDeformerInstance_initWithNode_drivingNode_deformer_outputs_computeVertexCount_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 32), "configureStageInputOutputDescriptor:withDeformerFunction:", a3, a2);
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 6);
  objc_msgSend(v5, "setFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(v5, "setOffset:", 0);
  objc_msgSend(v5, "setBufferIndex:", 3);
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 3);
  objc_msgSend(v6, "setStepFunction:", 5);
  objc_msgSend(v6, "setStride:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 7);
  objc_msgSend(v7, "setFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(v7, "setOffset:", 0);
  objc_msgSend(v7, "setBufferIndex:", 4);
  v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 4);
  objc_msgSend(v8, "setStepFunction:", 5);
  objc_msgSend(v8, "setStride:", *(_QWORD *)(a1 + 64));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = (void *)objc_msgSend(a3, "attributes");
  if (v9)
  {
    v11 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", 11);
    objc_msgSend(v11, "setFormat:", 31);
    objc_msgSend(v11, "setOffset:", 0);
    objc_msgSend(v11, "setBufferIndex:", 6);
    v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 12);
    objc_msgSend(v12, "setFormat:", 31);
    objc_msgSend(v12, "setOffset:", 16);
    objc_msgSend(v12, "setBufferIndex:", 6);
    v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 13);
    objc_msgSend(v13, "setFormat:", 31);
    objc_msgSend(v13, "setOffset:", 32);
    objc_msgSend(v13, "setBufferIndex:", 6);
    v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 6);
    objc_msgSend(v14, "setStepFunction:", 5);
    v15 = (_QWORD *)(a1 + 80);
  }
  else
  {
    v16 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", 9);
    objc_msgSend(v16, "setFormat:", 30);
    objc_msgSend(v16, "setOffset:", 0);
    objc_msgSend(v16, "setBufferIndex:", 6);
    v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 6);
    objc_msgSend(v14, "setStepFunction:", 5);
    v15 = (_QWORD *)(a1 + 72);
  }
  return objc_msgSend(v14, "setStride:", *v15);
}

uint64_t __122__SCNGeometryWrapDeformerInstance_initWithNode_innerLayerNode_outerLayerNode_deformer_outputs_computeVertexCount_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t result;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(*(id *)(a1 + 32), "configureStageInputOutputDescriptor:withDeformerFunction:", a3, a2);
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 6);
  objc_msgSend(v5, "setFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(v5, "setOffset:", 0);
  objc_msgSend(v5, "setBufferIndex:", 3);
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 3);
  objc_msgSend(v6, "setStepFunction:", 5);
  objc_msgSend(v6, "setStride:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 7);
  objc_msgSend(v7, "setFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(v7, "setOffset:", 0);
  objc_msgSend(v7, "setBufferIndex:", 4);
  v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 4);
  objc_msgSend(v8, "setStepFunction:", 5);
  objc_msgSend(v8, "setStride:", *(_QWORD *)(a1 + 64));
  v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 8);
  objc_msgSend(v9, "setFormat:", 28);
  objc_msgSend(v9, "setOffset:", 0);
  objc_msgSend(v9, "setBufferIndex:", 5);
  v10 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 5);
  objc_msgSend(v10, "setStepFunction:", 5);
  result = objc_msgSend(v10, "setStride:", *(_QWORD *)(a1 + 72));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) == 1)
  {
    v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 9);
    objc_msgSend(v12, "setFormat:", 30);
    objc_msgSend(v12, "setOffset:", 0);
    objc_msgSend(v12, "setBufferIndex:", 6);
    v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 6);
    objc_msgSend(v13, "setStepFunction:", 5);
    objc_msgSend(v13, "setStride:", *(_QWORD *)(a1 + 80));
    v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 10);
    objc_msgSend(v14, "setFormat:", 30);
    objc_msgSend(v14, "setOffset:", 0);
    objc_msgSend(v14, "setBufferIndex:", 7);
    v15 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 7);
    objc_msgSend(v15, "setStepFunction:", 5);
    objc_msgSend(v15, "setStride:", *(_QWORD *)(a1 + 80));
    v16 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 11);
    objc_msgSend(v16, "setFormat:", 30);
    objc_msgSend(v16, "setOffset:", 0);
    objc_msgSend(v16, "setBufferIndex:", 8);
    v17 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 12);
    objc_msgSend(v17, "setFormat:", 30);
    objc_msgSend(v17, "setOffset:", 12);
    objc_msgSend(v17, "setBufferIndex:", 8);
    v18 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 13);
    objc_msgSend(v18, "setFormat:", 30);
    objc_msgSend(v18, "setOffset:", 24);
    objc_msgSend(v18, "setBufferIndex:", 8);
    v19 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 8);
    objc_msgSend(v19, "setStepFunction:", 5);
    objc_msgSend(v19, "setStride:", *(_QWORD *)(a1 + 88));
    v20 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 14);
    objc_msgSend(v20, "setFormat:", 30);
    objc_msgSend(v20, "setOffset:", 0);
    objc_msgSend(v20, "setBufferIndex:", 9);
    v21 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 15);
    objc_msgSend(v21, "setFormat:", 30);
    objc_msgSend(v21, "setOffset:", 12);
    objc_msgSend(v21, "setBufferIndex:", 9);
    v22 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 16);
    objc_msgSend(v22, "setFormat:", 30);
    objc_msgSend(v22, "setOffset:", 24);
    objc_msgSend(v22, "setBufferIndex:", 9);
    v23 = (void *)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 9);
    objc_msgSend(v23, "setStepFunction:", 5);
    return objc_msgSend(v23, "setStride:", *(_QWORD *)(a1 + 88));
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryWrapDeformerInstance;
  -[SCNGeometryWrapDeformerInstance dealloc](&v3, sel_dealloc);
}

- (unint64_t)updateWithContext:(id)a3
{
  unint64_t v5;
  SCNMTLComputeCommandEncoder *v7;
  float32x4_t *v8;
  float32x4_t *v9;
  unint64_t v10;
  __int128 v11;
  int64x2_t v12;
  __int128 v13;
  uint64_t v14;
  float32x4_t *WorldMatrix;
  float32x4_t *v16;
  float32x4_t *v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  int64x2_t v21;
  __int128 v22;
  __int128 v23;
  int64x2_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  MTLBuffer *v28;
  MTLBuffer *v29;
  MTLBuffer *legacyOffsetsOrTransformsBuffer;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  MTLBuffer *pointIndicesBuffer;
  MTLBuffer *barycentricCoordsBuffer;
  MTLBuffer *innerLayerInfluencesBuffer;
  uint64_t v37;
  uint64_t v38;
  MTLComputeCommandEncoder *v39;
  uint64_t v40;
  unsigned int v41;
  MTLBuffer *innerBindingSpaceVectorsBuffer;
  MTLBuffer *outerBindingSpaceVectorsBuffer;
  MTLBuffer *innerBindingOffsetsBuffer;
  MTLBuffer *outerBindingOffsetsBuffer;
  uint64_t vertexCount;
  MTLComputeCommandEncoder *encoder;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  __int128 v64;
  __int128 v65;
  int64x2_t v66;
  __int128 v67;
  simd_float4x4 v68;
  simd_float4x4 v69;
  simd_float4x4 v70;
  simd_float4x4 v71;

  v5 = objc_msgSend(a3, "_currentFrameHash");
  if (self->_currentFrameHash == v5)
    return 0;
  self->_currentFrameHash = v5;
  v7 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder](objc_msgSend(a3, "_currentRenderContext"));
  if (!self->_isLegacySingleLayerDeformer)
  {
    WorldMatrix = C3DNodeGetWorldMatrix((float32x4_t *)self->_innerLayerNode);
    v48 = WorldMatrix[1];
    v49 = *WorldMatrix;
    v50 = WorldMatrix[3];
    v51 = WorldMatrix[2];
    v16 = C3DNodeGetWorldMatrix((float32x4_t *)self->_outerLayerNode);
    v53 = v16[1];
    v55 = *v16;
    v57 = v16[3];
    v59 = v16[2];
    v17 = C3DNodeGetWorldMatrix((float32x4_t *)self->_deformedNode);
    v70.columns[0] = (simd_float4)*v17;
    v70.columns[1] = (simd_float4)v17[1];
    v70.columns[2] = (simd_float4)v17[2];
    v70.columns[3] = (simd_float4)v17[3];
    v71 = __invert_f4(v70);
    v18 = 0;
    v60 = v49;
    v61 = v48;
    v62 = v51;
    v63 = v50;
    do
    {
      *(__int128 *)((char *)&v64 + v18) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v71.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v60 + v18))), (float32x4_t)v71.columns[1], *(float32x2_t *)&v60.f32[v18 / 4], 1), (float32x4_t)v71.columns[2], *(float32x4_t *)((char *)&v60 + v18), 2), (float32x4_t)v71.columns[3], *(float32x4_t *)((char *)&v60 + v18), 3);
      v18 += 16;
    }
    while (v18 != 64);
    v19 = 0;
    v20 = v65;
    v21 = v66;
    v22 = v67;
    *(_OWORD *)&self->_anon_14[12] = v64;
    *(_OWORD *)&self->_anon_14[28] = v20;
    *(int64x2_t *)&self->_anon_14[44] = v21;
    *(_OWORD *)&self->_anon_14[60] = v22;
    v60 = v55;
    v61 = v53;
    v62 = v59;
    v63 = v57;
    do
    {
      *(__int128 *)((char *)&v64 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v71.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v60 + v19))), (float32x4_t)v71.columns[1], *(float32x2_t *)&v60.f32[v19 / 4], 1), (float32x4_t)v71.columns[2], *(float32x4_t *)((char *)&v60 + v19), 2), (float32x4_t)v71.columns[3], *(float32x4_t *)((char *)&v60 + v19), 3);
      v19 += 16;
    }
    while (v19 != 64);
    v23 = v65;
    v24 = v66;
    v25 = v67;
    *(_OWORD *)&self->_anon_14[76] = v64;
    *(_OWORD *)&self->_anon_14[92] = v23;
    *(int64x2_t *)&self->_anon_14[108] = v24;
    *(_OWORD *)&self->_anon_14[124] = v25;
    SCNMTLComputeCommandEncoder::setBytes(v7, &self->_uniforms, 0x90uLL, 0);
    v26 = objc_msgSend(a3, "dependency0PositionBuffer");
    if (v7->_buffers[1] == (MTLBuffer *)v26)
    {
      if (!v7->_offsets[1])
        goto LABEL_37;
    }
    else
    {
      v7->_buffers[1] = (MTLBuffer *)v26;
    }
    v7->_offsets[1] = 0;
    v7->_buffersToBind[0] |= 2uLL;
LABEL_37:
    v32 = objc_msgSend(a3, "dependency1PositionBuffer", *(_OWORD *)&v48, *(_OWORD *)&v49, *(_OWORD *)&v50, *(_OWORD *)&v51);
    if (v7->_buffers[2] == (MTLBuffer *)v32)
    {
      if (!v7->_offsets[2])
        goto LABEL_41;
    }
    else
    {
      v7->_buffers[2] = (MTLBuffer *)v32;
    }
    v7->_offsets[2] = 0;
    v7->_buffersToBind[0] |= 4uLL;
LABEL_41:
    v33 = objc_msgSend(a3, "dstPositionBuffer");
    if (v7->_buffers[11] == (MTLBuffer *)v33)
    {
      if (!v7->_offsets[11])
        goto LABEL_45;
    }
    else
    {
      v7->_buffers[11] = (MTLBuffer *)v33;
    }
    v7->_offsets[11] = 0;
    v7->_buffersToBind[0] |= 0x800uLL;
LABEL_45:
    pointIndicesBuffer = self->_pointIndicesBuffer;
    if (v7->_buffers[3] == pointIndicesBuffer)
    {
      if (!v7->_offsets[3])
        goto LABEL_49;
    }
    else
    {
      v7->_buffers[3] = pointIndicesBuffer;
    }
    v7->_offsets[3] = 0;
    v7->_buffersToBind[0] |= 8uLL;
LABEL_49:
    barycentricCoordsBuffer = self->_barycentricCoordsBuffer;
    if (v7->_buffers[4] == barycentricCoordsBuffer)
    {
      if (!v7->_offsets[4])
        goto LABEL_53;
    }
    else
    {
      v7->_buffers[4] = barycentricCoordsBuffer;
    }
    v7->_offsets[4] = 0;
    v7->_buffersToBind[0] |= 0x10uLL;
LABEL_53:
    innerLayerInfluencesBuffer = self->_innerLayerInfluencesBuffer;
    if (v7->_buffers[5] == innerLayerInfluencesBuffer)
    {
      if (!v7->_offsets[5])
        goto LABEL_57;
    }
    else
    {
      v7->_buffers[5] = innerLayerInfluencesBuffer;
    }
    v7->_offsets[5] = 0;
    v7->_buffersToBind[0] |= 0x20uLL;
LABEL_57:
    if (self->_bindingMode != 1)
      goto LABEL_81;
    v37 = objc_msgSend(a3, "srcPositionBuffer");
    if (v7->_buffers[10] == (MTLBuffer *)v37)
    {
      if (!v7->_offsets[10])
        goto LABEL_65;
    }
    else
    {
      v7->_buffers[10] = (MTLBuffer *)v37;
    }
    v7->_offsets[10] = 0;
    v7->_buffersToBind[0] |= 0x400uLL;
LABEL_65:
    innerBindingSpaceVectorsBuffer = self->_innerBindingSpaceVectorsBuffer;
    if (v7->_buffers[8] == innerBindingSpaceVectorsBuffer)
    {
      if (!v7->_offsets[8])
        goto LABEL_69;
    }
    else
    {
      v7->_buffers[8] = innerBindingSpaceVectorsBuffer;
    }
    v7->_offsets[8] = 0;
    v7->_buffersToBind[0] |= 0x100uLL;
LABEL_69:
    outerBindingSpaceVectorsBuffer = self->_outerBindingSpaceVectorsBuffer;
    if (v7->_buffers[9] == outerBindingSpaceVectorsBuffer)
    {
      if (!v7->_offsets[9])
        goto LABEL_73;
    }
    else
    {
      v7->_buffers[9] = outerBindingSpaceVectorsBuffer;
    }
    v7->_offsets[9] = 0;
    v7->_buffersToBind[0] |= 0x200uLL;
LABEL_73:
    innerBindingOffsetsBuffer = self->_innerBindingOffsetsBuffer;
    if (v7->_buffers[6] == innerBindingOffsetsBuffer)
    {
      if (!v7->_offsets[6])
      {
LABEL_77:
        outerBindingOffsetsBuffer = self->_outerBindingOffsetsBuffer;
        if (v7->_buffers[7] != outerBindingOffsetsBuffer)
        {
          v7->_buffers[7] = outerBindingOffsetsBuffer;
LABEL_80:
          v7->_offsets[7] = 0;
          v7->_buffersToBind[0] |= 0x80uLL;
          goto LABEL_81;
        }
        if (v7->_offsets[7])
          goto LABEL_80;
LABEL_81:
        vertexCount = self->_uniforms.vertexCount;
        v64 = 0uLL;
        encoder = v7->_encoder;
        *(_QWORD *)&v65 = 0;
        *((_QWORD *)&v65 + 1) = vertexCount;
        v66 = vdupq_n_s64(1uLL);
        -[MTLComputeCommandEncoder setStageInRegion:](encoder, "setStageInRegion:", &v64);
        v40 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_computePipeline);
        v41 = self->_uniforms.vertexCount;
        goto LABEL_82;
      }
    }
    else
    {
      v7->_buffers[6] = innerBindingOffsetsBuffer;
    }
    v7->_offsets[6] = 0;
    v7->_buffersToBind[0] |= 0x40uLL;
    goto LABEL_77;
  }
  v8 = C3DNodeGetWorldMatrix((float32x4_t *)self->_legacyDrivingNode);
  v52 = v8[1];
  v54 = *v8;
  v56 = v8[3];
  v58 = v8[2];
  v9 = C3DNodeGetWorldMatrix((float32x4_t *)self->_deformedNode);
  v68.columns[0] = (simd_float4)*v9;
  v68.columns[1] = (simd_float4)v9[1];
  v68.columns[2] = (simd_float4)v9[2];
  v68.columns[3] = (simd_float4)v9[3];
  v69 = __invert_f4(v68);
  v10 = 0;
  v60 = v54;
  v61 = v52;
  v62 = v58;
  v63 = v56;
  do
  {
    *(__int128 *)((char *)&v64 + v10) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v69.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v60 + v10))), (float32x4_t)v69.columns[1], *(float32x2_t *)&v60.f32[v10 / 4], 1), (float32x4_t)v69.columns[2], *(float32x4_t *)((char *)&v60 + v10), 2), (float32x4_t)v69.columns[3], *(float32x4_t *)((char *)&v60 + v10), 3);
    v10 += 16;
  }
  while (v10 != 64);
  v11 = v65;
  v12 = v66;
  v13 = v67;
  *(_OWORD *)&self->_anon_114[12] = v64;
  *(_OWORD *)&self->_anon_114[28] = v11;
  *(int64x2_t *)&self->_anon_114[44] = v12;
  *(_OWORD *)&self->_anon_114[60] = v13;
  SCNMTLComputeCommandEncoder::setBytes(v7, &self->_legacyUniforms, 0x50uLL, 0);
  v14 = objc_msgSend(a3, "dependency0PositionBuffer");
  if (v7->_buffers[1] == (MTLBuffer *)v14)
  {
    if (!v7->_offsets[1])
      goto LABEL_16;
  }
  else
  {
    v7->_buffers[1] = (MTLBuffer *)v14;
  }
  v7->_offsets[1] = 0;
  v7->_buffersToBind[0] |= 2uLL;
LABEL_16:
  v27 = objc_msgSend(a3, "dstPositionBuffer");
  if (v7->_buffers[11] == (MTLBuffer *)v27)
  {
    if (!v7->_offsets[11])
      goto LABEL_20;
  }
  else
  {
    v7->_buffers[11] = (MTLBuffer *)v27;
  }
  v7->_offsets[11] = 0;
  v7->_buffersToBind[0] |= 0x800uLL;
LABEL_20:
  v28 = self->_pointIndicesBuffer;
  if (v7->_buffers[3] == v28)
  {
    if (!v7->_offsets[3])
      goto LABEL_24;
  }
  else
  {
    v7->_buffers[3] = v28;
  }
  v7->_offsets[3] = 0;
  v7->_buffersToBind[0] |= 8uLL;
LABEL_24:
  v29 = self->_barycentricCoordsBuffer;
  if (v7->_buffers[4] == v29)
  {
    if (!v7->_offsets[4])
      goto LABEL_28;
  }
  else
  {
    v7->_buffers[4] = v29;
  }
  v7->_offsets[4] = 0;
  v7->_buffersToBind[0] |= 0x10uLL;
LABEL_28:
  legacyOffsetsOrTransformsBuffer = self->_legacyOffsetsOrTransformsBuffer;
  if (v7->_buffers[6] == legacyOffsetsOrTransformsBuffer)
  {
    if (!v7->_offsets[6])
      goto LABEL_32;
  }
  else
  {
    v7->_buffers[6] = legacyOffsetsOrTransformsBuffer;
  }
  v7->_offsets[6] = 0;
  v7->_buffersToBind[0] |= 0x40uLL;
LABEL_32:
  if (self->_bindingMode == 1)
  {
    v31 = objc_msgSend(a3, "srcPositionBuffer");
    if (v7->_buffers[10] != (MTLBuffer *)v31)
    {
      v7->_buffers[10] = (MTLBuffer *)v31;
LABEL_61:
      v7->_offsets[10] = 0;
      v7->_buffersToBind[0] |= 0x400uLL;
      goto LABEL_62;
    }
    if (v7->_offsets[10])
      goto LABEL_61;
  }
LABEL_62:
  v38 = self->_legacyUniforms.vertexCount;
  v64 = 0uLL;
  v39 = v7->_encoder;
  *(_QWORD *)&v65 = 0;
  *((_QWORD *)&v65 + 1) = v38;
  v66 = vdupq_n_s64(1uLL);
  -[MTLComputeCommandEncoder setStageInRegion:](v39, "setStageInRegion:", &v64);
  v40 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_computePipeline);
  v41 = self->_legacyUniforms.vertexCount;
LABEL_82:
  if (v7->_computePipelineState != (MTLComputePipelineState *)v40)
  {
    v7->_computePipelineState = (MTLComputePipelineState *)v40;
    -[MTLComputeCommandEncoder setComputePipelineState:](v7->_encoder, "setComputePipelineState:", v40);
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v7, v41);
  return 1;
}

- (void)initWithNode:drivingNode:deformer:outputs:computeVertexCount:context:.cold.1()
{
  __assert_rtn("-[SCNGeometryWrapDeformerInstance initWithNode:drivingNode:deformer:outputs:computeVertexCount:context:]", "SCNGeometryWrapDeformer.mm", 800, "parameters->_vertexCount == computeVertexCount");
}

- (void)initWithNode:innerLayerNode:outerLayerNode:deformer:outputs:computeVertexCount:context:.cold.1()
{
  __assert_rtn("-[SCNGeometryWrapDeformerInstance initWithNode:innerLayerNode:outerLayerNode:deformer:outputs:computeVertexCount:context:]", "SCNGeometryWrapDeformer.mm", 970, "parameters->_vertexCount == computeVertexCount");
}

@end
