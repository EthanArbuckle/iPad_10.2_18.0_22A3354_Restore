@implementation BKUIPearlEnrollAnimationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_4);
  return (id)sharedManager_instance;
}

void __48__BKUIPearlEnrollAnimationManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = v0;

}

- (id)gaussianBlurWithRadius:(double)a3 normalizeEdges:(BOOL)a4 hardEdges:(BOOL)a5 quality:(id)a6 intermediateBitDepth:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v11 = (void *)MEMORY[0x1E0CD2780];
  v12 = *MEMORY[0x1E0CD2C88];
  v13 = a7;
  v14 = a6;
  objc_msgSend(v11, "filterWithType:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("inputRadius"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v17, CFSTR("inputNormalizeEdges"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v18, CFSTR("inputHardEdges"));

  objc_msgSend(v15, "setValue:forKey:", v14, CFSTR("inputQuality"));
  objc_msgSend(v15, "setValue:forKeyPath:", v13, CFSTR("inputIntermediateBitDepth"));

  return v15;
}

- (id)gaussianBlurWithRadius:(double)a3
{
  return -[BKUIPearlEnrollAnimationManager gaussianBlurWithRadius:normalizeEdges:hardEdges:quality:intermediateBitDepth:](self, "gaussianBlurWithRadius:normalizeEdges:hardEdges:quality:intermediateBitDepth:", 0, 0, CFSTR("default"), CFSTR("default"), a3);
}

- (void)runBasicAnimationOnLayer:(id)a3 withDuration:(double)a4 keyPath:(id)a5 fromValue:(id)a6 toValue:(id)a7 removedOnCompletion:(BOOL)a8 timingFunction:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  BOOL v37;

  v16 = a3;
  v17 = a9;
  v18 = a10;
  v19 = (void *)MEMORY[0x1E0CB3A28];
  v20 = a7;
  v21 = a6;
  v22 = a5;
  objc_msgSend(v19, "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[CADisplayLink bkui_enableHighFrameRate]((uint64_t)v25);
  objc_msgSend(v25, "setDuration:", a4);
  objc_msgSend(v25, "setFromValue:", v21);

  objc_msgSend(v25, "setToValue:", v20);
  objc_msgSend(v25, "setRemovedOnCompletion:", 0);
  objc_msgSend(v25, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v25, "setDelegate:", self);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTimingFunction:", v26);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __145__BKUIPearlEnrollAnimationManager_runBasicAnimationOnLayer_withDuration_keyPath_fromValue_toValue_removedOnCompletion_timingFunction_completion___block_invoke;
  aBlock[3] = &unk_1EA2804B8;
  v35 = v24;
  v36 = v18;
  v37 = a8;
  v34 = v16;
  v27 = v24;
  v28 = v16;
  v29 = v18;
  v30 = _Block_copy(aBlock);
  v31 = _Block_copy(v30);
  objc_msgSend(v25, "setValue:forKey:", v31, CFSTR("PSAnimationCompletion"));

  objc_msgSend(v28, "addAnimation:forKey:", v25, v27);
}

uint64_t __145__BKUIPearlEnrollAnimationManager_runBasicAnimationOnLayer_withDuration_keyPath_fromValue_toValue_removedOnCompletion_timingFunction_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "removeAnimationForKey:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**v4)(_QWORD);
  id v5;

  v5 = a3;
  objc_msgSend(v5, "valueForKey:", CFSTR("PSAnimationCompletion"));
  v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("PSAnimationCompletion"));
    v4[2](v4);
  }

}

- (void)transitionTo:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v10);

  objc_msgSend(v7, "setType:", CFSTR("push"));
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceLayoutDirection");

  objc_msgSend(v7, "setDuration:", 0.400000006);
  if (v12 == 1)
    v13 = CFSTR("fromLeft");
  else
    v13 = CFSTR("fromRight");
  objc_msgSend(v7, "setSubtype:", v13);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    v18 = *MEMORY[0x1E0CD3168];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v20, "layer", (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeAllAnimations");

        objc_msgSend(v20, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAnimation:forKey:", v7, v18);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

@end
