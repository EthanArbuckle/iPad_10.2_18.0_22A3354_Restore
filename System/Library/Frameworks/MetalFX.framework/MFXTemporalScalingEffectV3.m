@implementation MFXTemporalScalingEffectV3

BOOL __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  int v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  int v28;
  int v29;
  __int16 v30;

  v3 = *a3;
  if (*a3 == 2)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(v5 + 448);
    v13[0] = MEMORY[0x24BDAC760];
    v13[2] = __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_2;
    v13[3] = &unk_2505A0578;
    v13[1] = 3221225472;
    v13[4] = v5;
    v14 = v6;
    v23 = *(_OWORD *)(a1 + 112);
    v24 = *(_QWORD *)(a1 + 128);
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 64);
    v8 = *(id *)(a1 + 72);
    v25 = *(_OWORD *)(a1 + 136);
    v26 = *(_QWORD *)(a1 + 152);
    v30 = *(_WORD *)(a1 + 184);
    v28 = *(_DWORD *)(a1 + 176);
    v29 = *(_DWORD *)(a1 + 180);
    v9 = *(_QWORD *)(a1 + 96);
    v18 = v8;
    v21 = v9;
    v27 = *(_OWORD *)(a1 + 160);
    v19 = *(id *)(a1 + 80);
    v10 = *(id *)(a1 + 88);
    v11 = *(_QWORD *)(a1 + 104);
    v20 = v10;
    v22 = v11;
    dispatch_async(v7, v13);

  }
  return v3 == 2;
}

void __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint32x2_t *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int32x2_t *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  int8x16_t v32;
  _QWORD v33[5];
  _BYTE v34[48];

  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v34, 0, *(_QWORD *)(a1 + 32), 6, 0, 0);
  if (MTLTraceEnabled())
  {
    objc_msgSend(*(id *)(a1 + 40), "globalTraceObjectID");
    kdebug_trace();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "commandBuffer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (MTLTraceEnabled())
  {
    objc_msgSend(v30, "globalTraceObjectID");
    kdebug_trace();
  }
  objc_msgSend(v30, "encodeWaitForEvent:value:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384), *(_QWORD *)(a1 + 112));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 147))
  {
    v3 = *(_QWORD *)(v2 + 416);
    if (v3)
      objc_msgSend(v30, "encodeSignalEvent:value:", v3, *(_QWORD *)(a1 + 120));
  }
  objc_msgSend(v30, "computeCommandEncoder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLabel:", CFSTR("MetalFX_TemporalV3_PreProcessing"));
  objc_msgSend(*(id *)(a1 + 32), "_didCreateComputeCommandEncoder:forEncode:", v29, *(_QWORD *)(a1 + 128));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(uint32x2_t **)(v4 + 352);
  v6 = *(void **)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v8 = *(void **)(v4 + 200);
  v10 = *(void **)(a1 + 64);
  v9 = *(void **)(a1 + 72);
  objc_msgSend(*(id *)(v4 + 360), "mpsndarray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = HIDWORD(*(_QWORD *)(a1 + 152));
  BRNet_v3_Filter::encodePre(v5, v30, v29, v6, v7, v10, v8, v9, *(float32x2_t *)(a1 + 136), *(float32x2_t *)(a1 + 144), COERCE_FLOAT(*(_QWORD *)(a1 + 152)), v13, *(float *)(a1 + 176), v12, *(_WORD *)(a1 + 184), HIBYTE(*(_WORD *)(a1 + 184)), *(_BYTE *)(*(_QWORD *)(a1 + 32) + 146), *(_DWORD *)(a1 + 180));

  objc_msgSend(v29, "endEncoding");
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(v14 + 424);
  v16 = *(_QWORD *)(a1 + 120);
  if (*(_BYTE *)(v14 + 147))
    objc_msgSend(v30, "encodeSignalEvent:value:agentMask:", v15, v16, 8);
  else
    objc_msgSend(v30, "encodeSignalEvent:value:", v15, v16);
  objc_msgSend(v30, "encodeSignalEvent:value:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400), *(_QWORD *)(a1 + 120));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 792))
  {
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_3;
    v33[3] = &unk_2505A0528;
    v33[4] = *(_QWORD *)(a1 + 96);
    objc_msgSend(v30, "addCompletedHandler:", v33);
  }
  objc_msgSend(v30, "commitAndWaitUntilSubmitted");
  if ((MTLTraceEnabled() & 1) != 0)
    kdebug_trace();
  v17 = *(_QWORD *)(a1 + 32);
  MPSGraphMPSGraphExecutableWrapper::run(v17 + 216, *(void **)(v17 + 376), *(void **)(v17 + 360), *(void **)(v17 + 368), 0, *(unsigned __int8 *)(v17 + 147), *(void **)(v17 + 416), *(void **)(v17 + 424), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 160));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeWaitForEvent:value:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), *(_QWORD *)(a1 + 160));
  objc_msgSend(v18, "encodeWaitForEvent:value:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408), *(_QWORD *)(a1 + 168));
  if (MTLTraceEnabled())
  {
    objc_msgSend(v18, "globalTraceObjectID");
    kdebug_trace();
  }
  objc_msgSend(v18, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLabel:", CFSTR("MetalFX_TemporalV3_PostProcessing"));
  objc_msgSend(*(id *)(a1 + 32), "_didCreateComputeCommandEncoder:forEncode:", v19, *(_QWORD *)(a1 + 128));
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(int32x2_t **)(v20 + 352);
  objc_msgSend(*(id *)(v20 + 368), "mpsndarray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "buffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = HIDWORD(*(_QWORD *)(a1 + 152));
  LOBYTE(v28) = *(_BYTE *)(a1 + 184);
  BRNet_v3_Filter::encodePost(v21, *(float32x2_t *)(a1 + 136), *(float32x2_t *)(a1 + 144), COERCE_FLOAT(*(_QWORD *)(a1 + 152)), v24, *(float *)(a1 + 176), (uint64_t)v18, v19, v23, *(void **)(a1 + 80), *(void **)(a1 + 88), *(void **)(*(_QWORD *)(a1 + 32) + 208), *(void **)(*(_QWORD *)(a1 + 32) + 200), v28, *(_DWORD *)(a1 + 180), HIWORD(*(_DWORD *)(a1 + 180)));

  v25 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v25 + 149))
  {
    objc_msgSend(v19, "endEncoding");
    objc_msgSend(v18, "blitCommandEncoder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "copyFromTexture:toTexture:", *(_QWORD *)(a1 + 88), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 784))
      objc_msgSend(v26, "updateFence:");
    objc_msgSend(v26, "endEncoding");

  }
  else
  {
    if (*(_QWORD *)(v25 + 784))
      objc_msgSend(v19, "updateFence:");
    objc_msgSend(v19, "endEncoding");
  }
  objc_msgSend(v18, "encodeSignalEvent:value:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392), *(_QWORD *)(a1 + 168));
  v27 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v27 + 792))
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_4;
    v31[3] = &unk_2505A0550;
    v31[4] = v27;
    v32 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
    objc_msgSend(v18, "addCompletedHandler:", v31);
  }
  objc_msgSend(v18, "commitAndWaitUntilSubmitted");

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v34);
}

void __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "GPUStartTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;

}

void __53___MFXTemporalScalingEffectV3_encodeToCommandBuffer___block_invoke_4(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  CHistoryRecord *v5;
  unsigned int v6;
  float v7;
  unsigned int v9;
  float *v10;
  float v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "GPUEndTime");
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  v4 = a1[4];
  v5 = *(CHistoryRecord **)(v4 + 800);
  v6 = *(_DWORD *)(v4 + 808);
  v7 = (*(double *)(*(_QWORD *)(a1[5] + 8) + 24) - *(double *)(*(_QWORD *)(a1[6] + 8) + 24)) * 1000.0;
  if (v7 > 999.99 || v7 < 0.0)
    v7 = 0.0;
  v9 = v6 % 0x78;
  v5->var1 = v9;
  v5->var2 = v9;
  v10 = &v5->var0 + v9;
  v11 = v5->var3 + (float)(v7 - v10[5]);
  v10[5] = v7;
  v5->var3 = v11;
  v5->var4 = v11 / 120.0;
  CHistoryRecord::UpdateMinMax(v5);
  v12 = a1[4];
  if (*(_BYTE *)(v12 + 344) && *(_BYTE *)(v12 + 147))
    v13 = "ANE";
  else
    v13 = "GPU";
  v14 = *(void **)(v12 + 792);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MetalFX TAAU Enabled %s"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateLabel:value:", CFSTR("com.apple.hud-label.metalfx"), v15);

  v16 = (_QWORD *)a1[4];
  v17 = (void *)v16[99];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lux%lu->%lux%lu"), v16[5], v16[6], v16[7], v16[8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateLabel:value:", CFSTR("com.apple.hud-label.metalfx.resolution"), v18);

  v19 = a1[4];
  v20 = *(void **)(v19 + 792);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%2.2f [%2.2f %2.2f]"), *(float *)(*(_QWORD *)(v19 + 800) + 16), *(float *)(*(_QWORD *)(v19 + 800) + 500), *(float *)(*(_QWORD *)(v19 + 800) + 504));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateLabel:value:", CFSTR("com.apple.hud-label.metalfx.timing"), v21);

  ++*(_DWORD *)(a1[4] + 808);
}

@end
