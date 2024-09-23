@implementation UpdateNodeVisibilityIfNeeded

uint64_t ____UpdateNodeVisibilityIfNeeded_block_invoke(uint64_t a1, float32x4_t *a2)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t Floor;
  const __CFDictionary *Light;
  uint64_t v17;
  CFTypeID v18;
  uint64_t SharedInstance;

  if (C3DNodeIsHidden((uint64_t)a2) && (*(_BYTE *)(a1 + 48) || *(float32x4_t **)(a1 + 32) != a2))
    return 1;
  if (C3DNodeShouldBePutInCullingSystem((uint64_t)a2))
  {
    if (a2[13].i32[2] == -1)
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        ____UpdateNodeVisibilityIfNeeded_block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (*(_BYTE *)(a1 + 48))
  {
    C3DScenePostPipelineEvent(a2[3].i64[0], 0, a2, 0);
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      C3DSceneNodeWasAdded(v13, a2);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      C3DSceneNodeWillBeRemoved(v14, a2);
  }
  Floor = C3DNodeGetFloor((uint64_t)a2);
  Light = C3DNodeGetLight((uint64_t)a2);
  if (Light
    && (v17 = (uint64_t)Light, v18 = CFGetTypeID(Light), v18 == C3DLightGetTypeID())
    && C3DLightTypeSupportsShadow(v17)
    && (C3DLightGetCastsShadow(v17) & 1) != 0
    || Floor)
  {
    SharedInstance = C3DNotificationCenterGetSharedInstance();
    C3DNotificationCenterPostNotification(SharedInstance, CFSTR("kC3DNotificationEngineContextInvalidatePasses"), *(const void **)(a1 + 40), 0, 1u);
  }
  return 0;
}

void ____UpdateNodeVisibilityIfNeeded_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Node should already be in CullingSystem", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
