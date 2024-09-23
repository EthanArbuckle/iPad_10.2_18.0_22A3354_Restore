@implementation ARQLDevice

+ (BOOL)supportsAR
{
  return objc_msgSend(MEMORY[0x1E0CF21A8], "isSupported");
}

+ (BOOL)isRenderTier1
{
  checkGPUClass();
  return (unint64_t)(gpuClass - 1) < 3;
}

+ (BOOL)isRenderTier2
{
  checkGPUClass();
  return gpuClass == 4;
}

+ (BOOL)isRenderTier3
{
  checkGPUClass();
  if (gpuClass == 5)
    return 1;
  if (gpuClass == 6)
    return !isiPhone();
  return 0;
}

+ (BOOL)isRenderTier4
{
  uint64_t v2;

  checkGPUClass();
  v2 = gpuClass;
  if (gpuClass == 6)
  {
    if (isiPhone())
      return 1;
    v2 = gpuClass;
  }
  return v2 == 7;
}

+ (BOOL)isRenderTier5
{
  checkGPUClass();
  return gpuClass == 8;
}

+ (int64_t)renderTier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__ARQLDevice_renderTier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (renderTier_onceToken != -1)
    dispatch_once(&renderTier_onceToken, block);
  return renderTier___renderTier;
}

void __24__ARQLDevice_renderTier__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BOOL4 v4;
  uint8_t v5[16];

  if (objc_msgSend(*(id *)(a1 + 32), "isRenderTier1"))
  {
    v2 = (_QWORD *)&unk_1F01C8000;
    v3 = 1;
LABEL_16:
    v2[414] = v3;
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isRenderTier2"))
  {
    v2 = (_QWORD *)&unk_1F01C8000;
    v3 = 2;
    goto LABEL_16;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isRenderTier3"))
  {
    v2 = (_QWORD *)&unk_1F01C8000;
    v3 = 3;
    goto LABEL_16;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isRenderTier4"))
  {
    v2 = (_QWORD *)&unk_1F01C8000;
    v3 = 4;
    goto LABEL_16;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isRenderTier5"))
  {
    v4 = isiPhone();
    v2 = &unk_1F01C8000;
    if (!v4)
    {
      v3 = 5;
      goto LABEL_16;
    }
    renderTier___renderTier = 4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D93A7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ARQLDevice: bumping iPhone down to tier 4", v5, 2u);
    }
  }
  else
  {
    renderTier___renderTier = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __24__ARQLDevice_renderTier__block_invoke_cold_1();
  }
}

+ (BOOL)supportsSceneReconstruction
{
  if (supportsSceneReconstruction_onceToken != -1)
    dispatch_once(&supportsSceneReconstruction_onceToken, &__block_literal_global_6);
  return supportsSceneReconstruction___supportsSceneReconstruction;
}

uint64_t __41__ARQLDevice_supportsSceneReconstruction__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CF21A8], "supportsSceneReconstruction:", 1);
  supportsSceneReconstruction___supportsSceneReconstruction = result;
  return result;
}

+ (BOOL)useSceneReconstructionMeshForOrientation
{
  if (useSceneReconstructionMeshForOrientation_onceToken != -1)
    dispatch_once(&useSceneReconstructionMeshForOrientation_onceToken, &__block_literal_global_11_0);
  return useSceneReconstructionMeshForOrientation___useSceneReconstructionMeshForOrientation;
}

BOOL __54__ARQLDevice_useSceneReconstructionMeshForOrientation__block_invoke()
{
  _BOOL8 result;

  result = +[ARQLDevice supportsSceneReconstruction](ARQLDevice, "supportsSceneReconstruction");
  if (result)
    result = +[ASVUserDefaults forceUseSceneReconstructionMeshForOrientation](ASVUserDefaults, "forceUseSceneReconstructionMeshForOrientation");
  useSceneReconstructionMeshForOrientation___useSceneReconstructionMeshForOrientation = result;
  return result;
}

void __24__ARQLDevice_renderTier__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D93A7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ARQLDevice: Unknown device/rendering tier", v0, 2u);
}

@end
