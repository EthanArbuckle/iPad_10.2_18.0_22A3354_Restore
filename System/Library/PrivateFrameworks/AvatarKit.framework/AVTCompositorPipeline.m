@implementation AVTCompositorPipeline

- (AVTCompositorPipeline)initWithFunction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  MTLComputePipelineState *pipelineState;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  AVTCompositorPipeline *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  _QWORD *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSArray *bindings;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  AVTCompositorPipeline *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[6];
  _QWORD v64[7];
  _QWORD v65[6];
  _QWORD v66[5];
  _QWORD v67[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  id v73;
  objc_super v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)AVTCompositorPipeline;
  v57 = -[AVTCompositorPipeline init](&v74, sel_init);
  if (v57)
  {
    if (!v4)
      -[AVTCompositorPipeline initWithFunction:].cold.1();
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CC6A78]);
    objc_msgSend(v6, "setComputeFunction:", v4);
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLabel:", v7);

    v72 = 0;
    v73 = 0;
    v54 = v6;
    v55 = v5;
    v8 = objc_msgSend(v5, "newComputePipelineStateWithDescriptor:options:reflection:error:", v6, 1, &v73, &v72);
    v9 = v73;
    v10 = v72;
    pipelineState = v57->_pipelineState;
    v57->_pipelineState = (MTLComputePipelineState *)v8;

    if (!v57->_pipelineState)
    {
      avt_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AVTCompositorPipeline initWithFunction:].cold.19(v4, (uint64_t)v10, v12);

    }
    v52 = v10;
    v56 = v4;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v53 = v9;
    objc_msgSend(v9, "arguments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    v16 = v57;
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v69;
      v58 = v14;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v69 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v20, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("dst"));

          if (!v22)
          {
            objc_msgSend(v20, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("builtin_skinColor"));

            if (v24)
            {
              if (objc_msgSend(v20, "type"))
                -[AVTCompositorPipeline initWithFunction:].cold.5();
              if (objc_msgSend(v20, "bufferDataType") != 6)
                -[AVTCompositorPipeline initWithFunction:].cold.4();
              v16->_isAffectedBySkin = 1;
              v67[0] = MEMORY[0x1E0C809B0];
              v67[1] = 3221225472;
              v67[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke;
              v67[3] = &unk_1EA61D8E8;
              v67[4] = v20;
              v25 = v67;
LABEL_23:
              v28 = (void *)MEMORY[0x1DF0D6F78](v25);
              objc_msgSend(v13, "addObject:", v28);

              continue;
            }
            objc_msgSend(v20, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("builtin_mouthInside"));

            if (v27)
            {
              if (objc_msgSend(v20, "type") != 2)
                -[AVTCompositorPipeline initWithFunction:].cold.6();
              v66[0] = MEMORY[0x1E0C809B0];
              v66[1] = 3221225472;
              v66[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_2;
              v66[3] = &unk_1EA61D8E8;
              v66[4] = v20;
              v25 = v66;
              goto LABEL_23;
            }
            v29 = v13;
            objc_msgSend(v20, "name");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "componentsSeparatedByString:", CFSTR("_"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = objc_msgSend(v31, "count");
            objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = AVTComponentTypeFromString(v33);

            if (v34 == 42)
              -[AVTCompositorPipeline initWithFunction:].cold.7();
            v16->_affectingComponentsMask |= 1 << v34;
            switch(v32)
            {
              case 3:
                if (objc_msgSend(v20, "type") != 2)
                  -[AVTCompositorPipeline initWithFunction:].cold.18();
                objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v36, "isEqualToString:", CFSTR("layer")) & 1) == 0)
                  -[AVTCompositorPipeline initWithFunction:].cold.17();

                objc_msgSend(v31, "objectAtIndexedSubscript:", 2);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v59[0] = MEMORY[0x1E0C809B0];
                v59[1] = 3221225472;
                v59[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_6;
                v59[3] = &unk_1EA61D960;
                v61 = v20;
                v62 = v34;
                v60 = v37;
                v38 = v37;
                v39 = (void *)MEMORY[0x1DF0D6F78](v59);
                v13 = v29;
                objc_msgSend(v29, "addObject:", v39);

                break;
              case 2:
                objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v40, "hasPrefix:", CFSTR("color")))
                {
                  if (objc_msgSend(v20, "type"))
                    -[AVTCompositorPipeline initWithFunction:].cold.12();
                  if (objc_msgSend(v20, "bufferDataType") != 6)
                    -[AVTCompositorPipeline initWithFunction:].cold.11();
                  objc_msgSend(v40, "substringFromIndex:", objc_msgSend(CFSTR("color"), "length"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v41, "integerValue");

                  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = AVTPresetCategoryFromString(v43);

                  if (v44 == 40)
                    -[AVTCompositorPipeline initWithFunction:].cold.10();
                  v64[0] = MEMORY[0x1E0C809B0];
                  v64[1] = 3221225472;
                  v64[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_4;
                  v64[3] = &unk_1EA61D938;
                  v45 = v64;
                  v64[5] = v44;
                  v64[6] = v42 - 1;
                }
                else
                {
                  if (!objc_msgSend(v40, "isEqualToString:", CFSTR("uvRemapping")))
                    -[AVTCompositorPipeline initWithFunction:].cold.16();
                  if (objc_msgSend(v20, "type"))
                    -[AVTCompositorPipeline initWithFunction:].cold.15();
                  if (objc_msgSend(v20, "bufferDataType") != 1)
                    -[AVTCompositorPipeline initWithFunction:].cold.14();
                  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = AVTPresetCategoryFromString(v46);

                  if (v47 == 40)
                    -[AVTCompositorPipeline initWithFunction:].cold.13();
                  v63[0] = MEMORY[0x1E0C809B0];
                  v63[1] = 3221225472;
                  v63[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_5;
                  v63[3] = &unk_1EA61D910;
                  v45 = v63;
                  v63[5] = v34;
                }
                v45[4] = v20;
                v48 = (void *)MEMORY[0x1DF0D6F78]();
                objc_msgSend(v29, "addObject:", v48);

                v13 = v29;
                break;
              case 1:
                if (objc_msgSend(v20, "type") != 2)
                  -[AVTCompositorPipeline initWithFunction:].cold.9();
                v13 = v29;
                v65[0] = MEMORY[0x1E0C809B0];
                v65[1] = 3221225472;
                v65[2] = __42__AVTCompositorPipeline_initWithFunction___block_invoke_3;
                v65[3] = &unk_1EA61D910;
                v65[4] = v20;
                v65[5] = v34;
                v35 = (void *)MEMORY[0x1DF0D6F78](v65);
                objc_msgSend(v29, "addObject:", v35);

                goto LABEL_45;
              default:
                -[AVTCompositorPipeline initWithFunction:].cold.8();
            }
            v16 = v57;
LABEL_45:

            v14 = v58;
            continue;
          }
          if (objc_msgSend(v20, "type") != 2)
            -[AVTCompositorPipeline initWithFunction:].cold.3();
          if (objc_msgSend(v20, "index"))
            -[AVTCompositorPipeline initWithFunction:].cold.2();
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      }
      while (v17);
    }

    v49 = objc_msgSend(v13, "copy");
    bindings = v16->_bindings;
    v16->_bindings = (NSArray *)v49;

    v4 = v56;
  }

  return v57;
}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  const char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v6 = a2;
  objc_msgSend(a4, "skinColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v9 = AVTGetColorComponents(v7, v8);
  v10 = v9;

  v11 = v10;
  objc_msgSend(v6, "setBytes:length:atIndex:", &v11, 16, objc_msgSend(*(id *)(a1 + 32), "index"));

}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  char v18;

  v8 = a5;
  v9 = a3;
  v10 = a2;
  +[AVTResourceLocator sharedResourceLocator]();
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v11, (uint64_t)CFSTR("mouthInside"), (uint64_t)CFSTR("heic"), (uint64_t)CFSTR("textures"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "cachedTextureWithURL:token:didFallbackToDefaultTexture:", v13, &v17, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v17;
  v16 = 0;
  if (!v18)
  {
    v16 = v14;
    if (v15)
    {
      objc_msgSend(v8, "addObject:", v15);
      v16 = v14;
    }
  }
  objc_msgSend(v10, "setTexture:atIndex:", v16, objc_msgSend(*(id *)(a1 + 32), "index"));

}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  char v19;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  objc_msgSend(a4, "componentInstanceForType:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v10, "cachedTextureWithURL:token:didFallbackToDefaultTexture:", v14, &v18, &v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;

    v17 = 0;
    if (!v19)
    {
      v17 = v15;
      if (v16)
      {
        objc_msgSend(v11, "addObject:", v16);
        v17 = v15;
      }
    }
    objc_msgSend(v9, "setTexture:atIndex:", v17, objc_msgSend(*(id *)(a1 + 32), "index"));

  }
  else
  {
    objc_msgSend(v9, "setTexture:atIndex:", 0, objc_msgSend(*(id *)(a1 + 32), "index"));
  }

}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  objc_msgSend(a4, "colorPresetForCategory:colorIndex:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "baseColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v12 = AVTGetColorComponents(v10, v11);
  v13 = v12;

  v14 = v13;
  objc_msgSend(v8, "setBytes:length:atIndex:", &v14, 16, objc_msgSend(*(id *)(a1 + 32), "index"));

}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(a4, "componentInstanceForType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0u;
  v11 = 0u;
  if (v8)
  {
    objc_msgSend(v8, "uvRemappingInfo", v10, v11);
  }
  else
  {
    *((_QWORD *)&v10 + 1) = 1065353216;
    v11 = 0x3F80000000000000uLL;
  }
  objc_msgSend(v7, "setBytes:length:atIndex:", &v10, 32, objc_msgSend(*(id *)(a1 + 32), "index", v10, v11));

}

void __42__AVTCompositorPipeline_initWithFunction___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  char v19;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  objc_msgSend(a4, "componentInstanceForType:", *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetImageWithLayerNamed:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v10, "cachedTextureWithURL:token:didFallbackToDefaultTexture:", v14, &v18, &v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;

    v17 = 0;
    if (!v19)
    {
      v17 = v15;
      if (v16)
      {
        objc_msgSend(v11, "addObject:", v16);
        v17 = v15;
      }
    }
    objc_msgSend(v9, "setTexture:atIndex:", v17, objc_msgSend(*(id *)(a1 + 40), "index"));

  }
  else
  {
    objc_msgSend(v9, "setTexture:atIndex:", 0, objc_msgSend(*(id *)(a1 + 40), "index"));
  }

}

- (void)compositeTexture:(id)a3 forMemoji:(id)a4 considerSkin:(BOOL)a5 componentsToConsider:(unint64_t)a6 computeCommandHandler:(id)a7 blitCommandHandler:(id)a8 completionHandler:(id)a9 helper:(id)a10 helperTokens:(id)a11
{
  id v17;
  id v18;
  void (**v19)(id, _QWORD *);
  void (**v20)(id, _QWORD *);
  void (**v21)(id, _QWORD *);
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;

  v17 = a3;
  v18 = a4;
  v19 = (void (**)(id, _QWORD *))a7;
  v20 = (void (**)(id, _QWORD *))a8;
  v21 = (void (**)(id, _QWORD *))a9;
  v22 = a10;
  v23 = a11;
  if (self->_isAffectedBySkin && a5
    || (self->_affectingComponentsMask & a6) != 0
    || self->_shouldCompositeAgainDueToGPUError)
  {
    v24 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke;
    v31[3] = &unk_1EA61D988;
    v31[4] = self;
    v32 = v22;
    v33 = v18;
    v34 = v23;
    v25 = v17;
    v35 = v25;
    v19[2](v19, v31);
    if ((unint64_t)objc_msgSend(v25, "mipmapLevelCount") >= 2)
    {
      v29[0] = v24;
      v29[1] = 3221225472;
      v29[2] = __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke_2;
      v29[3] = &unk_1EA61D9B0;
      v30 = v25;
      v20[2](v20, v29);

    }
    objc_initWeak(&location, self);
    v26[0] = v24;
    v26[1] = 3221225472;
    v26[2] = __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke_3;
    v26[3] = &unk_1EA61D9D8;
    objc_copyWeak(&v27, &location);
    v21[2](v21, v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
}

void __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "threadExecutionWidth");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "maxTotalThreadsPerThreadgroup");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "setComputePipelineState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v3, "setTexture:atIndex:", *(_QWORD *)(a1 + 64), 0);
  objc_msgSend(v3, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = AVTMTLDeviceSupportsNonUniformThreadgroupSize(v11, v12);

  if (v13)
  {
    v14 = v5 / v4;
    v15 = objc_msgSend(*(id *)(a1 + 64), "width");
    v16 = objc_msgSend(*(id *)(a1 + 64), "height");
    v28 = v15;
    v29 = v16;
    v30 = 1;
    v25 = v4;
    v26 = v14;
    v27 = 1;
    objc_msgSend(v3, "dispatchThreads:threadsPerThreadgroup:", &v28, &v25);
  }
  else
  {
    v17 = objc_msgSend(*(id *)(a1 + 64), "width");
    if (v4 >= v17)
      v18 = v17;
    else
      v18 = v4;
    v19 = objc_msgSend(*(id *)(a1 + 64), "height");
    if (v4 >= v19)
      v20 = v19;
    else
      v20 = v4;
    do
    {
      v21 = v20;
      v22 = v20 * v18;
      v20 >>= 1;
    }
    while (v22 > v5);
    v23 = v18 + objc_msgSend(*(id *)(a1 + 64), "width") - 1;
    v24 = *(void **)(a1 + 64);
    v28 = v23 / v18;
    v29 = (v21 + objc_msgSend(v24, "height") - 1) / v21;
    v30 = 1;
    v25 = v18;
    v26 = v21;
    v27 = 1;
    objc_msgSend(v3, "dispatchThreadgroups:threadsPerThreadgroup:", &v28, &v25);
  }

}

uint64_t __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "generateMipmapsForTexture:", *(_QWORD *)(a1 + 32));
}

void __165__AVTCompositorPipeline_compositeTexture_forMemoji_considerSkin_componentsToConsider_computeCommandHandler_blitCommandHandler_completionHandler_helper_helperTokens___block_invoke_3(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;

  if (objc_msgSend(a2, "status") != 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
      WeakRetained[9] = 1;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
}

- (void)initWithFunction:.cold.1()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 54, "function");
}

- (void)initWithFunction:.cold.2()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 77, "argument.index == 0");
}

- (void)initWithFunction:.cold.3()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 76, "argument.type == MTLArgumentTypeTexture");
}

- (void)initWithFunction:.cold.4()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 83, "argument.bufferDataType == MTLDataTypeFloat4");
}

- (void)initWithFunction:.cold.5()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 82, "argument.type == MTLArgumentTypeBuffer");
}

- (void)initWithFunction:.cold.6()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 97, "argument.type == MTLArgumentTypeTexture");
}

- (void)initWithFunction:.cold.7()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 123, "componentType != AVTComponentTypeNone");
}

- (void)initWithFunction:.cold.8()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 233, "0");
}

- (void)initWithFunction:.cold.9()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 127, "argument.type == MTLArgumentTypeTexture");
}

- (void)initWithFunction:.cold.10()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 165, "category != AVTPresetCategoryNone");
}

- (void)initWithFunction:.cold.11()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 160, "argument.bufferDataType == MTLDataTypeFloat4");
}

- (void)initWithFunction:.cold.12()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 159, "argument.type == MTLArgumentTypeBuffer");
}

- (void)initWithFunction:.cold.13()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 184, "category != AVTPresetCategoryNone");
}

- (void)initWithFunction:.cold.14()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 181, "argument.bufferDataType == MTLDataTypeStruct");
}

- (void)initWithFunction:.cold.15()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 180, "argument.type == MTLArgumentTypeBuffer");
}

- (void)initWithFunction:.cold.16()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 199, "0");
}

- (void)initWithFunction:.cold.17()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 205, "[parts[1] isEqualToString:@\"layer\"]");
}

- (void)initWithFunction:.cold.18()
{
  __assert_rtn("-[AVTCompositorPipeline initWithFunction:]", "AVTCompositor.m", 203, "argument.type == MTLArgumentTypeTexture");
}

- (void)initWithFunction:(NSObject *)a3 .cold.19(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1DD1FA000, a3, OS_LOG_TYPE_ERROR, "Error: Error compiling '%@' kernel function: %@", (uint8_t *)&v6, 0x16u);

}

@end
