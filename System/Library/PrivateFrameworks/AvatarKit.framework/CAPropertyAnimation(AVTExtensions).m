@implementation CAPropertyAnimation(AVTExtensions)

- (uint64_t)avt_isUseless
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float32x4_t v11;
  uint32x4_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float32x4_t v21;
  uint32x4_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v46;
  float32x4_t v47;
  uint32x4_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float v70;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = a1;
    objc_msgSend(v2, "keyPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("position"));

    if (v5)
    {
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      objc_msgSend(v2, "values");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v97;
        v73 = (float32x4_t)vdupq_n_s32(0x3A83126Fu);
LABEL_5:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v97 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * v10), "avt_float3Value");
          v12 = (uint32x4_t)vcgtq_f32(vabsq_f32(v11), v73);
          v12.i32[3] = v12.i32[2];
          if ((vmaxvq_u32(v12) & 0x80000000) != 0)
            break;
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
            v13 = 1;
            if (v8)
              goto LABEL_5;
            goto LABEL_73;
          }
        }
LABEL_71:
        v13 = 0;
LABEL_73:

LABEL_74:
        return v13;
      }
      goto LABEL_72;
    }
    objc_msgSend(v2, "keyPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("eulerAngles"));

    if (v16)
    {
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      objc_msgSend(v2, "values");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v93;
        v74 = (float32x4_t)vdupq_n_s32(0x3A83126Fu);
LABEL_16:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v93 != v19)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v20), "avt_float3Value");
          v22 = (uint32x4_t)vcgtq_f32(vabsq_f32(v21), v74);
          v22.i32[3] = v22.i32[2];
          if ((vmaxvq_u32(v22) & 0x80000000) != 0)
            goto LABEL_71;
          if (v18 == ++v20)
          {
            v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
            v13 = 1;
            if (v18)
              goto LABEL_16;
            goto LABEL_73;
          }
        }
      }
LABEL_72:
      v13 = 1;
      goto LABEL_73;
    }
    objc_msgSend(v2, "keyPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastPathComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "hasSuffix:", CFSTR("eulerAngles.x")) & 1) != 0)
      goto LABEL_26;
    objc_msgSend(v2, "keyPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "hasSuffix:", CFSTR("eulerAngles.y")) & 1) != 0)
    {

LABEL_26:
      goto LABEL_27;
    }
    objc_msgSend(v2, "keyPath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "hasSuffix:", CFSTR("eulerAngles.z"));

    if ((v34 & 1) != 0)
    {
LABEL_27:
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      objc_msgSend(v2, "values");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v89;
LABEL_29:
        v30 = 0;
        while (1)
        {
          if (*(_QWORD *)v89 != v29)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v30), "floatValue");
          if (fabsf(v31) > 0.001)
            goto LABEL_71;
          if (v28 == ++v30)
          {
            v28 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
            v13 = 1;
            if (v28)
              goto LABEL_29;
            goto LABEL_73;
          }
        }
      }
      goto LABEL_72;
    }
    objc_msgSend(v2, "keyPath");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lastPathComponent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("scale"));

    if (v37)
    {
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      objc_msgSend(v2, "values");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v85;
        __asm { FMOV            V1.4S, #-1.0 }
        v72 = (float32x4_t)vdupq_n_s32(0x3A83126Fu);
        v75 = _Q1;
LABEL_40:
        v46 = 0;
        while (1)
        {
          if (*(_QWORD *)v85 != v40)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * v46), "avt_float3Value", *(_OWORD *)&v72);
          v48 = (uint32x4_t)vcgtq_f32(vabsq_f32(vaddq_f32(v47, v75)), v72);
          v48.i32[3] = v48.i32[2];
          if ((vmaxvq_u32(v48) & 0x80000000) != 0)
            goto LABEL_71;
          if (v39 == ++v46)
          {
            v39 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
            v13 = 1;
            if (v39)
              goto LABEL_40;
            goto LABEL_73;
          }
        }
      }
      goto LABEL_72;
    }
    objc_msgSend(v2, "keyPath");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "lastPathComponent");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v50, "hasSuffix:", CFSTR("scale.x")) & 1) == 0)
    {
      objc_msgSend(v2, "keyPath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "lastPathComponent");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v52, "hasSuffix:", CFSTR("scale.y")) & 1) == 0)
      {
        objc_msgSend(v2, "keyPath");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "lastPathComponent");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "hasSuffix:", CFSTR("scale.z"));

        if ((v60 & 1) == 0)
        {
          objc_msgSend(v2, "keyPath");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "lastPathComponent");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("orientation"));

          if (!v63)
          {
            v13 = 0;
            goto LABEL_74;
          }
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          objc_msgSend(v2, "values");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
          if (v64)
          {
            v65 = v64;
            v66 = *(_QWORD *)v77;
LABEL_64:
            v67 = 0;
            while (1)
            {
              if (*(_QWORD *)v77 != v66)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * v67), "avt_float4Value");
              v69 = vmulq_f32(v68, v68);
              v70 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1))).f32[0]), v68.f32[3]);
              if (fabsf(v70 + v70) > 0.001)
                goto LABEL_71;
              if (v65 == ++v67)
              {
                v65 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
                v13 = 1;
                if (v65)
                  goto LABEL_64;
                goto LABEL_73;
              }
            }
          }
          goto LABEL_72;
        }
        goto LABEL_51;
      }

    }
LABEL_51:
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v2, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v81;
LABEL_53:
      v56 = 0;
      while (1)
      {
        if (*(_QWORD *)v81 != v55)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v56), "floatValue");
        if (fabsf(v57 + -1.0) > 0.001)
          goto LABEL_71;
        if (v54 == ++v56)
        {
          v54 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
          v13 = 1;
          if (v54)
            goto LABEL_53;
          goto LABEL_73;
        }
      }
    }
    goto LABEL_72;
  }
  return 0;
}

@end
