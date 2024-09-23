@implementation CMINoiseModels

+ (CMINoiseModel)calculateBasicNoiseModelFromParams:(SEL)a3
{
  float32x2_t v5;
  float var3;
  simd_float2x2 v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float var2;
  float var4;
  simd_float2x2 v20;

  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  if (a4)
  {
    v5 = *(float32x2_t *)&a4->var0;
    var3 = a4->var3;
    var2 = a4->var2;
    var4 = a4->var4;
    v20.columns[0] = (simd_float2)0x3F8000003F800000;
    v20.columns[1] = (simd_float2)0x428000003F800000;
    v7 = __invert_f2(v20);
    v8 = vmul_n_f32(vmul_n_f32(vmul_f32(vmul_f32(vmul_f32(v5, v5), (float32x2_t)0x410000003F800000), (float32x2_t)0x410000003F800000), var2), var2);
    v9 = vmla_lane_f32(vmul_n_f32((float32x2_t)v7.columns[0], v8.f32[0]), (float32x2_t)v7.columns[1], v8, 1);
    __asm { FMOV            V2.2S, #1.0 }
    _D2.f32[1] = (float)(var4 * var3) * (float)(var4 * var3);
    v15 = vmul_f32(_D2, v9);
    v16 = (float32x2_t)vdup_lane_s32((int32x2_t)v15, 0);
    v17 = vadd_f32(v16, v15);
    v16.f32[0] = var2;
    v15.f32[0] = var4;
    v15.i32[0] = vmul_f32(v16, v15).u32[0];
    v15.i32[1] = v17.i32[1];
    *(float32x2_t *)&retstr->var1 = v15;
    retstr->var3 = 0.0;
    retstr->var4 = 0.0;
  }
  else
  {
    retstr->var0 = -1;
  }
  return result;
}

+ (CMINoiseModel)calculateBasicNoiseModel:(SEL)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  CMINoiseModel *result;
  __int128 v13;
  float v14;
  char v15;
  float v16[5];

  v5 = a4;
  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  v15 = 0;
  LODWORD(v6) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06D48], &v15, v6);
  v16[0] = *(float *)&v7 * 0.000015259;
  if (!v15)
    goto LABEL_8;
  LODWORD(v7) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06D50], &v15, v7);
  v16[1] = *(float *)&v8 * 0.000015259;
  if (!v15)
    goto LABEL_8;
  LODWORD(v8) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06F78], &v15, v8);
  v16[3] = *(float *)&v9 * 0.0039062;
  if (!v15)
    goto LABEL_8;
  LODWORD(v9) = 0;
  objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D067E0], &v15, v9);
  v16[4] = *(float *)&v10 * 0.0039062;
  if (v15
    && (LODWORD(v10) = 0,
        objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06960], &v15, v10),
        v16[2] = v11 * 0.000015259,
        v15))
  {
    +[CMINoiseModels calculateBasicNoiseModelFromParams:](CMINoiseModels, "calculateBasicNoiseModelFromParams:", v16);
    *(_OWORD *)&retstr->var0 = v13;
    retstr->var4 = v14;
  }
  else
  {
LABEL_8:
    retstr->var0 = -1;
  }

  return result;
}

+ (CMINoiseModel)calculateNoiseModel:(SEL)a3 darkCurrentNoiseTuningParams:(id)a4
{
  id v7;
  id v8;
  double v9;
  float v10;
  double v11;
  float v12;
  float v13;
  float v14;
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
  double v25;
  float v26;
  float v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  double v32;
  float v33;
  void *v34;
  double v35;
  float v36;
  void *v37;
  float v38;
  double v39;
  float v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  int8x16_t v50;
  int8x16_t v51;
  void *v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  double v61;
  float v62;
  float v63;
  CMINoiseModel *result;
  float32x4_t v65;
  char v66;

  v7 = a4;
  v8 = a5;
  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  +[CMINoiseModels calculateBasicNoiseModel:](CMINoiseModels, "calculateBasicNoiseModel:", v7);
  if (retstr->var0)
    goto LABEL_34;
  *(_QWORD *)&retstr->var3 = 0x3DAAAAAB00000000;
  v66 = 0;
  objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06960], &v66, 1.21265983e-11);
  if (!v66
    || (v10 = *(float *)&v9,
        LODWORD(v9) = 0,
        objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D067E0], &v66, v9),
        !v66))
  {
    v17 = 0;
    v37 = 0;
    v34 = 0;
    v30 = 0;
    goto LABEL_33;
  }
  v12 = *(float *)&v11;
  v13 = 0.0;
  LODWORD(v11) = 0;
  objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06F78], &v66, v11);
  if (!v66)
  {
LABEL_34:
    v17 = 0;
    goto LABEL_35;
  }
  v15 = v12 * 0.0039062;
  v16 = v14 * 0.0039062;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ModelScalingParameters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v37 = 0;
    v34 = 0;
    v30 = 0;
    v38 = 1.0;
    v31 = 1.0;
    goto LABEL_23;
  }
  LODWORD(v18) = 0;
  objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06A20], &v66, v18);
  if (!v66)
    goto LABEL_35;
  v20 = *(float *)&v19;
  LODWORD(v19) = 0;
  objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06F60], &v66, v19);
  if (!v66)
    goto LABEL_35;
  v22 = *(float *)&v21;
  LODWORD(v21) = 0;
  objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06F68], &v66, v21);
  if (!v66
    || (v24 = *(float *)&v23,
        LODWORD(v23) = 0,
        objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D067B0], &v66, v23),
        !v66)
    || (v26 = *(float *)&v25,
        LODWORD(v25) = 0,
        objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06770], &v66, v25),
        !v66))
  {
LABEL_35:
    v37 = 0;
    v34 = 0;
    v30 = 0;
    goto LABEL_31;
  }
  v28 = 0.066667;
  if (v20 <= 0.066667)
    v28 = v20;
  v29 = (float)((float)(v20 * (float)((float)(v15 * v16) * (float)((float)(v22 * 0.0039062) / v24))) * v26)
      / (float)(v28 * v27);
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TemporalStdDevScaling"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 1.0;
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(float *)&v32 = v29;
      objc_msgSend(v30, "cmi_interpolateValueForGain:", v32);
      v31 = v33;
    }
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("SpatialStdDevScaling"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0.0;
  if (v34)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(float *)&v35 = v29;
      objc_msgSend(v34, "cmi_interpolateValueForGain:", v35);
      v13 = v36;
    }
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("OPBScaling"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 1.0;
  if (v37)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(float *)&v39 = v29;
      objc_msgSend(v37, "cmi_interpolateValueForGain:", v39);
      v38 = v40;
    }
  }
LABEL_23:
  objc_msgSend(v7, "cmi_simdFloat4ValueForKey:defaultValue:found:", *MEMORY[0x1E0D060A0], 0, 0.0);
  v65 = v41;
  objc_msgSend(v7, "cmi_simdFloat4ValueForKey:defaultValue:found:", *MEMORY[0x1E0D06DE0], &v66, 0.0);
  if (!v66)
  {
LABEL_33:
    retstr->var0 = -1;
    goto LABEL_31;
  }
  v43 = (float32x4_t)vdupq_n_s32(0x3C800000u);
  v44 = vmulq_f32(v42, v43);
  __asm { FMOV            V3.4S, #0.25 }
  v50 = (int8x16_t)vmulq_f32(vmaxnmq_f32(vmulq_f32(v65, v43), (float32x4_t)0), _Q3);
  *(float32x2_t *)v50.i8 = vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL));
  v51 = (int8x16_t)vmulq_f32(vmaxnmq_f32(v44, (float32x4_t)0), _Q3);
  *(float32x2_t *)v51.i8 = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
  retstr->var3 = (float)(v10 * 0.000015259)
               * (float)(v16
                       * (float)(v15
                               * (float)(v38
                                       * vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v51.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v51.i8))))));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DarkCurrentNoiseCalibration"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v7, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x1E0D05E80], 0, 0);
  v55 = v53;
  if ((v53 & 1) != 0 || v52)
  {
    v56 = 0.0;
    if ((_DWORD)v53)
    {
      LODWORD(v54) = 0;
      objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D05EA0], 0, v54);
      v56 = v57 * 0.015625;
    }
    +[CMINoiseModels _fpnrSpatialStdDev:darkCurrentNoiseCalibration:fpnrEnabled:](CMINoiseModels, "_fpnrSpatialStdDev:darkCurrentNoiseCalibration:fpnrEnabled:", v7, v52, v55);
    v59 = v58;
    +[CMINoiseModels _fpnrScalingFactor:darkCurrentNoiseCalibration:fpnrEnabled:](CMINoiseModels, "_fpnrScalingFactor:darkCurrentNoiseCalibration:fpnrEnabled:", v7, v52, v55);
    v60 = *(float *)&v61;
    LODWORD(v61) = 1.0;
    if ((_DWORD)v55)
      *(float *)&v61 = (float)(int)objc_msgSend(v7, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x1E0D05E88], 0, &v66, v61);
    v62 = sqrtf(fmaxf((float)((float)-(float)(v56 * v56) / *(float *)&v61) + (float)(v59 * v59), 0.0));
    v63 = sqrtf(*(float *)&v61);
    retstr->var3 = retstr->var3
                 + (float)((float)((float)((float)(v13 * v60) * v62) * (float)((float)(v13 * v60) * v62))
                         + (float)((float)((float)(v56 * (float)(v31 * v60)) / v63)
                                 * (float)((float)(v56 * (float)(v31 * v60)) / v63)));

  }
LABEL_31:

  return result;
}

+ (float)_fpnrSpatialStdDev:(id)a3 darkCurrentNoiseCalibration:(id)a4 fpnrEnabled:(BOOL)a5
{
  double v5;
  const __CFString *v7;
  float v8;
  char v10;

  v10 = 0;
  if (a5)
  {
    LODWORD(v5) = 0;
    v7 = (const __CFString *)*MEMORY[0x1E0D05E98];
  }
  else
  {
    a3 = a4;
    v7 = CFSTR("ReferenceDarkFrameSpatialStdDev");
    LODWORD(v5) = 0;
  }
  objc_msgSend(a3, "cmi_floatValueForKey:defaultValue:found:", v7, &v10, v5);
  return v8 * 0.015625;
}

+ (float)_fpnrScalingFactor:(id)a3 darkCurrentNoiseCalibration:(id)a4 fpnrEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  double v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  float v25;
  char v27;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v10 = v8;
  v27 = 0;
  if (v5)
  {
    LODWORD(v9) = 0;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D05E90], &v27, v9);
    v12 = v11;
  }
  else
  {
    v12 = 0.0;
    LODWORD(v9) = 0;
    objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", CFSTR("ReferenceDarkFrameSensorTemperature"), &v27, v9);
    if (v27)
    {
      v14 = *(float *)&v13;
      LODWORD(v13) = 0;
      objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", CFSTR("ReferenceDarkFrameExposureTime"), &v27, v13);
      if (v27)
      {
        v16 = *(float *)&v15;
        LODWORD(v15) = 0;
        objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", CFSTR("ReferenceDarkFrameAGC"), &v27, v15);
        if (v27)
        {
          v18 = *(float *)&v17;
          LODWORD(v17) = 0;
          objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", CFSTR("DarkCurrentTemperatureModelScaling"), &v27, v17);
          if (v27)
          {
            v20 = *(float *)&v19;
            LODWORD(v19) = 0;
            objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06E08], &v27, v19);
            if (v27)
            {
              v22 = *(float *)&v21;
              LODWORD(v21) = 1.0;
              objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D06A20], &v27, v21);
              if (v27)
              {
                v24 = *(float *)&v23;
                LODWORD(v23) = 1132462080;
                objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x1E0D067E0], &v27, v23);
                if (v27)
                  v12 = (float)(expf(v20 * (float)(v22 - v14)) * (float)(v24 / v16))
                      * (float)((float)(v25 * 0.0039062) / v18);
              }
            }
          }
        }
      }
    }
  }

  return v12;
}

@end
