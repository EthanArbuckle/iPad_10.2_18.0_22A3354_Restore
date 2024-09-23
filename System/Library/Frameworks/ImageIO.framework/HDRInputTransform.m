@implementation HDRInputTransform

- (void)dealloc
{
  $95C101B3B476D08CB38C8A252F25CE83 *p_t;
  void *v4;
  void *v5;
  objc_super v6;

  p_t = &self->t;
  v4 = *(void **)&self[5].t.image.pixel.var0;
  if (v4)

  v5 = *(void **)&p_t[14].image.pixel.var0;
  if (v5)

  v6.receiver = self;
  v6.super_class = (Class)HDRInputTransform;
  -[HDRInputTransform dealloc](&v6, sel_dealloc);
}

- ($AC718E4E1D1D761EFCA992956E534F39)storage
{
  return ($AC718E4E1D1D761EFCA992956E534F39 *)&self->t;
}

- (unsigned)flags
{
  return self->t.flags;
}

- (const)image
{
  return (const $C8D1ACB0DEE3B0D7530FADC997030A81 *)&self->t.image.pixel.var2;
}

- (const)gainMap
{
  return (const $7F5F757F935EFDA1B622558C1678222D *)self[11]._anon_8;
}

- (id)description
{
  $95C101B3B476D08CB38C8A252F25CE83 *p_t;
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  $79C168461E1A180C7FA664BD10925E28 image;
  void *v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  $79C168461E1A180C7FA664BD10925E28 v18;
  __int128 v19;
  void *v20;
  $79C168461E1A180C7FA664BD10925E28 v21;
  __int128 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  $79C168461E1A180C7FA664BD10925E28 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _OWORD v42[4];
  _OWORD v43[7];
  _OWORD v44[8];
  _OWORD v45[4];
  _OWORD v46[9];
  _OWORD v47[4];
  _OWORD v48[5];
  _OWORD v49[8];

  p_t = &self->t;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDRInputTransform{hasGainMap:%d,baseIsSDR:%d}"), self->t.flags & 1, (self->t.flags >> 1) & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(_OWORD *)&p_t[4].image.pixel.var2;
  v49[4] = *(_OWORD *)&p_t[4].flags;
  v49[5] = v5;
  v6 = *(_OWORD *)&p_t[6].image.pixel.var0;
  v49[6] = *(_OWORD *)&p_t[5].image.pixel.var1;
  v49[7] = v6;
  v7 = *(_OWORD *)&p_t[1].image.pixel.var1;
  v49[0] = *(_OWORD *)&p_t->image.pixel.var2;
  v49[1] = v7;
  image = p_t[3].image;
  v49[2] = *(_OWORD *)&p_t[2].image.pixel.var0;
  v49[3] = image;
  HDRPixelTransformInDescription((uint64_t)v49);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&p_t[9].image.pixel.var1;
  v48[2] = *(_OWORD *)&p_t[8].image.pixel.var2;
  v48[3] = v10;
  v48[4] = *(_OWORD *)&p_t[10].image.pixel.var0;
  v11 = *(_OWORD *)&p_t[8].flags;
  v48[0] = p_t[7].image;
  v48[1] = v11;
  HDRColorTRCToString((uint64_t)v48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&p_t[16].flags;
  v47[0] = p_t[15].image;
  v47[1] = v13;
  v14 = *(_OWORD *)&p_t[17].image.pixel.var1;
  v47[2] = *(_OWORD *)&p_t[16].image.pixel.var2;
  v47[3] = v14;
  HDRColorMatrixToString((uint64_t)v47);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&p_t[16].image.pixel.var2;
  v46[6] = *(_OWORD *)&p_t[16].flags;
  v46[7] = v16;
  v46[8] = *(_OWORD *)&p_t[17].image.pixel.var1;
  v17 = *(_OWORD *)&p_t[13].image.pixel.var1;
  v46[2] = *(_OWORD *)&p_t[12].image.pixel.var2;
  v46[3] = v17;
  v18 = p_t[15].image;
  v46[4] = *(_OWORD *)&p_t[14].image.pixel.var0;
  v46[5] = v18;
  v19 = *(_OWORD *)&p_t[12].flags;
  v46[0] = p_t[11].image;
  v46[1] = v19;
  HDRToneMappingToString((float *)v46);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = p_t[19].image;
  v45[0] = *(_OWORD *)&p_t[18].image.pixel.var0;
  v45[1] = v21;
  v22 = *(_OWORD *)&p_t[20].image.pixel.var2;
  v45[2] = *(_OWORD *)&p_t[20].flags;
  v45[3] = v22;
  HDRColorMatrixToString((uint64_t)v45);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\nImage Steps:\n\t  IN: %@\n\t TRC: %@\n\tTMAT: %@\n\t  TM: %@\n\t MAT: %@"), v9, v12, v15, v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if ((p_t->flags & 1) != 0)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = *(_OWORD *)&p_t[25].image.pixel.var1;
    v44[4] = *(_OWORD *)&p_t[24].image.pixel.var2;
    v44[5] = v27;
    v28 = p_t[27].image;
    v44[6] = *(_OWORD *)&p_t[26].image.pixel.var0;
    v44[7] = v28;
    v29 = *(_OWORD *)&p_t[22].image.pixel.var0;
    v44[0] = *(_OWORD *)&p_t[21].image.pixel.var1;
    v44[1] = v29;
    v30 = *(_OWORD *)&p_t[24].flags;
    v44[2] = p_t[23].image;
    v44[3] = v30;
    HDRPixelTransformInDescription((uint64_t)v44);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_OWORD *)&p_t[32].flags;
    v43[4] = p_t[31].image;
    v43[5] = v32;
    v43[6] = *(_OWORD *)&p_t[32].image.pixel.var2;
    v33 = *(_OWORD *)&p_t[28].image.pixel.var2;
    v43[0] = *(_OWORD *)&p_t[28].flags;
    v43[1] = v33;
    v34 = *(_OWORD *)&p_t[30].image.pixel.var0;
    v43[2] = *(_OWORD *)&p_t[29].image.pixel.var1;
    v43[3] = v34;
    HDRGainMappingToString((float *)v43);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *(_OWORD *)&p_t[34].image.pixel.var0;
    v42[0] = *(_OWORD *)&p_t[33].image.pixel.var1;
    v42[1] = v36;
    v37 = *(_OWORD *)&p_t[36].flags;
    v42[2] = p_t[35].image;
    v42[3] = v37;
    HDRColorMatrixToString((uint64_t)v42);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("\nGainMap Steps:\n\t  IN: %@\n\tGAIN: %@\n\t MAT: %@\n"), v31, v35, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "stringByAppendingString:", v39);
    v40 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v40;
  }

  return v25;
}

@end
