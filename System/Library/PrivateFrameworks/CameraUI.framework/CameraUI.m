uint64_t CAMApplicationMain(int a1, char **a2)
{
  objc_class *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;

  CAMSignpostWithIDAndArgs(1, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  +[CAMCaptureEngine preheatCaptureResources](CAMCaptureEngine, "preheatCaptureResources");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIApplicationMain(a1, a2, v5, v7);

  return v8;
}

id _prewarmAVCaptureSession()
{
  if (_prewarmAVCaptureSession_onceToken != -1)
    dispatch_once(&_prewarmAVCaptureSession_onceToken, &__block_literal_global_47);
  return (id)prewarmedAVCaptureSession;
}

void ___prewarmAVCaptureSession_block_invoke()
{
  id v0;
  void *v1;

  CAMSignpostWithIDAndArgs(93, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v0 = objc_alloc_init(MEMORY[0x1E0C8B108]);
  v1 = (void *)prewarmedAVCaptureSession;
  prewarmedAVCaptureSession = (uint64_t)v0;

  CAMSignpostWithIDAndArgs(94, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void sub_1DB766CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB767A0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void ___prewarmAudioVideoDeviceTypes_block_invoke()
{
  void *v0;
  int BoolAnswer;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  CAMSignpostWithIDAndArgs(91, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  BoolAnswer = AVGestaltGetBoolAnswer();
  v2 = AVGestaltGetBoolAnswer();
  v3 = AVGestaltGetBoolAnswer();
  v4 = AVGestaltGetBoolAnswer();
  v5 = 6;
  if ((v2 & v3) != 0)
    v5 = 7;
  v6 = 8;
  if (BoolAnswer)
    v6 = 2;
  if (v2)
    v6 = 4;
  if (v3)
    v7 = v5;
  else
    v7 = v6;
  prewarmedVideoDevicePosition = +[CAMCaptureConversions AVDevicePositionForCAMDevicePosition:](CAMCaptureConversions, "AVDevicePositionForCAMDevicePosition:", BoolAnswer ^ 1u);
  +[CAMCaptureConversions AVCaptureDeviceTypeForCAMCaptureDevice:](CAMCaptureConversions, "AVCaptureDeviceTypeForCAMCaptureDevice:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)prewarmedVideoDeviceType;
  prewarmedVideoDeviceType = v8;

  if (!prewarmedVideoDeviceType)
    objc_storeStrong((id *)&prewarmedVideoDeviceType, (id)*MEMORY[0x1E0C89FA0]);
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.camera")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.camera.lockscreen")) & 1) == 0)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.camera.CameraMessagesApp")) & v4 & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v4)
LABEL_15:
    objc_storeStrong((id *)&prewarmedAudioDeviceType, (id)*MEMORY[0x1E0C89F70]);
LABEL_16:
  CAMSignpostWithIDAndArgs(92, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

}

void ___prewarmAudioVideoDevices_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  CAMSignpostWithIDAndArgs(87, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = v0;
  if (prewarmedVideoDeviceType)
    objc_msgSend(v0, "addObject:");
  if (prewarmedAudioDeviceType)
    objc_msgSend(v1, "addObject:");
  v18 = v1;
  objc_msgSend(MEMORY[0x1E0C8B0A8], "discoverySessionWithDeviceTypes:mediaType:position:", v1, 0, 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        if (prewarmedVideoDeviceType)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v6), "deviceType");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "isEqualToString:", prewarmedVideoDeviceType) & 1) != 0)
          {
            v9 = objc_msgSend(v7, "position");
            v10 = prewarmedVideoDevicePosition;

            if (v9 == v10)
            {
              v11 = &prewarmedVideoDevice;
              v12 = &prewarmedVideoDeviceInput;
LABEL_18:
              objc_storeStrong((id *)v11, v7);
              objc_msgSend(MEMORY[0x1E0C8B0B0], "deviceInputWithDevice:error:", v7, 0);
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = (void *)*v12;
              *v12 = v15;

              goto LABEL_19;
            }
          }
          else
          {

          }
        }
        if (prewarmedAudioDeviceType)
        {
          objc_msgSend(v7, "deviceType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", prewarmedAudioDeviceType);

          if (v14)
          {
            v11 = &prewarmedAudioDevice;
            v12 = &prewarmedAudioDeviceInput;
            goto LABEL_18;
          }
        }
LABEL_19:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  CAMSignpostWithIDAndArgs(88, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

void sub_1DB768538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7688AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7692E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMIsSmallPhone()
{
  if (CAMIsSmallPhone_onceToken != -1)
    dispatch_once(&CAMIsSmallPhone_onceToken, &__block_literal_global_51);
  return CAMIsSmallPhone_isSmallPhone;
}

void sub_1DB76B0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

BOOL CAMIsTallScreen(void *a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  _BOOL8 v5;

  objc_msgSend(a1, "currentMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "size");
    v5 = v4 / v3 >= 1.70000005;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void CAMShutterButtonSpecForLayoutStyle(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  double v9;
  double v10;

  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = xmmword_1DB9A6B80;
  v8 = xmmword_1DB9A6B90;
  v9 = 2.0;
  v10 = 1.0 / v6;
  switch(a1)
  {
    case 0:
    case 1:
    case 3:
      goto LABEL_4;
    case 2:
      v9 = v10 + 1.0;
      v7 = xmmword_1DB9A6BA0;
      v8 = xmmword_1DB9A6BB0;
      goto LABEL_4;
    case 4:
      v9 = v10 + 2.0;
      v7 = xmmword_1DB9A6BC0;
      v8 = xmmword_1DB9A6BD0;
LABEL_4:
      *(_OWORD *)a2 = v8;
      *(_OWORD *)(a2 + 16) = v7;
      *(double *)(a2 + 32) = v9;
      break;
    default:
      return;
  }
}

id CAMCameraUIFrameworkBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)__CAMCameraUIFrameworkBundle;
  if (!__CAMCameraUIFrameworkBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("CAMViewfinderViewController")));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__CAMCameraUIFrameworkBundle;
    __CAMCameraUIFrameworkBundle = v1;

    v0 = (void *)__CAMCameraUIFrameworkBundle;
  }
  return v0;
}

void sub_1DB76EAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB77022C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v16 - 56));
  _Unwind_Resume(a1);
}

void sub_1DB770A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CAMLocalizedFrameworkString(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a1;
  v4 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __CAMLocalizedFrameworkString_block_invoke;
  v8[3] = &unk_1EA32DAE0;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(&unk_1EA3B3A88, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1DB770B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7718F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CAMTimerDurationFormatter()
{
  if (CAMTimerDurationFormatter_onceToken != -1)
    dispatch_once(&CAMTimerDurationFormatter_onceToken, &__block_literal_global_21);
  return (id)CAMTimerDurationFormatter_sharedCountFormatter;
}

id CAMTimerCountdownFormatter()
{
  if (CAMTimerCountdownFormatter_onceToken != -1)
    dispatch_once(&CAMTimerCountdownFormatter_onceToken, &__block_literal_global_12);
  return (id)CAMTimerCountdownFormatter_sharedCountFormatter;
}

id camSoftLinkQueue()
{
  if (camSoftLinkQueue_camSoftLinkQueueOnceToken != -1)
    dispatch_once(&camSoftLinkQueue_camSoftLinkQueueOnceToken, &__block_literal_global_8);
  return (id)camSoftLinkQueue_camSoftLinkQueue;
}

void __camSoftLinkQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.camera.softlink", v2);
  v1 = (void *)camSoftLinkQueue_camSoftLinkQueue;
  camSoftLinkQueue_camSoftLinkQueue = (uint64_t)v0;

}

void sub_1DB78791C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DB787F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB78D620(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB78DD80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB78EB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB79108C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB79264C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB794A0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DB799184(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1DB79A7DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB79AB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB79AE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v28 - 112), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void __Block_byref_object_dispose__32(uint64_t a1)
{

}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

void __Block_byref_object_dispose__34(uint64_t a1)
{

}

void sub_1DB79BCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB79BF58(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB79D9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB79DBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB79F27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7A2144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7A2C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7A3F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7A4884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7A7A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7A9814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7A9C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7AA0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7AE320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7AE670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7B0418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7B1050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7B1CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7BFAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7BFC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1DB7C32FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7C33B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7C3910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

int64_t CAMInterfaceOrientationForWindow(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  int64_t result;
  BOOL v5;

  v1 = a1;
  if (objc_msgSend(v1, "isRotating"))
    v2 = objc_msgSend(v1, "_toWindowOrientation");
  else
    v2 = objc_msgSend(v1, "_windowInterfaceOrientation");
  v3 = v2;

  result = +[CAMApplication appOrPlugInInterfaceOrientation](CAMApplication, "appOrPlugInInterfaceOrientation");
  if (v3)
    v5 = v1 == 0;
  else
    v5 = 1;
  if (!v5)
    return v3;
  return result;
}

void sub_1DB7CD3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CAMDebugStringForCaptureDevice(unint64_t a1)
{
  if (a1 > 0xB)
    return 0;
  else
    return off_1EA328E98[a1];
}

void sub_1DB7D148C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7D1B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7D2450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void cam_perform_on_main_asap(void *a1)
{
  void *v1;
  void (**v2)(void);

  v1 = (void *)MEMORY[0x1E0CB3978];
  v2 = a1;
  if (objc_msgSend(v1, "isMainThread"))
    v2[2]();
  else
    pl_dispatch_async();

}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id getBCSDetectedCodeClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBCSDetectedCodeClass_softClass;
  v7 = getBCSDetectedCodeClass_softClass;
  if (!getBCSDetectedCodeClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBCSDetectedCodeClass_block_invoke;
    v3[3] = &unk_1EA329140;
    v3[4] = &v4;
    __getBCSDetectedCodeClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB7D77FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBCSDetectedCodeClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!BarcodeSupportLibraryCore_frameworkLibrary)
  {
    BarcodeSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!BarcodeSupportLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BCSDetectedCode");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getBCSDetectedCodeClass_block_invoke_cold_1();
    free(v3);
  }
  getBCSDetectedCodeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id NSStringFromCAMPowerAssertionReasonBitfield(unsigned int a1)
{
  id v2;
  int v3;
  void *v4;
  BOOL v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v3 = 1;
    do
    {
      if ((a1 & 1) != 0)
      {
        NSStringFromCAMPowerAssertionReason(v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v4);

      }
      v3 *= 2;
      v5 = a1 > 1;
      a1 >>= 1;
    }
    while (v5);
  }
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

__CFString *NSStringFromCAMPowerAssertionReason(int a1)
{
  __CFString *v1;

  if (a1 > 4095)
  {
    if (a1 < 0x20000)
    {
      if (a1 < 0x4000)
      {
        if (a1 == 4096)
        {
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceStillImageRemoteFilteredHDR");
        }
        else
        {
          if (a1 != 0x2000)
            return v1;
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceVideoLocal");
        }
      }
      else
      {
        switch(a1)
        {
          case 0x4000:
            v1 = CFSTR("CAMPowerAssertionReasonPersistenceVideoLocalHDR");
            break;
          case 0x8000:
            v1 = CFSTR("CAMPowerAssertionReasonPersistenceVideoLocalFiltered");
            break;
          case 0x10000:
            v1 = CFSTR("CAMPowerAssertionReasonPersistenceVideoLocalFilteredHDR");
            break;
          default:
            return v1;
        }
      }
    }
    else if (a1 >= 0x100000)
    {
      if (a1 == 0x100000)
      {
        v1 = CFSTR("CAMPowerAssertionReasonPersistenceVideoRemoteFilteredHDR");
      }
      else
      {
        if (a1 != 0x200000)
        {
          if (a1 == 0x400000)
          {
            v1 = CFSTR("CAMPowerAssertionReasonPersistenceRemoteTimelapsePlaceholder");
            if (objc_msgSend(CFSTR("CAMPowerAssertionReasonPersistenceRemoteTimelapsePlaceholder"), "hasPrefix:", CFSTR("CAMPowerAssertionReason")))goto LABEL_52;
          }
          return v1;
        }
        v1 = CFSTR("CAMPowerAssertionReasonPersistenceBurstRemote");
      }
    }
    else
    {
      switch(a1)
      {
        case 0x20000:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceVideoRemote");
          break;
        case 0x40000:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceVideoRemoteHDR");
          break;
        case 0x80000:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceVideoRemoteFiltered");
          break;
        default:
          return v1;
      }
    }
  }
  else if (a1 > 63)
  {
    if (a1 > 511)
    {
      switch(a1)
      {
        case 512:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceStillImageRemote");
          break;
        case 1024:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceStillImageRemoteHDR");
          break;
        case 2048:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceStillImageRemoteFiltered");
          break;
        default:
          return v1;
      }
    }
    else
    {
      switch(a1)
      {
        case 64:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceStillImageLocalHDR");
          break;
        case 128:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceStillImageLocalFiltered");
          break;
        case 256:
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceStillImageLocalFilteredHDR");
          break;
        default:
          return v1;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1:
        v1 = CFSTR("CAMPowerAssertionReasonCaptureStillImage");
        break;
      case 2:
        v1 = CFSTR("CAMPowerAssertionReasonCaptureVideo");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        return v1;
      case 4:
        v1 = CFSTR("CAMPowerAssertionReasonCapturePanorama");
        break;
      case 8:
        v1 = CFSTR("CAMPowerAssertionReasonCapturePanoramaTeardown");
        break;
      default:
        if (a1 == 16)
        {
          v1 = CFSTR("CAMPowerAssertionReasonBurstAnalysis");
        }
        else
        {
          if (a1 != 32)
            return v1;
          v1 = CFSTR("CAMPowerAssertionReasonPersistenceStillImageLocal");
        }
        break;
    }
  }
  if ((-[__CFString hasPrefix:](v1, "hasPrefix:", CFSTR("CAMPowerAssertionReason")) & 1) != 0)
  {
LABEL_52:
    -[__CFString substringFromIndex:](v1, "substringFromIndex:", objc_msgSend(CFSTR("CAMPowerAssertionReason"), "length"));
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void sub_1DB7D9BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1DB7DD3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7DD578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7DEC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7DEF40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB7E1CB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DB7E1D28()
{
  JUMPOUT(0x1DB7E1D08);
}

void sub_1DB7E1D30()
{
  JUMPOUT(0x1DB7E1D10);
}

void sub_1DB7E2214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getRPPeopleDiscoveryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RapportLibraryCore_frameworkLibrary)
  {
    RapportLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RapportLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RPPeopleDiscovery");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getRPPeopleDiscoveryClass_block_invoke_cold_1();
    free(v3);
  }
  getRPPeopleDiscoveryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  void *v0;

  return objc_msgSend(v0, "addObject:");
}

void sub_1DB7E3C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7E53F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMSharedLibraryModeIsOn(unint64_t a1)
{
  return (a1 < 5) & (0x16u >> a1);
}

BOOL CAMSharedLibraryModeIsAutoState(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

uint64_t CAMSharedLibraryModeIsUserState(unint64_t a1)
{
  return (a1 < 6) & (0xCu >> a1);
}

const __CFString *CAMSharedLibraryModeDescription(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("unknown");
  else
    return off_1EA3298B8[a1];
}

void sub_1DB7E7D98(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB7E8460(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1DB7E8C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id CAMPortraitModeInstructionLabelMeasurementFormatter()
{
  if (CAMPortraitModeInstructionLabelMeasurementFormatter_onceToken != -1)
    dispatch_once(&CAMPortraitModeInstructionLabelMeasurementFormatter_onceToken, &__block_literal_global_7);
  return (id)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter;
}

double PLScaledSize(int a1, int a2, int a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  int v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;

  if (a5 > a6)
    v8 = a1;
  else
    v8 = 0;
  v9 = a7 < a8;
  if ((v8 & v9) != 0)
    v10 = a8;
  else
    v10 = a7;
  if ((v8 & v9) == 0)
    a7 = a8;
  v11 = rint(a5 * a7 / a6);
  v12 = rint(a6 * v10 / a5);
  if (a6 * v10 <= a5 * a7 == a3)
    v10 = v11;
  else
    a7 = v12;
  if (a2)
  {
    v13 = a7 > a6;
    if (v10 > a5)
      v13 = 1;
    if (v13)
    {
      a7 = a6;
      v10 = a5;
    }
  }
  if (a4 < 1)
    return v10;
  v14 = (double)a4;
  if (a7 <= (double)a4 && v10 <= v14)
    return v10;
  if (v10 <= a7)
    return rint(a5 * v14 / a6);
  return v14;
}

double PLScaledSizeToFitSize(int a1, int a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  return PLScaledSize(a1, a2, 0, a3, a4, a5, a6, a7);
}

double PLScaledSizeToFillSize(int a1, int a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  return PLScaledSize(a1, a2, 1, a3, a4, a5, a6, a7);
}

id CAMImageWithTextColorFont(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];
  CGSize v21;

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1140];
  v19[0] = *MEMORY[0x1E0DC1138];
  v19[1] = v5;
  v20[0] = a3;
  v20[1] = a2;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  v8 = a2;
  v9 = a1;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v9, "sizeWithAttributes:", v10);
  UICeilToScale();
  v14 = v13;
  UICeilToScale();
  v16 = v15;
  v21.width = v14;
  v21.height = v16;
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  objc_msgSend(v9, "drawInRect:withAttributes:", v10, v11, v12, v14, v16);

  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v17;
}

id CAMImageWithColor(void *a1)
{
  id v1;
  CGContext *CurrentContext;
  id v3;
  CGColor *v4;
  void *v5;
  CGSize v7;
  CGRect v8;

  v1 = a1;
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  CurrentContext = UIGraphicsGetCurrentContext();
  v3 = objc_retainAutorelease(v1);
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v4);
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  CGContextFillRect(CurrentContext, v8);
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v5;
}

void sub_1DB7EAAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7EB884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB7F1F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7F29F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB7F3D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMPhotoFormatForPhotoFormatPreference(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = a2;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
      return result;
    case 3:
      result = 2;
      break;
    case 4:
      result = 2;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void sub_1DB800E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1DB805008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB805164(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB805B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1DB806C88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DB806D34(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB80700C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB809118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB812C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB814D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CAMDebugStringForControlDisableReasons(unint64_t a1)
{
  id v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  BOOL v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v3 = 1;
    do
    {
      if ((a1 & 1) != 0)
      {
        if (v3 > 15)
        {
          if (v3 == 128)
            v5 = CFSTR("PurgingDiskSpace");
          else
            v5 = CFSTR("UNKNOWN");
          if (v3 == 64)
            v5 = CFSTR("ViewfinderOpening");
          if (v3 == 32)
            v6 = CFSTR("PhysicalButtonDown");
          else
            v6 = CFSTR("UNKNOWN");
          if (v3 == 16)
            v6 = CFSTR("ModeDisabled");
          if (v3 <= 63)
            v4 = v6;
          else
            v4 = v5;
        }
        else
        {
          v4 = CFSTR("UNKNOWN");
          switch(v3)
          {
            case 0:
              v4 = CFSTR("Enabled");
              break;
            case 1:
              v4 = CFSTR("CaptureUnavailable");
              break;
            case 2:
              v4 = CFSTR("OutOfDiskSpace");
              break;
            case 4:
              v4 = CFSTR("ViewfinderClosed");
              break;
            case 8:
              v4 = CFSTR("PreventingAdditionalCaptures");
              break;
            default:
              break;
          }
        }
        objc_msgSend(v2, "addObject:", v4);
      }
      v3 *= 2;
      v7 = a1 > 1;
      a1 >>= 1;
    }
    while (v7);
  }
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1DB81BEC8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DB81EED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB81F2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DB81F3FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB8247F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB82B6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB82BAD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_1DB82FDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8301E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8303FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBCSAVParsingSessionClass_block_invoke(uint64_t a1)
{
  BarcodeSupportLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BCSAVParsingSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBCSAVParsingSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBCSAVParsingSessionClass_block_invoke_cold_1();
    BarcodeSupportLibrary();
  }
}

void BarcodeSupportLibrary()
{
  void *v0;

  if (!BarcodeSupportLibraryCore_frameworkLibrary_0)
    BarcodeSupportLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!BarcodeSupportLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getBCSActionClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  BarcodeSupportLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BCSAction");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBCSActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__getBCSActionClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_4(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1DB835258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CAMDebugStringForCaptureResultSpecifiers(char a1)
{
  __CFString *v2;
  uint64_t v3;

  if ((a1 & 2) != 0)
  {
    objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((a1 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = &stru_1EA3325A0;
  if ((a1 & 1) != 0)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("HDR"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v3;
  }
LABEL_6:
  if (!-[__CFString length](v2, "length"))
  {

    v2 = CFSTR("None");
  }
  return v2;
}

void sub_1DB836D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB837928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB838128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMLibrarySelectionIdentityMatch(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0
    || (objc_msgSend(v3, "emailAddress"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "emailAddress"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "contactIdentifiers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v12);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v4, "contactIdentifiers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v15) = objc_msgSend(v16, "containsObject:", v15);

          if ((v15 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v11;
}

id CAMLibrarySelectionIdentityDescription(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v1, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(v1, "phoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  objc_msgSend(v1, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v1, "emailAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v8);

  }
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(v2, "addObject:", CFSTR("no handle"));
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" - "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (%@)"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id CAMLibrarySelectionIdentityContactIdentifiersForIdentities(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "contactIdentifiers", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          objc_msgSend(v8, "contactIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_1DB839A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB83CCAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1DB83CFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

BOOL CAMLocationAccessPendingOrNotDeterminedWithAuthorizationStatus(int a1)
{
  return !a1 || a1 == -1;
}

BOOL CAMCanAccessLocationWithAuthorizationStatus(int a1)
{
  return (a1 - 3) < 2;
}

void sub_1DB846098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  uint64_t v57;

  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 256), 8);
  _Block_object_dispose((const void *)(v57 - 208), 8);
  _Unwind_Resume(a1);
}

id CAMTelemetrySignpostsLog()
{
  if (CAMTelemetrySignpostsLog_onceToken != -1)
    dispatch_once(&CAMTelemetrySignpostsLog_onceToken, &__block_literal_global_13);
  return (id)CAMTelemetrySignpostsLog_cameraLogHandle;
}

void CAMSignpostWithIDAndArgs(int a1, os_signpost_id_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  os_signpost_type_t v57;
  NSObject *v58;
  int v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  switch(a1)
  {
    case 9:
      v14 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v14;
      if (!os_signpost_enabled(v14))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "modeChange";
      goto LABEL_119;
    case 10:
      v17 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v17;
      if (!os_signpost_enabled(v17))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "modeChange";
      goto LABEL_123;
    case 35:
      v19 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v19;
      if (!os_signpost_enabled(v19))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "beginCapturePhoto";
      goto LABEL_119;
    case 36:
      v20 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v20;
      if (!os_signpost_enabled(v20))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "beginCapturePhoto";
      goto LABEL_123;
    case 37:
      v21 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v21;
      if (!os_signpost_enabled(v21))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "willCapturePhoto";
      goto LABEL_119;
    case 38:
      v22 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v22;
      if (!os_signpost_enabled(v22))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "willCapturePhoto";
      goto LABEL_123;
    case 39:
      v23 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v23;
      if (!os_signpost_enabled(v23))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didCapturePhoto";
      goto LABEL_119;
    case 40:
      v24 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v24;
      if (!os_signpost_enabled(v24))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didCapturePhoto";
      goto LABEL_123;
    case 41:
      v25 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v25;
      if (!os_signpost_enabled(v25))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didFinishProcessingPhoto";
      goto LABEL_119;
    case 42:
      v26 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v26;
      if (!os_signpost_enabled(v26))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didFinishProcessingPhoto";
      goto LABEL_123;
    case 43:
      v27 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v27;
      if (!os_signpost_enabled(v27))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didFinishRecordingLivePhoto";
      goto LABEL_119;
    case 44:
      v28 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v28;
      if (!os_signpost_enabled(v28))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didFinishRecordingLivePhoto";
      goto LABEL_123;
    case 45:
      v29 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v29;
      if (!os_signpost_enabled(v29))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didFinishProcessingLivePhoto";
      goto LABEL_119;
    case 46:
      v30 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v30;
      if (!os_signpost_enabled(v30))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didFinishProcessingLivePhoto";
      goto LABEL_123;
    case 47:
      v31 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v31;
      if (!os_signpost_enabled(v31))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "finishCapturePhoto";
      goto LABEL_119;
    case 48:
      v32 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v32;
      if (!os_signpost_enabled(v32))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "finishCapturePhoto";
      goto LABEL_123;
    case 61:
      v33 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v33;
      if (!os_signpost_enabled(v33))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didCaptureDeferredPhoto";
      goto LABEL_119;
    case 62:
      v34 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v34;
      if (!os_signpost_enabled(v34))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "didCaptureDeferredPhoto";
      goto LABEL_123;
    case 66:
      v35 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v35;
      if (!os_signpost_enabled(v35))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "captureInterval";
      goto LABEL_119;
    case 67:
      v36 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v36;
      if (!os_signpost_enabled(v36))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "captureInterval";
      goto LABEL_123;
    case 70:
      v37 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v37;
      if (!os_signpost_enabled(v37))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "photoCapture";
      goto LABEL_119;
    case 71:
      v38 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v38;
      if (!os_signpost_enabled(v38))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "photoCapture";
      goto LABEL_123;
    case 72:
      v39 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v39;
      if (!os_signpost_enabled(v39))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "photoCaptureAndProcessing";
      goto LABEL_119;
    case 73:
      v40 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v40;
      if (!os_signpost_enabled(v40))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "photoCaptureAndProcessing";
      goto LABEL_123;
    case 74:
      v41 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v41;
      if (!os_signpost_enabled(v41))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "captureToImageWellProcessing";
      goto LABEL_119;
    case 75:
      v42 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v42;
      if (!os_signpost_enabled(v42))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "captureToImageWellProcessing";
      goto LABEL_123;
    case 76:
      v43 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v43;
      if (!os_signpost_enabled(v43))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "beginCaptureBeforeResolvingSettingsPhoto";
      goto LABEL_119;
    case 77:
      v44 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v44;
      if (!os_signpost_enabled(v44))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "beginCaptureBeforeResolvingSettingsPhoto";
      goto LABEL_123;
    case 78:
      v45 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v45;
      if (!os_signpost_enabled(v45))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "peopleProximityScanActivate";
      goto LABEL_119;
    case 79:
      v46 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v46;
      if (!os_signpost_enabled(v46))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "peopleProximityScanActivate";
      goto LABEL_123;
    case 80:
      v47 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v47;
      if (!os_signpost_enabled(v47))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "peopleProximityDiscoverPerson";
      goto LABEL_119;
    case 81:
      v48 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v48;
      if (!os_signpost_enabled(v48))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "peopleProximityDiscoverPerson";
      goto LABEL_123;
    case 87:
      v49 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v49;
      if (!os_signpost_enabled(v49))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "prewarmAudioVideoDevices";
      goto LABEL_119;
    case 88:
      v50 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v50;
      if (!os_signpost_enabled(v50))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "prewarmAudioVideoDevices";
      goto LABEL_123;
    case 89:
      v51 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v51;
      if (!os_signpost_enabled(v51))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "CAMCaptureCabilities init";
      goto LABEL_119;
    case 90:
      v52 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v52;
      if (!os_signpost_enabled(v52))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "CAMCaptureCabilities init";
      goto LABEL_123;
    case 91:
      v53 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v53;
      if (!os_signpost_enabled(v53))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "prewarmAudioVideoDeviceTypes";
      goto LABEL_119;
    case 92:
      v54 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v54;
      if (!os_signpost_enabled(v54))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "prewarmAudioVideoDeviceTypes";
      goto LABEL_123;
    case 93:
      v55 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v15 = v55;
      if (!os_signpost_enabled(v55))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "prewarmCaptureSession";
LABEL_119:
      v56 = v15;
      v57 = OS_SIGNPOST_INTERVAL_BEGIN;
      break;
    case 94:
      v58 = v12;
      if (a2 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_125;
      v18 = v58;
      if (!os_signpost_enabled(v58))
        goto LABEL_125;
      v59 = 134218752;
      v60 = a3;
      v61 = 2048;
      v62 = a4;
      v63 = 2048;
      v64 = a5;
      v65 = 2048;
      v66 = a6;
      v16 = "prewarmCaptureSession";
LABEL_123:
      v56 = v18;
      v57 = OS_SIGNPOST_INTERVAL_END;
      break;
    default:
      goto LABEL_126;
  }
  _os_signpost_emit_with_name_impl(&dword_1DB760000, v56, v57, a2, v16, " enableTelemetry=YES (%llu, %llu, %llu, %llu)", (uint8_t *)&v59, 0x2Au);
LABEL_125:

LABEL_126:
}

void CAMSignpostsDiscoverPersonBegin()
{
  NSObject *v0;
  uint8_t v1[16];

  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB760000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "peopleProximityDiscoverPerson", " enableTelemetry=YES ", v1, 2u);
  }

}

void CAMSignpostsDiscoverPersonEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v6 = 134349312;
    v7 = a2;
    v8 = 2050;
    v9 = a3;
    _os_signpost_emit_with_name_impl(&dword_1DB760000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "peopleProximityDiscoverPerson", " enableTelemetry=YES distance=%{signpost.telemetry:number1,public}lu rssi=%{signpost.telemetry:number2,public}ld", (uint8_t *)&v6, 0x16u);
  }

}

void CAMSignpostsDiscoverPersonNearbyBegin()
{
  NSObject *v0;
  uint8_t v1[16];

  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB760000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "peopleProximityDiscoverPersonNearby", " enableTelemetry=YES ", v1, 2u);
  }

}

void CAMSignpostsDiscoverPersonNearbyEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v6 = 134349312;
    v7 = a2;
    v8 = 2050;
    v9 = a3;
    _os_signpost_emit_with_name_impl(&dword_1DB760000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "peopleProximityDiscoverPersonNearby", " enableTelemetry=YES distance=%{signpost.telemetry:number1,public}lu rssi=%{signpost.telemetry:number2,public}ld", (uint8_t *)&v6, 0x16u);
  }

}

void CAMSignpostsSmartSharingAutoDecisionBegin()
{
  NSObject *v0;
  uint8_t v1[16];

  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB760000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "smartSharingAutoDecision", " enableTelemetry=YES ", v1, 2u);
  }

}

void CAMSignpostsSmartSharingAutoDecisionEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v6 = 134349312;
    v7 = a2;
    v8 = 2050;
    v9 = a3;
    _os_signpost_emit_with_name_impl(&dword_1DB760000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "smartSharingAutoDecision", " enableTelemetry=YES initialState=%{signpost.telemetry:number1,public}ld inferredState=%{signpost.telemetry:number2,public}ld", (uint8_t *)&v6, 0x16u);
  }

}

void CAMSignpostsUserManualOverrideBegin()
{
  NSObject *v0;
  uint8_t v1[16];

  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB760000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "userManualOverride", " enableTelemetry=YES ", v1, 2u);
  }

}

void CAMSignpostsUserManualOverrideEnd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  CAMTelemetrySignpostsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v6 = 134349312;
    v7 = a2;
    v8 = 2050;
    v9 = a3;
    _os_signpost_emit_with_name_impl(&dword_1DB760000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "userManualOverride", " enableTelemetry=YES initialState=%{signpost.telemetry:number1,public}ld overiddenState=%{signpost.telemetry:number2,public}ld", (uint8_t *)&v6, 0x16u);
  }

}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1DB84AEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  uint64_t v16;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 136));
  _Unwind_Resume(a1);
}

void sub_1DB84BC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sessionIdentifier");
}

void sub_1DB84DA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPLPhotoTileViewControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPLPhotoTileViewControllerClass_softClass;
  v7 = getPLPhotoTileViewControllerClass_softClass;
  if (!getPLPhotoTileViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPLPhotoTileViewControllerClass_block_invoke;
    v3[3] = &unk_1EA329140;
    v3[4] = &v4;
    __getPLPhotoTileViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB84DF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB84E3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPLCropOverlayClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotoLibraryLibrary();
  result = objc_getClass("PLCropOverlay");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPLCropOverlayClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPLCropOverlayClass_block_invoke_cold_1();
    return (Class)PhotoLibraryLibrary();
  }
  return result;
}

uint64_t PhotoLibraryLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PhotoLibraryLibraryCore_frameworkLibrary)
    PhotoLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PhotoLibraryLibraryCore_frameworkLibrary;
  if (!PhotoLibraryLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getPLPhotoTileViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PhotoLibraryLibrary();
  result = objc_getClass("PLPhotoTileViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPLPhotoTileViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPLPhotoTileViewControllerClass_block_invoke_cold_1();
    return (Class)__getPLVideoViewClass_block_invoke(v3);
  }
  return result;
}

CAMVideoStabilizationCommand *__getPLVideoViewClass_block_invoke(uint64_t a1)
{
  CAMVideoStabilizationCommand *result;
  CAMVideoStabilizationCommand *v3;
  SEL v4;
  BOOL v5;
  int64_t v6;

  PhotoLibraryLibrary();
  result = (CAMVideoStabilizationCommand *)objc_getClass("PLVideoView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPLVideoViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (CAMVideoStabilizationCommand *)__getPLVideoViewClass_block_invoke_cold_1();
    return -[CAMVideoStabilizationCommand initWithAutomaticVideoStabilizationEnabled:strength:](v3, v4, v5, v6);
  }
  return result;
}

void sub_1DB850614(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB8506B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB850F1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB85216C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1DB8571B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CAMVideoCaptureRequestError(uint64_t a1, void *a2)
{
  __CFString *v4;
  uint64_t v5;
  void *v6;
  id v7;
  __CFString **v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  __CFString *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a1 + 28003) > 3)
    v4 = 0;
  else
    v4 = off_1EA32BDA8[a1 + 28003];
  if (a2)
  {
    v5 = *MEMORY[0x1E0CB3388];
    v19[0] = *MEMORY[0x1E0CB2D50];
    v19[1] = v5;
    v20[0] = v4;
    v20[1] = a2;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a2;
    v8 = (__CFString **)v20;
    v9 = v19;
    v10 = v6;
    v11 = 2;
  }
  else
  {
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = v4;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = 0;
    v8 = &v18;
    v9 = &v17;
    v10 = v12;
    v11 = 1;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v8, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CAMVideoCaptureRequestErrorDomain"), a1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t CAMErrorIsVideoCaptureRequestError(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  if (objc_msgSend(v3, "code") == a2)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", CFSTR("CAMVideoCaptureRequestErrorDomain"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t CAMInitialLayoutStyle(uint64_t result, double a2, double a3, double a4, double a5)
{
  if (result != 1)
  {
    if (CAMIsModernAspectScreenSize(a4, a5))
      return 4;
    else
      return 0;
  }
  return result;
}

uint64_t CAMLayoutStyleForView(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v19;
  double v20;
  double v21;
  double v22;

  v1 = a1;
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 * v6 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v4 * v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    v9 = v8;
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceIdiom") == 1)
    {
      v13 = 1;
    }
    else if (CAMIsModernAspectScreenSize(v9, v11))
    {
      v13 = 4;
    }
    else
    {
      v13 = 0;
    }

LABEL_10:
    goto LABEL_11;
  }
  v14 = CEKIsPadLayoutForView();
  objc_msgSend(v1, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  objc_msgSend(v1, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  CEKPortraitOrientedSize();

  if ((v14 & 1) == 0)
  {
    if (v16 == 1)
    {
      v13 = 0;
      goto LABEL_11;
    }
    CEKRectWithSize();
    v20 = v19;
    v22 = v21;
    objc_msgSend(v1, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
    {
      v13 = 1;
    }
    else if (CAMIsModernAspectScreenSize(v20, v22))
    {
      v13 = 4;
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_10;
  }
  v13 = 1;
LABEL_11:

  return v13;
}

uint64_t CAMLayoutStyleAllowingTinyForView(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  double v4;
  double v5;

  v1 = a1;
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");

  v3 = CAMLayoutStyleForView(v1);
  CEKPortraitOrientedSize();
  if (v3 == 1)
  {
    if (v5 >= 768.0)
      return 1;
    else
      return 2;
  }
  else if (v5 < 568.0 || v4 < 320.0)
  {
    return 2;
  }
  else
  {
    return v3;
  }
}

void sub_1DB862808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB86298C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB862AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB863C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB863F2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void CAMShutterButtonSpecMake(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
}

double CAMShutterButtonSpecGetInnerCircleDiameter(double *a1)
{
  return *a1 + (a1[1] + a1[4]) * -2.0;
}

void sub_1DB868690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB868A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB868E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB86A218(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DB86D1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void __PanoramaProcessorOutputCallback(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a1;
  objc_msgSend(v5, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "panoramaProcessor:didProcessSampleBuffer:withStatus:forRequest:", v5, a3, a2, v6);

}

void sub_1DB87264C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB874F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB875774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB87598C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8840E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1DB885BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB886178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB886314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB887340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

float CMAccelerationZAxisRotation(long double a1, double a2)
{
  return atan2(a1, -a2);
}

void sub_1DB890208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8909B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

void sub_1DB890C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8922C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB892890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB894234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB89AC18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1DB89AC88()
{
  JUMPOUT(0x1DB89AC68);
}

void sub_1DB89AC90()
{
  JUMPOUT(0x1DB89AC70);
}

Class __getSFDeviceDiscoveryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharingLibraryCore_frameworkLibrary)
  {
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SharingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFDeviceDiscovery");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getSFDeviceDiscoveryClass_block_invoke_cold_1();
    free(v3);
  }
  getSFDeviceDiscoveryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CAMShowStorageUsageInSettings()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=STORAGE_MGMT"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB760000, v1, OS_LOG_TYPE_DEFAULT, "Opening Storage Settings", v3, 2u);
  }

  if ((CAMOpenSensitiveURLWithUnlockRequest(v0, 1) & 1) == 0)
  {
    v2 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      CAMShowStorageUsageInSettings_cold_1((uint64_t)v0, v2);

  }
}

id CAMStorageAlertDismissTitle(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  CAMLocalizedFrameworkString(off_1EA32CEE8[a1], 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id CAMStorageAlertResolveTitle(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
  {
    v1 = CFSTR("LOW_DISK_SPACE_ICPL_OFF_ALERT_MANAGE_TITLE");
  }
  else
  {
    if (a1)
      return 0;
    v1 = CFSTR("LOW_DISK_SPACE_ICPL_ON_ALERT_OPTIMIZE_TITLE");
  }
  CAMLocalizedFrameworkString(v1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t CAMStorageAlertIsPhotoMode(unint64_t a1)
{
  return (a1 < 0xA) & (0x279u >> a1);
}

id CAMStorageAlertTitle(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1 == 2)
  {
    v4 = CFSTR("LOW_DISK_SPACE_TITLE_EXTERNAL");
  }
  else
  {
    if (a1 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LOW_DISK_SPACE_ICPL_OFF_TITLE_%@"), v3);
    }
    else
    {
      if (a1)
      {
        v4 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LOW_DISK_SPACE_ICPL_ON_TITLE_%@"), v3);
    }
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  CAMLocalizedFrameworkString(v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CAMStorageAlertMessage(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  if (a2 > 9)
    goto LABEL_12;
  if (((1 << a2) & 0x279) == 0)
  {
    switch(a1)
    {
      case 2:
        v6 = CFSTR("LOW_DISK_SPACE_VIDEO_BODY_EXTERNAL");
        goto LABEL_17;
      case 1:
        v6 = CFSTR("LOW_DISK_SPACE_ICPL_OFF_VIDEO_BODY");
        goto LABEL_17;
      case 0:
        v5 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "model");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringWithFormat:", CFSTR("LOW_DISK_SPACE_ICPL_ON_VIDEO_BODY_%@"), v4);
        goto LABEL_11;
    }
LABEL_12:
    v6 = 0;
    goto LABEL_17;
  }
  if (a1 == 2)
  {
    v6 = CFSTR("LOW_DISK_SPACE_PHOTO_BODY_EXTERNAL");
    goto LABEL_17;
  }
  if (a1 == 1)
  {
    v6 = CFSTR("LOW_DISK_SPACE_ICPL_OFF_PHOTO_BODY");
    goto LABEL_17;
  }
  if (a1)
    goto LABEL_12;
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("LOW_DISK_SPACE_ICPL_ON_PHOTO_BODY_%@"), v4);
LABEL_11:
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  CAMLocalizedFrameworkString(v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_1DB89D0BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB89FC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_1DB8A750C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB8A7AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB8A7B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB8AAC5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

__CFString *CAMDebugStringForCaptureDevice_0(unint64_t a1)
{
  if (a1 > 0xB)
    return 0;
  else
    return off_1EA32D2F8[a1];
}

double CAMMGGetCGRectAnswer(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  double v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MGCopyAnswer();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(v4), "bytes"), "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject CGRectValue](v6, "CGRectValue");
    a2 = v7;
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = a1;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "No data found for MG query %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

  return a2;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

id CAMCaptureControllerError(uint64_t a1, void *a2)
{
  __CFString *v4;
  uint64_t v5;
  void *v6;
  id v7;
  __CFString **v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  __CFString *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a1 + 22103) > 3)
    v4 = 0;
  else
    v4 = off_1EA32D618[a1 + 22103];
  if (a2)
  {
    v5 = *MEMORY[0x1E0CB3388];
    v19[0] = *MEMORY[0x1E0CB2D50];
    v19[1] = v5;
    v20[0] = v4;
    v20[1] = a2;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a2;
    v8 = (__CFString **)v20;
    v9 = v19;
    v10 = v6;
    v11 = 2;
  }
  else
  {
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = v4;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = 0;
    v8 = &v18;
    v9 = &v17;
    v10 = v12;
    v11 = 1;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v8, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CAMCaptureControllerErrorDomain"), a1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void sub_1DB8C3210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8CE5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB8CEB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8CEDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

double CAMSizeForPhotoMetadata(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;

  v1 = *MEMORY[0x1E0CBCB50];
  v2 = a1;
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC28]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC30]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "doubleValue");
  v10 = v9;
  objc_msgSend(v6, "intValue");
  if (PLIsRotatedExifOrientation())
    v12 = v10;
  else
    v12 = v8;

  return v12;
}

uint64_t CAMSizeForDimensions()
{
  return PLIsRotatedExifOrientation();
}

void sub_1DB8D4884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB8D974C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D9864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8D99A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8DAA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___loadThumbnailForBurstResult_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v5 = v4;
  pl_dispatch_async();

}

uint64_t ___loadThumbnailForBurstResult_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

__n128 CAMViewGeometryMake@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, double a8@<D5>)
{
  __int128 v8;
  __n128 result;

  *(double *)a2 = a5;
  *(double *)(a2 + 8) = a6;
  *(double *)(a2 + 16) = a7;
  *(double *)(a2 + 24) = a8;
  *(double *)(a2 + 32) = a3;
  *(double *)(a2 + 40) = a4;
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 64) = v8;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 80) = result;
  return result;
}

uint64_t CAMFrameForGeometry(uint64_t a1)
{
  __int128 v1;
  CGAffineTransform v3;
  CGRect v4;

  v4 = *(CGRect *)a1;
  v1 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v3.a = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v3.c = v1;
  *(_OWORD *)&v3.tx = *(_OWORD *)(a1 + 80);
  CGRectApplyAffineTransform(v4, &v3);
  return UIRectCenteredAboutPoint();
}

__n128 CAMViewGeometryForFrame@<Q0>(uint64_t a1@<X8>, double a2@<D2>, double a3@<D3>)
{
  uint64_t v6;
  uint64_t v7;
  __n128 *v8;
  __int128 v9;
  __n128 result;

  UIRectGetCenter();
  *(_OWORD *)a1 = *MEMORY[0x1E0C9D538];
  *(double *)(a1 + 16) = a2;
  *(double *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  v8 = (__n128 *)MEMORY[0x1E0C9BAA8];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(a1 + 48) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 64) = v9;
  result = v8[2];
  *(__n128 *)(a1 + 80) = result;
  return result;
}

__n128 CAMViewGeometryForOrientedFrame@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 result;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  memset(&v17, 0, sizeof(v17));
  CAMOrientationTransform(a1, (uint64_t)&v17);
  UIRectGetCenter();
  v12 = v11;
  v14 = v13;
  v16 = v17;
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  v19 = CGRectApplyAffineTransform(v18, &v16);
  *(_OWORD *)&v19.origin.y = *(_OWORD *)&v17.c;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)&v17.a;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v19.origin.y;
  *(_OWORD *)(a2 + 80) = *(_OWORD *)&v17.tx;
  result = *(__n128 *)MEMORY[0x1E0C9D538];
  *(_OWORD *)a2 = *MEMORY[0x1E0C9D538];
  *(CGFloat *)(a2 + 16) = v19.size.width;
  *(CGFloat *)(a2 + 24) = v19.size.height;
  *(_QWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 40) = v14;
  return result;
}

uint64_t CAMOrientationTransform@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  CGFloat v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  switch(result)
  {
    case 0:
    case 1:
      v3 = MEMORY[0x1E0C9BAA8];
      v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)a2 = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)(a2 + 16) = v4;
      v5 = *(_OWORD *)(v3 + 32);
      goto LABEL_7;
    case 2:
      v6 = 3.14159265;
      goto LABEL_6;
    case 3:
      v6 = 1.57079633;
      goto LABEL_6;
    case 4:
      v6 = -1.57079633;
LABEL_6:
      CGAffineTransformMakeRotation((CGAffineTransform *)a2, v6);
      result = UIIntegralTransform();
      *(_OWORD *)a2 = v7;
      *(_OWORD *)(a2 + 16) = v8;
      v5 = v9;
LABEL_7:
      *(_OWORD *)(a2 + 32) = v5;
      break;
    default:
      return result;
  }
  return result;
}

void CAMViewSetGeometry(void *a1, uint64_t a2)
{
  double v3;
  double v4;
  id v5;
  __int128 v6;
  _OWORD v7[3];

  v3 = *(double *)(a2 + 32);
  v4 = *(double *)(a2 + 40);
  v5 = a1;
  objc_msgSend(v5, "setCenter:", v3, v4);
  objc_msgSend(v5, "setBounds:", *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
  v6 = *(_OWORD *)(a2 + 64);
  v7[0] = *(_OWORD *)(a2 + 48);
  v7[1] = v6;
  v7[2] = *(_OWORD *)(a2 + 80);
  objc_msgSend(v5, "setTransform:", v7);

}

void CAMViewGetGeometry(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = a1;
  objc_msgSend(v3, "center");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (v3)
  {
    objc_msgSend(v3, "transform");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 40) = v7;
  *(_OWORD *)(a2 + 48) = v16;
  *(_OWORD *)(a2 + 64) = v17;
  *(_OWORD *)(a2 + 80) = v18;

}

void CAMApplyAnimationSensitiveGeometryToView(double *a1, void *a2)
{
  id v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v3 = a2;
  objc_msgSend(v3, "setCenter:", a1[4], a1[5]);
  v9[1] = 3221225472;
  v4 = *((_OWORD *)a1 + 3);
  v13 = *((_OWORD *)a1 + 2);
  v14 = v4;
  v5 = *((_OWORD *)a1 + 5);
  v15 = *((_OWORD *)a1 + 4);
  v16 = v5;
  v6 = *((_OWORD *)a1 + 1);
  v11 = *(_OWORD *)a1;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __CAMApplyAnimationSensitiveGeometryToView_block_invoke;
  v9[3] = &unk_1EA32DD08;
  v10 = v3;
  v12 = v6;
  v8 = v3;
  objc_msgSend(v7, "performWithoutAnimation:", v9);

}

BOOL CAMViewGeometryIsEqualToViewGeometry(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  __int128 v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform t1;

  result = CGRectEqualToRect(*(CGRect *)a1, *(CGRect *)a2);
  if (result)
  {
    if (*(double *)(a1 + 32) == *(double *)(a2 + 32) && *(double *)(a1 + 40) == *(double *)(a2 + 40))
    {
      v6 = *(_OWORD *)(a1 + 64);
      *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 48);
      *(_OWORD *)&t1.c = v6;
      *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 80);
      v7 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v8.a = *(_OWORD *)(a2 + 48);
      *(_OWORD *)&v8.c = v7;
      *(_OWORD *)&v8.tx = *(_OWORD *)(a2 + 80);
      return CGAffineTransformEqualToTransform(&t1, &v8);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void CAMViewSetBoundsAndCenterForFrame(void *a1, double a2, double a3, double a4, double a5)
{
  id v7;

  v7 = a1;
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, a4, a5);

}

double CAMViewAlignmentSize(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  objc_msgSend(v1, "intrinsicContentSize");
  CEKRectWithSize();
  objc_msgSend(v1, "frameForAlignmentRect:");
  v3 = v2;

  return v3;
}

void sub_1DB8DC34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB8DC734(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB8DC8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB8DEE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8DF44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8E059C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8E46C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8E4F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8E5424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8E5D28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

_BYTE *OUTLINED_FUNCTION_13(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_20(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1DB8E86B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB8E88AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB8EEF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8F0E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8F3D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _nearestRangeValue(double a1, double a2, double a3)
{
  double v3;

  v3 = a3 + (a3 - a2) * -0.5;
  if (v3 <= a1 || a1 < a2)
    a2 = a1;
  if (v3 >= a1 || a1 > a3)
    return a2;
  else
    return a3;
}

double _nearestRoundedAngleForAngle(double result)
{
  float64x2_t v1;
  double v2;
  BOOL v4;
  BOOL v5;
  double v6;
  BOOL v8;
  BOOL v9;
  BOOL v11;
  BOOL v12;
  double v13;
  BOOL v15;
  BOOL v16;

  v1 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&result, 0);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v1, (float64x2_t)xmmword_1DB9A79F0), (int32x4_t)vceqq_f64(v1, (float64x2_t)xmmword_1DB9A7A00)))) & 1) != 0)return result;
  v2 = 270.0;
  if (result > 270.0)
  {
    if (result >= 315.0 || result < 270.0)
      v2 = result;
    v4 = result == 315.0;
    v5 = result < 315.0;
    v6 = 360.0;
LABEL_28:
    if (v5 || v4)
    {
      v11 = 1;
      v12 = 0;
    }
    else
    {
      v12 = result == v6;
      v11 = result >= v6;
    }
    if (!v12 && v11)
      return v2;
    else
      return v6;
  }
  v6 = 180.0;
  if (result <= 180.0)
  {
    v2 = 90.0;
    if (result > 90.0)
    {
      if (result >= 135.0 || result < 90.0)
        v2 = result;
      v4 = result == 135.0;
      v5 = result < 135.0;
      goto LABEL_28;
    }
    v13 = 0.0;
    if (result >= 45.0 || result < 0.0)
      v13 = result;
    if (result > 45.0)
    {
      v16 = result == 90.0;
      v15 = result >= 90.0;
    }
    else
    {
      v15 = 1;
      v16 = 0;
    }
    if (!v16 && v15)
      return v13;
    else
      return 90.0;
  }
  else
  {
    if (result >= 225.0 || result < 180.0)
      v6 = result;
    if (result > 225.0)
    {
      v9 = result == 270.0;
      v8 = result >= 270.0;
    }
    else
    {
      v8 = 1;
      v9 = 0;
    }
    if (!v9 && v8)
      return v6;
    else
      return 270.0;
  }
}

void sub_1DB8F6D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DB8FC1DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_1DB8FC954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

id CAMDebugStringForCaptureResultSpecifiersSet(void *a1)
{
  id v1;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __CAMDebugStringForCaptureResultSpecifiersSet_block_invoke_0;
  v4[3] = &unk_1EA329B78;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1DB8FD824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8FFB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB8FFF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB900178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB90043C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB900604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _prewarmAudioVideoDeviceTypes()
{
  if (_prewarmAudioVideoDeviceTypes_onceToken != -1)
    dispatch_once(&_prewarmAudioVideoDeviceTypes_onceToken, &__block_literal_global_15);
}

void _prewarmAudioVideoDevices()
{
  if (_prewarmAudioVideoDevices_onceToken != -1)
    dispatch_once(&_prewarmAudioVideoDevices_onceToken, &__block_literal_global_18);
}

void sub_1DB902FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB903550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB903DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1DB904578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB904714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB904AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DB90A054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB90C1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void _PanoramaNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4)
{
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CF12F8]))
  {
    objc_msgSend(v8, "_subgraphQueueHandlePanoramaStatusNotification:", a4);
LABEL_7:
    v7 = v8;
    goto LABEL_8;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CF1310]))
  {
    objc_msgSend(v8, "_subgraphQueueHandlePanoramaWarningNotification:", a4);
    goto LABEL_7;
  }
  v6 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CF1270]);
  v7 = v8;
  if (v6)
  {
    objc_msgSend(v8, "_subgraphQueueHandlePanoramaErrorNotification:", a4);
    goto LABEL_7;
  }
LABEL_8:

}

void sub_1DB90C6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB90CA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB90CCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DB90D1F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t didInsertImageQueueImage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a2)
  {
    if (a3)
      return CAImageQueueUnregisterBuffer();
  }
  return result;
}

void sub_1DB90D9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB90E6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB90E888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB90EA4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB90EC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB90EFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0x16u);
}

void OUTLINED_FUNCTION_11_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>, float a4@<S0>)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  return result;
}

void sub_1DB91267C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DB912AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DB912C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB912F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

double CAMPixelWidthForView(void *a1)
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayScale");
  v3 = 1.0 / v2;

  return v3;
}

BOOL CAMIsModernAspectScreenSize(double a1, double a2)
{
  return a1 > 0.0 && a2 / a1 >= 2.16;
}

BOOL CAMProcessHasEntitlement(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  CFTypeID v10;
  _BOOL8 v11;
  _Unwind_Exception *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v2 = getSecTaskCreateFromSelfSymbolLoc_ptr;
  v17 = getSecTaskCreateFromSelfSymbolLoc_ptr;
  if (!getSecTaskCreateFromSelfSymbolLoc_ptr)
  {
    v3 = (void *)SecurityLibrary();
    v2 = dlsym(v3, "SecTaskCreateFromSelf");
    v15[3] = (uint64_t)v2;
    getSecTaskCreateFromSelfSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v14, 8);
  if (!v2)
  {
    -[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    goto LABEL_18;
  }
  v4 = ((uint64_t (*)(_QWORD))v2)(*MEMORY[0x1E0C9AE00]);
  if (!v4)
    return 0;
  v5 = (const void *)v4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v6 = getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
  v17 = getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
  if (!getSecTaskCopyValueForEntitlementSymbolLoc_ptr)
  {
    v7 = (void *)SecurityLibrary();
    v6 = dlsym(v7, "SecTaskCopyValueForEntitlement");
    v15[3] = (uint64_t)v6;
    getSecTaskCopyValueForEntitlementSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v14, 8);
  if (!v6)
  {
LABEL_18:
    v13 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }
  v8 = (const __CFBoolean *)((uint64_t (*)(const void *, uint64_t, _QWORD))v6)(v5, a1, 0);
  if (v8)
  {
    v9 = v8;
    v10 = CFGetTypeID(v8);
    v11 = v10 == CFBooleanGetTypeID() && CFBooleanGetValue(v9) != 0;
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }
  CFRelease(v5);
  return v11;
}

uint64_t CAMIsEntitledToOpenSensitiveURLs()
{
  if (CAMIsEntitledToOpenSensitiveURLs_didCheck != -1)
    dispatch_once(&CAMIsEntitledToOpenSensitiveURLs_didCheck, &__block_literal_global_1);
  return CAMIsEntitledToOpenSensitiveURLs_isEntitledToOpenSensitiveURLs;
}

BOOL CAMIsDeviceOrientationLocked()
{
  uint64_t state64;

  if (byte_1ED1C7C0C)
    goto LABEL_2;
  if (!notify_register_check("com.apple.backboardd.orientationlock", &CAMIsDeviceOrientationLocked_notifyToken))
  {
    byte_1ED1C7C0C = 1;
LABEL_2:
    state64 = 0;
    goto LABEL_3;
  }
  state64 = 0;
  if (!byte_1ED1C7C0C)
    return 0;
LABEL_3:
  notify_get_state(CAMIsDeviceOrientationLocked_notifyToken, &state64);
  return state64 != 0;
}

double CAMTransformCorrectingForOrientation@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  CGFloat v3;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = 0.0;
  if ((unint64_t)(a1 - 2) <= 2)
    v3 = dbl_1DB9A7C28[a1 - 2];
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  CGAffineTransformMakeRotation((CGAffineTransform *)a2, v3);
  UIIntegralTransform();
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  result = *(double *)&v7;
  *(_OWORD *)(a2 + 32) = v7;
  return result;
}

uint64_t CAMNormalizeOrientationToOrientation(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  __int16 v3;
  __int16 v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 == 2)
    v2 = 630;
  else
    v2 = 450;
  if (a1 == 4)
    v2 = 360;
  if (a1 == 3)
    v3 = 540;
  else
    v3 = v2;
  if (a1 == 1)
    v4 = 450;
  else
    v4 = v3;
  if (a2 == 2)
    v5 = -180;
  else
    v5 = 0;
  if (a2 == 4)
    v6 = 90;
  else
    v6 = v5;
  if (a2 == 3)
    v7 = -90;
  else
    v7 = v6;
  if (a2 == 1)
    v7 = 0;
  v8 = (unsigned __int16)(v4 + v7) % 0x168u;
  v9 = 1;
  if (v8 == 270)
    v9 = 2;
  v10 = 3;
  if (v8 != 180)
    v10 = v9;
  if (v8)
    return v10;
  else
    return 4;
}

id CAMYellowColor()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resolvedColorWithTraitCollection:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id CAMDarkYellowColor()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkYellowColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resolvedColorWithTraitCollection:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id CAMRedColor()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resolvedColorWithTraitCollection:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id CAMMixColor(void *a1, void *a2, double a3)
{
  id v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v16 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v9 = 0.0;
  v5 = a2;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);

  v6 = fmax(a3, 0.0);
  if (v6 <= 1.0)
    v7 = v6;
  else
    v7 = 1.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v7 * v12 + v16 * (1.0 - v7), v7 * v11 + v15 * (1.0 - v7), v7 * v10 + v14 * (1.0 - v7), v7 * v9 + v13 * (1.0 - v7), *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v16);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t CAMOpenURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = a1;
  v4 = a2;
  objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "openURL:withOptions:error:", v3, v4, &v10);

  v7 = v10;
  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      CAMOpenURL_cold_1((uint64_t)v3, (uint64_t)v7, v8);

  }
  return v6;
}

id getLSApplicationWorkspaceClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLSApplicationWorkspaceClass_softClass;
  v7 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLSApplicationWorkspaceClass_block_invoke;
    v3[3] = &unk_1EA329140;
    v3[4] = &v4;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB9144D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CAMOpenSensitiveURLWithUnlockRequest(void *a1, int a2)
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (a2)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v4 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
    v19 = getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
    if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
    {
      v5 = (void *)FrontBoardServicesLibrary();
      v4 = (id *)dlsym(v5, "FBSOpenApplicationOptionKeyUnlockDevice");
      v17[3] = (uint64_t)v4;
      getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&v16, 8);
    if (!v4)
      goto LABEL_11;
    v6 = *v4;
    v20 = v6;
    v7 = MEMORY[0x1E0C9AAB0];
    v22[0] = MEMORY[0x1E0C9AAB0];
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v8 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
    v19 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
    if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
    {
      v9 = (void *)FrontBoardServicesLibrary();
      v8 = (id *)dlsym(v9, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
      v17[3] = (uint64_t)v8;
      getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v16, 8);
    if (!v8)
    {
LABEL_11:
      -[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
      __break(1u);
    }
    v21 = *v8;
    v22[1] = v7;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v21;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v22, &v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "openSensitiveURL:withOptions:", v3, v12);

  return v14;
}

void sub_1DB9146A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CAMSnapshotForFadingOrientationTransition(uint64_t a1, int a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  v2 = 0.3;
  v3 = 0.2;
  if (a2)
    v2 = 0.2;
  v4 = 0.1;
  if (!a2)
    v4 = 0.0;
  v5 = 0.25;
  if (a2)
  {
    v5 = 0.2;
    v3 = 0.0;
  }
  return +[CAMFrameworkUtilities snapshotForCrossFadingView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:embedSnapshot:](CAMFrameworkUtilities, "snapshotForCrossFadingView:fadeOutDuration:fadeOutDelay:fadeInDuration:fadeInDelay:embedSnapshot:", a1, 0, v2, v4, v5, v3);
}

id CAMPreferredLocale()
{
  if (CAMPreferredLocale_onceToken != -1)
    dispatch_once(&CAMPreferredLocale_onceToken, &__block_literal_global_28);
  return (id)CAMPreferredLocale___CAMPreferredLocale;
}

uint64_t SecurityLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SecurityLibraryCore_frameworkLibrary)
    SecurityLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SecurityLibraryCore_frameworkLibrary;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MobileCoreServicesLibraryCore_frameworkLibrary)
  {
    MobileCoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileCoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LSApplicationWorkspace");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLSApplicationWorkspaceClass_block_invoke_cold_1();
    free(v3);
  }
  getLSApplicationWorkspaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t FrontBoardServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = FrontBoardServicesLibraryCore_frameworkLibrary;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1DB915E5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB9184E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DB91F960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a38);
  _Unwind_Resume(a1);
}

double CAMLiquidShutterColorForShutterColor(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v8;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.camera.lockscreen"));
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "featureDevelopmentShowLockIndicator");

  if (v6)
    _ZF = v4 == 0;
  else
    _ZF = 1;
  if (!_ZF)
  {
    v14 = 0uLL;
LABEL_10:
    *(_QWORD *)&v15 = 0x3FF0000000000000;
    goto LABEL_11;
  }
  if (!a1)
  {
    __asm { FMOV            V0.2D, #1.0 }
    v14 = _Q0;
    goto LABEL_10;
  }
  if (a1 == 1)
  {
    CAMRedColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getRed:green:blue:alpha:", &v14, (char *)&v14 + 8, &v15, 0);

  }
LABEL_11:
  *((_QWORD *)&v15 + 1) = 0x3FF0000000000000;

  return *(double *)&v14;
}

void sub_1DB92982C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DB92B3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92B4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92B708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92BA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92D190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92E2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92E3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92E4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92E62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB92E760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB934354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

id CAMNUStringForTypeCode(int a1)
{
  _BYTE v2[5];

  v2[0] = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  v2[4] = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v2, 30);
}

void sub_1DB935BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB936D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB93703C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL CAMAvailableSpaceIsEqualToSpace(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

void sub_1DB937A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB937EE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB938458(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

void sub_1DB938848(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 32));
  _Unwind_Resume(a1);
}

void sub_1DB938E50(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1DB93A21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB93A6CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB93B3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB93E8B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DB93ECB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id CAMMicaDescriptionForPath(const CGPath *a1)
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CAMMicaDescriptionForPath_block_invoke;
  block[3] = &unk_1EA330038;
  v3 = v2;
  v6 = v3;
  CGPathApplyWithBlock(a1, block);

  return v3;
}

void sub_1DB93FDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB940948(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DB9411CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB941520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1DB941B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB9433B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB943528(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB94697C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB94777C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1DB948D84(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB948E38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB948F80(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB949034(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB949834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPAMediaConversionServicePixelWidthKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr;
  v7 = getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr;
  if (!getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaConversionServiceLibrary();
    v0 = (id *)dlsym(v1, "PAMediaConversionServicePixelWidthKey");
    v5[3] = (uint64_t)v0;
    getPAMediaConversionServicePixelWidthKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getPAMediaConversionServicePixelHeightKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr;
  v7 = getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr;
  if (!getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaConversionServiceLibrary();
    v0 = (id *)dlsym(v1, "PAMediaConversionServicePixelHeightKey");
    v5[3] = (uint64_t)v0;
    getPAMediaConversionServicePixelHeightKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getPAMediaConversionServiceResourceURLCollectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPAMediaConversionServiceResourceURLCollectionClass_softClass;
  v7 = getPAMediaConversionServiceResourceURLCollectionClass_softClass;
  if (!getPAMediaConversionServiceResourceURLCollectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke;
    v3[3] = &unk_1EA329140;
    v3[4] = &v4;
    __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB94B128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CAMPAMediaConversionNameForJobStatus(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getPAMediaConversionNameForJobStatusSymbolLoc_ptr;
  v9 = getPAMediaConversionNameForJobStatusSymbolLoc_ptr;
  if (!getPAMediaConversionNameForJobStatusSymbolLoc_ptr)
  {
    v3 = (void *)MediaConversionServiceLibrary();
    v2 = dlsym(v3, "PAMediaConversionNameForJobStatus");
    v7[3] = (uint64_t)v2;
    getPAMediaConversionNameForJobStatusSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  ((void (*)(uint64_t))v2)(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1DB94D244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB94D32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB94D894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPAMediaConversionServiceOptionAdjustmentInformationKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr;
  v7 = getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaConversionServiceLibrary();
    v0 = (id *)dlsym(v1, "PAMediaConversionServiceOptionAdjustmentInformationKey");
    v5[3] = (uint64_t)v0;
    getPAMediaConversionServiceOptionAdjustmentInformationKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getPAMediaConversionServiceOptionApplyOrientationTransformKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr;
  v7 = getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaConversionServiceLibrary();
    v0 = (id *)dlsym(v1, "PAMediaConversionServiceOptionApplyOrientationTransformKey");
    v5[3] = (uint64_t)v0;
    getPAMediaConversionServiceOptionApplyOrientationTransformKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getPAMediaConversionServiceOptionRequestReasonKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr;
  v7 = getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaConversionServiceLibrary();
    v0 = (id *)dlsym(v1, "PAMediaConversionServiceOptionRequestReasonKey");
    v5[3] = (uint64_t)v0;
    getPAMediaConversionServiceOptionRequestReasonKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getPAMediaConversionServiceOptionJobPriorityKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr;
  v7 = getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaConversionServiceLibrary();
    v0 = (id *)dlsym(v1, "PAMediaConversionServiceOptionJobPriorityKey");
    v5[3] = (uint64_t)v0;
    getPAMediaConversionServiceOptionJobPriorityKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getPAMediaConversionServiceOptionScaleFactorKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr;
  v7 = getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr)
  {
    v1 = (void *)MediaConversionServiceLibrary();
    v0 = (id *)dlsym(v1, "PAMediaConversionServiceOptionScaleFactorKey");
    v5[3] = (uint64_t)v0;
    getPAMediaConversionServiceOptionScaleFactorKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getPAMediaConversionResourceRoleVideoComplement()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr;
  v7 = getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr;
  if (!getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr)
  {
    v1 = (void *)MediaConversionServiceLibrary();
    v0 = (id *)dlsym(v1, "PAMediaConversionResourceRoleVideoComplement");
    v5[3] = (uint64_t)v0;
    getPAMediaConversionResourceRoleVideoComplementSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t MediaConversionServiceLibrary()
{
  uint64_t v0;
  void *v2;

  if (!MediaConversionServiceLibraryCore_frameworkLibrary)
    MediaConversionServiceLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MediaConversionServiceLibraryCore_frameworkLibrary;
  if (!MediaConversionServiceLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaConversionServiceLibrary();
  result = objc_getClass("PAMediaConversionServiceResourceURLCollection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke_cold_1();
  getPAMediaConversionServiceResourceURLCollectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

Class __getPAImageConversionServiceClientClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaConversionServiceLibrary();
  result = objc_getClass("PAImageConversionServiceClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPAImageConversionServiceClientClass_block_invoke_cold_1();
  getPAImageConversionServiceClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPAVideoConversionServiceClientClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaConversionServiceLibrary();
  result = objc_getClass("PAVideoConversionServiceClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPAVideoConversionServiceClientClass_block_invoke_cold_1();
  getPAVideoConversionServiceClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke(uint64_t a1)
{
  Class result;

  MediaConversionServiceLibrary();
  result = objc_getClass("PAMediaConversionServiceImageMetadataPolicy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke_cold_1();
  getPAMediaConversionServiceImageMetadataPolicyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t Subsystems.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)CAMSubsystems), sel_init);
  return v0;
}

uint64_t Subsystems.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)CAMSubsystems), sel_init);
  return v0;
}

uint64_t Subsystems.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Subsystems.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id Subsystems.viewfinderViewController.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_viewfinderViewController);
}

id sub_1DB94FBAC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)v0 + 16), sel_viewfinderViewController);
}

uint64_t variable initialization expression of LaunchAppIntent._target()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v19[2];
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v0 = sub_1DB979930();
  v23 = *(_QWORD *)(v0 - 8);
  v24 = v0;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v22 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v2 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v21 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v20 = (char *)v19 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DB9799F0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v13);
  v14 = sub_1DB9799FC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v19[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0303E20);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0CAF9B8], v8);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v7, 1, 1, v14);
  v25 = 0;
  v16 = sub_1DB9797F8();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v20, 1, 1, v16);
  v17(v21, 1, 1, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v23 + 104))(v22, *MEMORY[0x1E0C91738], v24);
  sub_1DB94FF3C();
  return sub_1DB97984C();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0B5B40]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1DB94FF3C()
{
  unint64_t result;

  result = qword_1F0303E28;
  if (!qword_1F0303E28)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8780, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F0303E28);
  }
  return result;
}

uint64_t variable initialization expression of OpenCaptureModeIntent._target()
{
  return sub_1DB9503A0(0xD000000000000024, 0x80000001DB9C0820);
}

unint64_t sub_1DB94FF9C()
{
  unint64_t result;

  result = qword_1ED1C78F8;
  if (!qword_1ED1C78F8)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8DC4, &type metadata for CaptureMode.AvailableModesProvider);
    atomic_store(result, (unint64_t *)&qword_1ED1C78F8);
  }
  return result;
}

unint64_t sub_1DB94FFE0()
{
  unint64_t result;

  result = qword_1ED1C7900;
  if (!qword_1ED1C7900)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C7900);
  }
  return result;
}

uint64_t variable initialization expression of ChangeCameraDeviceIntent._device()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v0 = sub_1DB979930();
  v24 = *(_QWORD *)(v0 - 8);
  v25 = v0;
  MEMORY[0x1E0C80A78](v0);
  v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v21 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DB9799F0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v15);
  v16 = sub_1DB9799FC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7908);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0CAF9B8], v10);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  v26 = 2;
  v18 = sub_1DB9797F8();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x1E0C91738], v25);
  sub_1DB950340();
  return sub_1DB97984C();
}

unint64_t sub_1DB950340()
{
  unint64_t result;

  result = qword_1ED1C7910;
  if (!qword_1ED1C7910)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7910);
  }
  return result;
}

uint64_t variable initialization expression of StartCaptureIntent._captureMode()
{
  return sub_1DB9503A0(0xD00000000000001ELL, 0x80000001DB9C0880);
}

uint64_t sub_1DB9503A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v23[3];
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v23[1] = a1;
  v23[2] = a2;
  v2 = sub_1DB979930();
  v26 = *(_QWORD *)(v2 - 8);
  v27 = v2;
  MEMORY[0x1E0C80A78](v2);
  v25 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v24 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v23 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DB9799F0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v16);
  v17 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v17);
  v18 = sub_1DB9799FC();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v23[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78F0);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x1E0CAF9B8], v12);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v11, 1, 1, v18);
  v28 = 11;
  v20 = sub_1DB9797F8();
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v21(v8, 1, 1, v20);
  v21(v24, 1, 1, v20);
  (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v25, *MEMORY[0x1E0C91738], v27);
  sub_1DB94FF9C();
  sub_1DB94FFE0();
  return sub_1DB979840();
}

uint64_t variable initialization expression of StartCaptureIntent._timerDuration()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v21[2];
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v0 = sub_1DB979930();
  v24 = *(_QWORD *)(v0 - 8);
  v25 = v0;
  MEMORY[0x1E0C80A78](v0);
  v23 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v22 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v21 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DB9799F0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v15);
  v16 = sub_1DB9799FC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v21[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7918);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0CAF9B8], v10);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  v27 = 4;
  v18 = sub_1DB9797F8();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7920);
  swift_getKeyPath();
  v26 = sub_1DB979960();
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x1E0C91738], v25);
  sub_1DB950DB0();
  sub_1DB950DF4();
  return sub_1DB979840();
}

uint64_t variable initialization expression of StartCaptureIntent._device()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v21[2];
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v0 = sub_1DB979930();
  v24 = *(_QWORD *)(v0 - 8);
  v25 = v0;
  MEMORY[0x1E0C80A78](v0);
  v23 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v22 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v21 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DB9799F0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v15);
  v16 = sub_1DB9799FC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v21[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7938);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0CAF9B8], v10);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  v27 = 2;
  v18 = sub_1DB9797F8();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7920);
  swift_getKeyPath();
  v26 = sub_1DB979960();
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x1E0C91738], v25);
  sub_1DB950E38();
  sub_1DB950340();
  return sub_1DB979840();
}

uint64_t sub_1DB950D88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB979834();
  *a1 = result;
  return result;
}

unint64_t sub_1DB950DB0()
{
  unint64_t result;

  result = qword_1ED1C7928;
  if (!qword_1ED1C7928)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A90D0, &type metadata for TimerDuration.AvailableTimerProvider);
    atomic_store(result, (unint64_t *)&qword_1ED1C7928);
  }
  return result;
}

unint64_t sub_1DB950DF4()
{
  unint64_t result;

  result = qword_1ED1C7930;
  if (!qword_1ED1C7930)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7930);
  }
  return result;
}

unint64_t sub_1DB950E38()
{
  unint64_t result;

  result = qword_1ED1C7940;
  if (!qword_1ED1C7940)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A9528, &type metadata for CaptureDevice.AvailableDeviceProvider);
    atomic_store(result, (unint64_t *)&qword_1ED1C7940);
  }
  return result;
}

uint64_t variable initialization expression of ViewfinderViewController._hasHandleURLs()
{
  return 0;
}

uint64_t type metadata accessor for Subsystems()
{
  return objc_opt_self();
}

void type metadata accessor for CAMCaptureButtonStage(uint64_t a1)
{
  sub_1DB950F38(a1, &qword_1F0303ED8);
}

void type metadata accessor for OverlaySliderAlignment(uint64_t a1)
{
  sub_1DB950F38(a1, &qword_1F0303EE0);
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
  sub_1DB950F38(a1, &qword_1F0303EE8);
}

_QWORD *sub_1DB950EE0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_1DB950EF0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_1DB950F04(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_1DB950F38(a1, &qword_1F0303EF0);
}

void type metadata accessor for PXUnlockDeviceActionType(uint64_t a1)
{
  sub_1DB950F38(a1, &qword_1F0303EF8);
}

void sub_1DB950F38(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t static ViewfinderLockScreenExtensionHelper.notifyCompleteTransition()()
{
  sub_1DB979AA4();
  sub_1DB979A98();
  sub_1DB979A8C();
  return swift_release();
}

uint64_t static ViewfinderLockScreenExtensionHelper.transitionToApplication(for:session:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DB951088;
  return sub_1DB979AC8();
}

uint64_t sub_1DB951088()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id ViewfinderLockScreenExtensionHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ViewfinderLockScreenExtensionHelper.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ViewfinderLockScreenExtensionHelper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s8CameraUI35ViewfinderLockScreenExtensionHelperC24executeUnlockOneUpAction_2onySo014PXUnlockDeviceL4TypeV_So05PUOneK14ViewControllerCSgtFZ_0(id result, id a2)
{
  id v2;

  if (a2)
  {
    v2 = result;
    result = objc_msgSend(a2, sel_actionsController);
    if (result)
    {
      if (v2 == (id)1)
      {
        objc_msgSend(result, sel_performSimpleActionWithActionType_, 15);
      }
      else if (v2 == (id)2)
      {
        objc_msgSend(result, sel_performSimpleActionWithActionType_, 62);
      }
      else if (v2 == (id)3)
      {
        objc_msgSend(result, sel_performShareAction);
      }
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t type metadata accessor for ViewfinderLockScreenExtensionHelper()
{
  return objc_opt_self();
}

uint64_t sub_1DB95128C()
{
  uint64_t v0;
  uint64_t v2;

  if (!*(_QWORD *)(v0 + OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel))
    return 0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_1DB951320(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = v2;
  v6 = OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel;
  if (!*(_QWORD *)(v2 + OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel))
    goto LABEL_9;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  result = swift_release();
  if (v12 != 2)
  {
    if (v12 == 1)
    {
      v8 = *(_QWORD *)(v2 + v6);
      if (v8)
      {
        v9 = (uint64_t *)(v8 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
        v10 = *v9;
        *v9 = (uint64_t)a1;
        v9[1] = a2;
        sub_1DB953604((uint64_t)a1);
        return sub_1DB9535B8(v10);
      }
      return result;
    }
    if (v12)
    {
      result = sub_1DB97A23C();
      __break(1u);
      return result;
    }
LABEL_9:
    type metadata accessor for OnboardingBuddySetupViewModel();
    swift_allocObject();
    sub_1DB953604((uint64_t)a1);
    v11 = sub_1DB9701C4((uint64_t)a1, a2);
    sub_1DB9535B8((uint64_t)a1);
    *(_QWORD *)(v3 + v6) = v11;
    return swift_release();
  }
  if (a1)
    return a1(2);
  return result;
}

uint64_t sub_1DB951534()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___CAMOnboardingBuddyViewManager_viewModel);
  if (!v2)
  {
    type metadata accessor for OnboardingBuddySetupViewModel();
    swift_allocObject();
    v2 = sub_1DB9701C4(0, 0);
  }
  *(_QWORD *)(v0 + v1) = v2;
  sub_1DB9798DC();
  result = swift_release();
  if (*(_QWORD *)(v0 + v1))
  {
    objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1F0304020));
    sub_1DB9798DC();
    swift_unknownObjectRetain();
    return sub_1DB979D50();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1DB9516A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OnboardingBuddyViewManager()
{
  return objc_opt_self();
}

uint64_t sub_1DB95170C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v33 = a1;
  v8 = a4 & 1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304048);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304050);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v26 - v16;
  v34 = sub_1DB979D44();
  type metadata accessor for OnboardingBuddySetupViewModel();
  sub_1DB953BBC(&qword_1F0304058, (uint64_t (*)(uint64_t))type metadata accessor for OnboardingBuddySetupViewModel, (uint64_t)&unk_1DB9AA480);
  sub_1DB979C9C();
  v32 = sub_1DB979CB4();
  v19 = v18;
  sub_1DB979F00();
  sub_1DB979CA8();
  v31 = v35;
  v30 = v36;
  v29 = v37;
  v28 = v38;
  v26 = v40;
  v27 = v39;
  *(_QWORD *)v11 = sub_1DB979D44();
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304060);
  sub_1DB9519FC(v33, a2, a3, v8, &v11[*(int *)(v20 + 44)]);
  sub_1DB979EF4();
  sub_1DB979CA8();
  sub_1DB953CB8((uint64_t)v11, (uint64_t)v15, &qword_1F0304048);
  v21 = &v15[*(int *)(v12 + 36)];
  v22 = v42;
  *(_OWORD *)v21 = v41;
  *((_OWORD *)v21 + 1) = v22;
  *((_OWORD *)v21 + 2) = v43;
  sub_1DB953C64((uint64_t)v11, &qword_1F0304048);
  sub_1DB953C20((uint64_t)v15, (uint64_t)v17, &qword_1F0304050);
  sub_1DB953CB8((uint64_t)v17, (uint64_t)v15, &qword_1F0304050);
  *(_QWORD *)a5 = v34;
  *(_QWORD *)(a5 + 8) = 0;
  *(_BYTE *)(a5 + 16) = 1;
  *(_QWORD *)(a5 + 24) = v32;
  *(_QWORD *)(a5 + 32) = v19;
  *(_BYTE *)(a5 + 40) = 0;
  *(_QWORD *)(a5 + 48) = 0;
  *(_BYTE *)(a5 + 56) = 1;
  *(_QWORD *)(a5 + 64) = v31;
  *(_BYTE *)(a5 + 72) = v30;
  *(_QWORD *)(a5 + 80) = v29;
  *(_BYTE *)(a5 + 88) = v28;
  v23 = v26;
  *(_QWORD *)(a5 + 96) = v27;
  *(_QWORD *)(a5 + 104) = v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304068);
  sub_1DB953CB8((uint64_t)v15, a5 + *(int *)(v24 + 48), &qword_1F0304050);
  sub_1DB9798DC();
  sub_1DB953C64((uint64_t)v17, &qword_1F0304050);
  sub_1DB953C64((uint64_t)v15, &qword_1F0304050);
  return swift_release();
}

uint64_t sub_1DB9519FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, _QWORD *a5@<X8>)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  char v52;
  id v53;
  uint64_t v54;
  void (*v55)(_QWORD, _QWORD, _QWORD);
  void (*v56)(_QWORD, _QWORD, _QWORD);
  uint64_t v57;
  uint64_t KeyPath;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(_QWORD, _QWORD, _QWORD);
  void (*v88)(_QWORD, _QWORD, _QWORD);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD *v145;
  int *v146;
  char *v147;
  uint64_t v148;
  char *v149;
  char *v150;
  char *v152;
  void (*v153)(char *, char *, uint64_t);
  unint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  char *v162;
  _BOOL4 v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  _QWORD *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  char *v202;
  uint64_t v203;
  uint64_t v204;
  char *v205;
  uint64_t v206;
  char *v207;
  void (*v208)(_QWORD, _QWORD, _QWORD);
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  unsigned __int8 v212;
  uint64_t v213;
  unsigned __int8 v214;
  uint64_t v215;
  uint64_t v216;

  v173 = a1;
  v193 = a5;
  v7 = a4 & 1;
  v190 = sub_1DB979CD8();
  v189 = *(_QWORD *)(v190 - 8);
  MEMORY[0x1E0C80A78](v190);
  v188 = (char *)&v152 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v181 = sub_1DB979D68();
  v180 = *(_QWORD *)(v181 - 8);
  MEMORY[0x1E0C80A78](v181);
  v179 = (char *)&v152 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304070);
  v177 = *(_QWORD *)(v178 - 8);
  MEMORY[0x1E0C80A78](v178);
  v175 = (char *)&v152 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304078);
  v184 = *(_QWORD *)(v185 - 8);
  MEMORY[0x1E0C80A78](v185);
  v183 = (char *)&v152 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304080);
  MEMORY[0x1E0C80A78](v174);
  v186 = (char *)&v152 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304088);
  v13 = MEMORY[0x1E0C80A78](v182);
  v192 = (uint64_t)&v152 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v191 = (uint64_t)&v152 - v15;
  v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304090);
  MEMORY[0x1E0C80A78](v165);
  v169 = (char *)&v152 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304098);
  MEMORY[0x1E0C80A78](v167);
  v168 = (uint64_t)&v152 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03040A0);
  MEMORY[0x1E0C80A78](v166);
  v171 = (uint64_t)&v152 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03040A8);
  MEMORY[0x1E0C80A78](v19);
  v172 = (uint64_t)&v152 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03040B0);
  v21 = MEMORY[0x1E0C80A78](v170);
  v187 = (uint64_t)&v152 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v199 = (uint64_t)&v152 - v23;
  v196 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03040B8);
  v161 = *(_QWORD *)(v196 - 8);
  v24 = MEMORY[0x1E0C80A78](v196);
  v164 = (char *)&v152 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v24);
  v160 = (char *)&v152 - v26;
  v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03040C0);
  MEMORY[0x1E0C80A78](v157);
  v162 = (char *)&v152 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03040C8);
  v28 = MEMORY[0x1E0C80A78](v159);
  v176 = (uint64_t)&v152 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x1E0C80A78](v28);
  v158 = (uint64_t)&v152 - v31;
  MEMORY[0x1E0C80A78](v30);
  v197 = (uint64_t)&v152 - v32;
  v33 = type metadata accessor for OnboardingBuddySetupViewModel();
  v34 = sub_1DB953BBC(&qword_1F0304058, (uint64_t (*)(uint64_t))type metadata accessor for OnboardingBuddySetupViewModel, (uint64_t)&unk_1DB9AA480);
  v200 = a2;
  LODWORD(v201) = v7;
  v195 = v33;
  v194 = v34;
  v35 = sub_1DB979C9C();
  v36 = *(void **)(v35 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle);
  if (v36)
  {
    v37 = *(id *)(v35 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle);
  }
  else
  {
    v37 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v36 = 0;
  }
  v38 = v36;
  v39 = sub_1DB979984();
  v41 = v40;
  swift_release();

  v202 = (char *)v39;
  v203 = v41;
  v156 = sub_1DB95387C();
  v42 = sub_1DB979E64();
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v49 = sub_1DB979F0C();
  v50 = *(void **)(sub_1DB979C9C() + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle);
  v198 = a3;
  if (v50)
  {
    v51 = v50;
  }
  else
  {
    v51 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v50 = 0;
  }
  v52 = v46 & 1;
  v163 = (_DWORD)v201 != 0;
  v53 = v50;
  v54 = sub_1DB979984();
  v56 = v55;
  v153 = (void (*)(char *, char *, uint64_t))v55;
  swift_release();

  v57 = sub_1DB979E28();
  KeyPath = swift_getKeyPath();
  v202 = (char *)v42;
  v203 = v44;
  LOBYTE(v204) = v52;
  v205 = v48;
  v206 = v49;
  v207 = (char *)v54;
  v208 = v56;
  v209 = KeyPath;
  v210 = v57;
  sub_1DB979E40();
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03040D8);
  v152 = v48;
  v155 = v59;
  v154 = sub_1DB953910();
  v60 = v160;
  sub_1DB979E88();
  sub_1DB953A5C(v42, v44, v52);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v61 = sub_1DB979EB8();
  v62 = swift_getKeyPath();
  v63 = v161;
  v153 = *(void (**)(char *, char *, uint64_t))(v161 + 16);
  v64 = (uint64_t)v162;
  v65 = v196;
  v153(v162, v60, v196);
  v66 = (uint64_t *)(v64 + *(int *)(v157 + 36));
  *v66 = v62;
  v66[1] = v61;
  v161 = *(_QWORD *)(v63 + 8);
  ((void (*)(char *, uint64_t))v161)(v60, v65);
  LOBYTE(v61) = sub_1DB979E10();
  sub_1DB979C90();
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v75 = v158;
  sub_1DB953CB8(v64, v158, &qword_1F03040C0);
  v76 = v75 + *(int *)(v159 + 36);
  *(_BYTE *)v76 = v61;
  *(_QWORD *)(v76 + 8) = v68;
  *(_QWORD *)(v76 + 16) = v70;
  *(_QWORD *)(v76 + 24) = v72;
  *(_QWORD *)(v76 + 32) = v74;
  *(_BYTE *)(v76 + 40) = 0;
  sub_1DB953C64(v64, &qword_1F03040C0);
  sub_1DB953C20(v75, v197, &qword_1F03040C8);
  sub_1DB979C9C();
  v77 = sub_1DB96E838();
  v79 = v78;
  swift_release();
  v202 = (char *)v77;
  v203 = v79;
  v160 = (char *)sub_1DB979E64();
  v159 = v80;
  v82 = v81;
  v162 = v81;
  v84 = v83 & 1;
  v85 = sub_1DB979F0C();
  sub_1DB979C9C();
  v86 = sub_1DB96E838();
  v88 = v87;
  swift_release();
  v89 = sub_1DB979E1C();
  v90 = swift_getKeyPath();
  v91 = (uint64_t)v160;
  v92 = v159;
  v202 = v160;
  v203 = v159;
  LOBYTE(v204) = v84;
  v205 = v82;
  v206 = v85;
  v207 = (char *)v86;
  v208 = v88;
  v209 = v90;
  v210 = v89;
  sub_1DB979E34();
  v93 = v164;
  sub_1DB979E88();
  sub_1DB953A5C(v91, v92, v84);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v94 = swift_getKeyPath();
  v95 = (uint64_t)v169;
  v96 = v196;
  v153(v169, v93, v196);
  v97 = v95 + *(int *)(v165 + 36);
  *(_QWORD *)v97 = v94;
  *(_BYTE *)(v97 + 8) = 1;
  ((void (*)(char *, uint64_t))v161)(v93, v96);
  v98 = sub_1DB979EB8();
  v99 = swift_getKeyPath();
  v100 = v168;
  sub_1DB953CB8(v95, v168, &qword_1F0304090);
  v101 = (uint64_t *)(v100 + *(int *)(v167 + 36));
  *v101 = v99;
  v101[1] = v98;
  sub_1DB953C64(v95, &qword_1F0304090);
  v102 = v171;
  sub_1DB953CB8(v100, v171, &qword_1F0304098);
  *(_QWORD *)(v102 + *(int *)(v166 + 36)) = 0x3FE3333333333333;
  sub_1DB953C64(v100, &qword_1F0304098);
  sub_1DB979F00();
  v103 = v172;
  sub_1DB952BD4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v172, 0.0, 1, 0.0, 1);
  sub_1DB953C64(v102, &qword_1F03040A0);
  LOBYTE(v98) = sub_1DB979DF8();
  sub_1DB979C90();
  v105 = v104;
  v107 = v106;
  v109 = v108;
  v111 = v110;
  v112 = v187;
  sub_1DB953CB8(v103, v187, &qword_1F03040A8);
  v113 = v112 + *(int *)(v170 + 36);
  *(_BYTE *)v113 = v98;
  *(_QWORD *)(v113 + 8) = v105;
  *(_QWORD *)(v113 + 16) = v107;
  *(_QWORD *)(v113 + 24) = v109;
  *(_QWORD *)(v113 + 32) = v111;
  *(_BYTE *)(v113 + 40) = 0;
  sub_1DB953C64(v103, &qword_1F03040A8);
  v114 = v199;
  sub_1DB953C20(v112, v199, &qword_1F03040B0);
  sub_1DB979F00();
  sub_1DB979CA8();
  v196 = v211;
  LODWORD(v195) = v212;
  v194 = v213;
  LODWORD(v172) = v214;
  v171 = v215;
  v170 = v216;
  v115 = swift_allocObject();
  v116 = v173;
  v117 = v200;
  *(_QWORD *)(v115 + 16) = v173;
  *(_QWORD *)(v115 + 24) = v117;
  *(_QWORD *)(v115 + 32) = v198;
  *(_BYTE *)(v115 + 40) = v163;
  MEMORY[0x1E0C80A78](v116);
  swift_unknownObjectRetain();
  sub_1DB953644();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304118);
  sub_1DB953D30(&qword_1F0304120, &qword_1F0304118, (uint64_t (*)(void))sub_1DB953B58, MEMORY[0x1E0CD9758]);
  v118 = v175;
  sub_1DB979EE8();
  v119 = v179;
  sub_1DB979D5C();
  sub_1DB953E34(&qword_1F0304138, &qword_1F0304070, MEMORY[0x1E0CDFA58]);
  sub_1DB953BBC(&qword_1F0304140, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDCDC0], MEMORY[0x1E0CDCDA0]);
  v120 = v183;
  v121 = v178;
  v122 = v181;
  sub_1DB979E94();
  (*(void (**)(char *, uint64_t))(v180 + 8))(v119, v122);
  (*(void (**)(char *, uint64_t))(v177 + 8))(v118, v121);
  v123 = v188;
  sub_1DB979CCC();
  v124 = swift_getKeyPath();
  v125 = (uint64_t)v186;
  v126 = (uint64_t *)&v186[*(int *)(v174 + 36)];
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304148);
  v128 = v189;
  v129 = v190;
  (*(void (**)(char *, char *, uint64_t))(v189 + 16))((char *)v126 + *(int *)(v127 + 28), v123, v190);
  *v126 = v124;
  v130 = v184;
  v131 = v185;
  (*(void (**)(uint64_t, char *, uint64_t))(v184 + 16))(v125, v120, v185);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v123, v129);
  (*(void (**)(char *, uint64_t))(v130 + 8))(v120, v131);
  LOBYTE(v131) = sub_1DB979DF8();
  sub_1DB979C90();
  v133 = v132;
  v135 = v134;
  v137 = v136;
  v139 = v138;
  v140 = v192;
  sub_1DB953CB8(v125, v192, &qword_1F0304080);
  v141 = v140 + *(int *)(v182 + 36);
  *(_BYTE *)v141 = v131;
  *(_QWORD *)(v141 + 8) = v133;
  *(_QWORD *)(v141 + 16) = v135;
  *(_QWORD *)(v141 + 24) = v137;
  *(_QWORD *)(v141 + 32) = v139;
  *(_BYTE *)(v141 + 40) = 0;
  sub_1DB953C64(v125, &qword_1F0304080);
  v142 = v191;
  sub_1DB953C20(v140, v191, &qword_1F0304088);
  sub_1DB979F00();
  sub_1DB979CA8();
  v201 = v202;
  LODWORD(v200) = v203;
  v198 = v204;
  LODWORD(v190) = v205;
  v189 = v206;
  v188 = v207;
  v143 = v197;
  v144 = v176;
  sub_1DB953CB8(v197, v176, &qword_1F03040C8);
  sub_1DB953CB8(v114, v112, &qword_1F03040B0);
  sub_1DB953CB8(v142, v140, &qword_1F0304088);
  v145 = v193;
  *v193 = 0;
  *((_BYTE *)v145 + 8) = 1;
  v146 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F0304150);
  sub_1DB953CB8(v144, (uint64_t)v145 + v146[12], &qword_1F03040C8);
  sub_1DB953CB8(v112, (uint64_t)v145 + v146[16], &qword_1F03040B0);
  v147 = (char *)v145 + v146[20];
  *(_QWORD *)v147 = 0;
  v147[8] = 1;
  *((_QWORD *)v147 + 2) = v196;
  v147[24] = v195;
  *((_QWORD *)v147 + 4) = v194;
  v147[40] = v172;
  v148 = v170;
  *((_QWORD *)v147 + 6) = v171;
  *((_QWORD *)v147 + 7) = v148;
  sub_1DB953CB8(v140, (uint64_t)v145 + v146[24], &qword_1F0304088);
  v149 = (char *)v145 + v146[28];
  *(_QWORD *)v149 = 0;
  v149[8] = 1;
  *((_QWORD *)v149 + 2) = v201;
  v149[24] = v200;
  *((_QWORD *)v149 + 4) = v198;
  v149[40] = v190;
  v150 = v188;
  *((_QWORD *)v149 + 6) = v189;
  *((_QWORD *)v149 + 7) = v150;
  sub_1DB953C64(v142, &qword_1F0304088);
  sub_1DB953C64(v199, &qword_1F03040B0);
  sub_1DB953C64(v143, &qword_1F03040C8);
  sub_1DB953C64(v140, &qword_1F0304088);
  sub_1DB953C64(v112, &qword_1F03040B0);
  return sub_1DB953C64(v144, &qword_1F03040C8);
}

__n128 sub_1DB952BD4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1DB97A0C8();
    v23 = (void *)sub_1DB979DEC();
    sub_1DB979AD4();

  }
  sub_1DB979CC0();
  sub_1DB953CB8(v13, a9, &qword_1F03040A0);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F03040A8) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_1DB952D90@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v20 = a19;
  v21 = a18;
  v22 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1DB97A0C8();
    v31 = (void *)sub_1DB979DEC();
    sub_1DB979AD4();

    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  sub_1DB979CC0();
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_1DB953CA0(a16, v22, v21 & 1);
  return sub_1DB9798D0();
}

uint64_t sub_1DB952F70(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v7 = a4 & 1;
  type metadata accessor for OnboardingBuddySetupViewModel();
  sub_1DB953BBC(&qword_1F0304058, (uint64_t (*)(uint64_t))type metadata accessor for OnboardingBuddySetupViewModel, (uint64_t)&unk_1DB9AA480);
  sub_1DB979C9C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  result = swift_release();
  if (v9 == 1)
  {
    if (a1)
    {
      LOBYTE(v10) = v7 != 0;
      swift_unknownObjectRetain();
      sub_1DB953644();
      objc_msgSend(a1, sel_cameraButtonBuddyViewControllerDidFinish_, sub_1DB97A248(), a1, a2, a3, v10);
      return swift_unknownObjectRelease();
    }
  }
  else if (v9)
  {
    result = sub_1DB97A23C();
    __break(1u);
  }
  else
  {
    sub_1DB979C9C();
    sub_1DB96E9A8();
    return swift_release();
  }
  return result;
}

uint64_t sub_1DB953114@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[7];
  _OWORD v33[9];

  type metadata accessor for OnboardingBuddySetupViewModel();
  sub_1DB953BBC(&qword_1F0304058, (uint64_t (*)(uint64_t))type metadata accessor for OnboardingBuddySetupViewModel, (uint64_t)&unk_1DB9AA480);
  v2 = sub_1DB979C9C();
  v3 = *(void **)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle);
  if (v3)
  {
    v4 = *(id *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v3 = 0;
  }
  v5 = v3;
  v6 = sub_1DB979984();
  v8 = v7;
  swift_release();

  *(_QWORD *)&v33[0] = v6;
  *((_QWORD *)&v33[0] + 1) = v8;
  sub_1DB95387C();
  v9 = sub_1DB979E64();
  v11 = v10;
  LOBYTE(v8) = v12 & 1;
  sub_1DB979E4C();
  v13 = sub_1DB979E58();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  swift_release();
  sub_1DB953A5C(v9, v11, v8);
  swift_bridgeObjectRelease();
  v20 = sub_1DB979F00();
  sub_1DB952D90(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v33, 0.0, 1, 0.0, 1, v20, v21, v13, v15, v17 & 1, v19);
  sub_1DB953A5C(v13, v15, v17 & 1);
  swift_bridgeObjectRelease();
  LOBYTE(v9) = sub_1DB979E10();
  result = sub_1DB979C90();
  v23 = v33[7];
  v24 = v33[8];
  *(_OWORD *)(a1 + 96) = v33[6];
  *(_OWORD *)(a1 + 112) = v23;
  *(_OWORD *)(a1 + 128) = v24;
  v25 = v33[3];
  *(_OWORD *)(a1 + 32) = v33[2];
  *(_OWORD *)(a1 + 48) = v25;
  v26 = v33[5];
  *(_OWORD *)(a1 + 64) = v33[4];
  *(_OWORD *)(a1 + 80) = v26;
  v27 = v33[1];
  *(_OWORD *)a1 = v33[0];
  *(_OWORD *)(a1 + 16) = v27;
  *(_BYTE *)(a1 + 144) = v9;
  *(_DWORD *)(a1 + 145) = *(_DWORD *)v32;
  *(_DWORD *)(a1 + 148) = *(_DWORD *)&v32[3];
  *(_QWORD *)(a1 + 152) = v28;
  *(_QWORD *)(a1 + 160) = v29;
  *(_QWORD *)(a1 + 168) = v30;
  *(_QWORD *)(a1 + 176) = v31;
  *(_BYTE *)(a1 + 184) = 0;
  return result;
}

uint64_t sub_1DB9533B0()
{
  return sub_1DB979EA0();
}

uint64_t sub_1DB9533C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304028);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304030);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)v1;
  v10 = *(_QWORD *)(v1 + 8);
  v11 = *(_QWORD *)(v1 + 16);
  v12 = *(_BYTE *)(v1 + 24);
  *v5 = sub_1DB979F00();
  v5[1] = v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304038);
  sub_1DB95170C(v9, v10, v11, v12, (uint64_t)v5 + *(int *)(v14 + 44));
  v15 = sub_1DB979EAC();
  LOBYTE(v9) = sub_1DB979E04();
  sub_1DB953CB8((uint64_t)v5, (uint64_t)v8, &qword_1F0304028);
  v16 = &v8[*(int *)(v6 + 36)];
  *(_QWORD *)v16 = v15;
  v16[8] = v9;
  sub_1DB953C64((uint64_t)v5, &qword_1F0304028);
  LOBYTE(v15) = sub_1DB979E04();
  sub_1DB953CB8((uint64_t)v8, a1, &qword_1F0304030);
  *(_BYTE *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F0304040) + 36)) = v15;
  return sub_1DB953C64((uint64_t)v8, &qword_1F0304030);
}

uint64_t sub_1DB953534(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1DB979CD8();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1DB979D08();
}

uint64_t sub_1DB9535B0()
{
  return sub_1DB9798DC();
}

uint64_t sub_1DB9535B8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1DB9535C8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DB9535EC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1DB953604(uint64_t result)
{
  if (result)
    return sub_1DB9798DC();
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OnboardingBuddySetupView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  sub_1DB9798DC();
  return v3;
}

uint64_t sub_1DB953644()
{
  return sub_1DB9798DC();
}

uint64_t destroy for OnboardingBuddySetupView()
{
  swift_unknownObjectRelease();
  return sub_1DB953678();
}

uint64_t sub_1DB953678()
{
  return swift_release();
}

uint64_t initializeWithCopy for OnboardingBuddySetupView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_BYTE *)(a2 + 24);
  swift_unknownObjectRetain();
  sub_1DB953644();
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v5;
  return a1;
}

uint64_t assignWithCopy for OnboardingBuddySetupView(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v4 = v2[1];
  v5 = v2[2];
  LOBYTE(v2) = *((_BYTE *)v2 + 24);
  sub_1DB953644();
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = (_BYTE)v2;
  sub_1DB953678();
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for OnboardingBuddySetupView(uint64_t a1, uint64_t a2)
{
  char v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  v4 = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = v4;
  sub_1DB953678();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnboardingBuddySetupView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 25))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OnboardingBuddySetupView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OnboardingBuddySetupView()
{
  return &type metadata for OnboardingBuddySetupView;
}

uint64_t sub_1DB95386C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DB95387C()
{
  unint64_t result;

  result = qword_1F03040D0;
  if (!qword_1F03040D0)
  {
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F03040D0);
  }
  return result;
}

uint64_t sub_1DB9538C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB979D2C();
  *a1 = result;
  return result;
}

uint64_t sub_1DB9538E8()
{
  sub_1DB9798DC();
  return sub_1DB979D38();
}

unint64_t sub_1DB953910()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F03040E0;
  if (!qword_1F03040E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03040D8);
    v2[0] = sub_1DB9539D8();
    v2[1] = sub_1DB953E34(&qword_1F0304108, &qword_1F0304110, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F03040E0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0B5B4C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1DB9539D8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1F03040E8;
  if (!qword_1F03040E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03040F0);
    v2 = sub_1DB953E34(&qword_1F03040F8, &qword_1F0304100, MEMORY[0x1E0CDB148]);
    v3[0] = MEMORY[0x1E0CDDD58];
    v3[1] = v2;
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1F03040E8);
  }
  return result;
}

uint64_t sub_1DB953A5C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_1DB953A6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB979CE4();
  *a1 = result;
  return result;
}

uint64_t sub_1DB953A94()
{
  sub_1DB9798DC();
  return sub_1DB979CF0();
}

uint64_t sub_1DB953ABC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB979D14();
  *a1 = result;
  return result;
}

uint64_t sub_1DB953AE4()
{
  return sub_1DB979D20();
}

uint64_t sub_1DB953B08()
{
  swift_unknownObjectRelease();
  sub_1DB953678();
  return swift_deallocObject();
}

uint64_t sub_1DB953B38()
{
  uint64_t v0;

  return sub_1DB952F70(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

uint64_t sub_1DB953B48@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB953114(a1);
}

unint64_t sub_1DB953B58()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F0304128;
  if (!qword_1F0304128)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304130);
    v2[0] = MEMORY[0x1E0CDDD58];
    v2[1] = MEMORY[0x1E0CDA228];
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F0304128);
  }
  return result;
}

uint64_t sub_1DB953BBC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0B5B58](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB953BFC()
{
  return sub_1DB979CFC();
}

uint64_t sub_1DB953C20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DB953C64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DB953CA0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return sub_1DB9798DC();
  else
    return sub_1DB9798D0();
}

uint64_t sub_1DB953CB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DB953CFC()
{
  return sub_1DB953D30(&qword_1F0304158, &qword_1F0304040, (uint64_t (*)(void))sub_1DB953D98, MEMORY[0x1E0CDC500]);
}

uint64_t sub_1DB953D30(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CD9C20], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DB953D98()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F0304160;
  if (!qword_1F0304160)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304030);
    v2[0] = sub_1DB953E34(&qword_1F0304168, &qword_1F0304028, MEMORY[0x1E0CDFCF8]);
    v2[1] = sub_1DB953E34(&qword_1F0304170, &qword_1F0304178, MEMORY[0x1E0CDC6D0]);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F0304160);
  }
  return result;
}

uint64_t sub_1DB953E34(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0B5B58](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1DB953EE4(uint64_t a1, char a2)
{
  uint64_t v2;
  id v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if ((a2 & 1) != 0)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_functionWithName_, *MEMORY[0x1E0CD3048]);
    v5 = 0.25;
  }
  else
  {
    v4 = 0;
    v5 = 0.0;
  }
  v6 = *(void **)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider);
  v8 = v4;
  objc_msgSend(v6, sel_setSelectedIndex_animatedDuration_animatedCurve_completion_, a1, v5);
  v7 = (void *)MEMORY[0x1DF0B5C48](v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate);
  if (v7)
  {
    objc_msgSend(v7, sel_overlayMenuSlider_didSelectControlAt_, v2, objc_msgSend(v6, sel_selectedIndex));

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

uint64_t sub_1DB9540D0(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  void *v5;
  id v6;
  uint64_t v7;
  char *v8;
  double v9;
  double v10;

  v2 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames;
  v3 = *(_QWORD **)&v1[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames];
  result = sub_1DB955448(v3, a1);
  if ((result & 1) == 0)
  {
    v5 = *(void **)&v1[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider];
    objc_msgSend(v5, sel_setIndexCount_, v3[2]);
    v6 = objc_msgSend(v5, sel_imageDataConfiguration);
    if (v6)
    {
      objc_msgSend(v6, sel_reloadContent);
      swift_unknownObjectRelease();
    }
    v7 = *(_QWORD *)(*(_QWORD *)&v1[v2] + 16);
    v8 = v1;
    sub_1DB95550C(0, v7, (uint64_t)v8, 0.0);
    v10 = v9;

    if (v10 >= *(double *)&v8[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension])
      v10 = *(double *)&v8[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension];
    objc_msgSend(objc_msgSend(v5, sel_tickMarksConfiguration), sel_setTickMarkWidth_, v10);
    swift_unknownObjectRelease();
    return (uint64_t)objc_msgSend(v5, sel_setLevelIndicatorHeight_, v10);
  }
  return result;
}

void sub_1DB954210(unint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v16;
  CGSize v17;

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames) + 16) <= a1)
  {
LABEL_12:
    __break(1u);
    return;
  }
  v2 = (void *)objc_opt_self();
  sub_1DB9798D0();
  v3 = objc_msgSend(v2, sel_configurationWithScale_, 3);
  v4 = (void *)sub_1DB979FA8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v4, v3);

  if (v5)
  {
    v6 = *(double *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension);
    objc_msgSend(v5, sel_size);
    v8 = v6 / v7;
    objc_msgSend(v5, sel_size);
    v10 = v6 / v9;
    if (v6 / v9 >= v8)
      v10 = v8;
    if (v10 <= 0.9)
      v11 = v10;
    else
      v11 = 0.9;
    objc_msgSend(v5, sel_size);
    v13 = v12;
    v15 = v14;
    CGAffineTransformMakeScale(&v16, v11, v11);
    v17.width = v13;
    v17.height = v15;
    CGSizeApplyAffineTransform(v17, &v16);

  }
}

uint64_t sub_1DB9544F4(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  void (*v12)(_BYTE *, uint64_t, uint64_t);
  void (*v13)(_BYTE *, uint64_t);
  id v14;
  _BYTE v16[24];

  v2 = v1;
  v4 = sub_1DB979A80();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v16[-v9];
  v11 = v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_disabledMenuItemsIndices;
  swift_beginAccess();
  v12 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, v11, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v5 + 24))(v11, a1, v4);
  swift_endAccess();
  v12(v8, v11, v4);
  sub_1DB955818();
  LOBYTE(v11) = sub_1DB979F84();
  v13 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v13(v8, v4);
  if ((v11 & 1) == 0)
  {
    v14 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_imageDataConfiguration);
    if (v14)
    {
      objc_msgSend(v14, sel_reloadContent);
      swift_unknownObjectRelease();
    }
  }
  v13(a1, v4);
  return ((uint64_t (*)(_BYTE *, uint64_t))v13)(v10, v4);
}

char *sub_1DB954778(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *ObjectType;
  uint64_t v10;
  id v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  objc_super v22;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v10 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider;
  v11 = objc_allocWithZone(MEMORY[0x1E0D0D040]);
  v12 = v4;
  *(_QWORD *)&v4[v10] = objc_msgSend(v11, sel_initWithTickMarkStyle_, 1);
  *(_QWORD *)&v12[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension] = 0x4039000000000000;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames] = MEMORY[0x1E0DEE9D8];
  sub_1DB979A74();
  *(_QWORD *)&v12[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation] = 1;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment] = 1;

  v22.receiver = v12;
  v22.super_class = ObjectType;
  v13 = (char *)objc_msgSendSuper2(&v22, sel_initWithFrame_, a1, a2, a3, a4);
  v14 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider;
  v15 = *(void **)&v13[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider];
  v16 = v13;
  objc_msgSend(v15, sel_setDelegate_, v16);
  objc_msgSend(v15, sel_setSliderVerticalAlignment_, 1);
  v17 = objc_msgSend(v15, sel_imageDataConfiguration);
  if (v17)
  {
    objc_msgSend(v17, sel_setImageDataProvider_, v16);
    swift_unknownObjectRelease();
  }
  objc_msgSend(objc_msgSend(*(id *)&v13[v14], sel_tickMarksConfiguration), sel_setMainTickMarkInterval_, 1);
  swift_unknownObjectRelease();
  v18 = objc_msgSend(*(id *)&v13[v14], sel_tickMarksConfiguration);
  v19 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v18, sel_setMainTickMarkColor_, v19);
  swift_unknownObjectRelease();

  objc_msgSend(objc_msgSend(*(id *)&v13[v14], sel_tickMarksConfiguration), sel_setTickMarkSpacing_, 50.0);
  swift_unknownObjectRelease();
  v20 = *(void **)&v13[v14];
  objc_msgSend(v20, sel_setBiasScrollingToCurrentSelection_, 0);
  objc_msgSend(v20, sel_setTransparentGradients);
  objc_msgSend(v20, sel_setGradientInsets_, 20.0, 20.0);
  objc_msgSend(v20, sel_addTarget_action_forControlEvents_, v16, sel_discreteSliderDidChangeValue_, 4096);
  objc_msgSend(v16, sel_addSubview_, v20);

  return v16;
}

id sub_1DB954A74()
{
  char *v0;
  uint64_t v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  uint64_t v6;
  double a;
  double b;
  double c;
  double d;
  double ty;
  double tx;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  id result;
  void *v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect v23;

  objc_msgSend(v0, sel_bounds);
  fmin(CGRectGetWidth(v23) + -50.0, 0.0);
  objc_msgSend(v0, sel_bounds);
  v1 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment;
  UIRectInsetEdges();
  if (*(_QWORD *)&v0[v1])
    v6 = 4;
  else
    v6 = 3;
  CAMViewGeometryForOrientedFrame(v6, (uint64_t)&v21, v2, v3, v4, v5);
  a = v21.a;
  b = v21.b;
  c = v21.c;
  d = v21.d;
  tx = v21.tx;
  ty = v21.ty;
  v21 = v22;
  CGAffineTransformScale(&v20, &v21, -1.0, 1.0);
  v18 = *(_OWORD *)&v20.c;
  v19 = *(_OWORD *)&v20.a;
  v14 = v20.tx;
  v13 = v20.ty;
  v15 = *(void **)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider];
  objc_msgSend(v15, sel_setCenter_, tx + 2.0, ty);
  objc_msgSend(v15, sel_setBounds_, a, b, c, d);
  *(_OWORD *)&v21.a = v19;
  *(_OWORD *)&v21.c = v18;
  v21.tx = v14;
  v21.ty = v13;
  objc_msgSend(v15, sel_setTransform_, &v21);
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v0, sel_setHitTestInsets_);
  result = objc_msgSend(v15, sel_imageDataConfiguration);
  if (result)
  {
    v17 = result;
    sub_1DB954C5C(&v21);
    v20 = v21;
    objc_msgSend(v17, sel_setContentTransform_, &v20);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

CGFloat sub_1DB954C5C@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  double v4;
  _BOOL4 v5;
  double *v6;
  CGFloat result;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation);
  if (v3 == 2)
  {
    v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment) == 0;
    v6 = (double *)&unk_1DB9A8550;
    goto LABEL_12;
  }
  if (v3 != 4)
  {
    if (v3 == 3)
    {
      v4 = -3.14159265;
      if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment))
        v4 = 0.0;
      goto LABEL_13;
    }
    v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment) == 0;
    v6 = dbl_1DB9A7320;
LABEL_12:
    v4 = v6[v5];
    goto LABEL_13;
  }
  v4 = 3.14159265;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment))
    v4 = 0.0;
LABEL_13:
  CGAffineTransformMakeRotation(&v11, v4);
  CGAffineTransformScale(&v10, &v11, -1.0, 1.0);
  v11 = v10;
  UIIntegralTransform();
  result = v10.a;
  v8 = *(_OWORD *)&v10.c;
  v9 = *(_OWORD *)&v10.tx;
  *a1 = *(_OWORD *)&v10.a;
  a1[1] = v8;
  a1[2] = v9;
  return result;
}

unint64_t sub_1DB954DDC(unint64_t result)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames) + 16) > result)
  {
    v2 = (void *)objc_opt_self();
    sub_1DB9798D0();
    v3 = objc_msgSend(v2, sel_configurationWithScale_, 3);
    v4 = (void *)sub_1DB979FA8();
    swift_bridgeObjectRelease();
    v5 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v4, v3);

    return (unint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DB95501C(char *a1, uint64_t a2, void *a3, SEL *a4)
{
  uint64_t result;
  void *v8;
  id v9;
  char *v10;

  result = MEMORY[0x1DF0B5C48](&a1[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate]);
  if (result)
  {
    v8 = (void *)result;
    v9 = a3;
    v10 = a1;
    objc_msgSend(v8, *a4, v10);

    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_1DB9550EC(id result)
{
  uint64_t v1;
  void *v2;
  _OWORD v3[3];
  _OWORD v4[3];

  if (*(id *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation) != result)
  {
    *(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation) = result;
    result = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_imageDataConfiguration);
    if (result)
    {
      v2 = result;
      sub_1DB954C5C(v4);
      v3[0] = v4[0];
      v3[1] = v4[1];
      v3[2] = v4[2];
      objc_msgSend(v2, sel_setContentTransform_animated_, v3, 0);
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

id sub_1DB955184(id result, char a2)
{
  uint64_t v2;
  void *v4;
  _OWORD v5[3];
  _OWORD v6[3];

  if (*(id *)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation) != result)
  {
    *(_QWORD *)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation) = result;
    result = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_imageDataConfiguration);
    if (result)
    {
      v4 = result;
      sub_1DB954C5C(v6);
      v5[0] = v6[0];
      v5[1] = v6[1];
      v5[2] = v6[2];
      objc_msgSend(v4, sel_setContentTransform_animated_, v5, a2 & 1);
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1DB955360()
{
  return type metadata accessor for OverlayMenuSlider();
}

uint64_t type metadata accessor for OverlayMenuSlider()
{
  uint64_t result;

  result = qword_1F0304290;
  if (!qword_1F0304290)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DB9553A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DB979A80();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1DB955448(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_1DB97A230(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_1DB97A230() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

void sub_1DB95550C(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGSize v21;
  double width;
  double height;
  double v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  CGAffineTransform v32;
  CGSize v33;

  if (a1 != a2)
  {
    if (a2 >= a1)
    {
      v30 = (id)objc_opt_self();
      v8 = objc_opt_self();
      v31 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames;
      v28 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension;
      v29 = (id)v8;
      v9 = 16 * a1;
      v10 = a1;
      while ((uint64_t)v10 < a2)
      {
        if (a1 < 0)
          goto LABEL_24;
        if (v10 >= *(_QWORD *)(*(_QWORD *)(a3 + v31) + 16))
          goto LABEL_25;
        sub_1DB9798D0();
        v25 = objc_msgSend(v30, sel_configurationWithScale_, 3);
        v26 = (void *)sub_1DB979FA8();
        swift_bridgeObjectRelease();
        v27 = objc_msgSend(v29, sel__systemImageNamed_withConfiguration_, v26, v25);

        if (v27)
        {
          v11 = *(double *)(a3 + v28);
          objc_msgSend(v27, sel_size);
          v13 = v11 / v12;
          objc_msgSend(v27, sel_size);
          v15 = v11 / v14;
          if (v11 / v14 >= v13)
            v15 = v13;
          if (v15 <= 0.9)
            v16 = v15;
          else
            v16 = 0.9;
          objc_msgSend(v27, sel_size);
          v18 = v17;
          v20 = v19;
          CGAffineTransformMakeScale(&v32, v16, v16);
          v33.width = v18;
          v33.height = v20;
          v21 = CGSizeApplyAffineTransform(v33, &v32);
          width = v21.width;
          height = v21.height;

        }
        else
        {
          width = 0.0;
          height = 0.0;
        }
        ++v10;
        if (a4 > width)
          v24 = a4;
        else
          v24 = width;
        if (v24 > height)
          a4 = v24;
        else
          a4 = height;
        v9 += 16;
        if (a2 == v10)
          return;
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
    __break(1u);
  }
}

void sub_1DB955738()
{
  char *v0;
  uint64_t v1;

  swift_unknownObjectWeakInit();
  v1 = OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D0D040]), sel_initWithTickMarkStyle_, 1);
  *(_QWORD *)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_maximumSliderGlyphDimension] = 0x4039000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames] = MEMORY[0x1E0DEE9D8];
  sub_1DB979A74();
  *(_QWORD *)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment] = 1;

  sub_1DB97A1DC();
  __break(1u);
}

unint64_t sub_1DB955818()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03042A0;
  if (!qword_1F03042A0)
  {
    v1 = sub_1DB979A80();
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CB13C8], v1);
    atomic_store(result, (unint64_t *)&qword_1F03042A0);
  }
  return result;
}

uint64_t sub_1DB955860(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1DB955884()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DB9799F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DB9799FC();
  __swift_allocate_value_buffer(v6, static LaunchAppIntent.title);
  __swift_project_value_buffer(v6, (uint64_t)static LaunchAppIntent.title);
  sub_1DB979F90();
  if (qword_1ED1C78D0 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_1ED1C9C70);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  sub_1DB979A38();
  return sub_1DB979A08();
}

uint64_t LaunchAppIntent.title.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_1F0303D20 != -1)
    swift_once();
  v0 = sub_1DB9799FC();
  return __swift_project_value_buffer(v0, (uint64_t)static LaunchAppIntent.title);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static LaunchAppIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F0303D20 != -1)
    swift_once();
  v2 = sub_1DB9799FC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static LaunchAppIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static LaunchAppIntent.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_1F0303D20 != -1)
    swift_once();
  v2 = sub_1DB9799FC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static LaunchAppIntent.title);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static LaunchAppIntent.title.modify())()
{
  uint64_t v0;

  if (qword_1F0303D20 != -1)
    swift_once();
  v0 = sub_1DB9799FC();
  __swift_project_value_buffer(v0, (uint64_t)static LaunchAppIntent.title);
  swift_beginAccess();
  return j__swift_endAccess;
}

void *LaunchAppIntent.isDiscoverable.unsafeMutableAddressor()
{
  return &static LaunchAppIntent.isDiscoverable;
}

uint64_t static LaunchAppIntent.isDiscoverable.getter()
{
  return 0;
}

uint64_t sub_1DB955C6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F0303D20 != -1)
    swift_once();
  v2 = sub_1DB9799FC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static LaunchAppIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DB955D0C()
{
  return 0;
}

uint64_t sub_1DB955D1C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  sub_1DB97A044();
  *(_QWORD *)(v1 + 24) = sub_1DB97A038();
  sub_1DB97A020();
  return swift_task_switch();
}

uint64_t sub_1DB955D88()
{
  uint64_t v0;
  void *v1;
  void *v2;

  swift_release();
  sub_1DB95ECB0();
  v2 = v1;
  if ((objc_msgSend(v1, sel_isInCameraRollView) & 1) != 0)
    objc_msgSend(v2, sel_navigateToViewfinderView);
  sub_1DB979804();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB955E0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _s8CameraUI15LaunchAppIntentVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_1DB955E30()
{
  sub_1DB956920();
  return sub_1DB9797D4();
}

uint64_t sub_1DB955E58()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1DB9799F0();
  v3 = *(_QWORD *)(v12[0] - 8);
  MEMORY[0x1E0C80A78](v12[0]);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DB9799FC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DB979978();
  __swift_allocate_value_buffer(v10, qword_1F0306788);
  __swift_project_value_buffer(v10, (uint64_t)qword_1F0306788);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, *MEMORY[0x1E0CAF9B8], v12[0]);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1DB97996C();
}

unint64_t sub_1DB95607C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  uint64_t v15;
  char *v16;
  char *v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7948);
  MEMORY[0x1E0C80A78](v0);
  v17 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v2);
  v16 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DB9799F0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v9);
  v10 = sub_1DB9799FC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F0304340);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304530);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1DB9A4FD0;
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0CAF9B8], v4);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v16, 1, 1, v10);
  v13 = sub_1DB979888();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v17, 1, 1, v13);
  sub_1DB9798A0();
  result = sub_1DB956F28(v12);
  qword_1F03067A0 = result;
  return result;
}

uint64_t sub_1DB956348()
{
  return 1;
}

uint64_t sub_1DB956350()
{
  sub_1DB97A290();
  sub_1DB979FCC();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB95639C()
{
  return sub_1DB979FCC();
}

uint64_t sub_1DB9563B0()
{
  sub_1DB97A290();
  sub_1DB979FCC();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB9563F8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1DB97A224();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1DB956448(_QWORD *a1@<X8>)
{
  *a1 = 0x68636E75616CLL;
  a1[1] = 0xE600000000000000;
}

uint64_t sub_1DB956464@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F0303D28 != -1)
    swift_once();
  v2 = sub_1DB979978();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F0306788);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DB9564D4()
{
  sub_1DB94FF3C();
  return sub_1DB97978C();
}

uint64_t sub_1DB95650C()
{
  if (qword_1F0303D30 != -1)
    swift_once();
  return sub_1DB9798D0();
}

uint64_t sub_1DB95654C()
{
  sub_1DB956C20();
  return sub_1DB97993C();
}

void sub_1DB956584(_QWORD *a1@<X8>)
{
  *a1 = &unk_1EA3305D0;
}

uint64_t _s8CameraUI15LaunchAppIntentVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v20[2];
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v0 = sub_1DB979930();
  v24 = *(_QWORD *)(v0 - 8);
  v25 = v0;
  MEMORY[0x1E0C80A78](v0);
  v23 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v22 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v21 = (char *)v20 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DB9799F0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v13);
  v14 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1DB9799FC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v20[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0303E20);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0CAF9B8], v9);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v8, 1, 1, v15);
  v26 = 0;
  v17 = sub_1DB9797F8();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v21, 1, 1, v17);
  v18(v22, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x1E0C91738], v25);
  sub_1DB94FF3C();
  return sub_1DB97984C();
}

unint64_t sub_1DB9568C0()
{
  unint64_t result;

  result = qword_1F03042B0;
  if (!qword_1F03042B0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&qword_1F03042B0);
  }
  return result;
}

uint64_t sub_1DB956904()
{
  return MEMORY[0x1E0DEDD08];
}

uint64_t sub_1DB956910()
{
  return MEMORY[0x1E0DEDCF0];
}

unint64_t sub_1DB956920()
{
  unint64_t result;

  result = qword_1F03042B8;
  if (!qword_1F03042B8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&qword_1F03042B8);
  }
  return result;
}

unint64_t sub_1DB956968()
{
  unint64_t result;

  result = qword_1F03042C0;
  if (!qword_1F03042C0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&qword_1F03042C0);
  }
  return result;
}

unint64_t sub_1DB9569B0()
{
  unint64_t result;

  result = qword_1F03042C8;
  if (!qword_1F03042C8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&qword_1F03042C8);
  }
  return result;
}

uint64_t sub_1DB9569F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB956A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DB956C78(a1, a2, a3, (void (*)(void))sub_1DB956920);
}

unint64_t sub_1DB956A1C()
{
  unint64_t result;

  result = qword_1F03042D8;
  if (!qword_1F03042D8)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A86E0, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F03042D8);
  }
  return result;
}

unint64_t sub_1DB956A64()
{
  unint64_t result;

  result = qword_1F03042E0;
  if (!qword_1F03042E0)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A87C0, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F03042E0);
  }
  return result;
}

unint64_t sub_1DB956AAC()
{
  unint64_t result;

  result = qword_1F03042E8;
  if (!qword_1F03042E8)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A87F8, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F03042E8);
  }
  return result;
}

unint64_t sub_1DB956AF4()
{
  unint64_t result;

  result = qword_1F03042F0;
  if (!qword_1F03042F0)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8748, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F03042F0);
  }
  return result;
}

uint64_t sub_1DB956B38()
{
  return MEMORY[0x1E0DEA9E0];
}

unint64_t sub_1DB956B48()
{
  unint64_t result;

  result = qword_1F03042F8;
  if (!qword_1F03042F8)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8828, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F03042F8);
  }
  return result;
}

unint64_t sub_1DB956B90()
{
  unint64_t result;

  result = qword_1F0304300;
  if (!qword_1F0304300)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8850, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F0304300);
  }
  return result;
}

unint64_t sub_1DB956BD8()
{
  unint64_t result;

  result = qword_1F0304308;
  if (!qword_1F0304308)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8878, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F0304308);
  }
  return result;
}

unint64_t sub_1DB956C20()
{
  unint64_t result;

  result = qword_1F0304310;
  if (!qword_1F0304310)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A88D0, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F0304310);
  }
  return result;
}

uint64_t sub_1DB956C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DB956C78(a1, a2, a3, (void (*)(void))sub_1DB94FF3C);
}

uint64_t sub_1DB956C78(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DB956CBC()
{
  unint64_t result;

  result = qword_1F0304318;
  if (!qword_1F0304318)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8910, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F0304318);
  }
  return result;
}

unint64_t sub_1DB956D04()
{
  unint64_t result;

  result = qword_1F0304320;
  if (!qword_1F0304320)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8938, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F0304320);
  }
  return result;
}

unint64_t sub_1DB956D4C()
{
  unint64_t result;

  result = qword_1F0304328;
  if (!qword_1F0304328)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8708, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&qword_1F0304328);
  }
  return result;
}

unint64_t sub_1DB956D94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F0304330;
  if (!qword_1F0304330)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304338);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1F0304330);
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchAppIntent()
{
  return &type metadata for LaunchAppIntent;
}

uint64_t getEnumTagSinglePayload for LaunchAppEnum(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for LaunchAppEnum(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1DB956E88 + 4 * byte_1DB9A8598[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DB956EA8 + 4 * byte_1DB9A859D[v4]))();
}

_BYTE *sub_1DB956E88(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DB956EA8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DB956EB0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DB956EB8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DB956EC0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DB956EC8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LaunchAppEnum()
{
  return &type metadata for LaunchAppEnum;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1DB956F28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD v21[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304530);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304538);
  v6 = sub_1DB97A20C();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return v7;
  }
  v9 = v6 + 64;
  v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v21[1] = a1;
  v11 = a1 + v10;
  v12 = *(_QWORD *)(v3 + 72);
  sub_1DB9798DC();
  while (1)
  {
    sub_1DB953CB8(v11, (uint64_t)v5, &qword_1F0304530);
    result = sub_1DB96B0BC();
    if ((v14 & 1) != 0)
      break;
    v15 = result;
    *(_QWORD *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = *(_QWORD *)(v7 + 56);
    v17 = sub_1DB9798AC();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v16 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v15, v5, v17);
    v18 = *(_QWORD *)(v7 + 16);
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_11;
    *(_QWORD *)(v7 + 16) = v20;
    v11 += v12;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DB9570A8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304528);
  v2 = (_QWORD *)sub_1DB97A20C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  sub_1DB9798DC();
  v4 = (id *)(a1 + 40);
  while (1)
  {
    v5 = *((unsigned __int8 *)v4 - 8);
    v6 = *v4;
    result = sub_1DB969894(v5);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    *(_QWORD *)(v2[7] + 8 * result) = v6;
    v9 = v2[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      goto LABEL_11;
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DB9571A8(uint64_t a1)
{
  return sub_1DB9571E0(a1, &qword_1ED1C7960, &qword_1ED1C7968, sub_1DB9698C4);
}

unint64_t sub_1DB9571C4(uint64_t a1)
{
  return sub_1DB9571E0(a1, &qword_1F0304540, &qword_1F0304548, (uint64_t (*)(_QWORD))sub_1DB969938);
}

unint64_t sub_1DB9571E0(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t result;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_QWORD);

  v29 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v12 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v11 = sub_1DB97A20C();
  v12 = (_QWORD *)v11;
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v12;
  }
  v14 = &v10[*(int *)(v7 + 48)];
  v15 = v11 + 64;
  v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v28 = a1;
  v17 = a1 + v16;
  v18 = *(_QWORD *)(v8 + 72);
  sub_1DB9798DC();
  while (1)
  {
    sub_1DB953CB8(v17, (uint64_t)v10, a2);
    v19 = *v10;
    result = v29(*v10);
    if ((v21 & 1) != 0)
      break;
    v22 = result;
    *(_QWORD *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v12[6] + result) = v19;
    v23 = v12[7];
    v24 = sub_1DB9798AC();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v23 + *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72) * v22, v14, v24);
    v25 = v12[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_11;
    v12[2] = v27;
    v17 += v18;
    if (!--v13)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DB957378(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7950);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7958);
  v6 = sub_1DB97A20C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  sub_1DB9798DC();
  while (1)
  {
    sub_1DB953CB8(v12, (uint64_t)v5, &qword_1ED1C7950);
    v14 = *v5;
    result = sub_1DB9699F0(*v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v7[6] + result) = v14;
    v18 = v7[7];
    v19 = sub_1DB9798AC();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v9, v19);
    v20 = v7[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_1DB957510(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1DB95756C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1DB957630 + 4 * byte_1DB9A8998[a2]))(0x746F6F6853);
}

uint64_t sub_1DB957630(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x746F6F6853 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_1DB97A230();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1DB957758(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1DB957798(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1DB9577E8 + 4 * byte_1DB9A89A4[a2]))(0x74726F6873);
}

uint64_t sub_1DB9577E8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x74726F6873 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_1DB97A230();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1DB95787C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x746E6F7266;
  else
    v3 = 1801675106;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x746E6F7266;
  else
    v5 = 1801675106;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1DB97A230();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_1DB957914(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1DB957958()
{
  sub_1DB979FCC();
  return swift_bridgeObjectRelease();
}

void sub_1DB957A18(uint64_t a1, char a2)
{
  sub_1DB97A290();
  __asm { BR              X10 }
}

uint64_t sub_1DB957A68()
{
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB957B3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  float v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  id v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  float v37;
  unsigned int v38;
  double v39;
  double v40;
  double v41;
  uint64_t result;
  void *v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1DB979F18();
  v58 = *(_QWORD *)(v2 - 8);
  v59 = v2;
  MEMORY[0x1E0C80A78](v2);
  v57 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DB979F30();
  v55 = *(_QWORD *)(v4 - 8);
  v56 = v4;
  MEMORY[0x1E0C80A78](v4);
  v54 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DB979F48();
  v52 = *(_QWORD *)(v6 - 8);
  v53 = v6;
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v52 - v11;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v52 - v13;
  v15 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView), sel_scene);

  if (!v15)
  {
    sub_1DB97A1DC();
    __break(1u);
    goto LABEL_13;
  }
  v16 = (void *)objc_opt_self();
  objc_msgSend(v16, sel_begin);
  objc_msgSend(v16, sel_setAnimationDuration_, 1.0);
  v17 = *(void **)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode);
  swift_getKeyPath();
  swift_getKeyPath();
  v18 = v17;
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  v19 = aBlock[0];
  v20 = 0.0;
  v21 = 0;
  if (aBlock[0])
  {
    if (aBlock[0] != 1)
      goto LABEL_13;
    v21 = -1085730854;
  }
  v22 = (void *)objc_opt_self();
  LODWORD(v23) = 0;
  LODWORD(v24) = 0;
  LODWORD(v25) = v21;
  v26 = objc_msgSend(v22, sel_valueWithSCNVector3_, v23, v25, v24);
  swift_release();
  objc_msgSend(v26, sel_SCNVector3Value);
  v28 = v27;
  v30 = v29;
  v32 = v31;

  LODWORD(v33) = v28;
  LODWORD(v34) = v30;
  LODWORD(v35) = v32;
  objc_msgSend(v18, sel_setEulerAngles_, v33, v34, v35);

  v36 = *(void **)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  v19 = aBlock[0];
  if (!aBlock[0])
  {
    v37 = 18.0;
    v38 = 0x80000000;
    goto LABEL_9;
  }
  if (aBlock[0] != 1)
  {
LABEL_13:
    aBlock[0] = v19;
    result = sub_1DB97A23C();
    __break(1u);
    return result;
  }
  v37 = 14.0;
  v20 = 0.5;
  v38 = -1069966950;
LABEL_9:
  swift_release();
  *(float *)&v39 = v20;
  LODWORD(v40) = v38;
  *(float *)&v41 = v37;
  objc_msgSend(v36, sel_setPosition_, v39, v40, v41);
  objc_msgSend(v16, sel_commit);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  result = swift_release();
  if (aBlock[0] == 1)
  {
    sub_1DB95C37C(0, &qword_1F03044D8);
    v43 = (void *)sub_1DB97A0EC();
    sub_1DB979F3C();
    MEMORY[0x1DF0B3D28](v9, 1.0);
    v44 = *(void (**)(char *, uint64_t))(v52 + 8);
    v45 = v9;
    v46 = v53;
    v44(v45, v53);
    MEMORY[0x1DF0B3D28](v12, 0.1);
    v44(v12, v46);
    v47 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1DB95C54C;
    aBlock[5] = v47;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DB9585E0;
    aBlock[3] = &block_descriptor_36;
    v48 = _Block_copy(aBlock);
    swift_release();
    v49 = v54;
    sub_1DB979F24();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1DB95C2A4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03044E8);
    sub_1DB95C2EC();
    v50 = v57;
    v51 = v59;
    sub_1DB97A110();
    MEMORY[0x1DF0B3EB4](v14, v49, v50, v48);
    _Block_release(v48);

    (*(void (**)(char *, uint64_t))(v58 + 8))(v50, v51);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v49, v56);
    return ((uint64_t (*)(char *, uint64_t))v44)(v14, v46);
  }
  return result;
}

id sub_1DB958100()
{
  id v0;
  uint64_t v1;
  id v2;

  v0 = objc_allocWithZone((Class)type metadata accessor for OnboardingBuddyDeviceSceneViewController());
  v1 = sub_1DB9798DC();
  v2 = sub_1DB95BDD0(v1);
  swift_release();
  return v2;
}

uint64_t sub_1DB958144()
{
  return sub_1DB957B3C();
}

uint64_t sub_1DB958170()
{
  return sub_1DB979D8C();
}

uint64_t sub_1DB9581A8()
{
  sub_1DB95C554();
  return sub_1DB979DC8();
}

uint64_t sub_1DB9581F8()
{
  sub_1DB95C554();
  return sub_1DB979D98();
}

void sub_1DB958248()
{
  sub_1DB95C554();
  sub_1DB979DBC();
  __break(1u);
}

void sub_1DB95826C()
{
  off_1F0304350 = &unk_1EA330698;
}

void sub_1DB958280()
{
  off_1F0304358 = &unk_1EA3306C0;
}

void sub_1DB958294(char *a1)
{
  sub_1DB957510(*a1);
}

void sub_1DB9582A0()
{
  char *v0;

  sub_1DB957A18(0, *v0);
}

void sub_1DB9582AC(uint64_t a1)
{
  char *v1;

  sub_1DB957914(a1, *v1);
}

void sub_1DB9582B4(uint64_t a1)
{
  char *v1;

  sub_1DB957A18(a1, *v1);
}

uint64_t sub_1DB9582BC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB95BF64();
  *a1 = result;
  return result;
}

uint64_t sub_1DB9582E8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1DB95831C + 4 * byte_1DB9A89B8[*v0]))();
}

void sub_1DB95831C(_QWORD *a1@<X8>)
{
  *a1 = 0x746F6F6853;
  a1[1] = 0xE500000000000000;
}

void sub_1DB958334(_QWORD *a1@<X8>)
{
  *a1 = 0x6B63696C43;
  a1[1] = 0xE500000000000000;
}

void sub_1DB95834C(char *a1@<X8>)
{
  strcpy(a1, "Click Finished");
  a1[15] = -18;
}

void sub_1DB958374(_QWORD *a1@<X8>)
{
  *a1 = 0x7373696D736944;
  a1[1] = 0xE700000000000000;
}

void sub_1DB958390(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x73656C6863756F54;
  a1[1] = v1 + 14;
}

void sub_1DB9583AC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x776F446863756F54;
  a1[1] = v1 + 9;
}

void sub_1DB9583C8(_QWORD *a1@<X8>)
{
  *a1 = 0x70556863756F54;
  a1[1] = 0xE700000000000000;
}

void sub_1DB9583E4()
{
  off_1F0304360 = &unk_1EA3305F8;
}

id sub_1DB9583F8()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_planeWithWidth_height_, 2.75, 2.75);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59C0]), sel_init);
  objc_msgSend(v1, sel_setLightingModelName_, *MEMORY[0x1E0CD5AF8]);
  objc_msgSend(v1, sel_setLitPerPixel_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304500);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1DB9A4FC0;
  *(_QWORD *)(v2 + 32) = v1;
  sub_1DB97A008();
  sub_1DB95C37C(0, &qword_1F03044F8);
  v3 = v0;
  v4 = v1;
  v5 = (void *)sub_1DB979FF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setMaterials_, v5);

  v6 = objc_msgSend((id)objc_opt_self(), sel_nodeWithGeometry_, v3);
  return v6;
}

void sub_1DB958568(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1DF0B5C48](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(id *)(v2 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView);

    objc_msgSend(v4, sel_setAlpha_, 1.0);
  }
}

void sub_1DB958608()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  objc_super v26;

  v26.receiver = v0;
  v26.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v26, sel_viewDidLoad);
  sub_1DB958970();
  v1 = *(void **)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView];
  v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_12;
  }
  v3 = v2;
  objc_msgSend(v2, sel_bounds);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(v0, sel_view);
  if (!v12)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v13 = v12;
  objc_msgSend(v12, sel_safeAreaInsets);
  v15 = v14;

  objc_msgSend(v1, sel_setFrame_, UIEdgeInsetsInsetRect(v5, v7, v9, v11, v15, 0.0));
  v16 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v16);

  objc_msgSend(v1, sel_setAutoenablesDefaultLighting_, 1);
  objc_msgSend(v1, sel_setAllowsCameraControl_, 1);
  objc_msgSend(v1, sel_setJitteringEnabled_, 1);
  objc_msgSend(v1, sel_setPreferredFramesPerSecond_, 60);
  objc_msgSend(v1, sel_setAntialiasingMode_, 1);
  objc_msgSend(v1, sel_setDelegate_, v0);
  objc_msgSend(v1, sel_setAlpha_, 0.0);
  v17 = objc_msgSend(v0, sel_view);
  if (!v17)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v18 = v17;
  objc_msgSend(v17, sel_insertSubview_atIndex_, v1, 0);

  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD5A10]), sel_init);
  objc_msgSend(v1, sel_setScene_, v19);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  swift_release();
  if (v25 == 2)
  {
    sub_1DB958D38();
  }
  else
  {
    if (qword_1F0303D50 != -1)
      swift_once();
    v20 = sub_1DB979AF8();
    __swift_project_value_buffer(v20, (uint64_t)qword_1F0304368);
    v21 = sub_1DB97A0BC();
    v22 = sub_1DB979AE0();
    v23 = v21;
    if (os_log_type_enabled(v22, v21))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1DB760000, v22, v23, "The OnboardingBuddySetupViewModel are not loaded into memory", v24, 2u);
      MEMORY[0x1DF0B5BD0](v24, -1, -1);
    }

  }
}

void sub_1DB958970()
{
  char *v0;
  unint64_t v1;
  void *v2;
  char **v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  double v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  unint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v1 = (unint64_t)v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_graduatedNeutralDensityLayer];
  v3 = &selRef_totalFreeBytes;
  v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v5 = v4;
  objc_msgSend(v4, sel_bounds);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v2, sel_setFrame_, v7, v9, v11, v13);
  if (qword_1F0303D48 != -1)
    goto LABEL_18;
  while (1)
  {
    v14 = off_1F0304360;
    v15 = *((_QWORD *)off_1F0304360 + 2);
    if (!v15)
      break;
    v37 = v1;
    v40 = MEMORY[0x1E0DEE9D8];
    sub_1DB9798D0();
    sub_1DB95DC40(0, v15, 0);
    v16 = v40;
    v17 = (void *)objc_opt_self();
    v18 = v15 + 3;
    v3 = &selRef_beginMomentCaptureWithSettings_delegate_;
    while (v18 != 3)
    {
      if ((unint64_t)(v18 - 4) >= v14[2])
        goto LABEL_17;
      v19 = *(double *)&v14[v18];
      v20 = objc_msgSend(v17, sel_blackColor);
      v21 = objc_msgSend(v20, sel_colorWithAlphaComponent_, v19);

      v22 = objc_msgSend(v21, sel_CGColor);
      type metadata accessor for CGColor(0);
      v39 = v23;
      v40 = v16;
      *(_QWORD *)&v38 = v22;
      v1 = *(_QWORD *)(v16 + 16);
      v24 = *(_QWORD *)(v16 + 24);
      if (v1 >= v24 >> 1)
      {
        sub_1DB95DC40(v24 > 1, v1 + 1, 1);
        v16 = v40;
      }
      *(_QWORD *)(v16 + 16) = v1 + 1;
      sub_1DB95C36C(&v38, (_OWORD *)(v16 + 32 * v1 + 32));
      if (--v18 == 3)
      {
        swift_bridgeObjectRelease();
        v1 = v37;
        v3 = &selRef_totalFreeBytes;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    swift_once();
  }
LABEL_11:
  v25 = (void *)sub_1DB979FF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setColors_, v25);

  objc_msgSend(v2, sel_setStartPoint_, 0.5, 0.0);
  objc_msgSend(v2, sel_setEndPoint_, 0.5, 1.0);
  v26 = objc_msgSend((id)v1, v3[214]);
  if (!v26)
    goto LABEL_20;
  v27 = v26;
  v28 = objc_msgSend(v26, sel_layer);

  objc_msgSend(v28, sel_addSublayer_, v2);
  v29 = *(void **)(v1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_progressiveBlurFilter);
  if (!v29)
    return;
  v30 = v29;
  v31 = objc_msgSend((id)v1, v3[214]);
  if (!v31)
  {
LABEL_21:
    __break(1u);
    return;
  }
  v32 = v31;
  v33 = objc_msgSend(v31, sel_layer);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304510);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1DB9A4FD0;
  *(_QWORD *)(v34 + 56) = sub_1DB95C37C(0, &qword_1F0304518);
  *(_QWORD *)(v34 + 32) = v30;
  v35 = v30;
  v36 = (void *)sub_1DB979FF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_setFilters_, v36);

}

void sub_1DB958D38()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  id v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  unint64_t v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  unsigned __int8 *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t i;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  char v80;
  id v81;
  id v82;
  double v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  unsigned __int8 *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t j;
  uint64_t v93;
  unint64_t v94;
  char v95;
  char v96;
  int v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  char v109;
  id v110;
  id v111;
  double v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  float v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  float v133;
  unsigned int v134;
  char **v135;
  double v136;
  double v137;
  double v138;
  id v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  void *v146;
  id v147;
  void *v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  id v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;

  v1 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel;
  v2 = *(void **)(*(_QWORD *)(v0 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel)
                + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset);
  if (!v2)
    return;
  v3 = v0;
  v4 = objc_msgSend(v2, sel_objectAtIndex_, 0);
  if (!v4)
    return;
  v5 = *(_QWORD *)(v0 + v1);
  v6 = *(void **)(v5 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
  if (!v6
    || (v7 = *(void **)(v5 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage)) == 0)
  {

    return;
  }
  v150 = v4;
  v8 = (void *)objc_opt_self();
  v152 = v6;
  v153 = v7;
  v9 = objc_msgSend(v8, sel_nodeWithMDLObject_, v150);
  v10 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
  v11 = *(void **)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode) = v9;

  v12 = *(void **)(v3 + v10);
  swift_getKeyPath();
  swift_getKeyPath();
  v13 = v12;
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  v14 = 0;
  if (v156)
  {
    if (v156 != 1)
      goto LABEL_80;
    v14 = -1085730854;
  }
  v151 = v10;
  v15 = (void *)objc_opt_self();
  LODWORD(v16) = 0;
  LODWORD(v17) = 0;
  LODWORD(v18) = v14;
  v19 = objc_msgSend(v15, sel_valueWithSCNVector3_, v16, v18, v17);
  swift_release();
  objc_msgSend(v19, sel_SCNVector3Value);
  v21 = v20;
  v23 = v22;
  v25 = v24;

  LODWORD(v26) = v21;
  LODWORD(v27) = v23;
  LODWORD(v28) = v25;
  objc_msgSend(v13, sel_setEulerAngles_, v26, v27, v28);

  v29 = *(void **)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView);
  v30 = objc_msgSend(v29, sel_scene);
  if (v30)
  {
    v31 = v30;
    v32 = objc_msgSend(v30, sel_rootNode);

    objc_msgSend(v32, sel_addChildNode_, *(_QWORD *)(v3 + v10));
  }
  v33 = *(void **)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonRippleEffectOverlayNode);
  v34 = objc_msgSend(v33, sel_geometry);
  if (!v34)
    goto LABEL_20;
  v38 = v34;
  v39 = objc_msgSend(v34, sel_materials);

  sub_1DB95C37C(0, &qword_1F03044F8);
  v40 = sub_1DB979FFC();

  if (v40 >> 62)
  {
    sub_1DB9798D0();
    v45 = sub_1DB97A1E8();
    swift_bridgeObjectRelease();
    if (v45)
      goto LABEL_13;
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  if (!*(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_19;
LABEL_13:
  if ((v40 & 0xC000000000000001) != 0)
  {
    v41 = (id)MEMORY[0x1DF0B3F44](0, v40);
  }
  else
  {
    if (!*(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_79;
    }
    v41 = *(id *)(v40 + 32);
  }
  v42 = v41;
  swift_bridgeObjectRelease();
  v43 = objc_msgSend(v42, sel_diffuse);

  v44 = objc_msgSend(v153, sel_rootLayer);
  objc_msgSend(v43, sel_setContents_, v44);

LABEL_20:
  LODWORD(v35) = 1082235290;
  LODWORD(v36) = -1069631406;
  LODWORD(v37) = 0.25;
  objc_msgSend(v33, sel_setPosition_, v35, v36, v37);
  objc_msgSend(v33, sel_eulerAngles);
  objc_msgSend(v33, sel_setEulerAngles_);
  objc_msgSend(*(id *)(v3 + v10), sel_addChildNode_, v33);
  v46 = (void *)sub_1DB979FA8();
  v47 = objc_msgSend((id)objc_opt_self(), sel_filterWithName_, v46);

  if (!v47)
  {
LABEL_79:
    __break(1u);
    JUMPOUT(0x1DB95A0DCLL);
  }
  v148 = v29;
  v48 = (void *)sub_1DB97A08C();
  objc_msgSend(v47, sel_setValue_forKey_, v48, *MEMORY[0x1E0C9E258]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304500);
  v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_1DB9A4FC0;
  *(_QWORD *)(v49 + 32) = v47;
  v157 = v49;
  sub_1DB97A008();
  sub_1DB95C37C(0, &qword_1F0304508);
  v147 = v47;
  v50 = (void *)sub_1DB979FF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_setFilters_, v50);

  v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59B8]), sel_init);
  v144 = *MEMORY[0x1E0CD5AD8];
  objc_msgSend(v51, sel_setType_);
  v145 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithRed_green_blue_alpha_, 0.0, 1.0, 1.0, 1.0);
  objc_msgSend(v51, sel_setColor_);
  objc_msgSend(v51, sel_setIntensity_, 0.0);
  objc_msgSend(v51, sel_setAttenuationStartDistance_, 0.0);
  objc_msgSend(v51, sel_setAttenuationEndDistance_, 10.0);
  objc_msgSend(v51, sel_setAttenuationFalloffExponent_, 50.0);
  v52 = *(void **)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowLightAccentNode);
  v146 = v51;
  objc_msgSend(v52, sel_setLight_, v51);
  LODWORD(v53) = 1081501286;
  LODWORD(v54) = -1069631406;
  LODWORD(v55) = 0;
  objc_msgSend(v52, sel_setPosition_, v53, v54, v55);
  objc_msgSend(*(id *)(v3 + v10), sel_addChildNode_, v52);
  v56 = objc_msgSend(v153, sel_rootLayer);
  v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2868]), sel_initWithLayer_, v56);

  v58 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController;
  v59 = *(void **)(v3
                 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController) = v57;

  if (qword_1F0303D40 != -1)
    swift_once();
  v60 = (unsigned __int8 *)off_1F0304358;
  v61 = *((_QWORD *)off_1F0304358 + 2);
  v149 = v3;
  if (v61)
  {
    v142 = v58;
    v62 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
    sub_1DB9798D0();
    for (i = 0; i != v61; ++i)
    {
      v64 = v60[i + 32];
      if (objc_msgSend(v153, sel_rootLayer))
        __asm { BR              X8 }
      swift_beginAccess();
      sub_1DB9798D0();
      v65 = sub_1DB969894(v64);
      v67 = v66;
      swift_bridgeObjectRelease();
      if ((v67 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v69 = *v62;
        v154 = *v62;
        *v62 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1DB96AD24();
          v69 = v154;
        }
        v70 = *(void **)(*(_QWORD *)(v69 + 56) + 8 * v65);
        sub_1DB95BB08(v65, v69);
        *v62 = v69;

        swift_bridgeObjectRelease();
      }
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
    v3 = v149;
    v58 = v142;
  }
  v71 = *(void **)(v3 + v58);
  if (v71)
  {
    v72 = v71;
    v73 = objc_msgSend(v153, sel_rootLayer);
    objc_msgSend(v72, sel_setInitialStatesOfLayer_, v73);

    v74 = *(void **)(v3 + v58);
    if (v74)
    {
      v75 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
      swift_beginAccess();
      v76 = *v75;
      v77 = *(_QWORD *)(*v75 + 16);
      v78 = v74;
      if (v77 && (v79 = sub_1DB969894(5), (v80 & 1) != 0))
        v81 = *(id *)(*(_QWORD *)(v76 + 56) + 8 * v79);
      else
        v81 = 0;
      swift_endAccess();
      v82 = objc_msgSend(v153, sel_rootLayer);
      LODWORD(v83) = 1.0;
      objc_msgSend(v78, sel_setState_ofLayer_transitionSpeed_, v81, v82, v83);

    }
  }
  v84 = objc_msgSend(v152, sel_rootLayer);
  v85 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2868]), sel_initWithLayer_, v84);

  v86 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController;
  v87 = *(void **)(v3
                 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController) = v85;

  v88 = *(void **)(v3 + v86);
  if (v88)
    objc_msgSend(v88, sel_setDelegate_, v3);
  if (qword_1F0303D38 != -1)
    swift_once();
  v89 = (unsigned __int8 *)off_1F0304350;
  v90 = *((_QWORD *)off_1F0304350 + 2);
  if (v90)
  {
    v143 = v86;
    v91 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
    sub_1DB9798D0();
    for (j = 0; j != v90; ++j)
    {
      v93 = v89[j + 32];
      if (objc_msgSend(v152, sel_rootLayer))
        __asm { BR              X8 }
      swift_beginAccess();
      sub_1DB9798D0();
      v94 = sub_1DB969894(v93);
      v96 = v95;
      swift_bridgeObjectRelease();
      if ((v96 & 1) != 0)
      {
        v97 = swift_isUniquelyReferenced_nonNull_native();
        v98 = *v91;
        v155 = *v91;
        *v91 = 0x8000000000000000;
        if (!v97)
        {
          sub_1DB96AD24();
          v98 = v155;
        }
        v99 = *(void **)(*(_QWORD *)(v98 + 56) + 8 * v94);
        sub_1DB95BB08(v94, v98);
        *v91 = v98;

        swift_bridgeObjectRelease();
      }
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
    v3 = v149;
    v86 = v143;
  }
  v100 = *(void **)(v3 + v86);
  if (v100)
  {
    v101 = v100;
    v102 = objc_msgSend(v152, sel_rootLayer);
    objc_msgSend(v101, sel_setInitialStatesOfLayer_, v102);

    v103 = *(void **)(v3 + v86);
    if (v103)
    {
      v104 = (uint64_t *)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
      swift_beginAccess();
      v105 = *v104;
      v106 = *(_QWORD *)(*v104 + 16);
      v107 = v103;
      if (v106 && (v108 = sub_1DB969894(4), (v109 & 1) != 0))
        v110 = *(id *)(*(_QWORD *)(v105 + 56) + 8 * v108);
      else
        v110 = 0;
      swift_endAccess();
      v111 = objc_msgSend(v152, sel_rootLayer);
      LODWORD(v112) = 1.0;
      objc_msgSend(v107, sel_setState_ofLayer_transitionSpeed_, v110, v111, v112);

    }
  }
  v113 = *(id *)(v3 + v151);
  v114 = (void *)sub_1DB979FA8();
  v115 = objc_msgSend(v113, sel_childNodeWithName_recursively_, v114, 1);

  if (v115)
  {
    v116 = objc_msgSend(v115, sel_geometry);

    if (v116)
    {
      v117 = objc_msgSend(v116, sel_firstMaterial);

      if (v117)
      {
        v118 = objc_msgSend(v117, sel_emission);

        v119 = objc_msgSend(v152, sel_rootLayer);
        objc_msgSend(v118, sel_setContents_, v119);

      }
    }
  }
  v120 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59D0]), sel_init);
  v121 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59B8]), sel_init);
  objc_msgSend(v120, sel_setLight_, v121);

  v122 = objc_msgSend(v120, sel_light);
  if (v122)
  {
    v126 = v122;
    objc_msgSend(v122, sel_setType_, v144);

  }
  v127 = 0.0;
  LODWORD(v123) = 0;
  LODWORD(v124) = 10.0;
  LODWORD(v125) = 10.0;
  objc_msgSend(v120, sel_setPosition_, v123, v124, v125);
  v128 = objc_msgSend(v148, sel_scene);
  if (v128)
  {
    v129 = v128;
    v130 = objc_msgSend(v128, sel_rootNode);

    objc_msgSend(v130, sel_addChildNode_, v120);
  }
  v131 = *(void **)(v3 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode);
  v132 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD5960]), sel_init);
  objc_msgSend(v131, sel_setCamera_, v132);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  if (v157)
  {
    v135 = &selRef__padBackgroundView;
    if (v157 == 1)
    {
      v133 = 14.0;
      v127 = 0.5;
      v134 = -1069966950;
      goto LABEL_73;
    }
LABEL_80:
    sub_1DB97A23C();
    __break(1u);
    JUMPOUT(0x1DB95A110);
  }
  v133 = 18.0;
  v134 = 0x80000000;
  v135 = &selRef__padBackgroundView;
LABEL_73:
  swift_release();
  *(float *)&v136 = v127;
  LODWORD(v137) = v134;
  *(float *)&v138 = v133;
  objc_msgSend(v131, sel_setPosition_, v136, v137, v138);
  v139 = objc_msgSend(v148, sel_scene);
  if (v139)
  {
    v140 = v139;
    v141 = objc_msgSend(v139, v135[503]);

    objc_msgSend(v141, sel_addChildNode_, v131);
  }

}

void sub_1DB95A184(char a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_viewWillDisappear_, a1 & 1);
  v3 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopTimer;
  v4 = *(void **)&v1[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopTimer];
  if (v4)
  {
    objc_msgSend(v4, sel_invalidate);
    v5 = *(void **)&v1[v3];
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)&v1[v3] = 0;

}

uint64_t sub_1DB95A238()
{
  CGColorSpace *DeviceRGB;
  CGContextRef v1;
  CGContextRef v2;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  CGContextRef v8;
  CGFloat *v9;
  uint64_t v10;
  CGFloat *inited;
  CGFloat *v12;
  CGColorSpace *v13;
  CGFloat *v14;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  CGFloat *v19;
  __int128 v21;
  BOOL v22;
  uint64_t v23;
  CGGradient *v24;
  CGImageRef Image;
  CGImageRef v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  CGImage *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t result;
  CGContext *v40;
  CGColorSpace *v41;
  uint64_t v42;
  CGPoint v43;
  CGPoint v44;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v1 = CGBitmapContextCreate(0, 1uLL, 0x20uLL, 8uLL, 0, DeviceRGB, 1u);
  if (!v1)
  {

    return 0;
  }
  v2 = v1;
  if (qword_1F0303D48 != -1)
    goto LABEL_40;
  while (1)
  {
    v3 = off_1F0304360;
    v4 = *((_QWORD *)off_1F0304360 + 2);
    v42 = MEMORY[0x1E0DEE9D8];
    sub_1DB95DC24(0, v4, 0);
    if (v4)
    {
      v5 = 0;
      while (v4 != v5)
      {
        v7 = *(_QWORD *)(v42 + 16);
        v6 = *(_QWORD *)(v42 + 24);
        if (v7 >= v6 >> 1)
          sub_1DB95DC24(v6 > 1, v7 + 1, 1);
        *(_QWORD *)(v42 + 16) = v7 + 1;
        *(double *)(v42 + 8 * v7 + 32) = (double)v5++ / (double)(uint64_t)(v4 - 1);
        if (v4 == v5)
          goto LABEL_9;
      }
      __break(1u);
      goto LABEL_37;
    }
LABEL_9:
    v8 = (CGContextRef)v3[2];
    if (!v8)
      break;
    v40 = v2;
    v41 = DeviceRGB;
    sub_1DB9798D0();
    v2 = 0;
    v9 = (CGFloat *)MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v10 = v3[(_QWORD)v2 + 4];
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304520);
      inited = (CGFloat *)swift_initStackObject();
      inited[4] = 0.0;
      v12 = inited + 4;
      inited[5] = 0.0;
      inited[6] = 0.0;
      *((_QWORD *)inited + 7) = v10;
      DeviceRGB = (CGColorSpace *)*((_QWORD *)v9 + 2);
      v13 = (CGColorSpace *)((char *)DeviceRGB + 4);
      if (__OFADD__(DeviceRGB, 4))
        break;
      v14 = inited;
      isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v16 = *((_QWORD *)v9 + 3) >> 1, v16 < (uint64_t)v13))
      {
        if ((uint64_t)DeviceRGB <= (uint64_t)v13)
          v17 = (int64_t)DeviceRGB + 4;
        else
          v17 = (int64_t)DeviceRGB;
        v9 = (CGFloat *)sub_1DB95DA0C(isUniquelyReferenced_nonNull_native, v17, 1, v9);
        v16 = *((_QWORD *)v9 + 3) >> 1;
      }
      v18 = *((_QWORD *)v9 + 2);
      if (v16 - v18 < 4)
        goto LABEL_38;
      v19 = &v9[v18 + 4];
      if (v12 < &v9[v18 + 8] && v19 < v14 + 8)
      {
        result = sub_1DB97A218();
        __break(1u);
        return result;
      }
      v21 = *((_OWORD *)v12 + 1);
      *(_OWORD *)v19 = *(_OWORD *)v12;
      *(_OWORD *)&v9[v18 + 6] = v21;
      v22 = __OFADD__(v18, 4);
      v23 = v18 + 4;
      if (v22)
        goto LABEL_39;
      v2 = (CGContextRef)((char *)v2 + 1);
      *((_QWORD *)v9 + 2) = v23;
      swift_setDeallocating();
      if (v8 == v2)
      {
        swift_bridgeObjectRelease();
        v2 = v40;
        DeviceRGB = v41;
        goto LABEL_29;
      }
    }
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once();
  }
  v9 = (CGFloat *)MEMORY[0x1E0DEE9D8];
LABEL_29:
  v24 = CGGradientCreateWithColorComponents(DeviceRGB, v9 + 4, (const CGFloat *)(v42 + 32), v4);
  swift_bridgeObjectRelease();
  swift_release();
  if (!v24)
  {

    return 0;
  }
  v44.y = 32.0;
  v43.x = 0.0;
  v43.y = 0.0;
  v44.x = 0.0;
  CGContextDrawLinearGradient(v2, v24, v43, v44, 0);
  Image = CGBitmapContextCreateImage(v2);
  if (!Image)
  {

    return 0;
  }
  v26 = Image;
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, 2.0);
  sub_1DB979FB4();
  v28 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
  v29 = (void *)sub_1DB979FA8();
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v28, sel_initWithType_, v29);

  v31 = v26;
  v32 = (void *)sub_1DB979FA8();
  objc_msgSend(v30, sel_setValue_forKey_, v31, v32);

  objc_msgSend(v30, sel_setValue_forKey_, v27, *MEMORY[0x1E0CD2D90]);
  v33 = (void *)sub_1DB97A014();
  v34 = (void *)sub_1DB979FA8();
  objc_msgSend(v30, sel_setValue_forKey_, v33, v34);

  v35 = (void *)sub_1DB979FA8();
  v36 = (void *)sub_1DB979FA8();
  objc_msgSend(v30, sel_setValue_forKey_, v35, v36);

  v37 = (void *)sub_1DB979FA8();
  v38 = (void *)sub_1DB979FA8();
  objc_msgSend(v30, sel_setValue_forKey_, v37, v38);

  return (uint64_t)v30;
}

void sub_1DB95A77C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1DF0B5C48](v1);
  if (v2)
  {
    v3 = (char *)v2;
    v4 = objc_msgSend((id)objc_opt_self(), sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v2, sel_scheduleDemoLoopAnimationSequence, 0, 1, 8.0);
    v5 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopTimer;
    v6 = *(void **)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopTimer];
    *(_QWORD *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopTimer] = v4;

    v7 = *(void **)&v3[v5];
    if (v7)
      objc_msgSend(v7, sel_fire);

  }
}

void sub_1DB95A828(char a1, char a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  char v33;
  id v34;
  void *v35;
  id v36;
  double v37;
  _QWORD *v38;
  void *v39;
  char *v40;
  id v41;
  id v42;
  id v43;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
  v7 = *(id *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode];
  v8 = (void *)sub_1DB979FA8();
  v43 = objc_msgSend(v7, sel_childNodeWithName_recursively_, v8, 1);

  if (!v43)
    return;
  v9 = *(id *)&v3[v6];
  v10 = (void *)sub_1DB979FA8();
  v11 = objc_msgSend(v9, sel_childNodeWithName_recursively_, v10, 1);

  if (!v11)
  {

    return;
  }
  v12 = (void *)objc_opt_self();
  objc_msgSend(v12, sel_begin);
  objc_msgSend(v12, sel_setAnimationDuration_, 0.2);
  v13 = objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowLightAccentNode], sel_light);
  if (v13)
  {
    v17 = v13;
    objc_msgSend(v13, sel_setIntensity_, 10.0);

  }
  if ((a1 & 1) != 0)
    v18 = -0.025;
  else
    v18 = -0.01;
  LODWORD(v15) = 0;
  LODWORD(v16) = 0;
  *(float *)&v14 = v18;
  objc_msgSend(v43, sel_setPosition_, v14, v15, v16);
  LODWORD(v19) = 0;
  LODWORD(v20) = 0;
  *(float *)&v21 = v18;
  objc_msgSend(v11, sel_setPosition_, v21, v19, v20);
  v22 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController;
  if ((a2 & 1) == 0)
  {
    v23 = *(void **)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController];
    if (v23)
    {
      v24 = *(void **)(*(_QWORD *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                     + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
      if (!v24)
        goto LABEL_25;
      v25 = v23;
      v26 = objc_msgSend(v24, sel_rootLayer);
      objc_msgSend(v25, sel_setInitialStatesOfLayer_, v26);

      v22 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController;
    }
  }
  v27 = *(void **)&v3[v22];
  if (v27)
  {
    v28 = &v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates];
    swift_beginAccess();
    v29 = *(_QWORD *)v28;
    v30 = *(_QWORD *)(v29 + 16);
    v31 = v27;
    if (v30 && (v32 = sub_1DB969894(6), (v33 & 1) != 0))
      v34 = *(id *)(*(_QWORD *)(v29 + 56) + 8 * v32);
    else
      v34 = 0;
    swift_endAccess();
    v35 = *(void **)(*(_QWORD *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                   + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
    if (v35)
    {
      v36 = objc_msgSend(v35, sel_rootLayer);
      LODWORD(v37) = 1.0;
      objc_msgSend(v31, sel_setState_ofLayer_transitionSpeed_, v34, v36, v37);

      goto LABEL_20;
    }
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }
LABEL_20:
  if ((a2 & 1) != 0)
  {
    v38 = (_QWORD *)swift_allocObject();
    v38[2] = v3;
    v38[3] = v43;
    v38[4] = v11;
    aBlock[4] = sub_1DB95C258;
    aBlock[5] = v38;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DB9585E0;
    aBlock[3] = &block_descriptor_13;
    v39 = _Block_copy(aBlock);
    v40 = v3;
    v41 = v43;
    v42 = v11;
    swift_release();
    objc_msgSend(v12, sel_setCompletionBlock_, v39);
    _Block_release(v39);
  }
  objc_msgSend(v12, sel_commit);

}

uint64_t sub_1DB95AC30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v25;
  void *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v25 = a1;
  v26 = a3;
  v4 = sub_1DB979F18();
  v30 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DB979F30();
  v28 = *(_QWORD *)(v7 - 8);
  v29 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DB979F48();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v25 - v15;
  sub_1DB95C37C(0, &qword_1F03044D8);
  v17 = (void *)sub_1DB97A0EC();
  sub_1DB979F3C();
  MEMORY[0x1DF0B3D28](v14, 0.1);
  v27 = *(void (**)(char *, uint64_t))(v11 + 8);
  v27(v14, v10);
  v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v18;
  v19[3] = a2;
  v20 = v26;
  v19[4] = v26;
  aBlock[4] = sub_1DB95C298;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DB9585E0;
  aBlock[3] = &block_descriptor_20;
  v21 = _Block_copy(aBlock);
  v22 = a2;
  v23 = v20;
  swift_release();
  sub_1DB979F24();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1DB95C2A4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03044E8);
  sub_1DB95C2EC();
  sub_1DB97A110();
  MEMORY[0x1DF0B3EB4](v16, v9, v6, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v29);
  return ((uint64_t (*)(char *, uint64_t))v27)(v16, v10);
}

void sub_1DB95AED8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x1DF0B5C48](v5);
  if (v6)
  {
    v7 = (char *)v6;
    v8 = *(void **)(v6
                  + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController);
    if (v8)
    {
      v9 = (uint64_t *)(v6 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
      swift_beginAccess();
      v10 = *v9;
      v11 = *(_QWORD *)(v10 + 16);
      v12 = v8;
      if (v11 && (v13 = sub_1DB969894(7), (v14 & 1) != 0))
        v15 = *(id *)(*(_QWORD *)(v10 + 56) + 8 * v13);
      else
        v15 = 0;
      swift_endAccess();
      v16 = *(void **)(*(_QWORD *)&v7[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                     + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
      if (!v16)
      {
        __break(1u);
        return;
      }
      v17 = objc_msgSend(v16, sel_rootLayer);
      LODWORD(v18) = 1.0;
      objc_msgSend(v12, sel_setState_ofLayer_transitionSpeed_, v15, v17, v18);

    }
    v19 = (void *)objc_opt_self();
    objc_msgSend(v19, sel_begin);
    objc_msgSend(v19, sel_setAnimationDuration_, 0.3);
    v20 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowLightAccentNode], sel_light);
    if (v20)
    {
      v24 = v20;
      objc_msgSend(v20, sel_setIntensity_, 0.0);

    }
    LODWORD(v21) = 0;
    LODWORD(v22) = 0;
    LODWORD(v23) = 0;
    objc_msgSend(a2, sel_setPosition_, v21, v22, v23);
    LODWORD(v25) = 0;
    LODWORD(v26) = 0;
    LODWORD(v27) = 0;
    objc_msgSend(a3, sel_setPosition_, v25, v26, v27);
    objc_msgSend(v19, sel_commit);

  }
}

uint64_t sub_1DB95B0C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v1 = sub_1DB979F18();
  v26 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DB979F30();
  v24 = *(_QWORD *)(v4 - 8);
  v25 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DB979F48();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v23 - v13;
  v15 = *(void **)(v0
                 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController);
  if (!v15)
    goto LABEL_4;
  v16 = *(void **)(*(_QWORD *)(v0 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel)
                 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
  if (v16)
  {
    v17 = v15;
    v18 = objc_msgSend(v16, sel_rootLayer);
    objc_msgSend(v17, sel_setInitialStatesOfLayer_, v18);

LABEL_4:
    sub_1DB95C37C(0, &qword_1F03044D8);
    v19 = (void *)sub_1DB97A0EC();
    sub_1DB979F3C();
    MEMORY[0x1DF0B3D28](v11, 0.1);
    v20 = *(void (**)(char *, uint64_t))(v8 + 8);
    v20(v11, v7);
    v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1DB95C338;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DB9585E0;
    aBlock[3] = &block_descriptor_24;
    v22 = _Block_copy(aBlock);
    swift_release();
    sub_1DB979F24();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1DB95C2A4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03044E8);
    sub_1DB95C2EC();
    sub_1DB97A110();
    MEMORY[0x1DF0B3EB4](v14, v6, v3, v22);
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v3, v1);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v25);
    return ((uint64_t (*)(char *, uint64_t))v20)(v14, v7);
  }
  __break(1u);
  return result;
}

void sub_1DB95B3AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  double v14;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1DF0B5C48](v1);
  if (v2)
  {
    v3 = (char *)v2;
    v4 = *(void **)(v2
                  + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController);
    if (v4)
    {
      v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates);
      swift_beginAccess();
      v6 = *v5;
      v7 = *(_QWORD *)(v6 + 16);
      v8 = v4;
      if (v7 && (v9 = sub_1DB969894(0), (v10 & 1) != 0))
        v11 = *(id *)(*(_QWORD *)(v6 + 56) + 8 * v9);
      else
        v11 = 0;
      swift_endAccess();
      v12 = *(void **)(*(_QWORD *)&v3[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel]
                     + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
      if (!v12)
      {
        __break(1u);
        return;
      }
      v13 = objc_msgSend(v12, sel_rootLayer);
      LODWORD(v14) = 1.0;
      objc_msgSend(v8, sel_setState_ofLayer_transitionSpeed_, v11, v13, v14);

      v3 = v8;
    }

  }
}

uint64_t type metadata accessor for OnboardingBuddyDeviceSceneViewController()
{
  return objc_opt_self();
}

void sub_1DB95B698(uint64_t a1)
{
  char v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  v1 = *(_BYTE *)(a1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred);
  *(_BYTE *)(a1 + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred) = 1;
  if ((v1 & 1) == 0)
  {
    v2 = (void *)objc_opt_self();
    v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v5[4] = sub_1DB95C014;
    v5[5] = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 1107296256;
    v5[2] = sub_1DB9585E0;
    v5[3] = &block_descriptor_7;
    v4 = _Block_copy(v5);
    swift_release();
    objc_msgSend(v2, sel_animateWithDuration_delay_options_animations_completion_, 0, v4, 0, 0.75, 0.25);
    _Block_release(v4);
  }
}

uint64_t sub_1DB95B788(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_1DB9798DC();
  v1(v2);
  return swift_release();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1DB95B9BC + 4 * byte_1DB9A89C5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1DB95B9F0 + 4 * byte_1DB9A89C0[v4]))();
}

uint64_t sub_1DB95B9F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB95B9F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB95BA00);
  return result;
}

uint64_t sub_1DB95BA0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB95BA14);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1DB95BA18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB95BA20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB95BA2C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DB95BA34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription()
{
  return &type metadata for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription;
}

unint64_t sub_1DB95BA50()
{
  unint64_t result;

  result = qword_1F03044D0;
  if (!qword_1F03044D0)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8AA4, &type metadata for OnboardingBuddyDeviceSceneViewController.AnimationStateDescription);
    atomic_store(result, (unint64_t *)&qword_1F03044D0);
  }
  return result;
}

NSObject *sub_1DB95BA94()
{
  uint64_t v0;
  NSObject *result;

  v0 = sub_1DB979AF8();
  __swift_allocate_value_buffer(v0, qword_1F0304368);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F0304368);
  result = os_log_create("com.apple.camera", "Camera");
  if (result)
    return sub_1DB979B04();
  __break(1u);
  return result;
}

unint64_t sub_1DB95BB08(unint64_t result, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v3 = result;
  v4 = a2 + 64;
  v5 = (result + 1) & ~(-1 << *(_BYTE *)(a2 + 32));
  if (((1 << v5) & *(_QWORD *)(a2 + 64 + 8 * (v5 >> 6))) != 0)
  {
    result = sub_1DB97A11C();
    if ((*(_QWORD *)(v4 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 48) + v5);
      sub_1DB97A290();
      __asm { BR              X8 }
    }
    v7 = (uint64_t *)(v4 + 8 * (v3 >> 6));
    v8 = *v7;
    v9 = (-1 << v3) - 1;
  }
  else
  {
    v7 = (uint64_t *)(v4 + 8 * (result >> 6));
    v9 = *v7;
    v8 = (-1 << result) - 1;
  }
  *v7 = v9 & v8;
  v10 = *(_QWORD *)(a2 + 16);
  v11 = __OFSUB__(v10, 1);
  v12 = v10 - 1;
  if (v11)
  {
    __break(1u);
    JUMPOUT(0x1DB95BDB0);
  }
  *(_QWORD *)(a2 + 16) = v12;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

id sub_1DB95BDD0(uint64_t a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView;
  v6 = objc_allocWithZone(MEMORY[0x1E0CD5A40]);
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode;
  *(_QWORD *)&v7[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59D0]), sel_init);
  v9 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
  *(_QWORD *)&v7[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59D0]), sel_init);
  v10 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonRippleEffectOverlayNode;
  *(_QWORD *)&v7[v10] = sub_1DB9583F8();
  v11 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowLightAccentNode;
  *(_QWORD *)&v7[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59D0]), sel_init);
  v12 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates;
  *(_QWORD *)&v7[v12] = sub_1DB9570A8(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)&v7[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopTimer] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController] = 0;
  v13 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_graduatedNeutralDensityLayer;
  *(_QWORD *)&v7[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2790]), sel_init);
  v7[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred] = 0;
  v14 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_progressiveBlurFilter;
  *(_QWORD *)&v7[v14] = sub_1DB95A238();
  *(_QWORD *)&v7[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_viewModel] = a1;
  sub_1DB9798DC();

  v16.receiver = v7;
  v16.super_class = ObjectType;
  return objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t sub_1DB95BF64()
{
  unint64_t v0;

  v0 = sub_1DB97A224();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

uint64_t sub_1DB95BFAC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1DB95BFD0()
{
  uint64_t v0;

  sub_1DB95B698(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return sub_1DB9798DC();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1DB95BFF0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1DB95C014()
{
  uint64_t v0;

  sub_1DB958568(v0);
}

void sub_1DB95C01C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD5A40]), sel_init);
  v2 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59D0]), sel_init);
  v3 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59D0]), sel_init);
  v4 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonRippleEffectOverlayNode;
  *(_QWORD *)&v0[v4] = sub_1DB9583F8();
  v5 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowLightAccentNode;
  *(_QWORD *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD59D0]), sel_init);
  v6 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_animationStates;
  *(_QWORD *)&v0[v6] = sub_1DB9570A8(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController] = 0;
  v7 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_graduatedNeutralDensityLayer;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2790]), sel_init);
  v0[OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_hasInitialRenderOccurred] = 0;
  v8 = OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_progressiveBlurFilter;
  *(_QWORD *)&v0[v8] = sub_1DB95A238();

  sub_1DB97A1DC();
  __break(1u);
}

void sub_1DB95C184(void *a1)
{
  id v1;
  void *v2;
  int v3;
  char v4;
  char v5;

  if (!a1)
  {
    __break(1u);
    goto LABEL_11;
  }
  v1 = objc_msgSend(a1, sel_toState);
  if (!v1)
  {
LABEL_11:
    __break(1u);
    return;
  }
  v2 = v1;
  sub_1DB979FB4();

  v3 = sub_1DB95BF64();
  if (v3 == 2 || v3 == 1)
  {
    v4 = 1;
    v5 = 1;
    goto LABEL_8;
  }
  if (!v3)
  {
    v4 = 0;
    v5 = 0;
LABEL_8:
    sub_1DB95A828(v4, v5);
  }
}

uint64_t sub_1DB95C224()
{
  id *v0;

  return swift_deallocObject();
}

uint64_t sub_1DB95C258()
{
  uint64_t v0;

  return sub_1DB95AC30(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1DB95C264()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1DB95C298()
{
  uint64_t v0;

  sub_1DB95AED8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

unint64_t sub_1DB95C2A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03044E0;
  if (!qword_1F03044E0)
  {
    v1 = sub_1DB979F18();
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1F03044E0);
  }
  return result;
}

unint64_t sub_1DB95C2EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03044F0;
  if (!qword_1F03044F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03044E8);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1F03044F0);
  }
  return result;
}

void sub_1DB95C338()
{
  uint64_t v0;

  sub_1DB95B3AC(v0);
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

_OWORD *sub_1DB95C36C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1DB95C37C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for OnboardingBuddyDeviceSceneView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_1DB9798DC();
  return a1;
}

uint64_t destroy for OnboardingBuddyDeviceSceneView()
{
  return swift_release();
}

_QWORD *assignWithCopy for OnboardingBuddyDeviceSceneView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_1DB9798DC();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for OnboardingBuddyDeviceSceneView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnboardingBuddyDeviceSceneView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OnboardingBuddyDeviceSceneView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OnboardingBuddyDeviceSceneView()
{
  return &type metadata for OnboardingBuddyDeviceSceneView;
}

uint64_t sub_1DB95C4F8()
{
  return MEMORY[0x1E0CE0788];
}

unint64_t sub_1DB95C508()
{
  unint64_t result;

  result = qword_1F0304550;
  if (!qword_1F0304550)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8BA0, &type metadata for OnboardingBuddyDeviceSceneView);
    atomic_store(result, (unint64_t *)&qword_1F0304550);
  }
  return result;
}

void sub_1DB95C54C()
{
  uint64_t v0;

  sub_1DB95A77C(v0);
}

unint64_t sub_1DB95C554()
{
  unint64_t result;

  result = qword_1F0304558;
  if (!qword_1F0304558)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8BF0, &type metadata for OnboardingBuddyDeviceSceneView);
    atomic_store(result, (unint64_t *)&qword_1F0304558);
  }
  return result;
}

uint64_t sub_1DB95C5C4()
{
  uint64_t v0;

  v0 = sub_1DB979AF8();
  __swift_allocate_value_buffer(v0, qword_1F03067A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F03067A8);
  return sub_1DB979AEC();
}

void sub_1DB95C634()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v1 = (void *)sub_1DB979FA8();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_1F03067C0 = (uint64_t)v2;
}

char *sub_1DB95C6A0()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  objc_super v14;

  v1 = OBJC_IVAR___CAMSystemOverlayStateMachine_visibility;
  v2 = objc_allocWithZone((Class)CAMSystemOverlayVisibility);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);
  swift_unknownObjectWeakInit();
  v3[OBJC_IVAR___CAMSystemOverlayStateMachine_wantsOverlayHint] = 0;
  v3[OBJC_IVAR___CAMSystemOverlayStateMachine_halfPressEnabled] = 1;
  *(_QWORD *)&v3[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack] = MEMORY[0x1E0DEE9D8];
  v3[OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___CAMSystemOverlayStateMachine_lastOverlayVisibleTime] = 0;

  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for OverlayStateMachine();
  v4 = (char *)objc_msgSendSuper2(&v14, sel_init);
  v5 = OBJC_IVAR___CAMSystemOverlayStateMachine_visibility;
  v6 = *(void **)&v4[OBJC_IVAR___CAMSystemOverlayStateMachine_visibility];
  v7 = v4;
  objc_msgSend(v6, sel_setDelegate_, v7);
  if (qword_1F0303D60 != -1)
    swift_once();
  v8 = (void *)qword_1F03067C0;
  if (!qword_1F03067C0
    || (v9 = (void *)sub_1DB979FA8(), objc_msgSend(v8, sel_doubleForKey_, v9), v11 = v10, v9, v11 <= 0.0))
  {
    v11 = 2000.0;
  }
  v12 = *(id *)&v4[v5];
  objc_msgSend(v12, sel_setDelayedHideDuration_, v11 / 1000.0);

  return v7;
}

void *sub_1DB95CAE0(void *a1, uint64_t a2)
{
  uint64_t v2;
  void *result;

  if (objc_msgSend(a1, sel_isVisible))
    *(CFAbsoluteTime *)(v2 + OBJC_IVAR___CAMSystemOverlayStateMachine_lastOverlayVisibleTime) = CFAbsoluteTimeGetCurrent();
  result = (void *)MEMORY[0x1DF0B5C48](v2 + OBJC_IVAR___CAMSystemOverlayStateMachine_delegate);
  if (result)
  {
    objc_msgSend(result, sel_systemOverlayVisibility_changedForReason_, v2, a2);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1DB95CBE0(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t result;
  void *v7;
  char *v8;

  result = MEMORY[0x1DF0B5C48](&a1[OBJC_IVAR___CAMSystemOverlayStateMachine_delegate]);
  if (result)
  {
    v7 = (void *)result;
    swift_unknownObjectRetain();
    v8 = a1;
    objc_msgSend(v7, *a4, v8);
    swift_unknownObjectRelease();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1DB95CC94()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)(v0 + OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible) & 1) != 0)
    return 1;
  v2 = v0 + OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack;
  swift_beginAccess();
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v3 && *(_QWORD *)(*(_QWORD *)v2 + 8 * v3 + 24))
    return (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_isVisible);
  else
    return 0;
}

void sub_1DB95CD80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0 + OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack;
  swift_beginAccess();
  while (1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    if (!v2)
      break;
    v3 = *(_QWORD *)(*(_QWORD *)v1 + 8 * v2 + 24);
    if (!v3)
      break;
    sub_1DB95CE18(v3, 2);
  }
}

void sub_1DB95CE18(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  int v29;
  uint8_t *v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint8_t *v51;
  os_log_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58[3];

  v4 = v2;
  v7 = sub_1DB979AF8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (uint64_t)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return;
  if ((unint64_t)(a2 - 2) >= 2)
  {
LABEL_9:
    if (a2 == 1)
    {
      v13 = &v4[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack];
      swift_beginAccess();
      v14 = *(_QWORD *)v13;
      v15 = *(_QWORD *)(*(_QWORD *)v13 + 16);
      if (v15)
      {
        if (*(_QWORD *)(v14 + 32) == a1)
          return;
        if (v15 != 1)
        {
          v16 = 5;
          while (1)
          {
            v17 = v16 - 3;
            if (__OFADD__(v16 - 4, 1))
              break;
            if (*(_QWORD *)(v14 + 8 * v16) == a1)
              return;
            ++v16;
            if (v17 == v15)
              goto LABEL_56;
          }
LABEL_66:
          __break(1u);
          goto LABEL_67;
        }
      }
    }
    else
    {
      if (a2)
        goto LABEL_69;
      if ((unint64_t)(a1 - 2) < 3)
      {
        v18 = (uint64_t *)&v4[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack];
        swift_beginAccess();
        if ((sub_1DB95D434(1, *v18) & 1) == 0)
        {
          swift_beginAccess();
          sub_1DB95E438(0, 0, 1);
          swift_endAccess();
        }
        goto LABEL_56;
      }
      if (a1 != 1)
      {
LABEL_69:
        sub_1DB97A1DC();
        __break(1u);
        return;
      }
    }
LABEL_56:
    sub_1DB95D4E0(a1);
    return;
  }
  v3 = &v4[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack];
  swift_beginAccess();
  v11 = *(_QWORD **)v3;
  v12 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  if (!v12)
  {
    a2 = 0;
    goto LABEL_42;
  }
  if (v11[4] == a1)
  {
    v55 = v10;
    v56 = v8;
    a2 = 0;
    v10 = 1;
  }
  else
  {
    if (v12 == 1)
    {
      a2 = 1;
      goto LABEL_42;
    }
    v24 = 5;
    while (1)
    {
      a2 = v24 - 4;
      if (v11[v24] == a1)
        break;
      v25 = v24 - 3;
      if (__OFADD__(a2, 1))
        goto LABEL_64;
      ++v24;
      if (v25 == v12)
      {
        a2 = *(_QWORD *)(*(_QWORD *)v3 + 16);
        goto LABEL_42;
      }
    }
    v55 = v10;
    v56 = v8;
    v10 = v24 - 3;
    if (__OFADD__(a2, 1))
    {
      __break(1u);
      goto LABEL_61;
    }
  }
  if (v10 != v12)
  {
    v19 = a2 + 5;
    while ((v10 & 0x8000000000000000) == 0)
    {
      if (v19 - 4 >= v12)
        goto LABEL_62;
      v21 = v11[v19];
      if (v21 != a1)
      {
        if (v19 - 4 != a2)
        {
          if (a2 >= v12)
            goto LABEL_65;
          v8 = v11[a2 + 4];
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)v3 = v11;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v11 = sub_1DB95E598(v11);
            *(_QWORD *)v3 = v11;
          }
          v11[a2 + 4] = v21;
          *(_QWORD *)(*(_QWORD *)v3 + 8 * v19) = v8;
          v11 = *(_QWORD **)v3;
        }
        if (__OFADD__(a2++, 1))
          goto LABEL_63;
        v12 = v11[2];
      }
      v20 = v19 - 3;
      ++v19;
      if (v20 == v12)
        goto LABEL_7;
    }
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
LABEL_7:
  v10 = v55;
  v8 = v56;
  if ((uint64_t)v12 < a2)
  {
    __break(1u);
    goto LABEL_9;
  }
LABEL_42:
  sub_1DB95E694(a2, v12);
  swift_endAccess();
  if (qword_1F0303D58 != -1)
LABEL_67:
    swift_once();
  v26 = __swift_project_value_buffer(v7, (uint64_t)qword_1F03067A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10, v26, v7);
  v27 = v4;
  v28 = sub_1DB979AE0();
  v29 = sub_1DB97A0D4();
  if (os_log_type_enabled(v28, (os_log_type_t)v29))
  {
    v50 = v29;
    v52 = v28;
    v53 = v7;
    v54 = v27;
    v30 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v58[0] = v49;
    v51 = v30;
    *(_DWORD *)v30 = 136446210;
    v31 = *(_QWORD *)v3;
    v32 = *(_QWORD *)(*(_QWORD *)v3 + 16);
    v33 = MEMORY[0x1E0DEE9D8];
    if (v32)
    {
      v55 = v10;
      v56 = v8;
      v57 = MEMORY[0x1E0DEE9D8];
      sub_1DB9798D0();
      sub_1DB95DC5C(0, v32, 0);
      v34 = 0;
      v33 = v57;
      while (1)
      {
        v35 = CAMDebugStringForCaptureButtonStage(*(_QWORD *)(v31 + 8 * v34 + 32));
        if (!v35)
          break;
        v36 = v35;
        v37 = sub_1DB979FB4();
        v39 = v38;

        v57 = v33;
        v41 = *(_QWORD *)(v33 + 16);
        v40 = *(_QWORD *)(v33 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_1DB95DC5C(v40 > 1, v41 + 1, 1);
          v33 = v57;
        }
        ++v34;
        *(_QWORD *)(v33 + 16) = v41 + 1;
        v42 = v33 + 16 * v41;
        *(_QWORD *)(v42 + 32) = v37;
        *(_QWORD *)(v42 + 40) = v39;
        if (v32 == v34)
        {
          swift_bridgeObjectRelease();
          v10 = v55;
          v8 = v56;
          goto LABEL_52;
        }
      }

      __break(1u);
      goto LABEL_69;
    }
LABEL_52:
    v43 = v51;
    v57 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304680);
    sub_1DB95DCC0();
    v44 = sub_1DB979F78();
    v46 = v45;
    swift_bridgeObjectRelease();
    v57 = sub_1DB964BA0(v44, v46, v58);
    sub_1DB97A0F8();
    v27 = v54;

    swift_bridgeObjectRelease();
    v47 = v52;
    _os_log_impl(&dword_1DB760000, v52, (os_log_type_t)v50, "ButtonStages: [%{public}s]", v43, 0xCu);
    v48 = v49;
    swift_arrayDestroy();
    MEMORY[0x1DF0B5BD0](v48, -1, -1);
    MEMORY[0x1DF0B5BD0](v43, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v53);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  }
  if (a1 == 2)
    v27[OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible] = 0;
}

uint64_t sub_1DB95D434(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

void sub_1DB95D4E0(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  int v15;
  uint8_t *v16;
  _QWORD *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  int v40;
  uint8_t *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45[3];

  v3 = sub_1DB979AF8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &v1[OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack];
  swift_beginAccess();
  v8 = *(_QWORD **)v7;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1DB95DB18(0, v8[2] + 1, 1, v8);
    *(_QWORD *)v7 = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = sub_1DB95DB18((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
    *(_QWORD *)v7 = v8;
  }
  v8[2] = v11 + 1;
  v8[v11 + 4] = a1;
  swift_endAccess();
  if (qword_1F0303D58 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v3, (uint64_t)qword_1F03067A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v12, v3);
  v13 = v1;
  v14 = sub_1DB979AE0();
  v15 = sub_1DB97A0D4();
  if (!os_log_type_enabled(v14, (os_log_type_t)v15))
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    goto LABEL_17;
  }
  v40 = v15;
  v42 = v6;
  v43 = v4;
  v16 = (uint8_t *)swift_slowAlloc();
  v39 = swift_slowAlloc();
  v45[0] = v39;
  v41 = v16;
  *(_DWORD *)v16 = 136446210;
  v17 = *(_QWORD **)v7;
  v18 = *(_QWORD *)(*(_QWORD *)v7 + 16);
  v19 = MEMORY[0x1E0DEE9D8];
  if (!v18)
  {
LABEL_16:
    v29 = v41;
    v44 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304680);
    sub_1DB95DCC0();
    v30 = sub_1DB979F78();
    v32 = v31;
    swift_bridgeObjectRelease();
    v44 = sub_1DB964BA0(v30, v32, v45);
    sub_1DB97A0F8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DB760000, v14, (os_log_type_t)v40, "ButtonStages: [%{public}s]", v29, 0xCu);
    v33 = v39;
    swift_arrayDestroy();
    MEMORY[0x1DF0B5BD0](v33, -1, -1);
    MEMORY[0x1DF0B5BD0](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v3);
LABEL_17:
    if (a1 == 4)
    {
      v34 = *(void **)&v13[OBJC_IVAR___CAMSystemOverlayStateMachine_visibility];
      if (objc_msgSend(v34, sel_isVisible))
      {
        if (CFAbsoluteTimeGetCurrent()
           - *(double *)&v13[OBJC_IVAR___CAMSystemOverlayStateMachine_lastOverlayVisibleTime] < 0.3)
        {
          v13[OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible] = 0;
          objc_msgSend(v34, sel_hideImmediately);
          v35 = (void *)MEMORY[0x1DF0B5C48](&v13[OBJC_IVAR___CAMSystemOverlayStateMachine_delegate]);
          if (v35)
          {
            objc_msgSend(v35, sel_systemOverlayVisibility_changedForReason_, v13, 0);
            swift_unknownObjectRelease();
          }
        }
      }
    }
    else if (a1 == 2 && v13[OBJC_IVAR___CAMSystemOverlayStateMachine_halfPressEnabled] == 1)
    {
      v13[OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible] = 1;
    }
    return;
  }
  v37 = a1;
  v38 = v13;
  v36 = v3;
  v44 = MEMORY[0x1E0DEE9D8];
  sub_1DB9798D0();
  sub_1DB95DC5C(0, v18, 0);
  v20 = 0;
  v19 = v44;
  while (1)
  {
    v21 = CAMDebugStringForCaptureButtonStage(v17[v20 + 4]);
    if (!v21)
      break;
    v22 = v21;
    v23 = sub_1DB979FB4();
    v25 = v24;

    v44 = v19;
    v27 = *(_QWORD *)(v19 + 16);
    v26 = *(_QWORD *)(v19 + 24);
    if (v27 >= v26 >> 1)
    {
      sub_1DB95DC5C(v26 > 1, v27 + 1, 1);
      v19 = v44;
    }
    ++v20;
    *(_QWORD *)(v19 + 16) = v27 + 1;
    v28 = v19 + 16 * v27;
    *(_QWORD *)(v28 + 32) = v23;
    *(_QWORD *)(v28 + 40) = v25;
    if (v18 == v20)
    {
      swift_bridgeObjectRelease();
      v3 = v36;
      a1 = v37;
      v13 = v38;
      goto LABEL_16;
    }
  }

  __break(1u);
}

id sub_1DB95D974()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OverlayStateMachine();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OverlayStateMachine()
{
  return objc_opt_self();
}

_QWORD *sub_1DB95DA0C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304520);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1DB95E5AC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1DB95DB18(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304698);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1DB95E5AC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DB95DC24(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DB95DD70(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DB95DC40(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DB95DECC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DB95DC5C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DB95E038(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

id CAMDebugStringForCaptureButtonStage(unint64_t a1)
{
  void *v1;
  __CFString *v2;

  if (a1 > 4)
  {
    v1 = 0;
  }
  else
  {
    v1 = *(&off_1EA331618 + a1);
    v2 = *(&off_1EA3315F0 + a1);
  }
  return v1;
}

unint64_t sub_1DB95DCC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F0304688;
  if (!qword_1F0304688)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304680);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1F0304688);
  }
  return result;
}

uint64_t sub_1DB95DD0C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DB95E1A4(a1, a2, a3, *v3, (uint64_t *)&unk_1ED1C7980);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DB95DD30(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DB95E1A4(a1, a2, a3, *v3, &qword_1ED1C7978);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DB95DD54(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DB95E2EC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DB95DD70(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304520);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DB97A218();
  __break(1u);
  return result;
}

uint64_t sub_1DB95DECC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304510);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DB97A218();
  __break(1u);
  return result;
}

uint64_t sub_1DB95E038(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304690);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DB97A218();
  __break(1u);
  return result;
}

uint64_t sub_1DB95E1A4(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v9])
      memmove(v13, v14, v9);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v9] || v13 >= &v14[v9])
  {
    memcpy(v13, v14, v9);
LABEL_28:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_30:
  result = sub_1DB97A218();
  __break(1u);
  return result;
}

uint64_t sub_1DB95E2EC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7970);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1DB97A218();
  __break(1u);
  return result;
}

_QWORD *sub_1DB95E438(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  int64_t v6;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  _QWORD *result;
  int64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v5 = *(_QWORD **)v3;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v10 > v5[3] >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    result = sub_1DB95DB18(result, v13, 1, v5);
    v5 = result;
  }
  v14 = &v5[a1 + 4];
  if (!v9)
    goto LABEL_20;
  v15 = v5[2];
  v16 = __OFSUB__(v15, a2);
  v17 = v15 - a2;
  if (v16)
    goto LABEL_26;
  if ((v17 & 0x8000000000000000) == 0)
  {
    result = v14 + 1;
    v18 = &v5[a2 + 4];
    if (v14 + 1 != v18 || result >= &v18[v17])
      result = memmove(result, v18, 8 * v17);
    v19 = v5[2];
    v16 = __OFADD__(v19, v9);
    v20 = v19 + v9;
    if (!v16)
    {
      v5[2] = v20;
LABEL_20:
      *v14 = a3;
      *(_QWORD *)v3 = v5;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = (_QWORD *)sub_1DB97A218();
  __break(1u);
  return result;
}

_QWORD *sub_1DB95E598(_QWORD *a1)
{
  return sub_1DB95DB18(0, a1[2], 0, a1);
}

char *sub_1DB95E5AC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_1DB97A218();
  __break(1u);
  return result;
}

char *sub_1DB95E694(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = (char *)sub_1DB95DB18(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[8 * a1 + 32];
    v15 = &v4[8 * a2 + 32];
    if (a1 != a2 || result >= &v15[8 * v14])
      result = (char *)memmove(result, v15, 8 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_1DB97A218();
  __break(1u);
  return result;
}

uint64_t LaunchAppIntent.perform()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  sub_1DB97A044();
  *(_QWORD *)(v1 + 24) = sub_1DB97A038();
  sub_1DB97A020();
  return swift_task_switch();
}

uint64_t sub_1DB95E858()
{
  uint64_t v0;
  void *v1;
  void *v2;

  swift_release();
  sub_1DB95ECB0();
  v2 = v1;
  if (objc_msgSend(v1, sel_isInCameraRollView))
    objc_msgSend(v2, sel_navigateToViewfinderView);
  sub_1DB979804();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

NSObject *sub_1DB95E8DC()
{
  uint64_t v0;
  NSObject *result;

  v0 = sub_1DB979AF8();
  __swift_allocate_value_buffer(v0, qword_1F03067C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F03067C8);
  result = os_log_create("com.apple.camera", "Camera");
  if (result)
    return sub_1DB979B04();
  __break(1u);
  return result;
}

void sub_1DB95E950()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = objc_msgSend(v0, sel_connectedScenes);

  sub_1DB967C30();
  sub_1DB967C6C();
  v2 = sub_1DB97A098();

  if ((v2 & 0xC000000000000001) != 0)
  {
    sub_1DB97A128();
    sub_1DB97A0A4();
    v2 = v25;
    v23 = v26;
    v3 = v27;
    v4 = v28;
    v5 = v29;
  }
  else
  {
    v4 = 0;
    v6 = -1 << *(_BYTE *)(v2 + 32);
    v23 = v2 + 56;
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(v2 + 56);
  }
  v9 = (unint64_t)(v3 + 64) >> 6;
  if (v2 < 0)
    goto LABEL_10;
LABEL_8:
  if (v5)
  {
    v10 = (v5 - 1) & v5;
    v11 = __clz(__rbit64(v5)) | (v4 << 6);
    v12 = v4;
    goto LABEL_27;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v9)
    goto LABEL_35;
  v15 = *(_QWORD *)(v23 + 8 * v14);
  v12 = v4 + 1;
  if (!v15)
  {
    v12 = v4 + 2;
    if (v4 + 2 >= v9)
      goto LABEL_35;
    v15 = *(_QWORD *)(v23 + 8 * v12);
    if (!v15)
    {
      v12 = v4 + 3;
      if (v4 + 3 >= v9)
        goto LABEL_35;
      v15 = *(_QWORD *)(v23 + 8 * v12);
      if (!v15)
      {
        v12 = v4 + 4;
        if (v4 + 4 < v9)
        {
          v15 = *(_QWORD *)(v23 + 8 * v12);
          if (!v15)
          {
            v16 = v4 + 5;
            while (v9 != v16)
            {
              v15 = *(_QWORD *)(v23 + 8 * v16++);
              if (v15)
              {
                v12 = v16 - 1;
                goto LABEL_26;
              }
            }
            goto LABEL_35;
          }
          goto LABEL_26;
        }
LABEL_35:
        sub_1DB967CB4();
        return;
      }
    }
  }
LABEL_26:
  v10 = (v15 - 1) & v15;
  v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_27:
  v13 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v11);
  if (!v13)
    goto LABEL_35;
  while (1)
  {
    objc_opt_self();
    v17 = swift_dynamicCastObjCClass();
    if (v17)
      break;

    v4 = v12;
    v5 = v10;
    if ((v2 & 0x8000000000000000) == 0)
      goto LABEL_8;
LABEL_10:
    if (sub_1DB97A134())
    {
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v13 = v24;
      swift_unknownObjectRelease();
      v12 = v4;
      v10 = v5;
      if (v24)
        continue;
    }
    goto LABEL_35;
  }
  v18 = (void *)v17;
  v19 = v13;
  v20 = objc_msgSend(v18, sel_keyWindow);
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(v20, sel_rootViewController);

    sub_1DB967CB4();
    if (v22)
    {
      objc_opt_self();
      if (!swift_dynamicCastObjCClass())

    }
  }
  else
  {
    sub_1DB967CB4();

  }
}

void sub_1DB95ECB0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _BYTE *v5;

  sub_1DB95E950();
  if (!v0)
  {
    if (qword_1F0303D68 != -1)
      swift_once();
    v1 = sub_1DB979AF8();
    __swift_project_value_buffer(v1, (uint64_t)qword_1F03067C8);
    v2 = sub_1DB979AE0();
    v3 = sub_1DB97A0BC();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB760000, v2, v3, "Failed to get CAMViewfinderViewController", v4, 2u);
      MEMORY[0x1DF0B5BD0](v4, -1, -1);
    }

    sub_1DB965770();
    swift_allocError();
    *v5 = 0;
    swift_willThrow();
  }
}

id CaptureMode.isAvailable.getter(char a1)
{
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  result = objc_msgSend((id)objc_opt_self(), sel_capabilities);
  if (result)
  {
    v3 = result;
    v4 = sub_1DB95EE2C(a1);
    v6 = objc_msgSend(v3, sel_isSupportedMode_withDevice_, v5, v4);

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DB95EE2C(char a1)
{
  return qword_1DB9A9EE0[a1];
}

id CaptureMode.supportsTimer.getter(char a1)
{
  id result;
  void *v3;
  uint64_t v4;
  id v5;

  result = objc_msgSend((id)objc_opt_self(), sel_capabilities);
  if (result)
  {
    v3 = result;
    sub_1DB95EE2C(a1);
    v5 = objc_msgSend(v3, sel_isTimerSupportedForMode_, v4);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DB95EEBC(char a1, char a2)
{
  uint64_t v2;
  int v4;
  id v5;
  uint64_t result;
  void *v8;
  uint64_t v9;

  v2 = a1 & 1;
  if (a2 == 3 || a2 == 0)
  {
    if ((a1 & 1) == 0)
    {
      v4 = sub_1DB97A230();
      swift_bridgeObjectRelease();
      return v4 & 1;
    }
    swift_bridgeObjectRelease();
    return 1;
  }
  result = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_capabilities);
  if (result)
  {
    v8 = (void *)result;
    sub_1DB95EE2C(a2);
    v5 = objc_msgSend(v8, sel_isSupportedMode_withDevice_, v9, v2);

    return (uint64_t)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DB95EF98(uint64_t a1)
{
  return sub_1DB961E94(a1, static CaptureMode.typeDisplayRepresentation, 0xD00000000000001ELL, 0x80000001DB9C0880);
}

uint64_t CaptureMode.typeDisplayRepresentation.unsafeMutableAddressor()
{
  return sub_1DB960774(qword_1F0303D70, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static CaptureMode.typeDisplayRepresentation);
}

uint64_t static CaptureMode.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(qword_1F0303D70, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static CaptureMode.typeDisplayRepresentation, a1);
}

unint64_t sub_1DB95F004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  void (*v30)(char *, _QWORD, uint64_t, uint64_t);
  _BYTE *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  char *v42;
  uint64_t v43;
  void (*v44)(char *, _QWORD, uint64_t, uint64_t);
  _BYTE *v45;
  _BYTE *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t, uint64_t);
  char *v52;
  _BYTE *v53;
  char *v54;
  void (*v55)(char *, uint64_t, uint64_t);
  char *v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, _QWORD, uint64_t, uint64_t);
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t);
  char *v69;
  _BYTE *v70;
  _BYTE *v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t, uint64_t, uint64_t);
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, uint64_t, uint64_t);
  char *v80;
  _BYTE *v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  void (*v85)(char *, _QWORD, uint64_t, uint64_t);
  _BYTE *v86;
  unint64_t result;
  char *v88;
  _BYTE *v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  void (*v103)(char *, _QWORD, uint64_t, uint64_t);
  char *v104;
  void (*v105)(char *, uint64_t, uint64_t);
  void (*v106)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v107;
  uint64_t v108;
  _BYTE *v109;
  _BYTE *v110;
  uint64_t v111;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7948);
  MEMORY[0x1E0C80A78](v0);
  v101 = (char *)&v88 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v2);
  v104 = (char *)&v88 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = sub_1DB9799F0();
  v7 = *(_QWORD *)(v111 - 8);
  MEMORY[0x1E0C80A78](v111);
  v9 = (char *)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_1DB9799FC();
  v96 = *(_QWORD *)(v108 - 8);
  MEMORY[0x1E0C80A78](v108);
  v98 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7BD8);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7960);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v110 = *(_BYTE **)(v15 + 72);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1DB9A8CB0;
  v95 = v17;
  v18 = (_BYTE *)(v17 + v16);
  v107 = v14;
  *v18 = 4;
  v93 = 0xD00000000000001ELL;
  sub_1DB979F90();
  if (qword_1ED1C78D0 != -1)
    swift_once();
  v109 = v18;
  v19 = v111;
  v20 = __swift_project_value_buffer(v111, (uint64_t)qword_1ED1C9C70);
  v105 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v21 = v9;
  v99 = v20;
  v105(v9, v20, v19);
  sub_1DB979A38();
  sub_1DB979A08();
  v106 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v96 + 56);
  v22 = v104;
  v106(v104, 1, 1, v108);
  v23 = v101;
  sub_1DB97987C();
  v24 = sub_1DB979888();
  v103 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v100 = v24;
  v103(v23, 0, 1, v24);
  sub_1DB9798A0();
  v25 = v109;
  v92 = (uint64_t)&v110[(_QWORD)v109 + *(int *)(v107 + 48)];
  v110[(_QWORD)v109] = 0;
  v94 = 0xD00000000000001FLL;
  v97 = v12;
  sub_1DB979F90();
  v26 = v20;
  v27 = v111;
  v28 = v105;
  v105(v21, v26, v111);
  sub_1DB979A38();
  sub_1DB979A08();
  v106(v22, 1, 1, v108);
  sub_1DB97987C();
  v29 = v24;
  v30 = v103;
  v103(v23, 0, 1, v29);
  sub_1DB9798A0();
  v92 = 2 * (_QWORD)v110;
  v31 = &v25[2 * (_QWORD)v110];
  v32 = v21;
  v33 = v107;
  v91 = (uint64_t)&v31[*(int *)(v107 + 48)];
  *v31 = 1;
  sub_1DB979F90();
  v34 = v99;
  v28(v32, v99, v27);
  sub_1DB979A38();
  sub_1DB979A08();
  v35 = v104;
  v36 = v108;
  v106(v104, 1, 1, v108);
  sub_1DB97987C();
  v37 = v100;
  v30(v23, 0, 1, v100);
  sub_1DB9798A0();
  v38 = &v110[v92 + (_QWORD)v109];
  v93 = (uint64_t)&v38[*(int *)(v33 + 48)];
  *v38 = 2;
  sub_1DB979F90();
  v39 = v34;
  v40 = v111;
  v41 = v105;
  v105(v32, v39, v111);
  v102 = v6;
  sub_1DB979A38();
  sub_1DB979A08();
  v106(v35, 1, 1, v36);
  v42 = v101;
  sub_1DB97987C();
  v43 = v37;
  v44 = v103;
  v103(v42, 0, 1, v43);
  sub_1DB9798A0();
  v45 = v110;
  v93 = 4 * (_QWORD)v110;
  v46 = &v109[4 * (_QWORD)v110];
  v47 = v33;
  v92 = (uint64_t)&v46[*(int *)(v33 + 48)];
  *v46 = 3;
  sub_1DB979F90();
  v88 = v32;
  v48 = v32;
  v49 = v99;
  v41(v48, v99, v40);
  sub_1DB979A38();
  sub_1DB979A08();
  v50 = v108;
  v51 = v106;
  v106(v104, 1, 1, v108);
  v52 = v101;
  sub_1DB97987C();
  v44(v52, 0, 1, v100);
  sub_1DB9798A0();
  v53 = &v45[v93 + (_QWORD)v109];
  v93 = (uint64_t)&v53[*(int *)(v47 + 48)];
  *v53 = 5;
  sub_1DB979F90();
  v54 = v88;
  v55 = v105;
  v105(v88, v49, v111);
  sub_1DB979A38();
  sub_1DB979A08();
  v56 = v104;
  v51(v104, 1, 1, v50);
  v57 = v101;
  sub_1DB97987C();
  v58 = v100;
  v59 = v103;
  v103(v57, 0, 1, v100);
  sub_1DB9798A0();
  v60 = &v109[6 * (_QWORD)v110];
  v89 = &v60[*(int *)(v107 + 48)];
  *v60 = 6;
  sub_1DB979F90();
  v55(v54, v49, v111);
  sub_1DB979A38();
  sub_1DB979A08();
  v106(v56, 1, 1, v108);
  sub_1DB97987C();
  v59(v57, 0, 1, v58);
  v61 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1C7BE0);
  v62 = *(unsigned __int8 *)(v96 + 80);
  v93 = ((v62 + 32) & ~v62) + *(_QWORD *)(v96 + 72);
  v94 = v61;
  v91 = (v62 + 32) & ~v62;
  v92 = v62 | 7;
  v63 = swift_allocObject();
  v90 = xmmword_1DB9A4FD0;
  *(_OWORD *)(v63 + 16) = xmmword_1DB9A4FD0;
  sub_1DB979F90();
  v64 = v54;
  v65 = v54;
  v66 = v99;
  v67 = v111;
  v68 = v105;
  v105(v65, v99, v111);
  sub_1DB979A38();
  sub_1DB979A08();
  v69 = v104;
  sub_1DB979894();
  v70 = v109;
  v96 = 8 * (_QWORD)v110;
  v71 = &v109[7 * (_QWORD)v110];
  v89 = &v71[*(int *)(v107 + 48)];
  *v71 = 7;
  sub_1DB979F90();
  v72 = v67;
  v68(v64, v66, v67);
  sub_1DB979A38();
  sub_1DB979A08();
  v73 = v108;
  v74 = v106;
  v106(v69, 1, 1, v108);
  v75 = v101;
  sub_1DB97987C();
  v76 = v100;
  v103(v75, 0, 1, v100);
  sub_1DB9798A0();
  v89 = &v70[v96 + *(int *)(v107 + 48)];
  v70[v96] = 8;
  sub_1DB979F90();
  v77 = v99;
  v105(v64, v99, v72);
  sub_1DB979A38();
  sub_1DB979A08();
  v74(v69, 1, 1, v73);
  sub_1DB97987C();
  v103(v75, 0, 1, v76);
  *(_OWORD *)(swift_allocObject() + 16) = v90;
  sub_1DB979F90();
  v78 = v111;
  v79 = v105;
  v105(v64, v77, v111);
  sub_1DB979A38();
  sub_1DB979A08();
  v80 = v104;
  sub_1DB979894();
  v81 = &v110[v96 + (_QWORD)v109];
  v93 = (uint64_t)&v81[*(int *)(v107 + 48)];
  *v81 = 9;
  v96 = 0xD000000000000026;
  sub_1DB979F90();
  v79(v64, v77, v78);
  sub_1DB979A38();
  v94 = 0x80000001DB9C1E10;
  sub_1DB979A08();
  v82 = v108;
  v83 = v106;
  v106(v80, 1, 1, v108);
  sub_1DB97987C();
  v84 = v100;
  v85 = v103;
  v103(v75, 0, 1, v100);
  sub_1DB9798A0();
  v86 = &v109[10 * (_QWORD)v110];
  v110 = &v86[*(int *)(v107 + 48)];
  *v86 = 10;
  sub_1DB979F90();
  v105(v64, v99, v111);
  sub_1DB979A38();
  sub_1DB979A08();
  v83(v80, 1, 1, v82);
  sub_1DB97987C();
  v85(v75, 0, 1, v84);
  sub_1DB9798A0();
  result = sub_1DB9571A8(v95);
  static CaptureMode.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CaptureMode.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_1ED1C78B8 != -1)
    swift_once();
  return &static CaptureMode.caseDisplayRepresentations;
}

uint64_t static CaptureMode.caseDisplayRepresentations.getter()
{
  return sub_1DB960ED0(&qword_1ED1C78B8);
}

uint64_t static CaptureMode.caseDisplayRepresentations.setter(uint64_t a1)
{
  return sub_1DB960F44(a1, &qword_1ED1C78B8, &static CaptureMode.caseDisplayRepresentations);
}

uint64_t (*static CaptureMode.caseDisplayRepresentations.modify())()
{
  if (qword_1ED1C78B8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1DB9600F8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1DB960128 + 4 * byte_1DB9A8CF0[a1]))(0x6569666C6573, 0xE600000000000000);
}

uint64_t sub_1DB960128()
{
  return 0x6F65646976;
}

uint64_t sub_1DB96013C()
{
  return 0x7469617274726F70;
}

uint64_t sub_1DB960168()
{
  return 0x6F746F6870;
}

uint64_t sub_1DB96017C()
{
  return 0x6974616D656E6963;
}

uint64_t sub_1DB960198()
{
  return 0x6F6D2D6F6C73;
}

uint64_t sub_1DB9601A8()
{
  return 0x70616C2D656D6974;
}

uint64_t sub_1DB9601C4()
{
  return 0x566C616974617073;
}

uint64_t sub_1DB9601E4()
{
  return 0x506C616974617073;
}

uint64_t sub_1DB960204()
{
  return 1869504880;
}

uint64_t CaptureMode.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1DB960244 + 4 * byte_1DB9A8CFB[a1]))(0x6569666C6573, 0xE600000000000000);
}

uint64_t sub_1DB960244()
{
  return 0x6F65646976;
}

uint64_t sub_1DB960258()
{
  return 0x7469617274726F70;
}

uint64_t sub_1DB960284()
{
  return 0x6F746F6870;
}

uint64_t sub_1DB960298()
{
  return 0x6974616D656E6963;
}

uint64_t sub_1DB9602B4()
{
  return 0x6F6D2D6F6C73;
}

uint64_t sub_1DB9602C4()
{
  return 0x70616C2D656D6974;
}

uint64_t sub_1DB9602E0()
{
  return 0x566C616974617073;
}

uint64_t sub_1DB960300()
{
  return 0x506C616974617073;
}

uint64_t sub_1DB960320()
{
  return 1869504880;
}

void *static CaptureMode.allCases.getter()
{
  return &unk_1EA3307C8;
}

uint64_t sub_1DB96033C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1DB960354()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = *(_QWORD **)(v0 + 16);
  sub_1DB9651E0((uint64_t)&unk_1EA3307C8);
  *v1 = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB9603A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DB951088;
  return sub_1DB9798B8();
}

uint64_t sub_1DB960414(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = CaptureMode.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == CaptureMode.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_1DB97A230();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1DB96049C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_1DB97A290();
  CaptureMode.rawValue.getter(v1);
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB9604FC()
{
  unsigned __int8 *v0;

  CaptureMode.rawValue.getter(*v0);
  sub_1DB979FCC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DB96053C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_1DB97A290();
  CaptureMode.rawValue.getter(v1);
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB960598@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s8CameraUI11CaptureModeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_1DB9605C4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = CaptureMode.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1DB9605EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB961664(qword_1F0303D70, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static CaptureMode.typeDisplayRepresentation, a1);
}

uint64_t sub_1DB960610()
{
  sub_1DB94FFE0();
  return sub_1DB97978C();
}

uint64_t sub_1DB960648(uint64_t a1, uint64_t a2)
{
  return sub_1DB961728(a1, a2, &qword_1ED1C78B8);
}

uint64_t sub_1DB960664()
{
  sub_1DB966438();
  return sub_1DB97993C();
}

void sub_1DB96069C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1EA3307C8;
}

Swift::Bool __swiftcall TimerDuration.isAvailableFor(mode:)(CameraUI::CaptureMode mode)
{
  char v1;
  id v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;

  if (v1)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_capabilities);
    if (!v3)
    {
      __break(1u);
      return (char)v3;
    }
    v4 = v3;
    sub_1DB95EE2C(mode);
    v6 = objc_msgSend(v4, sel_isTimerSupportedForMode_, v5);

  }
  else
  {
    v6 = 1;
  }
  LOBYTE(v3) = v6;
  return (char)v3;
}

uint64_t sub_1DB96072C(uint64_t a1)
{
  return sub_1DB961E94(a1, static TimerDuration.typeDisplayRepresentation, 0xD000000000000020, 0x80000001DB9C08A0);
}

uint64_t TimerDuration.typeDisplayRepresentation.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303D80, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static TimerDuration.typeDisplayRepresentation);
}

uint64_t sub_1DB960774(_QWORD *a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = a2(0);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t static TimerDuration.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303D80, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static TimerDuration.typeDisplayRepresentation, a1);
}

uint64_t sub_1DB9607DC@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

unint64_t sub_1DB960848()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  _BYTE *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, _QWORD, uint64_t, uint64_t);
  unint64_t result;
  _QWORD v32[2];
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  void (*v39)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7948);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v3);
  v34 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v5);
  v45 = sub_1DB9799F0();
  v6 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v9);
  v42 = sub_1DB9799FC();
  v10 = *(_QWORD *)(v42 - 8);
  MEMORY[0x1E0C80A78](v42);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304828);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304540);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v43 = *(_QWORD *)(v12 + 72);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1DB9A8CC0;
  v35 = v14;
  v15 = (_BYTE *)(v14 + v13);
  v44 = v11;
  *v15 = 0;
  sub_1DB979F90();
  if (qword_1ED1C78D0 != -1)
    swift_once();
  v16 = v45;
  v17 = __swift_project_value_buffer(v45, (uint64_t)qword_1ED1C9C70);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v37 = v17;
  v38 = v18;
  v18(v8, v17, v16);
  sub_1DB979A38();
  sub_1DB979A08();
  v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v19 = v15;
  v41 = v15;
  v20 = v34;
  v21 = v42;
  v36(v34, 1, 1, v42);
  sub_1DB97987C();
  v22 = sub_1DB979888();
  v39 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v40 = v22;
  v39(v2, 0, 1, v22);
  sub_1DB9798A0();
  v33 = (uint64_t)&v19[v43 + *(int *)(v44 + 48)];
  v19[v43] = 1;
  sub_1DB979F90();
  v24 = v37;
  v23 = v38;
  v25 = v45;
  v38(v8, v37, v45);
  sub_1DB979A38();
  sub_1DB979A08();
  v26 = v36;
  v36(v20, 1, 1, v21);
  sub_1DB97987C();
  v39(v2, 0, 1, v40);
  sub_1DB9798A0();
  v33 = 2 * v43;
  v27 = &v41[2 * v43];
  v32[1] = &v27[*(int *)(v44 + 48)];
  *v27 = 2;
  sub_1DB979F90();
  v23(v8, v24, v25);
  sub_1DB979A38();
  sub_1DB979A08();
  v28 = v42;
  v26(v20, 1, 1, v42);
  sub_1DB97987C();
  v30 = v39;
  v29 = v40;
  v39(v2, 0, 1, v40);
  sub_1DB9798A0();
  v41[v33 + v43] = 3;
  sub_1DB979F90();
  v38(v8, v37, v45);
  sub_1DB979A38();
  sub_1DB979A08();
  v36(v20, 1, 1, v28);
  sub_1DB97987C();
  v30(v2, 0, 1, v29);
  sub_1DB9798A0();
  result = sub_1DB9571C4(v35);
  static TimerDuration.caseDisplayRepresentations = result;
  return result;
}

uint64_t *TimerDuration.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_1F0303D88 != -1)
    swift_once();
  return &static TimerDuration.caseDisplayRepresentations;
}

uint64_t static TimerDuration.caseDisplayRepresentations.getter()
{
  return sub_1DB960ED0(&qword_1F0303D88);
}

uint64_t sub_1DB960ED0(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  return sub_1DB9798D0();
}

uint64_t static TimerDuration.caseDisplayRepresentations.setter(uint64_t a1)
{
  return sub_1DB960F44(a1, &qword_1F0303D88, &static TimerDuration.caseDisplayRepresentations);
}

uint64_t sub_1DB960F44(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 != -1)
    swift_once();
  swift_beginAccess();
  *a3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static TimerDuration.caseDisplayRepresentations.modify())()
{
  if (qword_1F0303D88 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t TimerDuration.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1DB961040 + 4 * byte_1DB9A8D06[a1]))(1701736302, 0xE400000000000000);
}

uint64_t sub_1DB961040()
{
  return 0x74726F6873;
}

uint64_t sub_1DB961054()
{
  return 0x6D756964656DLL;
}

uint64_t sub_1DB961068()
{
  return 1735290732;
}

id static TimerDuration.defaultTimerForMode(mode:)(char a1)
{
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  result = objc_msgSend((id)objc_opt_self(), sel_capabilities);
  if (result)
  {
    v3 = result;
    v4 = sub_1DB95EE2C(a1);
    v6 = objc_msgSend(v3, sel_isTimerSupportedForMode_, v5);

    if (v4 == 1)
      return (id)v6;
    else
      return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DB9610F4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

id sub_1DB96110C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  id result;
  void *v8;
  unsigned int v9;
  uint64_t v10;

  if (sub_1DB979954())
  {
    swift_getKeyPath();
    sub_1DB966214();
    sub_1DB979858();
    swift_release();
    swift_release();
    v1 = 0;
    v2 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v10 = v0;
    v3 = *(char *)(v0 + 24);
    while (1)
    {
      v6 = byte_1EA330920[v1 + 32];
      if (!v6)
        goto LABEL_10;
      result = objc_msgSend((id)objc_opt_self(), sel_capabilities);
      if (!result)
      {
        __break(1u);
        return result;
      }
      v8 = result;
      v9 = objc_msgSend(result, sel_isTimerSupportedForMode_, qword_1DB9A9E88[v3]);

      if (v9)
      {
LABEL_10:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_1DB95DD30(0, v2[2] + 1, 1);
        v5 = v2[2];
        v4 = v2[3];
        if (v5 >= v4 >> 1)
          sub_1DB95DD30(v4 > 1, v5 + 1, 1);
        v2[2] = v5 + 1;
        *((_BYTE *)v2 + v5 + 32) = v6;
      }
      if (++v1 == 4)
      {
        v0 = v10;
        return (id)(*(uint64_t (**)(_QWORD *))(v0 + 8))(v2);
      }
    }
  }
  v2 = &unk_1EA330948;
  return (id)(*(uint64_t (**)(_QWORD *))(v0 + 8))(v2);
}

uint64_t StartCaptureIntent.captureMode.getter()
{
  unsigned __int8 v1;

  sub_1DB97981C();
  return v1;
}

uint64_t StartCaptureIntent.captureMode.setter()
{
  return sub_1DB979828();
}

void *static TimerDuration.allCases.getter()
{
  return &unk_1EA330970;
}

uint64_t sub_1DB961314(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_1DB967CC4;
  v4[2] = v3;
  return swift_task_switch();
}

uint64_t sub_1DB961378()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DB967CC0;
  return sub_1DB9798B8();
}

void sub_1DB9613E8(char *a1)
{
  sub_1DB957758(*a1);
}

void sub_1DB9613F4()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1DB97A290();
  __asm { BR              X9 }
}

uint64_t sub_1DB961438()
{
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  return sub_1DB97A2A8();
}

void sub_1DB961494()
{
  __asm { BR              X10 }
}

uint64_t sub_1DB9614C8()
{
  sub_1DB979FCC();
  return swift_bridgeObjectRelease();
}

void sub_1DB961510()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1DB97A290();
  __asm { BR              X9 }
}

uint64_t sub_1DB961550()
{
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB9615AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s8CameraUI13TimerDurationO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_1DB9615D8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1DB961600 + 4 * byte_1DB9A8D16[*v0]))();
}

void sub_1DB961600(_QWORD *a1@<X8>)
{
  *a1 = 0x74726F6873;
  a1[1] = 0xE500000000000000;
}

void sub_1DB961618(_QWORD *a1@<X8>)
{
  *a1 = 0x6D756964656DLL;
  a1[1] = 0xE600000000000000;
}

void sub_1DB961630(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1735290732;
  a1[1] = v1;
}

uint64_t sub_1DB961640@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB961664(&qword_1F0303D80, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static TimerDuration.typeDisplayRepresentation, a1);
}

uint64_t sub_1DB961664@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_1DB9616D4()
{
  sub_1DB950DF4();
  return sub_1DB97978C();
}

uint64_t sub_1DB96170C(uint64_t a1, uint64_t a2)
{
  return sub_1DB961728(a1, a2, &qword_1F0303D88);
}

uint64_t sub_1DB961728(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3 != -1)
    swift_once();
  swift_beginAccess();
  return sub_1DB9798D0();
}

uint64_t sub_1DB961784()
{
  sub_1DB966808();
  return sub_1DB97993C();
}

void sub_1DB9617BC(_QWORD *a1@<X8>)
{
  *a1 = &unk_1EA330A18;
}

uint64_t sub_1DB9617CC(uint64_t a1)
{
  return sub_1DB964514(a1, static OpenCaptureModeIntent.title);
}

uint64_t OpenCaptureModeIntent.title.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303D90, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static OpenCaptureModeIntent.title);
}

uint64_t static OpenCaptureModeIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303D90, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static OpenCaptureModeIntent.title, a1);
}

uint64_t sub_1DB961838(uint64_t a1)
{
  return sub_1DB9646F8(a1, static OpenCaptureModeIntent.description, 0xD000000000000021, 0x80000001DB9C1B10);
}

uint64_t OpenCaptureModeIntent.description.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303D98, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static OpenCaptureModeIntent.description);
}

uint64_t static OpenCaptureModeIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303D98, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static OpenCaptureModeIntent.description, a1);
}

uint64_t OpenCaptureModeIntent.target.getter()
{
  unsigned __int8 v1;

  sub_1DB97981C();
  return v1;
}

uint64_t OpenCaptureModeIntent.target.setter()
{
  return sub_1DB979828();
}

uint64_t (*OpenCaptureModeIntent.target.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DB979810();
  return sub_1DB96194C;
}

uint64_t static OpenCaptureModeIntent.parameterSummary.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03046A8);
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03046B0);
  MEMORY[0x1E0C80A78](v1);
  sub_1DB9653CC();
  sub_1DB979918();
  sub_1DB97990C();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03046B8);
  sub_1DB979900();
  swift_release();
  sub_1DB97990C();
  sub_1DB979924();
  return sub_1DB9798E8();
}

uint64_t OpenCaptureModeIntent.perform()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_1DB97A044();
  v2[4] = sub_1DB97A038();
  sub_1DB97A020();
  return swift_task_switch();
}

id sub_1DB961B34()
{
  uint64_t v0;
  char v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  _BYTE *v16;

  swift_release();
  sub_1DB97981C();
  v1 = *(_BYTE *)(v0 + 40);
  result = objc_msgSend((id)objc_opt_self(), sel_capabilities);
  if (result)
  {
    v3 = result;
    v4 = sub_1DB95EE2C(v1);
    v6 = objc_msgSend(v3, sel_isSupportedMode_withDevice_, v5, v4);

    if (v6)
    {
      sub_1DB95ECB0();
      v8 = v7;
      v9 = objc_msgSend(v7, sel_currentCaptureMode);
      v10 = CAMCaptureDevicePositionForDevice((uint64_t)objc_msgSend(v8, sel_currentCaptureDevice));
      sub_1DB97981C();
      sub_1DB95EE2C(*(_BYTE *)(v0 + 40));
      v12 = v11;
      sub_1DB97981C();
      v13 = sub_1DB95EE2C(*(_BYTE *)(v0 + 40));
      v14 = CAMCaptureDevicePositionForDevice(v13);
      if (v9 != v12 || v10 != v14)
        objc_msgSend(v8, sel_changeToMode_device_animated_, v12, v13, 1);
      sub_1DB979804();

      v15 = *(uint64_t (**)(void))(v0 + 8);
    }
    else
    {
      sub_1DB965770();
      swift_allocError();
      *v16 = 4;
      swift_willThrow();
      v15 = *(uint64_t (**)(void))(v0 + 8);
    }
    return (id)v15();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DB961CC4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1DB97981C();
  *a1 = v3;
  return result;
}

uint64_t sub_1DB961CFC()
{
  return sub_1DB979828();
}

uint64_t (*sub_1DB961D30(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DB979810();
  return sub_1DB96194C;
}

uint64_t sub_1DB961D78@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB961664(&qword_1F0303D90, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static OpenCaptureModeIntent.title, a1);
}

uint64_t sub_1DB961D9C()
{
  sub_1DB967B40();
  return sub_1DB9797EC();
}

uint64_t sub_1DB961DCC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DB967CC0;
  return OpenCaptureModeIntent.perform()(a1, v4);
}

uint64_t sub_1DB961E24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _s8CameraUI21OpenCaptureModeIntentVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_1DB961E48()
{
  sub_1DB9653CC();
  return sub_1DB9797D4();
}

uint64_t sub_1DB961E70(uint64_t a1)
{
  return sub_1DB961E94(a1, static CaptureDevice.typeDisplayRepresentation, 0xD000000000000020, 0x80000001DB9C08D0);
}

uint64_t sub_1DB961E94(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];

  v17[1] = a3;
  v17[2] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_1DB9799F0();
  v8 = *(_QWORD *)(v17[0] - 8);
  MEMORY[0x1E0C80A78](v17[0]);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v11);
  v12 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1DB9799FC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v15 = sub_1DB979978();
  __swift_allocate_value_buffer(v15, a2);
  __swift_project_value_buffer(v15, (uint64_t)a2);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, _QWORD))(v8 + 104))(v10, *MEMORY[0x1E0CAF9B8], v17[0]);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v7, 1, 1, v13);
  return sub_1DB97996C();
}

uint64_t CaptureDevice.typeDisplayRepresentation.unsafeMutableAddressor()
{
  return sub_1DB960774(qword_1F0303DA0, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static CaptureDevice.typeDisplayRepresentation);
}

uint64_t static CaptureDevice.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(qword_1F0303DA0, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static CaptureDevice.typeDisplayRepresentation, a1);
}

unint64_t sub_1DB9620E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, _QWORD, uint64_t, uint64_t);
  unint64_t result;
  _BYTE *v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7948);
  MEMORY[0x1E0C80A78](v0);
  v35 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v2);
  v33 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v4);
  v30 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DB9799F0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v10);
  v11 = sub_1DB9799FC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7BD0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7950);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v31 = *(_QWORD *)(v14 + 72);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1DB9A8CD0;
  v34 = v16;
  v17 = (_BYTE *)(v16 + v15);
  v32 = v13;
  v18 = *(int *)(v13 + 48);
  *v17 = 0;
  sub_1DB979F90();
  if (qword_1ED1C78D0 != -1)
    swift_once();
  v25 = &v17[v18];
  v27 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED1C9C70);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v29 = v6;
  v28(v9, v27, v6);
  sub_1DB979A38();
  sub_1DB979A08();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v19 = v33;
  v20 = v11;
  v26(v33, 1, 1, v11);
  v21 = v35;
  sub_1DB97987C();
  v22 = sub_1DB979888();
  v23 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v23(v21, 0, 1, v22);
  sub_1DB9798A0();
  v17[v31] = 1;
  sub_1DB979F90();
  v28(v9, v27, v29);
  sub_1DB979A38();
  sub_1DB979A08();
  v26(v19, 1, 1, v20);
  sub_1DB97987C();
  v23(v21, 0, 1, v22);
  sub_1DB9798A0();
  result = sub_1DB957378(v34);
  static CaptureDevice.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CaptureDevice.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_1ED1C78C8 != -1)
    swift_once();
  return &static CaptureDevice.caseDisplayRepresentations;
}

uint64_t static CaptureDevice.caseDisplayRepresentations.getter()
{
  if (qword_1ED1C78C8 != -1)
    swift_once();
  return sub_1DB9798D0();
}

uint64_t sub_1DB9625B8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

id sub_1DB9625D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  id result;
  void *v6;
  unsigned int v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;

  v1 = sub_1DB979954();
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
  swift_getKeyPath();
  sub_1DB966214();
  sub_1DB979858();
  swift_release();
  swift_release();
  v3 = *(unsigned __int8 *)(v0 + 24);
  v4 = (char)v3;
  if (!*(_BYTE *)(v0 + 24) || v3 == 3)
  {
    v8 = sub_1DB97A230();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      goto LABEL_14;
    goto LABEL_9;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_capabilities);
  if (!result)
    goto LABEL_25;
  v6 = result;
  v7 = objc_msgSend(result, sel_isSupportedMode_withDevice_, qword_1DB9A9E30[v4], 0);

  if (v7)
  {
LABEL_9:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_1DB95DD54(0, *(_QWORD *)(v2 + 16) + 1, 1);
    v10 = *(_QWORD *)(v2 + 16);
    v9 = *(_QWORD *)(v2 + 24);
    if (v10 >= v9 >> 1)
      sub_1DB95DD54(v9 > 1, v10 + 1, 1);
    *(_QWORD *)(v2 + 16) = v10 + 1;
    *(_BYTE *)(v2 + v10 + 32) = 0;
  }
LABEL_14:
  if ((_DWORD)v4 == 3 || !(_BYTE)v4)
  {
    swift_bridgeObjectRelease();
LABEL_19:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_1DB95DD54(0, *(_QWORD *)(v2 + 16) + 1, 1);
    v14 = *(_QWORD *)(v2 + 16);
    v13 = *(_QWORD *)(v2 + 24);
    if (v14 >= v13 >> 1)
      sub_1DB95DD54(v13 > 1, v14 + 1, 1);
    *(_QWORD *)(v2 + 16) = v14 + 1;
    *(_BYTE *)(v2 + v14 + 32) = 1;
    return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
  }
  result = objc_msgSend((id)objc_opt_self(), sel_capabilities);
  if (result)
  {
    v11 = result;
    v12 = objc_msgSend(result, sel_isSupportedMode_withDevice_, qword_1DB9A9E30[v4], 1);

    if (v12)
      goto LABEL_19;
    return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
  }
LABEL_25:
  __break(1u);
  return result;
}

void *static CaptureDevice.allCases.getter()
{
  return &unk_1EA330A68;
}

uint64_t sub_1DB9628AC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_1DB962910;
  v4[2] = v3;
  return swift_task_switch();
}

uint64_t sub_1DB962910(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

CameraUI::CaptureDevice_optional __swiftcall CaptureDevice.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  CameraUI::CaptureDevice_optional v2;

  v1 = sub_1DB97A224();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = CameraUI_CaptureDevice_front;
  else
    v2.value = CameraUI_CaptureDevice_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t CaptureDevice.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746E6F7266;
  else
    return 1801675106;
}

uint64_t sub_1DB9629E8(char *a1, char *a2)
{
  return sub_1DB95787C(*a1, *a2);
}

uint64_t sub_1DB9629F4()
{
  sub_1DB97A290();
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB962A68()
{
  sub_1DB979FCC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DB962AB8()
{
  sub_1DB97A290();
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB962B28@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1DB97A224();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_1DB962B84(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 1801675106;
  if (*v1)
    v2 = 0x746E6F7266;
  v3 = 0xE400000000000000;
  if (*v1)
    v3 = 0xE500000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1DB962BB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB961664(qword_1F0303DA0, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91930], (uint64_t)static CaptureDevice.typeDisplayRepresentation, a1);
}

uint64_t sub_1DB962BDC()
{
  sub_1DB950340();
  return sub_1DB97978C();
}

uint64_t sub_1DB962C14()
{
  if (qword_1ED1C78C8 != -1)
    swift_once();
  return sub_1DB9798D0();
}

uint64_t sub_1DB962C54()
{
  sub_1DB966D38();
  return sub_1DB97993C();
}

void sub_1DB962C8C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1EA330AE0;
}

uint64_t sub_1DB962C9C(uint64_t a1)
{
  return sub_1DB964514(a1, static ChangeCameraDeviceIntent.title);
}

uint64_t ChangeCameraDeviceIntent.title.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303DB0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static ChangeCameraDeviceIntent.title);
}

uint64_t static ChangeCameraDeviceIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303DB0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static ChangeCameraDeviceIntent.title, a1);
}

uint64_t sub_1DB962D08(uint64_t a1)
{
  return sub_1DB9646F8(a1, static ChangeCameraDeviceIntent.description, 0xD000000000000025, 0x80000001DB9C1A50);
}

uint64_t ChangeCameraDeviceIntent.description.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303DB8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static ChangeCameraDeviceIntent.description);
}

uint64_t static ChangeCameraDeviceIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303DB8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static ChangeCameraDeviceIntent.description, a1);
}

uint64_t ChangeCameraDeviceIntent.device.getter()
{
  unsigned __int8 v1;

  sub_1DB97981C();
  return v1;
}

uint64_t ChangeCameraDeviceIntent.device.setter()
{
  return sub_1DB979828();
}

uint64_t (*ChangeCameraDeviceIntent.device.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DB979810();
  return sub_1DB96194C;
}

uint64_t ChangeCameraDeviceIntent.$device.getter()
{
  return sub_1DB979834();
}

uint64_t static ChangeCameraDeviceIntent.parameterSummary.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03046D0);
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03046D8);
  MEMORY[0x1E0C80A78](v1);
  sub_1DB9657D8();
  sub_1DB979918();
  sub_1DB97990C();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03046E0);
  sub_1DB979900();
  swift_release();
  sub_1DB97990C();
  sub_1DB979924();
  return sub_1DB9798E8();
}

uint64_t ChangeCameraDeviceIntent.perform()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_1DB97A044();
  v2[4] = sub_1DB97A038();
  sub_1DB97A020();
  return swift_task_switch();
}

uint64_t sub_1DB963024()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  swift_release();
  sub_1DB95ECB0();
  v2 = v1;
  v3 = objc_msgSend(v1, sel_currentCaptureMode);
  sub_1DB97981C();
  objc_msgSend(v2, sel_changeToMode_device_animated_, v3, *(unsigned __int8 *)(v0 + 40), 1);
  sub_1DB979804();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB9630CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB961664(&qword_1F0303DB0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static ChangeCameraDeviceIntent.title, a1);
}

uint64_t sub_1DB9630F4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DB967CC0;
  return ChangeCameraDeviceIntent.perform()(a1, v4);
}

uint64_t sub_1DB96314C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _s8CameraUI06ChangeA12DeviceIntentVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_1DB963170()
{
  sub_1DB9657D8();
  return sub_1DB9797D4();
}

uint64_t sub_1DB963198(uint64_t a1)
{
  return sub_1DB964514(a1, static FlipCameraDeviceIntent.title);
}

uint64_t FlipCameraDeviceIntent.title.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303DC0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static FlipCameraDeviceIntent.title);
}

uint64_t static FlipCameraDeviceIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303DC0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static FlipCameraDeviceIntent.title, a1);
}

uint64_t sub_1DB963204(uint64_t a1)
{
  return sub_1DB9646F8(a1, static FlipCameraDeviceIntent.description, 0xD000000000000023, 0x80000001DB9C1A00);
}

uint64_t FlipCameraDeviceIntent.description.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303DC8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static FlipCameraDeviceIntent.description);
}

uint64_t static FlipCameraDeviceIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303DC8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static FlipCameraDeviceIntent.description, a1);
}

uint64_t FlipCameraDeviceIntent.perform()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  sub_1DB97A044();
  *(_QWORD *)(v1 + 24) = sub_1DB97A038();
  sub_1DB97A020();
  return swift_task_switch();
}

uint64_t sub_1DB9632E0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  swift_release();
  sub_1DB95ECB0();
  v2 = v1;
  v3 = CAMCaptureDevicePositionForDevice((uint64_t)objc_msgSend(v1, sel_currentCaptureDevice));
  objc_msgSend(v2, sel_changeToMode_device_animated_, objc_msgSend(v2, sel_currentCaptureMode), CAMDefaultCaptureDeviceForDevicePosition(v3 ^ 1), 1);
  sub_1DB979804();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB963390@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB961664(&qword_1F0303DC0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static FlipCameraDeviceIntent.title, a1);
}

uint64_t sub_1DB9633B4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DB951088;
  return FlipCameraDeviceIntent.perform()(a1);
}

uint64_t sub_1DB963404()
{
  sub_1DB966FF8();
  return sub_1DB9797D4();
}

void sub_1DB96342C(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1DB9799F0();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v4);
  __asm { BR              X10 }
}

uint64_t sub_1DB96350C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1DB979F90();
  if (qword_1ED1C78D0 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v1, (uint64_t)qword_1ED1C9C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v3, v1);
  sub_1DB979A38();
  return sub_1DB979A08();
}

BOOL sub_1DB96364C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DB963660()
{
  sub_1DB97A290();
  sub_1DB97A29C();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB9636A4()
{
  return sub_1DB97A29C();
}

uint64_t sub_1DB9636CC()
{
  sub_1DB97A290();
  sub_1DB97A29C();
  return sub_1DB97A2A8();
}

void sub_1DB96371C()
{
  char *v0;

  sub_1DB96342C(*v0);
}

uint64_t sub_1DB963724(uint64_t a1)
{
  return sub_1DB964514(a1, static StartCaptureIntent.title);
}

uint64_t StartCaptureIntent.title.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303DD0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static StartCaptureIntent.title);
}

uint64_t static StartCaptureIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303DD0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static StartCaptureIntent.title, a1);
}

uint64_t sub_1DB963790(uint64_t a1)
{
  return sub_1DB9646F8(a1, static StartCaptureIntent.description, 0xD000000000000025, 0x80000001DB9C19B0);
}

uint64_t StartCaptureIntent.description.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303DD8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static StartCaptureIntent.description);
}

uint64_t static StartCaptureIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303DD8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static StartCaptureIntent.description, a1);
}

void *StartCaptureIntent.openAppWhenRun.unsafeMutableAddressor()
{
  return &static StartCaptureIntent.openAppWhenRun;
}

uint64_t static StartCaptureIntent.openAppWhenRun.getter()
{
  return 1;
}

uint64_t (*StartCaptureIntent.captureMode.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DB979810();
  return sub_1DB96194C;
}

uint64_t StartCaptureIntent.$captureMode.getter()
{
  return sub_1DB979834();
}

uint64_t StartCaptureIntent.timerDuration.getter()
{
  unsigned __int8 v1;

  sub_1DB97981C();
  return v1;
}

uint64_t StartCaptureIntent.timerDuration.setter()
{
  return sub_1DB979828();
}

uint64_t (*StartCaptureIntent.timerDuration.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DB979810();
  return sub_1DB96194C;
}

uint64_t StartCaptureIntent.$timerDuration.getter()
{
  return sub_1DB979834();
}

uint64_t StartCaptureIntent.device.getter()
{
  unsigned __int8 v1;

  sub_1DB97981C();
  return v1;
}

uint64_t StartCaptureIntent.device.setter()
{
  return sub_1DB979828();
}

uint64_t (*StartCaptureIntent.device.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DB979810();
  return sub_1DB96194C;
}

void sub_1DB9639E8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t StartCaptureIntent.$device.getter()
{
  return sub_1DB979834();
}

uint64_t static StartCaptureIntent.parameterSummary.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03046F8);
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304700);
  MEMORY[0x1E0C80A78](v1);
  sub_1DB965B44();
  sub_1DB979918();
  sub_1DB97990C();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304708);
  sub_1DB979900();
  swift_release();
  sub_1DB97990C();
  sub_1DB979924();
  return sub_1DB9798F4();
}

uint64_t sub_1DB963BB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_getKeyPath();
  sub_1DB965B44();
  v0 = sub_1DB9798DC();
  swift_release();
  swift_getKeyPath();
  sub_1DB9798DC();
  v1 = sub_1DB9798DC();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304500);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1DB9A8CE0;
  *(_QWORD *)(v2 + 32) = v0;
  *(_QWORD *)(v2 + 40) = v1;
  sub_1DB97A008();
  sub_1DB9798DC();
  v3 = sub_1DB9798D0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v3;
}

uint64_t StartCaptureIntent.perform()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  sub_1DB97A044();
  v4[7] = sub_1DB97A038();
  sub_1DB97A020();
  return swift_task_switch();
}

id sub_1DB963D28()
{
  uint64_t v0;
  char v1;
  void *v2;
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  char *v20;
  char v21;
  _BYTE *v22;
  uint64_t (*v23)(void);
  int v24;
  char v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  void *v39;
  uint64_t v40;
  unsigned int v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  os_log_t log;
  uint64_t v46;
  void *v47;
  os_log_type_t type;
  uint64_t v49[2];

  swift_release();
  sub_1DB97981C();
  v1 = *(_BYTE *)(v0 + 16);
  v2 = (void *)objc_opt_self();
  result = objc_msgSend(v2, sel_capabilities);
  if (!result)
  {
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v4 = result;
  v5 = sub_1DB95EE2C(v1);
  v7 = objc_msgSend(v4, sel_isSupportedMode_withDevice_, v6, v5);

  if (!v7)
  {
    sub_1DB965770();
    swift_allocError();
    *v19 = 4;
    swift_willThrow();
LABEL_17:
    v23 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v23();
  }
  sub_1DB95ECB0();
  v9 = v8;
  v10 = objc_msgSend(v8, sel_isInCameraRollView);
  if (qword_1F0303D68 != -1)
    swift_once();
  v11 = sub_1DB979AF8();
  __swift_project_value_buffer(v11, (uint64_t)qword_1F03067C8);
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  v12 = sub_1DB979AE0();
  type = sub_1DB97A0B0();
  if (os_log_type_enabled(v12, type))
  {
    v47 = v9;
    v13 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    v49[0] = v46;
    *(_DWORD *)v13 = 136446466;
    log = v12;
    sub_1DB97981C();
    v14 = sub_1DB9600F8(*(_BYTE *)(v0 + 16));
    *(_QWORD *)(v0 + 16) = sub_1DB964BA0(v14, v15, v49);
    sub_1DB97A0F8();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    *(_WORD *)(v13 + 12) = 2082;
    sub_1DB97981C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304718);
    v16 = sub_1DB979FC0();
    *(_QWORD *)(v0 + 16) = sub_1DB964BA0(v16, v17, v49);
    sub_1DB97A0F8();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    _os_log_impl(&dword_1DB760000, v12, type, "Performing CapturePhotoIntent with captureMode=%{public}s), device=%{public}s)", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1DF0B5BD0](v46, -1, -1);
    v18 = v13;
    v9 = v47;
    MEMORY[0x1DF0B5BD0](v18, -1, -1);
  }
  else
  {
    swift_release_n();
    swift_release_n();
    swift_release_n();
  }

  if (!objc_msgSend(v9, sel_navigateToViewfinderView))
  {
    sub_1DB965770();
    swift_allocError();
    *v22 = 0;
LABEL_16:
    swift_willThrow();

    goto LABEL_17;
  }
  if ((objc_msgSend(v9, sel_isRecording) & 1) != 0)
  {
    sub_1DB965770();
    swift_allocError();
    v21 = 2;
LABEL_15:
    *v20 = v21;
    goto LABEL_16;
  }
  if ((objc_msgSend(v9, sel_isCapturingFromTimer) & 1) != 0)
  {
    sub_1DB965770();
    swift_allocError();
    v21 = 3;
    goto LABEL_15;
  }
  sub_1DB97981C();
  v24 = *(unsigned __int8 *)(v0 + 16);
  if (v24 != 2)
  {
    v25 = v24 & 1;
    sub_1DB97981C();
    if ((sub_1DB95EEBC(v25, *(_BYTE *)(v0 + 16)) & 1) == 0)
    {
      sub_1DB965770();
      swift_allocError();
      v21 = 5;
      goto LABEL_15;
    }
  }
  v26 = objc_msgSend(v9, sel_currentCaptureMode, log);
  v27 = CAMCaptureDevicePositionForDevice((uint64_t)objc_msgSend(v9, sel_currentCaptureDevice));
  sub_1DB97981C();
  sub_1DB95EE2C(*(_BYTE *)(v0 + 16));
  v29 = v28;
  sub_1DB97981C();
  v30 = *(unsigned __int8 *)(v0 + 16);
  if (v30 == 2)
  {
    sub_1DB97981C();
    v31 = sub_1DB95EE2C(*(_BYTE *)(v0 + 16));
  }
  else
  {
    v31 = v30 & 1;
  }
  v32 = CAMCaptureDevicePositionForDevice(v31);
  if (v26 != v29 || v27 != v32)
  {
    objc_msgSend(v9, sel_changeToMode_device_animated_, v29, v31, 1);
    goto LABEL_37;
  }
  if ((v10 & 1) != 0)
  {
LABEL_37:
    sub_1DB979804();

    v23 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v23();
  }
  if (objc_msgSend(v9, sel_currentCaptureMode) != v26)
  {
    v42 = sub_1DB979AE0();
    v43 = sub_1DB97A0BC();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_1DB760000, v42, v43, "Camera is in an unexpected capture mode, bailing.", v44, 2u);
      MEMORY[0x1DF0B5BD0](v44, -1, -1);
    }

    goto LABEL_37;
  }
  sub_1DB97981C();
  v33 = *(unsigned __int8 *)(v0 + 16);
  if (v33 != 4)
  {
LABEL_32:
    sub_1DB97981C();
    v38 = *(_BYTE *)(v0 + 16);
    result = objc_msgSend(v2, sel_capabilities);
    if (result)
    {
      v39 = result;
      sub_1DB95EE2C(v38);
      v41 = objc_msgSend(v39, sel_isTimerSupportedForMode_, v40);

      if (v41)
        objc_msgSend(v9, sel_setSingleUseTimerWithDuration_, v33);
      objc_msgSend(v9, sel_pressShutterForRemoteShutter);
      goto LABEL_37;
    }
    goto LABEL_43;
  }
  sub_1DB97981C();
  v34 = *(_BYTE *)(v0 + 16);
  result = objc_msgSend(v2, sel_capabilities);
  if (result)
  {
    v35 = result;
    v36 = sub_1DB95EE2C(v34);
    v33 = objc_msgSend(v35, sel_isTimerSupportedForMode_, v37);

    if (v36 != 1)
      v33 = 0;
    goto LABEL_32;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_1DB96440C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB961664(&qword_1F0303DD0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static StartCaptureIntent.title, a1);
}

uint64_t sub_1DB964434(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *v1;
  v5 = v1[1];
  v6 = v1[2];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DB967CC0;
  return StartCaptureIntent.perform()(a1, v4, v5, v6);
}

uint64_t sub_1DB9644A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = _s8CameraUI18StartCaptureIntentVACycfC_0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_1DB9644C8()
{
  sub_1DB965B44();
  return sub_1DB9797D4();
}

uint64_t sub_1DB9644F0(uint64_t a1)
{
  return sub_1DB964514(a1, static StopCaptureIntent.title);
}

uint64_t sub_1DB964514(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = sub_1DB9799F0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DB9799FC();
  __swift_allocate_value_buffer(v9, a2);
  __swift_project_value_buffer(v9, (uint64_t)a2);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CAF9B8], v3);
  return sub_1DB979A08();
}

uint64_t StopCaptureIntent.title.unsafeMutableAddressor()
{
  return sub_1DB960774(&qword_1F0303DE0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static StopCaptureIntent.title);
}

uint64_t static StopCaptureIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(&qword_1F0303DE0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static StopCaptureIntent.title, a1);
}

uint64_t sub_1DB9646D4(uint64_t a1)
{
  return sub_1DB9646F8(a1, static StopCaptureIntent.description, 0xD000000000000024, 0x80000001DB9C1780);
}

uint64_t sub_1DB9646F8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];

  v17[1] = a3;
  v17[2] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v5);
  v17[0] = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DB9799F0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v11);
  v12 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1DB9799FC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v15 = sub_1DB979864();
  __swift_allocate_value_buffer(v15, a2);
  __swift_project_value_buffer(v15, (uint64_t)a2);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0CAF9B8], v7);
  sub_1DB979A08();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v14 + 56))(v17[0], 1, 1, v13);
  return sub_1DB979870();
}

uint64_t StopCaptureIntent.description.unsafeMutableAddressor()
{
  return sub_1DB960774(qword_1F0303DE8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static StopCaptureIntent.description);
}

uint64_t static StopCaptureIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB9607DC(qword_1F0303DE8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)static StopCaptureIntent.description, a1);
}

uint64_t StopCaptureIntent.perform()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  sub_1DB97A044();
  *(_QWORD *)(v1 + 24) = sub_1DB97A038();
  sub_1DB97A020();
  return swift_task_switch();
}

uint64_t sub_1DB9649C8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _BYTE *v3;

  swift_release();
  sub_1DB95ECB0();
  v2 = v1;
  if (objc_msgSend(v1, sel_isRecording))
  {
    objc_msgSend(v2, sel_stopRecording);
    sub_1DB979804();
  }
  else
  {
    sub_1DB965770();
    swift_allocError();
    *v3 = 1;
    swift_willThrow();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB964A88@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB961664(&qword_1F0303DE0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static StopCaptureIntent.title, a1);
}

uint64_t sub_1DB964AAC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DB967CC0;
  return StopCaptureIntent.perform()(a1);
}

uint64_t sub_1DB964AFC()
{
  sub_1DB9671A0();
  return sub_1DB9797D4();
}

uint64_t sub_1DB964B24()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = sub_1DB9799F0();
  __swift_allocate_value_buffer(v0, qword_1ED1C9C70);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_1ED1C9C70);
  *v1 = type metadata accessor for _CameraUIBundleClass();
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x1E0CAF9C8], v0);
}

uint64_t sub_1DB964B90()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1DB964BA0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1DB964C70(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1DB967BA4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1DB967BA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_1DB9798D0();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1DB964C70(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1DB97A104();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1DB964E28(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1DB97A17C();
  if (!v8)
  {
    sub_1DB97A1D0();
    __break(1u);
LABEL_17:
    result = sub_1DB97A218();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1DB964E28(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1DB964EBC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1DB965094(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1DB965094(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DB964EBC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1DB965030(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1DB97A164();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1DB97A1D0();
      __break(1u);
LABEL_10:
      v2 = sub_1DB979FE4();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1DB97A218();
    __break(1u);
LABEL_14:
    result = sub_1DB97A1D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1DB965030(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304820);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1DB965094(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304820);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1DB97A218();
  __break(1u);
  return result;
}

void sub_1DB9651E0(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = 0;
  v2 = *(_QWORD *)(a1 + 16);
  v3 = a1 + 32;
  v12 = MEMORY[0x1E0DEE9D8];
LABEL_2:
  if (v1 <= v2)
    v4 = v2;
  else
    v4 = v1;
  while (v2 != v1)
  {
    if (v4 == v1)
    {
      __break(1u);
LABEL_16:
      __break(1u);
      return;
    }
    v5 = *(char *)(v3 + v1);
    v6 = objc_msgSend((id)objc_opt_self(), sel_capabilities);
    if (!v6)
      goto LABEL_16;
    v7 = v6;
    ++v1;
    v8 = objc_msgSend(v6, sel_isSupportedMode_withDevice_, qword_1DB9A9E88[v5], qword_1DB9A9EE0[v5]);

    if (v8)
    {
      v9 = v12;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1DB95DD0C(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v9 = v12;
      }
      v11 = *(_QWORD *)(v9 + 16);
      v10 = *(_QWORD *)(v9 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_1DB95DD0C(v10 > 1, v11 + 1, 1);
        v9 = v12;
      }
      *(_QWORD *)(v9 + 16) = v11 + 1;
      v12 = v9;
      *(_BYTE *)(v9 + v11 + 32) = v5;
      goto LABEL_2;
    }
  }
}

uint64_t _s8CameraUI11CaptureModeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_1DB97A224();
  swift_bridgeObjectRelease();
  if (v0 >= 0xB)
    return 11;
  else
    return v0;
}

uint64_t _s8CameraUI13TimerDurationO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_1DB97A224();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

unint64_t sub_1DB9653CC()
{
  unint64_t result;

  result = qword_1ED1C7990;
  if (!qword_1ED1C7990)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for OpenCaptureModeIntent, &type metadata for OpenCaptureModeIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7990);
  }
  return result;
}

uint64_t sub_1DB965410@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB979834();
  *a1 = result;
  return result;
}

uint64_t _s8CameraUI21OpenCaptureModeIntentVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v0 = sub_1DB979930();
  v24 = *(_QWORD *)(v0 - 8);
  v25 = v0;
  MEMORY[0x1E0C80A78](v0);
  v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v21 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DB9799F0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v15);
  v16 = sub_1DB9799FC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78F0);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0CAF9B8], v10);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  v26 = 11;
  v18 = sub_1DB9797F8();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x1E0C91738], v25);
  sub_1DB94FF9C();
  sub_1DB94FFE0();
  return sub_1DB979840();
}

unint64_t sub_1DB965770()
{
  unint64_t result;

  result = qword_1F03046C8;
  if (!qword_1F03046C8)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A9D78, &type metadata for CaptureErrors);
    atomic_store(result, (unint64_t *)&qword_1F03046C8);
  }
  return result;
}

uint64_t CAMCaptureDevicePositionForDevice(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xA)
    return 0;
  else
    return qword_1DB9A9F38[a1 - 1];
}

unint64_t sub_1DB9657D8()
{
  unint64_t result;

  result = qword_1ED1C7998;
  if (!qword_1ED1C7998)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for ChangeCameraDeviceIntent, &type metadata for ChangeCameraDeviceIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7998);
  }
  return result;
}

uint64_t _s8CameraUI06ChangeA12DeviceIntentVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v0 = sub_1DB979930();
  v24 = *(_QWORD *)(v0 - 8);
  v25 = v0;
  MEMORY[0x1E0C80A78](v0);
  v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v21 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DB9799F0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v15);
  v16 = sub_1DB9799FC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7908);
  sub_1DB979F90();
  sub_1DB979A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0CAF9B8], v10);
  sub_1DB979A08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  v26 = 2;
  v18 = sub_1DB9797F8();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x1E0C91738], v25);
  sub_1DB950340();
  return sub_1DB97984C();
}

BOOL CAMDefaultCaptureDeviceForDevicePosition(uint64_t a1)
{
  return a1 == 1;
}

unint64_t sub_1DB965B44()
{
  unint64_t result;

  result = qword_1ED1C79A0;
  if (!qword_1ED1C79A0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for StartCaptureIntent, &type metadata for StartCaptureIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C79A0);
  }
  return result;
}

uint64_t _s8CameraUI18StartCaptureIntentVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *);
  _QWORD v30[3];
  uint64_t v31;
  void (*v32)(char *);
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  unsigned int v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  unsigned int v42;
  void (*v43)(char *);
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char v47;

  v39 = sub_1DB979930();
  v0 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v45 = (char *)v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v34 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v33 = (char *)v30 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78E8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DB9799F0();
  v10 = *(_QWORD *)(v9 - 8);
  v44 = v9;
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DB979A44();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1DB979F9C();
  MEMORY[0x1E0C80A78](v16);
  v17 = sub_1DB9799FC();
  v18 = *(_QWORD *)(v17 - 8);
  v41 = v17;
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C78F0);
  sub_1DB979F90();
  v36 = v15;
  sub_1DB979A38();
  v42 = *MEMORY[0x1E0CAF9B8];
  v43 = *(void (**)(char *))(v10 + 104);
  v37 = v12;
  v43(v12);
  v21 = v20;
  sub_1DB979A08();
  v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v22 = v8;
  v40(v8, 1, 1, v17);
  LOBYTE(v46) = 11;
  v23 = sub_1DB9797F8();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v25 = v33;
  v24(v33, 1, 1, v23);
  v26 = v34;
  v24(v34, 1, 1, v23);
  v38 = *MEMORY[0x1E0C91738];
  v32 = *(void (**)(char *))(v0 + 104);
  v27 = v39;
  v32(v45);
  sub_1DB94FF9C();
  sub_1DB94FFE0();
  v30[0] = v21;
  v35 = sub_1DB979840();
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7918);
  sub_1DB979F90();
  sub_1DB979A38();
  ((void (*)(char *, _QWORD, uint64_t))v43)(v37, v42, v44);
  sub_1DB979A08();
  v40(v8, 1, 1, v41);
  v47 = 4;
  v24(v25, 1, 1, v23);
  v24(v26, 1, 1, v23);
  v30[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7920);
  swift_getKeyPath();
  v46 = sub_1DB979960();
  v28 = v32;
  ((void (*)(char *, _QWORD, uint64_t))v32)(v45, v38, v27);
  sub_1DB950DB0();
  sub_1DB950DF4();
  v31 = sub_1DB979840();
  v30[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1C7938);
  sub_1DB979F90();
  sub_1DB979A38();
  ((void (*)(char *, _QWORD, uint64_t))v43)(v37, v42, v44);
  sub_1DB979A08();
  v40(v22, 1, 1, v41);
  v47 = 2;
  v24(v25, 1, 1, v23);
  v24(v26, 1, 1, v23);
  swift_getKeyPath();
  v46 = sub_1DB979960();
  ((void (*)(char *, _QWORD, uint64_t))v28)(v45, v38, v39);
  sub_1DB950E38();
  sub_1DB950340();
  sub_1DB979840();
  return v35;
}

unint64_t sub_1DB9661CC()
{
  unint64_t result;

  result = qword_1ED1C79A8;
  if (!qword_1ED1C79A8)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A8E24, &type metadata for CaptureMode.AvailableModesProvider);
    atomic_store(result, (unint64_t *)&qword_1ED1C79A8);
  }
  return result;
}

unint64_t sub_1DB966214()
{
  unint64_t result;

  result = qword_1ED1C79B0;
  if (!qword_1ED1C79B0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C79B0);
  }
  return result;
}

uint64_t sub_1DB966258()
{
  return sub_1DB966B20(&qword_1ED1C79B8, &qword_1ED1C79C0, (uint64_t (*)(void))sub_1DB966214);
}

unint64_t sub_1DB966288()
{
  unint64_t result;

  result = qword_1ED1C79C8;
  if (!qword_1ED1C79C8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C79C8);
  }
  return result;
}

unint64_t sub_1DB9662D0()
{
  unint64_t result;

  result = qword_1ED1C79D0;
  if (!qword_1ED1C79D0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C79D0);
  }
  return result;
}

unint64_t sub_1DB966318()
{
  unint64_t result;

  result = qword_1ED1C79D8;
  if (!qword_1ED1C79D8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C79D8);
  }
  return result;
}

unint64_t sub_1DB966360()
{
  unint64_t result;

  result = qword_1ED1C79E0;
  if (!qword_1ED1C79E0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C79E0);
  }
  return result;
}

unint64_t sub_1DB9663A8()
{
  unint64_t result;

  result = qword_1ED1C79E8;
  if (!qword_1ED1C79E8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C79E8);
  }
  return result;
}

unint64_t sub_1DB9663F0()
{
  unint64_t result;

  result = qword_1ED1C79F0;
  if (!qword_1ED1C79F0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C79F0);
  }
  return result;
}

unint64_t sub_1DB966438()
{
  unint64_t result;

  result = qword_1ED1C79F8;
  if (!qword_1ED1C79F8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C79F8);
  }
  return result;
}

uint64_t sub_1DB96647C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DB956C78(a1, a2, a3, (void (*)(void))sub_1DB94FFE0);
}

unint64_t sub_1DB966494()
{
  unint64_t result;

  result = qword_1ED1C7A00;
  if (!qword_1ED1C7A00)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A00);
  }
  return result;
}

unint64_t sub_1DB9664DC()
{
  unint64_t result;

  result = qword_1ED1C7A08;
  if (!qword_1ED1C7A08)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A08);
  }
  return result;
}

unint64_t sub_1DB966524()
{
  unint64_t result;

  result = qword_1ED1C7A10;
  if (!qword_1ED1C7A10)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureMode, &type metadata for CaptureMode);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A10);
  }
  return result;
}

uint64_t sub_1DB966568()
{
  return sub_1DB953E34(&qword_1F0304738, &qword_1ED1C79C0, MEMORY[0x1E0DEAF50]);
}

unint64_t sub_1DB966598()
{
  unint64_t result;

  result = qword_1ED1C7A18;
  if (!qword_1ED1C7A18)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A9130, &type metadata for TimerDuration.AvailableTimerProvider);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A18);
  }
  return result;
}

unint64_t sub_1DB9665E0()
{
  unint64_t result;

  result = qword_1ED1C7A20;
  if (!qword_1ED1C7A20)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A20);
  }
  return result;
}

uint64_t sub_1DB966624()
{
  return sub_1DB966B20(&qword_1F0304740, qword_1F0304748, (uint64_t (*)(void))sub_1DB9665E0);
}

unint64_t sub_1DB966654()
{
  unint64_t result;

  result = qword_1ED1C7A28;
  if (!qword_1ED1C7A28)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A28);
  }
  return result;
}

unint64_t sub_1DB96669C()
{
  unint64_t result;

  result = qword_1ED1C7A30;
  if (!qword_1ED1C7A30)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A30);
  }
  return result;
}

unint64_t sub_1DB9666E4()
{
  unint64_t result;

  result = qword_1ED1C7A38;
  if (!qword_1ED1C7A38)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A38);
  }
  return result;
}

unint64_t sub_1DB96672C()
{
  unint64_t result;

  result = qword_1ED1C7A40;
  if (!qword_1ED1C7A40)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A40);
  }
  return result;
}

unint64_t sub_1DB966774()
{
  unint64_t result;

  result = qword_1ED1C7A48;
  if (!qword_1ED1C7A48)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A48);
  }
  return result;
}

unint64_t sub_1DB9667BC()
{
  unint64_t result;

  result = qword_1ED1C7A50;
  if (!qword_1ED1C7A50)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A50);
  }
  return result;
}

unint64_t sub_1DB966808()
{
  unint64_t result;

  result = qword_1ED1C7A58;
  if (!qword_1ED1C7A58)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A58);
  }
  return result;
}

uint64_t sub_1DB96684C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DB956C78(a1, a2, a3, (void (*)(void))sub_1DB950DF4);
}

unint64_t sub_1DB966864()
{
  unint64_t result;

  result = qword_1ED1C7A60;
  if (!qword_1ED1C7A60)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A60);
  }
  return result;
}

unint64_t sub_1DB9668AC()
{
  unint64_t result;

  result = qword_1ED1C7A68;
  if (!qword_1ED1C7A68)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A68);
  }
  return result;
}

unint64_t sub_1DB9668F4()
{
  unint64_t result;

  result = qword_1ED1C7A70;
  if (!qword_1ED1C7A70)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for TimerDuration, &type metadata for TimerDuration);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A70);
  }
  return result;
}

uint64_t sub_1DB966938()
{
  return sub_1DB953E34(&qword_1F0304760, qword_1F0304748, MEMORY[0x1E0DEAF50]);
}

unint64_t sub_1DB966968()
{
  unint64_t result;

  result = qword_1F0304768;
  if (!qword_1F0304768)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for OpenCaptureModeIntent, &type metadata for OpenCaptureModeIntent);
    atomic_store(result, (unint64_t *)&qword_1F0304768);
  }
  return result;
}

unint64_t sub_1DB9669B8()
{
  unint64_t result;

  result = qword_1ED1C7A78;
  if (!qword_1ED1C7A78)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for OpenCaptureModeIntent, &type metadata for OpenCaptureModeIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A78);
  }
  return result;
}

unint64_t sub_1DB966A00()
{
  unint64_t result;

  result = qword_1ED1C7A80;
  if (!qword_1ED1C7A80)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for OpenCaptureModeIntent, &type metadata for OpenCaptureModeIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A80);
  }
  return result;
}

uint64_t sub_1DB966A44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB966A54()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DB966A68()
{
  unint64_t result;

  result = qword_1ED1C7A88;
  if (!qword_1ED1C7A88)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A9588, &type metadata for CaptureDevice.AvailableDeviceProvider);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A88);
  }
  return result;
}

unint64_t sub_1DB966AB0()
{
  unint64_t result;

  result = qword_1ED1C7A90;
  if (!qword_1ED1C7A90)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A90);
  }
  return result;
}

uint64_t sub_1DB966AF4()
{
  return sub_1DB966B20(&qword_1F0304778, qword_1F0304780, (uint64_t (*)(void))sub_1DB966AB0);
}

uint64_t sub_1DB966B20(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0C91CE0], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DB966B88()
{
  unint64_t result;

  result = qword_1ED1C7A98;
  if (!qword_1ED1C7A98)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7A98);
  }
  return result;
}

unint64_t sub_1DB966BD0()
{
  unint64_t result;

  result = qword_1ED1C7AA0;
  if (!qword_1ED1C7AA0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AA0);
  }
  return result;
}

unint64_t sub_1DB966C18()
{
  unint64_t result;

  result = qword_1ED1C7AA8;
  if (!qword_1ED1C7AA8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AA8);
  }
  return result;
}

unint64_t sub_1DB966C60()
{
  unint64_t result;

  result = qword_1ED1C7AB0;
  if (!qword_1ED1C7AB0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AB0);
  }
  return result;
}

unint64_t sub_1DB966CA8()
{
  unint64_t result;

  result = qword_1ED1C7AB8;
  if (!qword_1ED1C7AB8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AB8);
  }
  return result;
}

unint64_t sub_1DB966CF0()
{
  unint64_t result;

  result = qword_1ED1C7AC0;
  if (!qword_1ED1C7AC0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AC0);
  }
  return result;
}

unint64_t sub_1DB966D38()
{
  unint64_t result;

  result = qword_1ED1C7AC8;
  if (!qword_1ED1C7AC8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AC8);
  }
  return result;
}

uint64_t sub_1DB966D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DB956C78(a1, a2, a3, (void (*)(void))sub_1DB950340);
}

unint64_t sub_1DB966D94()
{
  unint64_t result;

  result = qword_1ED1C7AD0;
  if (!qword_1ED1C7AD0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AD0);
  }
  return result;
}

unint64_t sub_1DB966DDC()
{
  unint64_t result;

  result = qword_1ED1C7AD8;
  if (!qword_1ED1C7AD8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AD8);
  }
  return result;
}

unint64_t sub_1DB966E24()
{
  unint64_t result;

  result = qword_1ED1C7AE0;
  if (!qword_1ED1C7AE0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for CaptureDevice, &type metadata for CaptureDevice);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AE0);
  }
  return result;
}

uint64_t sub_1DB966E68()
{
  return sub_1DB953E34(qword_1F0304798, qword_1F0304780, MEMORY[0x1E0DEAF50]);
}

unint64_t sub_1DB966E98()
{
  unint64_t result;

  result = qword_1ED1C7AE8;
  if (!qword_1ED1C7AE8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for ChangeCameraDeviceIntent, &type metadata for ChangeCameraDeviceIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AE8);
  }
  return result;
}

unint64_t sub_1DB966EE0()
{
  unint64_t result;

  result = qword_1ED1C7AF0;
  if (!qword_1ED1C7AF0)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for ChangeCameraDeviceIntent, &type metadata for ChangeCameraDeviceIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AF0);
  }
  return result;
}

uint64_t sub_1DB966F24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB966F34()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DB966F48()
{
  unint64_t result;

  result = qword_1ED1C7AF8;
  if (!qword_1ED1C7AF8)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for FlipCameraDeviceIntent, &type metadata for FlipCameraDeviceIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7AF8);
  }
  return result;
}

unint64_t sub_1DB966F90()
{
  unint64_t result;

  result = qword_1ED1C7B00;
  if (!qword_1ED1C7B00)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for FlipCameraDeviceIntent, &type metadata for FlipCameraDeviceIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7B00);
  }
  return result;
}

uint64_t sub_1DB966FD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB966FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DB956C78(a1, a2, a3, (void (*)(void))sub_1DB966FF8);
}

unint64_t sub_1DB966FF8()
{
  unint64_t result;

  result = qword_1ED1C7B08;
  if (!qword_1ED1C7B08)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for FlipCameraDeviceIntent, &type metadata for FlipCameraDeviceIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7B08);
  }
  return result;
}

unint64_t sub_1DB967040()
{
  unint64_t result;

  result = qword_1ED1C7B10;
  if (!qword_1ED1C7B10)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for StartCaptureIntent, &type metadata for StartCaptureIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7B10);
  }
  return result;
}

unint64_t sub_1DB967088()
{
  unint64_t result;

  result = qword_1ED1C7B18;
  if (!qword_1ED1C7B18)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for StartCaptureIntent, &type metadata for StartCaptureIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7B18);
  }
  return result;
}

uint64_t sub_1DB9670CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB9670DC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DB9670F0()
{
  unint64_t result;

  result = qword_1ED1C7B20;
  if (!qword_1ED1C7B20)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for StopCaptureIntent, &type metadata for StopCaptureIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7B20);
  }
  return result;
}

unint64_t sub_1DB967138()
{
  unint64_t result;

  result = qword_1ED1C7B28;
  if (!qword_1ED1C7B28)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for StopCaptureIntent, &type metadata for StopCaptureIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7B28);
  }
  return result;
}

uint64_t sub_1DB96717C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB96718C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DB956C78(a1, a2, a3, (void (*)(void))sub_1DB9671A0);
}

unint64_t sub_1DB9671A0()
{
  unint64_t result;

  result = qword_1ED1C7B30;
  if (!qword_1ED1C7B30)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for StopCaptureIntent, &type metadata for StopCaptureIntent);
    atomic_store(result, (unint64_t *)&qword_1ED1C7B30);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CaptureMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_1DB9672C0 + 4 * byte_1DB9A8D25[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_1DB9672F4 + 4 * byte_1DB9A8D20[v4]))();
}

uint64_t sub_1DB9672F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB9672FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB967304);
  return result;
}

uint64_t sub_1DB967310(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB967318);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_1DB96731C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB967324(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CaptureMode()
{
  return &type metadata for CaptureMode;
}

uint64_t getEnumTagSinglePayload for TimerDuration(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TimerDuration(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1DB96741C + 4 * byte_1DB9A8D2F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1DB967450 + 4 * byte_1DB9A8D2A[v4]))();
}

uint64_t sub_1DB967450(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB967458(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB967460);
  return result;
}

uint64_t sub_1DB96746C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB967474);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1DB967478(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB967480(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TimerDuration()
{
  return &type metadata for TimerDuration;
}

ValueMetadata *type metadata accessor for OpenCaptureModeIntent()
{
  return &type metadata for OpenCaptureModeIntent;
}

uint64_t getEnumTagSinglePayload for CaptureDevice(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureDevice(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1DB967588 + 4 * byte_1DB9A8D39[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DB9675BC + 4 * byte_1DB9A8D34[v4]))();
}

uint64_t sub_1DB9675BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB9675C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB9675CCLL);
  return result;
}

uint64_t sub_1DB9675D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB9675E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DB9675E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB9675EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1DB9675F8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CaptureDevice()
{
  return &type metadata for CaptureDevice;
}

ValueMetadata *type metadata accessor for ChangeCameraDeviceIntent()
{
  return &type metadata for ChangeCameraDeviceIntent;
}

ValueMetadata *type metadata accessor for FlipCameraDeviceIntent()
{
  return &type metadata for FlipCameraDeviceIntent;
}

uint64_t destroy for StartCaptureIntent()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *_s8CameraUI18StartCaptureIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_1DB9798DC();
  sub_1DB9798DC();
  sub_1DB9798DC();
  return a1;
}

_QWORD *assignWithCopy for StartCaptureIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1DB9798DC();
  swift_release();
  a1[1] = a2[1];
  sub_1DB9798DC();
  swift_release();
  a1[2] = a2[2];
  sub_1DB9798DC();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StartCaptureIntent(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StartCaptureIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StartCaptureIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StartCaptureIntent()
{
  return &type metadata for StartCaptureIntent;
}

ValueMetadata *type metadata accessor for StopCaptureIntent()
{
  return &type metadata for StopCaptureIntent;
}

uint64_t type metadata accessor for _CameraUIBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1DB967850()
{
  return sub_1DB953E34(&qword_1F03047C0, &qword_1F03047C8, MEMORY[0x1E0C916B0]);
}

uint64_t sub_1DB96787C()
{
  return sub_1DB953E34(&qword_1F03047D0, &qword_1F03047D8, MEMORY[0x1E0C91590]);
}

uint64_t sub_1DB9678A8()
{
  return sub_1DB953E34(&qword_1F03047E0, &qword_1F03047E8, MEMORY[0x1E0C916B0]);
}

uint64_t sub_1DB9678D4()
{
  return sub_1DB953E34(&qword_1F03047F0, &qword_1F03047F8, MEMORY[0x1E0C916B0]);
}

ValueMetadata *type metadata accessor for CaptureDevice.AvailableDeviceProvider()
{
  return &type metadata for CaptureDevice.AvailableDeviceProvider;
}

ValueMetadata *type metadata accessor for TimerDuration.AvailableTimerProvider()
{
  return &type metadata for TimerDuration.AvailableTimerProvider;
}

uint64_t getEnumTagSinglePayload for CaptureErrors(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1DB9679FC + 4 * byte_1DB9A8D43[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1DB967A30 + 4 * byte_1DB9A8D3E[v4]))();
}

uint64_t sub_1DB967A30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB967A38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB967A40);
  return result;
}

uint64_t sub_1DB967A4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB967A54);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1DB967A58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB967A60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CaptureErrors()
{
  return &type metadata for CaptureErrors;
}

ValueMetadata *type metadata accessor for CaptureMode.AvailableModesProvider()
{
  return &type metadata for CaptureMode.AvailableModesProvider;
}

unint64_t sub_1DB967A90()
{
  unint64_t result;

  result = qword_1F0304800;
  if (!qword_1F0304800)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9A9D50, &type metadata for CaptureErrors);
    atomic_store(result, &qword_1F0304800);
  }
  return result;
}

uint64_t sub_1DB967AD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1DB97981C();
  *a1 = v3;
  return result;
}

uint64_t sub_1DB967B0C()
{
  return sub_1DB979828();
}

unint64_t sub_1DB967B40()
{
  unint64_t result;

  result = qword_1F0304810;
  if (!qword_1F0304810)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for OpenCaptureModeIntent, &type metadata for OpenCaptureModeIntent);
    atomic_store(result, &qword_1F0304810);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1DB967BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1DB967BE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB979834();
  *a1 = result;
  return result;
}

uint64_t sub_1DB967C08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB979834();
  *a1 = result;
  return result;
}

unint64_t sub_1DB967C30()
{
  unint64_t result;

  result = qword_1F0304830;
  if (!qword_1F0304830)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F0304830);
  }
  return result;
}

unint64_t sub_1DB967C6C()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1F0304838;
  if (!qword_1F0304838)
  {
    v1 = sub_1DB967C30();
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1F0304838);
  }
  return result;
}

uint64_t sub_1DB967CB4()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for CameraUIAppIntents()
{
  return &type metadata for CameraUIAppIntents;
}

id ViewfinderViewController.Coordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ViewfinderViewController.Coordinator.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewfinderViewController.Coordinator();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ViewfinderViewController.Coordinator()
{
  return objc_opt_self();
}

id ViewfinderViewController.Coordinator.__deallocating_deinit(uint64_t a1)
{
  return sub_1DB96833C(a1, type metadata accessor for ViewfinderViewController.Coordinator);
}

uint64_t sub_1DB967EEC(void *a1, void *a2, uint64_t a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;

  v5[3] = a2;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  v10 = a1;
  v11 = a2;
  v12 = a5;
  v13 = (_QWORD *)swift_task_alloc();
  v5[6] = v13;
  *v13 = v5;
  v13[1] = sub_1DB967F94;
  v13[48] = a3;
  v13[49] = v12;
  v13[47] = a2;
  return swift_task_switch();
}

uint64_t sub_1DB967F94()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void (**v10)(_QWORD, _QWORD);

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 40);
  v5 = *(void **)(*v1 + 24);
  v4 = *(void **)(*v1 + 32);
  v6 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    if (v3)
    {
      v8 = *(void (***)(_QWORD, _QWORD))(v2 + 40);
      v9 = (void *)sub_1DB9799D8();

      ((void (**)(_QWORD, void *))v8)[2](v8, v9);
      _Block_release(v8);

    }
    else
    {

    }
  }
  else if (v3)
  {
    v10 = *(void (***)(_QWORD, _QWORD))(v2 + 40);
    v10[2](v10, 0);
    _Block_release(v10);
  }
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_1DB968198(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1DB968224;
  v8[17] = v7;
  return swift_task_switch();
}

uint64_t sub_1DB968224()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void (**v9)(_QWORD, _QWORD);

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    if (v3)
    {
      v7 = *(void (***)(_QWORD, _QWORD))(v2 + 32);
      v8 = (void *)sub_1DB9799D8();

      ((void (**)(_QWORD, void *))v7)[2](v7, v8);
      _Block_release(v7);

    }
    else
    {

    }
  }
  else if (v3)
  {
    v9 = *(void (***)(_QWORD, _QWORD))(v2 + 32);
    v9[2](v9, 0);
    _Block_release(v9);
  }
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1DB96831C()
{
  uint64_t v0;

  return sub_1DB968870(v0+ OBJC_IVAR____TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator__viewfinderViewController);
}

id sub_1DB96832C()
{
  return sub_1DB96833C(0, type metadata accessor for ViewfinderViewController._Coordinator);
}

id sub_1DB96833C(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t property wrapper backing initializer of ViewfinderViewController.hasHandleURLs()
{
  unsigned __int8 v1;

  sub_1DB979EC4();
  return v1;
}

void *ViewfinderViewController.makeUIViewController(context:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v5;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304840);
  sub_1DB979DE0();
  type metadata accessor for ViewfinderViewController._Coordinator();
  objc_msgSend(v3, sel_setUnlockDelegate_, swift_dynamicCastClassUnconditional());

  return v3;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for ViewfinderViewController._Coordinator()
{
  return objc_opt_self();
}

void ViewfinderViewController.updateUIViewController(_:context:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304840);
  sub_1DB979DE0();
  type metadata accessor for ViewfinderViewController._Coordinator();
  objc_msgSend(v3, sel_setUnlockDelegate_, swift_dynamicCastClassUnconditional());

  sub_1DB968564();
}

void sub_1DB968564()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;

  v1 = (_QWORD *)v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304908);
  MEMORY[0x1E0C80A78](v2);
  v26 = (uint64_t)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304990);
  v4 = *(_QWORD *)(v25 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x1E0C80A78](v25);
  v7 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - v8;
  v10 = *(_BYTE *)(v0 + 48);
  v11 = *(_QWORD *)(v0 + 56);
  v27 = v10;
  v28 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304998);
  sub_1DB979ED0();
  if ((v29 & 1) == 0)
  {
    v12 = (void *)sub_1DB979ABC();

    if (v12)
    {
      v27 = v10;
      v28 = v11;
      v29 = 1;
      sub_1DB979EDC();
      sub_1DB979AB0();
      v13 = v1[3];
      v14 = v1[4];
      __swift_project_boxed_opaque_existential_1(v1, v13);
      v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
      v16 = sub_1DB97A068();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v26, 1, 1, v16);
      v17 = v25;
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v25);
      sub_1DB97A044();
      v18 = v15;
      v19 = sub_1DB97A038();
      v20 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      v21 = (v5 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
      v22 = swift_allocObject();
      v23 = MEMORY[0x1E0DF06E8];
      *(_QWORD *)(v22 + 16) = v19;
      *(_QWORD *)(v22 + 24) = v23;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v22 + v20, v7, v17);
      *(_QWORD *)(v22 + v21) = v18;
      sub_1DB96BD74(v26, (uint64_t)&unk_1F03049A8, v22);

      swift_release();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v17);
    }
  }
}

id ViewfinderViewController.makeCoordinator()()
{
  uint64_t v0;
  objc_class *v1;
  id v2;
  id v3;
  objc_super v5;
  _BYTE v6[64];

  sub_1DB96883C(v0, (uint64_t)v6);
  v1 = (objc_class *)type metadata accessor for ViewfinderViewController._Coordinator();
  v2 = objc_allocWithZone(v1);
  sub_1DB96883C((uint64_t)v6, (uint64_t)v2+ OBJC_IVAR____TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator__viewfinderViewController);
  v5.receiver = v2;
  v5.super_class = v1;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  sub_1DB968870((uint64_t)v6);
  return v3;
}

uint64_t sub_1DB96883C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for ViewfinderViewController(a2, a1);
  return a2;
}

uint64_t sub_1DB968870(uint64_t a1)
{
  destroy for ViewfinderViewController(a1);
  return a1;
}

uint64_t ViewfinderViewController.init(provider:session:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  char v7;
  uint64_t v8;

  sub_1DB979EC4();
  *(_BYTE *)(a3 + 48) = v7;
  *(_QWORD *)(a3 + 56) = v8;
  result = sub_1DB968908(a1, a3);
  *(_QWORD *)(a3 + 40) = a2;
  return result;
}

uint64_t sub_1DB968908(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_1DB968924()
{
  unint64_t result;

  result = qword_1F0304850;
  if (!qword_1F0304850)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for ViewfinderViewController, &type metadata for ViewfinderViewController);
    atomic_store(result, (unint64_t *)&qword_1F0304850);
  }
  return result;
}

uint64_t sub_1DB968968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[2] = a4;
  v5[3] = a5;
  v6 = sub_1DB979A2C();
  v5[4] = v6;
  v5[5] = *(_QWORD *)(v6 - 8);
  v5[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03049B0);
  v5[7] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304990);
  v5[8] = v7;
  v5[9] = *(_QWORD *)(v7 - 8);
  v5[10] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03049B8);
  v5[11] = v8;
  v5[12] = *(_QWORD *)(v8 - 8);
  v5[13] = swift_task_alloc();
  v5[14] = sub_1DB97A044();
  v5[15] = sub_1DB97A038();
  v5[16] = sub_1DB97A020();
  v5[17] = v9;
  return swift_task_switch();
}

uint64_t sub_1DB968A7C()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[9] + 16))(v0[10], v0[2], v0[8]);
  v0[18] = swift_getOpaqueTypeConformance2();
  sub_1DB97A080();
  v0[19] = sub_1DB97A038();
  swift_getAssociatedConformanceWitness();
  v1 = (_QWORD *)swift_task_alloc();
  v0[20] = v1;
  *v1 = v0;
  v1[1] = sub_1DB968B7C;
  return sub_1DB97A02C();
}

uint64_t sub_1DB968B7C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1DB968BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 48);
    v6 = *(void **)(v0 + 24);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v5, v1, v2);
    v7 = (void *)sub_1DB979A14();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v6, sel_handleURLIfNeeded_, v7);

    *(_QWORD *)(v0 + 152) = sub_1DB97A038();
    swift_getAssociatedConformanceWitness();
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v8;
    *v8 = v0;
    v8[1] = sub_1DB968B7C;
    return sub_1DB97A02C();
  }
}

void *sub_1DB968D5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v5;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304840);
  sub_1DB979DE0();
  type metadata accessor for ViewfinderViewController._Coordinator();
  objc_msgSend(v3, sel_setUnlockDelegate_, swift_dynamicCastClassUnconditional());

  return v3;
}

void sub_1DB968E08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304840);
  sub_1DB979DE0();
  type metadata accessor for ViewfinderViewController._Coordinator();
  objc_msgSend(v3, sel_setUnlockDelegate_, swift_dynamicCastClassUnconditional());

  sub_1DB968564();
}

uint64_t sub_1DB968EC8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  objc_class *v3;
  id v4;
  id v5;
  uint64_t result;
  objc_super v7;
  _BYTE v8[64];

  sub_1DB96883C(v1, (uint64_t)v8);
  v3 = (objc_class *)type metadata accessor for ViewfinderViewController._Coordinator();
  v4 = objc_allocWithZone(v3);
  sub_1DB96883C((uint64_t)v8, (uint64_t)v4+ OBJC_IVAR____TtCV8CameraUI24ViewfinderViewControllerP33_97E8248984EBD43B1770A42696E06CCA12_Coordinator__viewfinderViewController);
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  result = sub_1DB968870((uint64_t)v8);
  *a1 = v5;
  return result;
}

uint64_t sub_1DB968F4C()
{
  sub_1DB96BBF4();
  return sub_1DB979DC8();
}

uint64_t sub_1DB968F9C()
{
  sub_1DB96BBF4();
  return sub_1DB979D98();
}

void sub_1DB968FEC()
{
  sub_1DB96BBF4();
  sub_1DB979DBC();
  __break(1u);
}

uint64_t destroy for ViewfinderViewController(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ViewfinderViewController(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  sub_1DB9798DC();
  sub_1DB9798DC();
  return a1;
}

uint64_t assignWithCopy for ViewfinderViewController(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  sub_1DB9798DC();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  sub_1DB9798DC();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        sub_1DB9798DC();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          sub_1DB9798DC();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          sub_1DB9798DC();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ViewfinderViewController(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_0(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewfinderViewController(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewfinderViewController(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewfinderViewController()
{
  return &type metadata for ViewfinderViewController;
}

uint64_t sub_1DB969380()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DB9693B4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DB967CC0;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1F0304910 + dword_1F0304910))(v2, v3, v4);
}

uint64_t sub_1DB969420(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1DB967CC0;
  return v6();
}

uint64_t sub_1DB969478()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DB967CC0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1F0304920 + dword_1F0304920))(v2, v3, v4);
}

uint64_t sub_1DB9694F0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1DB967CC0;
  return v7();
}

uint64_t sub_1DB969548(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DB967CC0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F0304930 + dword_1F0304930))(a1, v4, v5, v6);
}

uint64_t sub_1DB9695CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DB97A068();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DB97A05C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DB969710(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DB97A020();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DB969710(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304908);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DB969750(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DB9697B4;
  return v6(a1);
}

uint64_t sub_1DB9697B4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DB969800()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB969824(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DB951088;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F0304940 + dword_1F0304940))(a1, v4);
}

uint64_t sub_1DB969894(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_1DB957A18(*(_QWORD *)(v1 + 40), a1);
  return sub_1DB969AA8(a1, v3);
}

uint64_t sub_1DB9698C4(uint64_t a1)
{
  uint64_t v2;

  sub_1DB97A290();
  CaptureMode.rawValue.getter(a1);
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  v2 = sub_1DB97A2A8();
  return sub_1DB969D90(a1, v2);
}

void sub_1DB969938(char a1)
{
  sub_1DB97A290();
  __asm { BR              X10 }
}

uint64_t sub_1DB969988()
{
  uint64_t v0;
  uint64_t v1;

  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  v1 = sub_1DB97A2A8();
  return sub_1DB96A0FC(v0, v1);
}

unint64_t sub_1DB9699F0(char a1)
{
  uint64_t v2;

  sub_1DB97A290();
  sub_1DB979FCC();
  swift_bridgeObjectRelease();
  v2 = sub_1DB97A2A8();
  return sub_1DB96A29C(a1 & 1, v2);
}

unint64_t sub_1DB969A78(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DB97A140();
  return sub_1DB96A3C8(a1, v2);
}

uint64_t sub_1DB969AA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_1DB969D90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_1DB96A0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_1DB96A29C(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v11;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    if ((a1 & 1) != 0)
      v6 = 0x746E6F7266;
    else
      v6 = 1801675106;
    if ((a1 & 1) != 0)
      v7 = 0xE500000000000000;
    else
      v7 = 0xE400000000000000;
    while (1)
    {
      v8 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0x746E6F7266 : 1801675106;
      v9 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0xE500000000000000 : 0xE400000000000000;
      if (v8 == v6 && v9 == v7)
        break;
      v11 = sub_1DB97A230();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t sub_1DB96A3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1DB96BAC8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1DF0B3F20](v9, a1);
      sub_1DB96BA94((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1DB96A48C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t result;
  char v20;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304528);
  v20 = a2;
  v6 = sub_1DB97A200();
  if (*(_QWORD *)(v5 + 16))
  {
    v7 = 1 << *(_BYTE *)(v5 + 32);
    v8 = (_QWORD *)(v5 + 64);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v11 = (unint64_t)(v7 + 63) >> 6;
    sub_1DB9798DC();
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      goto LABEL_16;
    }
    v13 = 1;
    if (v11 > 1)
    {
      v14 = *(_QWORD *)(v5 + 72);
      if (v14)
      {
LABEL_15:
        v12 = __clz(__rbit64(v14)) + (v13 << 6);
LABEL_16:
        v16 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v12);
        if ((v20 & 1) == 0)
          v17 = *(id *)(*(_QWORD *)(v5 + 56) + 8 * v12);
        sub_1DB97A290();
        __asm { BR              X8 }
      }
      v15 = 2;
      if (v11 > 2)
      {
        v14 = *(_QWORD *)(v5 + 80);
        if (v14)
        {
          v13 = 2;
          goto LABEL_15;
        }
        while (1)
        {
          v13 = v15 + 1;
          if (__OFADD__(v15, 1))
          {
            __break(1u);
            __break(1u);
            JUMPOUT(0x1DB96A840);
          }
          if (v13 >= v11)
            break;
          v14 = v8[v13];
          ++v15;
          if (v14)
            goto LABEL_15;
        }
      }
    }
    swift_release();
    if ((v20 & 1) != 0)
    {
      v18 = 1 << *(_BYTE *)(v5 + 32);
      if (v18 >= 64)
        bzero((void *)(v5 + 64), ((unint64_t)(v18 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      else
        *v8 = -1 << v18;
      *(_QWORD *)(v5 + 16) = 0;
    }
    result = swift_release();
    v3 = v2;
  }
  else
  {
    result = swift_release();
  }
  *v3 = v6;
  return result;
}

uint64_t sub_1DB96A860(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304958);
  v6 = sub_1DB97A200();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = sub_1DB9798DC();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_1DB95C36C((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1DB96BAC8(v25, (uint64_t)&v38);
      sub_1DB967BA4(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_1DB97A140();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_1DB95C36C(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_1DB96AB74(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1DB969A78(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
        return sub_1DB95C36C(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1DB96AEAC();
      goto LABEL_7;
    }
    sub_1DB96A860(v13, a3 & 1);
    v19 = sub_1DB969A78(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1DB96BAC8(a2, (uint64_t)v21);
      return sub_1DB96ACAC(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_1DB97A254();
  __break(1u);
  return result;
}

_OWORD *sub_1DB96ACAC(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_1DB95C36C(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

id sub_1DB96AD24()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304528);
  v2 = *v0;
  v3 = sub_1DB97A1F4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    if (!v18)
      break;
LABEL_23:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = v16;
  }
  v19 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_1DB96AEAC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304958);
  v2 = *v0;
  v3 = sub_1DB97A1F4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_1DB96BAC8(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1DB967BA4(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1DB95C36C(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1DB96B090(uint64_t a1)
{
  uint64_t v1;

  return a1 & ~(-1 << *(_BYTE *)(v1 + 32));
}

uint64_t sub_1DB96B0BC()
{
  uint64_t v0;

  sub_1DB97A290();
  sub_1DB979FCC();
  v0 = sub_1DB97A2A8();
  return sub_1DB96B090(v0);
}

uint64_t sub_1DB96B10C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[48] = a2;
  v3[49] = v2;
  v3[47] = a1;
  return swift_task_switch();
}

uint64_t sub_1DB96B128()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  void *v10;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  _QWORD *v27;
  id v28;

  v1 = *(void **)(v0 + 376);
  if (!v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = objc_allocWithZone(MEMORY[0x1E0CB3B10]);
  v28 = v1;
  v3 = (void *)sub_1DB979FA8();
  v4 = objc_msgSend(v2, sel_initWithActivityType_, v3);
  *(_QWORD *)(v0 + 400) = v4;

  v5 = objc_msgSend(v4, sel_userInfo);
  if (v5)
  {
    v6 = v5;
    v7 = MEMORY[0x1E0DEA968];
    v8 = sub_1DB979F6C();

    *(_QWORD *)(v0 + 328) = 0x6974634172657375;
    *(_QWORD *)(v0 + 336) = 0xEA00000000006E6FLL;
    sub_1DB97A158();
    *(_QWORD *)(v0 + 224) = v7;
    *(_QWORD *)(v0 + 200) = 0x6F526172656D6163;
    *(_QWORD *)(v0 + 208) = 0xEA00000000006C6CLL;
    sub_1DB95C36C((_OWORD *)(v0 + 200), (_OWORD *)(v0 + 296));
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1DB96AB74((_OWORD *)(v0 + 296), v0 + 56, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_1DB96BA94(v0 + 56);
    if (v8)
    {
      v10 = (void *)sub_1DB979F60();
      swift_bridgeObjectRelease();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v4, sel_setUserInfo_, v10);

  }
  else
  {
    objc_msgSend(v4, sel_setUserInfo_, 0);
    swift_bridgeObjectRelease();
  }
  v12 = objc_msgSend(v4, sel_userInfo);
  if (v12)
  {
    v13 = v12;
    v14 = sub_1DB979F6C();

    *(_QWORD *)(v0 + 344) = 0x6F526172656D6163;
    *(_QWORD *)(v0 + 352) = 0xEF7865646E496C6CLL;
    sub_1DB97A158();
    v15 = objc_msgSend(v28, sel_currentAssetIndexFromEnd);
    *(_QWORD *)(v0 + 256) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v0 + 232) = v15;
    sub_1DB95C36C((_OWORD *)(v0 + 232), (_OWORD *)(v0 + 264));
    v16 = swift_isUniquelyReferenced_nonNull_native();
    sub_1DB96AB74((_OWORD *)(v0 + 264), v0 + 96, v16);
    swift_bridgeObjectRelease();
    sub_1DB96BA94(v0 + 96);
    if (v14)
    {
      v17 = (void *)sub_1DB979F60();
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v4, sel_setUserInfo_, v17);

  }
  else
  {
    objc_msgSend(v4, sel_setUserInfo_, 0);
    swift_bridgeObjectRelease();
  }
  v18 = objc_msgSend(v4, sel_userInfo);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)(v0 + 384);
    v21 = sub_1DB979F6C();

    *(_QWORD *)(v0 + 360) = 0xD000000000000014;
    *(_QWORD *)(v0 + 368) = 0x80000001DB9C2060;
    v22 = MEMORY[0x1E0DEA968];
    sub_1DB97A158();
    switch(v20)
    {
      case 3:
        v23 = 0xE500000000000000;
        v24 = 0x6572616873;
        break;
      case 2:
        v23 = 0xE400000000000000;
        v24 = 1970169197;
        break;
      case 1:
        v23 = 0xE400000000000000;
        v24 = 1953064037;
        break;
      default:
        v24 = 0;
        v23 = 0xE000000000000000;
        break;
    }
    *(_QWORD *)(v0 + 192) = v22;
    *(_QWORD *)(v0 + 168) = v24;
    *(_QWORD *)(v0 + 176) = v23;
    sub_1DB95C36C((_OWORD *)(v0 + 168), (_OWORD *)(v0 + 136));
    v25 = swift_isUniquelyReferenced_nonNull_native();
    sub_1DB96AB74((_OWORD *)(v0 + 136), v0 + 16, v25);
    swift_bridgeObjectRelease();
    sub_1DB96BA94(v0 + 16);
    if (v21)
    {
      v26 = (void *)sub_1DB979F60();
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(v4, sel_setUserInfo_, v26);

  }
  else
  {
    objc_msgSend(v4, sel_setUserInfo_, 0);
    swift_bridgeObjectRelease();
  }
  v27 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 408) = v27;
  *v27 = v0;
  v27[1] = sub_1DB96B6AC;
  return sub_1DB979AC8();
}

uint64_t sub_1DB96B6AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 416) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DB96B710()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 376);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB96B74C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 376);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB96B788()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = v0;
  return swift_task_switch();
}

uint64_t sub_1DB96B7A0()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  void *v9;
  _QWORD *v10;

  v1 = objc_allocWithZone(MEMORY[0x1E0CB3B10]);
  v2 = (void *)sub_1DB979FA8();
  v3 = objc_msgSend(v1, sel_initWithActivityType_, v2);
  *(_QWORD *)(v0 + 144) = v3;

  v4 = objc_msgSend(v3, sel_userInfo);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1DB979F6C();

    *(_QWORD *)(v0 + 120) = 0x6974634172657375;
    *(_QWORD *)(v0 + 128) = 0xEA00000000006E6FLL;
    v7 = MEMORY[0x1E0DEA968];
    sub_1DB97A158();
    *(_QWORD *)(v0 + 56) = 0xD000000000000010;
    *(_QWORD *)(v0 + 80) = v7;
    *(_QWORD *)(v0 + 64) = 0x80000001DB9C2040;
    sub_1DB95C36C((_OWORD *)(v0 + 56), (_OWORD *)(v0 + 88));
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1DB96AB74((_OWORD *)(v0 + 88), v0 + 16, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_1DB96BA94(v0 + 16);
    if (v6)
    {
      v9 = (void *)sub_1DB979F60();
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v3, sel_setUserInfo_, v9);

  }
  else
  {
    objc_msgSend(v3, sel_setUserInfo_, 0);
    swift_bridgeObjectRelease();
  }
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v10;
  *v10 = v0;
  v10[1] = sub_1DB96B9C8;
  return sub_1DB979AC8();
}

uint64_t sub_1DB96B9C8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DB96BA2C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB96BA60()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB96BA94(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1DB96BAC8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1DB96BB04()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_1DB96BB40()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = v0[4];
  v5 = (void *)v0[5];
  v6 = (void *)v0[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_1DB951088;
  return ((uint64_t (*)(void *, void *, uint64_t, void *, void *))((char *)&dword_1F0304960 + dword_1F0304960))(v2, v3, v4, v5, v6);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1DB96BBF4()
{
  unint64_t result;

  result = qword_1F0304988;
  if (!qword_1F0304988)
  {
    result = MEMORY[0x1DF0B5B58](&protocol conformance descriptor for ViewfinderViewController, &type metadata for ViewfinderViewController);
    atomic_store(result, (unint64_t *)&qword_1F0304988);
  }
  return result;
}

uint64_t sub_1DB96BC38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304990);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_1DB96BCCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F0304990) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_1DB967CC0;
  return sub_1DB968968(a1, v6, v7, v8, v9);
}

uint64_t sub_1DB96BD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DB97A068();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DB97A05C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DB953C64(a1, &qword_1F0304908);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DB97A020();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DB96BEC0()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A38);
  __swift_allocate_value_buffer(v0, qword_1F0306920);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F0306920);
  return sub_1DB979C0C();
}

uint64_t sub_1DB96BF24(uint64_t a1)
{
  return sub_1DB96C040(a1, qword_1F0306938);
}

uint64_t sub_1DB96BF50(uint64_t a1)
{
  return sub_1DB96C040(a1, qword_1F0306950);
}

uint64_t sub_1DB96BF74()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A28);
  __swift_allocate_value_buffer(v0, qword_1F0306968);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F0306968);
  return sub_1DB979C3C();
}

uint64_t sub_1DB96C020(uint64_t a1)
{
  return sub_1DB96C040(a1, qword_1F0306980);
}

uint64_t sub_1DB96C040(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A30);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1DB979C3C();
}

uint64_t sub_1DB96C0E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v32 = a1;
  v1 = sub_1DB9799B4();
  v30 = *(_QWORD *)(v1 - 8);
  v31 = v1;
  MEMORY[0x1E0C80A78](v1);
  v28 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304AD8);
  v4 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  v34 = v4;
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304AE0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304AE8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304AF0);
  v29 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB953E34(&qword_1F0304AF8, &qword_1F0304AE0, MEMORY[0x1E0CAF898]);
  sub_1DB9799CC();
  swift_getKeyPath();
  sub_1DB97999C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_getKeyPath();
  v17 = MEMORY[0x1E0CAF868];
  sub_1DB953E34(&qword_1F0304B00, &qword_1F0304AE8, MEMORY[0x1E0CAF868]);
  sub_1DB97999C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v35 = 5;
  sub_1DB9799C0();
  v19 = v30;
  v18 = v31;
  v20 = v28;
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v28, *MEMORY[0x1E0CAF808], v31);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304B08);
  v22 = v32;
  v32[3] = v21;
  v22[4] = sub_1DB96E528();
  __swift_allocate_boxed_opaque_existential_1(v22);
  sub_1DB953E34(&qword_1F0304B38, &qword_1F0304AF0, v17);
  sub_1DB953E34(&qword_1F0304B40, &qword_1F0304AD8, MEMORY[0x1E0CAF850]);
  v23 = v27;
  v24 = v33;
  sub_1DB9799A8();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v18);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v23);
}

uint64_t sub_1DB96C43C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A58);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A60);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DB953E34(&qword_1F0304A68, &qword_1F0304A60, MEMORY[0x1E0CAF898]);
  sub_1DB9799CC();
  v11[15] = 0;
  sub_1DB9799C0();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A70);
  a1[4] = sub_1DB96E2B8();
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_1DB953E34(&qword_1F0304A90, &qword_1F0304A58, MEMORY[0x1E0CAF850]);
  sub_1DB979990();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1DB96C5D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;

  v15[1] = a1;
  v3 = sub_1DB9799B4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A98);
  v16 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304AA0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB953E34(&qword_1F0304AA8, &qword_1F0304AA0, MEMORY[0x1E0CAF898]);
  sub_1DB9799CC();
  v17 = 1;
  sub_1DB9799C0();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CAF808], v3);
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304AB0);
  a2[4] = sub_1DB96E398();
  __swift_allocate_boxed_opaque_existential_1(a2);
  sub_1DB953E34(&qword_1F0304AD0, &qword_1F0304A98, MEMORY[0x1E0CAF850]);
  sub_1DB9799A8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_1DB96C7D8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1DB9798D0();
  return v1;
}

uint64_t sub_1DB96C804()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)sub_1DB979FA8();
  v1 = (void *)sub_1DB979FA8();
  v2 = CAMLocalizedFrameworkString(v0, v1);

  sub_1DB979FB4();
  sub_1DB95387C();
  return sub_1DB979E64();
}

uint64_t sub_1DB96C8C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A18);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DB979BB8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A20);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB979BC4();
  v12 = MEMORY[0x1E0CE9540];
  MEMORY[0x1DF0B395C](v7, v4, MEMORY[0x1E0CE9540]);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = v4;
  v17 = v12;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1DF0B3974](v11, v8, OpaqueTypeConformance2);
  v16 = v8;
  v17 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v14 = sub_1DB979B94();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

uint64_t sub_1DB96CA68@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return sub_1DB9798D0();
}

uint64_t sub_1DB96CC24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304908);
  result = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask;
  if (!*(_QWORD *)(v0 + OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask))
  {
    swift_unknownObjectWeakAssign();
    swift_unknownObjectWeakAssign();
    v7 = sub_1DB97A068();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 1, v7);
    v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1DB97A044();
    sub_1DB9798DC();
    v9 = sub_1DB97A038();
    v10 = (_QWORD *)swift_allocObject();
    v11 = MEMORY[0x1E0DF06E8];
    v10[2] = v9;
    v10[3] = v11;
    v10[4] = v8;
    swift_release();
    *(_QWORD *)(v1 + v6) = sub_1DB96BD74((uint64_t)v5, (uint64_t)&unk_1F0304B58, (uint64_t)v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_1DB96CD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[16] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304B70);
  v4[17] = swift_task_alloc();
  v5 = sub_1DB979C24();
  v4[18] = v5;
  v4[19] = *(_QWORD *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304B78);
  v4[22] = swift_task_alloc();
  v4[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304B80);
  v4[24] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304B88);
  v4[25] = v6;
  v4[26] = *(_QWORD *)(v6 - 8);
  v4[27] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304B90);
  v4[28] = v7;
  v4[29] = *(_QWORD *)(v7 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v4[32] = sub_1DB97A044();
  v4[33] = sub_1DB97A038();
  v4[34] = sub_1DB97A020();
  v4[35] = v8;
  return swift_task_switch();
}

uint64_t sub_1DB96CEF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 128) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1DF0B5C48](v1);
  *(_QWORD *)(v0 + 288) = v2;
  if (v2)
  {
    v3 = OBJC_IVAR___CAMSystemOverlayTipManager_menuTip;
    *(_QWORD *)(v0 + 296) = OBJC_IVAR___CAMSystemOverlayTipManager_menuTip;
    v4 = (uint64_t *)(v2 + v3);
    v6 = *v4;
    v5 = v4[1];
    *(_QWORD *)(v0 + 112) = v6;
    v7 = *(_QWORD *)(v0 + 208);
    v8 = *(_QWORD *)(v0 + 216);
    v9 = *(_QWORD *)(v0 + 200);
    *(_QWORD *)(v0 + 120) = v5;
    *(_QWORD *)(v0 + 304) = sub_1DB96E68C();
    sub_1DB979B1C();
    sub_1DB97A194();
    sub_1DB953E34(&qword_1F0304B98, &qword_1F0304B78, MEMORY[0x1E0DF0848]);
    sub_1DB97A080();
    sub_1DB97A1AC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    sub_1DB97A1B8();
    v10 = OBJC_IVAR___CAMSystemOverlayTipManager_sourceItem;
    *(_QWORD *)(v0 + 312) = OBJC_IVAR___CAMSystemOverlayTipManager_viewController;
    *(_QWORD *)(v0 + 320) = v10;
    *(_QWORD *)(v0 + 328) = OBJC_IVAR___CAMSystemOverlayTipManager_isPortraitOrientation;
    v11 = sub_1DB97A038();
    *(_QWORD *)(v0 + 336) = v11;
    if (v11)
    {
      swift_getObjectType();
      v12 = sub_1DB97A020();
      v14 = v13;
    }
    else
    {
      v12 = 0;
      v14 = 0;
    }
    *(_QWORD *)(v0 + 344) = v12;
    *(_QWORD *)(v0 + 352) = v14;
    return swift_task_switch();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1DB96D12C()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 360) = sub_1DB97A1A0();
  sub_1DB953E34(&qword_1F0304BA0, &qword_1F0304B80, MEMORY[0x1E0DF0830]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 368) = v1;
  *v1 = v0;
  v1[1] = sub_1DB96D1D4;
  return sub_1DB97A02C();
}

uint64_t sub_1DB96D1D4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(uint64_t, _QWORD))(v2 + 360))(v2 + 56, 0);
  return swift_task_switch();
}

uint64_t sub_1DB96D244()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  int *v12;

  v1 = v0[18];
  v2 = v0[19];
  v3 = v0[17];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1DB953C64(v3, &qword_1F0304B70);
    swift_release();
    return swift_task_switch();
  }
  else
  {
    v6 = v0[30];
    v5 = v0[31];
    v7 = v0[28];
    v8 = v0[29];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(v0[20], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    v9 = (int *)sub_1DB97A1AC();
    v0[47] = v10;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    v12 = (int *)((char *)v9 + *v9);
    v11 = (_QWORD *)swift_task_alloc();
    v0[48] = v11;
    *v11 = v0;
    v11[1] = sub_1DB96D398;
    return ((uint64_t (*)(_QWORD *, _QWORD))v12)(v0 + 49, v0[20]);
  }
}

uint64_t sub_1DB96D388()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 360))(v0 + 56, 1);
}

uint64_t sub_1DB96D398()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v3 = *(_QWORD *)(*v0 + 152);
  v2 = *(_QWORD *)(*v0 + 160);
  v4 = *(_QWORD *)(*v0 + 144);
  swift_task_dealloc();
  swift_release();
  *(_BYTE *)(v1 + 393) = *(_BYTE *)(v1 + 392);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_1DB96D41C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1DB96D454()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = MEMORY[0x1DF0B5C48](*(_QWORD *)(v0 + 288) + *(_QWORD *)(v0 + 312));
  if (v1)
  {
    v2 = (void *)v1;
    v3 = MEMORY[0x1DF0B5C48](*(_QWORD *)(v0 + 288) + *(_QWORD *)(v0 + 320));
    if (v3)
    {
      v4 = (void *)v3;
      if ((*(_BYTE *)(v0 + 393) & 1) != 0 && (v5 = *(_QWORD *)(v0 + 288), *(_BYTE *)(v5 + *(_QWORD *)(v0 + 328)) == 1))
      {
        v6 = *(_QWORD *)(v0 + 304);
        v7 = (uint64_t *)(v5 + *(_QWORD *)(v0 + 296));
        sub_1DB979B4C();
        v9 = *v7;
        v8 = v7[1];
        *(_QWORD *)(v0 + 40) = &type metadata for MenuTip;
        *(_QWORD *)(v0 + 48) = v6;
        *(_QWORD *)(v0 + 16) = v9;
        *(_QWORD *)(v0 + 24) = v8;
        sub_1DB9798D0();
        v10 = v4;
        v11 = (void *)sub_1DB979B58();
        objc_msgSend(v2, sel_presentViewController_animated_completion_, v11, 1, 0);

      }
      else
      {
        v12 = objc_msgSend(v2, sel_presentedViewController);
        if (v12)
        {
          v13 = v12;
          sub_1DB979B4C();
          v14 = swift_dynamicCastClass();

          if (v14)
            objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
        }
      }

    }
  }
  v15 = sub_1DB97A038();
  *(_QWORD *)(v0 + 336) = v15;
  if (v15)
  {
    swift_getObjectType();
    v16 = sub_1DB97A020();
    v18 = v17;
  }
  else
  {
    v16 = 0;
    v18 = 0;
  }
  *(_QWORD *)(v0 + 344) = v16;
  *(_QWORD *)(v0 + 352) = v18;
  return swift_task_switch();
}

uint64_t sub_1DB96D5F4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 288);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 224));

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB96D70C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask;
  if (*(_QWORD *)(v0 + OBJC_IVAR___CAMSystemOverlayTipManager_tipObservationTask))
  {
    sub_1DB9798DC();
    sub_1DB97A074();
    swift_release();
  }
  *(_QWORD *)(v0 + v1) = 0;
  swift_release();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectWeakAssign();
}

void sub_1DB96D978(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v6;
  id v7;
  uint64_t v8;

  v6 = *a4;
  v7 = a1;
  if (v6 != -1)
    swift_once();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A30);
  __swift_project_value_buffer(v8, a5);
  swift_beginAccess();
  sub_1DB979C30();
  swift_endAccess();

}

uint64_t type metadata accessor for SystemOverlayTipManager()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for MenuTip(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_1DB9798D0();
  return a1;
}

uint64_t destroy for MenuTip()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for MenuTip(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_1DB9798D0();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for MenuTip(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for MenuTip()
{
  return &type metadata for MenuTip;
}

uint64_t sub_1DB96DD08()
{
  return MEMORY[0x1E0DEA978];
}

unint64_t sub_1DB96DD18()
{
  unint64_t result;

  result = qword_1F0304A10;
  if (!qword_1F0304A10)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9AA180, &type metadata for MenuTip);
    atomic_store(result, (unint64_t *)&qword_1F0304A10);
  }
  return result;
}

uint64_t sub_1DB96DD5C()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)sub_1DB979FA8();
  v1 = (void *)sub_1DB979FA8();
  v2 = CAMLocalizedFrameworkString(v0, v1);

  sub_1DB979FB4();
  sub_1DB95387C();
  return sub_1DB979E64();
}

uint64_t sub_1DB96DE08()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A28);
  v20 = *(_QWORD *)(v0 - 8);
  v21 = v0;
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A30);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A38);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A40);
  sub_1DB979BDC();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1DB9AA150;
  if (qword_1F0303DF8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v7, (uint64_t)qword_1F0306920);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  sub_1DB979B7C();
  sub_1DB96E278(&qword_1F0304A48, MEMORY[0x1E0CE9488]);
  sub_1DB96E278(&qword_1F0304A50, MEMORY[0x1E0CE9478]);
  sub_1DB979BE8();
  if (qword_1F0303E00 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v3, (uint64_t)qword_1F0306938);
  swift_beginAccess();
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v13(v6, v12, v3);
  sub_1DB979BF4();
  if (qword_1F0303E08 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v3, (uint64_t)qword_1F0306950);
  swift_beginAccess();
  v13(v6, v14, v3);
  sub_1DB979BF4();
  if (qword_1F0303E10 != -1)
    swift_once();
  v15 = v21;
  v16 = __swift_project_value_buffer(v21, (uint64_t)qword_1F0306968);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v2, v16, v15);
  sub_1DB979BF4();
  if (qword_1F0303E18 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v3, (uint64_t)qword_1F0306980);
  swift_beginAccess();
  v13(v6, v17, v3);
  sub_1DB979BF4();
  sub_1DB9798D0();
  swift_bridgeObjectRelease();
  v18 = sub_1DB9798D0();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_1DB96E278(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1DB979B7C();
    result = MEMORY[0x1DF0B5B58](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DB96E2B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F0304A78;
  if (!qword_1F0304A78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304A70);
    v2[0] = sub_1DB953E34(&qword_1F0304A80, &qword_1F0304A60, MEMORY[0x1E0CAF890]);
    v2[1] = sub_1DB96E43C(&qword_1F0304A88, &qword_1F0304A58, MEMORY[0x1E0DEAFC0], MEMORY[0x1E0DEAFA8]);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CAF830], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F0304A78);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1DB96E398()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F0304AB8;
  if (!qword_1F0304AB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304AB0);
    v2[0] = sub_1DB953E34(&qword_1F0304AC0, &qword_1F0304AA0, MEMORY[0x1E0CAF890]);
    v2[1] = sub_1DB96E43C(&qword_1F0304AC8, &qword_1F0304A98, MEMORY[0x1E0DEBBC8], MEMORY[0x1E0DEBBA0]);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CAF7D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F0304AB8);
  }
  return result;
}

uint64_t sub_1DB96E43C(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3;
    v9[1] = a4;
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CAF848], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB96E49C()
{
  return sub_1DB96E278(&qword_1F0304A48, MEMORY[0x1E0CE9488]);
}

uint64_t sub_1DB96E4C0()
{
  return sub_1DB96E278(&qword_1F0304A50, MEMORY[0x1E0CE9478]);
}

uint64_t sub_1DB96E4E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304A38);
  result = sub_1DB979C18();
  *a1 = result;
  return result;
}

uint64_t sub_1DB96E518@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*(_QWORD *)result + 16);
  return result;
}

unint64_t sub_1DB96E528()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F0304B10;
  if (!qword_1F0304B10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304B08);
    v2[0] = sub_1DB96E5AC();
    v2[1] = sub_1DB953E34(&qword_1F0304B30, &qword_1F0304AD8, MEMORY[0x1E0CE9228]);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CE9210], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F0304B10);
  }
  return result;
}

unint64_t sub_1DB96E5AC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1F0304B18;
  if (!qword_1F0304B18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304AF0);
    v2 = sub_1DB96E610();
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CE9238], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F0304B18);
  }
  return result;
}

unint64_t sub_1DB96E610()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F0304B20;
  if (!qword_1F0304B20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0304AE8);
    v2 = sub_1DB953E34(&qword_1F0304B28, &qword_1F0304AE0, MEMORY[0x1E0CE9248]);
    result = MEMORY[0x1DF0B5B58](MEMORY[0x1E0CE9238], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F0304B20);
  }
  return result;
}

unint64_t sub_1DB96E68C()
{
  unint64_t result;

  result = qword_1F0304B48;
  if (!qword_1F0304B48)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9AA1B8, &type metadata for MenuTip);
    atomic_store(result, &qword_1F0304B48);
  }
  return result;
}

uint64_t sub_1DB96E6D0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DB96E6F4()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB96E720(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DB951088;
  return sub_1DB96CD84(a1, v4, v5, v6);
}

uint64_t sub_1DB96E78C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB96E7B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DB951088;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F0304B60 + dword_1F0304B60))(a1, v4);
}

uint64_t sub_1DB96E824()
{
  return sub_1DB96E940();
}

uint64_t sub_1DB96E838()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle);
  if (v1)
  {
    v2 = *(id *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle);
  }
  else
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v1 = 0;
  }
  v3 = v1;
  sub_1DB979984();

  sub_1DB979FD8();
  swift_bridgeObjectRelease();
  return 10;
}

uint64_t sub_1DB96E92C()
{
  return sub_1DB96E940();
}

uint64_t sub_1DB96E940()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1DB96E9A8()
{
  uint64_t result;
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB979C6C();
  swift_release();
  result = swift_release();
  if (__OFADD__(v1, 1))
  {
    __break(1u);
  }
  else if ((unint64_t)(v1 + 1) <= 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1DB9798DC();
    return sub_1DB979C78();
  }
  return result;
}

uint64_t sub_1DB96EA70()
{
  return sub_1DB97A29C();
}

_QWORD *sub_1DB96EA9C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_1DB96EACC()
{
  sub_1DB97A290();
  sub_1DB97A29C();
  return sub_1DB97A2A8();
}

uint64_t sub_1DB96EB10()
{
  sub_1DB97A290();
  sub_1DB97A29C();
  return sub_1DB97A2A8();
}

uint64_t *sub_1DB96EB50@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_1DB96EBF0@<X0>(_QWORD *a1@<X8>)
{
  return sub_1DB96EED0(a1);
}

uint64_t sub_1DB96EC04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB9798DC();
  return sub_1DB979C78();
}

uint64_t sub_1DB96EC88()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB9798DC();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1DB96ED34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB979C6C();
  swift_release();
  swift_release();
  v3 = v6;
  swift_getKeyPath();
  swift_getKeyPath();
  v7 = a1;
  sub_1DB9798DC();
  sub_1DB979C78();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB979C6C();
  swift_release();
  result = swift_release();
  if (v3 != a1)
  {
    v5 = *(void (**)(uint64_t))(v1
                                        + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
    if (v5)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_1DB9798DC();
      sub_1DB979C6C();
      swift_release();
      swift_release();
      v5(v7);
      return sub_1DB9535B8((uint64_t)v5);
    }
  }
  return result;
}

uint64_t sub_1DB96EEBC@<X0>(_QWORD *a1@<X8>)
{
  return sub_1DB96EED0(a1);
}

uint64_t sub_1DB96EED0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB979C6C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1DB96EF48(uint64_t *a1)
{
  return sub_1DB96ED34(*a1);
}

uint64_t sub_1DB96EF6C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304908);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB979C6C();
  swift_release();
  result = swift_release();
  if (!v7[1])
  {
    sub_1DB96ED34(1);
    v4 = sub_1DB97A068();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 1, 1, v4);
    v5 = swift_allocObject();
    swift_weakInit();
    v6 = (_QWORD *)swift_allocObject();
    v6[2] = 0;
    v6[3] = 0;
    v6[4] = v5;
    sub_1DB96BD74((uint64_t)v2, (uint64_t)&unk_1F0304CD8, (uint64_t)v6);
    return swift_release();
  }
  return result;
}

uint64_t sub_1DB96F09C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage) = 0;

  v3 = OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage;
  v4 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage) = 0;

  v5 = OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset;
  v6 = *(void **)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset) = 0;

  v7 = (uint64_t *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
  v8 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
  *v7 = 0;
  v7[1] = 0;
  sub_1DB9535B8(v8);
  v9 = v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__state;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304CC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = v0 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__loadingStatus;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304CC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);

  sub_1DB9535B8(*v7);
  return v0;
}

uint64_t sub_1DB96F1A4()
{
  sub_1DB96F09C();
  return swift_deallocClassInstance();
}

uint64_t sub_1DB96F1C8()
{
  return type metadata accessor for OnboardingBuddySetupViewModel();
}

uint64_t type metadata accessor for OnboardingBuddySetupViewModel()
{
  uint64_t result;

  result = qword_1F0304BE8;
  if (!qword_1F0304BE8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1DB96F20C()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DB96F2C8(319, &qword_1F0304BF8);
  if (v0 <= 0x3F)
  {
    sub_1DB96F2C8(319, qword_1F0304C00);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_1DB96F2C8(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1DB979C84();
    if (!v4)
      atomic_store(v3, a2);
  }
}

ValueMetadata *type metadata accessor for OnboardingBuddyAssetLoadingStatus()
{
  return &type metadata for OnboardingBuddyAssetLoadingStatus;
}

ValueMetadata *type metadata accessor for OnboardingBuddySetupViewState()
{
  return &type metadata for OnboardingBuddySetupViewState;
}

unint64_t sub_1DB96F330()
{
  unint64_t result;

  result = qword_1F0304CB0;
  if (!qword_1F0304CB0)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9AA3B8, &type metadata for OnboardingBuddySetupViewState);
    atomic_store(result, (unint64_t *)&qword_1F0304CB0);
  }
  return result;
}

unint64_t sub_1DB96F378()
{
  unint64_t result;

  result = qword_1F0304CB8;
  if (!qword_1F0304CB8)
  {
    result = MEMORY[0x1DF0B5B58](&unk_1DB9AA458, &type metadata for OnboardingBuddyAssetLoadingStatus);
    atomic_store(result, (unint64_t *)&qword_1F0304CB8);
  }
  return result;
}

uint64_t sub_1DB96F3BC()
{
  return MEMORY[0x1E0C96020];
}

id sub_1DB96F3C8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t ObjCClassFromMetadata;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void (*v19)(char *, char *, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03049B0);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1DB979A2C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v22 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v22 - v11;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v23 = sub_1DB979FB4();
  v24 = v15;
  v16 = (void *)sub_1DB979FA8();
  v17 = (void *)sub_1DB979FA8();
  v18 = objc_msgSend(v14, sel_URLForResource_withExtension_, v16, v17);

  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_5;
  }
  sub_1DB979A20();

  v19 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v19(v2, v10, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_5:
    swift_bridgeObjectRelease();

    sub_1DB953C64((uint64_t)v2, &qword_1F03049B0);
    return 0;
  }
  v19(v12, v2, v3);
  sub_1DB97049C();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v12, v3);
  v21 = sub_1DB96F668((uint64_t)v7, v23, v24, 0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);

  return v21;
}

id sub_1DB96F668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  id v13;
  id v14;
  uint64_t v15;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = (void *)sub_1DB979A14();
  v7 = (void *)sub_1DB979FA8();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_1DB979F60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v17[0] = 0;
  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_packageWithContentsOfURL_type_options_error_, v6, v7, v8, v17);

  v10 = v17[0];
  if (v9)
  {
    v11 = sub_1DB979A2C();
    v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
    v13 = v10;
    v12(a1, v11);
  }
  else
  {
    v14 = v17[0];
    sub_1DB9799E4();

    swift_willThrow();
    v15 = sub_1DB979A2C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  }
  return v9;
}

uint64_t sub_1DB96F7F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a4;
  return swift_task_switch();
}

uint64_t sub_1DB96F80C()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 48) = Strong;
  if (!Strong)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_1DB96F8C4;
  return sub_1DB97A188();
}

uint64_t sub_1DB96F8C4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DB96F918()
{
  uint64_t v0;

  sub_1DB97A044();
  *(_QWORD *)(v0 + 64) = sub_1DB97A038();
  sub_1DB97A020();
  return swift_task_switch();
}

uint64_t sub_1DB96F980()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 48);
  swift_release();
  v2 = sub_1DB96F3C8();
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage) = v2;

  v4 = sub_1DB96F3C8();
  v5 = *(void **)(v1 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage) = v4;

  sub_1DB96ED34(2);
  return swift_task_switch();
}

uint64_t sub_1DB96FA30()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB96FA60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a2;
  v3[3] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304908);
  v3[4] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DB96FABC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  sub_1DB97A050();
  v3 = sub_1DB97A068();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v1, 0, 1, v3);
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v2;
  sub_1DB9798DC();
  sub_1DB96FF88(v1, (uint64_t)&unk_1F0304D00, (uint64_t)v4);
  sub_1DB953C64(v1, &qword_1F0304908);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB96FB74()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DB967CC0;
  return sub_1DB96FBBC();
}

uint64_t sub_1DB96FBBC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03049B0);
  v1[3] = swift_task_alloc();
  v2 = sub_1DB979A2C();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DB96FC50()
{
  uint64_t *v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  id v11;
  void *v12;
  id v13;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = (void *)sub_1DB979FA8();
  v4 = (void *)sub_1DB979FA8();
  v5 = objc_msgSend(v2, sel_URLForResource_withExtension_, v3, v4);

  if (v5)
  {
    v7 = v0[5];
    v6 = v0[6];
    v9 = v0[3];
    v8 = v0[4];
    sub_1DB979A20();

    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
    v10(v9, v6, v8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v8) != 1)
    {
      v10(v0[7], v0[3], v0[4]);
      v11 = objc_allocWithZone(MEMORY[0x1E0CC7780]);
      v12 = (void *)sub_1DB979A14();
      v13 = objc_msgSend(v11, sel_initWithURL_, v12);
      v0[8] = (uint64_t)v13;

      objc_msgSend(v13, sel_loadTextures);
      sub_1DB97A044();
      v0[9] = sub_1DB97A038();
      sub_1DB97A020();
      return swift_task_switch();
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[5] + 56))(v0[3], 1, 1, v0[4]);
  }
  sub_1DB953C64(v0[3], &qword_1F03049B0);
  return sub_1DB97A1DC();
}

uint64_t sub_1DB96FEB8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 16);
  swift_release();
  v3 = *(void **)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset) = v1;
  v4 = v1;

  return swift_task_switch();
}

uint64_t sub_1DB96FF18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 32);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DB96FF88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];
  _QWORD v21[4];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304908);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB970570(a1, (uint64_t)v10);
  v11 = sub_1DB97A068();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1DB953C64((uint64_t)v10, &qword_1F0304908);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_1DB97A020();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_1DB97A05C();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_1DB97012C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB979C54();
  *a1 = result;
  return result;
}

uint64_t sub_1DB970154@<X0>(_QWORD *a1@<X8>)
{
  return sub_1DB96EED0(a1);
}

uint64_t sub_1DB970178(uint64_t *a1)
{
  return sub_1DB96ED34(*a1);
}

uint64_t sub_1DB97019C@<X0>(_QWORD *a1@<X8>)
{
  return sub_1DB96EED0(a1);
}

uint64_t sub_1DB9701C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  Class v16;
  id v17;
  uint64_t *v18;
  uint64_t v20;
  uint64_t v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304CC8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304CC0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__state;
  v21 = 0;
  sub_1DB979C60();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v13, v12, v9);
  v14 = v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel__loadingStatus;
  v21 = 0;
  sub_1DB979C60();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v14, v8, v5);
  v15 = (NSString *)sub_1DB979FA8();
  v16 = NSClassFromString(v15);

  if (v16)
    v17 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v16);
  else
    v17 = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_cameraButtonBundle) = v17;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_demoLoopAnimationPackage) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_buttonHighlightAnimationPackage) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_modelAsset) = 0;
  v18 = (uint64_t *)(v2 + OBJC_IVAR____TtC8CameraUI29OnboardingBuddySetupViewModel_assetLoadingComplete);
  *v18 = a1;
  v18[1] = a2;
  sub_1DB953604(a1);
  sub_1DB9535B8(0);
  sub_1DB96EF6C();
  return v2;
}

uint64_t sub_1DB9703B0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DB9703D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DB951088;
  v3[5] = v2;
  return swift_task_switch();
}

uint64_t sub_1DB970438(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1DB967CC0;
  return sub_1DB96FA60(a1, a2, v2);
}

unint64_t sub_1DB97049C()
{
  unint64_t result;

  result = qword_1F0304CF0;
  if (!qword_1F0304CF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1F0304CF0);
  }
  return result;
}

uint64_t objectdestroy_10Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB970508()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DB967CC0;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_1DB967CC0;
  return sub_1DB96FBBC();
}

uint64_t sub_1DB970570(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0304908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DB9705B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB9705DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DB951088;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F0304D08 + dword_1F0304D08))(a1, v4);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void __getBCSDetectedCodeClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  -[CAMStillImageCaptureCommand executeWithContext:].cold.1(v0);
}

uint64_t __getRPPeopleDiscoveryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CAMLibrarySelectionController userDidPickSharedLibraryMode:].cold.1(v0);
}

uint64_t __getBCSAVParsingSessionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBCSActionClass_block_invoke_cold_1(v0);
}

uint64_t __getBCSActionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CAMSmartStylePreviewGridView updateGridIndex:withResourceLoadResult:].cold.1(v0);
}

uint64_t __getPLCropOverlayClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPLPhotoTileViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPLPhotoTileViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPLVideoViewClass_block_invoke_cold_1(v0);
}

uint64_t __getPLVideoViewClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return -[CAMCallStatusMonitor _accessQueue_subscribeToAVSystemControllerNotificationsWithCompletion:].cold.1(v0, v1, v2);
}

void __getSFDeviceDiscoveryClass_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;

  v0 = abort_report_np();
  -[CAMExposureCommand executeWithContext:].cold.1(v0, v1, v2);
}

void CAMShowStorageUsageInSettings_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Failed to opening Storage Settings url: %{public}@", (uint8_t *)&v2, 0xCu);
}

void CAMOpenURL_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Failed to open URL %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

uint64_t __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CAMPreviewViewController _focusOnPoint:shouldShowFocusAndExposureIndicator:].cold.1(v0);
}

void __getPAMediaConversionServiceResourceURLCollectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPAImageConversionServiceClientClass_block_invoke_cold_1(v0);
}

void __getPAImageConversionServiceClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPAVideoConversionServiceClientClass_block_invoke_cold_1(v0);
}

void __getPAVideoConversionServiceClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke_cold_1(v0);
}

void __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_1DB97978C();
}

uint64_t sub_1DB97978C()
{
  return MEMORY[0x1E0C904D8]();
}

uint64_t sub_1DB979798()
{
  return MEMORY[0x1E0C905A0]();
}

uint64_t sub_1DB9797A4()
{
  return MEMORY[0x1E0C905C0]();
}

uint64_t sub_1DB9797B0()
{
  return MEMORY[0x1E0C905D0]();
}

uint64_t sub_1DB9797BC()
{
  return MEMORY[0x1E0C905E0]();
}

uint64_t sub_1DB9797C8()
{
  return MEMORY[0x1E0C90640]();
}

uint64_t sub_1DB9797D4()
{
  return MEMORY[0x1E0C90650]();
}

uint64_t sub_1DB9797E0()
{
  return MEMORY[0x1E0C906D8]();
}

uint64_t sub_1DB9797EC()
{
  return MEMORY[0x1E0C90740]();
}

uint64_t sub_1DB9797F8()
{
  return MEMORY[0x1E0C907D0]();
}

uint64_t sub_1DB979804()
{
  return MEMORY[0x1E0C90A08]();
}

uint64_t sub_1DB979810()
{
  return MEMORY[0x1E0C90CF0]();
}

uint64_t sub_1DB97981C()
{
  return MEMORY[0x1E0C90D00]();
}

uint64_t sub_1DB979828()
{
  return MEMORY[0x1E0C90D10]();
}

uint64_t sub_1DB979834()
{
  return MEMORY[0x1E0C90D20]();
}

uint64_t sub_1DB979840()
{
  return MEMORY[0x1E0C90D90]();
}

uint64_t sub_1DB97984C()
{
  return MEMORY[0x1E0C90D98]();
}

uint64_t sub_1DB979858()
{
  return MEMORY[0x1E0C90F00]();
}

uint64_t sub_1DB979864()
{
  return MEMORY[0x1E0C91128]();
}

uint64_t sub_1DB979870()
{
  return MEMORY[0x1E0C91148]();
}

uint64_t sub_1DB97987C()
{
  return MEMORY[0x1E0C91468]();
}

uint64_t sub_1DB979888()
{
  return MEMORY[0x1E0C91480]();
}

uint64_t sub_1DB979894()
{
  return MEMORY[0x1E0C914A8]();
}

uint64_t sub_1DB9798A0()
{
  return MEMORY[0x1E0C914B0]();
}

uint64_t sub_1DB9798AC()
{
  return MEMORY[0x1E0C914D0]();
}

uint64_t sub_1DB9798B8()
{
  return MEMORY[0x1E0C91620]();
}

uint64_t sub_1DB9798C4()
{
  return MEMORY[0x1E0C91640]();
}

uint64_t sub_1DB9798D0()
{
  return MEMORY[0x1E0C91658]();
}

uint64_t sub_1DB9798DC()
{
  return MEMORY[0x1E0C91668]();
}

uint64_t sub_1DB9798E8()
{
  return MEMORY[0x1E0C91690]();
}

uint64_t sub_1DB9798F4()
{
  return MEMORY[0x1E0C91698]();
}

uint64_t sub_1DB979900()
{
  return MEMORY[0x1E0C916C0]();
}

uint64_t sub_1DB97990C()
{
  return MEMORY[0x1E0C916C8]();
}

uint64_t sub_1DB979918()
{
  return MEMORY[0x1E0C916D0]();
}

uint64_t sub_1DB979924()
{
  return MEMORY[0x1E0C916F8]();
}

uint64_t sub_1DB979930()
{
  return MEMORY[0x1E0C91750]();
}

uint64_t sub_1DB97993C()
{
  return MEMORY[0x1E0C917F8]();
}

uint64_t sub_1DB979948()
{
  return MEMORY[0x1E0C91820]();
}

uint64_t sub_1DB979954()
{
  return MEMORY[0x1E0C918E8]();
}

uint64_t sub_1DB979960()
{
  return MEMORY[0x1E0C91900]();
}

uint64_t sub_1DB97996C()
{
  return MEMORY[0x1E0C91920]();
}

uint64_t sub_1DB979978()
{
  return MEMORY[0x1E0C91930]();
}

uint64_t sub_1DB979984()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1DB979990()
{
  return MEMORY[0x1E0CAF7E0]();
}

uint64_t sub_1DB97999C()
{
  return MEMORY[0x1E0CAF7E8]();
}

uint64_t sub_1DB9799A8()
{
  return MEMORY[0x1E0CAF7F8]();
}

uint64_t sub_1DB9799B4()
{
  return MEMORY[0x1E0CAF818]();
}

uint64_t sub_1DB9799C0()
{
  return MEMORY[0x1E0CAF8A0]();
}

uint64_t sub_1DB9799CC()
{
  return MEMORY[0x1E0CAF8A8]();
}

uint64_t sub_1DB9799D8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DB9799E4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DB9799F0()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_1DB9799FC()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_1DB979A08()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_1DB979A14()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DB979A20()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1DB979A2C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DB979A38()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DB979A44()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DB979A50()
{
  return MEMORY[0x1E0CB12A8]();
}

uint64_t sub_1DB979A5C()
{
  return MEMORY[0x1E0CB12C0]();
}

uint64_t sub_1DB979A68()
{
  return MEMORY[0x1E0CB1348]();
}

uint64_t sub_1DB979A74()
{
  return MEMORY[0x1E0CB1398]();
}

uint64_t sub_1DB979A80()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_1DB979A8C()
{
  return MEMORY[0x1E0D8C8D8]();
}

uint64_t sub_1DB979A98()
{
  return MEMORY[0x1E0D8C8E0]();
}

uint64_t sub_1DB979AA4()
{
  return MEMORY[0x1E0D8C8E8]();
}

uint64_t sub_1DB979AB0()
{
  return MEMORY[0x1E0D8C8F0]();
}

uint64_t sub_1DB979ABC()
{
  return MEMORY[0x1E0D8C900]();
}

uint64_t sub_1DB979AC8()
{
  return MEMORY[0x1E0D8C908]();
}

uint64_t sub_1DB979AD4()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1DB979AE0()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DB979AEC()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DB979AF8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DB979B04()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1DB979B10()
{
  return MEMORY[0x1E0CE9288]();
}

uint64_t sub_1DB979B1C()
{
  return MEMORY[0x1E0CE92B0]();
}

uint64_t sub_1DB979B28()
{
  return MEMORY[0x1E0CE92C8]();
}

uint64_t sub_1DB979B34()
{
  return MEMORY[0x1E0CE92F8]();
}

uint64_t sub_1DB979B40()
{
  return MEMORY[0x1E0CE9300]();
}

uint64_t sub_1DB979B4C()
{
  return MEMORY[0x1E0CE9340]();
}

uint64_t sub_1DB979B58()
{
  return MEMORY[0x1E0CE9350]();
}

uint64_t sub_1DB979B64()
{
  return MEMORY[0x1E0CE9410]();
}

uint64_t sub_1DB979B70()
{
  return MEMORY[0x1E0CE9430]();
}

uint64_t sub_1DB979B7C()
{
  return MEMORY[0x1E0CE9458]();
}

uint64_t sub_1DB979B88()
{
  return MEMORY[0x1E0CE94D8]();
}

uint64_t sub_1DB979B94()
{
  return MEMORY[0x1E0CE94F8]();
}

uint64_t sub_1DB979BA0()
{
  return MEMORY[0x1E0CE9510]();
}

uint64_t sub_1DB979BAC()
{
  return MEMORY[0x1E0CE9538]();
}

uint64_t sub_1DB979BB8()
{
  return MEMORY[0x1E0CE9558]();
}

uint64_t sub_1DB979BC4()
{
  return MEMORY[0x1E0CE9570]();
}

uint64_t sub_1DB979BD0()
{
  return MEMORY[0x1E0CE9630]();
}

uint64_t sub_1DB979BDC()
{
  return MEMORY[0x1E0CE9740]();
}

uint64_t sub_1DB979BE8()
{
  return MEMORY[0x1E0CE9760]();
}

uint64_t sub_1DB979BF4()
{
  return MEMORY[0x1E0CE9778]();
}

uint64_t sub_1DB979C00()
{
  return MEMORY[0x1E0CE9780]();
}

uint64_t sub_1DB979C0C()
{
  return MEMORY[0x1E0CE9798]();
}

uint64_t sub_1DB979C18()
{
  return MEMORY[0x1E0CE97C8]();
}

uint64_t sub_1DB979C24()
{
  return MEMORY[0x1E0CE9858]();
}

uint64_t sub_1DB979C30()
{
  return MEMORY[0x1E0CE98C0]();
}

uint64_t sub_1DB979C3C()
{
  return MEMORY[0x1E0CE98E8]();
}

uint64_t sub_1DB979C48()
{
  return MEMORY[0x1E0CE98F0]();
}

uint64_t sub_1DB979C54()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1DB979C60()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1DB979C6C()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1DB979C78()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1DB979C84()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1DB979C90()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_1DB979C9C()
{
  return MEMORY[0x1E0CD88A0]();
}

uint64_t sub_1DB979CA8()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1DB979CB4()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_1DB979CC0()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_1DB979CCC()
{
  return MEMORY[0x1E0CDA2C8]();
}

uint64_t sub_1DB979CD8()
{
  return MEMORY[0x1E0CDA2F0]();
}

uint64_t sub_1DB979CE4()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_1DB979CF0()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_1DB979CFC()
{
  return MEMORY[0x1E0CDA710]();
}

uint64_t sub_1DB979D08()
{
  return MEMORY[0x1E0CDA718]();
}

uint64_t sub_1DB979D14()
{
  return MEMORY[0x1E0CDA7F8]();
}

uint64_t sub_1DB979D20()
{
  return MEMORY[0x1E0CDA810]();
}

uint64_t sub_1DB979D2C()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_1DB979D38()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_1DB979D44()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_1DB979D50()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1DB979D5C()
{
  return MEMORY[0x1E0CDCDB0]();
}

uint64_t sub_1DB979D68()
{
  return MEMORY[0x1E0CDCDC0]();
}

uint64_t sub_1DB979D74()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_1DB979D80()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_1DB979D8C()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_1DB979D98()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_1DB979DA4()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_1DB979DB0()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_1DB979DBC()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_1DB979DC8()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_1DB979DD4()
{
  return MEMORY[0x1E0CDCEC8]();
}

uint64_t sub_1DB979DE0()
{
  return MEMORY[0x1E0CDD218]();
}

uint64_t sub_1DB979DEC()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_1DB979DF8()
{
  return MEMORY[0x1E0CDD348]();
}

uint64_t sub_1DB979E04()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1DB979E10()
{
  return MEMORY[0x1E0CDD3C0]();
}

uint64_t sub_1DB979E1C()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_1DB979E28()
{
  return MEMORY[0x1E0CDD520]();
}

uint64_t sub_1DB979E34()
{
  return MEMORY[0x1E0CDD5E0]();
}

uint64_t sub_1DB979E40()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_1DB979E4C()
{
  return MEMORY[0x1E0CDD678]();
}

uint64_t sub_1DB979E58()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1DB979E64()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1DB979E70()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1DB979E7C()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1DB979E88()
{
  return MEMORY[0x1E0CDDEE0]();
}

uint64_t sub_1DB979E94()
{
  return MEMORY[0x1E0CDDFD0]();
}

uint64_t sub_1DB979EA0()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1DB979EAC()
{
  return MEMORY[0x1E0CDF490]();
}

uint64_t sub_1DB979EB8()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_1DB979EC4()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1DB979ED0()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1DB979EDC()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_1DB979EE8()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_1DB979EF4()
{
  return MEMORY[0x1E0CE0208]();
}

uint64_t sub_1DB979F00()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1DB979F0C()
{
  return MEMORY[0x1E0CE02F0]();
}

uint64_t sub_1DB979F18()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1DB979F24()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1DB979F30()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1DB979F3C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1DB979F48()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1DB979F54()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1DB979F60()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DB979F6C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1DB979F78()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1DB979F84()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1DB979F90()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1DB979F9C()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1DB979FA8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DB979FB4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DB979FC0()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1DB979FCC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DB979FD8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DB979FE4()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DB979FF0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DB979FFC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DB97A008()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DB97A014()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1DB97A020()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DB97A02C()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_1DB97A038()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1DB97A044()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1DB97A050()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1DB97A05C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DB97A068()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DB97A074()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1DB97A080()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1DB97A08C()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1DB97A098()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1DB97A0A4()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1DB97A0B0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1DB97A0BC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DB97A0C8()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1DB97A0D4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DB97A0E0()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1DB97A0EC()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1DB97A0F8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DB97A104()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DB97A110()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DB97A11C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1DB97A128()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1DB97A134()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1DB97A140()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1DB97A14C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1DB97A158()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1DB97A164()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DB97A170()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DB97A17C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DB97A188()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_1DB97A194()
{
  return MEMORY[0x1E0DF0C08]();
}

uint64_t sub_1DB97A1A0()
{
  return MEMORY[0x1E0DF0C10]();
}

uint64_t sub_1DB97A1AC()
{
  return MEMORY[0x1E0DF0C28]();
}

uint64_t sub_1DB97A1B8()
{
  return MEMORY[0x1E0DF0C40]();
}

uint64_t sub_1DB97A1C4()
{
  return MEMORY[0x1E0DF0C50]();
}

uint64_t sub_1DB97A1D0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DB97A1DC()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1DB97A1E8()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DB97A1F4()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1DB97A200()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1DB97A20C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DB97A218()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DB97A224()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1DB97A230()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DB97A23C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1DB97A248()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1DB97A254()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1DB97A260()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DB97A26C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DB97A278()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DB97A284()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DB97A290()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DB97A29C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DB97A2A8()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t ACT_CopyDefaultConfigurationForPanorama()
{
  return MEMORY[0x1E0CF1230]();
}

uint64_t ACT_FigSampleBufferProcessorCreateForPanoramaWithOptionsAndPreviewSize()
{
  return MEMORY[0x1E0CF1238]();
}

uint64_t ACT_FigSampleBufferProcessorStartPanoramaCapture()
{
  return MEMORY[0x1E0CF1240]();
}

uint64_t ACT_FigSampleBufferProcessorStartPanoramaCaptureWithMetadata()
{
  return MEMORY[0x1E0CF1248]();
}

uint64_t ACT_FigSampleBufferProcessorStopPanoramaCapture()
{
  return MEMORY[0x1E0CF1250]();
}

uint64_t AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout()
{
  return MEMORY[0x1E0C8A1C0]();
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x1E0C8A6A8]();
}

uint64_t AVGestaltGetFloatAnswerWithDefault()
{
  return MEMORY[0x1E0C8A6B0]();
}

uint64_t AVGestaltGetIntegerAnswer()
{
  return MEMORY[0x1E0C8A6B8]();
}

uint64_t AVGestaltGetIntegerAnswerWithDefault()
{
  return MEMORY[0x1E0C8A6C0]();
}

uint64_t AVGestaltGetStringAnswerWithDefault()
{
  return MEMORY[0x1E0C8A6C8]();
}

uint64_t AVSmartStyleSettingsGetSystemStyle()
{
  return MEMORY[0x1E0C8AD00]();
}

uint64_t AVSmartStyleSettingsGetSystemStyleFast()
{
  return MEMORY[0x1E0C8AD08]();
}

uint64_t AVSmartStyleSettingsSetSystemStyle()
{
  return MEMORY[0x1E0C8AD10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
  MEMORY[0x1E0C92148](*(_QWORD *)&inSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x1E0C92158](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

uint64_t AudioServicesStartSystemSound()
{
  return MEMORY[0x1E0C92180]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x1E0C92188]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CAImageQueueCollect()
{
  return MEMORY[0x1E0CD23E8]();
}

uint64_t CAImageQueueCreate()
{
  return MEMORY[0x1E0CD2400]();
}

uint64_t CAImageQueueInsertImage()
{
  return MEMORY[0x1E0CD2478]();
}

uint64_t CAImageQueueRegisterIOSurfaceBuffer()
{
  return MEMORY[0x1E0CD24A0]();
}

uint64_t CAImageQueueUnregisterBuffer()
{
  return MEMORY[0x1E0CD24D0]();
}

uint64_t CAMIsCameraButtonAvailable()
{
  return MEMORY[0x1E0D0D100]();
}

uint64_t CAMStringForOverlayServiceConnectionStatus()
{
  return MEMORY[0x1E0D0D128]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1E0CD25F8](a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x1E0CD2618](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1E0CD2630](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2678](retstr, t, tx, ty, tz);
}

uint64_t CEKClamp()
{
  return MEMORY[0x1E0D0CF10]();
}

uint64_t CEKDebugStringForSmartStylePresetType()
{
  return MEMORY[0x1E0D0CF18]();
}

uint64_t CEKDisplayStringForSemanticStyleMakerPreset()
{
  return MEMORY[0x1E0D0CF20]();
}

uint64_t CEKEdgeInsetsEqualToInsets()
{
  return MEMORY[0x1E0D0CF28]();
}

uint64_t CEKExpandNormalizedContactPoint()
{
  return MEMORY[0x1E0D0CF30]();
}

uint64_t CEKExpandNormalizedPoint()
{
  return MEMORY[0x1E0D0CF38]();
}

uint64_t CEKExpandNormalizedRect()
{
  return MEMORY[0x1E0D0CF40]();
}

uint64_t CEKFontOfSizeAndStyle()
{
  return MEMORY[0x1E0D0CF48]();
}

uint64_t CEKFontOfSizeWeightStyle()
{
  return MEMORY[0x1E0D0CF50]();
}

uint64_t CEKInterpolate()
{
  return MEMORY[0x1E0D0CF58]();
}

uint64_t CEKInterpolateClamped()
{
  return MEMORY[0x1E0D0CF60]();
}

uint64_t CEKIsPadLayoutForView()
{
  return MEMORY[0x1E0D0CF68]();
}

uint64_t CEKIsSFCameraSupportedForLocale()
{
  return MEMORY[0x1E0D0CF78]();
}

uint64_t CEKIsViewInMultitask()
{
  return MEMORY[0x1E0D0CF80]();
}

uint64_t CEKMonospacedStylisticNumeralFontOfSizeAndStyle()
{
  return MEMORY[0x1E0D0CF88]();
}

uint64_t CEKNormalizeRect()
{
  return MEMORY[0x1E0D0CF90]();
}

uint64_t CEKPixelWidthForView()
{
  return MEMORY[0x1E0D0CF98]();
}

uint64_t CEKPortraitOrientedSize()
{
  return MEMORY[0x1E0D0CFA0]();
}

uint64_t CEKProgress()
{
  return MEMORY[0x1E0D0CFA8]();
}

uint64_t CEKProgressClamped()
{
  return MEMORY[0x1E0D0CFB0]();
}

uint64_t CEKRectInsetsInRect()
{
  return MEMORY[0x1E0D0CFB8]();
}

uint64_t CEKRectWithSize()
{
  return MEMORY[0x1E0D0CFC0]();
}

uint64_t CEKSizeCeilToScale()
{
  return MEMORY[0x1E0D0CFC8]();
}

uint64_t CEKSizeMax()
{
  return MEMORY[0x1E0D0CFD0]();
}

uint64_t CEKSizeScale()
{
  return MEMORY[0x1E0D0CFD8]();
}

uint64_t CEKSmartStyleAllPresetTypes()
{
  return MEMORY[0x1E0D0CFE0]();
}

uint64_t CEKSmartStyleIntensitySliderGradientColorsForCastType()
{
  return MEMORY[0x1E0D0CFE8]();
}

uint64_t CEKSmartStyleRepresentativeColorForCastType()
{
  return MEMORY[0x1E0D0CFF0]();
}

uint64_t CEKSmartStyleSystemStylePresetTypes()
{
  return MEMORY[0x1E0D0CFF8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97DF0](alloc, str, attributes);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1E0C97E48](aStr);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x1E0C99608](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C99688](stream, buffer, bufferLength);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x1E0C9BFB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x1E0C9C008](c, auxiliaryInfo);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x1E0C9C048](c);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x1E0C9C200](c);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C560](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
  MEMORY[0x1E0C9C580](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, width);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA80](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x1E0CBC2C8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1E0C9CC40](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x1E0C9CCA8](image);
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x1E0C9CCB0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C0]();
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x1E0CBC3D8](metadata, options);
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC408](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return MEMORY[0x1E0CBC428](metadata, parent, path, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

uint64_t CGImageWriteEXIFJPEGToPath()
{
  return MEMORY[0x1E0CBC668]();
}

uint64_t CGImageWriteEXIFJPEGWithMetadata()
{
  return MEMORY[0x1E0CBC670]();
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x1E0C9D2B8](path1, m, path2);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x1E0C9D300](path, block);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D358](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x1E0C9D7F8](t, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x1E0C9E2F8]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1E0C9E300]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1E0C9EB28]();
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1E0C9ED40]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1E0C9ED48](retstr, clock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9ED80](allocator, target, *(_QWORD *)&attachmentMode);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDE0](desc);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImageFromDictionaryRepresentation()
{
  return MEMORY[0x1E0D08BA8]();
}

uint64_t CMPhotoCompressionSessionAddImage()
{
  return MEMORY[0x1E0D08BF0]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x1E0D08C38]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x1E0D08C40]();
}

uint64_t CMPhotoCompressionSessionOpenEmptyContainer()
{
  return MEMORY[0x1E0D08C78]();
}

uint64_t CMPhotoDecompressionCreateCVPixelBufferForIndex()
{
  return MEMORY[0x1E0D08FA0]();
}

uint64_t CMPhotoReleaseHardwareResources()
{
  return MEMORY[0x1E0D091C0]();
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F528](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1E0CFA238]();
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x1E0CFA3B0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x1E0CA7A60](font, glyph, matrix);
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
  MEMORY[0x1E0CA7DA8](frame, range.location, range.length, origins);
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1E0CA7DB0](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1E0CA7DD8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1E0CA7DE0](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x1E0CA7DF8](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1E0CA7ED8](line);
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return (CTParagraphStyleRef)MEMORY[0x1E0CA7F60](settings, settingCount);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7FB0](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1E0CA7FD0](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
  MEMORY[0x1E0CA7FE0](run, range.location, range.length, buffer);
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
  MEMORY[0x1E0CA8008](run, range.location, range.length, buffer);
}

uint64_t CTRunGetStretchFactors()
{
  return MEMORY[0x1E0CA8028]();
}

CFTypeRef CVBufferGetAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8910](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1E0CA8AD8]();
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

uint64_t CacheDeleteCancelPurge()
{
  return MEMORY[0x1E0D09B38]();
}

uint64_t CacheDeleteCopyAvailableSpaceForVolume()
{
  return MEMORY[0x1E0D09B40]();
}

uint64_t CacheDeleteCopyItemizedPurgeableSpaceWithInfo()
{
  return MEMORY[0x1E0D09B50]();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x1E0D09B80]();
}

uint64_t CacheDeleteRegisterLowDiskFailure()
{
  return MEMORY[0x1E0D09BA8]();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return MEMORY[0x1E0D03998]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBuffer()
{
  return MEMORY[0x1E0CEC8C8]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1E0CEC8D0]();
}

uint64_t FigSampleBufferProcessorGetFigBaseObject()
{
  return MEMORY[0x1E0CC2FF8]();
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1E0CBBB70]();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC68](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x1E0CBBDF8]();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t NUOrientationTransformRect()
{
  return MEMORY[0x1E0D51E20]();
}

uint64_t PFFigCreateCGImageFromImageData()
{
  return MEMORY[0x1E0D75440]();
}

uint64_t PFFigCreateCVPixelBufferFromImageData()
{
  return MEMORY[0x1E0D75448]();
}

uint64_t PFFigJPEGDataFromImage()
{
  return MEMORY[0x1E0D75468]();
}

uint64_t PFReadImageDisplayTimeFromVideoFileAtPath()
{
  return MEMORY[0x1E0D75888]();
}

uint64_t PFReadPairingIdentifierFromVideoAtPath()
{
  return MEMORY[0x1E0D75898]();
}

uint64_t PLCPLSetKeepOriginalsEnabled()
{
  return MEMORY[0x1E0D71CB8]();
}

uint64_t PLCloudPhotoLibraryKeepOriginalsIsEnabled()
{
  return MEMORY[0x1E0D71D20]();
}

uint64_t PLCreateImageFromPreviewImageSurface()
{
  return MEMORY[0x1E0D73D90]();
}

uint64_t PLDebugEnableCoreDataMultithreadedAsserts()
{
  return MEMORY[0x1E0D73E08]();
}

uint64_t PLDegreesForImageOrientation()
{
  return MEMORY[0x1E0D73E20]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x1E0D73E98]();
}

uint64_t PLImageOrientationFromDeviceOrientation()
{
  return MEMORY[0x1E0D740D0]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x1E0D740D8]();
}

uint64_t PLImageOrientationIsMirrored()
{
  return MEMORY[0x1E0D740F0]();
}

uint64_t PLIsCPLDataclassEnabled()
{
  return MEMORY[0x1E0D71E48]();
}

uint64_t PLIsCamera()
{
  return MEMORY[0x1E0D74148]();
}

uint64_t PLIsRotatedExifOrientation()
{
  return MEMORY[0x1E0D74270]();
}

uint64_t PLPreviewImageAndDurationForVideoAtPath()
{
  return MEMORY[0x1E0D724B0]();
}

uint64_t PLSensorOrientationFromCaptureOrientation()
{
  return MEMORY[0x1E0D74720]();
}

uint64_t PXPreferencesIsCameraAutoShareEnabled()
{
  return MEMORY[0x1E0D7C6B8]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x1E0DAB950]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return MEMORY[0x1E0DC47E8](*(_QWORD *)&argc, argv, principalClassName, delegateClassName);
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1E0DC4880]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0DC4888]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x1E0DC4940]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x1E0DC4980]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0DC4988]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1E0DC49B8]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1E0DC49C0]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1E0DC4A10]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0DC4BB8]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0DC4C58](image, compressionQuality);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1E0DC4CF0]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1E0DC5208]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0DC5238]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0DC5248]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0DC5250]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1E0DC5258]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0DC5268]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0DC5270]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0DC52B8]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x1E0DC52C0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x1E0DC52D8]();
}

uint64_t UIRectRoundToViewScale()
{
  return MEMORY[0x1E0DC52E0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0DC52F0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UISizeCeilToScale()
{
  return MEMORY[0x1E0DC5390]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1E0DC5398]();
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x1E0CECB88]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x1E0CECB90]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x1E0CECBA8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x1E0CECD28](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _NSStringFromUIPhysicalButton()
{
  return MEMORY[0x1E0DC5688]();
}

uint64_t _NSStringFromUIPhysicalButtonState()
{
  return MEMORY[0x1E0DC5690]();
}

uint64_t _NSStringFromUITouchSenstiveButtonPositionHint()
{
  return MEMORY[0x1E0DC5698]();
}

uint64_t _UIScaleTransformForAspectFitOfSizeInTargetSize()
{
  return MEMORY[0x1E0DC5990]();
}

uint64_t _UIWindowConvertRectFromOrientationToOrientation()
{
  return MEMORY[0x1E0DC5AE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1E0DDFE98]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C83538](__stream, a2, *(_QWORD *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1E0C83588](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t ledger()
{
  return MEMORY[0x1E0C83B58]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t pl_dispatch_after()
{
  return MEMORY[0x1E0D74FE0]();
}

uint64_t pl_dispatch_async()
{
  return MEMORY[0x1E0D74FE8]();
}

uint64_t pl_dispatch_group_notify()
{
  return MEMORY[0x1E0D75008]();
}

uint64_t pl_dispatch_sync()
{
  return MEMORY[0x1E0D75030]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

