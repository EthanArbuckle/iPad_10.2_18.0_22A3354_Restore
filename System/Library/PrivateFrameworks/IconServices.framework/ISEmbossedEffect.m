@implementation ISEmbossedEffect

- (ISEmbossedEffect)init
{
  ISEmbossedEffect *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISEmbossedEffect;
  result = -[ISEmbossedEffect init](&v3, sel_init);
  if (result)
    result->_variant = 0;
  return result;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t variant;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  void *v55;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C9DDB8];
  v8 = a4;
  objc_msgSend(v7, "filterWithName:", CFSTR("CIColorMatrix"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C9E1F8];
  v55 = v6;
  objc_msgSend(v9, "setValue:forKey:", v6, *MEMORY[0x1E0C9E1F8]);
  variant = self->_variant;
  if (variant > 3)
  {
    v14 = 0.02;
    v12 = 0.43;
    v13 = 0.2;
  }
  else
  {
    v12 = dbl_1AA9770D8[variant];
    v13 = dbl_1AA9770F8[variant];
    v14 = dbl_1AA977118[variant];
  }
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v14, v14, v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v15, CFSTR("inputRVector"));

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v13, v13, v13, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v16, CFSTR("inputGVector"));

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v12, v12, v12, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v17, CFSTR("inputBVector"));

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v18, CFSTR("inputAVector"));

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CUIInnerGlowOrShadowFilter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.0, -2.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v20, CFSTR("inputOffset"));

  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0C9E1C0];
  v54 = *MEMORY[0x1E0C9E1C0];
  objc_msgSend(v19, "setValue:forKey:", v21, *MEMORY[0x1E0C9E1C0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v23, CFSTR("inputRange"));

  LODWORD(v24) = 1074174045;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v25, CFSTR("inputRadius"));

  objc_msgSend(v19, "setValue:forKey:", v8, v10);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILinearBurnBlendMode"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "outputImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setValue:forKey:", v27, v10);

  objc_msgSend(v9, "outputImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0C9E190];
  objc_msgSend(v26, "setValue:forKey:", v28, *MEMORY[0x1E0C9E190]);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CUIInnerGlowOrShadowFilter"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = *MEMORY[0x1E0C9E258];
  objc_msgSend(v30, "setValue:forKey:", v31);

  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.07);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKey:", v32, v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKey:", v33, CFSTR("inputRange"));

  objc_msgSend(v30, "setValue:forKey:", v8, v10);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIOverlayBlendMode"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "outputImage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setValue:forKey:", v35, v10);

  objc_msgSend(v26, "outputImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setValue:forKey:", v36, v29);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceInCompositing"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "outputImage");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setValue:forKey:", v38, v10);

  objc_msgSend(v37, "setValue:forKey:", v8, v29);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "outputImage");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setValue:forKey:", v40, v10);

  objc_msgSend(v39, "setValue:forKey:", v55, v29);
  v41 = v39;

  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CUIOuterGlowOrShadowFilter"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setValue:forKey:", v44, v53);

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.0, -2.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setValue:forKey:", v45, CFSTR("inputOffset"));

  objc_msgSend(v43, "setValue:forKey:", v42, v54);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setValue:forKey:", v46, CFSTR("inputRange"));

  objc_msgSend(v43, "setValue:forKey:", v8, v10);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOutCompositing"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "outputImage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setValue:forKey:", v48, v10);

  objc_msgSend(v47, "setValue:forKey:", v8, v29);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILinearDodgeBlendMode"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "outputImage");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setValue:forKey:", v50, v10);

  objc_msgSend(v41, "outputImage");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "setValue:forKey:", v51, v29);
  return v49;
}

- (CGSize)offset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_offset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16, 1, 0);
}

- (double)range
{
  return self->_range;
}

- (void)setRange:(double)a3
{
  self->_range = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

@end
