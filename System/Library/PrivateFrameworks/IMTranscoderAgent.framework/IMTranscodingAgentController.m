@implementation IMTranscodingAgentController

+ (id)sharedInstance
{
  if (qword_253E9BB48 != -1)
    dispatch_once(&qword_253E9BB48, &unk_24E1FF698);
  return (id)qword_253E9BB50;
}

- (void)_registerTranscoders
{
  id v3;
  IMTranscoder_Image *v4;
  IMTranscoder_AV *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  NSArray *transcoders;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *fallbackTranscoders;
  IMFallbackTranscoder *v21;

  if (!self->_transcoders)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE30]);
    v4 = objc_alloc_init(IMTranscoder_Image);
    v5 = objc_alloc_init(IMTranscoder_AV);
    v11 = (NSArray *)objc_msgSend_initWithObjects_(v3, v6, (uint64_t)v4, v7, v8, v9, v10, v5, 0);
    transcoders = self->_transcoders;
    self->_transcoders = v11;

    v13 = objc_alloc(MEMORY[0x24BDBCE30]);
    v21 = objc_alloc_init(IMFallbackTranscoder);
    v19 = (NSArray *)objc_msgSend_initWithObjects_(v13, v14, (uint64_t)v21, v15, v16, v17, v18, 0);
    fallbackTranscoders = self->_fallbackTranscoders;
    self->_fallbackTranscoders = v19;

  }
}

- (IMTranscodingAgentController)init
{
  IMTranscodingAgentController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *previewGenerationQueue;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)IMTranscodingAgentController;
  v2 = -[IMTranscodingAgentController init](&v18, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.IMTranscoderQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    dispatch_get_global_queue(-2, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

    v7 = dispatch_queue_create("com.apple.IMTranscoderPreviewGenerationQueue", 0);
    previewGenerationQueue = v2->_previewGenerationQueue;
    v2->_previewGenerationQueue = (OS_dispatch_queue *)v7;

    v9 = v2->_previewGenerationQueue;
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v9, v10);

    objc_msgSend__registerTranscoders(v2, v11, v12, v13, v14, v15, v16);
  }
  return v2;
}

- (id)_findTranscoderForUTI:(id)a3
{
  id v4;
  NSArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_transcoders;
  v9 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, (uint64_t)v27, 16, v7, v8);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_opt_class();
        if ((objc_msgSend_supportsUTI_(v13, v14, (uint64_t)v4, v15, v16, v17, v18, (_QWORD)v23) & 1) != 0)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v19, (uint64_t)&v23, (uint64_t)v27, 16, v20, v21);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)shouldProcessFileTransfer:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 target:(int64_t)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  uint64_t shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  objc_msgSend__findTranscoderForUTI_(self, v20, (uint64_t)v16, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25;
  if (v25)
  {
    shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities_(v25, v26, (uint64_t)v15, (uint64_t)v17, a6, (uint64_t)v16, (uint64_t)v18, a8, v19);
    v34 = objc_msgSend_transcodeProcessingRequired_(v27, v29, shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities, v30, v31, v32, v33);
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 fallback:(BOOL)a12 representations:(int64_t)a13 isLQMEnabled:(BOOL)a14 completionBlock:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (**v73)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v74;
  NSObject *queue;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (**v82)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int shouldPreserveHEIFEncoding_target_sourceUTI;
  int v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  id v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  void *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  int shouldPreserveHDREncoding;
  int v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  id v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSObject *v155;
  void *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  int shouldProcessFileTransfer_utiType_transcoderUserInfo_target_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  void *v185;
  NSObject *v186;
  id v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  NSObject *v194;
  void *v195;
  int64_t v196;
  _BOOL4 v197;
  id v198;
  id v200;
  id v201;
  id v202;
  _QWORD v203[4];
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  void (**v211)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int64_t v212;
  unint64_t v213;
  int64_t v214;
  BOOL v215;
  _QWORD v216[5];
  id v217;
  id v218;
  id v219;
  id v220;
  void (**v221)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v222;
  int64_t v223;
  unint64_t v224;
  BOOL v225;
  _QWORD block[5];
  id v227;
  id v228;
  id v229;
  void (**v230)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v231[4];
  id v232;
  void *v233;
  uint8_t buf[4];
  unint64_t v235;
  uint64_t v236;

  v197 = a5;
  v236 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v202 = a4;
  v200 = a6;
  v20 = a8;
  v201 = a9;
  v21 = a11;
  v22 = a15;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v235 = (unint64_t)v19;
      _os_log_impl(&dword_21DFB1000, v23, OS_LOG_TYPE_INFO, "Transcoder received request to transcode %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v235 = (unint64_t)v202;
      _os_log_impl(&dword_21DFB1000, v24, OS_LOG_TYPE_INFO, "                       UTI: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v235 = (unint64_t)v200;
      _os_log_impl(&dword_21DFB1000, v25, OS_LOG_TYPE_INFO, "     Allow Unfiltered UTIs: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v235 = (unint64_t)v20;
      _os_log_impl(&dword_21DFB1000, v26, OS_LOG_TYPE_INFO, "                     Sizes: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v235 = a10;
      _os_log_impl(&dword_21DFB1000, v27, OS_LOG_TYPE_INFO, "             Max Dimension: %ld", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v235 = (unint64_t)v21;
      _os_log_impl(&dword_21DFB1000, v33, OS_LOG_TYPE_INFO, "           Transcoder Info: %@", buf, 0xCu);
    }

  }
  if (v21)
  {
    objc_msgSend_objectForKey_(v21, v28, *MEMORY[0x24BE50D58], v29, v30, v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_BOOLValue(v34, v35, v36, v37, v38, v39, v40);

    if (v41)
    {
      if (IMIsHEVCWithAlphaVideoURL())
      {
        v48 = (void *)objc_msgSend_mutableCopy(v21, v42, v43, v44, v45, v46, v47);
        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v49, 1, v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v48, v55, (uint64_t)v54, *MEMORY[0x24BE50D70], v56, v57, v58);

        v65 = objc_msgSend_copy(v48, v59, v60, v61, v62, v63, v64);
        v21 = (id)v65;
      }
    }
  }
  v231[0] = MEMORY[0x24BDAC760];
  v231[1] = 3221225472;
  v231[2] = sub_21DFCB0FC;
  v231[3] = &unk_24E1FFA10;
  v66 = v22;
  v232 = v66;
  v73 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2207A8350](v231);
  if (a12)
  {
    objc_msgSend_lastObject(self->_fallbackTranscoders, v67, v68, v69, v70, v71, v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_21DFCB278;
      block[3] = &unk_24E1FFA60;
      block[4] = self;
      v227 = v19;
      v228 = v202;
      v21 = v21;
      v229 = v21;
      v230 = v73;
      dispatch_async(queue, block);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v102 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v235 = (unint64_t)v19;
          _os_log_impl(&dword_21DFB1000, v102, OS_LOG_TYPE_INFO, "Transcoding Not transcoding file %@", buf, 0xCu);
        }

      }
      v73[2](v73, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    v198 = v20;
    v82 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2207A8350](v73);
    v83 = a13;
    if (a13 == 2)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v90, OS_LOG_TYPE_INFO, "Thumbnail with single requested, creating overrideBlock", buf, 2u);
        }

      }
      objc_msgSend_firstObject(v198, v84, v85, v86, v87, v88, v89);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = v91;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v92, (uint64_t)&v233, 1, v93, v94, v95);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v216[0] = MEMORY[0x24BDAC760];
      v216[1] = 3221225472;
      v216[2] = sub_21DFCB360;
      v216[3] = &unk_24E1FFA88;
      v216[4] = self;
      v217 = v19;
      v223 = a7;
      v218 = v198;
      v219 = v201;
      v224 = a10;
      v220 = v21;
      v225 = a14;
      v221 = v73;
      v222 = v82;
      v96 = (void *)MEMORY[0x2207A8350](v216);
      v82 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2207A8350]();

      v83 = 0;
    }
    else
    {
      v20 = v198;
    }
    v196 = v83;
    if (v197)
    {
      if (v21)
        v97 = (id)objc_msgSend_mutableCopy(v21, v76, v77, v78, v79, v80, v81);
      else
        v97 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v103 = v97;
      objc_msgSend_setObject_forKeyedSubscript_(v97, v98, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("isSticker"), v99, v100, v101);
      v110 = objc_msgSend_copy(v103, v104, v105, v106, v107, v108, v109);

      v21 = (id)v110;
    }
    shouldPreserveHEIFEncoding_target_sourceUTI = objc_msgSend_shouldPreserveHEIFEncoding_target_sourceUTI_(IMTranscoder, v76, (uint64_t)v201, a7, (uint64_t)v202, v80, v81);
    v112 = IMOSLoggingEnabled();
    if (shouldPreserveHEIFEncoding_target_sourceUTI)
    {
      if (v112)
      {
        OSLogHandleForIMFoundationCategory();
        v119 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v119, OS_LOG_TYPE_INFO, "Preserving HEIF encoding if possible.", buf, 2u);
        }

      }
      if (v21)
        v120 = (id)objc_msgSend_mutableCopy(v21, v113, v114, v115, v116, v117, v118);
      else
        v120 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v127 = v120;
      objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v121, 1, v122, v123, v124, v125);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v127, v129, (uint64_t)v128, (uint64_t)CFSTR("preserveHEIF"), v130, v131, v132);

      v139 = objc_msgSend_copy(v127, v133, v134, v135, v136, v137, v138);
      v21 = (id)v139;
    }
    else if (v112)
    {
      OSLogHandleForIMFoundationCategory();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v126, OS_LOG_TYPE_INFO, "Not preserving HEIF encoding", buf, 2u);
      }

    }
    shouldPreserveHDREncoding = objc_msgSend_shouldPreserveHDREncoding_(IMTranscoder, v113, (uint64_t)v201, v115, v116, v117, v118);
    v141 = IMOSLoggingEnabled();
    if (shouldPreserveHDREncoding)
    {
      if (v141)
      {
        OSLogHandleForIMFoundationCategory();
        v148 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v148, OS_LOG_TYPE_INFO, "Preserve HDR output", buf, 2u);
        }

      }
      if (v21)
        v149 = (id)objc_msgSend_mutableCopy(v21, v142, v143, v144, v145, v146, v147);
      else
        v149 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v156 = v149;
      objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v150, 1, v151, v152, v153, v154);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v156, v158, (uint64_t)v157, (uint64_t)CFSTR("preserveHDR"), v159, v160, v161);

      v168 = objc_msgSend_copy(v156, v162, v163, v164, v165, v166, v167);
      v21 = (id)v168;
    }
    else if (v141)
    {
      OSLogHandleForIMFoundationCategory();
      v155 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v155, OS_LOG_TYPE_INFO, "Will NOT preserve HDR output", buf, 2u);
      }

    }
    objc_msgSend_lastObject(v20, v142, v143, v144, v145, v146, v147);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend_unsignedLongValue(v169, v170, v171, v172, v173, v174, v175);
    shouldProcessFileTransfer_utiType_transcoderUserInfo_target_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities = objc_msgSend_shouldProcessFileTransfer_utiType_transcoderUserInfo_target_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities_(self, v177, (uint64_t)v19, (uint64_t)v202, (uint64_t)v21, a7, (uint64_t)v200, v176, v201);

    if (shouldProcessFileTransfer_utiType_transcoderUserInfo_target_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities
      && (objc_msgSend__findTranscoderForUTI_(self, v179, (uint64_t)v202, v180, v181, v182, v183),
          v184 = (void *)objc_claimAutoreleasedReturnValue(),
          (v185 = v184) != 0))
    {
      v186 = self->_queue;
      v203[0] = MEMORY[0x24BDAC760];
      v203[1] = 3221225472;
      v203[2] = sub_21DFCB580;
      v203[3] = &unk_24E1FFAB0;
      v204 = v184;
      v205 = v19;
      v206 = v202;
      v207 = v200;
      v212 = a7;
      v208 = v20;
      v209 = v201;
      v213 = a10;
      v210 = v21;
      v214 = v196;
      v215 = a14;
      v211 = v82;
      v187 = v185;
      dispatch_async(v186, v203);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v194 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v194, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v235 = (unint64_t)v202;
          _os_log_impl(&dword_21DFB1000, v194, OS_LOG_TYPE_INFO, "Not transcoding attachment file format: %@", buf, 0xCu);
        }

      }
      _IMTranscoderLinkFile(v19, v188, v189, v190, v191, v192, v193);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      IMSingleObjectArray();
      v187 = (id)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, id, id, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))v82)[2](v82, v19, v187, 0, 0, 1, 0, 0);
    }

  }
}

- (BOOL)isMovieType:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  objc_msgSend_path(a3, a2, (uint64_t)a3, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathExtension(v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_typeWithFilenameExtension_(MEMORY[0x24BDF8238], v15, (uint64_t)v14, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_conformsToType_(v20, v21, *MEMORY[0x24BDF84B8], v22, v23, v24, v25);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)transcodeThumbnailFor:(id)a3 target:(int64_t)a4 allSizes:(id)a5 commonCapabilities:(id)a6 maxDimension:(unint64_t)a7 transcoderUserInfo:(id)a8 isLQMEnabled:(BOOL)a9 outputURLs:(id)a10 outputContextInfo:(id)a11 attemptedTranscode:(BOOL)a12 additionalOutPutContext:(id)a13 completionBlock:(id)a14
{
  id v18;
  const __CFURL *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  CGImage *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFURL *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __CFString *v63;
  CGImageDestination *v64;
  _BOOL4 v65;
  int v66;
  NSObject *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  const char *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  const __CFURL *v110;
  id v111;
  id v114;
  id v115;
  id v116;
  const __CFURL *v117;
  _QWORD v118[4];
  id v119;
  const __CFURL *v120;
  id v121;
  id v122;
  id v123;
  BOOL v124;
  id v125;
  void *v126;
  _BYTE v127[32];
  uint64_t v128;
  uint8_t buf[16];
  __int128 v130;
  uint64_t v131;
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v116 = a5;
  v114 = a6;
  v115 = a8;
  v109 = a10;
  v106 = a11;
  v111 = a13;
  v108 = a14;
  v19 = (const __CFURL *)v18;
  if ((objc_msgSend_isMovieType_(self, v20, (uint64_t)v19, v21, v22, v23, v24) & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_21DFB1000, v31, OS_LOG_TYPE_INFO, "Generating thumbnail of video %@", buf, 0xCu);
      }

    }
    v131 = 0;
    *(_OWORD *)buf = 0u;
    v130 = 0u;
    IMPreviewConstraintsFromDictionary();
    v32 = (void *)MEMORY[0x24BE51240];
    objc_msgSend_fromMeContext(MEMORY[0x24BE51280], v33, v34, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 0;
    *(_OWORD *)v127 = *(_OWORD *)buf;
    *(_OWORD *)&v127[16] = v130;
    v128 = v131;
    v41 = (CGImage *)objc_msgSend_newPreviewFromSourceURL_senderContext_withPreviewConstraints_skipPlayButton_error_(v32, v40, (uint64_t)v19, (uint64_t)v39, (uint64_t)v127, 1, (uint64_t)&v125);
    v42 = v125;

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v43, v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_im_randomTemporaryFileURLWithFileName_(v49, v50, (uint64_t)CFSTR("preview.jpg"), v51, v52, v53, v54);
    v55 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    v56 = (void *)*MEMORY[0x24BDF8438];
    objc_msgSend_identifier((void *)*MEMORY[0x24BDF8438], v57, v58, v59, v60, v61, v62);
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v64 = CGImageDestinationCreateWithURL(v55, v63, 1uLL, 0);

    v117 = v19;
    if (v64)
    {
      CGImageDestinationAddImage(v64, v41, 0);
      v65 = CGImageDestinationFinalize(v64);
      v66 = IMOSLoggingEnabled();
      if (v65)
      {
        if (v66)
        {
          OSLogHandleForIMFoundationCategory();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v127 = 138412290;
            *(_QWORD *)&v127[4] = v55;
            _os_log_impl(&dword_21DFB1000, v67, OS_LOG_TYPE_INFO, "Generated frame of movie as jpeg to %@", v127, 0xCu);
          }

        }
        v117 = v55;

      }
      else
      {
        v117 = v19;
        if (v66)
        {
          OSLogHandleForIMFoundationCategory();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v127 = 138412546;
            *(_QWORD *)&v127[4] = v19;
            *(_WORD *)&v127[12] = 2112;
            *(_QWORD *)&v127[14] = v55;
            _os_log_impl(&dword_21DFB1000, v68, OS_LOG_TYPE_INFO, "Failed to save JPEG frame of movie %@ to %@", v127, 0x16u);
          }

          v117 = v19;
        }
      }
      CFRelease(v64);
    }
    if (v41)
      CFRelease(v41);

    objc_msgSend_identifier(v56, v69, v70, v71, v72, v73, v74);
  }
  else
  {
    v56 = (void *)*MEMORY[0x24BDF8438];
    v117 = v19;
    objc_msgSend_identifier((void *)*MEMORY[0x24BDF8438], v25, v26, v27, v28, v29, v30);
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__findTranscoderForUTI_(self, v76, (uint64_t)v75, v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v117;
      _os_log_impl(&dword_21DFB1000, v88, OS_LOG_TYPE_INFO, "Transcoding thumbnail from %@", buf, 0xCu);
    }

  }
  objc_msgSend_identifier(v56, v82, v83, v84, v85, v86, v87);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v116, v90, v91, v92, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v96;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v97, (uint64_t)&v126, 1, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = MEMORY[0x24BDAC760];
  v118[1] = 3221225472;
  v118[2] = sub_21DFCBC04;
  v118[3] = &unk_24E1FFAD8;
  v119 = v111;
  v120 = v19;
  v121 = v109;
  v122 = v106;
  v123 = v108;
  v124 = a12;
  v107 = v106;
  v102 = v109;
  v110 = v19;
  v103 = v108;
  v104 = v111;
  objc_msgSend_transcodeFileTransfer_utiType_allowUnfilteredUTIs_target_sizes_commonCapabilities_maxDimension_transcoderUserInfo_representations_isLQMEnabled_completionBlock_(v81, v105, (uint64_t)v117, (uint64_t)v89, MEMORY[0x24BDBD1A8], a4, (uint64_t)v101, v114, a7, v115, 0, a9, v118);

}

- (void)transcodeFileTransferData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 fallBack:(BOOL)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *queue;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  IMTranscodingAgentController *v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend_lastObject(self->_fallbackTranscoders, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    queue = self->_queue;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_21DFCBFD8;
    v25[3] = &unk_24E1FFB00;
    v31 = a6;
    v26 = v13;
    v27 = self;
    v28 = v12;
    v29 = v14;
    v30 = v15;
    dispatch_async(queue, v25);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v13;
        _os_log_impl(&dword_21DFB1000, v24, OS_LOG_TYPE_INFO, "Transcoding Not transcoding attachment file format: %@", buf, 0xCu);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, 0, 0, 0, 0, 0);
  }

}

- (void)generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 completionBlock:(id)a5
{
  id v7;
  void (**v8)(id, _BOOL8, uint64_t, _QWORD);
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
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
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  id v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
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
  uint64_t isTrustedSender;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  NSObject *v167;
  id v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  double var0;
  double var2;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  CGImage *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  id v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  id v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  NSObject *v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  NSObject *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const __CFURL *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  __CFString *v264;
  CGImageDestination *v265;
  id v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  NSObject *v272;
  id v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  NSObject *v279;
  uint64_t v280;
  _BOOL8 v281;
  id v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  __CFString *v288;
  id v289;
  void *v290;
  _QWORD v291[4];
  id v292;
  NSObject *v293;
  __int128 *v294;
  uint64_t *v295;
  uint64_t *v296;
  _QWORD v297[4];
  id v298;
  NSObject *v299;
  uint64_t *v300;
  uint64_t *v301;
  __int128 *p_buf;
  id obj;
  uint64_t v304;
  uint64_t *v305;
  uint64_t v306;
  uint64_t (*v307)(uint64_t, uint64_t);
  void (*v308)(uint64_t);
  id v309;
  uint64_t v310;
  uint64_t *v311;
  uint64_t v312;
  char v313;
  uint8_t v314[4];
  const __CFURL *v315;
  __int128 buf;
  uint64_t v317;
  uint64_t (*v318)(uint64_t, uint64_t);
  void (*v319)(uint64_t);
  id v320;
  uint64_t v321;

  v321 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _BOOL8, uint64_t, _QWORD))a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_21DFB1000, v15, OS_LOG_TYPE_INFO, "Transcoder received request to generate safe render: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  v16 = (void *)MEMORY[0x24BDF8238];
  objc_msgSend_lastPathComponent(v7, v9, v10, v11, v12, v13, v14);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathExtension((void *)v17, v18, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_typeWithFilenameExtension_(v16, v25, (uint64_t)v24, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = objc_msgSend_conformsToType_(v30, v31, *MEMORY[0x24BDF8410], v32, v33, v34, v35);
  v41 = objc_msgSend_conformsToType_(v30, v36, *MEMORY[0x24BDF84B8], v37, v38, v39, v40);
  v47 = objc_msgSend_conformsToType_(v30, v42, *MEMORY[0x24BDF82D0], v43, v44, v45, v46);
  objc_msgSend_im_lastPathComponent(v7, v48, v49, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_containsString_(v54, v55, *MEMORY[0x24BE50DB8], v56, v57, v58, v59);

  v61 = v60 | v17;
  if (((v60 | v17 | v41 | v47) & 1) != 0)
  {
    v310 = 0;
    v311 = &v310;
    v312 = 0x2020000000;
    v313 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v317 = 0x3032000000;
    v318 = sub_21DFCCE10;
    v319 = sub_21DFCCE20;
    v320 = 0;
    v304 = 0;
    v305 = &v304;
    v306 = 0x3032000000;
    v307 = sub_21DFCCE10;
    v308 = sub_21DFCCE20;
    v309 = 0;
    v62 = dispatch_group_create();
    objc_msgSend_untrustedContext(MEMORY[0x24BE51280], v63, v64, v65, v66, v67, v68);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v61)
    {
      if (v41)
      {
        dispatch_group_enter(v62);
        v173 = (void *)MEMORY[0x24BE511A0];
        if (a4->var0 >= 1200.0)
          var0 = a4->var0;
        else
          var0 = 1200.0;
        var2 = a4->var2;
        v297[0] = MEMORY[0x24BDAC760];
        v297[1] = 3221225472;
        v297[2] = sub_21DFCCE28;
        v297[3] = &unk_24E1FFB28;
        v300 = &v304;
        v298 = v7;
        v301 = &v310;
        p_buf = &buf;
        v299 = v62;
        objc_msgSend_generateMoviePreview_senderContext_maxPxWidth_minThumbnailPxSize_scale_withCompletionBlock_(v173, v176, (uint64_t)v298, (uint64_t)v290, (uint64_t)v297, v177, v178, var0, a4->var1.width, a4->var1.height, var2);

        v75 = v298;
      }
      else
      {
        if (!v47)
        {
LABEL_56:
          dispatch_group_wait(v62, 0xFFFFFFFFFFFFFFFFLL);
          if (v8)
          {
            v280 = *((_QWORD *)&buf + 1);
            if (*((_BYTE *)v311 + 24))
            {
              v281 = 1;
            }
            else if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
            {
              v281 = 0;
            }
            else
            {
              v282 = objc_alloc(MEMORY[0x24BDD1540]);
              v286 = objc_msgSend_initWithDomain_code_userInfo_(v282, v283, *MEMORY[0x24BE50FD0], 1, 0, v284, v285);
              v287 = *(void **)(*((_QWORD *)&buf + 1) + 40);
              *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v286;

              v280 = *((_QWORD *)&buf + 1);
              v281 = *((_BYTE *)v311 + 24) != 0;
            }
            v8[2](v8, v281, v305[5], *(_QWORD *)(v280 + 40));
          }

          _Block_object_dispose(&v304, 8);
          _Block_object_dispose(&buf, 8);

          _Block_object_dispose(&v310, 8);
          goto LABEL_64;
        }
        dispatch_group_enter(v62);
        v216 = (void *)MEMORY[0x24BE511A0];
        v291[0] = MEMORY[0x24BDAC760];
        v291[1] = 3221225472;
        v291[2] = sub_21DFCD0D4;
        v291[3] = &unk_24E1FFB50;
        v294 = &buf;
        v295 = &v304;
        v292 = v7;
        v296 = &v310;
        v293 = v62;
        objc_msgSend_generateAudioPreview_senderContext_withCompletionBlock_(v216, v217, (uint64_t)v292, (uint64_t)v290, (uint64_t)v291, v218, v219);

        v75 = v292;
      }
LABEL_55:

      goto LABEL_56;
    }
    v72 = a4->var0;
    if (a4->var0 < 1200.0)
      v72 = 1200.0;
    *(float *)&v72 = v72;
    v73 = a4->var2;
    *(float *)&v73 = v73;
    v74 = *((_QWORD *)&buf + 1);
    obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
    objc_msgSend_generateImagePreviewForFileURL_senderContext_maxPixelDimension_scale_error_(MEMORY[0x24BE511A0], v69, (uint64_t)v7, (uint64_t)v290, (uint64_t)&obj, v70, v71, v72, v73);
    v75 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v74 + 40), obj);
    if (v75
      && (objc_msgSend_utTypeString(v75, v76, v77, v78, v79, v80, v81),
          (v82 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      && (objc_msgSend_utTypeString(v75, v76, v77, v78, v79, v80, v81),
          v83 = (void *)objc_claimAutoreleasedReturnValue(),
          v90 = objc_msgSend_length(v83, v84, v85, v86, v87, v88, v89) == 0,
          v83,
          v82,
          !v90))
    {
      v91 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend_utTypeString(v75, v92, v93, v94, v95, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(v91, v99, (uint64_t)v98, *MEMORY[0x24BE50F50], v100, v101, v102);

      v103 = (void *)MEMORY[0x24BDD16E0];
      v110 = objc_msgSend_isFromMe(v290, v104, v105, v106, v107, v108, v109);
      objc_msgSend_numberWithBool_(v103, v111, v110, v112, v113, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(v91, v117, (uint64_t)v116, *MEMORY[0x24BE50F30], v118, v119, v120);

      v121 = (void *)MEMORY[0x24BDD16E0];
      isTrustedSender = objc_msgSend_isTrustedSender(v290, v122, v123, v124, v125, v126, v127);
      objc_msgSend_numberWithBool_(v121, v129, isTrustedSender, v130, v131, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(v91, v135, (uint64_t)v134, *MEMORY[0x24BE50F38], v136, v137, v138);

      objc_msgSend_serviceName(v290, v139, v140, v141, v142, v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(v91, v146, (uint64_t)v145, *MEMORY[0x24BE50F40], v147, v148, v149);

      objc_msgSend_sharedInstance(MEMORY[0x24BE51238], v150, v151, v152, v153, v154, v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trackEvent_withDictionary_(v156, v157, *MEMORY[0x24BE50EC8], (uint64_t)v91, v158, v159, v160);

    }
    else
    {
      objc_msgSend_sharedInstance(MEMORY[0x24BE51238], v76, v77, v78, v79, v80, v81);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trackEvent_(v179, v180, *MEMORY[0x24BE50EC0], v181, v182, v183, v184);

      if (!v75)
        goto LABEL_29;
    }
    objc_msgSend_image(v75, v161, v162, v163, v164, v165, v166);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = (CGImage *)objc_msgSend_cgImage(v185, v186, v187, v188, v189, v190, v191);

    v199 = objc_msgSend_frameCount(v75, v193, v194, v195, v196, v197, v198);
    if (v192)
    {
      v200 = v199;
      v201 = (void *)*MEMORY[0x24BDF84F8];
      v289 = (id)*MEMORY[0x24BDF84F8];
      if (!v60)
        v201 = v30;
      v202 = v201;
      if ((v60 & 1) != 0)
      {
        v288 = CFSTR("png");
      }
      else
      {
        objc_msgSend_pathExtension(v7, v203, v204, v205, v206, v207, v208);
        v288 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v200 >= 2)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v220 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v314 = 0;
              _os_log_impl(&dword_21DFB1000, v220, OS_LOG_TYPE_INFO, "File is actually animated lets save it as a JPEG...", v314, 2u);
            }

          }
          v289 = (id)*MEMORY[0x24BDF8438];

          objc_msgSend_preferredFilenameExtension(v289, v221, v222, v223, v224, v225, v226);
          v227 = objc_claimAutoreleasedReturnValue();

          v288 = (__CFString *)v227;
        }
        else
        {
          v289 = v30;
        }
      }
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v203, v204, v205, v206, v207, v208);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_UUID(MEMORY[0x24BDD1880], v230, v231, v232, v233, v234, v235);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v236, v237, v238, v239, v240, v241, v242);
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v229, v244, (uint64_t)CFSTR("%@.%@"), v245, v246, v247, v248, v243, v288);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_im_randomTemporaryFileURLWithFileName_(v228, v250, (uint64_t)v249, v251, v252, v253, v254);
      v255 = objc_claimAutoreleasedReturnValue();
      v256 = (void *)v305[5];
      v305[5] = v255;

      v257 = (const __CFURL *)v305[5];
      objc_msgSend_identifier(v289, v258, v259, v260, v261, v262, v263);
      v264 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v265 = CGImageDestinationCreateWithURL(v257, v264, 1uLL, 0);

      if (v265)
      {
        CGImageDestinationAddImage(v265, v192, 0);
        if (CGImageDestinationFinalize(v265))
        {
          *((_BYTE *)v311 + 24) = 1;
        }
        else
        {
          v273 = objc_alloc(MEMORY[0x24BDD1540]);
          v277 = objc_msgSend_initWithDomain_code_userInfo_(v273, v274, *MEMORY[0x24BE50FD0], 9, 0, v275, v276);
          v278 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v277;

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v279 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v279, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v314 = 138412290;
              v315 = v257;
              _os_log_impl(&dword_21DFB1000, v279, OS_LOG_TYPE_INFO, "Failed to write image to %@", v314, 0xCu);
            }

          }
        }
        CFRelease(v265);
      }
      else
      {
        v266 = objc_alloc(MEMORY[0x24BDD1540]);
        v270 = objc_msgSend_initWithDomain_code_userInfo_(v266, v267, *MEMORY[0x24BE50FD0], 9, 0, v268, v269);
        v271 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v270;

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v272 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v314 = 138412290;
            v315 = v257;
            _os_log_impl(&dword_21DFB1000, v272, OS_LOG_TYPE_INFO, "Failed to create CGImageDestination for %@", v314, 0xCu);
          }

        }
      }

      goto LABEL_55;
    }
LABEL_29:
    v209 = objc_alloc(MEMORY[0x24BDD1540]);
    v213 = objc_msgSend_initWithDomain_code_userInfo_(v209, v210, *MEMORY[0x24BE50FD0], 9, 0, v211, v212);
    v214 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v213;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v215 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v215, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v314 = 0;
        _os_log_impl(&dword_21DFB1000, v215, OS_LOG_TYPE_INFO, "Lockdown - Unable to get CGImageRef from BlastDoor.", v314, 2u);
      }

    }
    goto LABEL_55;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v167 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v30;
      _os_log_impl(&dword_21DFB1000, v167, OS_LOG_TYPE_INFO, "File is not a supported type: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  v168 = objc_alloc(MEMORY[0x24BDD1540]);
  v172 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v168, v169, *MEMORY[0x24BE50FD0], 1, 0, v170, v171);
  ((void (**)(id, _BOOL8, uint64_t, void *))v8)[2](v8, 0, 0, v172);

LABEL_64:
}

- (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_21DFCD4F4;
  v32[3] = &unk_24E1FFBA0;
  v33 = v16;
  v18 = v16;
  v19 = (void *)MEMORY[0x2207A8350](v32);
  queue = self->_queue;
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = sub_21DFCD5C4;
  v26[3] = &unk_24E1FFA60;
  v27 = v12;
  v28 = v13;
  v29 = v14;
  v30 = v15;
  v31 = v19;
  v21 = v19;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  v25 = v12;
  dispatch_async(queue, v26);

}

- (void)generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 balloonBundleID:(id)a6 constraints:(IMPreviewConstraints *)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = sub_21DFCD768;
  v38[3] = &unk_24E1FFBF0;
  v39 = v18;
  v20 = v18;
  v21 = (void *)MEMORY[0x2207A8350](v38);
  v29[1] = 3221225472;
  v22 = *(_OWORD *)&a7->var1.height;
  v35 = *(_OWORD *)&a7->var0;
  v36 = v22;
  v29[0] = v19;
  v29[2] = sub_21DFCD850;
  v29[3] = &unk_24E1FFC18;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v37 = *(_QWORD *)&a7->var3;
  v34 = v21;
  v23 = v21;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  v28 = (void *)MEMORY[0x2207A8350](v29);
  dispatch_sync((dispatch_queue_t)self->_previewGenerationQueue, v28);

}

- (void)generatePreviewMetadata:(id)a3 destinationURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_21DFCDA60;
  v33[3] = &unk_24E1FFBF0;
  v34 = v15;
  v17 = v15;
  v18 = (void *)MEMORY[0x2207A8350](v33);
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = sub_21DFCDB48;
  v25[3] = &unk_24E1FFC40;
  v26 = v12;
  v27 = v13;
  v19 = *(_OWORD *)&a6->var1.height;
  v30 = *(_OWORD *)&a6->var0;
  v31 = v19;
  v32 = *(_QWORD *)&a6->var3;
  v28 = v14;
  v29 = v18;
  v20 = v18;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = (void *)MEMORY[0x2207A8350](v25);
  dispatch_sync((dispatch_queue_t)self->_previewGenerationQueue, v24);

}

- (void)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_21DFCDDF4;
  v26[3] = &unk_24E1FFC90;
  v27 = v13;
  v15 = v13;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = sub_21DFCDF10;
  v21[3] = &unk_24E1FFCB8;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = (id)MEMORY[0x2207A8350](v26);
  v16 = v25;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  v20 = (void *)MEMORY[0x2207A8350](v21);
  dispatch_sync((dispatch_queue_t)self->_previewGenerationQueue, v20);

}

- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_21DFCE034;
  v11[3] = &unk_24E1FFCE0;
  v12 = v5;
  v6 = v5;
  objc_msgSend_transcribeAudioForAudioTransferURL_withCompletion_(IMTranscriptionUtilities, v7, (uint64_t)a3, (uint64_t)v11, v8, v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewGenerationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fallbackTranscoders, 0);
  objc_storeStrong((id *)&self->_transcoders, 0);
}

@end
