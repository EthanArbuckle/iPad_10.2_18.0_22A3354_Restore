@implementation JFX

void __JFX_CaptureSessionInterruptionReasonsList_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("VideoDeviceNotAvailableInBackground");
  v2[1] = CFSTR("AudioDeviceInUseByAnotherClient");
  v2[2] = CFSTR("VideoDeviceInUseByAnotherClient");
  v2[3] = CFSTR("VideoDeviceNotAvailableWithMultipleForegroundApps");
  v2[4] = CFSTR("VideoDeviceNotAvailableDueToSystemPressure");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_CaptureSessionInterruptionReasonsList_interruptionReasonsArray;
  JFX_CaptureSessionInterruptionReasonsList_interruptionReasonsArray = v0;

}

void __JFX_LogCategory_block_invoke(uint64_t a1)
{
  os_log_t v2;
  void **v3;
  void *v4;

  v2 = os_log_create("com.apple.CameraEffectsKit", *(const char **)(a1 + 40));
  v3 = *(void ***)(a1 + 32);
  v4 = *v3;
  *v3 = v2;

}

void __JFX_isDrawInstructionGraphNodesEnabled_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("JFX_DEBUG_DrawInstructionGraphNodes"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    JFX_isDrawInstructionGraphNodesEnabled_enabled = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

void __JFX_isShowHDRBadgeInPreviewEnabled_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  JFX_isShowHDRBadgeInPreviewEnabled_showHDRBadgeInPreview = objc_msgSend(v0, "BOOLForKey:", CFSTR("JFX_ShowHDRBadgeInPreview"));

}

void __JFX_isDrawOverlayBoundsEnabled_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBounds"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    JFX_isDrawOverlayBoundsEnabled_drawOverlayBounds = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

void __JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowDocumentBoundingBox"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowObjectAlignedBoundingBox"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTextBoundingBoxes"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaBoundingBox"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowFaceRect"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTapPoints"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowCornerPoints"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTextCornerPoints"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaPoints"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_n = v0;

}

void __JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowAdditionalRects"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_n;
  JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_n = v0;

}

void __JFX_getFrontAndBackCameras_block_invoke()
{
  dispatch_group_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_group_create();
  v1 = (void *)JFX_getFrontAndBackCameras_s_group;
  JFX_getFrontAndBackCameras_s_group = (uint64_t)v0;

  v2 = JFX_getFrontAndBackCameras_s_group;
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v2, v3, &__block_literal_global_633);

}

void __JFX_getFrontAndBackCameras_block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDB1A40];
  v6[0] = *MEMORY[0x24BDB1A48];
  v6[1] = v0;
  v1 = *MEMORY[0x24BDB1A20];
  v6[2] = *MEMORY[0x24BDB1A28];
  v6[3] = v1;
  v2 = *MEMORY[0x24BDB1A50];
  v6[4] = *MEMORY[0x24BDB1A58];
  v6[5] = v2;
  v6[6] = *MEMORY[0x24BDB1A30];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2468], "discoverySessionWithDeviceTypes:mediaType:position:", v3, *MEMORY[0x24BDB1D50], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_636);

}

void __JFX_getFrontAndBackCameras_block_invoke_3(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  uint64_t v6;
  uint64_t *v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  char v11;
  id v12;

  v12 = a2;
  v6 = objc_msgSend(v12, "position");
  v7 = &JFX_getFrontAndBackCameras_s_frontCamera;
  if (JFX_getFrontAndBackCameras_s_frontCamera)
    v8 = 0;
  else
    v8 = v6 == 2;
  if (v8
    || ((v7 = &JFX_getFrontAndBackCameras_s_backCamera, !JFX_getFrontAndBackCameras_s_backCamera)
      ? (v9 = v6 == 1)
      : (v9 = 0),
        v9))
  {
    objc_storeStrong((id *)v7, a2);
    objc_msgSend((id)*v7, "jfx_highestQualityColorSpace");
  }
  if (JFX_getFrontAndBackCameras_s_frontCamera)
    v10 = JFX_getFrontAndBackCameras_s_backCamera == 0;
  else
    v10 = 1;
  v11 = !v10;
  *a4 = v11;

}

void __JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_block_invoke()
{
  id v0;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_s_isStreamingMode = objc_msgSend(v0, "cameraMode") == 0;

}

void __JFX_LogCategory_block_invoke_0(uint64_t a1)
{
  os_log_t v2;
  void **v3;
  void *v4;

  v2 = os_log_create("com.apple.CameraEffectsKit", *(const char **)(a1 + 40));
  v3 = *(void ***)(a1 + 32);
  v4 = *v3;
  *v3 = v2;

}

void __JFX_descriptionForEffectAssetContentType_block_invoke()
{
  void *v0;

  v0 = (void *)JFX_descriptionForEffectAssetContentType_values;
  JFX_descriptionForEffectAssetContentType_values = (uint64_t)&unk_24EE9C500;

}

void __JFX_descriptionForEffectAssetAspectRatio_block_invoke()
{
  void *v0;

  v0 = (void *)JFX_descriptionForEffectAssetAspectRatio_values;
  JFX_descriptionForEffectAssetAspectRatio_values = (uint64_t)&unk_24EE9C518;

}

void __JFX_descriptionForEffectAssetUsageMode_block_invoke()
{
  void *v0;

  v0 = (void *)JFX_descriptionForEffectAssetUsageMode_values;
  JFX_descriptionForEffectAssetUsageMode_values = (uint64_t)&unk_24EE9C530;

}

@end
