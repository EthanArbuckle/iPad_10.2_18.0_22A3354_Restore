@implementation CFTypeIsC3DEntity

CFDictionaryRef __CFTypeIsC3DEntity_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *TypeID;
  uint64_t v9;
  int64x2_t v10;
  CFDictionaryRef result;
  _OWORD v12[20];
  void *keys[41];

  keys[40] = *(void **)MEMORY[0x1E0C80C00];
  if (CFTypeIsC3DEntity__cfTypeRegistry)
  {
    v0 = scn_default_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
      __CFTypeIsC3DEntity_block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  keys[0] = (void *)C3DGeometryGetTypeID();
  keys[1] = (void *)C3DMeshGetTypeID();
  keys[2] = (void *)C3DAnimationPlayerGetTypeID();
  keys[3] = (void *)C3DAnimationGroupGetTypeID();
  keys[4] = (void *)C3DAnimationClusterGetTypeID();
  keys[5] = (void *)C3DKeyframedAnimationGetTypeID();
  keys[6] = (void *)C3DMaterialGetTypeID();
  keys[7] = (void *)C3DImageGetTypeID();
  keys[8] = (void *)C3DMeshElementGetTypeID();
  keys[9] = (void *)C3DNodeGetTypeID();
  keys[10] = (void *)C3DCameraGetTypeID();
  keys[11] = (void *)C3DLightGetTypeID();
  keys[12] = (void *)C3DSkinGetTypeID();
  keys[13] = (void *)C3DSkinnerGetTypeID();
  keys[14] = (void *)C3DGenericSourceGetTypeID();
  keys[15] = (void *)C3DMeshSourceGetTypeID();
  keys[16] = (void *)C3DMorphGetTypeID();
  keys[17] = (void *)C3DMorpherGetTypeID();
  keys[18] = (void *)C3DSceneGetTypeID();
  keys[19] = (void *)C3DParametricGeometryGetTypeID();
  keys[20] = (void *)C3DShapeGeometryGetTypeID();
  keys[21] = (void *)C3DTextGeometryGetTypeID();
  keys[22] = (void *)C3DBezierCurveGeometryGetTypeID();
  keys[23] = (void *)C3DFloorGetTypeID();
  keys[24] = (void *)C3DFXTechniqueGetTypeID();
  keys[25] = (void *)C3DFXMetalProgramGetTypeID();
  keys[26] = (void *)C3DFXGLSLProgramGetTypeID();
  keys[27] = (void *)C3DLODGetTypeID();
  keys[28] = (void *)C3DParticleSystemGetTypeID();
  keys[29] = (void *)C3DConstraintIKGetTypeID();
  keys[30] = (void *)C3DConstraintLookAtGetTypeID();
  keys[31] = (void *)C3DConstraintBillboardGetTypeID();
  keys[32] = (void *)C3DConstraintProceduralGetTypeID();
  keys[33] = (void *)C3DConstraintConstantScaleGetTypeID();
  keys[34] = (void *)C3DConstraintDistanceGetTypeID();
  keys[35] = (void *)C3DConstraintAccelerationGetTypeID();
  keys[36] = (void *)C3DConstraintSliderGetTypeID();
  keys[37] = (void *)C3DConstraintReplicatorGetTypeID();
  keys[38] = (void *)C3DConstraintAvoidOccluderGetTypeID();
  TypeID = (void *)C3DKeyValueStoreGetTypeID();
  v9 = 0;
  keys[39] = TypeID;
  memset(v12, 0, sizeof(v12));
  v10 = vdupq_n_s64(1uLL);
  do
    v12[v9++] = v10;
  while (v9 != 20);
  result = CFDictionaryCreate(0, (const void **)keys, (const void **)v12, 40, 0, 0);
  CFTypeIsC3DEntity__cfTypeRegistry = (uint64_t)result;
  return result;
}

void __CFTypeIsC3DEntity_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. CFTypeIsC3DEntity - dispatched twice", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
