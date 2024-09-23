@implementation MapsUIUtilities

+ (void)performOnMainIfNecessary:(id)a3
{
  void (**v3)(_QWORD);
  _QWORD block[4];
  void (**v5)(_QWORD);

  v3 = (void (**)(_QWORD))a3;
  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v3[2](v3);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__MapsUIUtilities_performOnMainIfNecessary___block_invoke;
      block[3] = &unk_1E2E017C8;
      v5 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __44__MapsUIUtilities_performOnMainIfNecessary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isMapsProcess
{
  return objc_msgSend(a1, "isInApplicationContext:", 1);
}

+ (BOOL)isSiriProcess
{
  return objc_msgSend(a1, "isInApplicationContext:", 2);
}

+ (BOOL)isSpotlightProcess
{
  return objc_msgSend(a1, "isInApplicationContext:", 3);
}

+ (BOOL)isSafariProcess
{
  return objc_msgSend(a1, "isInApplicationContext:", 4);
}

+ (BOOL)isDataDetectorsProcess
{
  return objc_msgSend(a1, "isInApplicationContext:", 5);
}

+ (BOOL)isParsecProcess
{
  if ((objc_msgSend(a1, "isSiriProcess") & 1) != 0
    || (objc_msgSend(a1, "isSpotlightProcess") & 1) != 0
    || (objc_msgSend(a1, "isSafariProcess") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isDataDetectorsProcess");
  }
}

+ (BOOL)isInApplicationContext:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifierForContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v6, "isEqualToString:", v7);

  return (char)a1;
}

+ (id)bundleIdentifierForContext:(unint64_t)a3
{
  id result;

  switch(a3)
  {
    case 1uLL:
      result = (id)*MEMORY[0x1E0D26D08];
      break;
    case 2uLL:
      result = CFSTR("com.apple.siri");
      break;
    case 3uLL:
      result = CFSTR("com.apple.Spotlight");
      break;
    case 4uLL:
      result = CFSTR("com.apple.mobilesafari");
      break;
    case 5uLL:
      result = CFSTR("com.apple.datadetectors.DDActionsService");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)deviceIsLockedAndNeedsPasscode
{
  SBSGetScreenLockStatus();
  return 0;
}

+ (void)checkDeviceLockStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    if (qword_1ED01B6B8 != -1)
      dispatch_once(&qword_1ED01B6B8, &__block_literal_global_50);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke_2;
    v8[3] = &unk_1E2E03490;
    v10 = a1;
    v9 = v4;
    v5 = _Block_copy(v8);
    v6 = v5;
    if (_MergedGlobals_135)
    {
      dispatch_get_global_queue(25, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v7, v6);

    }
    else
    {
      (*((void (**)(void *))v5 + 2))(v5);
    }

  }
}

BOOL __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke()
{
  _BOOL8 result;

  result = +[MapsUIUtilities isSpotlightProcess](MapsUIUtilities, "isSpotlightProcess");
  _MergedGlobals_135 = result;
  return result;
}

void __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  char v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = objc_msgSend(*(id *)(a1 + 40), "deviceIsLockedAndNeedsPasscode");
  if (_MergedGlobals_135)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke_3;
    v4[3] = &unk_1E2E05118;
    v3 = *(void **)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    v6 = v2;
    objc_msgSend(v3, "performOnMainIfNecessary:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (void)resizeImageIfNeeded:(id)a3 toFrameSize:(CGSize)a4 displayScale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[4];
  id v31;
  void (**v32)(_QWORD, _QWORD);
  id v33;
  _QWORD v34[4];
  id v35;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD))v12;
  if (v11)
  {
    v14 = width * a5;
    v15 = height * a5;
    objc_msgSend(v11, "size");
    v17 = v16;
    objc_msgSend(v11, "size");
    v19 = v18;
    objc_msgSend(v11, "size");
    if (v17 >= v19)
      v22 = v21 / v15;
    else
      v22 = v20 / v14;
    objc_msgSend(v11, "size");
    v25 = v24;
    objc_msgSend(v11, "size");
    v27 = v26;
    objc_msgSend(v11, "size");
    if (v28 <= v14)
    {
      objc_msgSend(v11, "size");
      if (v29 <= v15)
      {
        ((void (**)(_QWORD, id))v13)[2](v13, v11);
        goto LABEL_10;
      }
    }
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_2;
    v30[3] = &unk_1E2E05140;
    v33 = a1;
    v32 = v13;
    v31 = v11;
    objc_msgSend(v31, "_mapsui_prepareThumbnailOfSize:completionHandler:", v30, v25 / v22, v27 / v22);

    v23 = v32;
  }
  else
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke;
    v34[3] = &unk_1E2E017C8;
    v35 = v12;
    objc_msgSend(a1, "performOnMainIfNecessary:", v34);
    v23 = v35;
  }

LABEL_10:
}

uint64_t __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_3;
  v6[3] = &unk_1E2E02558;
  v4 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "performOnMainIfNecessary:", v6);

}

uint64_t __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  v3 = a1[4];
  if (!v3)
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

@end
