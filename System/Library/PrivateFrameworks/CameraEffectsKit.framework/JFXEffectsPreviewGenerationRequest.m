@implementation JFXEffectsPreviewGenerationRequest

+ (PVTransformAnimationInfo)centerAnimationInfoForOutputSize:(SEL)a3 imageRect:(CGSize)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  PVTransformAnimationInfo *result;

  objc_msgSend((id)objc_opt_class(), "JT_centerRect:aspectRatio:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a4.width / a4.height);
  v7 = v6;
  v9 = v8;
  *(_OWORD *)&retstr->time.value = 0u;
  *(_OWORD *)&retstr->time.epoch = 0u;
  *(_OWORD *)&retstr->translation.y = 0u;
  retstr->rotation = 0.0;
  result = (PVTransformAnimationInfo *)PVTransformAnimationInfoIdentity();
  retstr->translation.x = -v7;
  retstr->translation.y = -v9;
  return result;
}

- (void)centerAnimationInfo
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  _OWORD v9[3];
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  float64x2_t v15[3];

  -[JFXEffectsPreviewGenerationRequest image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  -[JFXEffectsPreviewGenerationRequest userSourceTransform](self, "userSourceTransform");
  CGSizeApplyAffineTransformWithPositiveResult(v15, v5, v7);

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  v8 = (void *)objc_opt_class();
  -[JFXEffectsPreviewGenerationRequest outputSize](self, "outputSize");
  if (v8)
  {
    objc_msgSend(v8, "centerAnimationInfoForOutputSize:imageRect:");
  }
  else
  {
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
  }
  v9[0] = v11;
  v9[1] = v12;
  v9[2] = v13;
  v10 = v14;
  -[JFXEffectsPreviewGenerationRequest setAnimationTransformInfo:](self, "setAnimationTransformInfo:", v9);
}

+ (CGRect)JT_centerRect:(CGRect)result aspectRatio:(double)a4
{
  double height;
  double v5;
  double v6;
  CGFloat v7;

  height = result.size.height;
  if (result.size.width / result.size.height >= a4)
  {
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = result.size.height * a4;
    v5 = (result.size.width - v7) * 0.5;
    result.size.width = v7;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF090];
    result.size.height = result.size.width / a4;
    v6 = (height - result.size.width / a4) * 0.5;
  }
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (JFXEffectsPreviewGenerationRequest)initWithInput:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 frameSize:(CGSize)a6 renderTime:(id *)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v10;
  CGFloat v11;
  id v15;
  id v16;
  JFXEffectsPreviewGenerationRequest *v17;
  JFXEffectsPreviewGenerationRequest *v18;
  JFXEffect *generatorEffect;
  NSArray *pickerPreviewEffectList;
  __int128 v21;
  NSDictionary *customRenderingProperties;
  uint64_t v23;
  __int128 v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  objc_super v30;

  height = a6.height;
  width = a6.width;
  v10 = a5.height;
  v11 = a5.width;
  v15 = a3;
  v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)JFXEffectsPreviewGenerationRequest;
  v17 = -[JFXEffectsPreviewGenerationRequest init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_image, a3);
    generatorEffect = v18->_generatorEffect;
    v18->_generatorEffect = 0;

    v18->_outputSize.width = v11;
    v18->_outputSize.height = v10;
    v18->_frameSize.width = width;
    v18->_frameSize.height = height;
    objc_storeStrong((id *)&v18->_effectStack, a4);
    pickerPreviewEffectList = v18->_pickerPreviewEffectList;
    v18->_pickerPreviewEffectList = 0;

    v21 = *(_OWORD *)&a7->var0;
    v18->_renderTime.epoch = a7->var3;
    *(_OWORD *)&v18->_renderTime.value = v21;
    PVTransformAnimationInfoIdentity();
    *(_OWORD *)&v18->_animationTransformInfo.time.value = v26;
    *(_OWORD *)&v18->_animationTransformInfo.time.epoch = v27;
    *(_OWORD *)&v18->_animationTransformInfo.translation.y = v28;
    v18->_animationTransformInfo.rotation = v29;
    *(_WORD *)&v18->_highQuality = 256;
    v18->_childCode = 0;
    *(_QWORD *)&v18->_priority = 0xFFFFFFFF00000001;
    customRenderingProperties = v18->_customRenderingProperties;
    v18->_customRenderingProperties = 0;

    v23 = MEMORY[0x24BDBD8B8];
    v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v18->_userSourceTransform.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v18->_userSourceTransform.c = v24;
    *(_OWORD *)&v18->_userSourceTransform.tx = *(_OWORD *)(v23 + 32);
  }

  return v18;
}

- (JFXEffectsPreviewGenerationRequest)initWithInput:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 renderTime:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a6;
  return -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:frameSize:renderTime:](self, "initWithInput:effectStack:outputSize:frameSize:renderTime:", a3, a4, &v7, a5.width, a5.height, a5.width, a5.height);
}

- (JFXEffectsPreviewGenerationRequest)initWithInputGenerator:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 frameSize:(CGSize)a6 renderTime:(id *)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v10;
  CGFloat v11;
  id v15;
  id v16;
  JFXEffectsPreviewGenerationRequest *v17;
  JFXEffectsPreviewGenerationRequest *v18;
  PVImageBuffer *image;
  NSArray *pickerPreviewEffectList;
  __int128 v21;
  NSDictionary *customRenderingProperties;
  uint64_t v23;
  __int128 v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  objc_super v30;

  height = a6.height;
  width = a6.width;
  v10 = a5.height;
  v11 = a5.width;
  v15 = a3;
  v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)JFXEffectsPreviewGenerationRequest;
  v17 = -[JFXEffectsPreviewGenerationRequest init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    image = v17->_image;
    v17->_image = 0;

    objc_storeStrong((id *)&v18->_generatorEffect, a3);
    v18->_outputSize.width = v11;
    v18->_outputSize.height = v10;
    v18->_frameSize.width = width;
    v18->_frameSize.height = height;
    objc_storeStrong((id *)&v18->_effectStack, a4);
    pickerPreviewEffectList = v18->_pickerPreviewEffectList;
    v18->_pickerPreviewEffectList = 0;

    v21 = *(_OWORD *)&a7->var0;
    v18->_renderTime.epoch = a7->var3;
    *(_OWORD *)&v18->_renderTime.value = v21;
    PVTransformAnimationInfoIdentity();
    *(_OWORD *)&v18->_animationTransformInfo.time.value = v26;
    *(_OWORD *)&v18->_animationTransformInfo.time.epoch = v27;
    *(_OWORD *)&v18->_animationTransformInfo.translation.y = v28;
    v18->_animationTransformInfo.rotation = v29;
    *(_WORD *)&v18->_highQuality = 256;
    v18->_childCode = 0;
    *(_QWORD *)&v18->_priority = 0xFFFFFFFF00000001;
    customRenderingProperties = v18->_customRenderingProperties;
    v18->_customRenderingProperties = 0;

    v23 = MEMORY[0x24BDBD8B8];
    v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v18->_userSourceTransform.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v18->_userSourceTransform.c = v24;
    *(_OWORD *)&v18->_userSourceTransform.tx = *(_OWORD *)(v23 + 32);
  }

  return v18;
}

- (JFXEffectsPreviewGenerationRequest)initWithInputGenerator:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 renderTime:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a6;
  return -[JFXEffectsPreviewGenerationRequest initWithInputGenerator:effectStack:outputSize:frameSize:renderTime:](self, "initWithInputGenerator:effectStack:outputSize:frameSize:renderTime:", a3, a4, &v7, a5.width, a5.height, a5.width, a5.height);
}

- (id)placeholderGeneratorBackground
{
  if (placeholderGeneratorBackground_onceToken != -1)
    dispatch_once(&placeholderGeneratorBackground_onceToken, &__block_literal_global_67);
  return (id)placeholderGeneratorBackground_sTempGeneratorInputImage;
}

void __68__JFXEffectsPreviewGenerationRequest_placeholderGeneratorBackground__block_invoke()
{
  CGContext *CurrentContext;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  CGSize v5;
  CGRect v6;

  v5.width = 1.0;
  v5.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v5, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFill");

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  CGContextFillRect(CurrentContext, v6);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(MEMORY[0x24BE79030], "imageWithUIImage:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)placeholderGeneratorBackground_sTempGeneratorInputImage;
  placeholderGeneratorBackground_sTempGeneratorInputImage = v2;

}

- (CGAffineTransform)sourceTransform
{
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  CGAffineTransform *result;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[48];
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v5 = MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  -[JFXEffectsPreviewGenerationRequest generatorEffect](self, "generatorEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[JFXEffectsPreviewGenerationRequest generatorEffect](self, "generatorEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "effectType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x24BE79560]);

    if ((v11 & 1) == 0)
    {
      -[JFXEffectsPreviewGenerationRequest placeholderGeneratorBackground](self, "placeholderGeneratorBackground");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "size");
      v15 = v14;
      v17 = v16;
      -[JFXEffectsPreviewGenerationRequest userSourceTransform](self, "userSourceTransform");
      -[JFXEffectsPreviewGenerationRequest JFX_scaleToFitSize:withTransform:](self, "JFX_scaleToFitSize:withTransform:", v27, v15, v17);
      v18 = v29;
      *(_OWORD *)&retstr->a = v28;
      *(_OWORD *)&retstr->c = v18;
      *(_OWORD *)&retstr->tx = v30;

    }
  }
  else
  {
    -[JFXEffectsPreviewGenerationRequest image](self, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[JFXEffectsPreviewGenerationRequest image](self, "image");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "size");
      v22 = v21;
      v24 = v23;

      -[JFXEffectsPreviewGenerationRequest userSourceTransform](self, "userSourceTransform");
      result = -[JFXEffectsPreviewGenerationRequest JFX_scaleToFitSize:withTransform:](self, "JFX_scaleToFitSize:withTransform:", &v26, v22, v24);
      v25 = v29;
      *(_OWORD *)&retstr->a = v28;
      *(_OWORD *)&retstr->c = v25;
      *(_OWORD *)&retstr->tx = v30;
    }
  }
  return result;
}

- (id)sourceIGNodeUsingGraphBuilder:(id)a3 includeAnimoji:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  void *v37;
  id v38;
  double v39;
  void *v40;
  id v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  _OWORD v52[3];
  _QWORD v53[13];
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[3];

  v4 = a4;
  v63[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[JFXEffectsPreviewGenerationRequest generatorEffect](self, "generatorEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[JFXEffectsPreviewGenerationRequest generatorEffect](self, "generatorEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "effectType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x24BE79560]);

    if ((v11 & 1) != 0)
    {
      -[JFXEffectsPreviewGenerationRequest generatorEffect](self, "generatorEffect");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = kDefaultEffectPreviewAnimationRange;
      v59 = xmmword_226AB8860;
      v60 = xmmword_226AB8870;
      objc_msgSend(v6, "sourceNodeForGeneratorEffect:effectRange:", v12, &v58);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v59 = 0u;
      v60 = 0u;
      v58 = 0u;
      -[JFXEffectsPreviewGenerationRequest sourceTransform](self, "sourceTransform");
      -[JFXEffectsPreviewGenerationRequest placeholderGeneratorBackground](self, "placeholderGeneratorBackground");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v58;
      v56 = v59;
      v57 = v60;
      objc_msgSend(v6, "sourceNodeForImageBuffer:sourceTransform:", v45, &v55);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      -[JFXEffectsPreviewGenerationRequest generatorEffect](self, "generatorEffect");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v47;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = kDefaultEffectPreviewAnimationRange;
      v56 = xmmword_226AB8860;
      v57 = xmmword_226AB8870;
      objc_msgSend(v6, "applyEffectStack:presentationRange:toInput:", v48, &v55, v46);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[JFXEffectsPreviewGenerationRequest image](self, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v59 = 0uLL;
      v60 = 0uLL;
      v58 = 0uLL;
      -[JFXEffectsPreviewGenerationRequest sourceTransform](self, "sourceTransform");
      v15 = objc_alloc(MEMORY[0x24BE79048]);
      -[JFXEffectsPreviewGenerationRequest image](self, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v58;
      v56 = v59;
      v57 = v60;
      v17 = (void *)objc_msgSend(v15, "initWithPVImageBuffer:transform:", v16, &v55);

      -[JFXEffectsPreviewGenerationRequest customRenderingProperties](self, "customRenderingProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4
        || (objc_msgSend(v19, "metadata"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = v20 == 0,
            v20,
            v21))
      {
        v13 = v17;
      }
      else
      {
        *(_QWORD *)&v55 = 0;
        *((_QWORD *)&v55 + 1) = &v55;
        *(_QWORD *)&v56 = 0x3032000000;
        *((_QWORD *)&v56 + 1) = __Block_byref_object_copy__25;
        *(_QWORD *)&v57 = __Block_byref_object_dispose__25;
        *((_QWORD *)&v57 + 1) = 0;
        -[JFXEffectsPreviewGenerationRequest effectStack](self, "effectStack");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __83__JFXEffectsPreviewGenerationRequest_sourceIGNodeUsingGraphBuilder_includeAnimoji___block_invoke;
        v54[3] = &unk_24EE5C120;
        v54[4] = &v55;
        objc_msgSend(v22, "enumerateObjectsUsingBlock:", v54);

        if (*(_QWORD *)(*((_QWORD *)&v55 + 1) + 40))
        {
          objc_msgSend(v19, "metadata");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "mutableCopy");

          objc_msgSend(v24, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 40), CFSTR("JFXAnimojiRendererMetadata_Effect"));
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_RenderSize"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "CGSizeValue");
          v27 = v26;
          v28 = v25;
          if (v26 == *MEMORY[0x24BDBF148] && v25 == *(double *)(MEMORY[0x24BDBF148] + 8))
          {
            -[JFXEffectsPreviewGenerationRequest image](self, "image");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "size");
            v27 = v30;
            v28 = v31;

          }
          v32 = (void *)MEMORY[0x24BE79060];
          objc_msgSend(v19, "renderingDelegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v32, "newSourceCompositeNodeWithDelegate:inputs:userContext:outputSize:outputFormat:", v33, 0, v24, 1111970369, v27, v28);

          objc_msgSend(MEMORY[0x24BE78FF8], "sRGBColorSpace");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setColorSpace:", v35);

          v36 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
          *(_OWORD *)v53 = *MEMORY[0x24BDBD8B8];
          *(_OWORD *)&v53[2] = v36;
          *(_OWORD *)&v53[4] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
          -[JFXEffectsPreviewGenerationRequest JFX_scaleToFitSize:withTransform:](self, "JFX_scaleToFitSize:withTransform:", v53, v27, v28);
          v52[0] = *(_OWORD *)&v53[7];
          v52[1] = *(_OWORD *)&v53[9];
          v52[2] = *(_OWORD *)&v53[11];
          objc_msgSend(v34, "setTransform:", v52);
          v37 = (void *)objc_msgSend(MEMORY[0x24BE79010], "newEffectWithID:", *MEMORY[0x24BE79260]);
          v38 = objc_alloc(MEMORY[0x24BE790B0]);
          LODWORD(v39) = 1.0;
          v40 = (void *)objc_msgSend(v38, "initWithOpacity:mode:", 0, v39);
          v41 = objc_alloc(MEMORY[0x24BE790B0]);
          LODWORD(v42) = 1.0;
          v43 = (void *)objc_msgSend(v41, "initWithOpacity:mode:", 0, v42);
          v61[0] = &unk_24EE9C0B0;
          v61[1] = &unk_24EE9C0C8;
          v62[0] = v40;
          v62[1] = v43;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setInspectableProperty:forKey:", v44, *MEMORY[0x24BE79600]);
          v13 = (void *)objc_opt_new();
          objc_msgSend(v13, "setEffect:", v37);
          objc_msgSend(v13, "setInputNode:forInputID:", v17, 0);
          objc_msgSend(v13, "setInputNode:forInputID:", v34, 1);

        }
        else
        {
          v13 = v17;
        }
        _Block_object_dispose(&v55, 8);

      }
    }
    else
    {
      v59 = 0uLL;
      v60 = 0uLL;
      v58 = 0uLL;
      -[JFXEffectsPreviewGenerationRequest sourceTransform](self, "sourceTransform");
      -[JFXEffectsPreviewGenerationRequest placeholderGeneratorBackground](self, "placeholderGeneratorBackground");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v58;
      v56 = v59;
      v57 = v60;
      objc_msgSend(v6, "sourceNodeForImageBuffer:sourceTransform:", v49, &v55);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v13;
}

void __83__JFXEffectsPreviewGenerationRequest_sourceIGNodeUsingGraphBuilder_includeAnimoji___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "type") == 7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)generatorJobWithGraphBuilder:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  JFXEffectsPreviewGeneratorJob *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  -[JFXEffectsPreviewGenerationRequest sourceIGNodeUsingGraphBuilder:includeAnimoji:](self, "sourceIGNodeUsingGraphBuilder:includeAnimoji:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectsPreviewGenerationRequest customRenderingProperties](self, "customRenderingProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "applyEffectStack:toInput:", self->_effectStack, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[JFXEffectsPreviewGenerationRequest pickerPreviewEffectList](self, "pickerPreviewEffectList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[JFXEffectsPreviewGenerationRequest pickerPreviewEffectList](self, "pickerPreviewEffectList"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[JFXEffectsPreviewGenerationRequest pickerPreviewEffectList](self, "pickerPreviewEffectList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v39;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v9);
          v42 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v12);
          v13 = v42;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1, v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "applyEffectStack:toInput:", v14, v29);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v15);
          objc_msgSend(v5, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v10);
    }

  }
  else if (v29)
  {
    -[JFXEffectsPreviewGenerationRequest effectStack](self, "effectStack");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && (-[JFXEffectsPreviewGenerationRequest effectStack](self, "effectStack"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "count"),
          v17,
          v16,
          v18))
    {
      -[JFXEffectsPreviewGenerationRequest effectStack](self, "effectStack");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastObject");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance", v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createEffectForType:fromID:withProperties:", 1, *MEMORY[0x24BE79548], 0);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v20;

    objc_msgSend(v4, "addObject:", v29);
    objc_msgSend(v5, "addObject:", v21);

  }
  if (objc_msgSend(v25, "animojiTapPoint", v25))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__25;
    v36 = __Block_byref_object_dispose__25;
    v37 = 0;
    -[JFXEffectsPreviewGenerationRequest effectStack](self, "effectStack");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __67__JFXEffectsPreviewGenerationRequest_generatorJobWithGraphBuilder___block_invoke;
    v31[3] = &unk_24EE5C120;
    v31[4] = &v32;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v31);

    if (v33[5])
    {
      objc_msgSend(v4, "addObject:", v27);
      objc_msgSend(v5, "addObject:", v33[5]);
    }
    _Block_object_dispose(&v32, 8);

  }
  v23 = -[JFXEffectsPreviewGeneratorJob initWithRenderOutputs:callbackKeys:]([JFXEffectsPreviewGeneratorJob alloc], "initWithRenderOutputs:callbackKeys:", v4, v5);

  return v23;
}

void __67__JFXEffectsPreviewGenerationRequest_generatorJobWithGraphBuilder___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "type") == 7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)setTransformAnimationInfo:(PVTransformAnimationInfo *)a3 scaleToOutput:(BOOL)a4
{
  _BOOL8 v4;
  __int128 v6;
  _OWORD v7[3];
  double rotation;

  v4 = a4;
  v6 = *(_OWORD *)&a3->time.epoch;
  v7[0] = *(_OWORD *)&a3->time.value;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->translation.y;
  rotation = a3->rotation;
  -[JFXEffectsPreviewGenerationRequest setAnimationTransformInfo:](self, "setAnimationTransformInfo:", v7);
  -[JFXEffectsPreviewGenerationRequest setScaleAnimationTransformInfoToOutputSize:](self, "setScaleAnimationTransformInfoToOutputSize:", v4);
}

- (CGAffineTransform)_scaleAndTransformToFitSize:(SEL)a3
{
  double height;
  double width;
  uint64_t v8;

  height = a4.height;
  width = a4.width;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  -[JFXEffectsPreviewGenerationRequest userSourceTransform](self, "userSourceTransform");
  return -[JFXEffectsPreviewGenerationRequest JFX_scaleToFitSize:withTransform:](self, "JFX_scaleToFitSize:withTransform:", &v8, width, height);
}

- (CGAffineTransform)JFX_scaleToFitSize:(SEL)a3 withTransform:(CGSize)a4
{
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v29;

  v8 = MEMORY[0x24BDBD8B8];
  v23 = *MEMORY[0x24BDBD8B8];
  v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v24;
  v22 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)&retstr->tx = v22;
  v9 = a4.height * a5->c + a5->a * a4.width;
  v10 = a4.height * a5->d + a5->b * a4.width;
  -[JFXEffectsPreviewGenerationRequest outputSize](self, "outputSize");
  v12 = v11 / fabs(v10);
  -[JFXEffectsPreviewGenerationRequest outputSize](self, "outputSize");
  v14 = v13 / fabs(v9);
  if (v12 >= v14)
    v14 = v12;
  v15 = v14;
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeScale(&v29, v15, v15);
  *(_OWORD *)&t1.a = v23;
  *(_OWORD *)&t1.c = v24;
  *(_OWORD *)&t1.tx = v22;
  v16 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t2.c = v16;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(retstr, &t1, &t2);
  -[JFXEffectsPreviewGenerationRequest animationTransformInfo](self, "animationTransformInfo");
  CGAffineTransformFromPVAnimInfo();
  v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v17;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &t2, &v26);
  v18 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v18;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  result = (CGAffineTransform *)-[JFXEffectsPreviewGenerationRequest scaleAnimationTransformInfoToOutputSize](self, "scaleAnimationTransformInfoToOutputSize");
  if ((_DWORD)result)
  {
    v20 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t2.c = v20;
    *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
    v25 = v29;
    result = CGAffineTransformConcat(&t1, &t2, &v25);
    v21 = *(_OWORD *)&t1.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&retstr->c = v21;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  }
  return result;
}

- (PVImageBuffer)image
{
  return self->_image;
}

- (JFXEffect)generatorEffect
{
  return self->_generatorEffect;
}

- (NSArray)effectStack
{
  return self->_effectStack;
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (CGAffineTransform)userSourceTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].b;
  return self;
}

- (void)setUserSourceTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_userSourceTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_userSourceTransform.c = v4;
  *(_OWORD *)&self->_userSourceTransform.a = v3;
}

- (NSDictionary)customRenderingProperties
{
  return self->_customRenderingProperties;
}

- (void)setCustomRenderingProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)pickerPreviewEffectList
{
  return self->_pickerPreviewEffectList;
}

- (void)setPickerPreviewEffectList:(id)a3
{
  objc_storeStrong((id *)&self->_pickerPreviewEffectList, a3);
}

- (PVTransformAnimationInfo)animationTransformInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].time.epoch;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self[3].time.value;
  *(_OWORD *)&retstr->time.epoch = v3;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self[3].translation.y;
  retstr->rotation = self[3].rotation;
  return self;
}

- (void)setAnimationTransformInfo:(PVTransformAnimationInfo *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->time.value;
  v4 = *(_OWORD *)&a3->time.epoch;
  v5 = *(_OWORD *)&a3->translation.y;
  self->_animationTransformInfo.rotation = a3->rotation;
  *(_OWORD *)&self->_animationTransformInfo.translation.y = v5;
  *(_OWORD *)&self->_animationTransformInfo.time.epoch = v4;
  *(_OWORD *)&self->_animationTransformInfo.time.value = v3;
}

- (BOOL)highQuality
{
  return self->_highQuality;
}

- (void)setHighQuality:(BOOL)a3
{
  self->_highQuality = a3;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (unsigned)childCode
{
  return self->_childCode;
}

- (void)setChildCode:(unsigned int)a3
{
  self->_childCode = a3;
}

- (BOOL)scaleAnimationTransformInfoToOutputSize
{
  return self->_scaleAnimationTransformInfoToOutputSize;
}

- (void)setScaleAnimationTransformInfoToOutputSize:(BOOL)a3
{
  self->_scaleAnimationTransformInfoToOutputSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerPreviewEffectList, 0);
  objc_storeStrong((id *)&self->_customRenderingProperties, 0);
  objc_storeStrong((id *)&self->_effectStack, 0);
  objc_storeStrong((id *)&self->_generatorEffect, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
