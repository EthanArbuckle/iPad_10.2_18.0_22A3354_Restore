@implementation LTMExtractMetadata

- (LTMExtractMetadata)init
{
  LTMExtractMetadata *v2;
  LTMExtractMetadata *v3;
  LTMExtractMetadata *v4;
  NSObject *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)LTMExtractMetadata;
  v2 = -[LTMExtractMetadata init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_forceDisableLTMHazeCorrection = 0;
    *(_DWORD *)&v2->_forceDisableLTMFaceBoost = 0;
    v4 = v2;
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  return v3;
}

- (BOOL)extractFrom:(id)a3 toDriverInput:(sRefDriverInputs *)a4 ltmGeometry:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  unsigned int *p_height;
  void *v40;
  void *v41;
  const __CFDictionary *v42;
  const __CFDictionary *v43;
  int v44;
  double height;
  unsigned int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  float v59;
  unsigned int v60;
  _BOOL4 v61;
  void *v62;
  int v63;
  float v64;
  void *v65;
  unsigned __int16 v66;
  void *v67;
  void *v68;
  float v69;
  float v70;
  void *v71;
  float v72;
  float v73;
  void *v74;
  float v75;
  void *v76;
  void *v77;
  float v78;
  void *v79;
  void *v80;
  float v81;
  void *v82;
  unsigned __int8 v83;
  void *v84;
  void *v85;
  void *v86;
  float v87;
  _BOOL4 v88;
  _BOOL4 v89;
  void *v90;
  float v91;
  void *v92;
  _BOOL4 forceDisableHR;
  char v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  BOOL v106;
  NSObject *v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  CGRect rect;
  _QWORD v121[4];
  _QWORD v122[22];

  v122[20] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v116 = a5;
  v117 = v8;
  objc_msgSend(v8, "inMetaData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validBufferRect");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D30]);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D28]);
  v10 = objc_claimAutoreleasedReturnValue();
  v114 = (void *)v10;
  if (v115)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v110 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT);
    goto LABEL_111;
  }
  v12 = objc_msgSend(v115, "unsignedIntValue");
  v13 = objc_msgSend(v114, "unsignedIntValue");
  if (!v119
    || (objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("Width")),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("Height")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    v121[0] = CFSTR("X");
    v121[1] = CFSTR("Y");
    v122[0] = &unk_24FECE360;
    v122[1] = &unk_24FECE360;
    v121[2] = CFSTR("Width");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v122[2] = v16;
    v121[3] = CFSTR("Height");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v122[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, v121, 4);
    v18 = objc_claimAutoreleasedReturnValue();

    v119 = (void *)v18;
  }
  objc_msgSend(v116, "inputTextureSize");
  if (v19 == 0.0 || (objc_msgSend(v116, "inputTextureSize"), v20 == 0.0))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v110 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT);
LABEL_111:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_103:
    v106 = 0;
    goto LABEL_98;
  }
  objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("Width"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v23 = v22;
  objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("X"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v26 = v25;
  objc_msgSend(v116, "inputTextureSize");
  v28 = (float)(v23 + (float)(v26 * 2.0)) / v27;
  *(float *)&v28 = v28;
  objc_msgSend(v116, "setInputTextureDownsampleRatio:", v28);

  +[LTMExtractMetadata extractRectanglesFrom:validBufferRect:ltmGeometry:](LTMExtractMetadata, "extractRectanglesFrom:validBufferRect:ltmGeometry:", v9, v119, v116);
  a4->faceInfo.numFaces = 0;
  a4->faceInfo.rectArray[8] = 0u;
  a4->faceInfo.rectArray[9] = 0u;
  a4->faceInfo.rectArray[6] = 0u;
  a4->faceInfo.rectArray[7] = 0u;
  a4->faceInfo.rectArray[4] = 0u;
  a4->faceInfo.rectArray[5] = 0u;
  a4->faceInfo.rectArray[2] = 0u;
  a4->faceInfo.rectArray[3] = 0u;
  a4->faceInfo.rectArray[0] = 0u;
  a4->faceInfo.rectArray[1] = 0u;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C30]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v29;
  if (v29
    && (objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BE11B48]),
        (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v113 = v30;
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x24BE11B50]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31 && objc_msgSend(v31, "count"))
    {
      v33 = objc_msgSend(v32, "count");
      v34 = v33 >= 0xA ? 10 : v33;
      a4->faceInfo.numFaces = v34;
      if ((_DWORD)v34)
      {
        v35 = 0;
        v36 = *MEMORY[0x24BE11D50];
        v37 = (double)v12;
        v38 = (double)v13;
        p_height = &a4->faceInfo.rectArray[0].height;
        while (1)
        {
          objc_msgSend(v32, "objectAtIndexedSubscript:", v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (!v40)
          {
            fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v108 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_102;
          }
          objc_msgSend(v40, "objectForKeyedSubscript:", v36);
          v42 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          if (!v42 || !CGRectMakeWithDictionaryRepresentation(v42, &rect))
            break;
          v44 = (int)(rect.origin.y * v38);
          height = rect.size.height;
          v46 = (rect.size.width * v37);
          *(p_height - 3) = (int)(rect.origin.x * v37);
          *(p_height - 2) = v44;
          *(p_height - 1) = v46;
          *p_height = (height * v38);

          ++v35;
          p_height += 4;
          if (v34 == v35)
            goto LABEL_24;
        }
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v109 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_102:
        goto LABEL_103;
      }
    }
LABEL_24:

    v47 = v113;
  }
  else
  {
    v47 = 0;
  }
  a4->forceDisableFaceBoost = self->_forceDisableLTMFaceBoost;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D98]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (!v48)
    goto LABEL_113;
  a4->gainDigi = objc_msgSend(v48, "intValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11CF0]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
    goto LABEL_113;
  a4->luxLevel = (float)(int)objc_msgSend(v50, "intValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11B68]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
    goto LABEL_113;
  a4->gainAnal.v16 = objc_msgSend(v51, "unsignedShortValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C60]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
    goto LABEL_113;
  objc_msgSend(v52, "doubleValue");
  a4->exposureTime = (v53 * 1000000.0);
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11DB0]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
    goto LABEL_113;
  v55 = v54;
  a4->gainDigiSensor.v16 = objc_msgSend(v54, "unsignedShortValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D60]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "BOOLValue"))
  {

  }
  else
  {
    v57 = objc_msgSend(v117, "isSIFR");

    if ((v57 & 1) == 0)
    {
      a4->bracketingMode = 15;
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C00]);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        objc_msgSend(v58, "floatValue");
        v61 = 0;
        v60 = vcvts_n_u32_f32(exp2f(-v64), 8uLL);
      }
      else
      {
        v61 = 0;
        v60 = 256;
      }
      goto LABEL_40;
    }
  }
  a4->bracketingMode = 15;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D58]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v58, "floatValue");
    v60 = vcvts_n_u32_f32(exp2f(-v59), 8uLL);
    v61 = 1;
LABEL_40:
    v63 = 0;
    a4->bracketingExpRatio = v60;
    v62 = v58;
    goto LABEL_41;
  }
  v62 = 0;
  v61 = 1;
  v63 = 1;
LABEL_41:
  a4->isSIFRFrame = v61;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11CA8]);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  a4->HROn = objc_msgSend(v65, "BOOLValue");

  if (a4->HROn && !self->_forceDisableHR)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11CB0]);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v67)
    {
LABEL_113:
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v112 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_103;
    }
    v66 = objc_msgSend(v67, "unsignedShortValue");
    v62 = v67;
  }
  else
  {
    v66 = 4096;
  }
  a4->hrGainDownRatio = v66;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C58]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v68)
    goto LABEL_113;
  objc_msgSend(v68, "floatValue");
  v70 = v69;
  if (v61)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D58]);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "floatValue");
    v73 = v72;

    v70 = v70 - v73;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C00]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v74, "floatValue");
    v70 = v70 - v75;
  }
  a4->expBias = vcvts_n_s32_f32(exp2f(v70), 8uLL);
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D48]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = v76;
  if (v76)
  {
    objc_msgSend(v76, "floatValue");
    a4->realizedExpBias = vcvts_n_s32_f32(v78, 8uLL);
  }
  else
  {
    v63 = 1;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C68]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = v79;
  if (v79)
  {
    objc_msgSend(v79, "floatValue");
    a4->ev0Ratio = vcvts_n_s32_f32(v81, 8uLL);
  }
  else
  {
    v63 = 1;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D08]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v82, "isEqual:", *MEMORY[0x24BE11A50]) & 1) != 0)
  {
    v83 = 2;
  }
  else if (objc_msgSend(v82, "isEqual:", *MEMORY[0x24BE11A58]))
  {
    v83 = 2;
  }
  else
  {
    v83 = 0;
  }
  a4->channel = v83;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C98]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  a4->flashStatus = objc_msgSend(v84, "BOOLValue");

  a4->ltmProcMode = objc_msgSend(v117, "digitalFlash");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C78]);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = v85;
  if (v85)
  {
    objc_msgSend(v85, "floatValue");
    a4->faceExpRatioFiltered = v87;
  }
  else
  {
    v63 = 1;
  }
  if (self->_forceDisableLTMFaceExposureRatio)
    a4->faceExpRatioFiltered = 1.0;
  if (v63
    && !+[LTMExtractMetadata extractFromRawMetadata:toDriverInput:](LTMExtractMetadata, "extractFromRawMetadata:toDriverInput:", v9, a4))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v111 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_103;
  }
  +[LTMExtractMetadata extractCCMFromMetadata:toDriverInput:](LTMExtractMetadata, "extractCCMFromMetadata:toDriverInput:", v9, a4);
  v88 = +[LTMExtractMetadata isLocalCCMEnabled:](LTMExtractMetadata, "isLocalCCMEnabled:", a4);
  a4->useSpatialCCM = v88;
  if (v88
    && +[LTMExtractMetadata extractAWBMetadataFromMetadata:validBufferRect:toDriverInput:](LTMExtractMetadata, "extractAWBMetadataFromMetadata:validBufferRect:toDriverInput:", v9, v119, a4))
  {
    a4->useSpatialCCM = 0;
  }
  a4->overflowDGain = 256;
  a4->hdrRatio = 256;
  a4->panoExpRatio = 0;
  v89 = 1;
  a4->bLTMSingleFrameMode = 1;
  a4->isHLGMode = 0;
  a4->gammaCurve = 0;
  a4->useHighlightCompression = 0;
  a4->highlightCompressionGain = 1.0;
  LOBYTE(a4[1].flashMixPercentage[130]) = 0;
  if (!v61)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11B00]);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "floatValue");
    v89 = v91 < -1.0;

  }
  if (objc_msgSend(v117, "isAdaptiveHighlightCompressionEnabled"))
  {
    v92 = v117;
    if (!a4->HROn)
    {
      a4->useAdaptiveHighlightCompression = 1;
      goto LABEL_93;
    }
    forceDisableHR = self->_forceDisableHR;
    a4->useAdaptiveHighlightCompression = 1;
  }
  else
  {
    v92 = v117;
    if (!objc_msgSend(v117, "isHighlightCompressionEnabled") || !a4->HROn)
      goto LABEL_93;
    forceDisableHR = self->_forceDisableHR;
    v94 = self->_forceDisableHR || v89;
    if ((v94 & 1) == 0)
    {
      if (self->_forceHighlightCompressionForEveryFrame)
        goto LABEL_86;
      goto LABEL_93;
    }
  }
  if (!forceDisableHR)
  {
LABEL_86:
    AuxCompute_CalcExposureRatio(a4);
    if (a4->useAdaptiveHighlightCompression)
    {
      v96 = v95;
      v92 = v117;
      objc_msgSend(v117, "adaptiveHCSlope");
      v98 = 1.8;
      if (!v89)
        v98 = 1.0;
      v99 = fmaxf(v98, fminf(v96 / v97, 4.0));
      if (v99 > 1.0)
      {
        a4->useHighlightCompression = 1;
        a4->highlightCompressionGain = v99;
      }
    }
    else
    {
      a4->useHighlightCompression = 1;
      a4->highlightCompressionGain = 2.0;
      v92 = v117;
    }
  }
LABEL_93:
  a4->hardIspDGain = 1.0;
  v100 = (float)a4->gainDigi * 0.0039062;
  a4->softIspDGain = v100;
  objc_msgSend(v92, "ispDGainThreshold");
  if (v100 > v101)
  {
    objc_msgSend(v117, "ispDGainThreshold");
    a4->hardIspDGain = (float)((float)a4->gainDigi * 0.0039062) / v102;
    a4->softIspDGain = v102;
  }
  AuxCompute_CalcExposureRatio(a4);
  if ((float)(v103 / a4->hardIspDGain) > 80.0)
  {
    v104 = v103 / 80.0;
    v105 = (float)((float)a4->gainDigi * 0.0039062) / v104;
    a4->hardIspDGain = v104;
    a4->softIspDGain = v105;
  }
  a4->LTMHazeCorrectionOff = self->_forceDisableLTMHazeCorrection;
  a4->useBt709 = self->_forceUseBt709;
  a4->useHazeCorrection = 0;

  v106 = 1;
LABEL_98:

  return v106;
}

+ (BOOL)isLocalCCMEnabled:(sRefDriverInputs *)a3
{
  return a3->channel == 2 && a3->faceInfo.numFaces != 0;
}

+ (void)extractRectanglesFrom:(id)a3 validBufferRect:(id)a4 ltmGeometry:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  float v11;
  float v12;
  void *v13;
  unsigned int v14;
  float v15;
  float v16;
  void *v17;
  unsigned int v18;
  float v19;
  float v20;
  void *v21;
  unsigned int v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  double v28;
  const __CFDictionary *v29;
  const __CFDictionary *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  double v42;
  float v43;
  float v44;
  double v45;
  double v46;
  float v47;
  float v48;
  float v49;
  float v50;
  double height;
  float v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _BOOL4 v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double width;
  double y;
  double v72;
  double x;
  double v74;
  id v75;
  __int128 v76;
  __int128 v77;
  CGRect rect;

  v75 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("X"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");
  objc_msgSend(v8, "inputTextureDownsampleRatio");
  v12 = v11;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Y"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");
  objc_msgSend(v8, "inputTextureDownsampleRatio");
  v16 = v15;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Width"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntValue");
  objc_msgSend(v8, "inputTextureDownsampleRatio");
  v20 = v19;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Height"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntValue");
  objc_msgSend(v8, "inputTextureDownsampleRatio");
  v24 = v23;

  v76 = *MEMORY[0x24BDBF070];
  v77 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  LODWORD(v21) = FigCFDictionaryGetCGRectIfPresent();
  if ((v21 & FigCFDictionaryGetCGRectIfPresent() & 1) != 0)
  {
    objc_msgSend(v8, "setDeepZoomOrigin:", v76);
    objc_msgSend(v8, "inputTextureDownsampleRatio");
    v25 = *((double *)&v77 + 1);
    v26 = v25 / *((double *)&v77 + 1);
    *(float *)&v28 = v27 / v26;
    objc_msgSend(v8, "setInputTextureDownsampleRatio:", v28);
  }
  else
  {
    objc_msgSend(v8, "setDeepZoomOrigin:", 0.0, 0.0);
  }
  objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x24BE11AA0]);
  v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v31 = (float)((float)v10 / v12);
  v32 = (float)((float)v14 / v16);
  v33 = (float)((float)v18 / v20);
  v34 = (float)((float)v22 / v24);
  v74 = v31;
  v35 = v32;
  v36 = v33;
  v37 = v34;
  if (v29)
  {
    v35 = v32;
    v36 = v33;
    v37 = v34;
    if (CGRectMakeWithDictionaryRepresentation(v29, &rect))
    {
      objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x24BE11D30]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "unsignedIntValue");

      objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x24BE11D28]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "unsignedIntValue");

      x = rect.origin.x;
      objc_msgSend(v8, "deepZoomOrigin");
      v72 = v42;
      objc_msgSend(v8, "inputTextureDownsampleRatio");
      v44 = v43;
      y = rect.origin.y;
      objc_msgSend(v8, "deepZoomOrigin");
      v46 = v45;
      objc_msgSend(v8, "inputTextureDownsampleRatio");
      v48 = v47;
      width = rect.size.width;
      objc_msgSend(v8, "inputTextureDownsampleRatio");
      v50 = v49;
      height = rect.size.height;
      objc_msgSend(v8, "inputTextureDownsampleRatio");
      v31 = round(-(v72 - x * (double)v39) / v44);
      v35 = round(-(v46 - y * (double)v41) / v48);
      v36 = round(width * (double)v39 / v50);
      v37 = round(height * (double)v41 / v52);
    }
  }
  objc_msgSend(v8, "inputTextureSize");
  v54 = v53;
  objc_msgSend(v8, "inputTextureSize");
  v56 = v54 / v55;
  *(float *)&v55 = v36 / v37;
  if (v56 <= *(float *)&v55)
  {
    v57 = v37 * v56;
    v58 = v37;
  }
  else
  {
    v57 = v36;
    v58 = v36 / v56;
  }
  if (v57 >= 16.0)
    v59 = v57;
  else
    v59 = 16.0;
  if (v58 >= 16.0)
    v60 = v58;
  else
    v60 = 16.0;
  v61 = v37 - v60 > 2.0;
  if (v36 - v59 > 2.0)
    v61 = 1;
  if (v57 < 16.0)
    v61 = 1;
  if (v58 < 16.0)
    v61 = 1;
  if (v61)
    v62 = v59;
  else
    v62 = v36;
  if (v61)
    v63 = v60;
  else
    v63 = v37;
  v64 = round(v62 * 0.5);
  v65 = round(v63 * 0.5);
  v66 = v64 + v64;
  v67 = v65 + v65;
  v68 = round((v31 + (v36 - (v64 + v64)) * 0.5) * 0.5);
  v69 = round((v35 + (v37 - (v65 + v65)) * 0.5) * 0.5);
  objc_msgSend(v8, "setCropRect:sourceRect:", v68 + v68, v69 + v69, v66, v67, v74, v32, v33, v34);

}

+ (int)extractAWBMetadataFromMetadata:(id)a3 validBufferRect:(id)a4 toDriverInput:(sRefDriverInputs *)a5
{
  id v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int16 *flashMixPercentage;
  uint64_t i;
  int v39;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;

  v7 = a3;
  v44 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SpatialCCMOutputMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[LTMExtractMetadata getTileStatsRegion:validBufferRect:toDriverInput:](LTMExtractMetadata, "getTileStatsRegion:validBufferRect:toDriverInput:", v7, v44, a5))goto LABEL_28;
  v9 = (uint64_t *)MEMORY[0x24BE11B88];
  if (!v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11BD0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11BC8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11BB8]);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v18)
      v25 = v21 == 0;
    else
      v25 = 1;
    if (v25 || v23 == 0)
    {
      a5->fdAWBChistMixFactor = 0;
      objc_msgSend(v7, "objectForKeyedSubscript:", *v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(unsigned __int16 *)((char *)&a5->awbGains.b.v16 + 1) = objc_msgSend(v27, "unsignedShortValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11B78]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(unsigned __int16 *)((char *)&a5->awbGainsSkinOnly.gb.v16 + 1) = objc_msgSend(v28, "unsignedShortValue");

    }
    else
    {
      a5->fdAWBChistMixFactor = objc_msgSend(v18, "unsignedIntValue");
      *(unsigned __int16 *)((char *)&a5->awbGains.b.v16 + 1) = objc_msgSend(v21, "unsignedShortValue");
      *(unsigned __int16 *)((char *)&a5->awbGainsSkinOnly.gb.v16 + 1) = objc_msgSend(v24, "unsignedShortValue");
    }

    goto LABEL_20;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FdAWBChistMixFactor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_28;
  a5->fdAWBChistMixFactor = objc_msgSend(v10, "intValue");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AwbColorspace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12
    || (a5->awbColorspace = objc_msgSend(v12, "unsignedCharValue"),
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IsLEDMainFlashforAWB")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
LABEL_28:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v41 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v30 = v44;
LABEL_34:
    v39 = -1;
    goto LABEL_27;
  }
  a5->isLEDMainFlashforAWB = objc_msgSend(v13, "BOOLValue");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AwbGainsSkinOnly"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_31;
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(unsigned __int16 *)((char *)&a5->awbGains.b.v16 + 1) = objc_msgSend(v16, "intValue");

  objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(unsigned __int16 *)((char *)&a5->awbGainsSkinOnly.gb.v16 + 1) = objc_msgSend(v17, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AwbGainsFlashProj"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_31:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v42 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v30 = v44;
    goto LABEL_34;
  }
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(unsigned __int16 *)((char *)&a5->awbGainsSkinOnly.b.v16 + 1) = objc_msgSend(v19, "intValue");

  objc_msgSend(v18, "objectAtIndexedSubscript:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(unsigned __int16 *)((char *)&a5->awbGainsFlashProj.gb.v16 + 1) = objc_msgSend(v20, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FlashProjMixWeighting"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v43 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v30 = v44;
    goto LABEL_34;
  }
  objc_msgSend(v21, "floatValue");
  a5->flashProjMixWeighting = v22;
LABEL_20:

  v29 = *v9;
  v30 = v44;
  objc_msgSend(v7, "objectForKeyedSubscript:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(_WORD *)(&a5->isLEDMainFlashforAWB + 1) = objc_msgSend(v31, "unsignedShortValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11B78]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  *(unsigned __int16 *)((char *)&a5->awbGains.gb.v16 + 1) = objc_msgSend(v32, "unsignedShortValue");

  bzero(a5->flashMixPercentage, 0x400uLL);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11C88]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = objc_retainAutorelease(v33);
    v35 = objc_msgSend(v34, "bytes");
    v36 = 0;
    flashMixPercentage = a5->flashMixPercentage;
    do
    {
      for (i = 0; i != 16; ++i)
        flashMixPercentage[i] = *(_WORD *)(v35 + i * 2);
      ++v36;
      flashMixPercentage += 16;
      v35 += 64;
    }
    while (v36 != 16);

  }
  v39 = 0;
LABEL_27:

  return v39;
}

+ (BOOL)getTileStatsRegion:(id)a3 validBufferRect:(id)a4 toDriverInput:(sRefDriverInputs *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  unsigned int width;
  uint64_t v19;
  void *v20;
  unsigned int height;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  const __CFDictionary *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  float v29;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unsigned int v38;
  signed int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v47;
  id v48;
  int v49;
  int v50;
  CGRect v51;
  CGRect rect;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v48 = v8;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SpatialCCMOutputMetadata"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Width"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v10, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Height"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v11, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("X"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Y"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    v16 = *MEMORY[0x24BE11D30];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11D30]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v9;
    width = objc_msgSend(v17, "unsignedIntValue");

    v19 = *MEMORY[0x24BE11D28];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11D28]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    height = objc_msgSend(v20, "unsignedIntValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11D90]);
    v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && CGRectMakeWithDictionaryRepresentation(v22, &rect))
    {
      width = rect.size.width;
      height = rect.size.height;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE11AA0]);
    v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && CGRectMakeWithDictionaryRepresentation(v24, &v51))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "unsignedIntValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = objc_msgSend(v28, "unsignedIntValue");

      v49 = (int)(v51.size.height * (double)v26);
      v50 = (int)(v51.size.width * (double)v27);
      v13 = (int)(v51.origin.x * (double)v27);
      v15 = (int)(v51.origin.y * (double)v26);
    }
    v29 = sqrtf((float)((float)height * (float)width) / 199580.0);
    if (v29 <= 8.0 || v29 > 12.0)
    {
      if (v29 <= 12.0)
        v31 = 8;
      else
        v31 = 16;
    }
    else
    {
      v31 = 12;
    }
    v32 = (double)(v13 / v31);
    v33 = (double)(v15 / v31);
    v34 = (double)(v50 / v31);
    v35 = (double)(v49 / v31);
    v36 = v34 * 0.975 * 0.03125;
    if (v36 < 4.0)
      v36 = 4.0;
    v37 = v35 * 0.975 * 0.03125;
    if (v37 < 4.0)
      v37 = 4.0;
    v38 = v37;
    v39 = (32 * v36 + 96) & 0x1FFF80;
    v40 = v32 + floor((v34 - (double)v39) * 0.25) * 2.0;
    if (v40 < 0.0)
      v40 = 0.0;
    v41 = (double)v31;
    a5->tileStatsRegionInRaw.x = (int)(v40 * (double)v31);
    v42 = (double)((32 * v38 + 96) & 0x1FFF80);
    v43 = v33 + floor((v35 - v42) * 0.25) * 2.0;
    if (v43 < 0.0)
      v43 = 0.0;
    a5->tileStatsRegionInRaw.y = (int)(v43 * v41);
    v44 = v32 + v34;
    if (v44 > (double)v39)
      v44 = (double)v39;
    a5->tileStatsRegionInRaw.width = (v44 * v41);
    v45 = v33 + v35;
    if (v33 + v35 > v42)
      v45 = (double)((32 * v38 + 96) & 0x1FFF80);
    a5->tileStatsRegionInRaw.height = (v45 * v41);

    v8 = v48;
  }

  return v7 != 0;
}

+ (BOOL)extractCCMFromMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  uint64_t v13;
  int64x2_t v14;
  uint64x2_t v15;
  int64x2_t v16;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE11C10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (v8 = objc_retainAutorelease(v6), v9 = objc_msgSend(v8, "bytes"), v10 = objc_msgSend(v8, "length"), v9)
    && v10 == 36)
  {
    for (i = 0; i != 9; ++i)
      a4->ccm.coeff[i].v16 = vcvts_n_s32_f32(*(float *)(v9 + 4 * i), 0xCuLL);
    v12 = 1;
  }
  else
  {
    v13 = 0;
    v14 = (int64x2_t)xmmword_23092D460;
    v15 = (uint64x2_t)vdupq_n_s64(9uLL);
    v16 = vdupq_n_s64(2uLL);
    do
    {
      if ((vmovn_s64((int64x2_t)vcgtq_u64(v15, (uint64x2_t)v14)).u8[0] & 1) != 0)
        a4->ccm.coeff[v13].v16 = (v13 / 3u == v13 % 3u) << 12;
      if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(9uLL), *(uint64x2_t *)&v14)).i32[1] & 1) != 0)
        a4->ccm.coeff[v13 + 1].v16 = ((v13 | 1u) / 3 == (v13 | 1u) % 3) << 12;
      v13 += 2;
      v14 = vaddq_s64(v14, v16);
    }
    while (v13 != 10);
    v12 = 0;
  }

  return v12;
}

+ (BOOL)extractFromRawMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4
{
  return 0;
}

+ (BOOL)extractAWBMetadataFromRawMetadata:(id)a3 toDriverInput:(sRefDriverInputs *)a4
{
  return 0;
}

@end
