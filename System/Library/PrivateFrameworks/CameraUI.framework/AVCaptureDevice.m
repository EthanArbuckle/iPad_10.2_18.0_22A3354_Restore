@implementation AVCaptureDevice

uint64_t __119__AVCaptureDevice_CAMCaptureEngine__cameraVideoFormat_orPreset_forVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cam_highestQualityFormatForConfiguration:colorSpace:enableProResVideo:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __107__AVCaptureDevice_CAMCaptureEngine__cam_highestQualityFormatForConfiguration_colorSpace_enableProResVideo___block_invoke(uint64_t a1, void *a2)
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v4 = objc_msgSend(v9, "cam_supportsVideoConfiguration:colorSpace:enableProResVideo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  v5 = v9;
  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    if (!v7)
    {
LABEL_5:
      objc_storeStrong((id *)(v6 + 40), a2);
      v5 = v9;
      goto LABEL_6;
    }
    v8 = objc_msgSend(v7, "cam_compareUsingQuality:", v9);
    v5 = v9;
    if (v8 == -1)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_5;
    }
  }
LABEL_6:

}

void __74__AVCaptureDevice_CAMCaptureEngine__cameraPanoramaFormatForConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "cam_supportsPanoramaConfiguration:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __75__AVCaptureDevice_CAMCaptureEngine__cam_formatForPortraitFrontFacingZoomed__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "cam_supportsPortraitFrontFacingZoomed"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
