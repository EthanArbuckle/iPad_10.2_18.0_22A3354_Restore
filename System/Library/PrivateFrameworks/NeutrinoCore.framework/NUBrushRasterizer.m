@implementation NUBrushRasterizer

+ (int64_t)_rasterizeBrushStroke:(id)a3 toROI:(id *)a4 maskPtr:(char *)a5 maskPtrRowBytes:(int64_t)a6 close:(BOOL)a7 startIndex:(int64_t)a8 pressureMode:(int64_t)a9
{
  _BOOL4 v10;
  id v13;
  uint64_t v14;
  id v15;
  float *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  int64_t v21;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _QWORD *v23;
  float v24;
  float v25;
  int64_t v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  int v31;
  float v32;
  float *v33;
  float v34;
  float v35;
  float v36;
  unint64_t v37;
  float v38;
  unint64_t v39;
  uint64_t v40;
  int64_t v41;
  float v42;
  float v43;
  unint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  int v53;
  float v54;
  float v55;
  float v56;
  __int128 v57;
  $0AC6E346AE4835514AAA8AC86D8F4844 v58;
  $0AC6E346AE4835514AAA8AC86D8F4844 v59;
  int64_t v60;
  id v62;
  float *v63;
  float v64;
  id v65;
  float v66;
  float v68;
  float v69;
  _QWORD v70[2];
  void (*v71)(uint64_t, float32x2_t *);
  void *v72;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v74;
  int64_t v75;
  char *v76;
  float v77;
  char v78[16];
  uint64_t v79;
  uint64_t v80;
  _OWORD v81[2];
  __int128 v82;
  int64x2_t v83;

  v10 = a7;
  v13 = a3;
  v14 = objc_msgSend(v13, "pointCount");
  if (!v14)
  {
    v60 = 0;
    goto LABEL_48;
  }
  objc_msgSend(v13, "points");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (float *)objc_msgSend(v15, "bytes");
  objc_msgSend(v13, "radius");
  v69 = v17;
  v62 = v13;
  objc_msgSend(v13, "softness");
  v19 = v18;
  v63 = &v16[3 * v14];
  v70[0] = MEMORY[0x1E0C809B0];
  v20 = floorf(v69 + 0.5);
  if (a8 >= 0)
    v21 = a8 + 1;
  else
    v21 = 0;
  v70[1] = 3221225472;
  v71 = __103__NUBrushRasterizer__rasterizeBrushStroke_toROI_maskPtr_maskPtrRowBytes_close_startIndex_pressureMode___block_invoke;
  v72 = &__block_descriptor_84_e27_v16__0r__BrushStamp_fffff_8l;
  var1 = a4->var1;
  var0 = a4->var0;
  v74 = var1;
  v75 = a6;
  v76 = a5;
  v77 = v20;
  v23 = v70;
  v24 = v20;
  v25 = 0.5;
  v65 = v23;
  v26 = 0;
  v27 = (uint64_t)&v16[3 * v14 - 3];
  v28 = v16[1];
  v29 = v16[2];
  v30 = *v16;
  v64 = v19;
  v66 = (float)(v19 * 0.8) + 0.2;
  v31 = !v10;
  v32 = 1.0;
  v33 = v16;
  do
  {
    v34 = *v33;
    v35 = v33[1];
    v36 = v33[2];
    if (v33 == v16)
    {
      v39 = 1;
    }
    else
    {
      v37 = (unint64_t)vabds_f32(v30, v34);
      v38 = vabds_f32(v28, v35);
      if (v37 <= (unint64_t)v38)
        v39 = (unint64_t)v38;
      else
        v39 = v37;
      if (v39 <= 1)
        v40 = 1;
      else
        v40 = v39;
      if (v33 == (float *)v27)
      {
        v39 = v40;
      }
      else if (!v39)
      {
        v41 = v26;
        v42 = v30;
        v43 = v28;
        goto LABEL_45;
      }
    }
    v44 = 0;
    v45 = (float)v39;
    v46 = -(float)(v29 - v36);
    v68 = v33[1];
    do
    {
      v47 = (float)((float)v44 + v32) / v45;
      v48 = v29 + (float)(v46 * v47);
      if (v33 == v16)
        v48 = v36;
      v49 = floorf(v25 + (float)(v69 * v48));
      if (a9 == 1)
        v50 = v49;
      else
        v50 = v24;
      v51 = v30 - (float)((float)(v30 - v34) * v47);
      if (v33 == v16)
        v51 = v34;
      v52 = v28 - (float)((float)(v28 - v35) * v47);
      if (v33 == v16)
        v52 = v35;
      v42 = floorf(v51 + v25);
      v43 = floorf(v52 + v25);
      if (v33 == v16
        || (v39 - 1 != v44 ? (v53 = 1) : (v53 = v31),
            v33 == (float *)v27 && !v53
         || (v54 = fmaxf(v66 * (float)(v50 * 0.25), v32),
             (float)((float)((float)(v43 - v28) * (float)(v43 - v28)) + (float)((float)(v42 - v30) * (float)(v42 - v30))) >= (float)(v54 * v54))))
      {
        v41 = v26 + 1;
        if (a9 == 2)
          v55 = v48;
        else
          v55 = v32;
        if (v26 >= v21)
        {
          v56 = v24;
          *(_QWORD *)&v57 = (uint64_t)(float)(v42 - v50);
          *((_QWORD *)&v57 + 1) = (uint64_t)(float)(v43 - v50);
          v58 = a4->var0;
          v59 = a4->var1;
          v82 = v57;
          v83 = vdupq_n_s64((uint64_t)(float)((float)(v50 + v50) + v32));
          v81[0] = v58;
          v81[1] = v59;
          NU::RectT<long>::Intersection((uint64_t)v78, (uint64_t *)&v82, (uint64_t *)v81);
          if (v79 && v80)
          {
            *(_QWORD *)&v82 = __PAIR64__(LODWORD(v43), LODWORD(v42));
            *((_QWORD *)&v82 + 1) = __PAIR64__(LODWORD(v64), LODWORD(v50));
            *(float *)v83.i32 = v55;
            v71((uint64_t)v65, (float32x2_t *)&v82);
          }
          v25 = 0.5;
          v24 = v56;
          v32 = 1.0;
          v35 = v68;
          v46 = -(float)(v29 - v36);
          v45 = (float)v39;
        }
      }
      else
      {
        v41 = v26;
        v42 = v30;
        v43 = v28;
      }
      ++v44;
      v26 = v41;
      v28 = v43;
      v30 = v42;
    }
    while (v39 != v44);
LABEL_45:
    v33 += 3;
    v26 = v41;
    v29 = v36;
    v28 = v43;
    v30 = v42;
  }
  while (v33 != v63);

  v60 = v41 - 1;
  v13 = v62;
LABEL_48:

  return v60;
}

+ (int64_t)rasterizeBrushStroke:(id)a3 atPoint:(id)a4 toBuffer:(id)a5 close:(BOOL)a6 startIndex:(int64_t)a7
{
  _BOOL8 v8;
  int64_t var1;
  int64_t var0;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  _QWORD v19[4];

  v8 = a6;
  var1 = a4.var1;
  var0 = a4.var0;
  v13 = a3;
  v14 = a5;
  v15 = objc_msgSend(v14, "size");
  objc_msgSend(v14, "size");
  v19[0] = var0;
  v19[1] = var1;
  v19[2] = v15;
  v19[3] = v16;
  v17 = objc_msgSend(a1, "_rasterizeBrushStroke:toROI:maskPtr:maskPtrRowBytes:close:startIndex:pressureMode:", v13, v19, objc_msgSend(v14, "mutableBytes"), objc_msgSend(v14, "rowBytes"), v8, a7, objc_msgSend(v13, "pressureMode"));

  return v17;
}

+ (void)rasterizeBrushStroke:(id)a3 atPoint:(id)a4 toBuffer:(id)a5
{
  objc_msgSend(a1, "rasterizeBrushStroke:atPoint:toBuffer:close:startIndex:", a3, a4.var0, a4.var1, a5, 1, -1);
}

void __103__NUBrushRasterizer__rasterizeBrushStroke_toROI_maskPtr_maskPtrRowBytes_close_startIndex_pressureMode___block_invoke(uint64_t a1, float32x2_t *a2)
{
  int64_t v4;
  unint64_t v5;
  int64x2_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  __int32 v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  __int128 v38;
  __int128 v39;
  int64x2_t v40;
  _QWORD v41[5];
  int64x2_t v42;
  unint64_t v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  float32x2_t *v49;
  _QWORD v50[4];
  __int128 block;
  __int128 v52;
  int64x2_t *v53;
  uint64_t v54;
  __int32 v55;
  int64x2_t v56;
  int64x2_t v57;
  void (*v58)(uint64_t);
  id v59;
  __int128 v60;
  __int128 v61;

  v4 = (uint64_t)rintf(floorf(a2[1].f32[0] + 0.5));
  v5 = (2 * v4) | 1;
  v6 = vsubq_s64(vcvtq_s64_f64(vcvtq_f64_f32(*a2)), vdupq_n_s64(v4));
  v7 = *(_OWORD *)(a1 + 48);
  block = *(_OWORD *)(a1 + 32);
  v52 = v7;
  v40 = v6;
  v56 = v6;
  v57 = vdupq_n_s64(v5);
  NU::RectT<long>::Intersection((uint64_t)&v60, (uint64_t *)&block, v56.i64);
  v8 = v61;
  v10 = *((_QWORD *)&v61 + 1);
  v9 = v61;
  if (v4 >= 1 && (_QWORD)v61 != 0 && *((_QWORD *)&v61 + 1) != 0)
  {
    v13 = v60;
    v14 = *(_QWORD *)(a1 + 64);
    v15 = *((_QWORD *)&v60 + 1);
    v16 = v60;
    v17 = *(_QWORD *)(a1 + 72)
        + v60
        + (*(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 40) - (*((_QWORD *)&v61 + 1) + *((_QWORD *)&v60 + 1))) * v14
        - *(_QWORD *)(a1 + 32);
    *(_QWORD *)&v60 = 0;
    *((_QWORD *)&v60 + 1) = &v60;
    *(_QWORD *)&v61 = 0x2020000000;
    BYTE8(v61) = 0;
    v18 = a2[1].f32[0];
    if (v18 == *(float *)(a1 + 80))
    {
      v38 = v13;
      v39 = v8;
      v19 = a2[1].i32[1];
      v56.i64[0] = 0;
      v56.i64[1] = (uint64_t)&v56;
      v57.i64[0] = 0x3032000000;
      v57.i64[1] = (uint64_t)__Block_byref_object_copy__1496;
      v58 = __Block_byref_object_dispose__1497;
      v59 = 0;
      *(_QWORD *)&block = MEMORY[0x1E0C809B0];
      *((_QWORD *)&block + 1) = 3221225472;
      *(_QWORD *)&v52 = ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke_9;
      *((_QWORD *)&v52 + 1) = &unk_1E5060B28;
      v55 = v19;
      v53 = &v56;
      v54 = (2 * v4) | 1;
      v20 = *(id *)(v56.i64[1] + 40);
      _Block_object_dispose(&v56, 8);

      v50[0] = 0;
      v50[1] = 0;
      v50[2] = objc_msgSend(v20, "size");
      v50[3] = v21;
      +[NURegion regionWithRect:](NURegion, "regionWithRect:", v50);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __103__NUBrushRasterizer__rasterizeBrushStroke_toROI_maskPtr_maskPtrRowBytes_close_startIndex_pressureMode___block_invoke_2;
      v41[3] = &unk_1E5060AA0;
      v42 = v40;
      v43 = v5;
      v44 = v5;
      v45 = v38;
      v46 = v39;
      v23 = *(_QWORD *)(a1 + 64);
      v47 = v17;
      v48 = v23;
      v49 = a2;
      v41[4] = &v60;
      objc_msgSend(v20, "readBufferRegion:withBlock:", v22, v41);

      if (*(_BYTE *)(*((_QWORD *)&v60 + 1) + 24))
        goto LABEL_28;
      v18 = a2[1].f32[0];
      v14 = *(_QWORD *)(a1 + 64);
    }
    if (v18 > 1.0)
    {
      v24 = a2->f32[0] + 0.5;
      v25 = a2->f32[1] + 0.5;
      v27 = a2[1].f32[1];
      v26 = a2[2].f32[0];
      if ((float)(2.0 / (float)(v18 + v18)) > v27)
        v27 = 2.0 / (float)(v18 + v18);
      v28 = v18 * (float)(1.0 - v27);
      v29 = (float)v15 + 0.5;
      do
      {
        v30 = 0;
        v31 = (float)v16 + 0.5;
        do
        {
          v32 = sqrtf((float)((float)(v29 - v25) * (float)(v29 - v25)) + (float)((float)(v31 - v24) * (float)(v31 - v24)));
          if (v32 <= v18)
          {
            v33 = 1.0;
            if (v32 <= v28
              || (v34 = (float)(v32 - v28) / (float)(v18 - v28),
                  v32 = v34 * (float)((float)(v34 * -2.0) + 3.0),
                  v33 = 1.0 - (float)(v34 * v32),
                  v33 > 0.0))
            {
              LOBYTE(v32) = *(_BYTE *)(v17 + v30);
              v35 = (float)LODWORD(v32) / 255.0;
              v36 = 1.0 - (float)((float)(1.0 - v33) * (float)(1.0 - v35));
              v37 = v35 + (float)(v33 * (float)(v26 - v35));
              if (v35 >= v26)
                v37 = v35;
              if (v26 == 1.0)
                v37 = v36;
              *(_BYTE *)(v17 + v30) = (int)(float)(v37 * 255.0);
            }
          }
          v31 = v31 + 1.0;
          ++v30;
        }
        while (v9 != v30);
        v17 += v14;
        v29 = v29 + 1.0;
        --v10;
      }
      while (v10);
    }
LABEL_28:
    _Block_object_dispose(&v60, 8);
  }
}

void __103__NUBrushRasterizer__rasterizeBrushStroke_toROI_maskPtr_maskPtrRowBytes_close_startIndex_pressureMode___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  signed int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rowBytes");
  v5 = objc_msgSend(v3, "bytes");
  v6 = a1[12];
  if (v6)
  {
    v7 = vcvts_n_s32_f32(*(float *)(a1[15] + 16), 8uLL);
    v8 = a1[11];
    v10 = a1[13];
    v9 = a1[14];
    v11 = v5 + a1[9] + (a1[8] + a1[6] - (v6 + a1[10])) * v4 - a1[5];
    do
    {
      if (v8)
      {
        for (i = 0; i != v8; ++i)
        {
          v13 = *(unsigned __int8 *)(v10 + i);
          if (v7 > v13)
            *(_BYTE *)(v10 + i) = v13 + ((unsigned __int16)((v7 - v13) * *(unsigned __int8 *)(v11 + i)) >> 8);
        }
      }
      v11 += v4;
      v10 += v9;
      --v6;
    }
    while (v6);
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;

}

@end
