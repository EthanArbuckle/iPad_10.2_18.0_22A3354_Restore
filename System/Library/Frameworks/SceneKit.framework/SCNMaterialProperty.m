@implementation SCNMaterialProperty

- (void)_updateMaterialFilters
{
  __C3DEffectSlot *v3;
  uint64_t v4;
  uint64_t TextureSampler;
  int minificationFilter;
  int magnificationFilter;
  int mipFilter;
  int wrapS;
  int wrapT;
  int WrapModeP;
  uint64_t v12;
  uint64_t v13;
  const void *v14;

  v3 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v3)
  {
    v4 = (uint64_t)v3;
    TextureSampler = C3DEffectSlotGetTextureSampler((uint64_t)v3);
    minificationFilter = self->_minificationFilter;
    magnificationFilter = self->_magnificationFilter;
    mipFilter = self->_mipFilter;
    wrapS = self->_wrapS;
    wrapT = self->_wrapT;
    if (TextureSampler)
      WrapModeP = C3DTextureSamplerGetWrapModeP(TextureSampler);
    else
      WrapModeP = 2;
    v12 = -[SCNMaterialProperty borderColor4](self, "borderColor4");
    v14 = (const void *)C3DTextureSamplerCreateEx(minificationFilter, magnificationFilter, mipFilter, wrapS, wrapT, WrapModeP, v12, v13, self->_maxAnisotropy);
    C3DEffectSlotSetTextureSampler(v4, v14);
    CFRelease(v14);
  }
}

- (__C3DEffectSlot)effectSlot
{
  return -[SCNMaterialProperty effectSlotCreateIfNeeded:](self, "effectSlotCreateIfNeeded:", 1);
}

- (C3DColor4)borderColor4
{
  uint64_t v2;
  uint64_t v3;
  C3DColor4 result;

  v2 = objc_msgSend((id)scn_NSColorFromCGColorIfApplicable(self->_borderColor), "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  *(_QWORD *)&result.var0.var1.var2 = v3;
  *(_QWORD *)result.var0.var0 = v2;
  return result;
}

- (__C3DEffectSlot)effectSlotCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  __C3DEffectSlot *result;

  v3 = a3;
  switch(self->_propertyType)
  {
    case 0x16:
      result = (__C3DEffectSlot *)objc_msgSend(self->_parent, "lightRef");
      if (result)
        result = (__C3DEffectSlot *)C3DLightGetGobo((uint64_t)result, v3);
      break;
    case 0x18:
      result = (__C3DEffectSlot *)objc_msgSend(self->_parent, "sceneRef");
      if (result)
        result = (__C3DEffectSlot *)C3DSceneGetBackgroundEffectSlot((uint64_t)result, v3);
      break;
    case 0x19:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        result = (__C3DEffectSlot *)objc_msgSend(self->_parent, "sceneRef");
        if (result)
          result = (__C3DEffectSlot *)C3DSceneGetLightingEnvironmentEffectSlot((uint64_t)result, v3);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          result = (__C3DEffectSlot *)objc_msgSend(self->_parent, "lightRef");
          if (result)
            result = (__C3DEffectSlot *)C3DLightGetProbeEnvironment((uint64_t)result, v3);
        }
        else
        {
          result = 0;
        }
      }
      break;
    case 0x1A:
      result = (__C3DEffectSlot *)objc_msgSend(self->_parent, "cameraRef");
      if (result)
        result = (__C3DEffectSlot *)C3DCameraGetColorGradingEffectSlot((uint64_t)result, v3);
      break;
    case 0x1B:
      result = self->_customSlot;
      break;
    default:
      result = -[SCNMaterialProperty commonProfile](self, "commonProfile");
      if (result)
        result = (__C3DEffectSlot *)C3DEffectCommonProfileGetEffectSlot((uint64_t)result, self->_propertyType, v3);
      break;
  }
  return result;
}

- (__C3DEffectCommonProfile)commonProfile
{
  if ((*((_BYTE *)self + 8) & 2) != 0)
    return (__C3DEffectCommonProfile *)objc_msgSend(self->_parent, "commonProfile");
  else
    return 0;
}

- (void)_setC3DImageRef:(__C3DImage *)a3
{
  __C3DImage *c3dImage;
  __C3DImage *v6;

  c3dImage = self->_c3dImage;
  if (c3dImage != a3)
  {
    if (c3dImage)
    {
      CFRelease(c3dImage);
      self->_c3dImage = 0;
    }
    if (a3)
      v6 = (__C3DImage *)CFRetain(a3);
    else
      v6 = 0;
    self->_c3dImage = v6;
  }
}

- (void)_setupContentsFromC3DImage
{
  __C3DImage *c3dImage;
  id v4;
  id URL;
  void *v6;

  c3dImage = self->_c3dImage;
  if (c3dImage)
  {
    if (C3DImageIsCatalogTexture((uint64_t)c3dImage))
    {

      v4 = (id)C3DImageGetCatalogTextureName((uint64_t)self->_c3dImage);
LABEL_7:
      self->_contents = v4;
      self->_contentType = 1;
      return;
    }
    URL = (id)C3DImageGetURL((uint64_t)self->_c3dImage);
    if (URL
      || (URL = +[SCNMaterialProperty copyImageFromC3DImage:](SCNMaterialProperty, "copyImageFromC3DImage:", self->_c3dImage)) != 0)
    {
      v6 = URL;

      v4 = v6;
      goto LABEL_7;
    }
  }
}

- (void)_setColor:(id)a3
{
  if (self->_contents != a3)
  {
    self->_contents = a3;
    self->_contentType = 0;
  }
}

uint64_t __32__SCNMaterialProperty_setWrapT___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialFilters");
}

uint64_t __32__SCNMaterialProperty_setWrapS___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialFilters");
}

- (void)setWrapT:(SCNWrapMode)wrapT
{
  __C3DScene *v4;
  _QWORD v5[5];

  if ((unint64_t)(wrapT - 5) > 0xFFFFFFFFFFFFFFFBLL)
  {
    if (self->_wrapT != wrapT)
    {
      self->_wrapT = wrapT;
      v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __32__SCNMaterialProperty_setWrapT___block_invoke;
      v5[3] = &unk_1EA59E4A0;
      v5[4] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
    }
  }
  else
  {
    NSLog(CFSTR("invalid wrapT value: %d"), a2, wrapT);
  }
}

- (void)setWrapS:(SCNWrapMode)wrapS
{
  __C3DScene *v4;
  _QWORD v5[5];

  if ((unint64_t)(wrapS - 5) > 0xFFFFFFFFFFFFFFFBLL)
  {
    if (self->_wrapS != wrapS)
    {
      self->_wrapS = wrapS;
      v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __32__SCNMaterialProperty_setWrapS___block_invoke;
      v5[3] = &unk_1EA59E4A0;
      v5[4] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
    }
  }
  else
  {
    NSLog(CFSTR("invalid wrapS value: %d"), a2, wrapS);
  }
}

- (SCNMaterialProperty)initWithParent:(id)a3 propertyType:(char)a4
{
  int v4;
  SCNMaterialProperty *v6;
  SCNMaterialProperty *v7;
  id v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCNMaterialProperty;
  v6 = -[SCNMaterialProperty init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v6 == a3)
      v8 = 0;
    else
      v8 = a3;
    v6->_parent = v8;
    v6->_propertyType = v4;
    *((_BYTE *)v6 + 8) = *((_BYTE *)v6 + 8) & 0xFD | (2 * (v4 < 21));
    if (!v8)
      v6->_customSlot = (__C3DEffectSlot *)C3DEffectSlotCreate(0, 27);
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNMaterialProperty _syncObjCModel](v7, "_syncObjCModel");
    -[SCNMaterialProperty _syncObjCAnimations](v7, "_syncObjCAnimations");
  }
  return v7;
}

- (void)_syncObjCModel
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectSlot *v5;
  uint64_t v6;
  uint64_t TextureSampler;
  char v8;
  uint64_t ImageTransform;
  unsigned int propertyType;
  unsigned __int8 v16;
  char v17;

  v3 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterialProperty effectSlotCreateIfNeeded:](self, "effectSlotCreateIfNeeded:", 0);
  if (v5)
  {
    v6 = (uint64_t)v5;
    TextureSampler = C3DEffectSlotGetTextureSampler((uint64_t)v5);
    if (TextureSampler || (TextureSampler = C3DTextureSamplerGetDefault()) != 0)
    {
      self->_minificationFilter = C3DTextureSamplerGetMinFilter(TextureSampler);
      self->_magnificationFilter = C3DTextureSamplerGetMagFilter(TextureSampler);
      self->_mipFilter = C3DTextureSamplerGetMipFilter(TextureSampler);
      self->_wrapS = C3DTextureSamplerGetWrapModeS(TextureSampler);
      self->_wrapT = C3DTextureSamplerGetWrapModeT(TextureSampler);
      self->_borderColor = (UIColor *)(id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DTextureSamplerGetBorderColor(TextureSampler));
      self->_maxAnisotropy = C3DTextureSamplerGetAnisotropy(TextureSampler);
    }
    self->_mappingChannel = -[SCNMaterialProperty _presentationMappingChannel](self, "_presentationMappingChannel");
    self->_textureComponents = C3DEffectSlotGetTextureComponents(v6);
    self->_intensity = C3DEffectSlotGetIntensity(v6);
    if (C3DEffectSlotGetSRGB(v6))
      v8 = 4;
    else
      v8 = 0;
    *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v8;
    if (C3DKeyframeControllerHasInterpolationModesPerKey(v6))
    {
      -[SCNMaterialProperty __allocateContentTransformIfNeeded](self, "__allocateContentTransformIfNeeded");
      ImageTransform = C3DEffectSlotGetImageTransform(v6);
      C3DMatrix4x4ToSCNMatrix4(ImageTransform, (_OWORD *)&self->_contentTransform->m11);
      if (!v4)
        return;
LABEL_22:
      C3DSceneUnlock(v4);
      return;
    }
    free(self->_contentTransform);
    self->_contentTransform = 0;
    if (v4)
      goto LABEL_22;
  }
  else
  {
    *(_WORD *)&self->_minificationFilter = 514;
    self->_mipFilter = C3DWasLinkedBeforeMajorOSYear2016() ^ 1;
    *(_WORD *)&self->_wrapS = 257;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&self->_intensity = _D0;
    propertyType = self->_propertyType;
    if (propertyType == 15)
      v16 = 8;
    else
      v16 = 15;
    self->_textureComponents = v16;
    if (C3DEffectSlotDefaultSRGBForPropertyType(propertyType))
      v17 = 4;
    else
      v17 = 0;
    *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v17;
    if (v4)
      goto LABEL_22;
  }
}

- (void)_syncObjCAnimations
{
  __C3DScene *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *Animations;
  const __CFDictionary *v16;

  v3 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v5 = -[SCNMaterialProperty __CFObject](self, "__CFObject");
  if (v5)
  {
    v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[SCNLight _syncObjCAnimations].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    Animations = C3DEntityGetAnimations(v6);
    if (Animations)
    {
      v16 = Animations;
      os_unfair_lock_lock(&self->_animationsLock);
      C3DOrderedDictionaryApplyFunction(v16, (const char *)SCNConvertC3DAnimationDictionaryFunc, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v4)
    C3DSceneUnlock(v4);
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)objc_msgSend(self->_parent, "sceneRef");
}

- (void)__CFObject
{
  return (void *)objc_msgSend(self->_parent, "__CFObject");
}

uint64_t __37__SCNMaterialProperty_setFloatValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialNumber:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__SCNMaterialProperty_setColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialColor:", *(_QWORD *)(a1 + 40));
}

- (void)setTextureComponents:(SCNColorMask)textureComponents
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_textureComponents != textureComponents)
  {
    self->_textureComponents = textureComponents;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__SCNMaterialProperty_setTextureComponents___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = textureComponents;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setMipFilter:(SCNFilterMode)mipFilter
{
  __C3DScene *v4;
  _QWORD v5[5];

  if (self->_mipFilter != mipFilter)
  {
    self->_mipFilter = mipFilter;
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36__SCNMaterialProperty_setMipFilter___block_invoke;
    v5[3] = &unk_1EA59E4A0;
    v5[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
  }
}

void __44__SCNMaterialProperty_setTextureComponents___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "effectSlotCreateIfNeeded:", *(_QWORD *)(a1 + 40) != 15);
  if (v2)
    C3DEffectSlotSetTextureComponents(v2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __36__SCNMaterialProperty_setMipFilter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialFilters");
}

float __36__SCNMaterialProperty_setIntensity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float result;
  float v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "effectSlot");
  if (v2)
  {
    v4 = *(double *)(a1 + 40);
    C3DEffectSlotSetIntensity(v2, v4);
  }
  return result;
}

void __41__SCNMaterialProperty_setMappingChannel___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "effectSlotCreateIfNeeded:", *(_QWORD *)(a1 + 40) != 0);
  if (v2)
    C3DEffectSlotSetUVSet(v2, *(_QWORD *)(a1 + 40));
}

- (int64_t)_presentationMappingChannel
{
  __C3DEffectSlot *v2;

  v2 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v2)
    return C3DEffectSlotGetUVSet((uint64_t)v2);
  else
    return -1;
}

uint64_t __57__SCNMaterialProperty_setPrecomputedLightingEnvironment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrecomputedLightingEnvironment:", *(_QWORD *)(a1 + 40));
}

- (void)_updatePrecomputedLightingEnvironment:(id)a3
{
  __C3DEffectSlot *v4;

  v4 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v4)
    C3DEffectSlotSetPrecomputedLightingEnvironment((uint64_t)v4, a3);
}

- (void)setIntensity:(CGFloat)intensity
{
  float v5;
  __C3DScene *v6;
  id v7;
  _QWORD v8[6];

  if (self->_intensity != intensity)
  {
    v5 = intensity;
    self->_intensity = v5;
    v6 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v7 = -[SCNMaterialProperty _animationPathForKey:](self, "_animationPathForKey:", CFSTR("intensity"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__SCNMaterialProperty_setIntensity___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = intensity;
    +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v6, self, v7, v8);
  }
}

- (void)setImage:(id)a3
{
  __C3DImage *c3dImage;

  if (self->_contents == a3)
  {
    if (!a3)
    {
      c3dImage = self->_c3dImage;
      if (c3dImage)
        goto LABEL_3;
    }
  }
  else
  {
    c3dImage = self->_c3dImage;
    if (c3dImage)
    {
LABEL_3:
      CFRetain(c3dImage);
      -[SCNMaterialProperty _clearContents](self, "_clearContents");
      self->_contents = a3;
      self->_contentType = 1;
      -[SCNMaterialProperty _updateC3DImageWithContents:](self, "_updateC3DImageWithContents:", a3);
      CFRelease(c3dImage);
      return;
    }
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 1;
    -[SCNMaterialProperty _updateC3DImageWithContents:](self, "_updateC3DImageWithContents:", a3);
  }
}

- (void)setColor:(id)a3
{
  __C3DScene *v5;
  id v6;
  _QWORD v7[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 0;
    if (a3)
    {
      v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
      v6 = -[SCNMaterialProperty _animationPathForKey:](self, "_animationPathForKey:", CFSTR("color"));
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __32__SCNMaterialProperty_setColor___block_invoke;
      v7[3] = &unk_1EA59F740;
      v7[4] = self;
      v7[5] = a3;
      +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v5, self, v6, v7);
    }
  }
}

- (void)setFloatValue:(id)a3
{
  id contents;
  __C3DScene *v6;
  id v7;
  _QWORD v8[6];

  contents = self->_contents;
  if (contents != a3 && (objc_msgSend(contents, "isEqual:") & 1) == 0)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 9;
    if (a3)
    {
      v6 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
      v7 = -[SCNMaterialProperty _animationPathForKey:](self, "_animationPathForKey:", CFSTR("color"));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __37__SCNMaterialProperty_setFloatValue___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = self;
      v8[5] = a3;
      +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v6, self, v7, v8);
    }
  }
}

- (void)_clearContents
{
  unsigned int contentType;
  BOOL v4;
  int v5;
  id contents;
  __C3DScene *v8;
  __C3DImage *c3dImage;
  _QWORD v10[5];
  _QWORD v11[6];

  contentType = self->_contentType;
  v4 = contentType > 0xD;
  v5 = (1 << contentType) & 0x3D0C;
  if (!v4 && v5 != 0)
  {
    contents = self->_contents;
    if (contents)
    {
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x3052000000;
      v11[3] = __Block_byref_object_copy__8;
      v11[4] = __Block_byref_object_dispose__8;
      v11[5] = contents;
      v8 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __37__SCNMaterialProperty__clearContents__block_invoke;
      v10[3] = &unk_1EA5A2D58;
      v10[4] = v11;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, 0, v10);
      _Block_object_dispose(v11, 8);
    }
  }
  c3dImage = self->_c3dImage;
  if (c3dImage)
  {
    CFRelease(c3dImage);
    self->_c3dImage = 0;
  }

  self->_contents = 0;
}

- (id)_animationPathForKey:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(-[SCNMaterialProperty slotName](self, "slotName"), "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", a3);
}

- (id)propertyName
{
  int v3;
  id result;
  NSObject *v5;

  v3 = -[SCNMaterialProperty propertyType](self, "propertyType");
  result = CFSTR("diffuse");
  switch(v3)
  {
    case 0:
      result = CFSTR("emission");
      break;
    case 1:
      result = CFSTR("ambient");
      break;
    case 2:
      return result;
    case 3:
      result = CFSTR("specular");
      break;
    case 4:
      result = CFSTR("reflective");
      break;
    case 5:
      result = CFSTR("transparent");
      break;
    case 6:
      result = CFSTR("multiply");
      break;
    case 7:
      result = CFSTR("normal");
      break;
    case 8:
      result = CFSTR("ambientOcclusion");
      break;
    case 9:
      result = CFSTR("selfIllumination");
      break;
    case 10:
      result = CFSTR("metalness");
      break;
    case 11:
      result = CFSTR("roughness");
      break;
    case 12:
      result = CFSTR("clearCoat");
      break;
    case 13:
      result = CFSTR("clearCoatRoughness");
      break;
    case 14:
      result = CFSTR("clearCoatNormal");
      break;
    case 15:
      result = CFSTR("displacement");
      break;
    case 22:
      result = CFSTR("gobo");
      break;
    case 23:
      result = CFSTR("ies");
      break;
    case 24:
      result = CFSTR("background");
      break;
    case 25:
      -[SCNMaterialProperty parent](self, "parent");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        result = CFSTR("probeEnvironment");
      else
        result = CFSTR("environment");
      break;
    case 26:
      result = CFSTR("colorGrading");
      break;
    case 27:
      result = self->_customSlotName;
      break;
    default:
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SCNMaterialProperty propertyName].cold.1(self, v5);
      result = 0;
      break;
  }
  return result;
}

- (char)propertyType
{
  return self->_propertyType;
}

uint64_t __38__SCNMaterialProperty_setBorderColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialBorderColor:", *(_QWORD *)(a1 + 40));
}

- (void)_updateMaterialBorderColor:(id)a3
{
  __C3DEffectSlot *v4;
  uint64_t TextureSampler;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -[SCNMaterialProperty effectSlotCreateIfNeeded:](self, "effectSlotCreateIfNeeded:", a3 != 0);
  if (v4)
  {
    TextureSampler = C3DEffectSlotGetTextureSampler((uint64_t)v4);
    if (TextureSampler)
    {
      v6 = TextureSampler;
      v7 = C3DColor4FromRGBCFColor(a3, 0);
      C3DTextureSamplerSetBorderColor(v6, v7, v8);
    }
  }
}

- (void)setContents:(id)contents
{
  SCNMaterialAttachment *v5;
  SCNMaterialProperty *v6;
  SCNMaterialAttachment *v7;

  if (-[SCNMaterialProperty contents](self, "contents") != contents)
  {

    self->_runtimeResolvedPath = 0;
    v5 = (SCNMaterialAttachment *)scn_NSColorFromCGColorIfApplicable(contents);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SCNMaterialProperty setColor:](self, "setColor:", v5);
      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SCNMaterialProperty setLayer:](self, "setLayer:", v5);
      return;
    }
    if (NSClassFromString(CFSTR("SKScene")))
    {
      NSClassFromString(CFSTR("SKScene"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SCNMaterialProperty setSkScene:](self, "setSkScene:", v5);
        return;
      }
    }
    if (NSClassFromString(CFSTR("SKTexture")))
    {
      NSClassFromString(CFSTR("SKTexture"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SCNMaterialProperty setSkTexture:](self, "setSkTexture:", v5);
        return;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = self;
      v7 = v5;
LABEL_21:
      -[SCNMaterialProperty setAttachment:](v6, "setAttachment:", v7);
      return;
    }
    NSClassFromString(CFSTR("GLKTextureInfo"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = +[SCNMaterialAttachment materialAttachmentWithGLKTextureInfo:](SCNMaterialAttachment, "materialAttachmentWithGLKTextureInfo:", v5);
      v6 = self;
      goto LABEL_21;
    }
    if (-[SCNMaterialAttachment conformsToProtocol:](v5, "conformsToProtocol:", &unk_1F040D6D0))
    {
      -[SCNMaterialProperty setMtlTexture:](self, "setMtlTexture:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SCNMaterialProperty setUIView:](self, "setUIView:", v5);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SCNMaterialProperty setUIWindow:](self, "setUIWindow:", v5);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SCNMaterialProperty setFloatValue:](self, "setFloatValue:", v5);
          }
          else
          {
            NSClassFromString(CFSTR("AVPlayer"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[SCNMaterialProperty setAvPlayer:](self, "setAvPlayer:", v5);
            }
            else
            {
              NSClassFromString(CFSTR("AVCaptureDevice"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[SCNMaterialProperty setCaptureDevice:](self, "setCaptureDevice:", v5);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[SCNMaterialProperty setCaptureDeviceOutputConsumerSource:](self, "setCaptureDeviceOutputConsumerSource:", v5);
                }
                else if (-[SCNMaterialAttachment conformsToProtocol:](v5, "conformsToProtocol:", &unk_1F040F0F0))
                {
                  -[SCNMaterialProperty setTextureProvider:](self, "setTextureProvider:", v5);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
LABEL_8:
                    -[SCNMaterialProperty setImage:](self, "setImage:", v5);
                    return;
                  }
                  -[SCNMaterialProperty setPrecomputedLightingEnvironment:](self, "setPrecomputedLightingEnvironment:", v5);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (id)contents
{
  id contents;
  __C3DScene *v5;
  uint64_t v6;
  __C3DEffectSlot *v7;
  __C3DEffectSlot *v8;
  uint64_t ImageProxy;
  __C3DEffectSlot *Source;
  uint64_t Image;
  uint64_t ColorIfApplicable;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6 = (uint64_t)v5;
    if (v5)
      C3DSceneLock((uint64_t)v5);
    v7 = -[SCNMaterialProperty effectSlotCreateIfNeeded:](self, "effectSlotCreateIfNeeded:", 0);
    v8 = v7;
    if (v7)
    {
      ImageProxy = C3DEffectSlotGetImageProxy((uint64_t)v7);
      if (ImageProxy)
      {
        Source = (__C3DEffectSlot *)C3DImageProxyGetSource(ImageProxy);
      }
      else
      {
        Image = C3DEffectSlotGetImage((uint64_t)v8);
        if (Image)
        {
          Source = (__C3DEffectSlot *)+[SCNMaterialProperty copyImageFromC3DImage:](SCNMaterialProperty, "copyImageFromC3DImage:", Image);
        }
        else
        {
          ColorIfApplicable = C3DEffectSlotGetColorIfApplicable((uint64_t)v8);
          if (!ColorIfApplicable)
          {
            v8 = 0;
            if (!v6)
              return v8;
            goto LABEL_18;
          }
          Source = (__C3DEffectSlot *)C3DColor4ToRGBCFColor(ColorIfApplicable);
        }
      }
      v8 = Source;
    }
    if (!v6)
      return v8;
LABEL_18:
    C3DSceneUnlock(v6);
    return v8;
  }
  contents = self->_contents;
  if (!contents || self->_contentType != 1)
  {
    if (self->_c3dImage)
    {
      -[SCNMaterialProperty image](self, "image");
      contents = self->_contents;
    }
  }
  return contents;
}

- (void)copyPropertiesFrom:(id)a3
{
  _OWORD v5[8];

  if (*((_QWORD *)a3 + 16) && (objc_msgSend(a3, "contents"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[SCNMaterialProperty _setImagePath:withResolvedPath:](self, "_setImagePath:withResolvedPath:", objc_msgSend(a3, "contents"), *((_QWORD *)a3 + 16));
  else
    -[SCNMaterialProperty setContents:](self, "setContents:", objc_msgSend(a3, "contents"));
  -[SCNMaterialProperty setMinificationFilter:](self, "setMinificationFilter:", objc_msgSend(a3, "minificationFilter"));
  -[SCNMaterialProperty setMagnificationFilter:](self, "setMagnificationFilter:", objc_msgSend(a3, "magnificationFilter"));
  -[SCNMaterialProperty setMipFilter:](self, "setMipFilter:", objc_msgSend(a3, "mipFilter"));
  objc_msgSend(a3, "contentsTransform");
  v5[0] = v5[4];
  v5[1] = v5[5];
  v5[2] = v5[6];
  v5[3] = v5[7];
  -[SCNMaterialProperty setContentsTransform:](self, "setContentsTransform:", v5);
  -[SCNMaterialProperty setWrapS:](self, "setWrapS:", objc_msgSend(a3, "wrapS"));
  -[SCNMaterialProperty setWrapT:](self, "setWrapT:", objc_msgSend(a3, "wrapT"));
  objc_msgSend(a3, "intensity");
  -[SCNMaterialProperty setIntensity:](self, "setIntensity:");
  -[SCNMaterialProperty setSRGBTexture:](self, "setSRGBTexture:", objc_msgSend(a3, "sRGBTexture"));
  -[SCNMaterialProperty setBorderColor:](self, "setBorderColor:", objc_msgSend(a3, "borderColor"));
  -[SCNMaterialProperty setMappingChannel:](self, "setMappingChannel:", objc_msgSend(a3, "mappingChannel"));
  -[SCNMaterialProperty setTextureComponents:](self, "setTextureComponents:", objc_msgSend(a3, "textureComponents"));
  -[SCNMaterialProperty _copyAnimationsFrom:](self, "_copyAnimationsFrom:", a3);
}

- (void)setMinificationFilter:(SCNFilterMode)minificationFilter
{
  __C3DScene *v4;
  _QWORD v5[5];

  if (self->_minificationFilter != minificationFilter)
  {
    self->_minificationFilter = minificationFilter;
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__SCNMaterialProperty_setMinificationFilter___block_invoke;
    v5[3] = &unk_1EA59E4A0;
    v5[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
  }
}

- (void)setMappingChannel:(NSInteger)mappingChannel
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_mappingChannel != mappingChannel)
  {
    self->_mappingChannel = mappingChannel;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__SCNMaterialProperty_setMappingChannel___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = mappingChannel;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setMagnificationFilter:(SCNFilterMode)magnificationFilter
{
  __C3DScene *v4;
  _QWORD v5[5];

  if (self->_magnificationFilter != magnificationFilter)
  {
    self->_magnificationFilter = magnificationFilter;
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__SCNMaterialProperty_setMagnificationFilter___block_invoke;
    v5[3] = &unk_1EA59E4A0;
    v5[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
  }
}

- (void)setContentsTransform:(SCNMatrix4 *)contentsTransform
{
  SCNMatrix4 *contentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  SCNMatrix4 *v13;
  NSObject *v14;
  SCNMatrix4 *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __C3DScene *v19;
  id v20;
  _QWORD v21[4];
  SCNMatrix4 v22;
  SCNMaterialProperty *v23;
  SCNMatrix4 b;
  SCNMatrix4 a;

  contentTransform = self->_contentTransform;
  if (!contentTransform)
    goto LABEL_3;
  v6 = *(_OWORD *)&contentsTransform->m21;
  *(_OWORD *)&a.m11 = *(_OWORD *)&contentsTransform->m11;
  *(_OWORD *)&a.m21 = v6;
  v7 = *(_OWORD *)&contentsTransform->m41;
  *(_OWORD *)&a.m31 = *(_OWORD *)&contentsTransform->m31;
  *(_OWORD *)&a.m41 = v7;
  v8 = *(_OWORD *)&contentTransform->m11;
  v9 = *(_OWORD *)&contentTransform->m21;
  v10 = *(_OWORD *)&contentTransform->m41;
  *(_OWORD *)&b.m31 = *(_OWORD *)&contentTransform->m31;
  *(_OWORD *)&b.m41 = v10;
  *(_OWORD *)&b.m11 = v8;
  *(_OWORD *)&b.m21 = v9;
  if (!SCNMatrix4EqualToMatrix4(&a, &b))
  {
LABEL_3:
    if ((*((_BYTE *)self + 8) & 1) != 0)
    {
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SCNMaterialProperty setContentsTransform:].cold.1((uint64_t)self, v14);
    }
    else
    {
      v11 = *(_OWORD *)&contentsTransform->m21;
      *(_OWORD *)&a.m11 = *(_OWORD *)&contentsTransform->m11;
      *(_OWORD *)&a.m21 = v11;
      v12 = *(_OWORD *)&contentsTransform->m41;
      *(_OWORD *)&a.m31 = *(_OWORD *)&contentsTransform->m31;
      *(_OWORD *)&a.m41 = v12;
      if (SCNMatrix4IsIdentity(&a))
      {
        v13 = self->_contentTransform;
        if (!v13)
          return;
        free(v13);
        self->_contentTransform = 0;
      }
      else
      {
        -[SCNMaterialProperty __allocateContentTransformIfNeeded](self, "__allocateContentTransformIfNeeded");
        v15 = self->_contentTransform;
        v16 = *(_OWORD *)&contentsTransform->m11;
        v17 = *(_OWORD *)&contentsTransform->m21;
        v18 = *(_OWORD *)&contentsTransform->m41;
        *(_OWORD *)&v15->m31 = *(_OWORD *)&contentsTransform->m31;
        *(_OWORD *)&v15->m41 = v18;
        *(_OWORD *)&v15->m11 = v16;
        *(_OWORD *)&v15->m21 = v17;
      }
      memset(&a, 0, sizeof(a));
      v19 = -[SCNMaterialProperty sceneRef](self, "sceneRef", C3DMatrix4x4FromSCNMatrix4(&a, (uint64_t)contentsTransform).n128_f64[0]);
      v20 = -[SCNMaterialProperty _animationPathForKey:](self, "_animationPathForKey:", CFSTR("contentsTransform"));
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __44__SCNMaterialProperty_setContentsTransform___block_invoke;
      v21[3] = &unk_1EA5A23D0;
      v23 = self;
      v22 = a;
      +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v19, self, v20, v21);
    }
  }
}

- (void)_updateC3DImageWithContents:(id)a3
{
  __C3DImage *c3dImage;
  __C3DImage *v6;
  __C3DImage *v7;
  BOOL v8;
  __C3DScene *v9;
  _QWORD v10[6];
  char v11;

  c3dImage = self->_c3dImage;
  if (c3dImage)
  {
    CFRelease(c3dImage);
    self->_c3dImage = 0;
  }
  v11 = 0;
  v6 = +[SCNMaterialProperty copyC3DImageFromImage:textureOptions:wasCached:](SCNMaterialProperty, "copyC3DImageFromImage:textureOptions:wasCached:", a3, -[SCNMaterialProperty _textureOptions](self, "_textureOptions"), &v11);
  v7 = v6;
  if (v6)
    v8 = v11 == 0;
  else
    v8 = 0;
  if (v8 && (*((_BYTE *)self + 8) & 8) == 0)
    C3DImageCacheBitmap((uint64_t)v6);
  v9 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__SCNMaterialProperty__updateC3DImageWithContents___block_invoke;
  v10[3] = &unk_1EA59F740;
  v10[4] = self;
  v10[5] = v7;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, self, v10);

}

uint64_t __51__SCNMaterialProperty__updateC3DImageWithContents___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialImage:", *(_QWORD *)(a1 + 40));
}

- (int)_textureOptions
{
  __C3DEffectSlot *v3;

  v3 = -[SCNMaterialProperty effectSlotCreateIfNeeded:](self, "effectSlotCreateIfNeeded:", 0);
  if (v3)
    return C3DEffectSlotGetTextureOptions((uint64_t)v3);
  else
    return C3DEffectSlotGetDefaultTextureOptions(self->_propertyType, (*((unsigned __int8 *)self + 8) >> 2) & 1);
}

+ (__C3DImage)copyC3DImageFromImage:(id)a3 textureOptions:(int)a4 wasCached:(BOOL *)a5
{
  char v6;
  CFTypeID v8;
  __C3DImage *v10;
  __C3DImage *v11;

  if (!a3)
    return 0;
  v6 = a4;
  v8 = CFGetTypeID(a3);
  if (v8 == C3DImageGetTypeID())
    return (__C3DImage *)a3;
  v11 = (__C3DImage *)C3DImageCopyCachedImageForSource(a3);
  if (v11)
  {
    v10 = v11;
    if (a5)
      *a5 = 1;
  }
  else
  {
    v10 = (__C3DImage *)objc_msgSend(a1, "_copyC3DImageFromImageData:typeID:", a3, v8);
    if (v10)
    {
      if ((v6 & 2) != 0)
      {
        C3DWasLinkedBeforeMajorOSYear2016();
        C3DImageChangeImageTypeToCubeMapIfSuitable(v10);
      }
      if ((v6 & 8) != 0)
        C3DImageChangeImageTypeTo3DIfSuitable((uint64_t)v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        C3DImageCacheImageWithSource(v10, a3);
    }
    if (a5)
      *a5 = 0;
  }
  return v10;
}

+ (__C3DImage)_copyC3DImageFromImageData:(id)a3 typeID:(unint64_t)a4
{
  void *v7;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __C3DImage *VerticalStripCubemapWithFaceImages;
  uint64_t i;
  const void *v14;
  NSObject *v15;
  uint8_t v16[16];
  _OWORD v17[3];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (__C3DImage *)C3DImageCreateWithURL(a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a3, "count") == 6)
      {
        v9 = 0;
        memset(v17, 0, sizeof(v17));
        do
        {
          v10 = objc_msgSend(a1, "copyC3DImageFromImage:", objc_msgSend(a3, "objectAtIndexedSubscript:", v9));
          *((_QWORD *)v17 + v9) = v10;
          if (!v10)
          {
            v11 = scn_default_log();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v16 = 0;
              _os_log_impl(&dword_1DCCB8000, v11, OS_LOG_TYPE_DEFAULT, "Warning: copyC3DImageFromImage: invalid sub-image\n", v16, 2u);
            }
          }
          ++v9;
        }
        while (v9 != 6);
        VerticalStripCubemapWithFaceImages = (__C3DImage *)C3DImageCreateVerticalStripCubemapWithFaceImages((uint64_t *)v17);
        for (i = 0; i != 48; i += 8)
        {
          v14 = *(const void **)((char *)v17 + i);
          if (v14)
          {
            CFRelease(v14);
            *(_QWORD *)((char *)v17 + i) = 0;
          }
        }
        return VerticalStripCubemapWithFaceImages;
      }
      v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[SCNMaterialProperty _copyC3DImageFromImageData:typeID:].cold.1();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return (__C3DImage *)C3DImageCreateWithData(a3);
      if (CGImageGetTypeID() == a4)
        return (__C3DImage *)C3DImageCreateWithCGImage((CGImage *)a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return (__C3DImage *)C3DImageCreateWithClientImage(a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return (__C3DImage *)C3DImageCreateWithMDLTexture(a3);
    }
    return 0;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  if (objc_msgSend(v7, "scheme"))
    return (__C3DImage *)C3DImageCreateWithURL(v7);
  else
    return (__C3DImage *)C3DImageCreateWithName((__CFString *)a3);
}

- (SCNWrapMode)wrapT
{
  SCNWrapMode WrapModeT;
  __C3DScene *v4;
  uint64_t v5;
  __C3DTextureSampler *v6;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty textureSampler](self, "textureSampler");
    if (v6)
    {
      WrapModeT = (int)C3DTextureSamplerGetWrapModeT((uint64_t)v6);
      if (!v5)
        return WrapModeT;
    }
    else
    {
      WrapModeT = SCNWrapModeClamp;
      if (!v5)
        return WrapModeT;
    }
    C3DSceneUnlock(v5);
    return WrapModeT;
  }
  return (unint64_t)self->_wrapT;
}

- (SCNWrapMode)wrapS
{
  SCNWrapMode WrapModeS;
  __C3DScene *v4;
  uint64_t v5;
  __C3DTextureSampler *v6;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty textureSampler](self, "textureSampler");
    if (v6)
    {
      WrapModeS = (int)C3DTextureSamplerGetWrapModeS((uint64_t)v6);
      if (!v5)
        return WrapModeS;
    }
    else
    {
      WrapModeS = SCNWrapModeClamp;
      if (!v5)
        return WrapModeS;
    }
    C3DSceneUnlock(v5);
    return WrapModeS;
  }
  return (unint64_t)self->_wrapS;
}

- (SCNColorMask)textureComponents
{
  SCNColorMask TextureComponents;
  __C3DScene *v4;
  uint64_t v5;
  __C3DEffectSlot *v6;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
    if (v6)
    {
      TextureComponents = C3DEffectSlotGetTextureComponents((uint64_t)v6);
      if (!v5)
        return TextureComponents;
    }
    else
    {
      TextureComponents = 15;
      if (!v5)
        return TextureComponents;
    }
    C3DSceneUnlock(v5);
    return TextureComponents;
  }
  return self->_textureComponents;
}

- (void)setSRGBTexture:(BOOL)a3
{
  char v3;
  char v6;
  __C3DScene *v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = *((_BYTE *)self + 8);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v6 = 4;
    else
      v6 = 0;
    *((_BYTE *)self + 8) = v3 & 0xFB | v6;
    v7 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__SCNMaterialProperty_setSRGBTexture___block_invoke;
    v8[3] = &unk_1EA59E478;
    v8[4] = self;
    v9 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
  }
}

- (void)setBorderColor:(id)borderColor
{
  UIColor *v3;
  __C3DScene *v6;
  id v7;
  _QWORD v8[6];

  v3 = self->_borderColor;
  if (v3 != borderColor)
  {

    self->_borderColor = (UIColor *)borderColor;
    v6 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v7 = -[SCNMaterialProperty _animationPathForKey:](self, "_animationPathForKey:", CFSTR("borderColor"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__SCNMaterialProperty_setBorderColor___block_invoke;
    v8[3] = &unk_1EA59F740;
    v8[4] = self;
    v8[5] = borderColor;
    +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v6, self, v7, v8);
  }
}

- (BOOL)sRGBTexture
{
  unsigned int v2;
  SCNMaterialProperty *v3;
  __C3DScene *v4;
  uint64_t v5;

  v2 = *((unsigned __int8 *)self + 8);
  if ((v2 & 1) != 0)
  {
    v3 = self;
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    LOBYTE(v3) = C3DEffectSlotGetSRGB((uint64_t)-[SCNMaterialProperty effectSlot](v3, "effectSlot"));
    if (v5)
      C3DSceneUnlock(v5);
  }
  else
  {
    LODWORD(v3) = (v2 >> 2) & 1;
  }
  return (char)v3;
}

- (SCNFilterMode)mipFilter
{
  SCNFilterMode MipFilter;
  __C3DScene *v4;
  uint64_t v5;
  __C3DTextureSampler *v6;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty textureSampler](self, "textureSampler");
    if (v6)
    {
      MipFilter = (int)C3DTextureSamplerGetMipFilter((uint64_t)v6);
      if (!v5)
        return MipFilter;
    }
    else
    {
      MipFilter = SCNFilterModeNone;
      if (!v5)
        return MipFilter;
    }
    C3DSceneUnlock(v5);
    return MipFilter;
  }
  return (unint64_t)self->_mipFilter;
}

- (SCNFilterMode)minificationFilter
{
  SCNFilterMode MinFilter;
  __C3DScene *v4;
  uint64_t v5;
  __C3DTextureSampler *v6;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty textureSampler](self, "textureSampler");
    if (v6)
    {
      MinFilter = (int)C3DTextureSamplerGetMinFilter((uint64_t)v6);
      if (!v5)
        return MinFilter;
    }
    else
    {
      MinFilter = SCNFilterModeNone;
      if (!v5)
        return MinFilter;
    }
    C3DSceneUnlock(v5);
    return MinFilter;
  }
  return (unint64_t)self->_minificationFilter;
}

- (NSInteger)mappingChannel
{
  __C3DScene *v4;
  uint64_t v5;
  NSInteger v6;

  if ((*((_BYTE *)self + 8) & 1) == 0)
    return self->_mappingChannel;
  v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  if (!v4)
    return -[SCNMaterialProperty _presentationMappingChannel](self, "_presentationMappingChannel");
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  v6 = -[SCNMaterialProperty _presentationMappingChannel](self, "_presentationMappingChannel");
  C3DSceneUnlock(v5);
  return v6;
}

- (SCNFilterMode)magnificationFilter
{
  SCNFilterMode MagFilter;
  __C3DScene *v4;
  uint64_t v5;
  __C3DTextureSampler *v6;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty textureSampler](self, "textureSampler");
    if (v6)
    {
      MagFilter = (int)C3DTextureSamplerGetMagFilter((uint64_t)v6);
      if (!v5)
        return MagFilter;
    }
    else
    {
      MagFilter = SCNFilterModeNone;
      if (!v5)
        return MagFilter;
    }
    C3DSceneUnlock(v5);
    return MagFilter;
  }
  return (unint64_t)self->_magnificationFilter;
}

- (CGFloat)intensity
{
  double Intensity;
  __C3DScene *v4;
  uint64_t v5;
  __C3DEffectSlot *v6;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
    if (v6)
    {
      Intensity = C3DEffectSlotGetIntensity((uint64_t)v6);
      if (!v5)
        return Intensity;
    }
    else
    {
      Intensity = 0.0;
      if (!v5)
        return Intensity;
    }
    C3DSceneUnlock(v5);
    return Intensity;
  }
  return self->_intensity;
}

- (SCNMatrix4)contentsTransform
{
  SCNMatrix4 *v3;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v3 = self;
  *retstr = SCNMatrix4Identity;
  if ((LOBYTE(self->m13) & 1) != 0)
  {
    v9 = -[SCNMatrix4 sceneRef](self, "sceneRef");
    v10 = v9;
    if (v9)
      C3DSceneLock(v9);
    self = (SCNMatrix4 *)-[SCNMatrix4 effectSlot](v3, "effectSlot");
    if (self)
    {
      self = (SCNMatrix4 *)C3DEffectSlotGetImageTransform((uint64_t)self);
      if (!self)
      {
        *retstr = SCNMatrix4Identity;
        if (!v10)
          return self;
        return (SCNMatrix4 *)C3DSceneUnlock(v10);
      }
      C3DMatrix4x4ToSCNMatrix4((uint64_t)self, retstr);
    }
    if (!v10)
      return self;
    return (SCNMatrix4 *)C3DSceneUnlock(v10);
  }
  v5 = *(__int128 **)&self[1].m43;
  if (v5)
  {
    v6 = *v5;
    v7 = v5[1];
    v8 = v5[3];
    *(_OWORD *)&retstr->m31 = v5[2];
    *(_OWORD *)&retstr->m41 = v8;
    *(_OWORD *)&retstr->m11 = v6;
    *(_OWORD *)&retstr->m21 = v7;
  }
  return self;
}

- (id)borderColor
{
  void *v3;
  __C3DScene *v4;
  uint64_t v5;
  __C3DTextureSampler *v6;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty textureSampler](self, "textureSampler");
    if (v6)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DTextureSamplerGetBorderColor((uint64_t)v6));
      if (!v5)
        return v3;
    }
    else
    {
      v3 = 0;
      if (!v5)
        return v3;
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  return self->_borderColor;
}

- (void)_copyAnimationsFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_msgSend(a3, "animationKeys", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        -[SCNMaterialProperty addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (NSArray)animationKeys
{
  os_unfair_lock_s *p_animationsLock;
  NSArray *v4;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v4 = -[SCNOrderedDictionary allKeys](self->_animations, "allKeys");
  os_unfair_lock_unlock(p_animationsLock);
  if (-[NSArray count](v4, "count"))
    return v4;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_updateMaterialImage:(id)a3
{
  __C3DEffectSlot *v5;
  uint64_t v6;

  -[SCNMaterialProperty _setC3DImageRef:](self, "_setC3DImageRef:");
  v5 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v5)
  {
    v6 = (uint64_t)v5;
    C3DEffectSlotSetImage((uint64_t)v5, a3);
    C3DEffectSlotSetImageProxy(v6, 0);
    C3DEffectSlotSetTexture(v6, 0);
    C3DEffectSlotSetMTLTexture(v6, 0);
    if (!a3)
      C3DEffectSlotSetHasNoContents(v6);
  }
}

- (void)_updateMaterialColor:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __C3DEffectSlot *v13;
  uint64_t v14;
  unsigned int EffectProperty;
  uint64_t IsRawFloatValue;
  uint64_t v17;
  _QWORD v18[2];

  if (!a3)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      C3DParticleSystemSetParticleColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v13)
  {
    v14 = (uint64_t)v13;
    EffectProperty = C3DEffectSlotGetEffectProperty((uint64_t)v13);
    IsRawFloatValue = C3DEffectPropertyGetSemanticForColorIsRawFloatValue(EffectProperty);
    v18[0] = C3DColor4FromRGBCFColor(a3, IsRawFloatValue);
    v18[1] = v17;
    if (a3)
    {
      C3DEffectSlotSetImage(v14, 0);
      C3DEffectSlotSetImageProxy(v14, 0);
      C3DEffectSlotSetTexture(v14, 0);
    }
    C3DEffectSlotSetColor(v14, (float *)v18);
  }
}

- (void)_updateMaterialNumber:(id)a3
{
  __C3DEffectSlot *v5;
  __C3DEffectSlot *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int32x2_t v15;
  int32x4_t v16;
  int32x2_t v22;
  int32x4_t v23;

  if (a3)
  {
    v5 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
    if (!v5)
      return;
    v6 = v5;
    C3DEffectSlotSetImage((uint64_t)v5, 0);
    C3DEffectSlotSetImageProxy((uint64_t)v6, 0);
    C3DEffectSlotSetTexture((uint64_t)v6, 0);
    goto LABEL_7;
  }
  v7 = scn_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    __RemoveVRAMResourceFromDic_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  v6 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v6)
  {
LABEL_7:
    objc_msgSend(a3, "floatValue");
    v22 = v15;
    if (C3DEffectSlotGetEffectProperty((uint64_t)v6) == 5)
    {
      v16 = vdupq_lane_s32(v22, 0);
    }
    else
    {
      __asm { FMOV            V0.4S, #1.0 }
      _Q0.i32[0] = v22.i32[0];
      v16 = vzip1q_s32(_Q0, _Q0);
      v16.i32[2] = v22.i32[0];
    }
    v23 = v16;
    C3DEffectSlotSetColor((uint64_t)v6, (float *)v23.i32);
  }
}

+ (id)precomputedLightingEnvironmentContentsWithURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "precomputedLightingEnvironmentContentsWithData:error:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, a4), a4);
}

+ (id)copyImageFromC3DImage:(__C3DImage *)a3
{
  void *v5;
  uint64_t SharedInstance;
  id SourceForResource;

  if (C3DImageHasTextureRawData((uint64_t)a3))
    return 0;
  SharedInstance = C3DResourceCacheGetSharedInstance();
  SourceForResource = (id)C3DResourceCacheGetSourceForResource(SharedInstance, a3);
  if (!SourceForResource)
  {
    v5 = (void *)objc_msgSend(a1, "_copyImageFromC3DImage:", a3);
    if (v5)
      C3DResourceCacheAddResource(SharedInstance, v5, a3);
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithContentsOfFile:", objc_msgSend(SourceForResource, "path"));
  else
    return SourceForResource;
}

- (void)setPrecomputedLightingEnvironment:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 14;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__SCNMaterialProperty_setPrecomputedLightingEnvironment___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

+ (id)precomputedLightingEnvironmentContentsWithData:(id)a3 error:(id *)a4
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), a3, a4);
  else
    return 0;
}

- (SCNMaterialProperty)init
{
  SCNMaterialProperty *v2;
  SCNMaterialProperty *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNMaterialProperty;
  v2 = -[SCNMaterialProperty init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_parent = 0;
    v2->_propertyType = 27;
    *((_BYTE *)v2 + 8) &= ~2u;
    v2->_customSlot = (__C3DEffectSlot *)C3DEffectSlotCreate(0, 27);
    v3->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNMaterialProperty _syncObjCModel](v3, "_syncObjCModel");
  }
  return v3;
}

+ (SCNMaterialProperty)materialPropertyWithContents:(id)contents
{
  SCNMaterialProperty *v4;

  v4 = (SCNMaterialProperty *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithParent:propertyType:", 0, 27);
  -[SCNMaterialProperty setContents:](v4, "setContents:", contents);
  return v4;
}

- (SCNMaterialProperty)initWithParent:(id)a3 andCustomName:(id)a4
{
  SCNMaterialProperty *v6;
  SCNMaterialProperty *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNMaterialProperty;
  v6 = -[SCNMaterialProperty init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v6 == a3)
      v8 = 0;
    else
      v8 = a3;
    v6->_parent = v8;
    v6->_propertyType = 27;
    v6->_customSlotName = (NSString *)objc_msgSend(a4, "copy");
    *((_BYTE *)v7 + 8) &= ~2u;
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNMaterialProperty _syncObjCModel](v7, "_syncObjCModel");
    -[SCNMaterialProperty _syncObjCAnimations](v7, "_syncObjCAnimations");
  }
  return v7;
}

- (id)initPresentationMaterialPropertyWithModelProperty:(id)a3
{
  SCNMaterialProperty *v4;
  uint64_t v5;
  int v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNMaterialProperty;
  v4 = -[SCNMaterialProperty init](&v9, sel_init);
  if (v4)
  {
    if ((SCNMaterialProperty *)objc_msgSend(a3, "parent") == v4)
      v5 = 0;
    else
      v5 = objc_msgSend(a3, "parent");
    v4->_parent = (id)v5;
    v6 = objc_msgSend(a3, "propertyType");
    v4->_propertyType = v6;
    if (v6 >= 21)
      v7 = 1;
    else
      v7 = 3;
    *((_BYTE *)v4 + 8) = v7 | *((_BYTE *)v4 + 8) & 0xFC;
    v4->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)__allocateContentTransformIfNeeded
{
  SCNMatrix4 *v3;

  if (!self->_contentTransform)
  {
    v3 = (SCNMatrix4 *)malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL);
    self->_contentTransform = v3;
    *v3 = SCNMatrix4Identity;
  }
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_runtimeResolvedPath = 0;
  -[SCNMaterialProperty _clearContents](self, "_clearContents");

  free(self->_contentTransform);
  v3.receiver = self;
  v3.super_class = (Class)SCNMaterialProperty;
  -[SCNMaterialProperty dealloc](&v3, sel_dealloc);
}

- (id)__runtimeResolvedPath
{
  return self->_runtimeResolvedPath;
}

- (void)_setParent:(id)a3
{
  self->_parent = a3;
}

- (void)unlinkCustomPropertyWithParent:(id)a3
{
  self->_customSlot[1].var0.var1 = 0;
  -[SCNMaterialProperty _setParent:](self, "_setParent:", 0);
}

- (void)linkCustomPropertyWithParent:(id)a3 andCustomName:(id)a4
{
  id v7;
  NSString *v8;
  unint64_t v9;

  if (a3 == self)
    v7 = 0;
  else
    v7 = a3;
  self->_parent = v7;

  v8 = (NSString *)objc_msgSend(a4, "copy");
  self->_customSlotName = v8;
  self->_propertyType = 27;
  *((_BYTE *)self + 8) &= ~2u;
  if (v8 && !self->_customSlot)
    self->_customSlot = (__C3DEffectSlot *)C3DEffectSlotCreate(0, 27);
  if ((SCNMaterialProperty *)objc_msgSend(a3, "__CFObject") == self)
    v9 = 0;
  else
    v9 = objc_msgSend(a3, "__CFObject");
  self->_customSlot[1].var0.var1 = v9;
}

uint64_t __37__SCNMaterialProperty__clearContents__block_invoke(uint64_t a1)
{
  return objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "removeSourceRenderersForSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (id)color
{
  void *v3;
  __C3DScene *v4;
  uint64_t v5;
  __C3DEffectSlot *v6;
  uint64_t ColorIfApplicable;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
    if (v6 && (ColorIfApplicable = C3DEffectSlotGetColorIfApplicable((uint64_t)v6)) != 0)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", ColorIfApplicable);
      if (!v5)
        return v3;
    }
    else
    {
      v3 = 0;
      if (!v5)
        return v3;
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  if (self->_contentType)
    return 0;
  return self->_contents;
}

- (id)floatValue
{
  __C3DScene *v4;
  uint64_t v5;
  __C3DEffectSlot *v6;
  uint64_t v7;
  char *ColorIfApplicable;
  int EffectProperty;
  double v10;
  uint64_t v11;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    v6 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
    if (v6)
    {
      v7 = (uint64_t)v6;
      ColorIfApplicable = (char *)C3DEffectSlotGetColorIfApplicable((uint64_t)v6);
      if (ColorIfApplicable)
      {
        EffectProperty = C3DEffectSlotGetEffectProperty(v7);
        v11 = 12;
        if (EffectProperty != 5)
          v11 = 0;
        LODWORD(v10) = *(_DWORD *)&ColorIfApplicable[v11];
        ColorIfApplicable = (char *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
      }
      if (!v5)
        return ColorIfApplicable;
    }
    else
    {
      ColorIfApplicable = 0;
      if (!v5)
        return ColorIfApplicable;
    }
    C3DSceneUnlock(v5);
    return ColorIfApplicable;
  }
  if (self->_contentType == 9)
    return self->_contents;
  return 0;
}

- (void)getC3DImageRef
{
  return self->_c3dImage;
}

- (C3DColor4)color4
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  C3DColor4 result;

  v11 = 0;
  v2 = objc_msgSend((id)scn_NSColorFromCGColorIfApplicable(-[SCNMaterialProperty color](self, "color")), "scn_C3DColorIgnoringColorSpace:success:", 0, &v11);
  if (v11)
    v5 = v3;
  else
    v5 = 0;
  if (v11)
    v6 = v4;
  else
    v6 = 0;
  if (v11)
    v7 = HIDWORD(v2);
  else
    v7 = 0;
  if (v11)
    v8 = v2;
  else
    v8 = 0;
  v9 = v5 | (v6 << 32);
  v10 = v8 | (v7 << 32);
  *(_QWORD *)&result.var0.var1.var2 = v9;
  *(_QWORD *)result.var0.var0 = v10;
  return result;
}

uint64_t __45__SCNMaterialProperty_setMinificationFilter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialFilters");
}

uint64_t __46__SCNMaterialProperty_setMagnificationFilter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialFilters");
}

void __38__SCNMaterialProperty_setSRGBTexture___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "effectSlot"))
    C3DEffectSlotSetSRGB(objc_msgSend(*(id *)(a1 + 32), "effectSlot"), *(unsigned __int8 *)(a1 + 40));
}

- (void)setAttachment:(id)a3
{
  id contents;
  __C3DScene *v6;
  _QWORD v7[6];

  contents = self->_contents;
  if (contents != a3 && (objc_msgSend(contents, "isEqual:") & 1) == 0)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 7;
    v6 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNMaterialProperty_setAttachment___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

uint64_t __37__SCNMaterialProperty_setAttachment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialAttachment:", *(_QWORD *)(a1 + 40));
}

- (id)attachment
{
  if (self->_contentType == 7)
    return self->_contents;
  else
    return 0;
}

- (id)image
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (self->_c3dImage && (self->_contentType != 1 || !self->_contents))
  {
    v3 = +[SCNMaterialProperty copyImageFromC3DImage:](SCNMaterialProperty, "copyImageFromC3DImage:");
    if (v3)
    {
      v4 = v3;
      if ((self->_contentType & 0xFE) == 2)
      {
        v5 = scn_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          -[SCNMaterialProperty image].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
      }

      self->_contents = v4;
      self->_contentType = 1;
    }
  }
  if (self->_contentType == 1)
    return self->_contents;
  else
    return 0;
}

- (id)pvrtcData
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DImage *c3dImage;
  void *Data;

  v3 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  c3dImage = self->_c3dImage;
  if (c3dImage && C3DImageGetTextureRawDataCompression((uint64_t)c3dImage) == 1)
  {
    Data = (void *)C3DImageGetData((uint64_t)self->_c3dImage);
    if (!v4)
      return Data;
    goto LABEL_8;
  }
  Data = 0;
  if (v4)
LABEL_8:
    C3DSceneUnlock(v4);
  return Data;
}

- (void)setSkScene:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 3;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__SCNMaterialProperty_setSkScene___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __34__SCNMaterialProperty_setSkScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialSKScene:", *(_QWORD *)(a1 + 40));
}

- (id)skScene
{
  if (self->_contentType == 3)
    return self->_contents;
  else
    return 0;
}

- (void)setSkTexture:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 4;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__SCNMaterialProperty_setSkTexture___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __36__SCNMaterialProperty_setSkTexture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialSKTexture:", *(_QWORD *)(a1 + 40));
}

- (id)skTexture
{
  if (self->_contentType == 4)
    return self->_contents;
  else
    return 0;
}

- (void)setLayer:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 2;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__SCNMaterialProperty_setLayer___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __32__SCNMaterialProperty_setLayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialLayer:", *(_QWORD *)(a1 + 40));
}

- (id)layer
{
  if (self->_contentType == 2)
    return self->_contents;
  else
    return 0;
}

- (void)setAvPlayer:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 10;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__SCNMaterialProperty_setAvPlayer___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __35__SCNMaterialProperty_setAvPlayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialAVPlayer:", *(_QWORD *)(a1 + 40));
}

- (id)avPlayer
{
  if (self->_contentType == 10)
    return self->_contents;
  else
    return 0;
}

- (void)setCaptureDevice:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 11;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__SCNMaterialProperty_setCaptureDevice___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __40__SCNMaterialProperty_setCaptureDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialCaptureDevice:", *(_QWORD *)(a1 + 40));
}

- (id)captureDevice
{
  if (self->_contentType == 11)
    return self->_contents;
  else
    return 0;
}

- (void)setCaptureDeviceOutputConsumerSource:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 12;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__SCNMaterialProperty_setCaptureDeviceOutputConsumerSource___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __60__SCNMaterialProperty_setCaptureDeviceOutputConsumerSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialCaptureDeviceOutputConsumerSource:", *(_QWORD *)(a1 + 40));
}

- (id)captureDeviceOutputConsumerSource
{
  if (self->_contentType == 12)
    return self->_contents;
  else
    return 0;
}

- (void)setTextureProvider:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 13;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__SCNMaterialProperty_setTextureProvider___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __42__SCNMaterialProperty_setTextureProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialTextureProvider:", *(_QWORD *)(a1 + 40));
}

- (id)textureProvider
{
  if (self->_contentType == 13)
    return self->_contents;
  else
    return 0;
}

- (id)precomputedLightingEnvironment
{
  if (self->_contentType == 14)
    return self->_contents;
  else
    return 0;
}

- (void)_updateMaterialUIComponent:(id)a3
{
  __C3DEffectSlot *v5;
  uint64_t v6;
  CFTypeRef v7;
  const void *v8;
  const void *v9;
  SCNUIKitSource *v10;

  v5 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v5)
  {
    v6 = (uint64_t)v5;
    if (a3)
    {
      v7 = SCNCachedImageProxyFromSource(a3);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
      }
      else
      {
        v8 = (const void *)C3DImageProxyCreate(0);
        v10 = objc_alloc_init(SCNUIKitSource);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SCNUIKitSource setUiView:](v10, "setUiView:", a3);
        else
          -[SCNUIKitSource setUiWindow:](v10, "setUiWindow:", a3);
        -[SCNImageSource connectToProxy:](v10, "connectToProxy:", v8);

        SCNCacheImageProxyWithSource(v8, a3);
        v9 = v8;
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__layerDidChange_, CFSTR("SCNUITreeDidChange"), C3DImageProxyGetSource((uint64_t)v8));
      C3DEffectSlotSetImageProxy(v6, v8);
      if (v9)
        CFRelease(v9);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SCNUITreeDidChange"), 0);
      C3DEffectSlotSetImageProxy(v6, 0);
    }
  }
}

- (void)setUIView:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 8;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__SCNMaterialProperty_setUIView___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __33__SCNMaterialProperty_setUIView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialUIComponent:", *(_QWORD *)(a1 + 40));
}

- (id)UIView
{
  if (self->_contentType == 8)
    return self->_contents;
  else
    return 0;
}

- (void)setUIWindow:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 8;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__SCNMaterialProperty_setUIWindow___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __35__SCNMaterialProperty_setUIWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialUIComponent:", *(_QWORD *)(a1 + 40));
}

+ (id)dvt_supportedTypesForPropertyContents
{
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = NSClassFromString(CFSTR("SKScene"));
  v3[7] = NSClassFromString(CFSTR("GLKTextureInfo"));
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = NSClassFromString(CFSTR("AVPlayer"));
  v3[11] = NSClassFromString(CFSTR("AVCaptureDevice"));
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 14);
}

- (void)_setImagePath:(id)a3 withResolvedPath:(id)a4
{
  id runtimeResolvedPath;

  -[SCNMaterialProperty _updateC3DImageWithContents:](self, "_updateC3DImageWithContents:", a4);
  -[SCNMaterialProperty _clearContents](self, "_clearContents");
  self->_contents = a3;
  self->_contentType = 1;
  runtimeResolvedPath = self->_runtimeResolvedPath;
  if (runtimeResolvedPath != a4)
  {

    self->_runtimeResolvedPath = a4;
  }
}

- (CGFloat)maxAnisotropy
{
  float Anisotropy;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    Anisotropy = C3DTextureSamplerGetAnisotropy((uint64_t)-[SCNMaterialProperty textureSampler](self, "textureSampler"));
    if (v5)
      C3DSceneUnlock(v5);
  }
  else
  {
    return self->_maxAnisotropy;
  }
  return Anisotropy;
}

- (void)setMaxAnisotropy:(CGFloat)maxAnisotropy
{
  float v3;
  __C3DScene *v5;
  _QWORD v6[5];
  float v7;

  v3 = maxAnisotropy;
  if (self->_maxAnisotropy != v3)
  {
    self->_maxAnisotropy = v3;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__SCNMaterialProperty_setMaxAnisotropy___block_invoke;
    v6[3] = &unk_1EA5A2D30;
    v6[4] = self;
    v7 = v3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

int8x8_t __40__SCNMaterialProperty_setMaxAnisotropy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int8x8_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "textureSampler");
  if (v2)
    return C3DTextureSamplerSetAnisotropy(v2, *(float *)(a1 + 40));
  return result;
}

- (void)setProceduralContents:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 6;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__SCNMaterialProperty_setProceduralContents___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __45__SCNMaterialProperty_setProceduralContents___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialProceduralContents:", *(_QWORD *)(a1 + 40));
}

- (id)proceduralContents
{
  if (self->_contentType == 6)
    return self->_contents;
  else
    return 0;
}

- (void)setMtlTexture:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_contents != a3)
  {
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = a3;
    self->_contentType = 5;
    v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__SCNMaterialProperty_setMtlTexture___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __37__SCNMaterialProperty_setMtlTexture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaterialMTLTexture:", *(_QWORD *)(a1 + 40));
}

- (id)mtlTexture
{
  if (self->_contentType == 5)
    return self->_contents;
  else
    return 0;
}

uint64_t __44__SCNMaterialProperty_setContentsTransform___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];

  v1 = *(void **)(a1 + 96);
  v2 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v2;
  v3 = *(_OWORD *)(a1 + 80);
  v5[2] = *(_OWORD *)(a1 + 64);
  v5[3] = v3;
  return objc_msgSend(v1, "_updateMaterialPropertyTransform:", v5);
}

- (NSString)description
{
  id v3;
  void *v4;
  objc_class *v5;
  NSString *v6;

  v3 = -[SCNMaterialProperty contents](self, "contents");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<data %p>"), v3);
  return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p | contents=%@>"), v6, self, v3);
}

+ (__C3DImage)copyC3DImageFromImage:(id)a3 textureOptions:(int)a4
{
  return (__C3DImage *)objc_msgSend(a1, "copyC3DImageFromImage:textureOptions:wasCached:", a3, *(_QWORD *)&a4, 0);
}

+ (__C3DImage)copyC3DImageFromImage:(id)a3
{
  return (__C3DImage *)objc_msgSend(a1, "copyC3DImageFromImage:textureOptions:", a3, 0);
}

+ (id)_copyImageFromC3DImage:(__C3DImage *)a3
{
  CGImage *v3;
  void *v4;

  v3 = C3DImageCopyCGImage((uint64_t)a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", v3);
  CGImageRelease(v3);
  return v4;
}

- (void)parentWillDie:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_parent != a3)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[SCNMaterialProperty parentWillDie:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  self->_parent = 0;
}

- (id)parent
{
  return self->_parent;
}

- (__C3DTextureSampler)textureSampler
{
  __C3DTextureSampler *result;

  result = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (result)
    return (__C3DTextureSampler *)C3DEffectSlotGetTextureSampler((uint64_t)result);
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return (id)objc_msgSend(self->_parent, "copyAnimationChannelForKeyPath:property:", a3, self);
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  if (result)
    return (__C3DAnimationManager *)C3DSceneGetAnimationManager((uint64_t)result);
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_animationsLock;
  BOOL v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a4)
    return 0;
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v8 = objc_msgSend(-[SCNOrderedDictionary objectForKey:](self->_animations, "objectForKey:", a4), "animation") == (_QWORD)a3;
  if (v8)
  {
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a4);
    v9 = -[SCNMaterialProperty __CFObject](self, "__CFObject");
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[SCNLight __removeAnimation:forKey:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    C3DEntityRemoveAnimationForKey(v9, a4, 1);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v8;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  id v5;
  SCNOrderedDictionary *animations;
  __C3DScene *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];

  if (a3)
  {
    v5 = a4;
    if (!a4)
      v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(SCNOrderedDictionary);
      self->_animations = animations;
    }
    -[SCNOrderedDictionary setObject:forKey:](animations, "setObject:forKey:", a3, v5);
    os_unfair_lock_unlock(&self->_animationsLock);
    v8 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__SCNMaterialProperty_addAnimationPlayer_forKey___block_invoke;
    v16[3] = &unk_1EA59F718;
    v16[4] = a3;
    v16[5] = self;
    v16[6] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v16);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNTechnique addAnimationPlayer:forKey:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
  }
}

void __49__SCNMaterialProperty_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 8);
    objc_msgSend(*((id *)a1[5] + 5), "removeObjectForKey:", a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 8);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v5;
  SCNAnimation *v6;
  SCNAnimationPlayer *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    v5 = a4;
    v6 = (SCNAnimation *)a3;
    if (!a4)
      v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", v6);
    v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:](SCNAnimationPlayer, "animationPlayerWithSCNAnimation:", v6);
    -[SCNMaterialProperty addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
    -[SCNAnimationPlayer play](v7, "play");
  }
  else
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNTechnique addAnimation:forKey:].cold.1((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)addAnimation:(id)a3
{
  -[SCNMaterialProperty addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
}

- (void)removeAllAnimations
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v4;
  _QWORD v5[5];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  -[SCNOrderedDictionary removeAllObjects](self->_animations, "removeAllObjects");
  os_unfair_lock_unlock(p_animationsLock);
  v4 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SCNMaterialProperty_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __42__SCNMaterialProperty_removeAllAnimations__block_invoke(uint64_t a1)
{
  SCNRemoveAllAnimations(*(void **)(a1 + 32));
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v6;
  _QWORD v7[6];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  -[SCNOrderedDictionary removeAllObjects](self->_animations, "removeAllObjects");
  os_unfair_lock_unlock(p_animationsLock);
  v6 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SCNMaterialProperty_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __63__SCNMaterialProperty_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
{
  SCNFadeAndRemoveAllAnimations(*(void **)(a1 + 32), *(double *)(a1 + 40));
}

- (void)removeAnimationForKey:(id)a3
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v6;
  _QWORD v7[6];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a3);
    os_unfair_lock_unlock(p_animationsLock);
    v6 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__SCNMaterialProperty_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __45__SCNMaterialProperty_removeAnimationForKey___block_invoke(uint64_t a1)
{
  SCNRemoveAnimation(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v8;
  _QWORD v9[7];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a3);
    os_unfair_lock_unlock(p_animationsLock);
    v8 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__SCNMaterialProperty_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __62__SCNMaterialProperty_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
  SCNFadeAndRemoveAnimation(*(void **)(a1 + 32), *(void **)(a1 + 40), *(double *)(a1 + 48));
}

- (id)animationForKey:(id)a3
{
  id v3;

  v3 = -[SCNMaterialProperty _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0CD26F8], "animationWithSCNAnimation:", v3);
}

- (id)_scnAnimationForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  SCNOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = (id)objc_msgSend(-[SCNOrderedDictionary objectForKey:](animations, "objectForKey:", v3), "animation");
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (id)animationPlayerForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  SCNOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = -[SCNOrderedDictionary objectForKey:](animations, "objectForKey:", v3);
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  void *v9;
  void *v10;
  __C3DAnimationManager *v11;
  uint64_t v12;
  double v13;

  v5 = a5;
  v7 = a3;
  v9 = -[SCNMaterialProperty __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNMaterialProperty animationManager](self, "animationManager");
    if (v11)
    {
      v12 = (uint64_t)v11;
      v13 = CACurrentMediaTime();
      C3DAnimationManagerPauseAnimationForKey(v12, v10, a4, v7, v5, v13);
    }
  }
}

- (void)pauseAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SCNMaterialProperty_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __44__SCNMaterialProperty_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SCNMaterialProperty_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __45__SCNMaterialProperty_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__SCNMaterialProperty_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __48__SCNMaterialProperty_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float result;
  void *v4;
  uint64_t v5;
  float v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    v4 = (void *)v2;
    v5 = objc_msgSend(*(id *)(a1 + 32), "animationManager");
    if (v5)
    {
      v6 = *(double *)(a1 + 48);
      C3DAnimationManagerChangeSpeedOfAnimationForKey(v5, v4, *(const void **)(a1 + 40), v6);
    }
  }
  return result;
}

- (BOOL)isAnimationForKeyPaused:(id)a3
{
  __C3DScene *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __C3DAnimationManager *v9;
  char IsPaused;

  v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNMaterialProperty __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNMaterialProperty animationManager](self, "animationManager");
    if (v9)
    {
      IsPaused = C3DAnimationManagerGetAnimationForKeyIsPaused((uint64_t)v9, v8, a3);
      if (!v6)
        return IsPaused;
      goto LABEL_8;
    }
  }
  IsPaused = 0;
  if (v6)
LABEL_8:
    C3DSceneUnlock(v6);
  return IsPaused;
}

- (id)_scnBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  C3DBinding *v13;
  NSMutableDictionary *bindings;
  __C3DScene *v15;
  _QWORD v16[17];

  if (self != a4)
  {
    v16[15] = v6;
    v16[16] = v7;
    v13 = objc_alloc_init(C3DBinding);
    -[C3DBinding setSourceObject:](v13, "setSourceObject:", a4);
    -[C3DBinding setKeyPathDst:](v13, "setKeyPathDst:", a3);
    -[C3DBinding setKeyPathSrc:](v13, "setKeyPathSrc:", a5);
    -[C3DBinding setOptions:](v13, "setOptions:", a6);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_bindings = bindings;
    }
    -[NSMutableDictionary setValue:forKey:](bindings, "setValue:forKey:", v13, a3);

    v15 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__SCNMaterialProperty_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __71__SCNMaterialProperty_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
{
  float32x4_t *v2;
  C3DBinding *v3;

  v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  v3 = objc_alloc_init(C3DBinding);
  -[C3DBinding setSourceObject:](v3, "setSourceObject:", objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
  -[C3DBinding setKeyPathDst:](v3, "setKeyPathDst:", *(_QWORD *)(a1 + 48));
  -[C3DBinding setKeyPathSrc:](v3, "setKeyPathSrc:", *(_QWORD *)(a1 + 56));
  -[C3DBinding setOptions:](v3, "setOptions:", *(_QWORD *)(a1 + 64));
  C3DEntityAddBinding(v2, v3);

}

- (void)unbindAnimatablePath:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  -[NSMutableDictionary removeObjectForKey:](self->_bindings, "removeObjectForKey:");
  if (!-[NSMutableDictionary count](self->_bindings, "count"))
  {

    self->_bindings = 0;
  }
  v5 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SCNMaterialProperty_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __44__SCNMaterialProperty_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNMaterialProperty sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SCNMaterialProperty_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __40__SCNMaterialProperty_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "materialPropertyWithContents:", 0);
  v5 = v4;
  objc_msgSend(v4, "copyPropertiesFrom:", self);
  return v4;
}

- (id)copy
{
  return -[SCNMaterialProperty copyWithZone:](self, "copyWithZone:", 0);
}

- (id)presentationMaterialProperty
{
  if ((*((_BYTE *)self + 8) & 1) == 0)
    return -[SCNMaterialProperty initPresentationMaterialPropertyWithModelProperty:]([SCNMaterialProperty alloc], "initPresentationMaterialPropertyWithModelProperty:", self);
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)_updateMaterialPropertyTransform:(C3DMatrix4x4 *)a3
{
  __C3DEffectSlot *v4;

  v4 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v4)
    C3DEffectSlotSetImageTransform((uint64_t)v4, (__int128 *)a3);
}

- (void)_updateMaterialAttachment:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  __int128 v15;
  float64_t v16;
  uint64_t v17;
  float64x2_t v18;
  int v19;
  unsigned int v20;
  __C3DEffectSlot *v21;
  const void *v22;
  __int128 v23;
  float64_t v24;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[SCNMaterialProperty _updateMaterialAttachment:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    v13 = objc_msgSend(a3, "glID");
    v14 = objc_msgSend(a3, "target");
    objc_msgSend(a3, "size");
    v17 = 0;
    if (v13 && v14 && *(double *)&v15 > 0.0)
    {
      v23 = v15;
      v24 = v16;
      v17 = C3DTextureCreate();
      C3DTextureSetID(v17, v13, v14);
      *(_QWORD *)&v18.f64[0] = v23;
      v18.f64[1] = v24;
      C3DTextureSetSize(v17, COERCE_DOUBLE(vcvt_f32_f64(v18)));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "valueForKey:", CFSTR("offsetX")), "floatValue");
      LODWORD(v24) = v19;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "valueForKey:", CFSTR("offsetY")), "floatValue");
      C3DTextureSetOffset(v17, COERCE_DOUBLE(__PAIR64__(v20, LODWORD(v24))));
      C3DTextureSetHasAlpha(v17, 1);
    }
  }
  else
  {
    v17 = 0;
  }
  v21 = -[SCNMaterialProperty effectSlot](self, "effectSlot", v23);
  if (v21)
  {
    if (v17)
      v22 = (const void *)v17;
    else
      v22 = 0;
    C3DEffectSlotSetTexture((uint64_t)v21, v22);
  }
}

- (void)_layerDidChange:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "postNotificationName:object:", CFSTR("kC3DSceneDidUpdateNotification"), -[SCNMaterialProperty sceneRef](self, "sceneRef"));
}

- (void)_skSceneDidChange:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3), "postNotificationName:object:", CFSTR("kC3DSceneDidUpdateNotification"), -[SCNMaterialProperty sceneRef](self, "sceneRef"));
}

- (void)_updateMaterialSKScene:(id)a3
{
  __C3DEffectSlot *v5;
  uint64_t v6;
  void *v7;
  CFTypeRef v8;
  const void *v9;
  SCNSpriteKitSource *v10;

  v5 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v5)
  {
    v6 = (uint64_t)v5;
    if (a3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__skSceneDidChange_, CFSTR("kC3DSceneDidUpdateNotification"), a3);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
      v8 = SCNCachedImageProxyFromSource(v7);
      if (v8)
      {
        C3DEffectSlotSetImageProxy(v6, v8);
      }
      else
      {
        v9 = (const void *)C3DImageProxyCreate(0);
        v10 = objc_alloc_init(SCNSpriteKitSource);
        -[SCNSpriteKitSource setScene:](v10, "setScene:", a3);
        -[SCNImageSource connectToProxy:](v10, "connectToProxy:", v9);

        SCNCacheImageProxyWithSource(v9, v7);
        C3DEffectSlotSetImageProxy(v6, v9);
        if (v9)
          CFRelease(v9);
      }
    }
    else
    {
      C3DEffectSlotSetImageProxy((uint64_t)v5, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kC3DSceneDidUpdateNotification"), 0);
    }
  }
}

- (void)_updateMaterialMTLTexture:(id)a3
{
  __C3DEffectSlot *v4;
  id v5;

  v4 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v4)
  {
    if (a3)
      v5 = a3;
    else
      v5 = 0;
    C3DEffectSlotSetMTLTexture((uint64_t)v4, v5);
  }
}

- (void)_updateMaterialSKTexture:(id)a3
{
  __C3DEffectSlot *v5;
  uint64_t v6;
  const void *v7;
  __C3DEffectSlot *v8;
  __C3DEffectCommonProfile *v9;
  unsigned int v10;
  unsigned int v11;
  const void *v12;
  __C3DEffectSlot *v13;
  __int16 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  SCNMatrix4 v21;
  SCNMatrix4 v22;
  SCNMatrix4 v23;
  SCNMatrix4 b;
  SCNMatrix4 a;

  v5 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (!v5)
    return;
  if (!a3)
  {
    C3DEffectSlotSetTexture((uint64_t)v5, 0);
    return;
  }
  if (C3DMetalIsUsed())
  {
    v6 = objc_msgSend(a3, "metalTexture");
    if (v6)
    {
      v7 = (const void *)v6;
      v8 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
      v9 = -[SCNMaterialProperty commonProfile](self, "commonProfile");
      if (v9)
        C3DEffectCommonProfileSetMTLTexture((uint64_t)v9, self->_propertyType, v7);
      else
        C3DEffectSlotSetMTLTexture((uint64_t)v8, v7);
      if (objc_msgSend(a3, "hasAlpha"))
        v14 = 0;
      else
        v14 = 256;
      *((_WORD *)v8 + 24) = *((_WORD *)v8 + 24) & 0xFEFF | v14;
    }
    goto LABEL_23;
  }
  -[objc_class setPrefersOpenGL:](NSClassFromString(CFSTR("SKSCNRenderer")), "setPrefersOpenGL:", 1);
  v10 = objc_msgSend(a3, "glTextureId");
  if (v10)
  {
    v11 = v10;
    v12 = (const void *)C3DTextureCreate();
    C3DTextureSetID((uint64_t)v12, v11, 3553);
    if (objc_msgSend(a3, "hasAlpha"))
      C3DTextureSetHasAlpha((uint64_t)v12, 1);
    C3DTextureSetFormat((uint64_t)v12, objc_msgSend(a3, "textureTarget"));
  }
  else
  {
    v12 = 0;
  }
  v13 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (-[SCNMaterialProperty commonProfile](self, "commonProfile"))
  {
    C3DEffectCommonProfileSetTexture((uint64_t)-[SCNMaterialProperty commonProfile](self, "commonProfile"), self->_propertyType, v12);
    if (!v12)
      goto LABEL_23;
    goto LABEL_17;
  }
  C3DEffectSlotSetTexture((uint64_t)v13, v12);
  if (v12)
LABEL_17:
    CFRelease(v12);
LABEL_23:
  objc_msgSend(a3, "textureRect");
  memset(&v21, 0, sizeof(v21));
  *(float *)&v15 = v15;
  *(float *)&v16 = v16;
  *(float *)&v17 = v17;
  *(float *)&v18 = v18;
  *(_QWORD *)&a.m14 = 0;
  *(_QWORD *)&a.m12 = 0;
  a.m11 = *(float *)&v17;
  a.m22 = *(float *)&v18;
  *(_QWORD *)&a.m23 = 0;
  *(_QWORD *)&a.m31 = 0;
  *(_QWORD *)&a.m42 = 0;
  *(_QWORD *)&a.m34 = 0;
  a.m33 = 1.0;
  a.m44 = 1.0;
  *(_QWORD *)&b.m14 = 0;
  *(_QWORD *)&b.m12 = 0;
  b.m11 = 1.0;
  b.m22 = 1.0;
  *(_QWORD *)&b.m23 = 0;
  *(_QWORD *)&b.m31 = 0;
  *(_QWORD *)&b.m33 = 1065353216;
  b.m41 = *(float *)&v15;
  b.m42 = *(float *)&v16;
  *(_QWORD *)&b.m43 = 0x3F80000000000000;
  SCNMatrix4Mult(&v21, &a, &b);
  *(_QWORD *)&b.m14 = 0;
  *(_QWORD *)&b.m12 = 0;
  b.m11 = 1.0;
  b.m22 = 1.0;
  *(_QWORD *)&b.m23 = 0;
  *(_QWORD *)&b.m31 = 0;
  *(_OWORD *)&b.m33 = xmmword_1DD02AB80;
  *(_QWORD *)&b.m43 = 0x3F80000000000000;
  v23 = v21;
  SCNMatrix4Mult(&a, &b, &v23);
  v21 = a;
  if (objc_msgSend(a3, "isRotated"))
  {
    memset(&a, 0, sizeof(a));
    SCNMatrix4MakeRotation(&a, -1.5708, 0.0, 0.0, 1.0);
    v23 = a;
    v22 = v21;
    SCNMatrix4Mult(&b, &v23, &v22);
    v21 = b;
  }
  memset(&b.m22, 0, 40);
  *(_OWORD *)&b.m12 = 0u;
  b.m11 = 1.0;
  b.m22 = -1.0;
  b.m33 = 1.0;
  b.m44 = 1.0;
  v23 = v21;
  SCNMatrix4Mult(&a, &b, &v23);
  v21 = a;
  *(_QWORD *)&v23.m14 = 0;
  *(_QWORD *)&v23.m12 = 0;
  v23.m11 = 1.0;
  v23.m22 = 1.0;
  *(_QWORD *)&v23.m23 = 0;
  *(_QWORD *)&v23.m31 = 0;
  *(_OWORD *)&v23.m33 = xmmword_1DD02AB90;
  *(_QWORD *)&v23.m43 = 0x3F80000000000000;
  v22 = a;
  SCNMatrix4Mult(&a, &v23, &v22);
  v21 = a;
  v19 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
  if (!v19)
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  a = v21;
  -[SCNMaterialProperty setContentsTransform:](self, "setContentsTransform:", &a);
  -[SCNMaterialProperty setWrapS:](self, "setWrapS:", 1);
  -[SCNMaterialProperty setWrapT:](self, "setWrapT:", 1);
  -[SCNMaterialProperty setMinificationFilter:](self, "setMinificationFilter:", 2 * (objc_msgSend(a3, "filteringMode") == 1));
  -[SCNMaterialProperty setMagnificationFilter:](self, "setMagnificationFilter:", 2 * (objc_msgSend(a3, "filteringMode") == 1));
  if (objc_msgSend(a3, "usesMipmaps"))
    v20 = 2;
  else
    v20 = 0;
  -[SCNMaterialProperty setMipFilter:](self, "setMipFilter:", v20);
  if (!v19)
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 0);
}

- (void)_updateMaterialLayer:(id)a3
{
  __C3DEffectSlot *v5;
  uint64_t v6;
  CFTypeRef v7;
  const void *v8;
  SCNCoreAnimationSource *v9;

  v5 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v5)
  {
    v6 = (uint64_t)v5;
    if (a3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__layerDidChange_, CFSTR("SCNLayerTreeDidChange"), a3);
      v7 = SCNCachedImageProxyFromSource(a3);
      if (v7)
      {
        C3DEffectSlotSetImageProxy(v6, v7);
      }
      else
      {
        v8 = (const void *)C3DImageProxyCreate(0);
        v9 = objc_alloc_init(SCNCoreAnimationSource);
        -[SCNCoreAnimationSource setLayer:](v9, "setLayer:", a3);
        -[SCNImageSource connectToProxy:](v9, "connectToProxy:", v8);

        SCNCacheImageProxyWithSource(v8, a3);
        C3DEffectSlotSetImageProxy(v6, v8);
        if (v8)
          CFRelease(v8);
      }
    }
    else
    {
      C3DEffectSlotSetImageProxy((uint64_t)v5, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SCNLayerTreeDidChange"), 0);
    }
  }
}

- (void)_updateMaterialAVPlayer:(id)a3
{
  __C3DEffectSlot *v4;
  uint64_t v5;
  CFTypeRef v6;
  const void *v7;
  const void *v8;
  SCNAVPlayerSource *v9;

  v4 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v4)
  {
    v5 = (uint64_t)v4;
    if (!a3)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = SCNCachedImageProxyFromSource(a3);
    if (v6)
    {
      v7 = v6;
      v4 = (__C3DEffectSlot *)v5;
LABEL_6:
      C3DEffectSlotSetImageProxy((uint64_t)v4, v7);
      return;
    }
    v8 = (const void *)C3DImageProxyCreate(1);
    v9 = objc_alloc_init(SCNAVPlayerSource);
    -[SCNAVPlayerSource setPlayer:](v9, "setPlayer:", a3);
    -[SCNAVPlayerSource connectToProxy:](v9, "connectToProxy:", v8);

    SCNCacheImageProxyWithSource(v8, a3);
    C3DEffectSlotSetImageProxy(v5, v8);
    if (v8)
      CFRelease(v8);
  }
}

- (void)_updateMaterialCaptureDevice:(id)a3
{
  __C3DEffectSlot *v4;
  uint64_t v5;
  CFTypeRef v6;
  const void *v7;
  const void *v8;
  SCNCaptureDeviceSource *v9;

  v4 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v4)
  {
    v5 = (uint64_t)v4;
    if (!a3)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = SCNCachedImageProxyFromSource(a3);
    if (v6)
    {
      v7 = v6;
      v4 = (__C3DEffectSlot *)v5;
LABEL_6:
      C3DEffectSlotSetImageProxy((uint64_t)v4, v7);
      return;
    }
    v8 = (const void *)C3DImageProxyCreate(2);
    v9 = objc_alloc_init(SCNCaptureDeviceSource);
    -[SCNCaptureDeviceSource setCaptureDevice:](v9, "setCaptureDevice:", a3);
    -[SCNCaptureDeviceSource connectToProxy:](v9, "connectToProxy:", v8);

    SCNCacheImageProxyWithSource(v8, a3);
    C3DEffectSlotSetImageProxy(v5, v8);
    if (v8)
      CFRelease(v8);
  }
}

- (void)_updateMaterialCaptureDeviceOutputConsumerSource:(id)a3
{
  __C3DEffectSlot *v4;
  uint64_t v5;
  CFTypeRef v6;
  const void *v7;
  const void *v8;

  v4 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v4)
  {
    v5 = (uint64_t)v4;
    if (!a3)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = SCNCachedImageProxyFromSource(a3);
    if (v6)
    {
      v7 = v6;
      v4 = (__C3DEffectSlot *)v5;
LABEL_6:
      C3DEffectSlotSetImageProxy((uint64_t)v4, v7);
      return;
    }
    v8 = (const void *)C3DImageProxyCreate(3);
    objc_msgSend(a3, "connectToProxy:", v8);
    SCNCacheImageProxyWithSource(v8, a3);
    C3DEffectSlotSetImageProxy(v5, v8);
    if (v8)
      CFRelease(v8);
  }
}

- (void)_updateMaterialTextureProvider:(id)a3
{
  __C3DEffectSlot *v4;
  uint64_t v5;
  CFTypeRef v6;
  const void *v7;
  const void *v8;
  SCNMaterialPropertyTextureProviderSource *v9;

  v4 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  if (v4)
  {
    v5 = (uint64_t)v4;
    if (!a3)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = SCNCachedImageProxyFromSource(a3);
    if (v6)
    {
      v7 = v6;
      v4 = (__C3DEffectSlot *)v5;
LABEL_6:
      C3DEffectSlotSetImageProxy((uint64_t)v4, v7);
      return;
    }
    v8 = (const void *)C3DImageProxyCreate(0);
    v9 = objc_alloc_init(SCNMaterialPropertyTextureProviderSource);
    -[SCNMaterialPropertyTextureProviderSource setTextureProvider:](v9, "setTextureProvider:", a3);
    -[SCNMaterialPropertyTextureProviderSource connectToProxy:](v9, "connectToProxy:", v8);

    SCNCacheImageProxyWithSource(v8, a3);
    C3DEffectSlotSetImageProxy(v5, v8);
    if (v8)
      CFRelease(v8);
  }
}

- (void)_updateMaterialProceduralContents:(id)a3
{
  __C3DEffectSlot *v4;
  uint64_t v5;
  CFTypeRef v6;
  const void *v7;
  const void *v8;
  SCNDelegateSource *v9;

  v4 = -[SCNMaterialProperty effectSlot](self, "effectSlot");
  v5 = (uint64_t)v4;
  if (!a3)
  {
    v7 = 0;
    goto LABEL_5;
  }
  v6 = SCNCachedImageProxyFromSource(a3);
  if (v6)
  {
    v7 = v6;
    v4 = (__C3DEffectSlot *)v5;
LABEL_5:
    C3DEffectSlotSetImageProxy((uint64_t)v4, v7);
    return;
  }
  v8 = (const void *)C3DImageProxyCreate(0);
  v9 = objc_alloc_init(SCNDelegateSource);
  -[SCNDelegateSource setDelegate:](v9, "setDelegate:", a3);
  -[SCNImageSource connectToProxy:](v9, "connectToProxy:", v8);

  SCNCacheImageProxyWithSource(v8, a3);
  C3DEffectSlotSetImageProxy(v5, v8);
  if (v8)
    CFRelease(v8);
}

+ (id)captureDeviceOutputConsumer
{
  return (id)objc_msgSend(a1, "captureDeviceOutputConsumerWithOptions:", 0);
}

+ (id)captureDeviceOutputConsumerWithOptions:(id)a3
{
  return -[SCNCaptureDeviceOutputConsumerSource initWithOptions:]([SCNCaptureDeviceOutputConsumerSource alloc], "initWithOptions:", a3);
}

- (void)_customEncodingOfSCNMaterialProperty:(id)a3
{
  SCNMatrix4 *contentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id contents;
  double v10;
  uint64_t textureComponents;
  int contentType;
  __C3DImage *c3dImage;
  _OWORD v14[4];

  contentTransform = self->_contentTransform;
  if (contentTransform)
  {
    v6 = *(_OWORD *)&contentTransform->m11;
    v7 = *(_OWORD *)&contentTransform->m21;
    v8 = *(_OWORD *)&contentTransform->m41;
    v14[2] = *(_OWORD *)&contentTransform->m31;
    v14[3] = v8;
    v14[0] = v6;
    v14[1] = v7;
    SCNEncodeSCNMatrix4(a3, CFSTR("contentsTransform"), (uint64_t)v14);
  }
  if (self->_contents)
  {
    if (self->_contentType == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        SCNEncodeImageArray(a3, (uint64_t)CFSTR("imageArray"), self->_contents);
        goto LABEL_14;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("SCNSceneExportEmbedImages")), "BOOLValue")|| (contents = self->_runtimeResolvedPath) == 0)
    {
      contents = self->_contents;
    }
    goto LABEL_13;
  }
  contents = self->_contents;
  if (!contents)
  {
    c3dImage = self->_c3dImage;
    if (!c3dImage)
      goto LABEL_14;
    goto LABEL_35;
  }
  contentType = self->_contentType;
  if (contentType == 1)
  {
LABEL_13:
    SCNEncodeImageContents(a3, (uint64_t)CFSTR("image"), contents);
    goto LABEL_14;
  }
  c3dImage = self->_c3dImage;
  if (c3dImage)
  {
LABEL_35:
    SCNEncodeC3DImage(a3, (uint64_t)CFSTR("image"), (uint64_t)c3dImage);
    goto LABEL_14;
  }
  if (!self->_contentType)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
    contentType = self->_contentType;
  }
  if (contentType == 9)
  {
    objc_msgSend(self->_contents, "floatValue");
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("float"));
    contentType = self->_contentType;
  }
  if (contentType == 2)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_contents, (uint64_t)CFSTR("layer"));
    contentType = self->_contentType;
  }
  if (contentType == 3)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_contents, (uint64_t)CFSTR("skscene"));
    contentType = self->_contentType;
  }
  if (contentType == 4)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_contents, (uint64_t)CFSTR("sktexture"));
    contentType = self->_contentType;
  }
  if (contentType == 5)
  {
    SCNEncodeMTLTextureAsDataForKey(a3, (uint64_t)self->_contents, (uint64_t)CFSTR("data"));
    contentType = self->_contentType;
  }
  if (contentType == 14)
    objc_msgSend(a3, "encodeObject:forKey:", self->_contents, CFSTR("precomputedLightingEnvironment"));
LABEL_14:
  objc_msgSend(a3, "encodeInteger:forKey:", self->_mappingChannel, CFSTR("mappingChannel"));
  textureComponents = self->_textureComponents;
  if (textureComponents != 15)
    objc_msgSend(a3, "encodeInteger:forKey:", textureComponents, CFSTR("textureComponents"));
  *(float *)&v10 = self->_maxAnisotropy;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maxAnisotropy"), v10);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_minificationFilter, CFSTR("minificationFilter"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_magnificationFilter, CFSTR("magnificationFilter"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_mipFilter, CFSTR("mipFilter"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_wrapS, CFSTR("wrapS"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_wrapT, CFSTR("wrapT"));
}

- (void)_didDecodeSCNMaterialProperty:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  SCNMaterialProperty *v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  float v14;
  __C3DEffectSlot *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  _OWORD v38[4];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD block[6];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (self->_customSlotName && !self->_customSlot)
    self->_customSlot = (__C3DEffectSlot *)C3DEffectSlotCreate(0, 27);
  v5 = SCNDecodeImageContents(a3, (uint64_t)CFSTR("image"));
  if (v5)
  {
    v6 = v5;
    v7 = SCNEnclosingURLForSceneDecoder(a3);
    if (v7)
    {
      v8 = SCNResolveImageContents(v6, v7);
      if (v8)
      {
        -[SCNMaterialProperty _setImagePath:withResolvedPath:](self, "_setImagePath:withResolvedPath:", v6, v8);
LABEL_12:
        v12 = 1;
        goto LABEL_13;
      }
    }
    v9 = self;
    v10 = v6;
LABEL_11:
    -[SCNMaterialProperty setContents:](v9, "setContents:", v10);
    goto LABEL_12;
  }
  v11 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  if (v11)
  {
    v10 = (void *)v11;
    v9 = self;
    goto LABEL_11;
  }
  v16 = SCNDecodeImageArray(a3, (uint64_t)CFSTR("imageArray"));
  if (v16)
  {
    v17 = v16;
    v18 = SCNEnclosingURLForSceneDecoder(a3);
    if (!v18)
    {
LABEL_37:
      -[SCNMaterialProperty setContents:](self, "setContents:", v17);
      goto LABEL_12;
    }
    v19 = v18;
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v45;
LABEL_30:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v17);
        v24 = SCNResolveImageContents(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v23), v19);
        if (!v24)
          goto LABEL_37;
        objc_msgSend(v20, "addObject:", v24);
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v21)
            goto LABEL_30;
          break;
        }
      }
    }
    -[SCNMaterialProperty _updateC3DImageWithContents:](self, "_updateC3DImageWithContents:", v20);
    -[SCNMaterialProperty _clearContents](self, "_clearContents");
    self->_contents = v17;
    v12 = 1;
    self->_contentType = 1;
  }
  else
  {
    v25 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    if (v25)
    {
      -[SCNMaterialProperty setColor:](self, "setColor:", v25);
      goto LABEL_12;
    }
    v26 = pthread_main_np();
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
    }
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v28 = SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("layer"), v27);
    if (v28)
    {
      -[SCNMaterialProperty setLayer:](self, "setLayer:", v28);
      if (!v26)
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      goto LABEL_12;
    }
    if (!v26)
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v29 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v30 = SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("attachment"), v29);
    if (v30)
    {
      -[SCNMaterialProperty setAttachment:](self, "setAttachment:", v30);
      goto LABEL_12;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("skscene")))
    {
      if (NSClassFromString(CFSTR("SKScene")))
      {
        *(_QWORD *)&v39 = 0;
        *((_QWORD *)&v39 + 1) = &v39;
        *(_QWORD *)&v40 = 0x3052000000;
        *((_QWORD *)&v40 + 1) = __Block_byref_object_copy__8;
        *(_QWORD *)&v41 = __Block_byref_object_dispose__8;
        *((_QWORD *)&v41 + 1) = 0;
        if (C3DIsRunningInXcode() && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __53__SCNMaterialProperty__didDecodeSCNMaterialProperty___block_invoke;
          block[3] = &unk_1EA5A2D80;
          block[4] = a3;
          block[5] = &v39;
          dispatch_sync(MEMORY[0x1E0C80D38], block);
          v31 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 40);
        }
        else
        {
          v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", NSClassFromString(CFSTR("SKScene")));
          v31 = SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("skscene"), v32);
          *(_QWORD *)(*((_QWORD *)&v39 + 1) + 40) = v31;
        }
        if (v31)
        {
          -[SCNMaterialProperty setSkScene:](self, "setSkScene:");
          _Block_object_dispose(&v39, 8);
          goto LABEL_12;
        }
        _Block_object_dispose(&v39, 8);
      }
      else
      {
        v33 = scn_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[SCNMaterialProperty _didDecodeSCNMaterialProperty:].cold.1();
      }
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("sktexture")))
    {
      if (NSClassFromString(CFSTR("SKTexture")))
      {
        v34 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", NSClassFromString(CFSTR("SKTexture")));
        v35 = SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("sktexture"), v34);
        if (v35)
        {
          -[SCNMaterialProperty setSkTexture:](self, "setSkTexture:", v35);
          goto LABEL_12;
        }
      }
      else
      {
        v36 = scn_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[SCNMaterialProperty _didDecodeSCNMaterialProperty:].cold.1();
      }
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("float")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("float"));
      -[SCNMaterialProperty setFloatValue:](self, "setFloatValue:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"));
      goto LABEL_12;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("precomputedLightingEnvironment")))
    {
      v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      -[SCNMaterialProperty setPrecomputedLightingEnvironment:](self, "setPrecomputedLightingEnvironment:", SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("precomputedLightingEnvironment"), v37));
      goto LABEL_12;
    }
    v12 = 0;
  }
LABEL_13:
  v13 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mappingChannel"));
  if (v13 != -1)
    -[SCNMaterialProperty setMappingChannel:](self, "setMappingChannel:", v13);
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("textureComponents")))
    -[SCNMaterialProperty setTextureComponents:](self, "setTextureComponents:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("textureComponents")));
  self->_minificationFilter = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("minificationFilter"));
  self->_magnificationFilter = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("magnificationFilter"));
  self->_mipFilter = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mipFilter"));
  self->_wrapS = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("wrapS"));
  self->_wrapT = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("wrapT"));
  -[SCNMaterialProperty _updateMaterialFilters](self, "_updateMaterialFilters");
  self->_maxAnisotropy = 1.0;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("maxAnisotropy")))
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maxAnisotropy"));
    if (v14 != 3.4028e38)
      -[SCNMaterialProperty setMaxAnisotropy:](self, "setMaxAnisotropy:", v14);
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("contentsTransform")))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    SCNDecodeSCNMatrix4(a3, (uint64_t)CFSTR("contentsTransform"), &v39);
    v38[0] = v39;
    v38[1] = v40;
    v38[2] = v41;
    v38[3] = v42;
    -[SCNMaterialProperty setContentsTransform:](self, "setContentsTransform:", v38);
  }
  if ((v12 & 1) == 0)
  {
    v15 = -[SCNMaterialProperty effectSlotCreateIfNeeded:](self, "effectSlotCreateIfNeeded:", 0);
    if (v15)
      C3DEffectSlotSetHasNoContents((uint64_t)v15);
  }
}

uint64_t __53__SCNMaterialProperty__didDecodeSCNMaterialProperty___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", NSClassFromString(CFSTR("SKScene")));
  result = SCNDecodeUnsafeObjectForKey(v2, (uint64_t)CFSTR("skscene"), v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_hasDefaultValues
{
  int textureComponents;
  BOOL result;
  float *v5;
  uint64_t v6;
  _QWORD v7[3];
  char v8;

  if ((*((_BYTE *)self + 8) & 2) == 0
    || self->_customSlotName
    || -[SCNOrderedDictionary count](self->_animations, "count")
    || self->_borderColor
    || self->_contentType
    || self->_mappingChannel > 0
    || self->_intensity != 1.0
    || self->_minificationFilter != 2
    || self->_magnificationFilter != 2
    || self->_mipFilter != 1
    || self->_wrapS != 1
    || self->_wrapT != 1)
  {
    return 0;
  }
  textureComponents = self->_textureComponents;
  if (textureComponents == 15 || (result = 0, textureComponents == 8) && self->_propertyType == 15)
  {
    if (!self->_contentTransform && self->_maxAnisotropy == 1.0)
    {
      if (!self->_contents)
        return 1;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (float *)C3DEffectCommonProfileDefaultColorForEffectProperty(self->_propertyType);
        v8 = 1;
        v7[0] = objc_msgSend(self->_contents, "scn_C3DColorIgnoringColorSpace:success:", 0, &v8);
        v7[1] = v6;
        if (v8)
        {
          if (C3DColor4IsEqualToColor4WithThreshold((float *)v7, v5))
            return 1;
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id parent;
  unsigned int propertyType;
  NSObject *v7;
  uint64_t v8;
  double v9;
  NSString *customSlotName;
  UIColor *borderColor;

  if ((*((_BYTE *)self + 8) & 1) != 0)
    -[SCNMaterialProperty _syncObjCModel](self, "_syncObjCModel");
  -[SCNMaterialProperty _customEncodingOfSCNMaterialProperty:](self, "_customEncodingOfSCNMaterialProperty:", a3);
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 8) >> 1) & 1, CFSTR("isCommonProfileProperty"));
  parent = self->_parent;
  if (parent)
    objc_msgSend(a3, "encodeObject:forKey:", parent, CFSTR("parent"));
  propertyType = self->_propertyType;
  if (propertyType < 0x1C && ((0xFC0FFFFu >> propertyType) & 1) != 0)
  {
    v8 = qword_1DD02AA88[(char)propertyType];
  }
  else
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNMaterialProperty encodeWithCoder:].cold.1();
    v8 = 0;
  }
  objc_msgSend(a3, "encodeInteger:forKey:", v8, CFSTR("propertyType"));
  customSlotName = self->_customSlotName;
  if (customSlotName)
    objc_msgSend(a3, "encodeObject:forKey:", customSlotName, CFSTR("customSlotName"));
  borderColor = self->_borderColor;
  if (borderColor)
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)borderColor, (uint64_t)CFSTR("borderColor"));
  *(float *)&v9 = self->_intensity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("intensity"), v9);
  if (-[SCNMaterialProperty effectSlotCreateIfNeeded:](self, "effectSlotCreateIfNeeded:", 0))
    objc_msgSend(a3, "encodeBool:forKey:", -[SCNMaterialProperty sRGBTexture](self, "sRGBTexture"), CFSTR("sRGB"));
  SCNEncodeAnimations(a3, self);
}

- (SCNMaterialProperty)initWithCoder:(id)a3
{
  SCNMaterialProperty *v4;
  _BOOL8 v5;
  unint64_t v6;
  char v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  objc_super v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SCNMaterialProperty;
  v4 = -[SCNMaterialProperty init](&v15, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    *((_BYTE *)v4 + 8) |= 8u;
    v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("propertyType"));
    if (v6 >= 0x16)
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SCNMaterialProperty initWithCoder:].cold.1();
      v7 = 0;
    }
    else
    {
      v7 = byte_1DD02AB68[v6];
    }
    v4->_propertyType = v7;
    v9 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v10 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4)), CFSTR("parent"));
    if ((SCNMaterialProperty *)v10 == v4)
      v11 = 0;
    else
      v11 = v10;
    v4->_parent = (id)v11;
    -[SCNMaterialProperty _customDecodingOfSCNMaterialProperty:](v4, "_customDecodingOfSCNMaterialProperty:", a3);
    *((_BYTE *)v4 + 8) = (2 * (objc_msgSend(a3, "decodeIntForKey:", CFSTR("isCommonProfileProperty")) & 1)) | *((_BYTE *)v4 + 8) & 0xFD;
    v4->_customSlotName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customSlotName"));
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    -[SCNMaterialProperty setBorderColor:](v4, "setBorderColor:", SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("borderColor"), v12));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("intensity"));
    -[SCNMaterialProperty setIntensity:](v4, "setIntensity:", v13);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("sRGB")))
      -[SCNMaterialProperty setSRGBTexture:](v4, "setSRGBTexture:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("sRGB")));
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeAnimations(a3, v4);
    -[SCNMaterialProperty _didDecodeSCNMaterialProperty:](v4, "_didDecodeSCNMaterialProperty:", a3);
    *((_BYTE *)v4 + 8) &= ~8u;
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)precomputedLightingEnvironmentDataForContents:(id)a3 device:(id)a4 error:(id *)a5
{
  SCNScene *v8;
  SCNMaterialProperty *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  SCNPrecomputedLightingEnvironment *PrecomputedLightingEnvironment;
  void *v16;
  void *v17;
  SCNPrecomputedLightingEnvironment *v18;
  void *v19;
  uint64_t v21;

  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  v8 = objc_alloc_init(SCNScene);
  v9 = -[SCNScene lightingEnvironment](v8, "lightingEnvironment");
  -[SCNMaterialProperty setContents:](v9, "setContents:", a3);
  v10 = -[SCNMaterialProperty effectSlot](v9, "effectSlot");
  if (!v10)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[SCNMaterialProperty(SCNMaterialPropertyPrivate_PrecomputedLightingEnvironment) precomputedLightingEnvironmentDataForContents:device:error:].cold.1(v11);
  }
  +[SCNTransaction commit](SCNTransaction, "commit");
  if (C3DEffectSlotHasImageOrTexture(v10))
  {
    v12 = -[SCNRenderer _renderContextMetal](+[SCNRenderer rendererWithDevice:options:](SCNRenderer, "rendererWithDevice:options:", a4, 0), "_renderContextMetal");
    -[SCNMTLRenderContext beginFrame:]((uint64_t)v12, 0);
    v13 = -[SCNMTLRenderContext radianceTextureForEffectSlot:]((uint64_t)v12, v10);
    v14 = -[SCNMTLRenderContext irradianceTextureForEffectSlot:](v12, v10);
    v21 = 5;
    -[SCNMTLRenderContext endFrameWaitingUntilCompleted:status:error:]((uint64_t)v12, 1, &v21, a5);
    PrecomputedLightingEnvironment = 0;
    if (v13 && v14 && v21 == 4)
    {
      v16 = (void *)SCNCreateDataWithMTLTexture(v13);
      v17 = (void *)SCNCreateDataWithMTLTexture(v14);
      PrecomputedLightingEnvironment = objc_alloc_init(SCNPrecomputedLightingEnvironment);
      -[SCNPrecomputedLightingEnvironment setRadianceData:](PrecomputedLightingEnvironment, "setRadianceData:", v16);
      -[SCNPrecomputedLightingEnvironment setIrradianceData:](PrecomputedLightingEnvironment, "setIrradianceData:", v17);

    }
  }
  else
  {
    if (!C3DEffectSlotHasPrecomputedLightingEnvironment(v10))
    {

      return 0;
    }
    PrecomputedLightingEnvironment = (SCNPrecomputedLightingEnvironment *)C3DEffectSlotGetPrecomputedLightingEnvironment(v10);
    v18 = PrecomputedLightingEnvironment;
  }

  if (!PrecomputedLightingEnvironment)
    return 0;
  v19 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", PrecomputedLightingEnvironment, 1, a5);

  return v19;
}

- (void)image
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. the c3dImage should have been cleared when setting a layer or a skscene", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setContentsTransform:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = "-[SCNMaterialProperty setContentsTransform:]";
  v4 = 1024;
  v5 = 1693;
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", (uint8_t *)&v2, 0x1Cu);
}

- (void)propertyName
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "propertyType");
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: slotName %d not found", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

+ (void)_copyC3DImageFromImageData:typeID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: array for material property contents must have 6 elements", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)parentWillDie:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. inconsistency in SCNMaterialProperty::parentWillDie", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateMaterialAttachment:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateMaterialAttachment: unexpected argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_didDecodeSCNMaterialProperty:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SKTexture not found - missing linkage with SpriteKit?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: unknown material property type for archiving", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: unknown archived material property type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
