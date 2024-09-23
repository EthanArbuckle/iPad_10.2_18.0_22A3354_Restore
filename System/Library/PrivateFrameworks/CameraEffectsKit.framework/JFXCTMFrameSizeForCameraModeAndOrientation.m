@implementation JFXCTMFrameSizeForCameraModeAndOrientation

void __JFXCTMFrameSizeForCameraModeAndOrientation_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 1920.0, 1440.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 1440.0, 1080.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v1;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 960.0, 720.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)JFXCTMFrameSizeForCameraModeAndOrientation__4_3_Resolutions;
  JFXCTMFrameSizeForCameraModeAndOrientation__4_3_Resolutions = v3;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 1920.0, 1080.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 1440.0, 810.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 960.0, 540.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)JFXCTMFrameSizeForCameraModeAndOrientation__16_9_Resolutions;
  JFXCTMFrameSizeForCameraModeAndOrientation__16_9_Resolutions = v8;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 1440.0, 1440.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 1080.0, 1080.0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 720.0, 720.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)JFXCTMFrameSizeForCameraModeAndOrientation__1_1_Resolutions;
  JFXCTMFrameSizeForCameraModeAndOrientation__1_1_Resolutions = v13;

  if (JFXLowResolutionDevice_onceToken != -1)
    dispatch_once(&JFXLowResolutionDevice_onceToken, &__block_literal_global_69);
  v15 = JFXLowResolutionDevice_isLowResolutionDevice;
  if (JFXMediumResolutionDevice_onceToken != -1)
    dispatch_once(&JFXMediumResolutionDevice_onceToken, &__block_literal_global_1_1);
  v16 = JFXMediumResolutionDevice_isMediumResolutionDevice;
  if (v15)
    v16 = 2;
  JFXCTMFrameSizeForCameraModeAndOrientation_quality = v16;
}

@end
