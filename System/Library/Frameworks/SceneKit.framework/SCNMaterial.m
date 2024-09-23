@implementation SCNMaterial

- (void)_setupMaterialProperty:(id *)a3
{
  __C3DScene *v5;
  uint64_t v6;
  __C3DEffectCommonProfile *v7;
  char v8;
  uint64_t v9;
  uint64_t Image;
  NSObject *v11;
  uint64_t v12;
  uint64_t *Color;
  void *v14;
  uint64_t v15;

  if (a3)
  {
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6 = (uint64_t)v5;
    if (v5)
      C3DSceneLock((uint64_t)v5);
    v7 = -[SCNMaterial commonProfile](self, "commonProfile", 0, 0);
    if (!v7)
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SCNMaterial _setupMaterialProperty:].cold.1(v11);
      goto LABEL_46;
    }
    if (&self->_diffuse == (SCNMaterialProperty **)a3)
      v8 = 2;
    else
      v8 = 21;
    if (&self->_ambient == (SCNMaterialProperty **)a3)
      v8 = 1;
    if (&self->_specular == (SCNMaterialProperty **)a3)
      v8 = 3;
    if (&self->_emission == (SCNMaterialProperty **)a3)
      v8 = 0;
    if (&self->_reflective == (SCNMaterialProperty **)a3)
      v8 = 4;
    if (&self->_transparent == (SCNMaterialProperty **)a3)
      v8 = 5;
    if (&self->_multiply == (SCNMaterialProperty **)a3)
      v8 = 6;
    if (&self->_normal == (SCNMaterialProperty **)a3)
      v8 = 7;
    if (&self->_selfIllumination == (SCNMaterialProperty **)a3)
      v8 = 9;
    if (&self->_ambientOcclusion == (SCNMaterialProperty **)a3)
      v8 = 8;
    if (&self->_metalness == (SCNMaterialProperty **)a3)
      v8 = 10;
    if (&self->_roughness == (SCNMaterialProperty **)a3)
      v8 = 11;
    if (&self->_displacement == (SCNMaterialProperty **)a3)
      v8 = 15;
    if (&self->_clearCoat == (SCNMaterialProperty **)a3)
      v8 = 12;
    if (&self->_clearCoatRoughness == (SCNMaterialProperty **)a3)
      v8 = 13;
    if (&self->_clearCoatNormal == (SCNMaterialProperty **)a3)
      v8 = 14;
    v9 = v8;
    if (v8 == 21)
    {
      Image = 0;
    }
    else
    {
      v12 = (uint64_t)v7;
      Color = (uint64_t *)C3DEffectCommonProfileGetColor((uint64_t)v7, v8);
      Image = C3DEffectCommonProfileGetImage(v12, v9);
      if (Color)
        goto LABEL_44;
    }
    Color = &v15;
    C3DColor4Make((float *)&v15, 0.5, 0.5, 0.5, 1.0);
LABEL_44:
    v14 = (void *)objc_msgSend(objc_alloc(-[SCNMaterial _materialPropertyClass](self, "_materialPropertyClass")), "initWithParent:propertyType:", self, v9);
    *a3 = v14;
    objc_msgSend(v14, "_setColor:", objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", Color));
    objc_msgSend(*a3, "_setC3DImageRef:", Image);
    if ((C3DWasLinkedBeforeMajorOSYear2017() & 1) == 0)
      objc_msgSend(*a3, "_setupContentsFromC3DImage");
LABEL_46:
    if (v6)
      C3DSceneUnlock(v6);
  }
}

- (__C3DEffectCommonProfile)commonProfile
{
  return (__C3DEffectCommonProfile *)C3DMaterialGetCommonProfile((uint64_t)-[SCNMaterial materialRef](self, "materialRef"));
}

- (__C3DMaterial)materialRef
{
  return self->_material;
}

- (Class)_materialPropertyClass
{
  return (Class)objc_opt_class();
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNMaterial __CFObject](self, "__CFObject"));
}

- (void)__CFObject
{
  return self->_material;
}

void __49__SCNMaterial__shadableSetValue_forUndefinedKey___block_invoke_2(uint64_t a1)
{
  __int16 *v2;
  uint64_t v3;
  void *v4;
  __int16 *v5;

  v2 = *(__int16 **)(a1 + 48);
  if (v2)
  {
    C3DEntitySetValueForKey(*(_QWORD *)(a1 + 56), *(void **)(a1 + 32), v2);
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    v5 = *(__int16 **)(a1 + 40);
    if (v5)
      C3DEntitySetValueForKey(v3, v4, v5);
    else
      C3DEntityResetValueForKey(v3, v4);
  }
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return SCNObject_resolveInstanceMethod((objc_class *)a1, a3);
}

+ (SCNMaterial)materialWithMDLMaterial:(id)a3 options:(id)a4
{
  SCNMaterial *AssociatedObject;
  char isKindOfClass;
  SCNMaterial *v9;
  const SCNLightingModel *v10;
  _BOOL4 v11;
  float v12;

  if (!a3)
    return 0;
  AssociatedObject = (SCNMaterial *)objc_getAssociatedObject(a3, CFSTR("SCNSceneKitAssociatedObject"));
  objc_msgSend(a3, "scatteringFunction");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = AssociatedObject;
  if (!AssociatedObject)
  {
    v9 = (SCNMaterial *)objc_msgSend(a1, "material");
    -[SCNMaterial setName:](v9, "setName:", objc_msgSend(a3, "name"));
    objc_setAssociatedObject(a3, CFSTR("SCNSceneKitAssociatedObject"), v9, (void *)0x301);
    objc_setAssociatedObject(v9, CFSTR("SCNSceneKitAssociatedObject"), a3, 0);
  }
  v10 = &SCNLightingModelPhysicallyBased;
  if ((isKindOfClass & 1) == 0)
    v10 = &SCNLightingModelBlinn;
  -[SCNMaterial setLightingModelName:](v9, "setLightingModelName:", *v10);
  setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial emission](v9, "emission"), (MDLMaterial *)a3, MDLMaterialSemanticEmission, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial diffuse](v9, "diffuse"), (MDLMaterial *)a3, MDLMaterialSemanticBaseColor, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial specular](v9, "specular"), (MDLMaterial *)a3, MDLMaterialSemanticSpecular, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial reflective](v9, "reflective"), (MDLMaterial *)a3, MDLMaterialSemanticUserDefined, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial transparent](v9, "transparent"), (MDLMaterial *)a3, MDLMaterialSemanticOpacity, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial displacement](v9, "displacement"), (MDLMaterial *)a3, MDLMaterialSemanticDisplacement, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial normal](v9, "normal"), (MDLMaterial *)a3, MDLMaterialSemanticTangentSpaceNormal, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial ambientOcclusion](v9, "ambientOcclusion"), (MDLMaterial *)a3, MDLMaterialSemanticAmbientOcclusion, AssociatedObject == 0, (NSDictionary *)a4);
  if (objc_msgSend(a3, "materialFace") == 2)
    -[SCNMaterial setDoubleSided:](v9, "setDoubleSided:", 1);
  if ((isKindOfClass & 1) != 0)
  {
    v11 = AssociatedObject == 0;
    setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial metalness](v9, "metalness"), (MDLMaterial *)a3, MDLMaterialSemanticMetallic, v11, (NSDictionary *)a4);
    setupSCNMaterialProperty((MDLTextureSampler *)-[SCNMaterial roughness](v9, "roughness"), (MDLMaterial *)a3, MDLMaterialSemanticRoughness, v11, (NSDictionary *)a4);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a3, "propertyWithSemantic:", 6), "floatValue");
    -[SCNMaterial setShininess:](v9, "setShininess:", (float)((float)(2.0 / (float)(v12 * v12)) + -2.0));
  }
  return v9;
}

- (id)_property:(id *)a3
{
  id result;

  if (!*a3)
    -[SCNMaterial _setupMaterialProperty:](self, "_setupMaterialProperty:", a3);
  result = *a3;
  if (self->_isPresentationInstance)
    return (id)objc_msgSend(result, "presentationMaterialProperty");
  return result;
}

- (SCNMaterialProperty)roughness
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_roughness);
}

- (SCNMaterialProperty)emission
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_emission);
}

- (SCNMaterialProperty)normal
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_normal);
}

- (SCNMaterialProperty)diffuse
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_diffuse);
}

- (SCNMaterialProperty)ambientOcclusion
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_ambientOcclusion);
}

- (SCNMaterialProperty)transparent
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_transparent);
}

- (SCNMaterialProperty)metalness
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_metalness);
}

- (SCNMaterialProperty)specular
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_specular);
}

- (void)setName:(NSString *)name
{
  NSObject *v4;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_isPresentationInstance)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNMaterial setName:].cold.1();
  }
  else if ((unint64_t)name | (unint64_t)self->_name && (-[NSString isEqual:](name, "isEqual:") & 1) == 0)
  {

    self->_name = (NSString *)-[NSString copy](name, "copy");
    v6 = -[SCNMaterial sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __23__SCNMaterial_setName___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = name;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

CFStringRef __23__SCNMaterial_setName___block_invoke(uint64_t a1)
{
  return C3DEntitySetName(objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(CFStringRef *)(a1 + 40));
}

- (void)setLightingModelName:(SCNLightingModel)lightingModelName
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (!-[NSString isEqualToString:](lightingModelName, "isEqualToString:", self->_lightingModelName))
  {

    self->_lightingModelName = (NSString *)-[NSString copy](lightingModelName, "copy");
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__SCNMaterial_setLightingModelName___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = lightingModelName;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __36__SCNMaterial_setLightingModelName___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;
  void *v3;
  int v4;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  v3 = *(void **)(a1 + 40);
  if (!v3)
  {
LABEL_5:
    v4 = 3;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCNLightingModelPhysicallyBased")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCNLightingModelBlinn")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCNLightingModelPhong")) & 1) != 0)
      {
        v4 = 2;
        goto LABEL_6;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCNLightingModelLambert")) & 1) != 0)
      {
        v4 = 1;
        goto LABEL_6;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCNLightingModelConstant")) & 1) != 0)
      {
        v4 = 0;
        goto LABEL_6;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCNLightingModelNone")) & 1) != 0)
      {
        v4 = 4;
        goto LABEL_6;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCNLightingModelShadowOnly")) & 1) != 0)
      {
        v4 = 6;
        goto LABEL_6;
      }
    }
    goto LABEL_5;
  }
  v4 = 5;
LABEL_6:
  C3DEffectCommonProfileSetLightingModel(CommonProfile, v4);
}

- (SCNMaterialProperty)reflective
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_reflective);
}

- (SCNMaterialProperty)displacement
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_displacement);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (SCNMaterial)material
{
  return (SCNMaterial *)objc_alloc_init((Class)a1);
}

- (SCNMaterial)init
{
  SCNMaterial *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNMaterial;
  v2 = -[SCNMaterial init](&v5, sel_init);
  if (v2)
  {
    v3 = C3DMaterialCreate();
    v2->_material = (__C3DMaterial *)v3;
    if (v3)
      C3DEntitySetObjCWrapper(v3, v2);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    -[SCNMaterial _syncObjCModel](v2, "_syncObjCModel");
  }
  return v2;
}

- (void)_syncObjCModel
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DMaterial *v5;
  float *CommonProfile;
  float *v7;
  unsigned int LightingModel;
  __CFString *v9;
  uint64_t Technique;
  uint64_t v11;
  uint64_t PassAtIndex;
  uint64_t Program;
  _QWORD *v14;
  SCNProgram *v15;
  uint64_t ShaderSources;
  uint64_t v17;
  uint64_t v18;

  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial materialRef](self, "materialRef");
  self->_cullMode = (int)C3DMaterialGetCullMode((uint64_t)v5);
  self->_writesToDepthBuffer = C3DMaterialGetEnableWriteInDepthBuffer((uint64_t)v5);
  self->_readsFromDepthBuffer = C3DMaterialGetEnableReadsFromDepthBuffer((uint64_t)v5);
  self->_colorBufferWriteMask = C3DMaterialGetColorBufferWriteMask((uint64_t)v5);
  self->_doubleSided = C3DMaterialIsDoubleSided((uint64_t)v5);
  self->_fillMode = (int)C3DMaterialGetFillMode((uint64_t)v5);
  self->_blendMode = (int)C3DMaterialGetBlendMode((uint64_t)v5);
  CommonProfile = (float *)C3DMaterialGetCommonProfile((uint64_t)v5);
  if (CommonProfile)
  {
    v7 = CommonProfile;
    self->_shininess = C3DEffectCommonProfileGetFloatProperty(CommonProfile, 16);
    self->_transparency = C3DEffectCommonProfileGetFloatProperty(v7, 18);
    self->_indexOfRefraction = C3DEffectCommonProfileGetFloatProperty(v7, 19);
    self->_fresnelExponent = C3DEffectCommonProfileGetFloatProperty(v7, 20);
    self->_transparencyMode = C3DEffectCommonProfileGetTransparencyMode((uint64_t)v7);
    LightingModel = C3DEffectCommonProfileGetLightingModel((uint64_t)v7);
    if (LightingModel > 6)
      v9 = 0;
    else
      v9 = off_1EA5A21A0[LightingModel];
    self->_lightingModelName = (NSString *)v9;
    self->_litPerPixel = C3DEffectCommonProfileIsPerPixelLit((uint64_t)v7);
    self->_locksAmbientWithDiffuse = C3DEffectCommonProfileGetEnableLockAmbientWithDiffuse((uint64_t)v7);
    self->_avoidsOverLighting = C3DEffectCommonProfileGetAvoidsOverLighting((uint64_t)v7);
    self->_selfIlluminationOcclusion = C3DEffectCommonProfileGetSelfIlluminationOcclusion((uint64_t)v7);
  }
  Technique = C3DMaterialGetTechnique((uint64_t)v5);
  if (Technique)
  {
    v11 = Technique;
    if (C3DFXTechniqueGetPassCount(Technique) >= 1)
    {
      PassAtIndex = C3DFXTechniqueGetPassAtIndex(v11, 0);
      Program = C3DFXPassGetProgram(PassAtIndex);
      if (Program)
      {
        v14 = (_QWORD *)Program;
        v15 = objc_alloc_init(SCNProgram);
        ShaderSources = C3DFXGLSLProgramGetShaderSources(v14);
        v18 = v17;
        -[SCNProgram setVertexShader:](v15, "setVertexShader:", ShaderSources);
        -[SCNProgram setFragmentShader:](v15, "setFragmentShader:", v18);
        -[SCNProgram setName:](v15, "setName:", C3DEntityGetName((uint64_t)v14));
        -[SCNMaterial setProgram:](self, "setProgram:", v15);

      }
    }
  }
  -[SCNMaterial _syncEntityObjCModel](self, "_syncEntityObjCModel");
  if (v4)
    C3DSceneUnlock(v4);
}

- (void)_syncEntityObjCModel
{
  void *v3;

  v3 = -[SCNMaterial __CFObject](self, "__CFObject");

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const void *Copy;
  void *v5;
  void *v6;

  Copy = (const void *)C3DMaterialCreateCopy((uint64_t)self->_material);
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMaterialRef:", Copy);
  CFRelease(Copy);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(v5, "setName:", -[SCNMaterial name](self, "name"));
  objc_msgSend(v5, "setIdentifier:", -[SCNMaterial identifier](self, "identifier"));
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_valuesForUndefinedKeys, "mutableCopy");
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  objc_msgSend(v5, "_copyAttributes:", v6);

  -[SCNMaterial shininess](self, "shininess");
  objc_msgSend(v5, "setShininess:");
  -[SCNMaterial transparency](self, "transparency");
  objc_msgSend(v5, "setTransparency:");
  objc_msgSend(v5, "setTransparencyMode:", -[SCNMaterial transparencyMode](self, "transparencyMode"));
  objc_msgSend(v5, "setLightingModelName:", -[SCNMaterial lightingModelName](self, "lightingModelName"));
  objc_msgSend(v5, "setLitPerPixel:", -[SCNMaterial isLitPerPixel](self, "isLitPerPixel"));
  objc_msgSend(v5, "setDoubleSided:", -[SCNMaterial isDoubleSided](self, "isDoubleSided"));
  objc_msgSend(v5, "setCullMode:", -[SCNMaterial cullMode](self, "cullMode"));
  objc_msgSend(v5, "setProgram:", -[SCNMaterial program](self, "program"));
  objc_msgSend(v5, "setLocksAmbientWithDiffuse:", -[SCNMaterial locksAmbientWithDiffuse](self, "locksAmbientWithDiffuse"));
  objc_msgSend(v5, "setAvoidsOverLighting:", -[SCNMaterial avoidsOverLighting](self, "avoidsOverLighting"));
  objc_msgSend(v5, "setFillMode:", -[SCNMaterial fillMode](self, "fillMode"));
  -[SCNMaterial fresnelExponent](self, "fresnelExponent");
  objc_msgSend(v5, "setFresnelExponent:");
  objc_msgSend(v5, "setWritesToDepthBuffer:", -[SCNMaterial writesToDepthBuffer](self, "writesToDepthBuffer"));
  objc_msgSend(v5, "setReadsFromDepthBuffer:", -[SCNMaterial readsFromDepthBuffer](self, "readsFromDepthBuffer"));
  objc_msgSend(v5, "setColorBufferWriteMask:", -[SCNMaterial colorBufferWriteMask](self, "colorBufferWriteMask"));
  objc_msgSend(v5, "setBlendMode:", -[SCNMaterial blendMode](self, "blendMode"));
  if (self->_ambient)
    objc_msgSend((id)objc_msgSend(v5, "ambient"), "copyPropertiesFrom:", self->_ambient);
  if (self->_diffuse)
    objc_msgSend((id)objc_msgSend(v5, "diffuse"), "copyPropertiesFrom:", self->_diffuse);
  if (self->_specular)
    objc_msgSend((id)objc_msgSend(v5, "specular"), "copyPropertiesFrom:", self->_specular);
  if (self->_emission)
    objc_msgSend((id)objc_msgSend(v5, "emission"), "copyPropertiesFrom:", self->_emission);
  if (self->_transparent)
    objc_msgSend((id)objc_msgSend(v5, "transparent"), "copyPropertiesFrom:", self->_transparent);
  if (self->_multiply)
    objc_msgSend((id)objc_msgSend(v5, "multiply"), "copyPropertiesFrom:", self->_multiply);
  if (self->_reflective)
    objc_msgSend((id)objc_msgSend(v5, "reflective"), "copyPropertiesFrom:", self->_reflective);
  if (self->_normal)
    objc_msgSend((id)objc_msgSend(v5, "normal"), "copyPropertiesFrom:", self->_normal);
  if (self->_selfIllumination)
    objc_msgSend((id)objc_msgSend(v5, "selfIllumination"), "copyPropertiesFrom:", self->_selfIllumination);
  if (self->_ambientOcclusion)
    objc_msgSend((id)objc_msgSend(v5, "ambientOcclusion"), "copyPropertiesFrom:", self->_ambientOcclusion);
  if (self->_metalness)
    objc_msgSend((id)objc_msgSend(v5, "metalness"), "copyPropertiesFrom:", self->_metalness);
  if (self->_roughness)
    objc_msgSend((id)objc_msgSend(v5, "roughness"), "copyPropertiesFrom:", self->_roughness);
  if (self->_displacement)
    objc_msgSend((id)objc_msgSend(v5, "displacement"), "copyPropertiesFrom:", self->_displacement);
  if (self->_clearCoat)
    objc_msgSend((id)objc_msgSend(v5, "clearCoat"), "copyPropertiesFrom:", self->_clearCoat);
  if (self->_clearCoatRoughness)
    objc_msgSend((id)objc_msgSend(v5, "clearCoatRoughness"), "copyPropertiesFrom:", self->_clearCoatRoughness);
  if (self->_clearCoatNormal)
    objc_msgSend((id)objc_msgSend(v5, "clearCoatNormal"), "copyPropertiesFrom:", self->_clearCoatNormal);
  objc_msgSend(v5, "_copyAnimationsFrom:", self);
  objc_msgSend(v5, "copyShaderModifiersAndLanguageVersionFrom:", self);
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  return v5;
}

- (BOOL)writesToDepthBuffer
{
  __C3DScene *v3;
  uint64_t v4;
  BOOL v5;

  if (!self->_isPresentationInstance)
    return self->_writesToDepthBuffer;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  if (!v3)
    return C3DMaterialGetEnableWriteInDepthBuffer((uint64_t)self->_material);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  v5 = C3DMaterialGetEnableWriteInDepthBuffer((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return v5;
}

- (CGFloat)transparency
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  double FloatProperty;

  if (!self->_isPresentationInstance)
    return self->_transparency;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    FloatProperty = C3DEffectCommonProfileGetFloatProperty((float *)v5, 18);
    if (!v4)
      return FloatProperty;
    goto LABEL_9;
  }
  FloatProperty = 0.0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return FloatProperty;
}

- (SCNTransparencyMode)transparencyMode
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  SCNTransparencyMode TransparencyMode;

  if (!self->_isPresentationInstance)
    return self->_transparencyMode;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    TransparencyMode = (unint64_t)C3DEffectCommonProfileGetTransparencyMode((uint64_t)v5);
    if (!v4)
      return TransparencyMode;
    goto LABEL_9;
  }
  TransparencyMode = SCNTransparencyModeAOne;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return TransparencyMode;
}

- (CGFloat)shininess
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  double FloatProperty;

  if (!self->_isPresentationInstance)
    return self->_shininess;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    FloatProperty = C3DEffectCommonProfileGetFloatProperty((float *)v5, 16);
    if (!v4)
      return FloatProperty;
    goto LABEL_9;
  }
  FloatProperty = 0.0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return FloatProperty;
}

- (void)setWritesToDepthBuffer:(BOOL)writesToDepthBuffer
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_writesToDepthBuffer != writesToDepthBuffer)
  {
    self->_writesToDepthBuffer = writesToDepthBuffer;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__SCNMaterial_setWritesToDepthBuffer___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = writesToDepthBuffer;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setTransparencyMode:(SCNTransparencyMode)transparencyMode
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_transparencyMode != transparencyMode)
  {
    self->_transparencyMode = transparencyMode;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__SCNMaterial_setTransparencyMode___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = transparencyMode;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setTransparency:(CGFloat)transparency
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_transparency != transparency)
  {
    v5 = transparency;
    self->_transparency = v5;
    v6 = -[SCNMaterial sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__SCNMaterial_setTransparency___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = transparency;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("transparency"), v7);
  }
}

- (void)setShininess:(CGFloat)shininess
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_shininess != shininess)
  {
    v5 = shininess;
    self->_shininess = v5;
    v6 = -[SCNMaterial sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNMaterial_setShininess___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = shininess;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("shininess"), v7);
  }
}

- (void)setReadsFromDepthBuffer:(BOOL)readsFromDepthBuffer
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_readsFromDepthBuffer != readsFromDepthBuffer)
  {
    self->_readsFromDepthBuffer = readsFromDepthBuffer;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__SCNMaterial_setReadsFromDepthBuffer___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = readsFromDepthBuffer;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setProgram:(id)a3
{
  NSObject *v4;
  SCNShadableHelper *shadableHelper;
  id v7;

  if (self->_isPresentationInstance)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNMaterial setProgram:].cold.1();
  }
  else
  {
    if (a3)
    {
      -[SCNMaterial _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
      shadableHelper = self->_shadableHelper;
      v7 = a3;
    }
    else
    {
      shadableHelper = self->_shadableHelper;
      v7 = 0;
    }
    -[SCNShadableHelper setProgram:](shadableHelper, "setProgram:", v7);
  }
}

- (void)setLocksAmbientWithDiffuse:(BOOL)locksAmbientWithDiffuse
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_locksAmbientWithDiffuse != locksAmbientWithDiffuse)
  {
    self->_locksAmbientWithDiffuse = locksAmbientWithDiffuse;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__SCNMaterial_setLocksAmbientWithDiffuse___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = locksAmbientWithDiffuse;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("lockAmbientWithDiffuse"), v6);
  }
}

- (void)setLitPerPixel:(BOOL)litPerPixel
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_litPerPixel != litPerPixel)
  {
    self->_litPerPixel = litPerPixel;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__SCNMaterial_setLitPerPixel___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = litPerPixel;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("litPerPixel"), v6);
  }
}

- (void)setIdentifier:(id)a3
{
  C3DEntitySetID((uint64_t)-[SCNMaterial __CFObject](self, "__CFObject"), a3);
}

- (void)setFresnelExponent:(CGFloat)fresnelExponent
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_fresnelExponent != fresnelExponent)
  {
    v5 = fresnelExponent;
    self->_fresnelExponent = v5;
    v6 = -[SCNMaterial sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__SCNMaterial_setFresnelExponent___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = fresnelExponent;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("fresnelExponent"), v7);
  }
}

- (void)setFillMode:(SCNFillMode)fillMode
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_fillMode != fillMode)
  {
    self->_fillMode = fillMode;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__SCNMaterial_setFillMode___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = fillMode;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fillMode"), v6);
  }
}

- (void)setDoubleSided:(BOOL)doubleSided
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_doubleSided != doubleSided)
  {
    self->_doubleSided = doubleSided;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__SCNMaterial_setDoubleSided___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = doubleSided;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("doubleSided"), v6);
  }
}

- (void)setCullMode:(SCNCullMode)cullMode
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_cullMode != cullMode)
  {
    self->_cullMode = cullMode;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__SCNMaterial_setCullMode___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = cullMode;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("cullMode"), v6);
  }
}

- (void)setColorBufferWriteMask:(SCNColorMask)colorBufferWriteMask
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_colorBufferWriteMask != colorBufferWriteMask)
  {
    self->_colorBufferWriteMask = colorBufferWriteMask;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__SCNMaterial_setColorBufferWriteMask___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = colorBufferWriteMask;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setBlendMode:(SCNBlendMode)blendMode
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_blendMode != blendMode)
  {
    self->_blendMode = blendMode;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28__SCNMaterial_setBlendMode___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = blendMode;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setAvoidsOverLighting:(BOOL)a3
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_avoidsOverLighting != a3)
  {
    self->_avoidsOverLighting = a3;
    v5 = -[SCNMaterial sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__SCNMaterial_setAvoidsOverLighting___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (BOOL)readsFromDepthBuffer
{
  __C3DScene *v3;
  uint64_t v4;
  BOOL EnableReadsFromDepthBuffer;

  if (!self->_isPresentationInstance)
    return self->_readsFromDepthBuffer;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  if (!v3)
    return C3DMaterialGetEnableReadsFromDepthBuffer((uint64_t)self->_material);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  EnableReadsFromDepthBuffer = C3DMaterialGetEnableReadsFromDepthBuffer((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return EnableReadsFromDepthBuffer;
}

- (SCNProgram)program
{
  return -[SCNShadableHelper program](self->_shadableHelper, "program");
}

- (NSString)name
{
  __C3DScene *v3;
  uint64_t v4;
  NSString *Name;

  if (!self->_isPresentationInstance)
    return self->_name;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Name = (NSString *)C3DEntityGetName((uint64_t)-[SCNMaterial __CFObject](self, "__CFObject"));
  if (v4)
    C3DSceneUnlock(v4);
  return Name;
}

- (BOOL)locksAmbientWithDiffuse
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  char EnableLockAmbientWithDiffuse;

  if (!self->_isPresentationInstance)
    return self->_locksAmbientWithDiffuse;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    EnableLockAmbientWithDiffuse = C3DEffectCommonProfileGetEnableLockAmbientWithDiffuse((uint64_t)v5);
    if (!v4)
      return EnableLockAmbientWithDiffuse;
    goto LABEL_9;
  }
  EnableLockAmbientWithDiffuse = 0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return EnableLockAmbientWithDiffuse;
}

- (SCNLightingModel)lightingModelName
{
  __C3DScene *v3;
  uint64_t v4;
  unsigned int LightingModel;
  __CFString *v6;

  if (!self->_isPresentationInstance)
    return self->_lightingModelName;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  LightingModel = C3DEffectCommonProfileGetLightingModel((uint64_t)-[SCNMaterial commonProfile](self, "commonProfile"));
  if (LightingModel <= 6)
  {
    v6 = off_1EA5A21A0[LightingModel];
    if (!v4)
      return &v6->isa;
    goto LABEL_9;
  }
  v6 = 0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return &v6->isa;
}

- (BOOL)isLitPerPixel
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  char IsPerPixelLit;

  if (!self->_isPresentationInstance)
    return self->_litPerPixel;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    IsPerPixelLit = C3DEffectCommonProfileIsPerPixelLit((uint64_t)v5);
    if (!v4)
      return IsPerPixelLit;
    goto LABEL_9;
  }
  IsPerPixelLit = 0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return IsPerPixelLit;
}

- (BOOL)isDoubleSided
{
  __C3DScene *v3;
  uint64_t v4;
  char IsDoubleSided;

  if (!self->_isPresentationInstance)
    return self->_doubleSided;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  if (!v3)
    return C3DMaterialIsDoubleSided((uint64_t)self->_material);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  IsDoubleSided = C3DMaterialIsDoubleSided((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return IsDoubleSided;
}

- (SCNMaterial)initWithMaterialRef:(__C3DMaterial *)a3
{
  SCNMaterial *v4;
  __C3DMaterial *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNMaterial;
  v4 = -[SCNMaterial init](&v7, sel_init);
  if (v4)
  {
    v5 = (__C3DMaterial *)CFRetain(a3);
    v4->_material = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    v4->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    -[SCNMaterial _syncObjCModel](v4, "_syncObjCModel");
    -[SCNMaterial _syncObjCAnimations](v4, "_syncObjCAnimations");
  }
  return v4;
}

- (id)identifier
{
  return (id)C3DEntityGetID((uint64_t)-[SCNMaterial __CFObject](self, "__CFObject"));
}

- (CGFloat)fresnelExponent
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  double FloatProperty;

  if (!self->_isPresentationInstance)
    return self->_fresnelExponent;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    FloatProperty = C3DEffectCommonProfileGetFloatProperty((float *)v5, 20);
    if (!v4)
      return FloatProperty;
    goto LABEL_9;
  }
  FloatProperty = 0.0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return FloatProperty;
}

- (SCNFillMode)fillMode
{
  __C3DScene *v3;
  uint64_t v4;
  SCNFillMode FillMode;

  if (!self->_isPresentationInstance)
    return self->_fillMode;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  if (!v3)
    return (uint64_t)(int)C3DMaterialGetFillMode((uint64_t)self->_material);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  FillMode = (int)C3DMaterialGetFillMode((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return FillMode;
}

- (SCNCullMode)cullMode
{
  __C3DScene *v3;
  uint64_t v4;
  SCNCullMode CullMode;

  if (!self->_isPresentationInstance)
    return self->_cullMode;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  if (!v3)
    return (uint64_t)(int)C3DMaterialGetCullMode((uint64_t)self->_material);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  CullMode = (int)C3DMaterialGetCullMode((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return CullMode;
}

- (SCNColorMask)colorBufferWriteMask
{
  __C3DScene *v3;
  uint64_t v4;
  SCNColorMask v5;

  if (!self->_isPresentationInstance)
    return self->_colorBufferWriteMask;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  if (!v3)
    return C3DMaterialGetColorBufferWriteMask((uint64_t)self->_material);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  v5 = C3DMaterialGetColorBufferWriteMask((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return v5;
}

- (SCNBlendMode)blendMode
{
  __C3DScene *v3;
  uint64_t v4;
  double BlendMode;

  if (self->_isPresentationInstance)
  {
    v3 = -[SCNMaterial sceneRef](self, "sceneRef");
    v4 = (uint64_t)v3;
    if (v3)
      C3DSceneLock((uint64_t)v3);
    BlendMode = (double)(int)C3DMaterialGetBlendMode((uint64_t)-[SCNMaterial materialRef](self, "materialRef"));
    if (v4)
      C3DSceneUnlock(v4);
  }
  else
  {
    return (uint64_t)(double)self->_blendMode;
  }
  return (uint64_t)BlendMode;
}

- (BOOL)avoidsOverLighting
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  char AvoidsOverLighting;

  if (!self->_isPresentationInstance)
    return self->_avoidsOverLighting;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    AvoidsOverLighting = C3DEffectCommonProfileGetAvoidsOverLighting((uint64_t)v5);
    if (!v4)
      return AvoidsOverLighting;
    goto LABEL_9;
  }
  AvoidsOverLighting = 0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return AvoidsOverLighting;
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

  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v5 = -[SCNMaterial __CFObject](self, "__CFObject");
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

- (void)_copyAttributes:(id)a3
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
  v5 = (void *)objc_msgSend(a3, "allKeys", 0);
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
        v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", v10), "copy");
        -[SCNMaterial setValue:forKey:](self, "setValue:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (id)copy
{
  return -[SCNMaterial copyWithZone:](self, "copyWithZone:", 0);
}

- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4
{
  NSObject *v5;
  id v6;
  id v8;
  char isKindOfClass;
  NSMutableDictionary *valuesForUndefinedKeys;
  void *v11;
  id v12;
  char v13;
  _UNKNOWN **v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  int Type;
  void *v20;
  _QWORD v21[8];
  _QWORD v22[7];
  _QWORD v23[2];

  if (!self->_isPresentationInstance)
  {
    v6 = a4;
    if (objc_msgSend(a4, "hasPrefix:", CFSTR("shaderModifiers.")))
      v6 = (id)objc_msgSend(v6, "substringFromIndex:", 16);
    os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
    v8 = (id)-[NSMutableDictionary objectForKey:](self->_valuesForUndefinedKeys, "objectForKey:", v6);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      -[SCNMaterial willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("customMaterialProperties"));
      -[SCNMaterial willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("customMaterialAttributes"));
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
    }
    valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
    if (a3)
    {
      if (!valuesForUndefinedKeys)
      {
        valuesForUndefinedKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->_valuesForUndefinedKeys = valuesForUndefinedKeys;
      }
      -[NSMutableDictionary setObject:forKey:](valuesForUndefinedKeys, "setObject:forKey:", a3, v6);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](valuesForUndefinedKeys, "removeObjectForKey:", v6);
    }
    os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
    if ((isKindOfClass & 1) == 0)
    {
      -[SCNMaterial didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("customMaterialProperties"));
      -[SCNMaterial didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("customMaterialAttributes"));
    }
    v11 = -[SCNMaterial __CFObject](self, "__CFObject");
    objc_opt_class();
    v12 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "unlinkCustomPropertyWithParent:", self);
      v12 = 0;
    }

    objc_opt_class();
    v13 = objc_opt_isKindOfClass();
    v14 = &off_1EA593000;
    v15 = MEMORY[0x1E0C809B0];
    if ((v13 & 1) != 0)
    {
      objc_msgSend(a3, "linkCustomPropertyWithParent:andCustomName:", self, v6);
      v16 = (const void *)objc_msgSend(a3, "effectSlot");
      if (v16)
        v17 = (uint64_t)CFRetain(v16);
      else
        v17 = 0;
      v12 = 0;
      goto LABEL_30;
    }
    v17 = SCNCopyValueFromObjCProperty(self, v6);
    if (!v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (uint64_t)SCNCopyValueFromObjCValue(a3);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = 0;
LABEL_30:
          v20 = v14[323];
          v21[0] = v15;
          v21[1] = 3221225472;
          v21[2] = __49__SCNMaterial__shadableSetValue_forUndefinedKey___block_invoke_2;
          v21[3] = &unk_1EA5A2180;
          v21[6] = v17;
          v21[7] = v11;
          v21[4] = v6;
          v21[5] = a3;
          objc_msgSend(v20, "postCommandWithContext:object:keyPath:applyBlock:", -[SCNMaterial sceneRef](self, "sceneRef"), self, v12, v21);
          return;
        }
        v23[0] = C3DColor4FromRGBCFColor(a3, 0);
        v23[1] = v18;
        v17 = C3DValueCreate(10, 1);
        C3DValueInitFrom(v17, v23);
      }
    }
    if (v17 && !v8)
    {
      Type = C3DValueGetType(v17);
      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __49__SCNMaterial__shadableSetValue_forUndefinedKey___block_invoke;
      v22[3] = &unk_1EA5A15E8;
      v22[4] = v6;
      v22[5] = v11;
      v22[6] = C3DValueCreateDefault(Type);
      v14 = &off_1EA593000;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", -[SCNMaterial sceneRef](self, "sceneRef"), self, v22);
    }
    goto LABEL_30;
  }
  v5 = scn_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SCNMaterial _shadableSetValue:forUndefinedKey:].cold.1();
}

void __49__SCNMaterial__shadableSetValue_forUndefinedKey___block_invoke(uint64_t a1)
{
  const void *v2;

  C3DEntitySetValueForKey(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), *(__int16 **)(a1 + 48));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3
{
  NSObject *v4;
  void *v6;

  if (self->_isPresentationInstance)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNMaterial copyShaderModifiersAndLanguageVersionFrom:].cold.1();
  }
  else
  {
    if (objc_msgSend(a3, "shaderModifiers"))
      -[SCNMaterial _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
    v6 = (void *)objc_msgSend(a3, "__shadableHelper");
    -[SCNShadableHelper copyModifiersFrom:](self->_shadableHelper, "copyModifiersFrom:", v6);
    -[SCNShadableHelper setMinimumLanguageVersion:](self->_shadableHelper, "setMinimumLanguageVersion:", objc_msgSend(v6, "minimumLanguageVersion"));
  }
}

- (NSDictionary)shaderModifiers
{
  return -[SCNShadableHelper shaderModifiers](self->_shadableHelper, "shaderModifiers");
}

- (id)__shadableHelper
{
  return self->_shadableHelper;
}

- (void)setShaderModifiers:(id)a3
{
  NSObject *v4;

  if (self->_isPresentationInstance)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNMaterial setShaderModifiers:].cold.1();
  }
  else
  {
    if (a3)
      -[SCNMaterial _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
    -[SCNShadableHelper setShaderModifiers:](self->_shadableHelper, "setShaderModifiers:", a3);
  }
}

- (void)_setupShadableHelperIfNeeded
{
  if (!self->_shadableHelper)
    self->_shadableHelper = -[SCNShadableHelper initWithOwner:]([SCNShadableHelper alloc], "initWithOwner:", self);
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
        -[SCNMaterial addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

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

- (id)_integrateModelKitComputedMaps:(id)a3 withGeometry:(id)a4 node:(id)a5 texturePathProvider:(id)a6 vertexAttributeNamed:(id)a7 materialPropertyNamed:(id)a8 filePath:(id)a9
{
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  SCNMaterialProperty *v28;

  v16 = objc_msgSend(a7, "isEqualToString:", *MEMORY[0x1E0CC7718]);
  v17 = (void *)objc_msgSend(a3, "propertyNamed:", a8);
  if (!v17)
    return 0;
  v18 = v17;
  if (!objc_msgSend(v17, "textureSamplerValue")
    || !objc_msgSend((id)objc_msgSend(v18, "textureSamplerValue"), "texture"))
  {
    return 0;
  }
  if (a6)
    v19 = (*((uint64_t (**)(id, id))a6 + 2))(a6, a5);
  else
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/ModelKit_AO_%@.png"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"));
  v21 = (id)v19;
  if (objc_msgSend(a9, "isEqualToString:", &stru_1EA5A6480))
  {
    v22 = (void *)objc_msgSend((id)objc_msgSend(v18, "textureSamplerValue"), "texture");
    objc_msgSend(v22, "writeToURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v21));
    objc_msgSend(a9, "setString:", v21);
  }
  else
  {
    v21 = a9;
  }
  v23 = (void *)objc_msgSend(a4, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticTexcoord"));
  v24 = objc_msgSend(v23, "count");
  v25 = v24;
  if (v24 < 1)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    v26 = 0;
    v27 = v24;
    while ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectAtIndexedSubscript:", v26), "mkSemantic"), "isEqualToString:", a7) & 1) == 0)
    {
      if (v27 == ++v26)
      {
        LODWORD(v26) = v25;
        break;
      }
    }
  }
  if (v16)
  {
    -[SCNMaterialProperty setMappingChannel:](-[SCNMaterial ambientOcclusion](self, "ambientOcclusion"), "setMappingChannel:", v26);
    v28 = -[SCNMaterial ambientOcclusion](self, "ambientOcclusion");
  }
  else
  {
    -[SCNMaterialProperty setMappingChannel:](-[SCNMaterial selfIllumination](self, "selfIllumination"), "setMappingChannel:", v26);
    v28 = -[SCNMaterial selfIllumination](self, "selfIllumination");
  }
  -[SCNMaterialProperty setContents:](v28, "setContents:", v21);
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v21);
}

+ (SCNMaterial)materialWithMDLMaterial:(MDLMaterial *)mdlMaterial
{
  return (SCNMaterial *)objc_msgSend(a1, "materialWithMDLMaterial:options:", mdlMaterial, 0);
}

- (id)initPresentationMaterialWithMaterialRef:(__C3DMaterial *)a3
{
  SCNMaterial *v4;
  SCNMaterial *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNMaterial;
  v4 = -[SCNMaterial init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isPresentationInstance = 1;
    v4->_material = (__C3DMaterial *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (SCNMaterial)materialWithMaterialRef:(__C3DMaterial *)a3
{
  SCNMaterial *result;

  result = (SCNMaterial *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNMaterial *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMaterialRef:", a3);
  return result;
}

+ (SCNMaterial)materialWithColor:(id)a3
{
  SCNMaterial *v4;

  v4 = (SCNMaterial *)objc_alloc_init((Class)a1);
  -[SCNMaterial setColor:](v4, "setColor:", a3);
  return v4;
}

+ (SCNMaterial)materialWithContents:(id)a3
{
  SCNMaterial *v4;

  v4 = (SCNMaterial *)objc_alloc_init((Class)a1);
  -[SCNMaterial setContents:](v4, "setContents:", a3);
  return v4;
}

- (void)dealloc
{
  __C3DMaterial *material;
  objc_super v4;
  _QWORD v5[5];

  -[SCNMaterialProperty parentWillDie:](self->_ambient, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_diffuse, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_specular, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_emission, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_reflective, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_transparent, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_multiply, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_normal, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_ambientOcclusion, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_selfIllumination, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_metalness, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_roughness, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_displacement, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_clearCoat, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_clearCoatRoughness, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_clearCoatNormal, "parentWillDie:", self);
  -[SCNShadableHelper ownerWillDie](self->_shadableHelper, "ownerWillDie");

  material = self->_material;
  if (material)
  {
    if (!self->_isPresentationInstance)
    {
      C3DEntitySetObjCWrapper((uint64_t)material, 0);
      material = self->_material;
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __22__SCNMaterial_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = material;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v5);
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNMaterial;
  -[SCNMaterial dealloc](&v4, sel_dealloc);
}

void __22__SCNMaterial_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (id)presentationMaterial
{
  if (!*((_BYTE *)self + 240))
    return -[SCNMaterial initPresentationMaterialWithMaterialRef:]([SCNMaterial alloc], "initPresentationMaterialWithMaterialRef:", *((_QWORD *)self + 1));
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)setColor:(id)a3
{
  -[SCNMaterialProperty setColor:](-[SCNMaterial ambient](self, "ambient"), "setColor:", a3);
  -[SCNMaterialProperty setColor:](-[SCNMaterial diffuse](self, "diffuse"), "setColor:", a3);
}

- (id)color
{
  return -[SCNMaterialProperty color](-[SCNMaterial ambient](self, "ambient"), "color");
}

- (id)builtinProperties
{
  _QWORD v4[17];

  v4[16] = *MEMORY[0x1E0C80C00];
  v4[0] = -[SCNMaterial ambient](self, "ambient");
  v4[1] = -[SCNMaterial diffuse](self, "diffuse");
  v4[2] = -[SCNMaterial specular](self, "specular");
  v4[3] = -[SCNMaterial emission](self, "emission");
  v4[4] = -[SCNMaterial transparent](self, "transparent");
  v4[5] = -[SCNMaterial reflective](self, "reflective");
  v4[6] = -[SCNMaterial multiply](self, "multiply");
  v4[7] = -[SCNMaterial normal](self, "normal");
  v4[8] = -[SCNMaterial ambientOcclusion](self, "ambientOcclusion");
  v4[9] = -[SCNMaterial selfIllumination](self, "selfIllumination");
  v4[10] = -[SCNMaterial metalness](self, "metalness");
  v4[11] = -[SCNMaterial roughness](self, "roughness");
  v4[12] = -[SCNMaterial displacement](self, "displacement");
  v4[13] = -[SCNMaterial clearCoat](self, "clearCoat");
  v4[14] = -[SCNMaterial clearCoatRoughness](self, "clearCoatRoughness");
  v4[15] = -[SCNMaterial clearCoatNormal](self, "clearCoatNormal");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 16);
}

- (id)properties
{
  id v3;
  id v4;

  v3 = -[SCNMaterial builtinProperties](self, "builtinProperties");
  v4 = -[SCNMaterial customMaterialProperties](self, "customMaterialProperties");
  if (objc_msgSend(v4, "count"))
    return (id)objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  else
    return v3;
}

- (SCNMaterialProperty)ambient
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_ambient);
}

- (SCNMaterialProperty)multiply
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_multiply);
}

- (SCNMaterialProperty)selfIllumination
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_selfIllumination);
}

- (SCNMaterialProperty)clearCoat
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_clearCoat);
}

- (SCNMaterialProperty)clearCoatRoughness
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_clearCoatRoughness);
}

- (SCNMaterialProperty)clearCoatNormal
{
  return (SCNMaterialProperty *)-[SCNMaterial _property:](self, "_property:", &self->_clearCoatNormal);
}

void __35__SCNMaterial_setTransparencyMode___block_invoke(uint64_t a1)
{
  C3DEffectCommonProfileSetTransparencyMode(objc_msgSend(*(id *)(a1 + 32), "commonProfile"), *(unsigned __int8 *)(a1 + 40));
}

float __28__SCNMaterial_setShininess___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;
  float v3;
  float result;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  v3 = *(double *)(a1 + 40);
  C3DEffectCommonProfileSetFloatProperty(CommonProfile, 16, v3);
  return result;
}

float __31__SCNMaterial_setTransparency___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;
  float v3;
  float result;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  v3 = *(double *)(a1 + 40);
  C3DEffectCommonProfileSetFloatProperty(CommonProfile, 18, v3);
  return result;
}

- (void)setIndexOfRefraction:(double)a3
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_indexOfRefraction != a3)
  {
    v5 = a3;
    self->_indexOfRefraction = v5;
    v6 = -[SCNMaterial sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNMaterial_setIndexOfRefraction___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("indexOfRefraction"), v7);
  }
}

float __36__SCNMaterial_setIndexOfRefraction___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;
  float v3;
  float result;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  v3 = *(double *)(a1 + 40);
  C3DEffectCommonProfileSetFloatProperty(CommonProfile, 19, v3);
  return result;
}

- (double)indexOfRefraction
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  double FloatProperty;

  if (!self->_isPresentationInstance)
    return self->_indexOfRefraction;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    FloatProperty = C3DEffectCommonProfileGetFloatProperty((float *)v5, 19);
    if (!v4)
      return FloatProperty;
    goto LABEL_9;
  }
  FloatProperty = 0.0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return FloatProperty;
}

float __34__SCNMaterial_setFresnelExponent___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;
  float v3;
  float result;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  v3 = *(double *)(a1 + 40);
  C3DEffectCommonProfileSetFloatProperty(CommonProfile, 20, v3);
  return result;
}

- (void)setSelfIlluminationOcclusion:(double)a3
{
  float v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_selfIlluminationOcclusion != a3)
  {
    v5 = a3;
    self->_selfIlluminationOcclusion = v5;
    v6 = -[SCNMaterial sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__SCNMaterial_setSelfIlluminationOcclusion___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("selfIlluminationOcclusion"), v7);
  }
}

float __44__SCNMaterial_setSelfIlluminationOcclusion___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;
  float v3;
  float result;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  v3 = *(double *)(a1 + 40);
  C3DEffectCommonProfileSetSelfIlluminationOcclusion(CommonProfile, v3);
  return result;
}

- (double)selfIlluminationOcclusion
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DEffectCommonProfile *v5;
  double SelfIlluminationOcclusion;

  if (!self->_isPresentationInstance)
    return self->_selfIlluminationOcclusion;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    SelfIlluminationOcclusion = C3DEffectCommonProfileGetSelfIlluminationOcclusion((uint64_t)v5);
    if (!v4)
      return SelfIlluminationOcclusion;
    goto LABEL_9;
  }
  SelfIlluminationOcclusion = 0.0;
  if (v4)
LABEL_9:
    C3DSceneUnlock(v4);
  return SelfIlluminationOcclusion;
}

void __28__SCNMaterial_setBlendMode___block_invoke(uint64_t a1)
{
  C3DMaterialSetBlendMode(objc_msgSend(*(id *)(a1 + 32), "materialRef"), *(_DWORD *)(a1 + 40));
}

void __30__SCNMaterial_setLitPerPixel___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  C3DEffectCommonProfileSetPerPixelLit(CommonProfile, *(unsigned __int8 *)(a1 + 40));
}

void __42__SCNMaterial_setLocksAmbientWithDiffuse___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  C3DEffectCommonProfileSetEnableLockAmbientWithDiffuse(CommonProfile, *(unsigned __int8 *)(a1 + 40));
}

void __37__SCNMaterial_setAvoidsOverLighting___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile;

  CommonProfile = C3DMaterialGetCommonProfile(objc_msgSend(*(id *)(a1 + 32), "materialRef"));
  C3DEffectCommonProfileSetAvoidsOverLighting(CommonProfile, *(unsigned __int8 *)(a1 + 40));
}

void __38__SCNMaterial_setWritesToDepthBuffer___block_invoke(uint64_t a1)
{
  C3DMaterialSetEnableWriteInDepthBuffer(objc_msgSend(*(id *)(a1 + 32), "materialRef"), *(unsigned __int8 *)(a1 + 40));
}

void __39__SCNMaterial_setColorBufferWriteMask___block_invoke(uint64_t a1)
{
  C3DMaterialSetColorBufferWriteMask(objc_msgSend(*(id *)(a1 + 32), "materialRef"), *(unsigned __int8 *)(a1 + 40));
}

void __39__SCNMaterial_setReadsFromDepthBuffer___block_invoke(uint64_t a1)
{
  C3DMaterialSetEnableReadFromDepthBuffer(objc_msgSend(*(id *)(a1 + 32), "materialRef"), *(unsigned __int8 *)(a1 + 40));
}

- (id)contents
{
  __C3DScene *v3;
  uint64_t v4;

  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  if (!self->_diffuse)
  {
    -[SCNMaterial _setupMaterialProperty:](self, "_setupMaterialProperty:", &self->_diffuse);
    if (!v4)
      return -[SCNMaterialProperty contents](self->_diffuse, "contents");
    goto LABEL_5;
  }
  if (v4)
LABEL_5:
    C3DSceneUnlock(v4);
  return -[SCNMaterialProperty contents](self->_diffuse, "contents");
}

- (void)setContents:(id)a3
{
  -[SCNMaterialProperty setContents:](-[SCNMaterial diffuse](self, "diffuse"), "setContents:", a3);
  -[SCNMaterialProperty setContents:](-[SCNMaterial ambient](self, "ambient"), "setContents:", a3);
}

void __30__SCNMaterial_setDoubleSided___block_invoke(uint64_t a1)
{
  C3DMaterialSetDoubleSided(objc_msgSend(*(id *)(a1 + 32), "materialRef"), *(unsigned __int8 *)(a1 + 40));
}

void __27__SCNMaterial_setCullMode___block_invoke(uint64_t a1)
{
  C3DMaterialSetCullMode(objc_msgSend(*(id *)(a1 + 32), "materialRef"), *(_DWORD *)(a1 + 40));
}

void __27__SCNMaterial_setFillMode___block_invoke(uint64_t a1)
{
  C3DMaterialSetFillMode(objc_msgSend(*(id *)(a1 + 32), "materialRef"), *(_DWORD *)(a1 + 40));
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), NSStringFromClass(v4), self);
  if (-[NSString length](-[SCNMaterial name](self, "name"), "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" '%@'"), -[SCNMaterial name](self, "name"));
  v6 = -[SCNMaterial properties](self, "properties");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v12, "_hasDefaultValues") & 1) == 0)
        {
          objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@=%@"), objc_msgSend(v12, "propertyName"), v12);
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
    if ((v9 & 1) != 0)
      objc_msgSend(v5, "appendString:", CFSTR("\n"));
  }
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return (NSString *)v5;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  void *v6;
  __CFString *v7;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("commonProfile"), objc_msgSend(a4, "slotName"));
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("color"))
    || objc_msgSend(a3, "isEqualToString:", CFSTR("contents"))
    || objc_msgSend(a3, "isEqualToString:", CFSTR("content")))
  {
    v7 = (__CFString *)objc_msgSend(v6, "stringByAppendingString:", CFSTR(".color"));
  }
  else
  {
    v7 = (__CFString *)objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@"), a3);
  }
  return SCNCreateAnimationChannelWithObjectAndPath(self, v7);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  id result;
  uint64_t v8;
  NSObject *v9;
  int TargetedBaseType;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  __C3DScene *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = (id)objc_msgSend(a3, "length");
  if (result)
  {
    if (self->_shadableHelper)
    {
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
      v8 = -[NSMutableDictionary objectForKey:](self->_valuesForUndefinedKeys, "objectForKey:", a3);
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      if (!v8)
      {
        TargetedBaseType = SCNAnimationGetTargetedBaseType(a4);
        if (TargetedBaseType)
        {
          v15 = SCNDefaultValueWithBaseType(TargetedBaseType, v11, v12, v13, v14);
          v16 = -[SCNMaterial sceneRef](self, "sceneRef");
          if (v16)
          {
            v17 = (uint64_t)v16;
            C3DSceneLock((uint64_t)v16);
            +[SCNTransaction begin](SCNTransaction, "begin");
            +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
            -[SCNMaterial setValue:forUndefinedKey:](self, "setValue:forUndefinedKey:", v15, a3);
            +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
            C3DSceneUnlock(v17);
          }
          else
          {
            +[SCNTransaction begin](SCNTransaction, "begin");
            +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
            -[SCNMaterial setValue:forUndefinedKey:](self, "setValue:forUndefinedKey:", v15, a3);
            +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
          }
        }
        else
        {
          v18 = scn_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = 138412290;
            v20 = a3;
            _os_log_impl(&dword_1DCCB8000, v18, OS_LOG_TYPE_DEFAULT, "Warning: can't prepare shadable animation with path %@", (uint8_t *)&v19, 0xCu);
          }
        }
      }
    }
    result = SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
    if (!result)
    {
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SCNMaterial copyAnimationChannelForKeyPath:animation:].cold.1();
      return 0;
    }
  }
  return result;
}

- (id)scene
{
  id result;

  result = -[SCNMaterial sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNMaterial sceneRef](self, "sceneRef");
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
    v9 = -[SCNMaterial __CFObject](self, "__CFObject");
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
  _QWORD v10[7];

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
    v8 = -[SCNMaterial sceneRef](self, "sceneRef");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__SCNMaterial_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_1EA59F718;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v10);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNMaterial addAnimationPlayer:forKey:].cold.1();
  }
}

void __41__SCNMaterial_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 36);
    objc_msgSend(*((id *)a1[5] + 19), "removeObjectForKey:", a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 36);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v5;
  SCNAnimation *v6;
  SCNAnimationPlayer *v7;
  NSObject *v8;

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
    -[SCNMaterial addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
    -[SCNAnimationPlayer play](v7, "play");
  }
  else
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNMaterial addAnimation:forKey:].cold.1();
  }
}

- (void)addAnimation:(id)a3
{
  -[SCNMaterial addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
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
  v4 = -[SCNMaterial sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SCNMaterial_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __34__SCNMaterial_removeAllAnimations__block_invoke(uint64_t a1)
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
  v6 = -[SCNMaterial sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SCNMaterial_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __55__SCNMaterial_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    v6 = -[SCNMaterial sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNMaterial_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __37__SCNMaterial_removeAnimationForKey___block_invoke(uint64_t a1)
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
    v8 = -[SCNMaterial sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__SCNMaterial_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __54__SCNMaterial_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
  SCNFadeAndRemoveAnimation(*(void **)(a1 + 32), *(void **)(a1 + 40), *(double *)(a1 + 48));
}

- (id)animationForKey:(id)a3
{
  id v3;

  v3 = -[SCNMaterial _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
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
  v9 = -[SCNMaterial __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNMaterial animationManager](self, "animationManager");
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

  v5 = -[SCNMaterial sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SCNMaterial_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __36__SCNMaterial_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNMaterial sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SCNMaterial_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __37__SCNMaterial_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNMaterial sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__SCNMaterial_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __40__SCNMaterial_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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

  v5 = -[SCNMaterial sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNMaterial __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNMaterial animationManager](self, "animationManager");
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

    v15 = -[SCNMaterial sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__SCNMaterial_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __63__SCNMaterial_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  v5 = -[SCNMaterial sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SCNMaterial_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __36__SCNMaterial_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNMaterial sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SCNMaterial_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __32__SCNMaterial_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (void)_setAttributes:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_msgSend(a3, "allKeys", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SCNMaterial setValue:forKey:](self, "setValue:forKey:", objc_msgSend(a3, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9)), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (__C3DMaterial)materialRefCreateIfNeeded
{
  return self->_material;
}

- (id)valueForUndefinedKey:(id)a3
{
  const __CFString *v5;
  const __CFString *v6;
  float32x2_t *TargetAddress;
  int BaseType;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v15;

  if (self->_isPresentationInstance)
  {
    v5 = C3DCFTypeCopyModelInfoAtPath((float32x4_t *)self->_material, (CFStringRef)a3, 0);
    if (v5)
    {
      v6 = v5;
      if (C3DModelTargetGetTargetAddress((uint64_t)v5))
      {
        TargetAddress = (float32x2_t *)C3DModelTargetGetTargetAddress((uint64_t)v6);
        BaseType = C3DModelTargetGetBaseType((uint64_t)v6);
        v13 = (void *)SCNNSValueFromTypedBytes(TargetAddress, BaseType, v9, v10, v11, v12);
        CFRelease(v6);
        return v13;
      }
      CFRelease(v6);
    }
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v15 = (id)-[NSMutableDictionary objectForKey:](self->_valuesForUndefinedKeys, "objectForKey:", a3);
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  return v15;
}

- (id)customMaterialPropertyNames
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  NSMutableDictionary *valuesForUndefinedKeys;
  _QWORD v7[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SCNMaterial_customMaterialPropertyNames__block_invoke;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valuesForUndefinedKeys, "enumerateKeysAndObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __42__SCNMaterial_customMaterialPropertyNames__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

- (id)customMaterialProperties
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  NSMutableDictionary *valuesForUndefinedKeys;
  _QWORD v7[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SCNMaterial_customMaterialProperties__block_invoke;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valuesForUndefinedKeys, "enumerateKeysAndObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __39__SCNMaterial_customMaterialProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a3);
  return result;
}

- (id)customMaterialAttributeNames
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  NSMutableDictionary *valuesForUndefinedKeys;
  _QWORD v7[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SCNMaterial_customMaterialAttributeNames__block_invoke;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valuesForUndefinedKeys, "enumerateKeysAndObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __43__SCNMaterial_customMaterialAttributeNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = _isValidCustomPropertyType(a3);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

- (id)customMaterialAttributes
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  NSMutableDictionary *valuesForUndefinedKeys;
  _QWORD v7[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SCNMaterial_customMaterialAttributes__block_invoke;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valuesForUndefinedKeys, "enumerateKeysAndObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __39__SCNMaterial_customMaterialAttributes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = _isValidCustomPropertyType(a3);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a3);
  return result;
}

- (void)setMinimumLanguageVersion:(id)a3
{
  NSObject *v4;

  if (self->_isPresentationInstance)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNMaterial setMinimumLanguageVersion:].cold.1();
  }
  else
  {
    if (a3)
      -[SCNMaterial _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
    -[SCNShadableHelper setMinimumLanguageVersion:](self->_shadableHelper, "setMinimumLanguageVersion:", a3);
  }
}

- (NSNumber)minimumLanguageVersion
{
  return -[SCNShadableHelper minimumLanguageVersion](self->_shadableHelper, "minimumLanguageVersion");
}

- (id)shaderModifiersArgumentsNames
{
  return -[SCNShadableHelper shaderModifiersArgumentsNames](self->_shadableHelper, "shaderModifiersArgumentsNames");
}

- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  -[SCNMaterial _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
  -[SCNShadableHelper handleBindingOfSymbol:usingBlock:](self->_shadableHelper, "handleBindingOfSymbol:usingBlock:", a3, a4);
}

- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  -[SCNMaterial _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
  -[SCNShadableHelper handleUnbindingOfSymbol:usingBlock:](self->_shadableHelper, "handleUnbindingOfSymbol:usingBlock:", a3, a4);
}

+ (id)materialNamed:(id)a3
{
  return +[SCNAssetCatalog objectWithName:class:](SCNAssetCatalog, "objectWithName:class:", a3, objc_opt_class());
}

- (void)_customDecodingOfSCNMaterial:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), CFSTR("valuesForUndefinedKeys"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SCNMaterial _setAttributes:](self, "_setAttributes:", (id)objc_msgSend(v4, "mutableCopy"));
}

- (void)_customEncodingOfSCNMaterial:(id)a3
{
  __C3DEffectCommonProfile *v5;
  uint64_t v6;
  NSMutableDictionary *valuesForUndefinedKeys;

  v5 = -[SCNMaterial commonProfile](self, "commonProfile");
  if (v5)
  {
    v6 = (uint64_t)v5;
    if (C3DEffectCommonProfileGetEffectSlot((uint64_t)v5, 1, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_ambient);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 2, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_diffuse);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 3, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_specular);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 0, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_emission);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 6, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_multiply);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 4, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_reflective);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 5, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_transparent);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 7, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_normal);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 9, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_selfIllumination);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 8, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_ambientOcclusion);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 10, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_metalness);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 11, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_roughness);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 15, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_displacement);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 12, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_clearCoat);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 13, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_clearCoatRoughness);
    if (C3DEffectCommonProfileGetEffectSlot(v6, 14, 0))
      -[SCNMaterial _property:](self, "_property:", &self->_clearCoatNormal);
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (valuesForUndefinedKeys)
    objc_msgSend(a3, "encodeObject:forKey:", valuesForUndefinedKeys, CFSTR("valuesForUndefinedKeys"));
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
}

- (void)encodeWithCoder:(id)a3
{
  SCNMaterialProperty *ambient;
  SCNMaterialProperty *diffuse;
  SCNMaterialProperty *specular;
  SCNMaterialProperty *emission;
  SCNMaterialProperty *reflective;
  SCNMaterialProperty *transparent;
  SCNMaterialProperty *multiply;
  SCNMaterialProperty *normal;
  SCNMaterialProperty *selfIllumination;
  SCNMaterialProperty *ambientOcclusion;
  SCNMaterialProperty *metalness;
  SCNMaterialProperty *roughness;
  SCNMaterialProperty *displacement;
  SCNMaterialProperty *clearCoat;
  SCNMaterialProperty *clearCoatRoughness;
  SCNMaterialProperty *clearCoatNormal;
  NSString *name;
  double v22;
  double v23;
  double v24;
  double v25;
  NSString *lightingModelName;
  SCNShadableHelper *shadableHelper;
  double v28;

  if (self->_isPresentationInstance)
    -[SCNMaterial _syncObjCModel](self, "_syncObjCModel");
  -[SCNMaterial _customEncodingOfSCNMaterial:](self, "_customEncodingOfSCNMaterial:", a3);
  ambient = self->_ambient;
  if (ambient)
    objc_msgSend(a3, "encodeObject:forKey:", ambient, CFSTR("ambient"));
  diffuse = self->_diffuse;
  if (diffuse)
    objc_msgSend(a3, "encodeObject:forKey:", diffuse, CFSTR("diffuse"));
  specular = self->_specular;
  if (specular)
    objc_msgSend(a3, "encodeObject:forKey:", specular, CFSTR("specular"));
  emission = self->_emission;
  if (emission)
    objc_msgSend(a3, "encodeObject:forKey:", emission, CFSTR("emission"));
  reflective = self->_reflective;
  if (reflective)
    objc_msgSend(a3, "encodeObject:forKey:", reflective, CFSTR("reflective"));
  transparent = self->_transparent;
  if (transparent)
    objc_msgSend(a3, "encodeObject:forKey:", transparent, CFSTR("transparent"));
  multiply = self->_multiply;
  if (multiply)
    objc_msgSend(a3, "encodeObject:forKey:", multiply, CFSTR("multiply"));
  normal = self->_normal;
  if (normal)
    objc_msgSend(a3, "encodeObject:forKey:", normal, CFSTR("normal"));
  selfIllumination = self->_selfIllumination;
  if (selfIllumination)
    objc_msgSend(a3, "encodeObject:forKey:", selfIllumination, CFSTR("selfIllumination"));
  ambientOcclusion = self->_ambientOcclusion;
  if (ambientOcclusion)
    objc_msgSend(a3, "encodeObject:forKey:", ambientOcclusion, CFSTR("ambientOcclusion"));
  metalness = self->_metalness;
  if (metalness)
    objc_msgSend(a3, "encodeObject:forKey:", metalness, CFSTR("metalness"));
  roughness = self->_roughness;
  if (roughness)
    objc_msgSend(a3, "encodeObject:forKey:", roughness, CFSTR("roughness"));
  displacement = self->_displacement;
  if (displacement)
    objc_msgSend(a3, "encodeObject:forKey:", displacement, CFSTR("displacement"));
  clearCoat = self->_clearCoat;
  if (clearCoat)
    objc_msgSend(a3, "encodeObject:forKey:", clearCoat, CFSTR("clearCoat"));
  clearCoatRoughness = self->_clearCoatRoughness;
  if (clearCoatRoughness)
    objc_msgSend(a3, "encodeObject:forKey:", clearCoatRoughness, CFSTR("clearCoatRoughness"));
  clearCoatNormal = self->_clearCoatNormal;
  if (clearCoatNormal)
    objc_msgSend(a3, "encodeObject:forKey:", clearCoatNormal, CFSTR("clearCoatNormal"));
  name = self->_name;
  objc_opt_class();
  SCNEncodeNamedObject(a3, (const char *)name);
  *(float *)&v22 = self->_shininess;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("shininess"), v22);
  *(float *)&v23 = self->_transparency;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("transparency"), v23);
  *(float *)&v24 = self->_indexOfRefraction;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("indexOfRefraction"), v24);
  *(float *)&v25 = self->_fresnelExponent;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("fresnelExponent"), v25);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_transparencyMode, CFSTR("transparencyMode"));
  lightingModelName = self->_lightingModelName;
  if (lightingModelName)
    objc_msgSend(a3, "encodeObject:forKey:", lightingModelName, CFSTR("lightingModelName"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_cullMode, CFSTR("cullMode"));
  shadableHelper = self->_shadableHelper;
  if (shadableHelper)
    objc_msgSend(a3, "encodeObject:forKey:", shadableHelper, CFSTR("shadableHelper"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_litPerPixel, CFSTR("litPerPixel"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_doubleSided, CFSTR("doubleSided"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_locksAmbientWithDiffuse, CFSTR("locksAmbientWithDiffuse"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_avoidsOverLighting, CFSTR("avoidsOverLighting"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_writesToDepthBuffer, CFSTR("writesToDepthBuffer"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_readsFromDepthBuffer, CFSTR("readsFromDepthBuffer"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_colorBufferWriteMask, CFSTR("colorBufferWriteMask"));
  objc_msgSend(a3, "encodeInteger:forKey:", SCNFillModeToSCNLegacyFillMode[self->_fillMode], CFSTR("fillMode"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_blendMode, CFSTR("blendMode"));
  *(float *)&v28 = self->_selfIlluminationOcclusion;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("selfIlluminationOcclusion"), v28);
  SCNEncodeEntity(a3, self);
  SCNEncodeAnimations(a3, self);
}

- (SCNMaterial)initWithCoder:(id)a3
{
  SCNMaterial *v4;
  _BOOL8 v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  SCNShadableHelper *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SCNMaterial;
  v4 = -[SCNMaterial init](&v16, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = C3DMaterialCreate();
    v4->_material = (__C3DMaterial *)v6;
    if (v6)
      C3DEntitySetObjCWrapper(v6, v4);
    -[SCNMaterial _syncObjCModel](v4, "_syncObjCModel");
    v4->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    -[SCNMaterial _customDecodingOfSCNMaterial:](v4, "_customDecodingOfSCNMaterial:", a3);
    v4->_ambient = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ambient"));
    v4->_diffuse = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diffuse"));
    v4->_specular = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specular"));
    v4->_emission = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emission"));
    v4->_reflective = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reflective"));
    v4->_transparent = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transparent"));
    v4->_multiply = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiply"));
    v4->_normal = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("normal"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("selfIllumination")))
      v4->_selfIllumination = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfIllumination"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("ambientOcclusion")))
      v4->_ambientOcclusion = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ambientOcclusion"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("metalness")))
      v4->_metalness = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metalness"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("roughness")))
      v4->_roughness = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roughness"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("displacement")))
      v4->_displacement = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displacement"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("clearCoat")))
      v4->_clearCoat = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clearCoat"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("clearCoatRoughness")))
      v4->_clearCoatRoughness = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clearCoatRoughness"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("clearCoatNormal")))
      v4->_clearCoatNormal = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clearCoatNormal"));
    -[SCNMaterial setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("shininess"));
    -[SCNMaterial setShininess:](v4, "setShininess:", v7);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("transparency"));
    -[SCNMaterial setTransparency:](v4, "setTransparency:", v8);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("indexOfRefraction"));
    -[SCNMaterial setIndexOfRefraction:](v4, "setIndexOfRefraction:", v9);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("fresnelExponent"));
    -[SCNMaterial setFresnelExponent:](v4, "setFresnelExponent:", v10);
    -[SCNMaterial setTransparencyMode:](v4, "setTransparencyMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("transparencyMode")));
    -[SCNMaterial setLightingModelName:](v4, "setLightingModelName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightingModelName")));
    -[SCNMaterial setCullMode:](v4, "setCullMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("cullMode")));
    v11 = (SCNShadableHelper *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shadableHelper"));
    v4->_shadableHelper = v11;
    if (-[SCNShadableHelper owner](v11, "owner") != v4)
    {

      v4->_shadableHelper = 0;
    }
    -[SCNMaterial setLitPerPixel:](v4, "setLitPerPixel:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("litPerPixel")));
    -[SCNMaterial setDoubleSided:](v4, "setDoubleSided:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("doubleSided")));
    -[SCNMaterial setLocksAmbientWithDiffuse:](v4, "setLocksAmbientWithDiffuse:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("locksAmbientWithDiffuse")));
    -[SCNMaterial setAvoidsOverLighting:](v4, "setAvoidsOverLighting:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("avoidsOverLighting")));
    -[SCNMaterial setWritesToDepthBuffer:](v4, "setWritesToDepthBuffer:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("writesToDepthBuffer")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("colorBufferWriteMask")))
      -[SCNMaterial setColorBufferWriteMask:](v4, "setColorBufferWriteMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("colorBufferWriteMask")));
    -[SCNMaterial setReadsFromDepthBuffer:](v4, "setReadsFromDepthBuffer:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("readsFromDepthBuffer")));
    v12 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("fillMode"));
    v13 = 2;
    if (v12 < 2)
      v13 = v12;
    -[SCNMaterial setFillMode:](v4, "setFillMode:", SCNFillModeFromSCNLegacyFillMode[v13 & ~(v13 >> 63)]);
    -[SCNMaterial setBlendMode:](v4, "setBlendMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("blendMode")));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("selfIlluminationOcclusion"));
    -[SCNMaterial setSelfIlluminationOcclusion:](v4, "setSelfIlluminationOcclusion:", v14);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugQuickLookObject
{
  SCNSphere *v3;

  v3 = +[SCNSphere sphereWithRadius:](SCNSphere, "sphereWithRadius:", 1.0);
  -[SCNGeometry setFirstMaterial:](v3, "setFirstMaterial:", self);
  return -[SCNGeometry debugQuickLookObject](v3, "debugQuickLookObject");
}

- (id)debugQuickLookData
{
  return UIImagePNGRepresentation((UIImage *)-[SCNMaterial debugQuickLookObject](self, "debugQuickLookObject"));
}

- (void)setName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)_setupMaterialProperty:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: _setupMaterialProperty -- should not reach", v1, 2u);
}

- (void)copyAnimationChannelForKeyPath:animation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: Material : %@ is not an animatable path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addAnimationPlayer:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: attempt to add a null animation player on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addAnimation:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: attempt to add a null animation on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_shadableSetValue:forUndefinedKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setShaderModifiers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)copyShaderModifiersAndLanguageVersionFrom:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setMinimumLanguageVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setProgram:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)_customEncodingOfSCNMaterial:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_5();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DCCB8000, v1, OS_LOG_TYPE_ERROR, "Error: Failed to archive material's custom attributes. %@ %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
