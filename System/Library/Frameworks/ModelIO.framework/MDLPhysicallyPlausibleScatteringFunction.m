@implementation MDLPhysicallyPlausibleScatteringFunction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearcoatGloss, 0);
  objc_storeStrong((id *)&self->_clearcoat, 0);
  objc_storeStrong((id *)&self->_sheenTint, 0);
  objc_storeStrong((id *)&self->_sheen, 0);
  objc_storeStrong((id *)&self->_anisotropicRotation, 0);
  objc_storeStrong((id *)&self->_anisotropic, 0);
  objc_storeStrong((id *)&self->_roughness, 0);
  objc_storeStrong((id *)&self->_specularTint, 0);
  objc_storeStrong((id *)&self->_specularAmount, 0);
  objc_storeStrong((id *)&self->_metallic, 0);
  objc_storeStrong((id *)&self->_subsurface, 0);
}

- (MDLMaterialProperty)roughness
{
  return self->_roughness;
}

- (MDLMaterialProperty)metallic
{
  return self->_metallic;
}

- (MDLMaterialProperty)clearcoat
{
  return self->_clearcoat;
}

- (MDLMaterialProperty)clearcoatGloss
{
  return self->_clearcoatGloss;
}

- (MDLPhysicallyPlausibleScatteringFunction)init
{
  MDLPhysicallyPlausibleScatteringFunction *v3;
  MDLPhysicallyPlausibleScatteringFunction *v4;
  NSString *name;
  PhysicallyPlausibleDistribution *v6;
  BidirectionalScatteringDistributionFunction *value;
  MDLMaterialProperty *v8;
  double v9;
  const char *v10;
  MDLMaterialProperty *v11;
  MDLMaterialProperty *metallic;
  MDLMaterialProperty *v13;
  double v14;
  const char *v15;
  MDLMaterialProperty *v16;
  MDLMaterialProperty *roughness;
  MDLMaterialProperty *v18;
  double v19;
  const char *v20;
  MDLMaterialProperty *v21;
  MDLMaterialProperty *sheen;
  MDLMaterialProperty *v23;
  double v24;
  const char *v25;
  MDLMaterialProperty *v26;
  MDLMaterialProperty *sheenTint;
  MDLMaterialProperty *v28;
  double v29;
  const char *v30;
  MDLMaterialProperty *v31;
  MDLMaterialProperty *anisotropic;
  MDLMaterialProperty *v33;
  double v34;
  const char *v35;
  MDLMaterialProperty *v36;
  MDLMaterialProperty *v37;
  MDLMaterialProperty *v38;
  double v39;
  const char *v40;
  MDLMaterialProperty *v41;
  MDLMaterialProperty *specularAmount;
  MDLMaterialProperty *v43;
  double v44;
  const char *v45;
  MDLMaterialProperty *v46;
  MDLMaterialProperty *specularTint;
  MDLMaterialProperty *v48;
  double v49;
  const char *v50;
  MDLMaterialProperty *v51;
  MDLMaterialProperty *clearcoat;
  MDLMaterialProperty *v53;
  double v54;
  const char *v55;
  MDLMaterialProperty *v56;
  MDLMaterialProperty *clearcoatGloss;
  MDLMaterialProperty *v58;
  double v59;
  const char *v60;
  MDLMaterialProperty *v61;
  MDLMaterialProperty *subsurface;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)MDLPhysicallyPlausibleScatteringFunction;
  v3 = -[MDLScatteringFunction init](&v64, sel_init);
  if (v3 == self)
  {
    name = self->super._name;
    self->super._name = (NSString *)CFSTR("SimplifiedPhysical");

    v6 = (PhysicallyPlausibleDistribution *)operator new();
    sub_1DCAD2364((uint64_t)v6);
    self->_physicalBSDF = v6;
    value = self->super._bsdf.__ptr_.__value_;
    self->super._bsdf.__ptr_.__value_ = (BidirectionalScatteringDistributionFunction *)v6;
    if (value)
      (*((void (**)(BidirectionalScatteringDistributionFunction *))value->var0 + 1))(value);
    v8 = [MDLMaterialProperty alloc];
    LODWORD(v9) = 0;
    v11 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v8, v10, (uint64_t)CFSTR("metallic"), 2, v9);
    metallic = self->_metallic;
    self->_metallic = v11;

    self->_physicalBSDF[1].var1.var1 = 0.0;
    v13 = [MDLMaterialProperty alloc];
    LODWORD(v14) = 1063675494;
    v16 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v13, v15, (uint64_t)CFSTR("roughness"), 6, v14);
    roughness = self->_roughness;
    self->_roughness = v16;

    HIDWORD(self->_physicalBSDF[1].var1.var2) = 1063675494;
    v18 = [MDLMaterialProperty alloc];
    LODWORD(v19) = 1028443341;
    v21 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v18, v20, (uint64_t)CFSTR("sheen"), 9, v19);
    sheen = self->_sheen;
    self->_sheen = v21;

    *((_DWORD *)&self->_physicalBSDF[1].var1.var1 + 1) = 1028443341;
    v23 = [MDLMaterialProperty alloc];
    LODWORD(v24) = 0;
    v26 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v23, v25, (uint64_t)CFSTR("sheenTint"), 10, v24);
    sheenTint = self->_sheenTint;
    self->_sheenTint = v26;

    LODWORD(self->_physicalBSDF[1].var1.var2) = 0;
    v28 = [MDLMaterialProperty alloc];
    LODWORD(v29) = 0;
    v31 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v28, v30, (uint64_t)CFSTR("anisotropic"), 7, v29);
    anisotropic = self->_anisotropic;
    self->_anisotropic = v31;

    self->_physicalBSDF[1].var1.var3 = 0.0;
    v33 = [MDLMaterialProperty alloc];
    LODWORD(v34) = 0;
    v36 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v33, v35, (uint64_t)CFSTR("anisotropicRotation"), 8, v34);
    v37 = self->_anisotropic;
    self->_anisotropic = v36;

    self->_physicalBSDF[1].var1.var4 = 0.0;
    v38 = [MDLMaterialProperty alloc];
    LODWORD(v39) = 0;
    v41 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v38, v40, (uint64_t)CFSTR("specular"), 3, v39);
    specularAmount = self->_specularAmount;
    self->_specularAmount = v41;

    LODWORD(self->_physicalBSDF[1].var1.var0) = 0;
    v43 = [MDLMaterialProperty alloc];
    LODWORD(v44) = 0;
    v46 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v43, v45, (uint64_t)CFSTR("specularTint"), 5, v44);
    specularTint = self->_specularTint;
    self->_specularTint = v46;

    HIDWORD(self->_physicalBSDF[1].var1.var0) = 0;
    v48 = [MDLMaterialProperty alloc];
    LODWORD(v49) = 0;
    v51 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v48, v50, (uint64_t)CFSTR("clearcoat"), 11, v49);
    clearcoat = self->_clearcoat;
    self->_clearcoat = v51;

    self->_physicalBSDF[1].var1.var5 = 0.0;
    v53 = [MDLMaterialProperty alloc];
    LODWORD(v54) = 0;
    v56 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v53, v55, (uint64_t)CFSTR("clearcoatGloss"), 12, v54);
    clearcoatGloss = self->_clearcoatGloss;
    self->_clearcoatGloss = v56;

    self->_physicalBSDF[1].var1.var6 = 0.0;
    v58 = [MDLMaterialProperty alloc];
    LODWORD(v59) = 0;
    v61 = (MDLMaterialProperty *)objc_msgSend_initWithName_semantic_float_(v58, v60, (uint64_t)CFSTR("subsurface"), 1, v59);
    subsurface = self->_subsurface;
    self->_subsurface = v61;

    self->_physicalBSDF[1].var1.var7 = 0.0;
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MDLMaterialProperty)subsurface
{
  return self->_subsurface;
}

- (MDLMaterialProperty)specularTint
{
  return self->_specularTint;
}

- (MDLMaterialProperty)specularAmount
{
  return self->_specularAmount;
}

- (MDLMaterialProperty)sheen
{
  return self->_sheen;
}

- (MDLMaterialProperty)sheenTint
{
  return self->_sheenTint;
}

- (MDLMaterialProperty)anisotropic
{
  return self->_anisotropic;
}

- (MDLMaterialProperty)anisotropicRotation
{
  return self->_anisotropicRotation;
}

- (NSInteger)version
{
  return 1;
}

@end
