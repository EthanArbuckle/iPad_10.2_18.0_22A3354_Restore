@implementation IMTranscoder_AV

- (BOOL)_isHEVCVideo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int isEqual;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  IMAVURLAssetOptionsDefault();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDB26C8]);
  v52 = v3;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v51 = (void *)objc_msgSend_initWithURL_options_(v5, v6, (uint64_t)v3, (uint64_t)v4, v7, v8, v9);
  objc_msgSend_tracks(v51, v10, v11, v12, v13, v14, v15);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v58, (uint64_t)v63, 16, v17, v18);
  if (v19)
  {
    v26 = v19;
    v27 = 0;
    v28 = *(_QWORD *)v59;
    v29 = *MEMORY[0x24BDB1D50];
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v59 != v28)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend_mediaType(v31, v20, v21, v22, v23, v24, v25);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v32, v33, v29, v34, v35, v36, v37);

        if (isEqual)
        {
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          objc_msgSend_formatDescriptions(v31, v20, v21, v22, v23, v24, v25);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v54, (uint64_t)v62, 16, v41, v42);
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v44; ++j)
              {
                if (*(_QWORD *)v55 != v45)
                  objc_enumerationMutation(v39);
                v27 |= CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((_QWORD *)&v54 + 1) + 8 * j)) == 1752589105;
              }
              v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v47, (uint64_t)&v54, (uint64_t)v62, 16, v48, v49);
            }
            while (v44);
          }

        }
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v58, (uint64_t)v63, 16, v24, v25);
    }
    while (v26);
  }
  else
  {
    v27 = 0;
  }

  return v27 & 1;
}

- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9
{
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char shouldPreserveHDREncoding;
  char v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  int64_t v42;
  uint64_t v44;
  unsigned int v45;

  if (!a3)
    return 0;
  v14 = *MEMORY[0x24BE50D70];
  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  v45 = objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v20, (uint64_t)v18, v14, v21, v22, v23);
  v28 = objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v24, (uint64_t)v18, *MEMORY[0x24BE50D90], v25, v26, v27);
  IMCheckVideoURLProperties();
  shouldPreserveHDREncoding = objc_msgSend_shouldPreserveHDREncoding_(IMTranscoder, v29, (uint64_t)v15, v30, v31, v32, v33);
  v35 = IMIsAAVideoURL();
  LOBYTE(v14) = objc_msgSend_shouldPreserveAAEncoding_(IMTranscoder, v36, (uint64_t)v15, v37, v38, v39, v40);

  BYTE4(v44) = v14;
  BYTE3(v44) = v35;
  BYTE2(v44) = shouldPreserveHDREncoding;
  LOWORD(v44) = v28;
  v42 = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_isAnimojiV2_removeAlpha_isHDR_preserveHDR_isAA_preserveAA_fileSizeLimit_(self, v41, (uint64_t)v19, (uint64_t)v18, a5, (uint64_t)v17, (uint64_t)v16, v45, v44, a8);

  return v42;
}

- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 isAnimojiV2:(BOOL)a8 removeAlpha:(BOOL)a9 isHDR:(BOOL)a10 preserveHDR:(BOOL)a11 isAA:(BOOL)a12 preserveAA:(BOOL)a13 fileSizeLimit:(unint64_t)a14
{
  _BOOL4 v14;
  id v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char isLazuliEnabled;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  double v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  NSObject *v144;
  NSObject *v145;
  NSObject *v146;
  NSObject *v147;
  NSObject *v148;
  const __CFString *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  NSObject *v156;
  const __CFString *v157;
  NSObject *v158;
  int64_t v159;
  NSObject *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  NSObject *v175;
  int v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  NSObject *v182;
  unint64_t v183;
  id v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  NSObject *v190;
  int v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  int v197;
  int v198;
  NSObject *v200;
  const __CFString *v201;
  int v202;
  double v203;
  __int16 v204;
  id v205;
  __int16 v206;
  void *v207;
  uint64_t v208;

  v14 = a8;
  v208 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v21 = a4;
  v22 = a6;
  v28 = a7;
  if (!v20)
    goto LABEL_54;
  objc_msgSend_objectForKey_(v21, v23, *MEMORY[0x24BE50D78], v24, v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_BOOLValue(v29, v30, v31, v32, v33, v34, v35);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v202 = 138412290;
      v203 = *(double *)&v22;
      _os_log_impl(&dword_21DFB1000, v37, OS_LOG_TYPE_INFO, "Checking if we support the AV uti: %@", (uint8_t *)&v202, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      LOWORD(v202) = 0;
      _os_log_impl(&dword_21DFB1000, v38, OS_LOG_TYPE_INFO, "Trying to discriminate based on type alone:", (uint8_t *)&v202, 2u);
    }

  }
  v39 = (void *)objc_opt_class();
  objc_msgSend_supportedUTIs(v39, v40, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_containsObject_(v46, v47, (uint64_t)v22, v48, v49, v50, v51);

  if (!v52)
  {
LABEL_54:
    v159 = 0;
    goto LABEL_114;
  }
  objc_msgSend_sharedFeatureFlags(MEMORY[0x24BE511F0], v53, v54, v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  isLazuliEnabled = objc_msgSend_isLazuliEnabled(v59, v60, v61, v62, v63, v64, v65);

  v73 = isLazuliEnabled ^ 1;
  if (a5 != 2)
    v73 = 1;
  if ((v73 & 1) == 0)
  {
    objc_msgSend_typeWithIdentifier_(MEMORY[0x24BDF8238], v67, (uint64_t)v22, v69, v70, v71, v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_typeWithIdentifier_(MEMORY[0x24BDF8238], v75, (uint64_t)CFSTR("org.3gpp.adaptive-multi-rate-audio"), v76, v77, v78, v79);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 && (objc_msgSend_conformsToType_(v74, v80, (uint64_t)v85, v81, v82, v83, v84) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v160 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_preferredFilenameExtension(v85, v161, v162, v163, v164, v165, v166);
          v167 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_preferredFilenameExtension(v74, v168, v169, v170, v171, v172, v173);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v202 = 138412802;
          v203 = *(double *)&v167;
          v204 = 2112;
          v205 = v22;
          v206 = 2112;
          v207 = v174;
          _os_log_impl(&dword_21DFB1000, v160, OS_LOG_TYPE_INFO, "RCS expects AMR type (ext %@) for audio message, not %@ (ext %@), we need to transcode", (uint8_t *)&v202, 0x20u);

        }
        goto LABEL_78;
      }
    }
    else
    {
      if ((objc_msgSend_conformsToType_(v74, v80, *MEMORY[0x24BDF8498], v81, v82, v83, v84) & 1) != 0
        || (objc_msgSend_conformsToType_(v74, v86, *MEMORY[0x24BDF8490], v87, v88, v89, v90) & 1) != 0
        || (objc_msgSend_conformsToType_(v74, v91, *MEMORY[0x24BDF8470], v92, v93, v94, v95) & 1) != 0)
      {

        goto LABEL_20;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v160 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        {
          v202 = 138412290;
          v203 = *(double *)&v22;
          _os_log_impl(&dword_21DFB1000, v160, OS_LOG_TYPE_INFO, "RCS does not expect AV type %@, we need to transcode", (uint8_t *)&v202, 0xCu);
        }
LABEL_78:

      }
    }

    goto LABEL_113;
  }
LABEL_20:
  if (objc_msgSend_count(v21, v67, v68, v69, v70, v71, v72))
  {
    objc_msgSend_objectForKey_(v21, v96, *MEMORY[0x24BE50D98], v97, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v101, v102, v103, v104, v105, v106, v107);
    v109 = v108;

    objc_msgSend_objectForKey_(v21, v110, *MEMORY[0x24BE50D68], v111, v112, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v115, v116, v117, v118, v119, v120, v121);
    v123 = v122;

    objc_msgSend_objectForKey_(v21, v124, *MEMORY[0x24BE50D60], v125, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v129, v130, v131, v132, v133, v134, v135);
    v137 = v136;

    objc_msgSend_objectForKey_(v21, v138, *MEMORY[0x24BE50D50], v139, v140, v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v144 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
      {
        v202 = 134217984;
        v203 = v109;
        _os_log_impl(&dword_21DFB1000, v144, OS_LOG_TYPE_INFO, "   Start time: %f", (uint8_t *)&v202, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v145 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
      {
        v202 = 134217984;
        v203 = v123;
        _os_log_impl(&dword_21DFB1000, v145, OS_LOG_TYPE_INFO, "     End time: %f", (uint8_t *)&v202, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
      {
        v202 = 134217984;
        v203 = v137;
        _os_log_impl(&dword_21DFB1000, v146, OS_LOG_TYPE_INFO, "     Duration: %f", (uint8_t *)&v202, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v147 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
      {
        v202 = 138412290;
        v203 = *(double *)&v143;
        _os_log_impl(&dword_21DFB1000, v147, OS_LOG_TYPE_INFO, "  assetLibURI: %@", (uint8_t *)&v202, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v148 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
      {
        v149 = CFSTR("NO");
        if (a9)
          v149 = CFSTR("YES");
        v202 = 138412290;
        v203 = *(double *)&v149;
        _os_log_impl(&dword_21DFB1000, v148, OS_LOG_TYPE_INFO, " removeAlpha: %@", (uint8_t *)&v202, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v156 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
      {
        v157 = CFSTR("NO");
        if (a11)
          v157 = CFSTR("YES");
        v202 = 138412290;
        v203 = *(double *)&v157;
        _os_log_impl(&dword_21DFB1000, v156, OS_LOG_TYPE_INFO, " preserveHDR: %@", (uint8_t *)&v202, 0xCu);
      }

    }
    if (v109 > 0.00000011920929)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v158 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
        {
          LOWORD(v202) = 0;
          _os_log_impl(&dword_21DFB1000, v158, OS_LOG_TYPE_INFO, " Start time > 0, we need to transcode", (uint8_t *)&v202, 2u);
        }
LABEL_73:

        goto LABEL_74;
      }
      goto LABEL_74;
    }
    if (v123 > 0.00000011920929)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v158 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
        {
          LOWORD(v202) = 0;
          _os_log_impl(&dword_21DFB1000, v158, OS_LOG_TYPE_INFO, " End time > 0, we need to transcode", (uint8_t *)&v202, 2u);
        }
        goto LABEL_73;
      }
LABEL_74:

LABEL_113:
      v159 = 2;
      goto LABEL_114;
    }
    if (v137 > 0.00000011920929)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v158 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
        {
          LOWORD(v202) = 0;
          _os_log_impl(&dword_21DFB1000, v158, OS_LOG_TYPE_INFO, " End time > 0, we need to transcode", (uint8_t *)&v202, 2u);
        }
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    if (objc_msgSend_length(v143, v150, v151, v152, v153, v154, v155))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v158 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
        {
          LOWORD(v202) = 0;
          _os_log_impl(&dword_21DFB1000, v158, OS_LOG_TYPE_INFO, " We have an assets library URI, we need to transcode (video might be slow-mo).", (uint8_t *)&v202, 2u);
        }
        goto LABEL_73;
      }
      goto LABEL_74;
    }

  }
  if (v14 && a9)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_113;
    OSLogHandleForIMFoundationCategory();
    v175 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
    {
      LOWORD(v202) = 0;
      _os_log_impl(&dword_21DFB1000, v175, OS_LOG_TYPE_INFO, " This is an AnimojiV2 video, and we want to remove alpha", (uint8_t *)&v202, 2u);
    }
LABEL_112:

    goto LABEL_113;
  }
  if (a10 && !a11)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_113;
    OSLogHandleForIMFoundationCategory();
    v175 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
    {
      LOWORD(v202) = 0;
      _os_log_impl(&dword_21DFB1000, v175, OS_LOG_TYPE_INFO, " This is an HDR video, and we don't want to preserve HDR", (uint8_t *)&v202, 2u);
    }
    goto LABEL_112;
  }
  v176 = IMOSLoggingEnabled();
  if (a12 && !a13)
  {
    if (!v176)
      goto LABEL_113;
    OSLogHandleForIMFoundationCategory();
    v175 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
    {
      LOWORD(v202) = 0;
      _os_log_impl(&dword_21DFB1000, v175, OS_LOG_TYPE_INFO, " This is an AA video, and we don't want to preserve AA", (uint8_t *)&v202, 2u);
    }
    goto LABEL_112;
  }
  if (v176)
  {
    OSLogHandleForIMFoundationCategory();
    v182 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
    {
      LOWORD(v202) = 0;
      _os_log_impl(&dword_21DFB1000, v182, OS_LOG_TYPE_INFO, "That wasn't enough, let's look at filesize too:", (uint8_t *)&v202, 2u);
    }

  }
  v183 = objc_msgSend__fileSizeForTransfer_(self, v177, (uint64_t)v20, v178, v179, v180, v181);
  v184 = v28;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v190 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
    {
      v202 = 138412290;
      v203 = *(double *)&v184;
      _os_log_impl(&dword_21DFB1000, v190, OS_LOG_TYPE_INFO, "SendableUTIs: %@", (uint8_t *)&v202, 0xCu);
    }

  }
  if (v184)
  {
    v191 = objc_msgSend_containsObject_(v184, v185, (uint64_t)v22, v186, v187, v188, v189);
    v197 = 0;
    if (v183)
      v198 = v191;
    else
      v198 = 0;
    if (v198 == 1 && v183 < a14)
      v197 = objc_msgSend__isHEVCVideo_(self, v192, (uint64_t)v20, v193, v194, v195, v196) & a9 ^ 1;
  }
  else
  {
    v197 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v200 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
    {
      v201 = CFSTR("NO");
      if (v197)
        v201 = CFSTR("YES");
      v202 = 138412290;
      v203 = *(double *)&v201;
      _os_log_impl(&dword_21DFB1000, v200, OS_LOG_TYPE_INFO, "Is the original sendable without transcode? %@", (uint8_t *)&v202, 0xCu);
    }

  }
  if (v197)
    v159 = 1;
  else
    v159 = 2;

LABEL_114:
  return v159;
}

- (unint64_t)_fileSizeForTransfer:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  id v33;
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v3, v11, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend_attributesOfItemAtPath_error_(v10, v18, (uint64_t)v17, (uint64_t)&v33, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v33;
  v30 = objc_msgSend_fileSize(v22, v24, v25, v26, v27, v28, v29);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v35 = v30;
      v36 = 2112;
      v37 = v3;
      v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_21DFB1000, v31, OS_LOG_TYPE_INFO, "Found size %llu of file %@ with error %@", buf, 0x20u);
    }

  }
  if (v23)
    v30 = 0;

  return v30;
}

- (void)_transcodeVideoAsync:(id)a3 target:(int64_t)a4 maxBytes:(unint64_t)a5 isAnimojiV2:(BOOL)a6 removeAlpha:(BOOL)a7 preserveHDR:(BOOL)a8 isAA:(BOOL)a9 preserveAA:(BOOL)a10 userInfo:(id)a11 completionHandler:(id)a12
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL4 v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  NSObject *v81;
  id *v82;
  id v83;
  id *v84;
  _BOOL4 v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  NSObject *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  NSObject *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  NSObject *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  NSObject *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  unint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  NSObject *v228;
  NSObject *v229;
  id v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  NSObject *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  id v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  __CFString *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  int v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  int isLazuliEnabled;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  int v291;
  NSObject *v292;
  void *v293;
  int v294;
  NSObject *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  NSObject *v299;
  int v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  NSObject *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  void *v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  double v351;
  double v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  void *v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  double v365;
  double v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  double v379;
  double v380;
  double Seconds;
  double v382;
  double v383;
  double v384;
  NSObject *v385;
  NSObject *v386;
  NSObject *v387;
  NSObject *v388;
  NSObject *v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  NSObject *v395;
  BOOL v396;
  void *v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  void *v407;
  double v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  NSObject *v412;
  double v413;
  NSObject *v414;
  NSObject *v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  NSObject *v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  NSObject *v427;
  NSObject *v428;
  NSObject *v429;
  _BOOL4 v430;
  int v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  NSObject *v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  unint64_t v443;
  NSObject *v444;
  void *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  NSObject *v451;
  id v452;
  CGColorRef SRGB;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  void *v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  NSObject *v474;
  NSObject *v475;
  NSObject *v476;
  NSObject *v477;
  NSObject *v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  id v485;
  NSObject *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  void *v492;
  int v493;
  void *v494;
  void *v496;
  _BOOL4 v497;
  _BOOL4 inUTI;
  __CFString *inUTIa;
  _BOOL4 v500;
  void *v501;
  id v503;
  _QWORD v504[4];
  id v505;
  void (**v506)(_QWORD, _QWORD, _QWORD, _QWORD);
  double v507;
  __int128 v508;
  uint64_t v509;
  _BYTE start[32];
  __int128 v511;
  CMTime end;
  CMTime v513;
  CMTime v514;
  __int128 v515;
  uint64_t v516;
  _BYTE buf[32];
  _BYTE v518[20];
  __int16 v519;
  const __CFString *v520;
  uint64_t v521;

  v12 = a8;
  v500 = a7;
  v497 = a6;
  v521 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a11;
  v16 = a12;
  if (v16)
  {
    v23 = v16;
    v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend_copy(v16, v17, v18, v19, v20, v21, v22);

  }
  else
  {
    v24 = 0;
  }
  objc_msgSend_tracksWithMediaType_(v14, v17, *MEMORY[0x24BDB1D50], v19, v20, v21, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_count(v25, v26, v27, v28, v29, v30, v31);

  objc_msgSend_tracksWithMediaType_(v14, v33, *MEMORY[0x24BDB1CF0], v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_count(v38, v39, v40, v41, v42, v43, v44);

  if (!(v32 | v45))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v54, OS_LOG_TYPE_INFO, "No audio/video tracks, failing transcode.", buf, 2u);
      }

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v51, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -3, 0, v52, v53);
    v503 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
      ((void (**)(_QWORD, _QWORD, _QWORD, id))v24)[2](v24, 0, 0, v503);
    goto LABEL_287;
  }
  objc_msgSend_objectForKeyedSubscript_(v15, v46, *MEMORY[0x24BE50D78], v47, v48, v49, v50);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v493 = objc_msgSend_BOOLValue(v55, v56, v57, v58, v59, v60, v61);

  if (v45)
    v62 = v32 == 0;
  else
    v62 = 0;
  inUTI = v62;
  v68 = (id)*MEMORY[0x24BDB19C8];
  if (!v32)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v81, OS_LOG_TYPE_INFO, "Actually, using the audio preset", buf, 2u);
      }

    }
    if (a4 == 2)
    {
      v82 = (id *)MEMORY[0x24BDB1990];
      if (!v493)
        v82 = (id *)MEMORY[0x24BDB19D0];
    }
    else if (a4 == 1)
    {
      v82 = (id *)MEMORY[0x24BDB1990];
    }
    else
    {
      v82 = (id *)MEMORY[0x24BDB19D0];
    }
    v503 = *v82;
    v69 = v68;
    goto LABEL_47;
  }
  if (a4 == 1)
  {
    objc_msgSend_objectForKey_(v15, v63, *MEMORY[0x24BE510D0], v64, v65, v66, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v15, v70, *MEMORY[0x24BE510D8], v71, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_IMMMSSupportsH264VideoForPhoneNumber_simID_(MEMORY[0x24BE511B0], v76, (uint64_t)v69, (uint64_t)v75, v77, v78, v79))
    {
      v503 = (id)*MEMORY[0x24BDB1968];

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v503;
          _os_log_impl(&dword_21DFB1000, v80, OS_LOG_TYPE_INFO, "   Carrier supports H264, selecting: %@", buf, 0xCu);
        }
LABEL_40:

      }
    }
    else
    {
      v503 = (id)*MEMORY[0x24BDB19B8];

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v503;
          _os_log_impl(&dword_21DFB1000, v80, OS_LOG_TYPE_INFO, "   Carrier does not support H264, selecting: %@", buf, 0xCu);
        }
        goto LABEL_40;
      }
    }

    v500 = 1;
LABEL_47:

    v85 = a4 == 2;
    goto LABEL_48;
  }
  if (v12)
  {
    v83 = (id)*MEMORY[0x24BDB19D8];

    v68 = v83;
  }
  if (a9 && a10)
  {
    v84 = (id *)MEMORY[0x24BDB19E0];
LABEL_36:
    v503 = *v84;

    goto LABEL_95;
  }
  if (v497)
  {
    v84 = (id *)MEMORY[0x24BDB1980];
    if (!v500)
      v84 = (id *)MEMORY[0x24BDB1998];
    goto LABEL_36;
  }
  v503 = v68;
LABEL_95:
  if (a4 != 2)
  {
    v85 = 0;
LABEL_48:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        v93 = CFSTR("NO");
        if (v12)
          v94 = CFSTR("YES");
        else
          v94 = CFSTR("NO");
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v503;
        if (v497)
          v95 = CFSTR("YES");
        else
          v95 = CFSTR("NO");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v94;
        if (v500)
          v96 = CFSTR("YES");
        else
          v96 = CFSTR("NO");
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v95;
        if (a9)
          v97 = CFSTR("YES");
        else
          v97 = CFSTR("NO");
        *(_WORD *)v518 = 2112;
        if (a10)
          v93 = CFSTR("YES");
        *(_QWORD *)&v518[2] = v96;
        *(_WORD *)&v518[10] = 2112;
        *(_QWORD *)&v518[12] = v97;
        v519 = 2112;
        v520 = v93;
        _os_log_impl(&dword_21DFB1000, v92, OS_LOG_TYPE_INFO, "Using preset %@ for audio/video transcoding (preserveHDR %@ isAnimojiV2 %@ removeAlpha %@ isAA %@ preserveAA %@)", buf, 0x3Eu);
      }

    }
    v515 = 0uLL;
    v516 = 0;
    if (v14)
      objc_msgSend_duration(v14, v86, v87, v88, v89, v90, v91);
    objc_msgSend_objectForKey_(v15, v86, *MEMORY[0x24BE50D88], v88, v89, v90, v91);
    v496 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v15, v98, *MEMORY[0x24BE50D50], v99, v100, v101, v102);
    v501 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v501, v103, v104, v105, v106, v107, v108))
    {
      objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v109, (uint64_t)v501, v110, v111, v112, v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v114;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v503;
          _os_log_impl(&dword_21DFB1000, v115, OS_LOG_TYPE_INFO, "Trying to use assetLibURL %@, asset %@, presetName %@", buf, 0x20u);
        }

      }
      v116 = (void *)MEMORY[0x2207A8008](CFSTR("ALAssetsLibrary"), CFSTR("AssetsLibrary"));
      objc_msgSend_URL(v14, v117, v118, v119, v120, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v123, v124, v125, v126, v127, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__exportSessionForVideoURL_fallbackFilePath_exportPreset_(v116, v131, (uint64_t)v114, (uint64_t)v130, (uint64_t)v503, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v141 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_asset(v134, v142, v143, v144, v145, v146, v147);
          v148 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v148;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v134;
          _os_log_impl(&dword_21DFB1000, v141, OS_LOG_TYPE_INFO, "New asset: %@, exportSession %@", buf, 0x16u);

        }
      }
      if (v134)
      {
        objc_msgSend_asset(v134, v135, v136, v137, v138, v139, v140);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = v149;
        if (v149)
          objc_msgSend_duration(v149, v150, v151, v152, v153, v154, v155);
        else
          memset(buf, 0, 24);
        v515 = *(_OWORD *)buf;
        v516 = *(_QWORD *)&buf[16];

LABEL_102:
        goto LABEL_114;
      }

    }
    else if (v496)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v157 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v496;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v503;
          _os_log_impl(&dword_21DFB1000, v157, OS_LOG_TYPE_INFO, "Trying to use metadata %@, asset %@, presetName %@", buf, 0x20u);
        }

      }
      v158 = (void *)MEMORY[0x2207A8008](CFSTR("ALAssetsLibrary"), CFSTR("AssetsLibrary"));
      objc_msgSend_URL(v14, v159, v160, v161, v162, v163, v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_relativePath(v165, v166, v167, v168, v169, v170, v171);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__exportSessionForVideoFilePath_metadata_exportPreset_(v158, v173, (uint64_t)v172, (uint64_t)v496, (uint64_t)v503, v174, v175);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v182 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_asset(v134, v183, v184, v185, v186, v187, v188);
          v189 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v189;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v134;
          _os_log_impl(&dword_21DFB1000, v182, OS_LOG_TYPE_INFO, "New asset: %@, exportSession %@", buf, 0x16u);

        }
      }
      if (v134)
      {
        objc_msgSend_asset(v134, v176, v177, v178, v179, v180, v181);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = v190;
        if (v190)
          objc_msgSend_duration(v190, v191, v192, v193, v194, v195, v196);
        else
          memset(buf, 0, 24);
        v515 = *(_OWORD *)buf;
        v516 = *(_QWORD *)&buf[16];
        goto LABEL_102;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v229 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v229, OS_LOG_TYPE_INFO, "Using a standard AVAssetExportSession.", buf, 2u);
      }

    }
    v230 = objc_alloc(MEMORY[0x24BDB23A8]);
    v134 = (void *)objc_msgSend_initWithAsset_presetName_(v230, v231, (uint64_t)v14, (uint64_t)v503, v232, v233, v234);
    if (!v134)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v299 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v299, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v299, OS_LOG_TYPE_INFO, "Could not create export session with Message presets", buf, 2u);
        }

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v296, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -4, 0, v297, v298);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v24)[2](v24, 0, 0, v134);
      goto LABEL_286;
    }
LABEL_114:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v241 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_supportedFileTypes(v134, v242, v243, v244, v245, v246, v247);
        v248 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v248;
        _os_log_impl(&dword_21DFB1000, v241, OS_LOG_TYPE_INFO, "Supported file types: %@", buf, 0xCu);

      }
    }
    objc_msgSend_supportedFileTypes(v134, v235, v236, v237, v238, v239, v240);
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v249, v250, 0, v251, v252, v253, v254);
    v255 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (a4 == 1 && inUTI)
    {
      objc_msgSend_supportedFileTypes(v134, v256, v257, v258, v259, v260, v261);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = objc_msgSend_containsObject_(v263, v264, (uint64_t)CFSTR("org.3gpp.adaptive-multi-rate-audio"), v265, v266, v267, v268);

      if (v269)
      {

        v255 = CFSTR("org.3gpp.adaptive-multi-rate-audio");
      }
    }
    objc_msgSend_sharedFeatureFlags(MEMORY[0x24BE511F0], v256, v257, v258, v259, v260, v261);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    isLazuliEnabled = objc_msgSend_isLazuliEnabled(v270, v271, v272, v273, v274, v275, v276);

    if ((v85 & isLazuliEnabled) != 1)
      goto LABEL_151;
    objc_msgSend_supportedFileTypes(v134, v278, v279, v280, v281, v282, v283);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    v290 = v284;
    if (inUTI)
    {
      if (v493)
      {
        v291 = objc_msgSend_containsObject_(v284, v285, (uint64_t)CFSTR("org.3gpp.adaptive-multi-rate-audio"), v286, v287, v288, v289);

        if (v291)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v292 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v292, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21DFB1000, v292, OS_LOG_TYPE_INFO, "AMR supported as output type, using for RCS audio message", buf, 2u);
            }

          }
          inUTIa = CFSTR("org.3gpp.adaptive-multi-rate-audio");
          goto LABEL_150;
        }
LABEL_151:
        inUTIa = v255;
        goto LABEL_152;
      }
      v293 = (void *)*MEMORY[0x24BDB1C00];
      v300 = objc_msgSend_containsObject_(v284, v285, *MEMORY[0x24BDB1C00], v286, v287, v288, v289);

      if (!v300)
        goto LABEL_151;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v295 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v295, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v295, OS_LOG_TYPE_INFO, "M4A supported as output type, using for RCS audio attachment", buf, 2u);
        }
LABEL_148:

      }
    }
    else
    {
      v293 = (void *)*MEMORY[0x24BDB1C30];
      v294 = objc_msgSend_containsObject_(v284, v285, *MEMORY[0x24BDB1C30], v286, v287, v288, v289);

      if (!v294)
        goto LABEL_151;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v295 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v295, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v295, OS_LOG_TYPE_INFO, "MPEG4 supported as output type, using for RCS video", buf, 2u);
        }
        goto LABEL_148;
      }
    }
    inUTIa = v293;
LABEL_150:

LABEL_152:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v306 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v306, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = inUTIa;
        _os_log_impl(&dword_21DFB1000, v306, OS_LOG_TYPE_INFO, "   outputFileType: %@", buf, 0xCu);
      }

    }
    if (inUTIa)
    {
      objc_msgSend_setOutputFileType_(v134, v301, (uint64_t)inUTIa, v302, v303, v304, v305);
      v494 = (void *)UTTypeCopyPreferredTagWithClass(inUTIa, (CFStringRef)*MEMORY[0x24BDC1658]);
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v307, v308, v309, v310, v311, v312);
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URL(v14, v314, v315, v316, v317, v318, v319);
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v320, v321, v322, v323, v324, v325, v326);
      v327 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByDeletingPathExtension(v327, v328, v329, v330, v331, v332, v333);
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__randomTemporaryPathWithSuffix_fileName_(v313, v335, (uint64_t)v494, (uint64_t)v334, v336, v337, v338);
      v492 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKey_(v15, v339, *MEMORY[0x24BE50D98], v340, v341, v342, v343);
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v344, v345, v346, v347, v348, v349, v350);
      v352 = v351;

      objc_msgSend_objectForKey_(v15, v353, *MEMORY[0x24BE50D68], v354, v355, v356, v357);
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v358, v359, v360, v361, v362, v363, v364);
      v366 = v365;

      objc_msgSend_objectForKey_(v15, v367, *MEMORY[0x24BE50D60], v368, v369, v370, v371);
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v372, v373, v374, v375, v376, v377, v378);
      v380 = v379;

      *(_OWORD *)buf = v515;
      *(_QWORD *)&buf[16] = v516;
      Seconds = CMTimeGetSeconds((CMTime *)buf);
      if (v380 < 2.22044605e-16)
      {
        v380 = Seconds;
        if (v366 >= 2.22044605e-16)
        {
          if (Seconds >= v366 - v352)
            v380 = v366 - v352;
          else
            v380 = Seconds;
        }
      }
      v382 = v352 + v380;
      if (Seconds < v352 + v380)
        v382 = Seconds;
      if (v366 >= 2.22044605e-16)
        v382 = v366;
      v383 = fmax(v382 - v380, 0.0);
      if (v352 < 2.22044605e-16)
        v352 = v383;
      if (v380 >= Seconds)
        v380 = Seconds;
      if (v382 >= Seconds)
        v384 = Seconds;
      else
        v384 = v382;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v385 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v385, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v492;
          _os_log_impl(&dword_21DFB1000, v385, OS_LOG_TYPE_INFO, "Exporting video to file %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v386 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v386, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = Seconds;
          _os_log_impl(&dword_21DFB1000, v386, OS_LOG_TYPE_INFO, "    Asset length: %f", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v387 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v387, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v352;
          _os_log_impl(&dword_21DFB1000, v387, OS_LOG_TYPE_INFO, "      Start time: %f", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v388 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v388, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v384;
          _os_log_impl(&dword_21DFB1000, v388, OS_LOG_TYPE_INFO, "        End time: %f", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v389 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v389, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v380;
          _os_log_impl(&dword_21DFB1000, v389, OS_LOG_TYPE_INFO, "        Duration: %f", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v395 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v395, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = a5;
          _os_log_impl(&dword_21DFB1000, v395, OS_LOG_TYPE_INFO, "       Max bytes: %zd", buf, 0xCu);
        }

      }
      if (a4 == 1)
      {
        v396 = v32 == 0;
        objc_msgSend_objectForKey_(v15, v390, *MEMORY[0x24BE510D0], v391, v392, v393, v394);
        v397 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v15, v398, *MEMORY[0x24BE510D8], v399, v400, v401, v402);
        v407 = (void *)objc_claimAutoreleasedReturnValue();
        if (v396)
          objc_msgSend_IMMMSMaximumAudioDurationForPhoneNumber_simID_(MEMORY[0x24BE511B0], v403, (uint64_t)v397, (uint64_t)v407, v404, v405, v406);
        else
          objc_msgSend_IMMMSMaximumVideoDurationForPhoneNumber_simID_(MEMORY[0x24BE511B0], v403, (uint64_t)v397, (uint64_t)v407, v404, v405, v406);
        v413 = v408;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v414 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v414, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v413;
            _os_log_impl(&dword_21DFB1000, v414, OS_LOG_TYPE_INFO, "     Checking maximum MMS slide duration of: %f", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v415 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v415, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_IMMMSMaximumVideoDurationForPhoneNumber_simID_(MEMORY[0x24BE511B0], v416, (uint64_t)v397, (uint64_t)v407, v417, v418, v419);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v420;
            _os_log_impl(&dword_21DFB1000, v415, OS_LOG_TYPE_INFO, "  Max MMS Video Duration: %f", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v421 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v421, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_IMMMSMaximumAudioDurationForPhoneNumber_simID_(MEMORY[0x24BE511B0], v422, (uint64_t)v397, (uint64_t)v407, v423, v424, v425);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v426;
            _os_log_impl(&dword_21DFB1000, v421, OS_LOG_TYPE_INFO, "  Max MMS Audio Duration: %f", buf, 0xCu);
          }

        }
        if (v380 > v413)
        {
          v384 = v352 + v413;
          v380 = v413;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v427 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v427, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v352;
            _os_log_impl(&dword_21DFB1000, v427, OS_LOG_TYPE_INFO, "       => Final start time is: %f", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v428 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v428, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v384;
            _os_log_impl(&dword_21DFB1000, v428, OS_LOG_TYPE_INFO, "       => Final end time is: %f", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v429 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v429, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = v380;
            _os_log_impl(&dword_21DFB1000, v429, OS_LOG_TYPE_INFO, "       => Final duration is: %f", buf, 0xCu);
          }

        }
      }
      memset(&v514, 0, sizeof(v514));
      CMTimeMakeWithSeconds(&v514, v352, 90000);
      memset(&v513, 0, sizeof(v513));
      CMTimeMakeWithSeconds(&v513, v384, 90000);
      v430 = v384 > 2.22044605e-16 || v352 > 2.22044605e-16;
      v431 = IMOSLoggingEnabled();
      if (v430)
      {
        if (v431)
        {
          OSLogHandleForIMFoundationCategory();
          v437 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v437, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v437, OS_LOG_TYPE_INFO, "     Setting time range", buf, 2u);
          }

        }
        *(_OWORD *)v518 = 0u;
        memset(buf, 0, sizeof(buf));
        *(CMTime *)start = v514;
        end = v513;
        CMTimeRangeFromTimeToTime((CMTimeRange *)buf, (CMTime *)start, &end);
        *(_OWORD *)start = *(_OWORD *)buf;
        *(_OWORD *)&start[16] = *(_OWORD *)&buf[16];
        v511 = *(_OWORD *)v518;
        objc_msgSend_setTimeRange_(v134, v438, (uint64_t)start, v439, v440, v441, v442);
        if (v380 < 1.0)
          v380 = v384 - v352;
        v443 = 0x24BDBC000;
      }
      else
      {
        v443 = 0x24BDBC000uLL;
        if (v431)
        {
          OSLogHandleForIMFoundationCategory();
          v444 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v444, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v444, OS_LOG_TYPE_INFO, "     Ignoring time range, transcoding full", buf, 2u);
          }

        }
      }
      if (!a9 || !a10)
        objc_msgSend_setFileLengthLimit_(v134, v432, a5, v433, v434, v435, v436);
      objc_msgSend_fileURLWithPath_(*(void **)(v443 + 3912), v432, (uint64_t)v492, v433, v434, v435, v436);
      v445 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOutputURL_(v134, v446, (uint64_t)v445, v447, v448, v449, v450);

      if (v500 && v497)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v451 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v451, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v451, OS_LOG_TYPE_INFO, "Removing the alpha because this was an HEVC video with alpha", buf, 2u);
          }

        }
        v452 = objc_alloc_init(MEMORY[0x24BDB25D0]);
        SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
        objc_msgSend_setBackgroundColor_(v452, v454, (uint64_t)SRGB, v455, v456, v457, v458);
        objc_msgSend_videoCompositionWithPropertiesOfAsset_prototypeInstruction_(MEMORY[0x24BDB25C8], v459, (uint64_t)v14, (uint64_t)v452, v460, v461, v462);
        v463 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setVideoComposition_(v134, v464, (uint64_t)v463, v465, v466, v467, v468);
        CFRelease(SRGB);

      }
      if (a4 != 1)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v474 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v474, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFB1000, v474, OS_LOG_TYPE_INFO, "Preserving alternate audio tracks, if present", buf, 2u);
          }

        }
        objc_msgSend_setAudioTrackGroupHandling_(v134, v469, 1, v470, v471, v472, v473);
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v475 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v475, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v503;
          _os_log_impl(&dword_21DFB1000, v475, OS_LOG_TYPE_INFO, "     Preset name: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v476 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v476, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v134;
          _os_log_impl(&dword_21DFB1000, v476, OS_LOG_TYPE_INFO, "  Export session: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v477 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v477, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v14;
          _os_log_impl(&dword_21DFB1000, v477, OS_LOG_TYPE_INFO, "           Asset: %@", buf, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v478 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v478, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_outputURL(v134, v479, v480, v481, v482, v483, v484);
          v485 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v485;
          _os_log_impl(&dword_21DFB1000, v478, OS_LOG_TYPE_INFO, "       outputURL: %@", buf, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v486 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v486, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v486, OS_LOG_TYPE_INFO, "Dispatching video export", buf, 2u);
        }

      }
      v504[0] = MEMORY[0x24BDAC760];
      v504[1] = 3221225472;
      v504[2] = sub_21DFB5870;
      v504[3] = &unk_24E1FF6E0;
      v505 = v134;
      v506 = v24;
      v507 = v380;
      v508 = v515;
      v509 = v516;
      objc_msgSend_exportAsynchronouslyWithCompletionHandler_(v505, v487, (uint64_t)v504, v488, v489, v490, v491);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v412 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v412, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v412, OS_LOG_TYPE_INFO, "Could not find a valid outputType for Message presets", buf, 2u);
        }

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v409, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -4, 0, v410, v411);
      v494 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v24)[2](v24, 0, 0, v494);
    }

LABEL_286:
    goto LABEL_287;
  }
  if (IMMaxBitDepthForVideo() != 8)
    goto LABEL_98;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v197, v198, v199, v200, v201, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URL(v14, v204, v205, v206, v207, v208, v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v210, v211, v212, v213, v214, v215, v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = objc_msgSend__im_fileSizeFor_(v203, v218, (uint64_t)v217, v219, v220, v221, v222);

  if (v223 > a5)
  {
LABEL_98:
    v85 = 1;
    goto LABEL_48;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v228 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v228, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFB1000, v228, OS_LOG_TYPE_INFO, "Performing a pass-through transcode for format conversion for 8-bit RCS video", buf, 2u);
    }

  }
  objc_msgSend__transcodeVideoPassThrough_completionHandler_(self, v224, (uint64_t)v14, (uint64_t)v24, v225, v226, v227);
LABEL_287:

}

- (void)_transcodeVideoPassThrough:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  _QWORD *v80;
  __int128 *p_buf;
  _QWORD v82[5];
  id v83;
  __int128 buf;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = IMOSLoggingEnabled();
  v8 = (uint64_t *)MEMORY[0x24BDB1C30];
  if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *v8;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_21DFB1000, v9, OS_LOG_TYPE_INFO, "Converting export to %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v85 = 0x3032000000;
  v86 = sub_21DFB5EBC;
  v87 = sub_21DFB5ECC;
  v88 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = sub_21DFB5EBC;
  v82[4] = sub_21DFB5ECC;
  v83 = 0;
  v11 = objc_alloc(MEMORY[0x24BDB23A8]);
  v16 = (void *)objc_msgSend_initWithAsset_presetName_(v11, v12, (uint64_t)v5, *MEMORY[0x24BDB19E0], v13, v14, v15);
  v17 = (const __CFString *)*v8;
  objc_msgSend_setOutputFileType_(v16, v18, *v8, v19, v20, v21, v22);
  v23 = (__CFString *)UTTypeCopyPreferredTagWithClass(v17, (CFStringRef)*MEMORY[0x24BDC1658]);
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v24, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URL(v5, v31, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(v37, v38, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingPathExtension(v44, v45, v46, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__randomTemporaryPathWithSuffix_fileName_(v30, v52, (uint64_t)v23, (uint64_t)v51, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v57, (uint64_t)v56, v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOutputURL_(v16, v63, (uint64_t)v62, v64, v65, v66, v67);

  v76[0] = MEMORY[0x24BDAC760];
  v76[1] = 3221225472;
  v76[2] = sub_21DFB5ED4;
  v76[3] = &unk_24E1FF708;
  v68 = v16;
  v77 = v68;
  v80 = v82;
  p_buf = &buf;
  v69 = v6;
  v79 = v69;
  v70 = v5;
  v78 = v70;
  objc_msgSend_exportAsynchronouslyWithCompletionHandler_(v68, v71, (uint64_t)v76, v72, v73, v74, v75);

  _Block_object_dispose(v82, 8);
  _Block_object_dispose(&buf, 8);

}

- (void)transcodeFileTransfer:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13
{
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  NSObject *v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  const __CFString *v87;
  BOOL v88;
  NSObject *v89;
  os_signpost_id_t v90;
  unint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  id v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  NSObject *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  NSObject *v154;
  void *v155;
  NSObject *v156;
  const char *v157;
  NSObject *v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSObject *v166;
  const __CFString *v167;
  const __CFString *v168;
  const __CFString *v169;
  const __CFString *v170;
  uint64_t v171;
  NSObject *v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  NSObject *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  NSObject *v214;
  char v215;
  NSObject *v216;
  const __CFString *v217;
  const __CFString *v218;
  NSObject *v219;
  NSObject *v220;
  const char *v221;
  NSObject *v222;
  NSObject *v223;
  void *v224;
  __CFString *v225;
  NSObject *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  NSObject *v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  NSObject *v241;
  uint64_t v242;
  NSObject *v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  unint64_t v254;
  NSObject *group;
  void *v256;
  void *v257;
  void *v258;
  os_signpost_id_t spid;
  char shouldPreserveAAEncoding;
  char v261;
  unsigned int shouldPreserveHDREncoding;
  unsigned int v265;
  void *v266;
  uint64_t v267;
  uint64_t v268;
  id v269;
  id v270;
  id v271;
  NSObject *log;
  id v273;
  _QWORD v274[5];
  NSObject *v275;
  _QWORD *v276;
  uint64_t *v277;
  uint64_t *v278;
  uint64_t *v279;
  char v280;
  _QWORD v281[5];
  NSObject *v282;
  uint64_t *v283;
  uint64_t *v284;
  uint64_t *v285;
  uint64_t *v286;
  char v287;
  uint64_t v288;
  uint64_t *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t *v293;
  uint64_t v294;
  uint64_t (*v295)(uint64_t, uint64_t);
  void (*v296)(uint64_t);
  id v297;
  uint64_t v298;
  uint64_t *v299;
  uint64_t v300;
  uint64_t (*v301)(uint64_t, uint64_t);
  void (*v302)(uint64_t);
  id v303;
  uint64_t v304;
  uint64_t *v305;
  uint64_t v306;
  uint64_t (*v307)(uint64_t, uint64_t);
  void (*v308)(uint64_t);
  id v309;
  _QWORD v310[4];
  uint64_t v311;
  uint64_t *v312;
  uint64_t v313;
  uint64_t (*v314)(uint64_t, uint64_t);
  void (*v315)(uint64_t);
  id v316;
  uint64_t v317;
  uint64_t *v318;
  uint64_t v319;
  uint64_t (*v320)(uint64_t, uint64_t);
  void (*v321)(uint64_t);
  id v322;
  uint64_t v323;
  uint64_t *v324;
  uint64_t v325;
  uint64_t (*v326)(uint64_t, uint64_t);
  void (*v327)(uint64_t);
  id v328;
  char v329;
  uint8_t buf[4];
  uint64_t v331;
  __int16 v332;
  _BYTE v333[10];
  const __CFString *v334;
  __int16 v335;
  const __CFString *v336;
  __int16 v337;
  const __CFString *v338;
  uint64_t v339;
  _QWORD v340[4];

  v340[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v269 = a4;
  v270 = a5;
  v18 = a7;
  v273 = a8;
  v19 = a10;
  v271 = a13;
  v266 = v18;
  objc_msgSend_firstObject(v18, v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v268 = objc_msgSend_unsignedLongValue(v26, v27, v28, v29, v30, v31, v32);

  objc_msgSend_lastObject(v18, v33, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_unsignedLongValue(v39, v40, v41, v42, v43, v44, v45);

  v329 = 0;
  shouldPreserveHDREncoding = objc_msgSend_shouldPreserveHDREncoding_(IMTranscoder, v47, (uint64_t)v273, v48, v49, v50, v51);
  objc_msgSend_objectForKey_(v19, v52, *MEMORY[0x24BE50D70], v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v265 = objc_msgSend_BOOLValue(v57, v58, v59, v60, v61, v62, v63);

  objc_msgSend_objectForKey_(v19, v64, *MEMORY[0x24BE50D90], v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend_BOOLValue(v69, v70, v71, v72, v73, v74, v75);

  IMCheckVideoURLProperties();
  v261 = IMIsAAVideoURL();
  shouldPreserveAAEncoding = objc_msgSend_shouldPreserveAAEncoding_(IMTranscoder, v77, (uint64_t)v273, v78, v79, v80, v81);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v331 = v268;
      v332 = 2048;
      *(_QWORD *)v333 = v46;
      _os_log_impl(&dword_21DFB1000, v83, OS_LOG_TYPE_INFO, "BigSize: %zu SmallSize: %zu", buf, 0x16u);
    }

  }
  if ((a11 && v268 == v46 || a11 != 1 && v268 != v46) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v331 = v268;
      v332 = 2048;
      *(_QWORD *)v333 = v46;
      *(_WORD *)&v333[8] = 1024;
      LODWORD(v334) = a11;
      _os_log_impl(&dword_21DFB1000, v84, OS_LOG_TYPE_INFO, "Warning - bigSize (%lu), smallSize (%lu) combination does not match the number of reps requested (%d)", buf, 0x1Cu);
    }

  }
  BYTE4(v251) = shouldPreserveAAEncoding;
  BYTE3(v251) = v261;
  BYTE2(v251) = shouldPreserveHDREncoding;
  BYTE1(v251) = v329;
  LOBYTE(v251) = v76;
  v85 = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_isAnimojiV2_removeAlpha_isHDR_preserveHDR_isAA_preserveAA_fileSizeLimit_(self, v82, (uint64_t)v17, (uint64_t)v19, a6, (uint64_t)v269, (uint64_t)v270, v265, v251, v46);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      if (v85 <= 1)
        v87 = CFSTR("NO");
      else
        v87 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v331 = (uint64_t)v87;
      v332 = 2112;
      *(_QWORD *)v333 = CFSTR("NO");
      _os_log_impl(&dword_21DFB1000, v86, OS_LOG_TYPE_INFO, "NeedsTranscode? %@ isHDR %@", buf, 0x16u);
    }

  }
  v88 = v85 > 1;
  _iMessageTelemetryLogHandle();
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = os_signpost_id_generate(v89);
  log = v89;
  spid = v90;
  v91 = v90 - 1;
  if (v88)
  {
    v254 = v90 - 1;
    if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21DFB1000, log, OS_SIGNPOST_INTERVAL_BEGIN, v90, "IMTranscoderAV.transcode.type.av", " enableTelemetry=YES ", buf, 2u);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v331 = (uint64_t)v17;
        _os_log_impl(&dword_21DFB1000, v95, OS_LOG_TYPE_INFO, "Transfer %@ is a supported format, will transcode", buf, 0xCu);
      }

    }
    v339 = *MEMORY[0x24BDB21C0];
    v340[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v92, (uint64_t)v340, (uint64_t)&v339, 1, v93, v94);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    IMAVURLAssetOptionsWithExtraOptionsForWrite();
    v267 = objc_claimAutoreleasedReturnValue();

    v97 = objc_alloc(MEMORY[0x24BDB26C8]);
    v102 = (void *)objc_msgSend_initWithURL_options_(v97, v98, (uint64_t)v17, v267, v99, v100, v101);
    objc_msgSend_tracksWithMediaType_(v102, v103, *MEMORY[0x24BDB1D50], v104, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_count(v108, v109, v110, v111, v112, v113, v114);

    objc_msgSend_tracksWithMediaType_(v102, v116, *MEMORY[0x24BDB1CF0], v117, v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend_count(v121, v122, v123, v124, v125, v126, v127);

    objc_msgSend_tracks(v102, v129, v130, v131, v132, v133, v134);
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v135 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v331 = (uint64_t)v102;
        v332 = 1024;
        *(_DWORD *)v333 = v115;
        *(_WORD *)&v333[4] = 1024;
        *(_DWORD *)&v333[6] = v128;
        _os_log_impl(&dword_21DFB1000, v135, OS_LOG_TYPE_INFO, "Created asset %@ with %d video tracks, %d audio tracks", buf, 0x18u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v331 = (uint64_t)v258;
        _os_log_impl(&dword_21DFB1000, v136, OS_LOG_TYPE_INFO, "   => Tracks: %@", buf, 0xCu);
      }

    }
    if (!(v115 | v128))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v140 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v140, OS_LOG_TYPE_INFO, "No video or audio tracks found", buf, 2u);
        }

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v137, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -3, 0, v138, v139);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      if (v271)
        (*((void (**)(id, id, _QWORD, _QWORD, void *, _QWORD, uint64_t, _QWORD))v271 + 2))(v271, v17, 0, 0, v141, 0, 1, 0);

LABEL_135:
LABEL_136:

      v155 = (void *)v267;
      goto LABEL_137;
    }
    v323 = 0;
    v324 = &v323;
    v325 = 0x3032000000;
    v326 = sub_21DFB5EBC;
    v327 = sub_21DFB5ECC;
    v328 = 0;
    v317 = 0;
    v318 = &v317;
    v319 = 0x3032000000;
    v320 = sub_21DFB5EBC;
    v321 = sub_21DFB5ECC;
    v322 = 0;
    v311 = 0;
    v312 = &v311;
    v313 = 0x3032000000;
    v314 = sub_21DFB5EBC;
    v315 = sub_21DFB5ECC;
    v316 = 0;
    v310[0] = 0;
    v310[1] = v310;
    v310[2] = 0x2020000000;
    v310[3] = 0;
    v304 = 0;
    v305 = &v304;
    v306 = 0x3032000000;
    v307 = sub_21DFB5EBC;
    v308 = sub_21DFB5ECC;
    v309 = 0;
    v298 = 0;
    v299 = &v298;
    v300 = 0x3032000000;
    v301 = sub_21DFB5EBC;
    v302 = sub_21DFB5ECC;
    v303 = 0;
    v292 = 0;
    v293 = &v292;
    v294 = 0x3032000000;
    v295 = sub_21DFB5EBC;
    v296 = sub_21DFB5ECC;
    v297 = 0;
    v288 = 0;
    v289 = &v288;
    v290 = 0x2020000000;
    v291 = 0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v156 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v156, OS_LOG_TYPE_INFO, "Using a dispatch group when generating multiple video transcodings", buf, 2u);
      }

    }
    group = dispatch_group_create();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v158 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v331 = (uint64_t)v102;
        _os_log_impl(&dword_21DFB1000, v158, OS_LOG_TYPE_INFO, "Asset to use for bigSize: %@", buf, 0xCu);
      }

    }
    BYTE4(v252) = shouldPreserveAAEncoding;
    BYTE3(v252) = v261;
    BYTE2(v252) = shouldPreserveHDREncoding;
    BYTE1(v252) = v329;
    LOBYTE(v252) = v76;
    v159 = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_isAnimojiV2_removeAlpha_isHDR_preserveHDR_isAA_preserveAA_fileSizeLimit_(self, v157, (uint64_t)v17, (uint64_t)v19, a6, (uint64_t)v269, (uint64_t)v270, v265, v252, v268);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v166 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
      {
        v167 = CFSTR("NO");
        if (v159 <= 1)
          v168 = CFSTR("NO");
        else
          v168 = CFSTR("YES");
        *(_DWORD *)buf = 134219010;
        v331 = v268;
        if ((v265 & v76) != 0)
          v169 = CFSTR("YES");
        else
          v169 = CFSTR("NO");
        v332 = 2112;
        *(_QWORD *)v333 = v168;
        if (v329)
          v170 = CFSTR("YES");
        else
          v170 = CFSTR("NO");
        *(_WORD *)&v333[8] = 2112;
        if (shouldPreserveHDREncoding)
          v167 = CFSTR("YES");
        v334 = v169;
        v335 = 2112;
        v336 = v170;
        v337 = 2112;
        v338 = v167;
        _os_log_impl(&dword_21DFB1000, v166, OS_LOG_TYPE_INFO, "Do we need to transcode to get the big(%lu) representation? %@ (removeAlphaFromAnimojiV2 %@ isHDR %@ preserveHDR %@)", buf, 0x34u);
      }

    }
    v171 = MEMORY[0x24BDAC760];
    if (v159 < 2)
    {
      _IMTranscoderLinkFile(v17, v160, v161, v162, v163, v164, v165);
      v180 = objc_claimAutoreleasedReturnValue();
      v181 = (void *)v299[5];
      v299[5] = v180;

      v187 = objc_msgSend__fileSizeForTransfer_(self, v182, v299[5], v183, v184, v185, v186);
      v289[3] = v187;
    }
    else
    {
      dispatch_group_enter(group);
      v281[0] = v171;
      v281[1] = 3221225472;
      v281[2] = sub_21DFB78F0;
      v281[3] = &unk_24E1FF730;
      v283 = &v288;
      v281[4] = self;
      v287 = v76;
      v284 = &v298;
      v285 = &v304;
      v286 = &v292;
      v172 = group;
      v282 = v172;
      BYTE1(v253) = shouldPreserveAAEncoding;
      LOBYTE(v253) = v261;
      objc_msgSend__transcodeVideoAsync_target_maxBytes_isAnimojiV2_removeAlpha_preserveHDR_isAA_preserveAA_userInfo_completionHandler_(self, v173, (uint64_t)v102, a6, v268, v265, v76, shouldPreserveHDREncoding, v253, v19, v281);
      dispatch_group_wait(v172, 0xFFFFFFFFFFFFFFFFLL);

    }
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v174, v175, v176, v177, v178, v179);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v188, v189, v190, v191, v192, v193);
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    if (v299[5])
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v199 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
        {
          v200 = v299[5];
          v201 = v293[5];
          *(_DWORD *)buf = 138412546;
          v331 = v200;
          v332 = 2112;
          *(_QWORD *)v333 = v201;
          _os_log_impl(&dword_21DFB1000, v199, OS_LOG_TYPE_INFO, "Adding bigURL %@ to outputPaths with context: %@", buf, 0x16u);
        }

      }
      objc_msgSend_addObject_(v257, v194, v299[5], v195, v196, v197, v198);
      v207 = v293[5];
      if (v207)
      {
        objc_msgSend_addObject_(v256, v202, v207, v203, v204, v205, v206);
      }
      else
      {
        objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v202, 0, v203, v204, v205, v206);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v256, v209, (uint64_t)v208, v210, v211, v212, v213);

      }
    }
    if (v159 < 2)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_103;
      OSLogHandleForIMFoundationCategory();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v214, OS_LOG_TYPE_INFO, "We didn't have to transcode to get the big representation so we know we have to for the small one.", buf, 2u);
      }
    }
    else if (v305[5] || !v299[5])
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_103;
      OSLogHandleForIMFoundationCategory();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v214, OS_LOG_TYPE_INFO, "Generating the big representation was not successful. Let's potentially try for small.", buf, 2u);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v241 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
        {
          v242 = v289[3];
          *(_DWORD *)buf = 134218240;
          v331 = v242;
          v332 = 2048;
          *(_QWORD *)v333 = v46;
          _os_log_impl(&dword_21DFB1000, v241, OS_LOG_TYPE_INFO, "actualBigSize: %llu   smallSize %zu", buf, 0x16u);
        }

      }
      if (v289[3] < v46)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v243 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
          {
            v244 = v289[3];
            *(_DWORD *)buf = 134218240;
            v331 = v244;
            v332 = 2048;
            *(_QWORD *)v333 = v46;
            _os_log_impl(&dword_21DFB1000, v243, OS_LOG_TYPE_INFO, "Only using the big representation because the big output (%llu) fits in the small requirements (%zu)", buf, 0x16u);
          }

        }
        goto LABEL_104;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_103:
        if (v268 != v46)
        {
LABEL_108:
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v216 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
            {
              v217 = CFSTR("NO");
              if ((v265 & v76) != 0)
                v218 = CFSTR("YES");
              else
                v218 = CFSTR("NO");
              if (v329)
                v217 = CFSTR("YES");
              *(_DWORD *)buf = 138412546;
              v331 = (uint64_t)v218;
              v332 = 2112;
              *(_QWORD *)v333 = v217;
              _os_log_impl(&dword_21DFB1000, v216, OS_LOG_TYPE_INFO, "There were two sizes requested && big doesn't satisfy the requirements for both, generating small. removeAlphaForAnimojiV2 %@ isHDR %@", buf, 0x16u);
            }

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v219 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v331 = (uint64_t)v102;
              _os_log_impl(&dword_21DFB1000, v219, OS_LOG_TYPE_INFO, "Asset to use for smallSize: %@", buf, 0xCu);
            }

          }
          dispatch_group_enter(group);
          v274[0] = MEMORY[0x24BDAC760];
          v274[1] = 3221225472;
          v274[2] = sub_21DFB7AAC;
          v274[3] = &unk_24E1FF730;
          v276 = v310;
          v274[4] = self;
          v280 = v76;
          v277 = &v317;
          v278 = &v311;
          v279 = &v323;
          v220 = group;
          v275 = v220;
          BYTE1(v253) = shouldPreserveAAEncoding;
          LOBYTE(v253) = v261;
          objc_msgSend__transcodeVideoAsync_target_maxBytes_isAnimojiV2_removeAlpha_preserveHDR_isAA_preserveAA_userInfo_completionHandler_(self, v221, (uint64_t)v102, a6, v46, v265, v76, 0, v253, v19, v274);
          dispatch_group_wait(v220, 0xFFFFFFFFFFFFFFFFLL);

LABEL_122:
          if (!v324[5] && v318[5])
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v232 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v232, OS_LOG_TYPE_INFO))
              {
                v233 = v318[5];
                v234 = v312[5];
                *(_DWORD *)buf = 138412546;
                v331 = v233;
                v332 = 2112;
                *(_QWORD *)v333 = v234;
                _os_log_impl(&dword_21DFB1000, v232, OS_LOG_TYPE_INFO, "Adding smallURL %@ to outputPaths with context: %@", buf, 0x16u);
              }

            }
            objc_msgSend_addObject_(v257, v227, v318[5], v228, v229, v230, v231);
            v240 = v312[5];
            if (v240)
            {
              objc_msgSend_addObject_(v256, v235, v240, v236, v237, v238, v239);
            }
            else
            {
              objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v235, 0, v236, v237, v238, v239);
              v245 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v256, v246, (uint64_t)v245, v247, v248, v249, v250);

            }
          }
          v222 = log;
          v223 = v222;
          if (v254 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v222))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21DFB1000, v223, OS_SIGNPOST_INTERVAL_END, spid, "IMTranscoderAV.transcode.type.av", " enableTelemetry=YES ", buf, 2u);
          }

          v224 = (void *)v324[5];
          if (!v224)
            v224 = (void *)v305[5];
          v225 = v224;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v226 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v226, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v331 = (uint64_t)v17;
              v332 = 2112;
              *(_QWORD *)v333 = v257;
              *(_WORD *)&v333[8] = 2112;
              v334 = v225;
              _os_log_impl(&dword_21DFB1000, v226, OS_LOG_TYPE_INFO, "Calling completionBlock with: transfer %@ outputPaths %@ error %@", buf, 0x20u);
            }

          }
          if (v271)
            (*((void (**)(id, id, void *, void *, __CFString *, BOOL, uint64_t, _QWORD))v271 + 2))(v271, v17, v257, v256, v225, v225 == 0, 1, 0);

          _Block_object_dispose(&v288, 8);
          _Block_object_dispose(&v292, 8);

          _Block_object_dispose(&v298, 8);
          _Block_object_dispose(&v304, 8);

          _Block_object_dispose(v310, 8);
          _Block_object_dispose(&v311, 8);

          _Block_object_dispose(&v317, 8);
          _Block_object_dispose(&v323, 8);

          goto LABEL_135;
        }
LABEL_104:
        if ((v265 & v76 & 1) == 0)
        {
          v215 = shouldPreserveHDREncoding;
          if (!v329)
            v215 = 1;
          if ((v215 & 1) != 0)
            goto LABEL_122;
        }
        goto LABEL_108;
      }
      OSLogHandleForIMFoundationCategory();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v214, OS_LOG_TYPE_INFO, "bigURL was too big for smallSize or there was a FS error", buf, 2u);
      }
    }

    goto LABEL_103;
  }
  if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21DFB1000, log, OS_SIGNPOST_EVENT, v90, "IMTranscoderImage.transcode.none", " enableTelemetry=YES ", buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v148 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v331 = (uint64_t)v17;
      _os_log_impl(&dword_21DFB1000, v148, OS_LOG_TYPE_INFO, "Transfer %@ doesn't need any processing", buf, 0xCu);
    }

  }
  _IMTranscoderLinkFile(v17, v142, v143, v144, v145, v146, v147);
  v267 = objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v154 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v331 = v267;
      _os_log_impl(&dword_21DFB1000, v154, OS_LOG_TYPE_INFO, "We need a hard link to this file for our clients who assume it's a file we created: %@", buf, 0xCu);
    }

  }
  v155 = (void *)v267;
  if (v271)
  {
    if (v267)
    {
      objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v149, v267, v150, v151, v152, v153, 0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id, void *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))v271 + 2))(v271, v17, v102, 0, 0, 1, 0, 0);
    }
    else
    {
      objc_msgSend_array(MEMORY[0x24BDBCE30], v149, 0, v150, v151, v152, v153);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id, void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v271 + 2))(v271, v17, v102, 0, 0, 0, 0, 0);
    }
    goto LABEL_136;
  }
LABEL_137:

}

@end
