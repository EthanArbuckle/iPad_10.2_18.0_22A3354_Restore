@implementation HDROutputTransform

- (void)dealloc
{
  $F56087E1EC9CA0C83D57CA106C415237 *p_t;
  Class isa;
  void *v5;
  objc_super v6;

  p_t = &self->t;
  isa = self[2].super.super.isa;
  if (isa)

  v5 = *(void **)&p_t[1].image.color.rgb.identity;
  if (v5)

  v6.receiver = self;
  v6.super_class = (Class)HDROutputTransform;
  -[HDROutputTransform dealloc](&v6, sel_dealloc);
}

- ($B776AB1D653B08CFC4C797E54316E8EA)storage
{
  return ($B776AB1D653B08CFC4C797E54316E8EA *)&self->t;
}

- (unsigned)flags
{
  return self->t.flags;
}

- (const)image
{
  return (const $952D62A909593DCC84CDA4A025E8BB3E *)&self->t.image.color.tm;
}

- (const)gainMap
{
  return (const $011FDAD128C43BF22EC5593579CBEDC4 *)&self[2].t.image.color.trc.lut;
}

- (id)description
{
  $F56087E1EC9CA0C83D57CA106C415237 *p_t;
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  simd_float3 v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  int b_low;
  __CFString *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  __int128 v33;
  simd_float3 v34;
  __int128 v35;
  void *v36;
  void *v37;
  uint64_t v38;
  simd_float3x3 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[7];
  _OWORD v46[4];
  simd_float3x3 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[5];
  _OWORD v53[9];
  _OWORD v54[5];

  p_t = &self->t;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDRInputTransform{hasGainMap:%d,baseIsSDR:%d}"), self->t.flags & 1, (self->t.flags >> 1) & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(_OWORD *)&p_t->image.color.tm.params.d;
  v54[0] = *(_OWORD *)&p_t->image.color.tm.type;
  v54[1] = v5;
  v6 = *(_OWORD *)&p_t->image.color.tm.mat.identity;
  v54[2] = *(_OWORD *)&p_t->image.color.tm.params.gamma;
  v54[3] = v6;
  HDRColorMatrixToString((uint64_t)v54);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&p_t[1].image.color.tm.lut;
  v53[6] = *(_OWORD *)&p_t[1].image.color.tm.params.f;
  v53[7] = v8;
  v53[8] = *(_OWORD *)&p_t[1].image.color.trc.type;
  v9 = *(_OWORD *)&p_t->image.pixel.var1;
  v53[2] = *(_OWORD *)&p_t->image.color.trc.lut;
  v53[3] = v9;
  v10 = *(_OWORD *)&p_t[1].image.color.tm.params.b;
  v53[4] = *(_OWORD *)&p_t[1].image.color.rgb.identity;
  v53[5] = v10;
  v11 = *(_OWORD *)&p_t->image.color.trc.params.f;
  v53[0] = *(_OWORD *)&p_t->image.color.trc.params.b;
  v53[1] = v11;
  HDRToneMappingToString((float *)v53);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&p_t[2].flags;
  v52[2] = p_t[1].image.pixel;
  v52[3] = v13;
  v52[4] = *(_OWORD *)&p_t[2].image.color.tm.type;
  v14 = *(_OWORD *)&p_t[1].image.color.trc.params.gamma;
  v52[0] = *(_OWORD *)&p_t[1].image.color.trc.params.d;
  v52[1] = v14;
  HDRColorTRCToString((uint64_t)v52);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&p_t[2].image.color.trc.lut;
  v49 = *(_OWORD *)&p_t[2].image.color.trc.params.f;
  v50 = v16;
  v51 = *(_OWORD *)&p_t[2].image.pixel.var1;
  v17 = *(simd_float3 *)&p_t[2].image.color.tm.params.gamma;
  v47.columns[0] = *(simd_float3 *)&p_t[2].image.color.tm.params.d;
  v47.columns[1] = v17;
  v18 = *(_OWORD *)&p_t[2].image.color.trc.params.b;
  v47.columns[2] = *(simd_float3 *)&p_t[2].image.color.tm.mat.identity;
  v48 = v18;
  HDRPixelTransformOutDescription(&v47);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\nImage Steps:\n\t MAT: %@\n\t  TM: %@\n\t TRC: %@\n\t OUT: %@"), v7, v12, v15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((p_t->flags & 1) != 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = *(_OWORD *)&p_t[4].flags;
    v46[0] = p_t[3].image.pixel;
    v46[1] = v23;
    v24 = *(_OWORD *)&p_t[4].image.color.tm.params.d;
    v46[2] = *(_OWORD *)&p_t[4].image.color.tm.type;
    v46[3] = v24;
    HDRColorMatrixToString((uint64_t)v46);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    b_low = LOBYTE(p_t[4].image.color.trc.params.b);
    if (LOBYTE(p_t[4].image.color.trc.params.b))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[r=%g,g=%g,b=%g,max=%g]"), *(float *)&p_t[4].image.color.tm.mat.identity, *((float *)&p_t[4].image.color.tm.mat + 1), *(float *)&p_t[4].image.color.trc.type, p_t[4].image.color.trc.params.a);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = CFSTR("n/a");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[x=%g, y=%g]"), COERCE_FLOAT(*(_QWORD *)&p_t[4].image.color.tm.params.gamma), COERCE_FLOAT(HIDWORD(*(_QWORD *)&p_t[4].image.color.tm.params.gamma)));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_OWORD *)&p_t[3].image.color.trc.params.d;
    v45[4] = *(_OWORD *)&p_t[3].image.color.trc.type;
    v45[5] = v29;
    v45[6] = *(_OWORD *)&p_t[3].image.color.trc.params.gamma;
    v30 = *(_OWORD *)&p_t[3].image.color.tm.params.b;
    v45[0] = *(_OWORD *)&p_t[3].image.color.rgb.identity;
    v45[1] = v30;
    v31 = *(_OWORD *)&p_t[3].image.color.tm.lut;
    v45[2] = *(_OWORD *)&p_t[3].image.color.tm.params.f;
    v45[3] = v31;
    HDRGainMappingToString((float *)v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(_OWORD *)&p_t[5].image.color.tm.params.f;
    v42 = *(_OWORD *)&p_t[5].image.color.tm.params.b;
    v43 = v33;
    v44 = *(_OWORD *)&p_t[5].image.color.tm.lut;
    v34 = *(simd_float3 *)&p_t[4].image.color.trc.lut;
    v40.columns[0] = *(simd_float3 *)&p_t[4].image.color.trc.params.f;
    v40.columns[1] = v34;
    v35 = *(_OWORD *)&p_t[5].image.color.rgb.identity;
    v40.columns[2] = *(simd_float3 *)&p_t[4].image.pixel.var1;
    v41 = v35;
    HDRPixelTransformOutDescription(&v40);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("\nGainMap Steps:\n\t MAT: %@\n\tLUMA: %@\n\tCLIP: %@\n\tGAIN: %@\n\t OUT: %@\n"), v25, v27, v28, v32, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (b_low)
    objc_msgSend(v21, "stringByAppendingString:", v37);
    v38 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v38;
  }

  return v21;
}

@end
