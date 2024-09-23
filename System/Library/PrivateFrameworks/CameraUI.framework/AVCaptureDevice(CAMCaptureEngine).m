@implementation AVCaptureDevice(CAMCaptureEngine)

- (void)cameraVideoFormat:()CAMCaptureEngine orPreset:forVideoConfiguration:videoEncodingBehavior:colorSpace:
{
  unsigned int v10;
  void *v11;
  _QWORD *v12;
  void (*v13)(void);
  uint64_t v14;
  void *v15;
  id v16;
  id *v17;
  _QWORD aBlock[6];
  BOOL v19;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __119__AVCaptureDevice_CAMCaptureEngine__cameraVideoFormat_orPreset_forVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke;
  aBlock[3] = &unk_1EA32C018;
  aBlock[1] = 3221225472;
  aBlock[4] = a1;
  aBlock[5] = a7;
  v19 = a6 == 2;
  if (a6 == 2)
    v10 = 1;
  else
    v10 = (a7 < 4) & (0xDu >> (a7 & 0xF));
  v11 = _Block_copy(aBlock);
  v12 = v11;
  switch(a5)
  {
    case 0:
      if (!v10)
      {
LABEL_17:
        v17 = (id *)MEMORY[0x1E0C8A178];
        goto LABEL_35;
      }
      (*((void (**)(void *, uint64_t))v11 + 2))(v11, 7);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_7;
      goto LABEL_21;
    case 1:
      if (v10)
      {
        v13 = (void (*)(void))*((_QWORD *)v11 + 2);
        goto LABEL_6;
      }
      v17 = (id *)MEMORY[0x1E0C8A180];
      goto LABEL_35;
    case 2:
    case 3:
    case 4:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      v13 = (void (*)(void))*((_QWORD *)v11 + 2);
      goto LABEL_6;
    case 5:
      if (v10)
      {
        v13 = (void (*)(void))*((_QWORD *)v11 + 2);
        goto LABEL_6;
      }
      v17 = (id *)MEMORY[0x1E0C8A168];
      goto LABEL_35;
    case 6:
      if (v10)
      {
LABEL_21:
        v13 = (void (*)(void))v12[2];
        goto LABEL_6;
      }
      v17 = (id *)MEMORY[0x1E0C8A158];
      goto LABEL_35;
    case 7:
      if (v10)
      {
        v13 = (void (*)(void))*((_QWORD *)v11 + 2);
LABEL_6:
        v13();
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v15 = (void *)v14;
        v16 = 0;
        if (a3)
LABEL_8:
          *a3 = objc_retainAutorelease(v15);
      }
      else
      {
        v17 = (id *)MEMORY[0x1E0C8A160];
LABEL_35:
        v16 = *v17;
LABEL_36:
        v15 = 0;
        if (a3)
          goto LABEL_8;
      }
      if (a4)
        *a4 = objc_retainAutorelease(v16);

      return;
    default:
      switch(a5)
      {
        case 10000:
          goto LABEL_17;
        case 10001:
          v17 = (id *)MEMORY[0x1E0C8A198];
          goto LABEL_35;
        case 10002:
          v17 = (id *)MEMORY[0x1E0C8A190];
          goto LABEL_35;
        case 10003:
          v17 = (id *)MEMORY[0x1E0C8A170];
          goto LABEL_35;
        case 10004:
          v17 = (id *)MEMORY[0x1E0C8A1A8];
          goto LABEL_35;
        case 10005:
          v17 = (id *)MEMORY[0x1E0C8A1B0];
          goto LABEL_35;
        default:
          v16 = 0;
          break;
      }
      goto LABEL_36;
  }
}

- (id)cam_highestQualityFormatForConfiguration:()CAMCaptureEngine colorSpace:enableProResVideo:
{
  void *v8;
  id v9;
  _QWORD v11[7];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  objc_msgSend(a1, "formats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__AVCaptureDevice_CAMCaptureEngine__cam_highestQualityFormatForConfiguration_colorSpace_enableProResVideo___block_invoke;
  v11[3] = &unk_1EA32C040;
  v11[5] = a3;
  v11[6] = a4;
  v12 = a5;
  v11[4] = &v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (id)cameraPanoramaFormatForConfiguration:()CAMCaptureEngine
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  objc_msgSend(a1, "formats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__AVCaptureDevice_CAMCaptureEngine__cameraPanoramaFormatForConfiguration___block_invoke;
  v9[3] = &unk_1EA32C068;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)cam_formatForPortraitFrontFacingZoomed
{
  void *v1;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  objc_msgSend(a1, "formats");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AVCaptureDevice_CAMCaptureEngine__cam_formatForPortraitFrontFacingZoomed__block_invoke;
  v4[3] = &unk_1EA32C090;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);
  v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);
  return v2;
}

@end
