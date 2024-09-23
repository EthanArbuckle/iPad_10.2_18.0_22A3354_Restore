@implementation AXSSMotionTrackingExpressionConfiguration_Exclave

- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)processIncomingExpressions:(SEL)a3
{
  $AA6A45B2DFCED8527C3A0E9A46B0D48F *v5;
  float var3;
  float var11;
  float var12;
  float var13;
  void *v10;
  uint64_t i;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  double v33;
  double v34;
  float v35;
  float v36;
  float v37;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v42;
  _BOOL4 v44;
  _BOOL4 v45;
  _BOOL4 v47;
  _BOOL4 v48;
  _BOOL4 v50;
  _BOOL4 v51;
  _BOOL4 v53;
  _BOOL4 v55;
  BOOL v57;
  BOOL v58;
  int v59;
  unint64_t v60;
  __int128 v61;
  __int128 v62;
  float var4;
  uint64_t v65;
  float v66;
  float v67;
  float v68;
  $AA6A45B2DFCED8527C3A0E9A46B0D48F *v69;
  float var0;
  uint64_t v71;
  int v72;
  _BOOL4 v73;
  _BOOL4 v74;
  _BOOL4 v75;
  _BOOL4 v76;
  float v77;
  float v78;
  float v79;
  float var10;
  float var9;
  float var8;
  float var7;
  float var6;
  float var5;
  float var2;
  float var1;
  _OWORD v88[4];
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  uint64_t v104;

  v5 = retstr;
  v104 = *MEMORY[0x1E0C80C00];
  var0 = a4->var0;
  var3 = a4->var3;
  var2 = a4->var2;
  var1 = a4->var1;
  var4 = a4->var4;
  var6 = a4->var6;
  var5 = a4->var5;
  var8 = a4->var8;
  var7 = a4->var7;
  var11 = a4->var11;
  var10 = a4->var10;
  var9 = a4->var9;
  var12 = a4->var12;
  var13 = a4->var13;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  retstr->var8 = 0;
  v10 = (void *)objc_opt_class();
  if (v10)
  {
    objc_msgSend(v10, "_emptyAccessibilityExpressions");
  }
  else
  {
    v5->var8 = 0;
    *(_OWORD *)&v5->var4 = 0u;
    *(_OWORD *)&v5->var6 = 0u;
    *(_OWORD *)&v5->var0 = 0u;
    *(_OWORD *)&v5->var2 = 0u;
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v71 = objc_msgSend(&unk_1E5FA8788, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
  if (v71)
  {
    v65 = *(_QWORD *)v100;
    v69 = v5;
    v67 = var12;
    v68 = var11;
    v66 = var13;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v100 != v65)
          objc_enumerationMutation(&unk_1E5FA8788);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * i), "unsignedIntegerValue");
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 3, v12);
        v14 = v13;
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 2, v12);
        v16 = v15;
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 1, v12);
        v18 = v17;
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 0, v12);
        v20 = v19;
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 4, v12);
        v22 = v21;
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 5, v12);
        v24 = v23;
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 6, v12);
        v79 = v25;
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 7, v12);
        v78 = v26;
        objc_msgSend((id)objc_opt_class(), "_minConfidenceExpressionStarted:forActivation:", 8, v12);
        v77 = v27;
        v28 = var2 > v16 && var1 > v16;
        v29 = var6 > v20 && var5 > v20;
        v30 = var8 > v22 && var7 > v22;
        v31 = var10 > v24;
        if (var9 <= v24)
          v31 = 0;
        v75 = v30;
        v76 = v31;
        v73 = v28;
        v74 = v29;
        if (var3 <= v18)
        {
          v72 = 0;
        }
        else
        {
          v32 = (void *)objc_opt_class();
          *(float *)&v33 = var3;
          *(float *)&v34 = var4;
          v72 = objc_msgSend(v32, "_jawOpenStartingWithValue:mouthClose:forActivation:", v12, v33, v34);
        }
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        -[AXSSMotionTrackingExpressionConfiguration_Exclave previousExpressions](self, "previousExpressions");
        v35 = v20 * 0.375;
        v36 = v22 * 0.95;
        v37 = v24 * 0.65;
        v39 = var1 > (float)(v16 * 0.61538) && v98 >= v12;
        v40 = var2 > (float)(v16 * 0.61538) && v39;
        v42 = var3 > (float)(v18 * 0.5) && v97 >= v12;
        v44 = var5 > v35 && v95 >= v12;
        v45 = var6 > v35 && v44;
        v47 = var8 > v36 && v94 >= v12;
        v48 = var7 > v36 && v47;
        v50 = var10 > v37 && v93 >= v12;
        v51 = var9 > v37 && v50;
        v53 = v66 > (float)(v79 * 0.6) && v92 >= v12;
        v55 = v67 > (float)(v77 * 0.6) && v90 >= v12;
        v57 = v68 > (float)(v78 * 0.6) && v91 >= v12;
        v58 = var0 > (float)(v14 * 0.1) && v96 >= v12;
        v59 = var0 > v14;
        if (v58)
          v59 = 1;
        v5 = v69;
        if (v73 || v40)
          v69->var2 = v12;
        if ((v72 & ~v59 | v42) == 1)
          v69->var1 = v12;
        if (v59)
          v69->var3 = v12;
        if (v74 || v45)
          v69->var0 = v12;
        if (v75 || v48)
          v69->var4 = v12;
        if (v76 || v51)
          v69->var5 = v12;
        if (v67 > v77)
          v55 = 1;
        if (v55)
          v69->var7 = v12;
        if (v68 > v78)
          v57 = 1;
        if (v57)
        {
          v69->var8 = v12;
          v60 = v12;
        }
        else
        {
          v60 = v69->var8;
        }
        if (v66 > v79)
          v53 = 1;
        if (!v69->var7 && !v60 && v53)
          v69->var6 = v12;
      }
      v71 = objc_msgSend(&unk_1E5FA8788, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
    }
    while (v71);
  }
  v61 = *(_OWORD *)&v5->var6;
  v88[2] = *(_OWORD *)&v5->var4;
  v88[3] = v61;
  v89 = v5->var8;
  v62 = *(_OWORD *)&v5->var2;
  v88[0] = *(_OWORD *)&v5->var0;
  v88[1] = v62;
  return ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)-[AXSSMotionTrackingExpressionConfiguration_Exclave setPreviousExpressions:](self, "setPreviousExpressions:", v88);
}

+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)_emptyAccessibilityExpressions
{
  retstr->var8 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return result;
}

+ (float)_minConfidenceExpressionStarted:(unint64_t)a3 forActivation:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;

  objc_msgSend((id)objc_opt_class(), "_facialExpressionToActivationToValueMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  return v12;
}

+ (id)_facialExpressionToActivationToValueMapping
{
  if (_facialExpressionToActivationToValueMapping_onceToken != -1)
    dispatch_once(&_facialExpressionToActivationToValueMapping_onceToken, &__block_literal_global_4);
  return (id)_facialExpressionToActivationToValueMapping_facialExpressionToSensitivityToValueMapping;
}

+ (BOOL)_jawOpenStartingWithValue:(float)a3 mouthClose:(float)a4 forActivation:(unint64_t)a5
{
  float v5;

  v5 = vabds_f32(a3, a4);
  if (a5 - 1 <= 1)
    return v5 >= 0.05;
  return v5 >= 0.1 && a5 == 3;
}

- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)previousExpressions
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->var3;
  v4 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->var6 = v4;
  retstr->var8 = self[1].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setPreviousExpressions:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_previousExpressions.raiseEyebrows = *(_OWORD *)&a3->var0;
  v3 = *(_OWORD *)&a3->var2;
  v4 = *(_OWORD *)&a3->var4;
  v5 = *(_OWORD *)&a3->var6;
  self->_previousExpressions.puckerLipsRight = a3->var8;
  *(_OWORD *)&self->_previousExpressions.mouthPuckerCenter = v5;
  *(_OWORD *)&self->_previousExpressions.eyeBlink = v4;
  *(_OWORD *)&self->_previousExpressions.smile = v3;
}

@end
