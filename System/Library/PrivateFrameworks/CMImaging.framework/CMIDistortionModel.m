@implementation CMIDistortionModel

+ (int)getGDCParams:(id *)a3 cameraInfo:(id)a4 metadata:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  double v13;
  unsigned int v14;
  float v15;
  float v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t i;
  float *v33;
  float32x2_t v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  float v45;
  int v46;
  float v48;
  float v49;
  char v50;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  v50 = 0;
  if (!v7
    || !v8
    || (objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05928]),
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v46 = FigSignalErrorAt();
    goto LABEL_24;
  }
  v11 = (void *)v10;
  v12 = objc_msgSend(v9, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x1E0D06D20], 1, 0);
  if (!v12)
  {
    fig_log_get_emitter();
LABEL_32:
    FigDebugAssert3();
    v46 = FigSignalErrorAt();
    goto LABEL_33;
  }
  v14 = v12;
  LODWORD(v13) = 0;
  objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D05968], &v50, v13);
  if (!v50
    || (v16 = v15,
        objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D069D0]),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    && (objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CE0]),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_32;
  }
  LODWORD(v18) = 0;
  objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", CFSTR("X"), &v50, v18);
  if (!v50)
    goto LABEL_28;
  v20 = *(float *)&v19;
  LODWORD(v19) = 0;
  objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", CFSTR("Y"), &v50, v19);
  if (!v50
    || (v22 = *(float *)&v21,
        LODWORD(v21) = 0,
        objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06D40], &v50, v21),
        v49 = *(float *)&v23,
        !v50)
    || (LODWORD(v23) = 0,
        objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06D38], &v50, v23),
        !v50))
  {
LABEL_28:
    fig_log_get_emitter();
    FigDebugAssert3();
    v46 = FigSignalErrorAt();
LABEL_30:

LABEL_33:
    goto LABEL_24;
  }
  *(float *)&v25 = v20 / v49;
  *((float *)&v25 + 1) = v22 / v24;
  v48 = v24;
  *(float32x2_t *)&a3->var0 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v24), LODWORD(v49)), (float)(v16 * (float)v14) / 1000.0);
  *(_QWORD *)a3->var2 = v25;
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D065A8]);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D065B0]);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "length") != 64 || objc_msgSend(v27, "length") != 64)
    goto LABEL_29;
  v26 = objc_retainAutorelease(v26);
  v28 = objc_msgSend(v26, "bytes");
  v27 = objc_retainAutorelease(v27);
  v29 = objc_msgSend(v27, "bytes");
  LODWORD(v30) = 0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D069D8], &v50, v30);
  if (!v50)
  {
    LODWORD(v31) = 0;
    objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06D08], &v50, v31);
  }
  for (i = 0; i != 32; i += 4)
  {
    v33 = (float *)((char *)&a3->var0 + i);
    v33[6] = *(float *)(v28 + i) + (float)(*(float *)&v31 * *(float *)(v29 + i));
    v33[14] = *(float *)(v28 + 32 + i) + (float)(*(float *)&v31 * *(float *)(v29 + 32 + i));
  }
  v34 = vmul_f32(*(float32x2_t *)&a3->var0, *(float32x2_t *)&a3->var0);
  v34.f32[0] = sqrtf(vaddv_f32(v34)) * 0.5;
  a3->var2[2] = (float)(1.0
                      / (float)(v34.f32[0]
                              / (float)((float)((float)(a3->var2[4]
                                                      + (float)((float)(a3->var2[5]
                                                                      + (float)((float)(a3->var2[6]
                                                                                      + (float)((float)(a3->var2[7] + (float)((float)(a3->var3[0] + (float)((float)(a3->var3[1] + (float)((float)(a3->var3[2] + (float)(a3->var3[3] * (float)(v34.f32[0] * v34.f32[0]))) * (float)(v34.f32[0] * v34.f32[0]))) * (float)(v34.f32[0] * v34.f32[0]))) * (float)(v34.f32[0] * v34.f32[0])))
                                                                                              * (float)(v34.f32[0] * v34.f32[0])))
                                                                              * (float)(v34.f32[0] * v34.f32[0])))
                                                              * (float)(v34.f32[0] * v34.f32[0])))
                                              * 0.01)
                                      + 1.0)))
              * 256.0;
  v34.i32[0] = 0;
  objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D058D0], 0, *(double *)&v34);
  a3[1].var2[1] = v35 * v35;
  objc_msgSend(v9, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x1E0D06F30], &v50, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  if (!v50 || v36 < 0.0 || (v40 = v49, v36 + v38 > v49) || v37 < 0.0 || (v41 = v48, v37 + v39 > v48))
  {
LABEL_29:
    fig_log_get_emitter();
    FigDebugAssert3();
    v46 = FigSignalErrorAt();

    goto LABEL_30;
  }
  *(float *)&v42 = v38 / v40;
  v43 = v39 / v41;
  *((float *)&v42 + 1) = v43;
  *(float *)&v44 = v36 / v40;
  v45 = v37 / v41;
  *((float *)&v44 + 1) = v45;
  *(_QWORD *)&a3[1].var2[3] = v42;
  *(_QWORD *)&a3[1].var2[5] = v44;

  v46 = 0;
LABEL_24:

  return v46;
}

+ (int)generateInverseScalingLUT:(id *)a3 withGDCParams:(id *)a4 metalCtx:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  float *v12;
  int v13;
  float v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t j;
  id v19;
  int v20;
  _QWORD v22[3];
  __int128 v23;
  uint64_t v24;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 20, 257, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "setTextureType:", 0),
        objc_msgSend(v10, "setUsage:", 17),
        objc_msgSend(v8, "device"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        *a3 = (id)objc_msgSend(v11, "newTextureWithDescriptor:", v10),
        v11,
        !*a3))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = FigSignalErrorAt();
    v12 = 0;
LABEL_15:
    v17 = 0;
    goto LABEL_11;
  }
  v12 = (float *)malloc_type_malloc(0x404uLL, 0x100004052888210uLL);
  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = FigSignalErrorAt();
    goto LABEL_15;
  }
  v13 = objc_msgSend(a1, "generateInverseScalingLUT:withGDCParams:", v12, a4);
  if (v13)
  {
    v20 = v13;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  v14 = *v12;
  for (i = 1; i != 257; ++i)
    v14 = fmaxf(v14, v12[i]);
  v16 = malloc_type_malloc(0x202uLL, 0x1000040BDFB0063uLL);
  v17 = v16;
  if (v16)
  {
    for (j = 0; j != 257; ++j)
      *((_WORD *)v16 + j) = (int)(float)((float)(v12[j] / v14) * 65535.0);
    v19 = *a3;
    memset(v22, 0, sizeof(v22));
    v23 = xmmword_1D33052A0;
    v24 = 1;
    objc_msgSend(v19, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v22, 0, v17, 514);
    v20 = 0;
    a4->var2[3] = v14;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = FigSignalErrorAt();
  }
LABEL_11:
  free(v12);
  free(v17);

  return v20;
}

+ (CGRect)adjustCropRectangle:(CGRect)a3 withGDCParams:(id *)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  __int128 v11;
  int v12;
  unint64_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float v23;
  float v24;
  float v25;
  double v26;
  double v27;
  float32x2_t v28;
  float32x2_t v29;
  float v30;
  float v31;
  float v32;
  float v33;
  double v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x2_t v37;
  float v38;
  float v39;
  float v40;
  double v41;
  double v42;
  float32x2_t v43;
  float32x2_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  double v49;
  float v50;
  float v51;
  CGFloat v52;
  float v53;
  CGFloat v54;
  CGFloat v55;
  float v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  unsigned int v64;
  float v65;
  float v66;
  float v67;
  __int128 v68;
  float v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a3.size.width;
  v10 = a3.size.height;
  if (CGRectIsEmpty(a3) || !a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  else
  {
    v62 = v10;
    v63 = v9;
    LODWORD(v11) = 0;
    v12 = 32;
    __asm { FMOV            V0.2S, #1.0 }
    v64 = _D0;
    v18 = 0;
    do
    {
      v19.i32[0] = 0;
      v68 = v11;
      v19.i32[1] = v11;
      v20 = *(float32x2_t *)a4->var2;
      v21 = vsub_f32(v19, v20);
      v22 = vmul_f32(v21, *(float32x2_t *)&a4->var0);
      v23 = vaddv_f32(vmul_f32(v22, v22));
      v24 = a4[1].var2[1];
      v25 = fminf(v23, v24);
      if (v24 > 0.0)
        v23 = v25;
      v66 = *((float *)&v18 + 1);
      v26 = *(float *)&v18;
      v27 = vmla_n_f32(v20, v21, 1.0/ (float)((float)((float)(a4->var2[4]+ (float)((float)(a4->var2[5]+ (float)((float)(a4->var2[6]+ (float)((float)(a4->var2[7]+ (float)((float)(a4->var3[0] + (float)((float)(a4->var3[1] + (float)((float)(a4->var3[2] + (float)(a4->var3[3] * v23)) * v23)) * v23))* v23))* v23))* v23))* v23))* 0.01)+ 1.0)).f32[0];
      v70.origin.x = x;
      v70.origin.y = y;
      v70.size.width = width;
      v70.size.height = height;
      if (v27 - CGRectGetMinX(v70) >= *(float *)&v18)
      {
        v71.origin.x = x;
        v71.origin.y = y;
        v71.size.width = width;
        v71.size.height = height;
        v26 = v27 - CGRectGetMinX(v71);
      }
      v28 = vsub_f32((float32x2_t)__PAIR64__(v68, v64), *(float32x2_t *)a4->var2);
      v29 = vmul_f32(v28, *(float32x2_t *)&a4->var0);
      v30 = vaddv_f32(vmul_f32(v29, v29));
      v31 = a4[1].var2[1];
      v32 = fminf(v30, v31);
      if (v31 > 0.0)
        v30 = v32;
      v33 = v26;
      v65 = vmla_n_f32(*(float32x2_t *)a4->var2, v28, 1.0/ (float)((float)((float)(a4->var2[4]+ (float)((float)(a4->var2[5]+ (float)((float)(a4->var2[6]+ (float)((float)(a4->var2[7]+ (float)((float)(a4->var3[0] + (float)((float)(a4->var3[1] + (float)((float)(a4->var3[2] + (float)(a4->var3[3] * v30)) * v30)) * v30))* v30))* v30))* v30))* v30))* 0.01)+ 1.0)).f32[0];
      v34 = v33;
      v72.origin.x = x;
      v72.origin.y = y;
      v72.size.width = width;
      v72.size.height = height;
      if (CGRectGetMaxX(v72) - v65 >= v34)
      {
        v73.origin.x = x;
        v73.origin.y = y;
        v73.size.width = width;
        v73.size.height = height;
        v34 = CGRectGetMaxX(v73) - v65;
      }
      v35 = *(float32x2_t *)a4->var2;
      v36 = vsub_f32((float32x2_t)v68, v35);
      v37 = vmul_f32(v36, *(float32x2_t *)&a4->var0);
      v38 = vaddv_f32(vmul_f32(v37, v37));
      v39 = a4[1].var2[1];
      v40 = fminf(v38, v39);
      if (v39 > 0.0)
        v38 = v40;
      v41 = v66;
      v42 = COERCE_FLOAT(vmla_n_f32(v35, v36, 1.0/ (float)((float)((float)((float)a4[24]+ (float)((float)((float)a4[28]+ (float)((float)((float)a4[32]+ (float)((float)((float)a4[36]+ (float)((float)((float)a4[40] + (float)((float)((float)a4[44] + (float)((float)((float)a4[48] + (float)((float)a4[52] * v38)) * v38)) * v38)) * v38))* v38))* v38))* v38))* 0.01)+ 1.0)).i32[1]);
      v74.origin.x = x;
      v74.origin.y = y;
      v74.size.width = width;
      v74.size.height = height;
      if (v42 - CGRectGetMinY(v74) >= v66)
      {
        v75.origin.x = x;
        v75.origin.y = y;
        v75.size.width = width;
        v75.size.height = height;
        v41 = v42 - CGRectGetMinY(v75);
      }
      v43 = vsub_f32((float32x2_t)__PAIR64__(1.0, v68), *(float32x2_t *)a4->var2);
      v44 = vmul_f32(v43, *(float32x2_t *)&a4->var0);
      v45 = vaddv_f32(vmul_f32(v44, v44));
      v46 = a4[1].var2[1];
      v47 = fminf(v45, v46);
      if (v46 > 0.0)
        v45 = v47;
      v48 = v41;
      LODWORD(v67) = vmla_n_f32((float32x2_t)a4[8], v43, 1.0/ (float)((float)((float)((float)a4[24]+ (float)((float)((float)a4[28]+ (float)((float)((float)a4[32]+ (float)((float)((float)a4[36]+ (float)((float)((float)a4[40] + (float)((float)((float)a4[44] + (float)((float)((float)a4[48] + (float)((float)a4[52] * v45)) * v45)) * v45)) * v45))* v45))* v45))* v45))* 0.01)+ 1.0)).i32[1];
      v49 = v48;
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = width;
      v76.size.height = height;
      if (CGRectGetMaxY(v76) - v67 >= v49)
      {
        v77.origin.x = x;
        v77.origin.y = y;
        v77.size.width = width;
        v77.size.height = height;
        v49 = CGRectGetMaxY(v77) - v67;
      }
      v50 = v34;
      v51 = v49;
      v18 = __PAIR64__(LODWORD(v51), LODWORD(v50));
      v11 = v68;
      *(float *)&v11 = *(float *)&v68 + 0.032258;
      --v12;
    }
    while (v12);
    v10 = v62;
    v9 = v63;
    if (v50 > 0.0)
    {
      v52 = v50;
      v53 = height / width * v50;
      v54 = v53;
      v78.origin.x = x;
      v78.origin.y = y;
      v78.size.width = width;
      v69 = v51;
      v78.size.height = height;
      v79 = CGRectInset(v78, v52, v54);
      x = v79.origin.x;
      y = v79.origin.y;
      v9 = v79.size.width;
      v10 = v79.size.height;
      v51 = v69;
    }
    if (v51 > 0.0)
    {
      v55 = v51;
      v56 = width / height * v51;
      v57 = v56;
      v80.origin.x = x;
      v80.origin.y = y;
      v80.size.width = v9;
      v80.size.height = v10;
      v81 = CGRectInset(v80, v57, v55);
      x = v81.origin.x;
      y = v81.origin.y;
      v9 = v81.size.width;
      v10 = v81.size.height;
    }
  }
  v58 = x;
  v59 = y;
  v60 = v9;
  v61 = v10;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (CMIDistortionModel)initWithGDCParams:(id *)a3
{
  CMIDistortionModel *v4;
  CMIDistortionModel *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CMIDistortionModel *v11;
  CMIDistortionModel *v12;
  int v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMIDistortionModel;
  v4 = -[CMIDistortionModel init](&v15, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = FigSignalErrorAt();
    v11 = 0;
    if (v14)
      goto LABEL_5;
    goto LABEL_4;
  }
  v6 = *(_OWORD *)&a3->var0;
  v7 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&v4[1]._inverseScalingLUT[6] = *(_OWORD *)&a3->var2[6];
  *(_OWORD *)&v4[1]._inverseScalingLUT[2] = v7;
  *(_OWORD *)&v4[1].super.isa = v6;
  v8 = *(_OWORD *)&a3->var3[2];
  v9 = *(_OWORD *)&a3->var3[6];
  v10 = *(_OWORD *)&a3[1].var1;
  *(_OWORD *)&v4[1]._inverseScalingLUT[22] = *(_OWORD *)&a3[1].var2[3];
  *(_OWORD *)&v4[1]._inverseScalingLUT[18] = v10;
  *(_OWORD *)&v4[1]._inverseScalingLUT[14] = v9;
  *(_OWORD *)&v4[1]._inverseScalingLUT[10] = v8;
  if (+[CMIDistortionModel generateInverseScalingLUT:withGDCParams:](CMIDistortionModel, "generateInverseScalingLUT:withGDCParams:", v4->_inverseScalingLUT, a3))
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    v11 = 0;
    goto LABEL_5;
  }
LABEL_4:
  v11 = v5;
LABEL_5:
  v12 = v11;

  return v12;
}

- (int)updateGDCParams:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  int v8;

  if (a3)
  {
    v3 = *(_OWORD *)&a3->var0;
    v4 = *(_OWORD *)&a3->var2[2];
    *(_OWORD *)&self[1]._inverseScalingLUT[6] = *(_OWORD *)&a3->var2[6];
    *(_OWORD *)&self[1]._inverseScalingLUT[2] = v4;
    *(_OWORD *)&self[1].super.isa = v3;
    v5 = *(_OWORD *)&a3->var3[2];
    v6 = *(_OWORD *)&a3->var3[6];
    v7 = *(_OWORD *)&a3[1].var1;
    *(_OWORD *)&self[1]._inverseScalingLUT[22] = *(_OWORD *)&a3[1].var2[3];
    *(_OWORD *)&self[1]._inverseScalingLUT[18] = v7;
    *(_OWORD *)&self[1]._inverseScalingLUT[14] = v6;
    *(_OWORD *)&self[1]._inverseScalingLUT[10] = v5;
    v8 = +[CMIDistortionModel generateInverseScalingLUT:withGDCParams:](CMIDistortionModel, "generateInverseScalingLUT:withGDCParams:", self->_inverseScalingLUT, a3);
    if (v8)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return v8;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (float32x2_t)distortSensorCoord:(float32x2_t *)a1
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float v5;
  float v6;
  _BOOL4 v7;
  unsigned int v8;

  if (a1)
  {
    v2 = a1[131];
    v3 = vsub_f32(a2, v2);
    v4 = vmul_f32(v3, a1[130]);
    v5 = a1[132].f32[0] * sqrtf(vaddv_f32(vmul_f32(v4, v4)));
    v6 = 256.0;
    v7 = v5 > 256.0 || v5 < 0.0;
    if (v5 < 0.0 && v5 <= 256.0)
      v6 = 0.0;
    if (v7)
      v5 = v6;
    v8 = v5;
    if (v5 >= 0xFF)
      v8 = 255;
    return vmla_n_f32(v2, v3, (float)(a1[1].f32[v8 + 1] * (float)(v5 - (float)v8))+ (float)(a1[1].f32[v8] * (float)(1.0 - (float)(v5 - (float)v8))));
  }
  else
  {
    return 0;
  }
}

- (float32x2_t)undistortImageCoord:(float32x2_t *)a1
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float v7;
  float v8;
  float v9;

  if (a1)
  {
    v2 = a1[142];
    v3 = vmla_f32(a1[143], v2, a2);
    v4 = a1[131];
    v5 = vsub_f32(v3, v4);
    v6 = vmul_f32(v5, a1[130]);
    v7 = vaddv_f32(vmul_f32(v6, v6));
    v8 = a1[141].f32[0];
    v9 = fminf(v7, v8);
    if (v8 > 0.0)
      v7 = v9;
    return vdiv_f32(vsub_f32(vmla_n_f32(v4, v5, 1.0/ (float)((float)((float)(a1[133].f32[0]+ (float)((float)(a1[133].f32[1]+ (float)((float)(a1[134].f32[0]+ (float)((float)(a1[134].f32[1]+ (float)((float)(a1[135].f32[0] + (float)((float)(a1[135].f32[1] + (float)((float)(a1[136].f32[0] + (float)(a1[136].f32[1] * v7)) * v7)) * v7))* v7))* v7))* v7))* v7))* 0.01)+ 1.0)), a1[143]), v2);
  }
  else
  {
    return 0;
  }
}

- (float32x2_t)distortImageCoord:(float32x2_t *)a1
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float v7;
  float v8;
  _BOOL4 v9;
  unsigned int v10;

  if (a1)
  {
    v2 = a1[142];
    v3 = vmla_f32(a1[143], v2, a2);
    v4 = a1[131];
    v5 = vsub_f32(v3, v4);
    v6 = vmul_f32(v5, a1[130]);
    v7 = a1[132].f32[0] * sqrtf(vaddv_f32(vmul_f32(v6, v6)));
    v8 = 256.0;
    v9 = v7 > 256.0 || v7 < 0.0;
    if (v7 < 0.0 && v7 <= 256.0)
      v8 = 0.0;
    if (v9)
      v7 = v8;
    v10 = v7;
    if (v7 >= 0xFF)
      v10 = 255;
    return vdiv_f32(vsub_f32(vmla_n_f32(v4, v5, (float)(a1[1].f32[v10 + 1] * (float)(v7 - (float)v10))+ (float)(a1[1].f32[v10] * (float)(1.0 - (float)(v7 - (float)v10)))), a1[143]), v2);
  }
  else
  {
    return 0;
  }
}

- (CGRect)preGDCCropRectFromRect:(CGRect)a3
{
  unint64_t v4;
  CGFloat height;
  CGFloat y;
  float32x2_t v7;
  float32x2_t v8;
  int v9;
  unint64_t v10;
  _BOOL8 v11;
  float v12;
  float v13;
  float32x2_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  _BOOL4 v19;
  float32x2_t v25;
  int8x8_t v26;
  int8x8_t v27;
  float32x2_t v28;
  float32x2_t v29;
  int32x2_t v30;
  __int8 v31;
  __int8 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x2_t v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x2_t v43;
  float32x2_t v44;
  uint64_t v45;
  CGRect result;

  v4 = 0;
  v45 = *MEMORY[0x1E0C80C00];
  height = a3.size.height;
  y = a3.origin.y;
  v7 = vcvt_f32_f64((float64x2_t)a3.size);
  v8 = vcvt_f32_f64((float64x2_t)a3.origin);
  v43 = 0;
  v44 = 0;
  do
  {
    v9 = 0;
    v10 = v4 & 1;
    v11 = !(v4 & 1);
    v41 = v8;
    v12 = *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFFBLL | (4 * v10));
    v40 = v7;
    v13 = v12 + (float)(*(float *)((unint64_t)&v40 | (4 * v10)) * (float)(v4 >> 1));
    v42 = 0;
    *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFFBLL | (4 * v10)) = v13;
    v14 = v42;
    if (v4 >= 2)
      v15 = 0.0;
    else
      v15 = 1.0;
    v16 = *(float *)((unint64_t)&v41 & 0xFFFFFFFFFFFFFFFBLL | (4 * !(v4 & 1)));
    v17 = *(float *)((unint64_t)&v40 | (4 * v11));
    do
    {
      v38 = v14;
      *(float *)((unint64_t)&v38 | (4 * v11)) = v16 + (float)((float)(v17 * (float)v9) * 0.00097656);
      v14 = v38;
      v39 = -[CMIDistortionModel distortSensorCoord:]((float32x2_t *)self, v38);
      v18 = *(float *)((unint64_t)&v39 | (4 * v10));
      v19 = v15 < v18;
      if (v4 >= 2)
        v19 = v15 > v18;
      if (!v19)
        v15 = *(float *)((unint64_t)&v39 | (4 * v10));
      ++v9;
    }
    while (v9 != 1024);
    v43.f32[v4++] = v15;
  }
  while (v4 != 4);
  __asm { FMOV            V3.2S, #1.0 }
  v25 = vsub_f32(_D3, v44);
  v26 = (int8x8_t)vabd_f32(v43, v25);
  v27 = (int8x8_t)vcgt_f32(v43, v25);
  v28 = vsub_f32(v43, (float32x2_t)vand_s8(v26, v27));
  v29 = vadd_f32(vsub_f32(vadd_f32(v44, (float32x2_t)vbsl_s8(v27, (int8x8_t)0x8000000080000000, v26)), v28), (float32x2_t)vdup_n_s32(0x3D23D70Au));
  v30 = vcgt_f32(_D3, v29);
  v31 = v30.i8[4];
  v32 = v30.i8[0];
  v33 = v29.f32[0];
  v34 = 1.0;
  if ((v32 & 1) == 0)
    v33 = 1.0;
  v35 = v29.f32[1];
  if ((v31 & 1) != 0)
    v34 = v35;
  v36 = fmaxf(v28.f32[0] + -0.02, 0.0);
  v37 = fmaxf(v28.f32[1] + -0.02, 0.0);
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

+ (int)generateInverseScalingLUT:(float *)a3 withGDCParams:(id *)a4
{
  float *v6;
  float *v7;
  float *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  unsigned int v15;
  uint64_t i;
  uint64_t v17;
  int v18;
  uint64_t v19;
  float v20;
  float *v21;
  float v22;
  unsigned int v23;
  float v24;
  float v25;
  uint64_t j;
  int v27;

  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v6 = 0;
    v7 = 0;
    v8 = 0;
LABEL_34:
    v27 = FigSignalErrorAt();
    v10 = 0;
    goto LABEL_28;
  }
  v6 = (float *)malloc_type_malloc(0x404uLL, 0x100004052888210uLL);
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
LABEL_32:
    v8 = 0;
    goto LABEL_34;
  }
  v7 = (float *)malloc_type_malloc(0x404uLL, 0x100004052888210uLL);
  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_32;
  }
  v8 = (float *)malloc_type_malloc(0x404uLL, 0x100004052888210uLL);
  if (!v8 || (v9 = (char *)malloc_type_malloc(0x404uLL, 0x100004052888210uLL)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_34;
  }
  v10 = v9;
  v11 = 0;
  v12 = (float)(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&a4->var0, *(float32x2_t *)&a4->var0))) * 0.5) * 0.0039062;
  v13 = 1.0 / a4->var2[2];
  do
  {
    v14 = v12 * (float)(int)v11;
    v6[v11] = v14;
    v7[v11] = v14
            / (float)((float)((float)(a4->var2[4]
                                    + (float)((float)(a4->var2[5]
                                                    + (float)((float)(a4->var2[6]
                                                                    + (float)((float)(a4->var2[7]
                                                                                    + (float)((float)(a4->var3[0] + (float)((float)(a4->var3[1] + (float)((float)(a4->var3[2] + (float)(a4->var3[3] * (float)(v14 * v14))) * (float)(v14 * v14))) * (float)(v14 * v14)))
                                                                                            * (float)(v14 * v14)))
                                                                            * (float)(v14 * v14)))
                                                            * (float)(v14 * v14)))
                                            * (float)(v14 * v14)))
                            * 0.01)
                    + 1.0);
    v8[v11] = v13 * (float)(int)v11;
    ++v11;
  }
  while (v11 != 257);
  v15 = 0;
  for (i = 0; i != 257; ++i)
  {
    v17 = v15;
    if (v15 <= 0xFF)
      v18 = 255;
    else
      v18 = v15;
    if (v15 <= 0xFFuLL)
      v19 = 255;
    else
      v19 = v15;
    v20 = v8[i];
    --v15;
    while (v19 != v17)
    {
      v21 = &v7[v17++];
      ++v15;
      if (v21[1] > v20)
        goto LABEL_20;
    }
    v15 = v18;
LABEL_20:
    v22 = v7[v15];
    v23 = v15 + 1;
    v24 = v7[v15 + 1] - v22;
    v25 = v20 - v22;
    if (v25 >= v24)
      v25 = v7[v23] - v22;
    if (v25 < 0.0)
      v25 = 0.0;
    *(float *)&v9[4 * i] = (float)((float)(v6[v23] * v25) + (float)(v6[v15] * (float)(v24 - v25))) / v24;
  }
  *a3 = 1.0;
  for (j = 1; j != 257; ++j)
    a3[j] = *(float *)&v9[j * 4] / fmaxf(v8[j], 0.000001);
  v27 = 0;
LABEL_28:
  free(v6);
  free(v7);
  free(v8);
  free(v10);
  return v27;
}

- ($0B57B161DD08FFA902CA30037FAFD2DD)gdcParams
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[14].var2[4];
  v4 = *(_OWORD *)&self[14].var3[4];
  *(_OWORD *)&retstr->var3[6] = *(_OWORD *)self[14].var3;
  *(_OWORD *)&retstr[1].var1 = v4;
  *(_OWORD *)&retstr[1].var2[3] = *(_OWORD *)&self[14].var4;
  v5 = *(_OWORD *)&self[13].var3[7];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[13].var3[3];
  *(_OWORD *)&retstr->var2[2] = v5;
  *(_OWORD *)&retstr->var2[6] = *(_OWORD *)self[14].var2;
  *(_OWORD *)&retstr->var3[2] = v3;
  return self;
}

@end
