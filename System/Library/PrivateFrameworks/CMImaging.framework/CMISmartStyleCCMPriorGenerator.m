@implementation CMISmartStyleCCMPriorGenerator

+ (__n128)calculatePriorCCMforCast:(float)a3 tone:(float)a4 color:(uint64_t)a5 intensity:(uint64_t)a6 priorStrength:(void *)a7
{
  id v8;
  int v9;
  int v10;
  unsigned int v11;
  float v12;
  id v13;
  void *v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  float32x4_t v18;
  float32x2_t v25;
  float32x4_t v27;
  float v28;
  float32x4_t v29;
  float32x4_t v30;
  unsigned int v31;
  int16x4_t v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  uint16x4_t v35;
  float32x4_t v36;
  uint16x4_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  float32x4_t *v41;
  float32x4_t *v42;
  char *v43;
  float32x4_t *v44;
  float32x4_t *v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  char *v49;
  char *v50;
  float32x4_t *v51;
  float32x4_t *v52;
  char *v53;
  float32x4_t *v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t *v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  __int128 v71;
  unsigned int v74;
  uint64_t v75;
  __int32 v78;
  int8x16_t v79;
  int8x16_t v80;
  int8x16_t v81;
  __int128 v82;
  uint64_t v83;
  int v84;
  __int32 v85;
  uint64_t v86;
  __int32 v87;
  __int32 v88;
  uint64_t v89;
  __int32 v90;
  __int32 v91;
  _OWORD v92[3];

  v8 = a7;
  if (calculatePriorCCMforCast_tone_color_intensity_priorStrength__onceToken != -1)
    dispatch_once(&calculatePriorCCMforCast_tone_color_intensity_priorStrength__onceToken, &__block_literal_global_2);
  v9 = objc_msgSend((id)calculatePriorCCMforCast_tone_color_intensity_priorStrength__blackAndWhiteCasts, "containsObject:", v8, *(_QWORD *)&a2);
  v10 = v9;
  if (v9)
    v11 = -1;
  else
    v11 = 0;
  v79 = (int8x16_t)vdupq_n_s32(0x3EAAAAABu);
  v80 = (int8x16_t)vdupq_n_s32(v11);
  v12 = 0.33333;
  if (!v9)
    v12 = 1.0;
  v78 = LODWORD(v12);
  v13 = v8;
  if (ssccmpg_getPrior_onceToken != -1)
    dispatch_once(&ssccmpg_getPrior_onceToken, &__block_literal_global_1);
  v81 = vbslq_s8(v80, v79, (int8x16_t)0);
  objc_msgSend((id)ssccmpg_getPrior_castNameToID, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  v16 = (char *)&CCMPriorColorful;
  switch(v15)
  {
    case 0:

      v84 = 0;
      v83 = 0;
      v85 = v78;
      v87 = v81.i32[2];
      v86 = v81.i64[0];
      v88 = v78;
      v90 = v81.i32[2];
      v89 = v81.i64[0];
      v91 = v78;
      v17 = &v83;
      goto LABEL_25;
    case 2:
      v16 = (char *)&CCMPriorDreamyHues;
      goto LABEL_24;
    case 3:
      v16 = (char *)&CCMPriorEarthy;
      goto LABEL_24;
    case 4:
      v16 = (char *)&CCMPriorNoFilter;
      goto LABEL_24;
    case 5:
    case 14:
      v16 = (char *)&CCMPriorStarkBW;
      goto LABEL_24;
    case 6:
      v16 = (char *)&CCMPriorUrbanCool;
      goto LABEL_24;
    case 7:
      v16 = (char *)&CCMPriorWarmAuthentic;
      goto LABEL_24;
    case 8:
      v16 = (char *)&CCMPriorCloudCover;
      goto LABEL_24;
    case 9:
      v16 = (char *)&CCMPriorTanWarm;
      goto LABEL_24;
    case 10:
      v16 = (char *)&CCMPriorBlushWarm;
      goto LABEL_24;
    case 11:
      v16 = (char *)&CCMPriorGoldWarm;
      goto LABEL_24;
    case 12:
      v16 = (char *)&CCMPriorNeutral;
      goto LABEL_24;
    case 13:
      v16 = (char *)&CCMPriorCool;
      goto LABEL_24;
    default:
LABEL_24:

      v18.i64[1] = v75;
      __asm
      {
        FMOV            V0.2S, #-1.0
        FMOV            V3.2S, #1.0
      }
      v25 = vmul_f32(vadd_f32(vminnm_f32(vmaxnm_f32((float32x2_t)__PAIR64__(v74, LODWORD(a1)), _D0), _D3), _D3), (float32x2_t)0x3F0000003F000000);
      __asm { FMOV            V0.2S, #4.0 }
      *(float32x2_t *)v18.f32 = vmul_f32(v25, _D0);
      v27.i64[0] = v18.i64[0];
      v28 = fminf(fmaxf(a3, 0.0), 1.0);
      v29 = v18;
      v29.f32[2] = v28;
      v18.i64[0] = 0;
      v18.i32[2] = 0;
      v27.i64[1] = LODWORD(v28);
      v30 = vsubq_f32(v29, vrndmq_f32(v27));
      v30.i32[3] = 0;
      v31 = (int)v28;
      v32 = (int16x4_t)vcvt_n_u32_f32(v25, 2uLL);
      v33 = v32.i16[0];
      v34 = v32.u16[2];
      v32.i16[1] = v32.i16[2];
      v32.i16[2] = v31;
      v35 = (uint16x4_t)vadd_s16(v32, (int16x4_t)0x1000100010001);
      v35.i16[3] = 0;
      v36 = vminnmq_f32(v30, (float32x4_t)xmmword_1D33054B0);
      v37 = vmin_u16(v35, (uint16x4_t)0x100040004);
      v38 = 3 * v34;
      v39 = &v16[480 * v33];
      v40 = &v39[32 * v38];
      v41 = (float32x4_t *)&v40[48 * v31];
      v42 = (float32x4_t *)&v40[48 * v37.u16[2]];
      v43 = &v39[96 * v37.u16[1]];
      v44 = (float32x4_t *)&v43[48 * v31];
      v45 = (float32x4_t *)&v43[48 * v37.u16[2]];
      v46 = *v45;
      v47 = v45[1];
      v48 = v45[2];
      v49 = &v16[480 * v37.u16[0]];
      v50 = &v49[32 * v38];
      v51 = (float32x4_t *)&v50[48 * v31];
      v52 = (float32x4_t *)&v50[48 * v37.u16[2]];
      v53 = &v49[96 * v37.u16[1]];
      v54 = (float32x4_t *)&v53[48 * v31];
      v55 = *v54;
      v56 = v54[1];
      v57 = v54[2];
      v58 = (float32x4_t *)&v53[48 * v37.u16[2]];
      v59 = v58[1];
      v60 = vmlaq_laneq_f32(*v41, vsubq_f32(*v42, *v41), v36, 2);
      v61 = vmlaq_laneq_f32(v41[1], vsubq_f32(v42[1], v41[1]), v36, 2);
      v62 = vmlaq_laneq_f32(v41[2], vsubq_f32(v42[2], v41[2]), v36, 2);
      v63 = vmlaq_lane_f32(v60, vsubq_f32(vmlaq_laneq_f32(*v44, vsubq_f32(v46, *v44), v36, 2), v60), *(float32x2_t *)v36.f32, 1);
      v64 = vmlaq_lane_f32(v61, vsubq_f32(vmlaq_laneq_f32(v44[1], vsubq_f32(v47, v44[1]), v36, 2), v61), *(float32x2_t *)v36.f32, 1);
      v65 = vmlaq_lane_f32(v62, vsubq_f32(vmlaq_laneq_f32(v44[2], vsubq_f32(v48, v44[2]), v36, 2), v62), *(float32x2_t *)v36.f32, 1);
      v66 = vmlaq_laneq_f32(*v51, vsubq_f32(*v52, *v51), v36, 2);
      v67 = vmlaq_laneq_f32(v51[1], vsubq_f32(v52[1], v51[1]), v36, 2);
      v68 = vmlaq_laneq_f32(v51[2], vsubq_f32(v52[2], v51[2]), v36, 2);
      v69 = vmlaq_n_f32(v65, vsubq_f32(vmlaq_lane_f32(v68, vsubq_f32(vmlaq_laneq_f32(v57, vsubq_f32(v58[2], v57), v36, 2), v68), *(float32x2_t *)v36.f32, 1), v65), v36.f32[0]);
      v18.i32[3] = v78;
      v70 = (float32x4_t)v81;
      v70.i32[3] = v78;
      v92[0] = vmlaq_n_f32(v18, vsubq_f32(vmlaq_n_f32(v63, vsubq_f32(vmlaq_lane_f32(v66, vsubq_f32(vmlaq_laneq_f32(v55, vsubq_f32(*v58, v55), v36, 2), v66), *(float32x2_t *)v36.f32, 1), v63), v36.f32[0]), v18), a4);
      v92[1] = vmlaq_n_f32(v70, vsubq_f32(vmlaq_n_f32(v64, vsubq_f32(vmlaq_lane_f32(v67, vsubq_f32(vmlaq_laneq_f32(v56, vsubq_f32(v59, v56), v36, 2), v67), *(float32x2_t *)v36.f32, 1), v64), v36.f32[0]), v70), a4);
      v92[2] = vmlaq_n_f32(v70, vsubq_f32(v69, v70), a4);
      v17 = (uint64_t *)v92;
LABEL_25:
      *(double *)&v71 = ssccmpg_float3x4FromMatrix((uint64_t)v17, v10);
      v82 = v71;

      return (__n128)v82;
  }
}

void __94__CMISmartStyleCCMPriorGenerator_calculatePriorCCMforCast_tone_color_intensity_priorStrength___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("StarkBW"), CFSTR("LongGray"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)calculatePriorCCMforCast_tone_color_intensity_priorStrength__blackAndWhiteCasts;
  calculatePriorCCMforCast_tone_color_intensity_priorStrength__blackAndWhiteCasts = v0;

}

@end
