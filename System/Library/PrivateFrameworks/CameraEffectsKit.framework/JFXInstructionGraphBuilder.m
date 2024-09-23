@implementation JFXInstructionGraphBuilder

- (JFXInstructionGraphBuilder)initWithOutputSize:(CGSize)a3 frameSize:(CGSize)a4 outputColorSpace:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  id v11;
  JFXInstructionGraphBuilder *v12;
  JFXInstructionGraphBuilder *v13;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)JFXInstructionGraphBuilder;
  v12 = -[JFXInstructionGraphBuilder init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_renderingIntent = 0;
    v12->_outputSize.width = v9;
    v12->_outputSize.height = v8;
    v12->_frameSize.width = width;
    v12->_frameSize.height = height;
    objc_storeStrong((id *)&v12->_outputColorSpace, a5);
  }

  return v13;
}

- (id)sourceNodeForMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 transformAnimation:(id)a6 transformAnimationContentMode:(int)a7 presentationTimeRange:(id *)a8 mediaScale:(double)a9 playableAspectRatio:(int64_t)a10 playableAspectRatioPreservationMode:(int64_t)a11
{
  uint64_t v12;
  uint64_t v14;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v12 = *(_QWORD *)&a7;
  v14 = *(_QWORD *)&a5;
  v17 = a3;
  v18 = a6;
  v19 = objc_msgSend(v17, "mediaType");
  if (v19 == 2)
  {
    v22 = *(_OWORD *)&a4->c;
    v27 = *(_OWORD *)&a4->a;
    v28 = v22;
    v29 = *(_OWORD *)&a4->tx;
    v23 = *(_OWORD *)&a8->var0.var3;
    v26[0] = *(_OWORD *)&a8->var0.var0;
    v26[1] = v23;
    v26[2] = *(_OWORD *)&a8->var1.var1;
    -[JFXInstructionGraphBuilder _sourceNodeForStillMediaItem:sourceTransform:transformAnimation:transformAnimationContentMode:presentationRange:](self, "_sourceNodeForStillMediaItem:sourceTransform:transformAnimation:transformAnimationContentMode:presentationRange:", v17, &v27, v18, v12, v26);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v19 != 1)
    {
      v24 = 0;
      goto LABEL_7;
    }
    v20 = *(_OWORD *)&a4->c;
    v27 = *(_OWORD *)&a4->a;
    v28 = v20;
    v29 = *(_OWORD *)&a4->tx;
    -[JFXInstructionGraphBuilder _sourceNodeForVideoMediaItem:sourceTransform:compositionTrackID:transformAnimation:transformAnimationContentMode:](self, "_sourceNodeForVideoMediaItem:sourceTransform:compositionTrackID:transformAnimation:transformAnimationContentMode:", v17, &v27, v14, v18, v12);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v21;
LABEL_7:

  return v24;
}

- (id)sourceNodeForImageBuffer:(id)a3 sourceTransform:(CGAffineTransform *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  __int128 v8;
  void *v9;
  _OWORD v11[3];

  v5 = (objc_class *)MEMORY[0x24BE79048];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v8;
  v11[2] = *(_OWORD *)&a4->tx;
  v9 = (void *)objc_msgSend(v7, "initWithPVImageBuffer:transform:", v6, v11);

  return v9;
}

- (id)sourceNodeForGeneratorEffect:(id)a3 effectRange:(id *)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v9[3];

  objc_msgSend(a3, "renderEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a4->var0.var3;
  v9[0] = *(_OWORD *)&a4->var0.var0;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v5, "setEffectRange:", v9);
  v7 = (void *)objc_msgSend(MEMORY[0x24BE79040], "newGeneratorNode:", v5);

  return v7;
}

- (id)applyEffectStack:(id)a3 presentationRange:(id *)a4 toInput:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v20[3];
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v10 = v8;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v26;
    v10 = v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isNone") & 1) == 0)
        {
          objc_msgSend(v14, "renderEffect");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "renderEffect");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((a4->var0.var2 & 1) != 0
              && (a4->var1.var2 & 1) != 0
              && !a4->var1.var3
              && (a4->var1.var0 & 0x8000000000000000) == 0)
            {
              if (v14)
              {
                v17 = *(_OWORD *)&a4->var0.var3;
                v21[0] = *(_OWORD *)&a4->var0.var0;
                v21[1] = v17;
                v21[2] = *(_OWORD *)&a4->var1.var1;
                objc_msgSend(v14, "rangeForPresentationRange:", v21);
              }
              else
              {
                v23 = 0u;
                v24 = 0u;
                v22 = 0u;
              }
              v20[0] = v22;
              v20[1] = v23;
              v20[2] = v24;
              objc_msgSend(v16, "setEffectRange:", v20);
            }
            v18 = objc_msgSend(MEMORY[0x24BE79038], "newEffectNodeToFilterInput:effect:", v10, v16);

            v10 = (void *)v18;
          }
        }
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  return v10;
}

- (id)applyEffectStack:(id)a3 toInput:(id)a4
{
  __int128 v4;
  _OWORD v6[3];

  v4 = *(_OWORD *)(MEMORY[0x24BDC0D68] + 16);
  v6[0] = *MEMORY[0x24BDC0D68];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x24BDC0D68] + 32);
  -[JFXInstructionGraphBuilder applyEffectStack:presentationRange:toInput:](self, "applyEffectStack:presentationRange:toInput:", a3, v6, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)blendNodeForClipSourceNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(v4, "setInputNode:forInputID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10), v8 + v10);
        v11 = objc_alloc(MEMORY[0x24BE790B0]);
        LODWORD(v12) = 1.0;
        v13 = (void *)objc_msgSend(v11, "initWithOpacity:mode:", 0, v12);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8 + v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v13, v14);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = (v8 + v10);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(MEMORY[0x24BE79010], "newEffectWithID:", *MEMORY[0x24BE79260]);
  objc_msgSend(v15, "setInspectableProperty:forKey:", v5, *MEMORY[0x24BE79600]);
  objc_msgSend(v4, "setEffect:", v15);

  return v4;
}

- (id)JFX_mediaTransformAnimationForPlayableElement:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _OWORD v14[3];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v5 = a3;
  objc_msgSend(v5, "transformAnimation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    if (!a4)
    {
      objc_msgSend(v5, "transformAnimation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("noPanZoomAnchoring"));

  if ((v11 & 1) != 0)
  {
    v12 = 0;
    goto LABEL_10;
  }
  if (a4)
  {
LABEL_7:
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE790C8]), "initWithLiveTransform:", a4);
    goto LABEL_8;
  }
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  PVTransformAnimationInfoIdentity();
  memset(v14, 0, sizeof(v14));
  v15 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE790C8]), "initWithAnimationInfo:", v14);
LABEL_8:
  v12 = v9;
  if (v9)
    objc_msgSend(v9, "setAspectRatio:", multiplierForAspectRatio(objc_msgSend(v5, "playableAspectRatio")));
LABEL_10:

  return v12;
}

- (id)instructionGraphForPlayableElement:(id)a3 presentationTimeRange:(id *)a4 sourceTransform:(CGAffineTransform *)a5 compositionTrackID:(int)a6 liveTransform:(PVTransformAnimationInfo *)a7 excludingEffectType:(int)a8 customRendererProperties:(id)a9
{
  uint64_t v10;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  __int128 v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  __int128 v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  int v63;
  int v64;
  id v66;
  _OWORD v67[3];
  _OWORD v68[3];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v10 = *(_QWORD *)&a6;
  v77 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v66 = a9;
  -[JFXInstructionGraphBuilder outputSize](self, "outputSize");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v14, "playableMediaSizeWithTransform");
  v20 = v19;
  v22 = v21;
  v23 = objc_msgSend(v14, "playableMediaContentMode");
  v24 = multiplierForAspectRatio(objc_msgSend(v14, "playableAspectRatio"));
  v25 = 1.0;
  v63 = PVViewContentModeFromAspectRatioPreservationMode(objc_msgSend(v14, "playableAspectRatioPreservationMode"));
  if (!v63 || v24 > -0.0000001 && v24 < 0.0000001)
    goto LABEL_16;
  v26 = sizeForAspectRatio(objc_msgSend(v14, "playableAspectRatio"));
  if ((int)v18)
  {
    v28 = (int)v18;
    v29 = (int)v16;
    do
    {
      v30 = v28;
      v28 = v29 % v28;
      v29 = v30;
    }
    while (v28);
  }
  else
  {
    v30 = (int)v16;
  }
  if ((int)v27)
  {
    v31 = (int)v27;
    v32 = (int)v26;
    do
    {
      v33 = v31;
      v31 = v32 % v31;
      v32 = v33;
    }
    while (v31);
  }
  else
  {
    v33 = (int)v26;
  }
  if ((int)v16 / v30 == (int)v26 / v33 && (int)v18 / v30 == (int)v27 / v33)
  {
LABEL_16:
    v64 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "JFX_scaleForMediaSize:mediaContentMode:clipAspectRatio:outputSize:outputContentMode:", v23, 14, v20, v22, v24, v16, v18);
    v25 = v34;
    v64 = 1;
  }
  -[JFXInstructionGraphBuilder JFX_mediaTransformAnimationForPlayableElement:liveTransform:](self, "JFX_mediaTransformAnimationForPlayableElement:liveTransform:", v14, a7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playableEffectsOfType:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v73 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "setTransformAnimation:", v35);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    }
    while (v38);
  }
  objc_msgSend(v14, "mediaItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v14, "playableAspectRatio");
  v43 = objc_msgSend(v14, "playableAspectRatioPreservationMode");
  v44 = *(_OWORD *)&a5->c;
  v69 = *(_OWORD *)&a5->a;
  v70 = v44;
  v71 = *(_OWORD *)&a5->tx;
  v45 = *(_OWORD *)&a4->var0.var3;
  v68[0] = *(_OWORD *)&a4->var0.var0;
  v68[1] = v45;
  v68[2] = *(_OWORD *)&a4->var1.var1;
  -[JFXInstructionGraphBuilder sourceNodeForMediaItem:sourceTransform:compositionTrackID:transformAnimation:transformAnimationContentMode:presentationTimeRange:mediaScale:playableAspectRatio:playableAspectRatioPreservationMode:](self, "sourceNodeForMediaItem:sourceTransform:compositionTrackID:transformAnimation:transformAnimationContentMode:presentationTimeRange:mediaScale:playableAspectRatio:playableAspectRatioPreservationMode:", v41, &v69, v10, v35, 14, v68, v25, v42, v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v46;
  if (!objc_msgSend(v14, "shouldRenderVideoAsBlack"))
  {
    v53 = v47;
    if (v64)
    {
      objc_msgSend((id)objc_opt_class(), "JFX_transformNode:scale:", v47, v25);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[JFXInstructionGraphBuilder JFX_applyCustomRenderingPropertiesToInputNode:customRendererProperties:transformAnimation:transformAnimationContentMode:mediaScale:](self, "JFX_applyCustomRenderingPropertiesToInputNode:customRendererProperties:transformAnimation:transformAnimationContentMode:mediaScale:", v53, v66, v35, 14, v25);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (a8)
      objc_msgSend(v14, "playableEffectStackExcludingType:");
    else
      objc_msgSend(v14, "playableEffectStack");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = *(_OWORD *)&a4->var0.var3;
    v69 = *(_OWORD *)&a4->var0.var0;
    v70 = v55;
    v71 = *(_OWORD *)&a4->var1.var1;
    -[JFXInstructionGraphBuilder applyEffectStack:presentationRange:toInput:](self, "applyEffectStack:presentationRange:toInput:", v48, &v69, v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v64)
      goto LABEL_71;
    v57 = v18 * v24;
    v58 = v16;
    if (!v63)
      goto LABEL_50;
    if (v63 > 2)
    {
      v58 = v16;
      if (v63 != 3)
      {
        v58 = v16;
        if (v63 != 13)
        {
          v58 = v24;
          if (v63 == 14)
            v58 = v18 * v24;
        }
      }
      goto LABEL_50;
    }
    if (v63 == 1)
    {
      if (v16 <= v18)
      {
        v59 = v18;
        if (v57 < v16)
          v59 = v16 / v24;
      }
      else
      {
        v59 = v16 / v24;
        if (v16 / v24 < v18)
          v59 = v18;
      }
    }
    else
    {
      v58 = v24;
      if (v63 != 2)
      {
LABEL_50:
        objc_msgSend((id)objc_opt_class(), "JFX_transformNode:scale:", v56, v58 / v57);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v63)
          goto LABEL_56;
        v61 = 1.0;
        if (v63 <= 2)
        {
          if (v63 == 1)
          {
            if (v16 <= v18)
            {
              v61 = v18;
              if (v57 < v16)
                v61 = v16 / v24;
            }
            else
            {
              v61 = v16 / v24;
              if (v16 / v24 < v18)
                v61 = v18;
            }
          }
          else
          {
            if (v63 != 2)
              goto LABEL_70;
            if (v16 / v24 <= v18)
              v61 = v16 / v24;
            else
              v61 = v18;
          }
          v24 = v24 * v61;
          goto LABEL_70;
        }
        switch(v63)
        {
          case 3:
LABEL_56:
            v24 = v16;
            break;
          case 13:
            v61 = v16 / v24;
            v24 = v16;
            goto LABEL_70;
          case 14:
            v24 = v18 * v24;
            break;
          default:
LABEL_70:
            objc_msgSend((id)objc_opt_class(), "JFX_maskNode:maskRect:basisSize:", v60, (v16 - v24) * 0.5 + 0.0, (v18 - v61) * 0.5 + 0.0, v24, v61, v16, v18);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_71:
            v52 = v56;
            v51 = v52;
            goto LABEL_72;
        }
        v61 = v18;
        goto LABEL_70;
      }
      v59 = v16 / v24;
      if (v16 / v24 > v18)
        v59 = v18;
    }
    v58 = v24 * v59;
    goto LABEL_50;
  }
  v48 = (void *)objc_msgSend(MEMORY[0x24BE79010], "newEffectWithID:", *MEMORY[0x24BE792A0]);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setInspectableProperty:forKey:", v49, *MEMORY[0x24BE79670]);

  v50 = *(_OWORD *)&a4->var0.var3;
  v67[0] = *(_OWORD *)&a4->var0.var0;
  v67[1] = v50;
  v67[2] = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v48, "setEffectRange:", v67);
  v51 = (void *)objc_msgSend(MEMORY[0x24BE79038], "newEffectNodeToFilterInput:effect:", v47, v48);
  v52 = v47;
LABEL_72:

  return v51;
}

+ (double)JFX_scaleForMediaSize:(CGSize)a3 mediaContentMode:(int)a4 clipAspectRatio:(double)a5 outputSize:(CGSize)a6 outputContentMode:(int)a7
{
  double v7;
  double width;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v7 = 1.0;
  if (a4 == a7 || !a4 || !a7)
    return v7;
  if (a4 <= 2)
  {
    if (a4 == 1)
    {
      if (a6.width <= a6.height)
      {
        v13 = a6.height / a3.height;
        if (a3.width * (a6.height / a3.height) < a6.width)
          v13 = a6.width / a3.width;
      }
      else
      {
        v13 = a6.width / a3.width;
        if (a3.height * (a6.width / a3.width) < a6.height)
          v13 = a6.height / a3.height;
      }
      a3.width = a3.width * v13;
      a3.height = a3.height * v13;
      goto LABEL_27;
    }
    if (a4 == 2)
    {
      if (a3.height * (a6.width / a3.width) <= a6.height)
        v10 = a6.width / a3.width;
      else
        v10 = a6.height / a3.height;
      v11 = a3.width * v10;
      v12 = a3.height * v10;
      if (v11 <= a3.height * v10)
      {
        height = a3.height * v10;
        if (v12 * a5 < v11)
          height = v11 / a5;
      }
      else
      {
        height = v11 / a5;
        if (v11 / a5 < v12)
          height = v12;
      }
      goto LABEL_30;
    }
  }
  else
  {
    switch(a4)
    {
      case 3:
        height = a6.height;
        width = a6.width;
        goto LABEL_31;
      case 13:
        width = a6.width;
        height = a6.width / a5;
        goto LABEL_31;
      case 14:
        width = a6.height * a5;
        height = a6.height;
        goto LABEL_31;
    }
  }
  height = 1.0;
  width = a5;
  if ((a4 - 4) >= 9)
  {
LABEL_27:
    v14 = a3.width / a5;
    if (v14 <= a3.height)
      height = v14;
    else
      height = a3.height;
LABEL_30:
    width = height * a5;
  }
LABEL_31:
  if (a7 <= 2)
  {
    if (a7 == 1)
    {
      if (a6.width <= a6.height)
      {
        v15 = a6.height;
        if (a6.height * a5 < a6.width)
          v15 = a6.width / a5;
      }
      else
      {
        v15 = a6.width / a5;
        if (a6.width / a5 < a6.height)
          v15 = a6.height;
      }
    }
    else
    {
      if (a7 != 2)
        return a5 / width;
      v15 = a6.width / a5;
      if (a6.width / a5 > a6.height)
        v15 = a6.height;
    }
    a5 = v15 * a5;
    return a5 / width;
  }
  if (a7 == 3)
  {
    a5 = a6.width;
    return a5 / width;
  }
  if (a7 != 13)
  {
    if (a7 == 14)
      a5 = a6.height * a5;
    return a5 / width;
  }
  return a6.width / a5 / height;
}

+ (id)JFX_transformNode:(id)a3 scale:(double)a4
{
  id v5;
  void *v6;
  id v7;
  CGAffineTransform v9;
  CGAffineTransform v10;

  v5 = a3;
  v6 = v5;
  if (fabs(a4 + -1.0) >= 0.0001)
  {
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, a4, a4);
    v9 = v10;
    v7 = (id)objc_msgSend(MEMORY[0x24BE79070], "newTransformNode:transform:", v6, &v9);
    objc_msgSend(v7, "setIsDebugDrawingEnabled:", JFX_isDrawInstructionGraphNodesEnabled());
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

+ (id)JFX_maskNode:(id)a3 maskRect:(CGRect)a4 basisSize:(CGSize)a5
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BE79058], "newMaskNode:normalizedMaskRect:", a3, a4.origin.x / a5.width, a4.origin.y / a5.height, a4.size.width / a5.width, a4.size.height / a5.height);
  objc_msgSend(v5, "setIsDebugDrawingEnabled:", JFX_isDrawInstructionGraphNodesEnabled());
  return v5;
}

- (id)JFX_applyCustomRenderingPropertiesToInputNode:(id)a3 customRendererProperties:(id)a4 transformAnimation:(id)a5 transformAnimationContentMode:(int)a6 mediaScale:(double)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];

  v8 = *(_QWORD *)&a6;
  v36[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v12;
  v16 = v15;
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15;
    if (v17)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "metadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_RenderSize"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "CGSizeValue");
      v22 = v21;
      v24 = v23;

      v25 = (void *)MEMORY[0x24BE79060];
      objc_msgSend(v18, "renderingDelegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "metadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v25, "newSourceCompositeNodeWithDelegate:inputs:userContext:outputSize:outputFormat:", v26, 0, v27, 1111970369, v22, v24);

      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      -[JFXInstructionGraphBuilder JFX_calculateCompositeNodeTransformForCropWithCompositeNodeOutputSize:mediaScale:](self, "JFX_calculateCompositeNodeTransformForCropWithCompositeNodeOutputSize:mediaScale:", v22, v24, a7);
      v32[0] = v33;
      v32[1] = v34;
      v32[2] = v35;
      objc_msgSend(v28, "setTransform:", v32);
      objc_msgSend(MEMORY[0x24BE78FF8], "sRGBColorSpace");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setColorSpace:", v29);

      objc_msgSend(v28, "setTransformAnimationContentMode:", v8);
      objc_msgSend(v28, "setTransformAnimation:", v14);
      v36[0] = v15;
      v36[1] = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXInstructionGraphBuilder blendNodeForClipSourceNodes:](self, "blendNodeForClipSourceNodes:", v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v16;
}

- (CGAffineTransform)JFX_calculateCompositeNodeTransformForCropWithCompositeNodeOutputSize:(SEL)a3 mediaScale:(CGSize)a4
{
  double height;
  double width;
  uint64_t v10;
  CGAffineTransform *result;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGAffineTransform t1;
  uint64_t v29;
  CGAffineTransform v30;
  CGAffineTransform t2;
  CGAffineTransform v32;
  uint64_t v33;
  CGAffineTransform v34;

  height = a4.height;
  width = a4.width;
  v10 = MEMORY[0x24BDBD8B8];
  v26 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v27 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v26;
  v25 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)&retstr->tx = v25;
  result = (CGAffineTransform *)-[JFXInstructionGraphBuilder outputSize](self, "outputSize");
  v14 = v13;
  v15 = v12;
  v16 = v13 == width && v12 == height;
  if (!v16 || fabs(a5 + -1.0) >= 0.0001)
  {
    -[JFXInstructionGraphBuilder outputSize](self, "outputSize");
    v18 = v17 / height;
    -[JFXInstructionGraphBuilder outputSize](self, "outputSize");
    v20 = v19 / width;
    if (v18 >= v20)
      v20 = v18;
    v21 = v20;
    v22 = v21 * a5;
    memset(&v34, 0, sizeof(v34));
    CGAffineTransformMakeScale(&v34, v22, v22);
    CGRectForInnerSizeCenteredInOuterSize(v14, v15, height * v34.c + v34.a * width);
    v33 = 0;
    memset(&v32, 0, sizeof(v32));
    PVTransformAnimationInfoForLiveCapture();
    *(_OWORD *)&t1.a = v27;
    *(_OWORD *)&t1.c = v26;
    *(_OWORD *)&t1.tx = v25;
    t2 = v34;
    CGAffineTransformConcat(retstr, &t1, &t2);
    t1 = v32;
    v29 = v33;
    CGAffineTransformFromPVAnimInfo();
    v23 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t2.c = v23;
    *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&t1, &t2, &v30);
    v24 = *(_OWORD *)&t1.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&retstr->c = v24;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  }
  return result;
}

- (id)_sourceNodeForVideoMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 transformAnimation:(id)a6 transformAnimationContentMode:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  __int128 v20;
  _OWORD v22[3];

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a5;
  v11 = (void *)MEMORY[0x24BE79068];
  v12 = a6;
  v13 = a3;
  v14 = objc_msgSend(v13, "playableMediaContentMode");
  objc_msgSend(v13, "naturalSize");
  v16 = v15;
  v18 = v17;

  v19 = (void *)objc_msgSend(v11, "newSourceTrackNode:animation:fillMode:clipNaturalSize:", v8, v12, v14, v16, v18);
  v20 = *(_OWORD *)&a4->c;
  v22[0] = *(_OWORD *)&a4->a;
  v22[1] = v20;
  v22[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v19, "setTransform:", v22);
  objc_msgSend(v19, "setTransformAnimationContentMode:", v7);
  return v19;
}

- (id)_sourceNodeForStillMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 transformAnimation:(id)a5 transformAnimationContentMode:(int)a6 presentationRange:(id *)a7
{
  uint64_t v7;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  _OWORD v18[3];

  v7 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "assetURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "mediaState") == 3)
  {
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("trash"));
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79050]), "initWithURL:animation:isExporting:imageDelegate:renderingIntent:fillMode:", v13, v12, self->_renderingIntent == 1, v11, self->_renderingIntent, objc_msgSend(v11, "playableMediaContentMode"));

  v16 = *(_OWORD *)&a4->c;
  v18[0] = *(_OWORD *)&a4->a;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v15, "setTransform:", v18);
  objc_msgSend(v15, "setTransformAnimationContentMode:", v7);

  return v15;
}

- (id)_buildTestXFormAnimation:(id *)a3 baseTransform:(CGAffineTransform *)a4 clipNaturalSize:(CGSize)a5
{
  double height;
  double width;
  void *v9;
  double ty;
  double tx;
  double v12;
  NSObject *v13;
  void *v14;
  int64_t var0;
  int64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CMTimeValue v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  CMTime v31;
  CMTime v32;
  __int128 v33;
  CMTimeRange range;
  uint64_t v35;
  __int128 v36;
  CMTimeEpoch var3;

  height = a5.height;
  width = a5.width;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *(_OWORD *)&a3->var0.var0;
  var3 = a3->var0.var3;
  tx = a4->tx;
  ty = a4->ty;
  v12 = sqrt(a4->d * a4->d + a4->a * a4->a);
  JFXLog_DebugComposition();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[JFXInstructionGraphBuilder _buildTestXFormAnimation:baseTransform:clipNaturalSize:].cold.1(a4, v13);

  *(_OWORD *)&range.start.value = v36;
  range.start.epoch = var3;
  *(double *)&range.duration.value = tx;
  *(double *)&range.duration.timescale = ty;
  *(double *)&range.duration.epoch = v12;
  v35 = 0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPVTransformAnimationInfo:", &range);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v14);
  var0 = a3->var1.var0;
  v16 = a3->var0.var0;
  v17 = *(_OWORD *)&a3->var0.var1;
  memset(&v32, 0, sizeof(v32));
  v18 = *(_OWORD *)&a3->var0.var0;
  v19 = *(_OWORD *)&a3->var0.var3;
  v33 = v17;
  *(_OWORD *)&range.start.value = v18;
  v20 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&range.start.epoch = v19;
  *(_OWORD *)&range.duration.timescale = v20;
  CMTimeRangeGetEnd(&v32, &range);
  v21 = v16 + 1;
  range.start.value = v21;
  *(_OWORD *)&range.start.timescale = v33;
  v31 = v32;
  if (CMTimeCompare(&range.start, &v31) < 0)
  {
    v22 = (double)var0;
    v23 = 0.2 / (double)var0;
    v24 = 0.1 / v22;
    do
    {
      v25 = v21 - a3->var0.var0;
      v26 = ty + (double)v21 * v24;
      v27 = tx + (double)v21 * v24;
      if (height <= width)
        v26 = ty;
      else
        v27 = tx;
      *(_OWORD *)&range.start.timescale = v33;
      range.start.value = v21;
      *(double *)&range.duration.value = v27;
      *(double *)&range.duration.timescale = v26;
      *(double *)&range.duration.epoch = v12 + (double)v25 * v23;
      v35 = 0;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPVTransformAnimationInfo:", &range);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v28);

      range.start.value = ++v21;
      *(_OWORD *)&range.start.timescale = v33;
      v31 = v32;
    }
    while (CMTimeCompare(&range.start, &v31) < 0);
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE790C8]), "initWithAnimation:", v9);

  return v29;
}

- (int)renderingIntent
{
  return self->_renderingIntent;
}

- (void)setRenderingIntent:(int)a3
{
  self->_renderingIntent = a3;
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)frameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_frameSize.width;
  height = self->_frameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PVColorSpace)outputColorSpace
{
  return self->_outputColorSpace;
}

- (void)setOutputColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_outputColorSpace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputColorSpace, 0);
}

- (void)_buildTestXFormAnimation:(_OWORD *)a1 baseTransform:(NSObject *)a2 clipNaturalSize:.cold.1(_OWORD *a1, NSObject *a2)
{
  __int128 v3;
  void *v4;
  CGAffineTransform v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1[1];
  *(_OWORD *)&v5.a = *a1;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = a1[2];
  NSStringFromCGAffineTransform(&v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5.a) = 138412290;
  *(_QWORD *)((char *)&v5.a + 4) = v4;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "newInstructionGraphNodeToShowImageWithClip: clipTransform = %@", (uint8_t *)&v5, 0xCu);

}

@end
