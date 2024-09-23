@implementation MDLScatteringFunction

- (void).cxx_destruct
{
  BidirectionalScatteringDistributionFunction *value;

  objc_storeStrong((id *)&self->_ambientOcclusionScale, 0);
  objc_storeStrong((id *)&self->_ambientOcclusion, 0);
  objc_storeStrong((id *)&self->_normal, 0);
  objc_storeStrong((id *)&self->_interfaceIndexOfRefraction, 0);
  objc_storeStrong((id *)&self->_materialIndexOfRefraction, 0);
  objc_storeStrong((id *)&self->_specular, 0);
  objc_storeStrong((id *)&self->_emission, 0);
  value = self->_bsdf.__ptr_.__value_;
  self->_bsdf.__ptr_.__value_ = 0;
  if (value)
    (*((void (**)(BidirectionalScatteringDistributionFunction *))value->var0 + 1))(value);
  objc_storeStrong((id *)&self->_baseColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (MDLMaterialProperty)normal
{
  return self->_normal;
}

- (MDLMaterialProperty)emission
{
  return self->_emission;
}

- (MDLMaterialProperty)baseColor
{
  return self->_baseColor;
}

- (MDLScatteringFunction)init
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  CGColorSpace *DeviceRGB;
  CGColor *v7;
  MDLMaterialProperty *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CGColor *v12;
  MDLMaterialProperty *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  MDLMaterialProperty *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  MDLMaterialProperty *v22;
  double v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  MDLMaterialProperty *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  MDLMaterialProperty *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  id v36;
  objc_super v38;
  CGFloat v39[2];
  __int128 v40;
  CGFloat components[2];
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)MDLScatteringFunction;
  v2 = -[MDLScatteringFunction init](&v38, sel_init);
  if (v2)
  {
    v3 = operator new();
    sub_1DCAD2948(v3);
    v4 = *((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = CFSTR("Base");

    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_1DCC57C50;
    v42 = unk_1DCC57C60;
    v7 = CGColorCreate(DeviceRGB, components);
    v8 = [MDLMaterialProperty alloc];
    v10 = objc_msgSend_initWithName_semantic_color_(v8, v9, (uint64_t)CFSTR("baseColor"), 0, v7);
    v11 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v10;

    sub_1DCAD2468(*((_QWORD *)v2 + 3), v7);
    CGColorRelease(v7);
    *(_OWORD *)v39 = xmmword_1DCC57C70;
    v40 = unk_1DCC57C80;
    v12 = CGColorCreate(DeviceRGB, v39);
    CGColorSpaceRelease(DeviceRGB);
    v13 = [MDLMaterialProperty alloc];
    v15 = objc_msgSend_initWithName_semantic_color_(v13, v14, (uint64_t)CFSTR("emission"), 13, v12);
    v16 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v15;

    sub_1DCAD290C(*((_QWORD *)v2 + 3), v12);
    CGColorRelease(v12);
    v17 = [MDLMaterialProperty alloc];
    LODWORD(v18) = 1.0;
    v20 = objc_msgSend_initWithName_semantic_float_(v17, v19, (uint64_t)CFSTR("interfaceIndexOfRefraction"), 16, v18);
    v21 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v20;

    *(_DWORD *)(*((_QWORD *)v2 + 3) + 88) = 1065353216;
    v22 = [MDLMaterialProperty alloc];
    LODWORD(v23) = 1.0;
    v25 = objc_msgSend_initWithName_semantic_float_(v22, v24, (uint64_t)CFSTR("materialIndexOfRefraction"), 17, v23);
    v26 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v25;

    *(_DWORD *)(*((_QWORD *)v2 + 3) + 92) = 1065353216;
    v27 = [MDLMaterialProperty alloc];
    v29 = objc_msgSend_initWithName_semantic_(v27, v28, (uint64_t)CFSTR("ambientOcclusion"), 22);
    v30 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v29;

    v31 = [MDLMaterialProperty alloc];
    LODWORD(v32) = 1.0;
    v34 = objc_msgSend_initWithName_semantic_float_(v31, v33, (uint64_t)CFSTR("ambientOcclusionScale"), 23, v32);
    v35 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v34;

    v36 = v2;
  }

  return (MDLScatteringFunction *)v2;
}

- (MDLMaterialProperty)specular
{
  return self->_specular;
}

- (MDLMaterialProperty)materialIndexOfRefraction
{
  return self->_materialIndexOfRefraction;
}

- (MDLMaterialProperty)interfaceIndexOfRefraction
{
  return self->_interfaceIndexOfRefraction;
}

- (MDLMaterialProperty)ambientOcclusion
{
  return self->_ambientOcclusion;
}

- (MDLMaterialProperty)ambientOcclusionScale
{
  return self->_ambientOcclusionScale;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 8);
}

@end
