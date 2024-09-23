@implementation ARUIRing

- (void)setOpacity:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_opacity))
  {
    self->_opacity = a3;
    -[ARUIRing _updatePremultipliedTopColor](self, "_updatePremultipliedTopColor");
    -[ARUIRing _updatePremultipliedBottomColor](self, "_updatePremultipliedBottomColor");
  }
}

- (void)setPercentage:(float)a3
{
  float v4;

  if (a3 == INFINITY)
    a3 = *(float *)&ARUIRingPercentageValueNoRing;
  v4 = a3;
  if (!ARUIFloatEqual(a3, self->_percentage))
    self->_percentage = v4;
}

- (float)percentage
{
  return self->_percentage;
}

- (unint64_t)hash
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;

  +[ARUIHashBuilder builder](ARUIHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_topColor);
  objc_msgSend(v3, "appendObject:", self->_bottomColor);
  *(float *)&v4 = self->_diameter;
  objc_msgSend(v3, "appendFloat:", v4);
  *(float *)&v5 = self->_thickness;
  objc_msgSend(v3, "appendFloat:", v5);
  *(float *)&v6 = self->_percentage;
  objc_msgSend(v3, "appendFloat:", v6);
  *(float *)&v7 = self->_opacity;
  objc_msgSend(v3, "appendFloat:", v7);
  *(float *)&v8 = self->_emptyOpacity;
  objc_msgSend(v3, "appendFloat:", v8);
  *(float *)&v9 = self->_trackOpacity;
  objc_msgSend(v3, "appendFloat:", v9);
  *(float *)&v10 = self->_scale;
  objc_msgSend(v3, "appendFloat:", v10);
  *(float *)&v11 = self->_zRotation;
  objc_msgSend(v3, "appendFloat:", v11);
  objc_msgSend(v3, "appendFloat2:", *(double *)self->_translation);
  objc_msgSend(v3, "appendObject:", self->_celebration);
  v12 = objc_msgSend(v3, "hash");

  return v12;
}

- (void)setDiameter:(float)a3
{
  self->_diameter = a3;
}

- (float)thickness
{
  return self->_thickness;
}

- (float)scale
{
  return self->_scale;
}

- (float)opacity
{
  return self->_opacity;
}

- (double)translation
{
  return *(double *)(a1 + 56);
}

- (float)diameter
{
  return self->_diameter;
}

- (void)setEmptyOpacity:(float)a3
{
  self->_emptyOpacity = a3;
}

- (ARUICelebration)celebration
{
  return self->_celebration;
}

- (float)trackOpacity
{
  return self->_trackOpacity;
}

- (float)emptyOpacity
{
  return self->_emptyOpacity;
}

- (void)setTrackOpacity:(float)a3
{
  self->_trackOpacity = a3;
}

- (void)setThickness:(float)a3
{
  self->_thickness = a3;
}

- (ARUIRing)initWithRing:(id)a3
{
  id v4;
  ARUIRing *v5;
  void *v6;
  uint64_t v7;
  UIColor *topColor;
  void *v9;
  uint64_t v10;
  UIColor *bottomColor;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  uint64_t v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ARUIRing;
  v5 = -[ARUIRing init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "topColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    topColor = v5->_topColor;
    v5->_topColor = (UIColor *)v7;

    objc_msgSend(v4, "bottomColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    bottomColor = v5->_bottomColor;
    v5->_bottomColor = (UIColor *)v10;

    objc_msgSend(v4, "topColorVector");
    *(_OWORD *)v5->_topColorVector = v12;
    objc_msgSend(v4, "topColorPremultipliedVector");
    *(_OWORD *)v5->_topColorPremultipliedVector = v13;
    objc_msgSend(v4, "bottomColorVector");
    *(_OWORD *)v5->_bottomColorVector = v14;
    objc_msgSend(v4, "bottomColorPremultipliedVector");
    *(_OWORD *)v5->_bottomColorPremultipliedVector = v15;
    objc_msgSend(v4, "diameter");
    v5->_diameter = v16;
    objc_msgSend(v4, "thickness");
    v5->_thickness = v17;
    objc_msgSend(v4, "percentage");
    v5->_percentage = v18;
    objc_msgSend(v4, "opacity");
    v5->_opacity = v19;
    objc_msgSend(v4, "emptyOpacity");
    v5->_emptyOpacity = v20;
    objc_msgSend(v4, "trackOpacity");
    v5->_trackOpacity = v21;
    objc_msgSend(v4, "scale");
    v5->_scale = v22;
    objc_msgSend(v4, "zRotation");
    v5->_zRotation = v23;
    objc_msgSend(v4, "translation");
    *(_QWORD *)v5->_translation = v24;
  }

  return v5;
}

- (__n128)topColorPremultipliedVector
{
  return a1[6];
}

- (__n128)bottomColorPremultipliedVector
{
  return a1[8];
}

- (float)zRotation
{
  return self->_zRotation;
}

- (UIColor)topColor
{
  return self->_topColor;
}

- (__n128)topColorVector
{
  return a1[5];
}

- (UIColor)bottomColor
{
  return self->_bottomColor;
}

- (__n128)bottomColorVector
{
  return a1[7];
}

- (void)setBottomColor:(id)a3
{
  id v5;
  float64x2_t v6;
  float64x2_t v7;
  float64_t v8;
  float64_t v9;
  float64_t v10;
  float64_t v11;

  objc_storeStrong((id *)&self->_bottomColor, a3);
  v5 = a3;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);

  v6.f64[0] = v11;
  v6.f64[1] = v10;
  v7.f64[0] = v9;
  v7.f64[1] = v8;
  *(float32x4_t *)self->_bottomColorVector = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v7);
  -[ARUIRing _updatePremultipliedBottomColor](self, "_updatePremultipliedBottomColor");
}

- (void)_updatePremultipliedBottomColor
{
  *(float32x4_t *)self->_bottomColorPremultipliedVector = vmulq_n_f32(*(float32x4_t *)self->_bottomColorVector, self->_opacity);
}

- (void)setTopColor:(id)a3
{
  id v5;
  float64x2_t v6;
  float64x2_t v7;
  float64_t v8;
  float64_t v9;
  float64_t v10;
  float64_t v11;

  objc_storeStrong((id *)&self->_topColor, a3);
  v5 = a3;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);

  v6.f64[0] = v11;
  v6.f64[1] = v10;
  v7.f64[0] = v9;
  v7.f64[1] = v8;
  *(float32x4_t *)self->_topColorVector = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v7);
  -[ARUIRing _updatePremultipliedTopColor](self, "_updatePremultipliedTopColor");
}

- (void)_updatePremultipliedTopColor
{
  *(float32x4_t *)self->_topColorPremultipliedVector = vmulq_n_f32(*(float32x4_t *)self->_topColorVector, self->_opacity);
}

- (ARUIRing)init
{
  ARUIRing *result;
  float v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARUIRing;
  result = -[ARUIRing init](&v4, sel_init);
  if (result)
  {
    result->_percentage = 0.0;
    v3 = *(float *)&ARUIRingEmptyOpacityValueDefault;
    LODWORD(result->_opacity) = ARUIRingOpacityValueDefault;
    result->_emptyOpacity = v3;
    LODWORD(result->_trackOpacity) = ARUIRingTrackOpacityValueDefault;
    *(_QWORD *)&result->_scale = 1065353216;
    *(_QWORD *)result->_translation = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ARUIRing initWithRing:](+[ARUIRing allocWithZone:](ARUIRing, "allocWithZone:", a3), "initWithRing:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_celebration, 0);
  objc_storeStrong((id *)&self->_bottomColor, 0);
  objc_storeStrong((id *)&self->_topColor, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  UIColor *topColor;
  uint64_t v8;
  id v9;
  id v10;
  UIColor *bottomColor;
  id v12;
  id v13;
  float diameter;
  id v15;
  double v16;
  id v17;
  float thickness;
  id v19;
  double v20;
  id v21;
  float percentage;
  id v23;
  double v24;
  id v25;
  float opacity;
  id v27;
  double v28;
  id v29;
  float emptyOpacity;
  id v31;
  double v32;
  id v33;
  float trackOpacity;
  id v35;
  double v36;
  id v37;
  float scale;
  id v39;
  double v40;
  id v41;
  float zRotation;
  id v43;
  double v44;
  id v45;
  id v46;
  id v47;
  int v48;
  id v49;
  double v50;
  id v51;
  ARUICelebration *celebration;
  id v53;
  id v54;
  char v55;
  double v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    topColor = self->_topColor;
    v8 = MEMORY[0x24BDAC760];
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __20__ARUIRing_isEqual___block_invoke;
    v82[3] = &unk_24CEC6178;
    v9 = v5;
    v83 = v9;
    v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", topColor, v82);
    bottomColor = self->_bottomColor;
    v80[0] = v8;
    v80[1] = 3221225472;
    v80[2] = __20__ARUIRing_isEqual___block_invoke_2;
    v80[3] = &unk_24CEC6178;
    v12 = v9;
    v81 = v12;
    v13 = (id)objc_msgSend(v6, "appendObject:counterpart:", bottomColor, v80);
    diameter = self->_diameter;
    v78[0] = v8;
    v78[1] = 3221225472;
    v78[2] = __20__ARUIRing_isEqual___block_invoke_3;
    v78[3] = &unk_24CEC61A0;
    v15 = v12;
    v79 = v15;
    *(float *)&v16 = diameter;
    v17 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v78, v16);
    thickness = self->_thickness;
    v76[0] = v8;
    v76[1] = 3221225472;
    v76[2] = __20__ARUIRing_isEqual___block_invoke_4;
    v76[3] = &unk_24CEC61A0;
    v19 = v15;
    v77 = v19;
    *(float *)&v20 = thickness;
    v21 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v76, v20);
    percentage = self->_percentage;
    v74[0] = v8;
    v74[1] = 3221225472;
    v74[2] = __20__ARUIRing_isEqual___block_invoke_5;
    v74[3] = &unk_24CEC61A0;
    v23 = v19;
    v75 = v23;
    *(float *)&v24 = percentage;
    v25 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v74, v24);
    opacity = self->_opacity;
    v72[0] = v8;
    v72[1] = 3221225472;
    v72[2] = __20__ARUIRing_isEqual___block_invoke_6;
    v72[3] = &unk_24CEC61A0;
    v27 = v23;
    v73 = v27;
    *(float *)&v28 = opacity;
    v29 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v72, v28);
    emptyOpacity = self->_emptyOpacity;
    v70[0] = v8;
    v70[1] = 3221225472;
    v70[2] = __20__ARUIRing_isEqual___block_invoke_7;
    v70[3] = &unk_24CEC61A0;
    v31 = v27;
    v71 = v31;
    *(float *)&v32 = emptyOpacity;
    v33 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v70, v32);
    trackOpacity = self->_trackOpacity;
    v68[0] = v8;
    v68[1] = 3221225472;
    v68[2] = __20__ARUIRing_isEqual___block_invoke_8;
    v68[3] = &unk_24CEC61A0;
    v35 = v31;
    v69 = v35;
    *(float *)&v36 = trackOpacity;
    v37 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v68, v36);
    scale = self->_scale;
    v66[0] = v8;
    v66[1] = 3221225472;
    v66[2] = __20__ARUIRing_isEqual___block_invoke_9;
    v66[3] = &unk_24CEC61A0;
    v39 = v35;
    v67 = v39;
    *(float *)&v40 = scale;
    v41 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v66, v40);
    zRotation = self->_zRotation;
    v64[0] = v8;
    v64[1] = 3221225472;
    v64[2] = __20__ARUIRing_isEqual___block_invoke_10;
    v64[3] = &unk_24CEC61A0;
    v43 = v39;
    v65 = v43;
    *(float *)&v44 = zRotation;
    v45 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v64, v44);
    v57 = *(double *)self->_translation;
    v62[0] = v8;
    v62[1] = 3221225472;
    v62[2] = __20__ARUIRing_isEqual___block_invoke_11;
    v62[3] = &unk_24CEC61A0;
    v46 = v43;
    v63 = v46;
    v47 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v62, v57);
    v48 = *(_DWORD *)&self->_translation[4];
    v60[0] = v8;
    v60[1] = 3221225472;
    v60[2] = __20__ARUIRing_isEqual___block_invoke_12;
    v60[3] = &unk_24CEC61A0;
    v49 = v46;
    v61 = v49;
    LODWORD(v50) = v48;
    v51 = (id)objc_msgSend(v6, "appendFloat:counterpart:", v60, v50);
    celebration = self->_celebration;
    v58[0] = v8;
    v58[1] = 3221225472;
    v58[2] = __20__ARUIRing_isEqual___block_invoke_13;
    v58[3] = &unk_24CEC6178;
    v59 = v49;
    v53 = v49;
    v54 = (id)objc_msgSend(v6, "appendObject:counterpart:", celebration, v58);
    v55 = objc_msgSend(v6, "isEqual");

  }
  else
  {
    v55 = 0;
  }

  return v55;
}

id __20__ARUIRing_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

id __20__ARUIRing_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

float __20__ARUIRing_isEqual___block_invoke_3(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 8);
}

float __20__ARUIRing_isEqual___block_invoke_4(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 12);
}

float __20__ARUIRing_isEqual___block_invoke_5(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 16);
}

float __20__ARUIRing_isEqual___block_invoke_6(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 20);
}

float __20__ARUIRing_isEqual___block_invoke_7(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 24);
}

float __20__ARUIRing_isEqual___block_invoke_8(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 28);
}

float __20__ARUIRing_isEqual___block_invoke_9(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 32);
}

float __20__ARUIRing_isEqual___block_invoke_10(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 36);
}

double __20__ARUIRing_isEqual___block_invoke_11(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 56);
}

float __20__ARUIRing_isEqual___block_invoke_12(uint64_t a1)
{
  return *(float *)(*(_QWORD *)(a1 + 32) + 60);
}

id __20__ARUIRing_isEqual___block_invoke_13(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("percentage"), self->_percentage);
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("diameter"), self->_diameter);
  v6 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("thickness"), self->_thickness);
  v7 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("opacity"), self->_opacity);
  v8 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("scale"), self->_scale);
  v9 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("translation.x"), COERCE_FLOAT(*(_QWORD *)self->_translation));
  v10 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("translation.y"), *(float *)&self->_translation[4]);
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)randomRing
{
  ARUIRing *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v2 = objc_alloc_init(ARUIRing);
  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = ARUIRandomFloat(0.0, 1.0);
  v5 = ARUIRandomFloat(0.0, 1.0);
  v6 = ARUIRandomFloat(0.0, 1.0);
  objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v5, v6, ARUIRandomFloat(0.0, 1.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRing setTopColor:](v2, "setTopColor:", v7);

  v8 = (void *)MEMORY[0x24BEBD4B8];
  v9 = ARUIRandomFloat(0.0, 1.0);
  v10 = ARUIRandomFloat(0.0, 1.0);
  v11 = ARUIRandomFloat(0.0, 1.0);
  objc_msgSend(v8, "colorWithRed:green:blue:alpha:", v9, v10, v11, ARUIRandomFloat(0.0, 1.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRing setBottomColor:](v2, "setBottomColor:", v12);

  *(float *)&v13 = ARUIRandomFloat(0.0, 1000.0);
  -[ARUIRing setDiameter:](v2, "setDiameter:", v13);
  *(float *)&v14 = ARUIRandomFloat(0.0, 1000.0);
  -[ARUIRing setThickness:](v2, "setThickness:", v14);
  *(float *)&v15 = ARUIRandomFloat(0.0, 1000.0);
  -[ARUIRing setPercentage:](v2, "setPercentage:", v15);
  *(float *)&v16 = ARUIRandomFloat(0.0, 1.0);
  -[ARUIRing setOpacity:](v2, "setOpacity:", v16);
  *(float *)&v17 = ARUIRandomFloat(0.0, 1.0);
  -[ARUIRing setEmptyOpacity:](v2, "setEmptyOpacity:", v17);
  *(float *)&v18 = ARUIRandomFloat(0.0, 1.0);
  -[ARUIRing setTrackOpacity:](v2, "setTrackOpacity:", v18);
  *(float *)&v19 = ARUIRandomFloat(0.1, 10.0);
  -[ARUIRing setScale:](v2, "setScale:", v19);
  *(float *)&v20 = ARUIRandomFloat(0.0, 6.2832);
  -[ARUIRing setZRotation:](v2, "setZRotation:", v20);
  LODWORD(v21) = 0;
  -[ARUIRing setTranslation:](v2, "setTranslation:", COERCE_DOUBLE(ARUIRandomFloat2(v21, 1000.0)));
  return v2;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

- (void)setZRotation:(float)a3
{
  self->_zRotation = a3;
}

- (void)setTranslation:(ARUIRing *)self
{
  uint64_t v2;

  *(_QWORD *)self->_translation = v2;
}

- (void)setCelebration:(id)a3
{
  objc_storeStrong((id *)&self->_celebration, a3);
}

@end
