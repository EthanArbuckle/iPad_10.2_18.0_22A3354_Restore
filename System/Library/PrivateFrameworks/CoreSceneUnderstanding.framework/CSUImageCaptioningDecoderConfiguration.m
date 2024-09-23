@implementation CSUImageCaptioningDecoderConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1)
    return 1;
  else
    return a3;
}

+ (id)CSUImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](CSUImageCaptioningDecoderConfiguration, sel_CSUImageCaptioningDecoderConfigurationForRevision_saveDecoderFeatures_error_, a3, 0, a4);
}

+ (id)CSUImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 saveDecoderFeatures:(BOOL)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *IsPrecompiled_runtimeParamsPath;
  uint64_t v34;
  void *v35;
  const char *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  id v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  __int16 v69;
  const __CFString *v70;
  void *v71;
  void *v73;

  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = objc_opt_class();
  objc_msgSend_bundleForClass_(v8, v10, v9, v11, v12);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15);
  v20 = v16;
  switch(v16)
  {
    case 1:
      objc_msgSend_pathForResource_ofType_inDirectory_(v73, v17, (uint64_t)CFSTR("ImageCaptioning-ax_v1.0.0_decoder_quantized"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("ImageCaptioning-ax_v1.0.0"));
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend_pathForResource_ofType_inDirectory_(v73, v36, (uint64_t)CFSTR("ImageCaptioning-ax_v1.0.0.reverse_vocab"), (uint64_t)CFSTR("json"), (uint64_t)CFSTR("ImageCaptioning-ax_v1.0.0"));
      v37 = CFSTR("att_feats_placeholder");
      v70 = CFSTR("in_word_ids");
      v38 = CFSTR("word_probs");
      v39 = 0;
      v40 = 0;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)v34;
      v43 = &unk_250B1CD50;
LABEL_7:
      v59 = objc_alloc((Class)a1);
      HIBYTE(v69) = a4;
      LOBYTE(v69) = 0;
      IsPrecompiled_runtimeParamsPath = (void *)objc_msgSend_initImageCaptioningDecoderConfigurationForRevision_runtimeEngine_espressoNetPath_vocabularyModelPath_inputEncodedFeaturesTensorName_inputWordIdsTensorName_outputWordProbsTensorName_decoderEmbeddingShape_decoderInputSeqShape_decoderIsPrecompiled_saveDecoderFeatures_bridgeNetworkPath_inputEncodedFeaturesTensorNameOfBridge_outputTensorNameOfBridge_bridgeInputShape_bridgeIsPrecompiled_runtimeParamsPath_(v59, v60, v20, 1, (uint64_t)v42, v41, v37, v70, v38, 0, v43, v69, v35, v40, v39, 0, 0, 0);
      v21 = v73;
      goto LABEL_11;
    case 6:
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("video_captioning/%@"), v18, v19, CFSTR("VideoCaptioning_v3.0.0_nm8r5qngqf-94830"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v45, (uint64_t)CFSTR("%@_bridge_quant"), v46, v47, CFSTR("VideoCaptioning_v3.0.0_nm8r5qngqf-94830"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v48, (uint64_t)CFSTR("%@_decoder_quant"), v49, v50, CFSTR("VideoCaptioning_v3.0.0_nm8r5qngqf-94830"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v52, (uint64_t)CFSTR("%@.reverse_vocab"), v53, v54, CFSTR("VideoCaptioning_v3.0.0_nm8r5qngqf-94830"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathForResource_ofType_inDirectory_(v73, v56, (uint64_t)v71, (uint64_t)CFSTR("espresso.net"), (uint64_t)v44);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathForResource_ofType_inDirectory_(v73, v57, (uint64_t)v51, (uint64_t)CFSTR("espresso.net"), (uint64_t)v44);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathForResource_ofType_inDirectory_(v73, v58, (uint64_t)v55, (uint64_t)CFSTR("json"), (uint64_t)v44);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = CFSTR("input_seq");
      v38 = CFSTR("captioning_decoder/word_probs");
      v40 = CFSTR("encoder_embed");
      v39 = CFSTR("image_encoder_head/out");
      v43 = &unk_250B1CD68;
      v37 = CFSTR("encoder_embed");
      goto LABEL_7;
    case 7:
      v21 = v73;
      objc_msgSend_pathForResource_ofType_(v73, v17, (uint64_t)CFSTR("image_captioning"), (uint64_t)&stru_250B0F248, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v22, v23, (uint64_t)CFSTR("ImageCaptioningMD4_s3xsc4vvsa-34701"), v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v26, v27, (uint64_t)CFSTR("ImageCaptioning.config.json"), v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(a1, v31, (uint64_t)v30, (uint64_t)a5, v32);
      IsPrecompiled_runtimeParamsPath = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      if (!a5)
      {
        v35 = 0;
        v41 = 0;
        v42 = 0;
        IsPrecompiled_runtimeParamsPath = 0;
        v21 = v73;
        goto LABEL_11;
      }
      v61 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v17, a3, v18, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v61, v62, (uint64_t)CFSTR("Unsupported captioning image decoder revision %@"), v63, v64, v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v73;
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v65, (uint64_t)v26, v66, v67);
      IsPrecompiled_runtimeParamsPath = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }

  v35 = 0;
  v41 = 0;
  v42 = 0;
LABEL_11:

  return IsPrecompiled_runtimeParamsPath;
}

+ (id)createCSUImageCaptioningDecoderConfigurationWithConfigPath:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  char v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  _BOOL4 v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  BOOL v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  _BOOL4 v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  BOOL v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  char isEqualToString;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v131 = v6;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8, v9, v10);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_fileExistsAtPath_(v130, v11, (uint64_t)v6, v12, v13);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("decoder config file does not exist at path %@"), v16, v17, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v19, v14, (uint64_t)a4, (uint64_t)v18);

  if ((v20 & 1) != 0)
  {
    objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v21, (uint64_t)v6, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v25, v24 != 0, (uint64_t)a4, (uint64_t)CFSTR("decoder config path could not be read!")) & 1) != 0)
    {
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v26, (uint64_t)v24, 0, (uint64_t)a4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v28, v27 != 0, (uint64_t)a4, (uint64_t)CFSTR("decoder config path could not be read!")))
      {
        v129 = v24;
        v33 = (void *)objc_msgSend_mutableCopy(MEMORY[0x24BDBD1A8], v29, v30, v31, v32);
        v127 = a1;
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_250B1CD80, v34, (uint64_t)&v132, (uint64_t)v136, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v133;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v133 != v40)
                objc_enumerationMutation(&unk_250B1CD80);
              v42 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * i);
              objc_msgSend_valueForKey_(v27, v35, v42, v37, v38);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v43 == 0;

              if (v44)
                objc_msgSend_addObject_(v33, v35, v42, v37, v38);
            }
            v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_250B1CD80, v35, (uint64_t)&v132, (uint64_t)v136, 16);
          }
          while (v39);
        }
        if (objc_msgSend_count(v33, v35, v36, v37, v38))
        {
          if (!a4)
          {
            v58 = 0;
LABEL_38:

            v24 = v129;
            goto LABEL_39;
          }
          v49 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_componentsJoinedByString_(v33, v45, (uint64_t)CFSTR(", "), v47, v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v49, v51, (uint64_t)CFSTR("decoder config missing params: %@"), v52, v53, v50);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v55, (uint64_t)v54, v56, v57);
          v58 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend_stringByDeletingLastPathComponent(v131, v45, v46, v47, v48);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v27, v59, (uint64_t)CFSTR("decoderNetworkPath"), v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingPathComponent_(v54, v63, (uint64_t)v62, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectForKeyedSubscript_(v27, v67, (uint64_t)CFSTR("decoderNetworkParams"), v68, v69);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v27, v70, (uint64_t)CFSTR("vocabularyPath"), v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingPathComponent_(v54, v74, (uint64_t)v73, v75, v76);
          v125 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectForKeyedSubscript_(v27, v77, (uint64_t)CFSTR("bridgeNetworkPath"), v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v80 == 0;

          if (v81)
          {
            v128 = 0;
            v124 = 0;
          }
          else
          {
            objc_msgSend_objectForKeyedSubscript_(v27, v82, (uint64_t)CFSTR("bridgeNetworkPath"), v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByAppendingPathComponent_(v54, v86, (uint64_t)v85, v87, v88);
            v128 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectForKeyedSubscript_(v27, v89, (uint64_t)CFSTR("bridgeNetworkParams"), v90, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v92 == 0;

            if (v93)
            {
              objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v94, (uint64_t)CFSTR("bridge network params missing"), 0, v96);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend_objectForKeyedSubscript_(v27, v94, (uint64_t)CFSTR("bridgeNetworkParams"), v95, v96);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_objectForKeyedSubscript_(v27, v82, (uint64_t)CFSTR("runtime"), v83, v84);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v97 == 0;

          if (v98)
          {
            v107 = 0;
          }
          else
          {
            objc_msgSend_objectForKeyedSubscript_(v27, v99, (uint64_t)CFSTR("runtime"), v100, v101);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v102, v103, (uint64_t)CFSTR("E1"), v104, v105);

            if ((isEqualToString & 1) != 0)
            {
              v107 = 1;
            }
            else
            {
              objc_msgSend_objectForKeyedSubscript_(v27, v99, (uint64_t)CFSTR("runtime"), v100, v101);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_msgSend_isEqualToString_(v108, v109, (uint64_t)CFSTR("AX"), v110, v111);

              if ((v112 & 1) != 0)
              {
                v107 = 3;
              }
              else
              {
                objc_msgSend_objectForKeyedSubscript_(v27, v99, (uint64_t)CFSTR("runtime"), v100, v101);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                v117 = objc_msgSend_isEqualToString_(v113, v114, (uint64_t)CFSTR("E5"), v115, v116);

                if (v117)
                  v107 = 2;
                else
                  v107 = 0;
              }
            }
          }
          objc_msgSend_objectForKeyedSubscript_(v27, v99, (uint64_t)CFSTR("runtimeParamsPath"), v100, v101);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          if (v121)
          {
            objc_msgSend_stringByAppendingPathComponent_(v54, v118, (uint64_t)v121, v119, v120);
            v122 = objc_claimAutoreleasedReturnValue();

            v121 = (void *)v122;
          }
          objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithDecoderEspressoPath_decoderNetworkParams_bridgeNetworkPath_bridgeNetworkParams_vocabularyPath_useRuntimeEngine_runtimeParamsPath_error_(v127, v118, (uint64_t)v66, (uint64_t)v126, (uint64_t)v128, v124, v125, v107, v121, a4);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_38;
      }
    }
    else
    {
      v27 = 0;
    }
    v58 = 0;
LABEL_39:

    goto LABEL_40;
  }
  v58 = 0;
LABEL_40:

  return v58;
}

+ (id)createCSUImageCaptioningDecoderConfigurationWithDecoderEspressoPath:(id)a3 decoderNetworkParams:(id)a4 bridgeNetworkPath:(id)a5 bridgeNetworkParams:(id)a6 vocabularyPath:(id)a7 useRuntimeEngine:(int64_t)a8 runtimeParamsPath:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *IsPrecompiled_runtimeParamsPath;
  int hasSuffix;
  int64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned __int8 v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  void *v126;
  char v127;
  void *v128;
  id v129;
  uint64_t v130;
  id v132;
  id v133;
  id v134;
  void *v135;
  id v136;

  v134 = a3;
  v15 = a4;
  v136 = a5;
  v16 = a6;
  v133 = a7;
  v132 = a9;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v17, v18, v19, v20);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_mutableCopy(MEMORY[0x24BDBD1A8], v21, v22, v23, v24);
  if ((objc_msgSend_fileExistsAtPath_(v135, v26, (uint64_t)v134, v27, v28) & 1) == 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v29, (uint64_t)CFSTR("decoder network file does not exist %@"), v30, v31, v134);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v25, v33, (uint64_t)v32, v34, v35);

  }
  if ((objc_msgSend_fileExistsAtPath_(v135, v29, (uint64_t)v133, v30, v31) & 1) == 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v36, (uint64_t)CFSTR("vocabulary file does not exist %@"), v37, v38, v133);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v25, v40, (uint64_t)v39, v41, v42);

  }
  objc_msgSend_valueForKey_(v15, v36, (uint64_t)CFSTR("inputEncodedFeaturesTensorName"), v37, v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
    objc_msgSend_addObject_(v25, v44, (uint64_t)CFSTR("decoder config missing params: inputEncodedFeaturesTensorName"), v45, v46);
  objc_msgSend_valueForKey_(v15, v44, (uint64_t)CFSTR("inputWordIdsTensorName"), v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
    objc_msgSend_addObject_(v25, v48, (uint64_t)CFSTR("decoder config missing params: inputWordIdsTensorName"), v49, v50);
  objc_msgSend_valueForKey_(v15, v48, (uint64_t)CFSTR("outputWordProbsTensorName"), v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
    objc_msgSend_addObject_(v25, v52, (uint64_t)CFSTR("decoder config missing params: outputWordProbsTensorName"), v54, v55);
  if (v136)
  {
    if ((objc_msgSend_fileExistsAtPath_(v135, v52, (uint64_t)v136, v54, v55) & 1) == 0)
      v59 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v56, (uint64_t)CFSTR("bridge network file does not exist %@"), v57, v58, v136);
    objc_msgSend_valueForKey_(v16, v56, (uint64_t)CFSTR("inputEncodedFeaturesTensorNameOfBridge"), v57, v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v60)
      objc_msgSend_addObject_(v25, v61, (uint64_t)CFSTR("decoder config missing params: inputEncodedFeaturesTensorNameOfBridge"), v62, v63);
    objc_msgSend_valueForKey_(v16, v61, (uint64_t)CFSTR("outputTensorNameOfBridge"), v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v64)
      objc_msgSend_addObject_(v25, v52, (uint64_t)CFSTR("decoder config missing params: outputTensorNameOfBridge"), v54, v55);
  }
  if (objc_msgSend_count(v25, v52, v53, v54, v55))
  {
    if (!a10)
    {
      IsPrecompiled_runtimeParamsPath = 0;
      goto LABEL_28;
    }
    v68 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_componentsJoinedByString_(v25, v65, (uint64_t)CFSTR("; "), v66, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v68, v70, (uint64_t)CFSTR("decoder config errors: %@"), v71, v72, v69);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v74, (uint64_t)v73, v75, v76);
    IsPrecompiled_runtimeParamsPath = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a8)
    {
      hasSuffix = objc_msgSend_hasSuffix_(v134, v65, (uint64_t)CFSTR(".net"), v66, v67);
      v79 = 1;
      if (!hasSuffix)
        v79 = 2;
      a8 = v79;
    }
    v129 = v16;
    objc_msgSend_objectForKeyedSubscript_(v15, v65, (uint64_t)CFSTR("isPrecompiled"), v66, v67);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend_BOOLValue(v80, v81, v82, v83, v84);

    objc_msgSend_objectForKeyedSubscript_(v16, v86, (uint64_t)CFSTR("isPrecompiled"), v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend_BOOLValue(v89, v90, v91, v92, v93);

    v94 = objc_alloc((Class)a1);
    objc_msgSend_objectForKeyedSubscript_(v15, v95, (uint64_t)CFSTR("inputEncodedFeaturesTensorName"), v96, v97);
    v130 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v98, (uint64_t)CFSTR("inputWordIdsTensorName"), v99, v100);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v101, (uint64_t)CFSTR("outputWordProbsTensorName"), v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v105, (uint64_t)CFSTR("decoderEmbeddingShape"), v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v109, (uint64_t)CFSTR("decoderInputSeqShape"), v110, v111);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v16, v112, (uint64_t)CFSTR("inputEncodedFeaturesTensorNameOfBridge"), v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v16, v116, (uint64_t)CFSTR("outputTensorNameOfBridge"), v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v16, v120, (uint64_t)CFSTR("bridgeInputShape"), v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    IsPrecompiled_runtimeParamsPath = (void *)objc_msgSend_initImageCaptioningDecoderConfigurationForRevision_runtimeEngine_espressoNetPath_vocabularyModelPath_inputEncodedFeaturesTensorName_inputWordIdsTensorName_outputWordProbsTensorName_decoderEmbeddingShape_decoderInputSeqShape_decoderIsPrecompiled_saveDecoderFeatures_bridgeNetworkPath_inputEncodedFeaturesTensorNameOfBridge_outputTensorNameOfBridge_bridgeInputShape_bridgeIsPrecompiled_runtimeParamsPath_(v94, v124, v136 == 0, a8, (uint64_t)v134, v133, v130, v128, v104, v108, v126, v85, v136, v115, v119, v123, v127, v132);

    v16 = v129;
    v73 = (void *)v130;
  }

LABEL_28:
  return IsPrecompiled_runtimeParamsPath;
}

- (id)initImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 runtimeEngine:(int64_t)a4 espressoNetPath:(id)a5 vocabularyModelPath:(id)a6 inputEncodedFeaturesTensorName:(id)a7 inputWordIdsTensorName:(id)a8 outputWordProbsTensorName:(id)a9 decoderEmbeddingShape:(id)a10 decoderInputSeqShape:(id)a11 decoderIsPrecompiled:(BOOL)a12 saveDecoderFeatures:(BOOL)a13 bridgeNetworkPath:(id)a14 inputEncodedFeaturesTensorNameOfBridge:(id)a15 outputTensorNameOfBridge:(id)a16 bridgeInputShape:(id)a17 bridgeIsPrecompiled:(BOOL)a18 runtimeParamsPath:(id)a19
{
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  CSUImageCaptioningDecoderConfiguration *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CSUImageCaptioningDecoderConfiguration *v34;
  uint64_t v35;
  NSString *decoderNetworkPath;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSString *vocabularyModelPath;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSString *inputEncodedFeaturesTensorName;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSString *inputWordIdsTensorName;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSString *outputWordProbsTensorName;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSArray *decoderEmbeddingShape;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSArray *decoderInputSeqShape;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSString *bridgeNetworkPath;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSString *inputEncodedFeaturesTensorNameOfBridge;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSString *outputTensorNameOfBridge;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSArray *bridgeInputShape;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  CSUImageCaptioningDecoderConfiguration *v110;
  NSObject *v111;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  objc_super v123;

  v22 = a5;
  v23 = a6;
  v122 = a7;
  v121 = a8;
  v120 = a9;
  v24 = v22;
  v25 = a10;
  v26 = a11;
  v119 = a14;
  v118 = a15;
  v27 = v23;
  v117 = a16;
  v28 = a17;
  v116 = a19;
  v123.receiver = self;
  v123.super_class = (Class)CSUImageCaptioningDecoderConfiguration;
  v29 = -[CSUImageCaptioningDecoderConfiguration init](&v123, sel_init);
  v34 = v29;
  if (!v29)
    goto LABEL_4;
  v29->_revision = a3;
  v29->_runtimeEngine = a4;
  v35 = objc_msgSend_copy(v24, v30, v31, v32, v33);
  decoderNetworkPath = v34->_decoderNetworkPath;
  v34->_decoderNetworkPath = (NSString *)v35;

  v34->_espressoExecutionEngine = 0x7FFFFFFF;
  v41 = objc_msgSend_copy(v27, v37, v38, v39, v40);
  vocabularyModelPath = v34->_vocabularyModelPath;
  v34->_vocabularyModelPath = (NSString *)v41;

  v47 = objc_msgSend_copy(v122, v43, v44, v45, v46);
  inputEncodedFeaturesTensorName = v34->_inputEncodedFeaturesTensorName;
  v34->_inputEncodedFeaturesTensorName = (NSString *)v47;

  v53 = objc_msgSend_copy(v121, v49, v50, v51, v52);
  inputWordIdsTensorName = v34->_inputWordIdsTensorName;
  v34->_inputWordIdsTensorName = (NSString *)v53;

  v59 = objc_msgSend_copy(v120, v55, v56, v57, v58);
  outputWordProbsTensorName = v34->_outputWordProbsTensorName;
  v34->_outputWordProbsTensorName = (NSString *)v59;

  v65 = objc_msgSend_copy(v25, v61, v62, v63, v64);
  decoderEmbeddingShape = v34->_decoderEmbeddingShape;
  v34->_decoderEmbeddingShape = (NSArray *)v65;

  if (v26)
  {
    v71 = objc_msgSend_copy(v26, v67, v68, v69, v70);
    decoderInputSeqShape = v34->_decoderInputSeqShape;
    v34->_decoderInputSeqShape = (NSArray *)v71;

    v77 = objc_msgSend_copy(v119, v73, v74, v75, v76);
    bridgeNetworkPath = v34->_bridgeNetworkPath;
    v34->_bridgeNetworkPath = (NSString *)v77;

    v83 = objc_msgSend_copy(v118, v79, v80, v81, v82);
    inputEncodedFeaturesTensorNameOfBridge = v34->_inputEncodedFeaturesTensorNameOfBridge;
    v34->_inputEncodedFeaturesTensorNameOfBridge = (NSString *)v83;

    v89 = objc_msgSend_copy(v117, v85, v86, v87, v88);
    outputTensorNameOfBridge = v34->_outputTensorNameOfBridge;
    v34->_outputTensorNameOfBridge = (NSString *)v89;

    v34->_saveDecoderFeatures = a13;
    v95 = objc_msgSend_copy(v28, v91, v92, v93, v94);
    bridgeInputShape = v34->_bridgeInputShape;
    v34->_bridgeInputShape = (NSArray *)v95;

    v101 = objc_msgSend_count(v26, v97, v98, v99, v100);
    objc_msgSend_objectAtIndex_(v26, v102, v101 - 1, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v34->_maxSeqLen = objc_msgSend_unsignedLongValue(v105, v106, v107, v108, v109);

    objc_storeStrong((id *)&v34->_runTimeParamsPath, a19);
    v34->_bridgeIsPrecompiled = a18;
    v34->_decoderIsPrecompiled = a12;
LABEL_4:
    v110 = v34;
    goto LABEL_8;
  }
  sub_23A016E78();
  v111 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    sub_23A09E558(v111);

  v110 = 0;
LABEL_8:

  return v110;
}

+ (id)availableRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 6, v7, v8);
  objc_msgSend_addIndex_(v2, v9, 7, v10, v11);
  return v2;
}

- (int)espressoExecutionEngine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int result;
  void *v7;

  result = self->_espressoExecutionEngine;
  if (result == 0x7FFFFFFF)
  {
    objc_msgSend_computeDevice(self, a2, v2, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_espressoExecutionEngine = sub_23A00ACE4(v7);

    return self->_espressoExecutionEngine;
  }
  return result;
}

- (void)setEspressoExecutionEngine:(int)a3
{
  self->_espressoExecutionEngine = a3;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
  objc_storeStrong((id *)&self->_computeDevice, a3);
}

- (int64_t)revision
{
  return self->_revision;
}

- (int64_t)runtimeEngine
{
  return self->_runtimeEngine;
}

- (NSString)vocabularyModelPath
{
  return self->_vocabularyModelPath;
}

- (void)setVocabularyModelPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)runTimeParamsPath
{
  return self->_runTimeParamsPath;
}

- (void)setRunTimeParamsPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)decoderNetworkPath
{
  return self->_decoderNetworkPath;
}

- (void)setDecoderNetworkPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bridgeNetworkPath
{
  return self->_bridgeNetworkPath;
}

- (void)setBridgeNetworkPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)maxSeqLen
{
  return self->_maxSeqLen;
}

- (void)setMaxSeqLen:(unint64_t)a3
{
  self->_maxSeqLen = a3;
}

- (NSString)inputEncodedFeaturesTensorNameOfBridge
{
  return self->_inputEncodedFeaturesTensorNameOfBridge;
}

- (void)setInputEncodedFeaturesTensorNameOfBridge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)outputTensorNameOfBridge
{
  return self->_outputTensorNameOfBridge;
}

- (void)setOutputTensorNameOfBridge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)inputEncodedFeaturesTensorName
{
  return self->_inputEncodedFeaturesTensorName;
}

- (void)setInputEncodedFeaturesTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)inputWordIdsTensorName
{
  return self->_inputWordIdsTensorName;
}

- (void)setInputWordIdsTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)outputWordProbsTensorName
{
  return self->_outputWordProbsTensorName;
}

- (void)setOutputWordProbsTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)saveDecoderFeatures
{
  return self->_saveDecoderFeatures;
}

- (void)setSaveDecoderFeatures:(BOOL)a3
{
  self->_saveDecoderFeatures = a3;
}

- (NSArray)bridgeInputShape
{
  return self->_bridgeInputShape;
}

- (void)setBridgeInputShape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)decoderEmbeddingShape
{
  return self->_decoderEmbeddingShape;
}

- (void)setDecoderEmbeddingShape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)decoderInputSeqShape
{
  return self->_decoderInputSeqShape;
}

- (void)setDecoderInputSeqShape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)bridgeIsPrecompiled
{
  return self->_bridgeIsPrecompiled;
}

- (void)setBridgeIsPrecompiled:(BOOL)a3
{
  self->_bridgeIsPrecompiled = a3;
}

- (BOOL)decoderIsPrecompiled
{
  return self->_decoderIsPrecompiled;
}

- (void)setDecoderIsPrecompiled:(BOOL)a3
{
  self->_decoderIsPrecompiled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderInputSeqShape, 0);
  objc_storeStrong((id *)&self->_decoderEmbeddingShape, 0);
  objc_storeStrong((id *)&self->_bridgeInputShape, 0);
  objc_storeStrong((id *)&self->_outputWordProbsTensorName, 0);
  objc_storeStrong((id *)&self->_inputWordIdsTensorName, 0);
  objc_storeStrong((id *)&self->_inputEncodedFeaturesTensorName, 0);
  objc_storeStrong((id *)&self->_outputTensorNameOfBridge, 0);
  objc_storeStrong((id *)&self->_inputEncodedFeaturesTensorNameOfBridge, 0);
  objc_storeStrong((id *)&self->_bridgeNetworkPath, 0);
  objc_storeStrong((id *)&self->_decoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_runTimeParamsPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end
