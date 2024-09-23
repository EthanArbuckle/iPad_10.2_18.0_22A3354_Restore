void sub_21DFB5870(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  double Seconds;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  CMTime v58;
  const __CFString *v59;
  void *v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend_status(*(void **)(a1 + 32), a2, a3, a4, a5, a6, a7);
  if (v8 == 5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        LOWORD(v58.value) = 0;
        _os_log_impl(&dword_21DFB1000, v42, OS_LOG_TYPE_INFO, "Export canceled", (uint8_t *)&v58, 2u);
      }

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v39, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -6, 0, v40, v41);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v8 == 4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_error(*(void **)(a1 + 32), v16, v17, v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v58.value) = 138412290;
        *(CMTimeValue *)((char *)&v58.value + 4) = (CMTimeValue)v22;
        _os_log_impl(&dword_21DFB1000, v15, OS_LOG_TYPE_INFO, "Export failed: %@", (uint8_t *)&v58, 0xCu);

      }
    }
    v23 = (void *)MEMORY[0x24BDD1540];
    v61 = *MEMORY[0x24BDD1398];
    objc_msgSend_error(*(void **)(a1 + 32), v9, v10, v11, v12, v13, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)v62, (uint64_t)&v61, 1, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v23, v29, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -4, (uint64_t)v28, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v43 = 0;
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      LOWORD(v58.value) = 0;
      _os_log_impl(&dword_21DFB1000, v50, OS_LOG_TYPE_INFO, "Export succeeded!", (uint8_t *)&v58, 2u);
    }

  }
  objc_msgSend_outputURL(*(void **)(a1 + 32), v44, v45, v46, v47, v48, v49);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
LABEL_19:
  if (*(_QWORD *)(a1 + 40))
  {
    v59 = CFSTR("Duration");
    v51 = (void *)MEMORY[0x24BDD16E0];
    Seconds = *(double *)(a1 + 48);
    if (Seconds < 2.22044605e-16)
    {
      v58 = *(CMTime *)(a1 + 56);
      Seconds = CMTimeGetSeconds(&v58);
    }
    objc_msgSend_numberWithDouble_(v51, v33, v34, v35, v36, v37, v38, Seconds);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v53;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v54, (uint64_t)&v60, (uint64_t)&v59, 1, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_21DFB5EBC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DFB5ECC(uint64_t a1)
{

}

void sub_21DFB5ED4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  Float64 Seconds;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  CMTime time;
  uint64_t v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend_status(*(void **)(a1 + 32), a2, a3, a4, a5, a6, a7);
  if (v8 == 5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v38, OS_LOG_TYPE_INFO, "mpeg4 conversion canceled", buf, 2u);
      }

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v35, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -6, 0, v36, v37);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(a1 + 56);
    goto LABEL_18;
  }
  if (v8 != 4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v47, OS_LOG_TYPE_INFO, "mpeg4 conversion succeeded!", buf, 2u);
      }

    }
    objc_msgSend_outputURL(*(void **)(a1 + 32), v41, v42, v43, v44, v45, v46);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(a1 + 64);
LABEL_18:
    v48 = *(_QWORD *)(v40 + 8);
    v24 = *(void **)(v48 + 40);
    *(_QWORD *)(v48 + 40) = v39;
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_error(*(void **)(a1 + 32), v16, v17, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = v22;
      _os_log_impl(&dword_21DFB1000, v15, OS_LOG_TYPE_INFO, "mpeg4 conversion failed: %@", buf, 0xCu);

    }
  }
  v23 = (void *)MEMORY[0x24BDD1540];
  v71 = *MEMORY[0x24BDD1398];
  objc_msgSend_error(*(void **)(a1 + 32), v9, v10, v11, v12, v13, v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v24;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)&v72, (uint64_t)&v71, 1, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v23, v29, (uint64_t)CFSTR("__kIMTranscodeErrorDomain"), -4, (uint64_t)v28, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v32;

LABEL_19:
  if (*(_QWORD *)(a1 + 48))
  {
    v55 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v56 = (void *)MEMORY[0x24BDD16E0];
    v57 = *(void **)(a1 + 40);
    if (v57)
      objc_msgSend_duration(v57, v49, v50, v51, v52, v53, v54);
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    objc_msgSend_numberWithDouble_(v56, v59, v60, v61, v62, v63, v64, Seconds);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v55, v66, (uint64_t)v65, (uint64_t)CFSTR("Duration"), v67, v68, v69);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void sub_21DFB78F0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend__fileSizeForTransfer_(*(void **)(a1 + 32), v10, (uint64_t)v7, v11, v12, v13, v14);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (*(_BYTE *)(a1 + 80))
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v27 = 134218754;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v7;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_21DFB1000, v15, OS_LOG_TYPE_INFO, "Transcoding bigSize finished with size %llu removeAlpha %@ path %@ and error %@", (uint8_t *)&v27, 0x2Au);
    }

  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v7;
  v20 = v7;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v9;
  v23 = v9;

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v8;
  v26 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_21DFB7AAC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend__fileSizeForTransfer_(*(void **)(a1 + 32), v10, (uint64_t)v7, v11, v12, v13, v14);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (*(_BYTE *)(a1 + 80))
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v27 = 134218754;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v7;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_21DFB1000, v15, OS_LOG_TYPE_INFO, "Transcoding smallSize finished with size %llu removeAlpha %@ path %@ and error %@", (uint8_t *)&v27, 0x2Au);
    }

  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v7;
  v20 = v7;

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v8;
  v23 = v8;

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v9;
  v26 = v9;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void *sub_21DFB7C68()
{
  void *result;

  result = (void *)MEMORY[0x2207A8014]("IOSurfaceGetWidth", CFSTR("IOSurface"));
  off_2553B3FC0 = result;
  return result;
}

void *sub_21DFB7C94()
{
  void *result;

  result = (void *)MEMORY[0x2207A8014]("IOSurfaceGetHeight", CFSTR("IOSurface"));
  off_2553B3FD0 = result;
  return result;
}

void *sub_21DFB7CC0()
{
  void *result;

  result = (void *)MEMORY[0x2207A8014]("IOSurfaceGetBaseAddress", CFSTR("IOSurface"));
  off_2553B3FE0 = result;
  return result;
}

void *sub_21DFB7CEC()
{
  void *result;

  result = (void *)MEMORY[0x2207A8014]("IOSurfaceLock", CFSTR("IOSurface"));
  off_2553B3FF0 = result;
  return result;
}

void *sub_21DFB7D18()
{
  void *result;

  result = (void *)MEMORY[0x2207A8014]("IOSurfaceUnlock", CFSTR("IOSurface"));
  off_2553B4000 = result;
  return result;
}

void sub_21DFBC4D8(uint64_t a1, const __CFString *a2, const __CFDictionary *a3)
{
  CGImageDestinationAddAuxiliaryDataInfo(*(CGImageDestinationRef *)(a1 + 32), a2, a3);
}

id sub_21DFBD880(CGImageSource *a1, unint64_t a2, double a3, double a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  size_t Count;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  const void *v20;
  const void *v21;
  const void *v22;
  uint64_t v23;
  const __CFDictionary *v24;
  const __CFDictionary *v25;
  const __CFDictionary *Value;
  const __CFDictionary *v27;
  const __CFNumber *v28;
  float v29;
  float v30;
  id v31;
  const char *v32;
  uint64_t v33;
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
  NSObject *v44;
  size_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  size_t Width;
  uint64_t i;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (**v73)(_QWORD);
  CGImage *v74;
  CGImage *v75;
  size_t Height;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  uint64_t v116;
  int v117;
  int v118;
  unint64_t v119;
  float v120;
  double v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  int v129;
  uint64_t v130;
  void *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  float v139;
  float v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  float v147;
  double v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  NSObject *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  NSObject *v191;
  size_t v192;
  const __CFDictionary *v193;
  const __CFDictionary *v194;
  const __CFNumber *v195;
  const __CFNumber *v196;
  double v197;
  double v198;
  unint64_t v199;
  NSObject *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  NSObject *v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  __CFData *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  __CFString *v216;
  CGImageDestination *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  float v229;
  uint64_t j;
  uint64_t (**v231)(void);
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  CGImage *v237;
  void *v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const __CFDictionary *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  NSObject *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  _BOOL4 v283;
  float v284;
  NSObject *v285;
  NSObject *v286;
  __CFData *v287;
  NSObject *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  int v295;
  NSObject *v296;
  __CFData *v297;
  void *v298;
  double v300;
  double v301;
  float v302;
  unint64_t v303;
  uint64_t v304;
  void *v305;
  void *key;
  void *v307;
  __CFData *v308;
  uint64_t v309;
  void *context;
  void *v311;
  void *v312;
  const __CFDictionary *properties;
  uint64_t v315;
  uint64_t v316;
  unint64_t v318;
  uint64_t v319;
  double valuePtr;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  _BYTE buf[40];
  uint64_t v326;
  unint64_t v327;
  CGImageSource *v328;
  _QWORD v329[3];

  v329[1] = *MEMORY[0x24BDAC8D0];
  v4 = ceil(a3);
  v5 = ceil(a4);
  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  if (v6 <= 1.84467441e19)
    v7 = v6;
  else
    v7 = 1.84467441e19;
  Count = CGImageSourceGetCount(a1);
  v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v311 = (void *)objc_msgSend_initWithCapacity_(v9, v10, Count, v11, v12, v13, v14);
  if (Count)
  {
    v18 = 0;
    v19 = *MEMORY[0x24BDD97F0];
    v20 = (const void *)*MEMORY[0x24BDD9598];
    v21 = (const void *)*MEMORY[0x24BDD95B8];
    v22 = (const void *)*MEMORY[0x24BDD9590];
    v23 = MEMORY[0x24BDBD1C8];
    do
    {
      LODWORD(valuePtr) = 0;
      v329[0] = v19;
      *(_QWORD *)buf = v23;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)buf, (uint64_t)v329, 1, v16, v17);
      v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v25 = CGImageSourceCopyPropertiesAtIndex(a1, v18, v24);

      if (v25)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(v25, v20);
        v27 = Value;
        if (Value)
        {
          v28 = (const __CFNumber *)CFDictionaryGetValue(Value, v21);
          if (v28 || (v28 = (const __CFNumber *)CFDictionaryGetValue(v27, v22)) != 0)
            CFNumberGetValue(v28, kCFNumberFloatType, &valuePtr);
        }
        CFRelease(v25);
        v29 = *(float *)&valuePtr;
      }
      else
      {
        v29 = 0.0;
      }
      if (v29 >= 0.011)
        v30 = v29;
      else
        v30 = 0.1;
      v31 = objc_alloc(MEMORY[0x24BDD16E0]);
      v38 = (void *)objc_msgSend_initWithDouble_(v31, v32, v33, v34, v35, v36, v37, v30);
      objc_msgSend_addObject_(v311, v39, (uint64_t)v38, v40, v41, v42, v43);

      ++v18;
    }
    while (Count != v18);
  }
  if ((IMOSLoggingEnabled() & 1) != 0)
  {
    OSLogHandleForIMFoundationCategory();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = Count;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v311;
      _os_log_impl(&dword_21DFB1000, v44, OS_LOG_TYPE_INFO, "GIF wanted %zu durations. Generated: %@.", buf, 0x16u);
    }

  }
  v45 = CGImageSourceGetCount(a1);
  v46 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v312 = (void *)objc_msgSend_initWithCapacity_(v46, v47, v45, v48, v49, v50, v51);
  v52 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  objc_msgSend_setName_(v52, v53, (uint64_t)CFSTR("IMTranscoderAgent _GIFCreateFrameGenerationBlocksForImageSource source frame cache"), v54, v55, v56, v57);
  objc_msgSend_setCountLimit_(v52, v58, v45, v59, v60, v61, v62);
  v63 = (unint64_t)v7;
  Width = 0;
  if (v45)
  {
    for (i = 0; i != v45; ++i)
    {
      v66 = v52;
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_21DFC3CB4;
      *(_QWORD *)&buf[24] = &unk_24E1FF820;
      *(_QWORD *)&buf[32] = v66;
      v326 = i;
      v327 = (unint64_t)v7;
      v328 = a1;
      v73 = (uint64_t (**)(_QWORD))objc_msgSend_copy(buf, v67, v68, v69, v70, v71, v72);

      if (!Width)
      {
        v74 = (CGImage *)v73[2](v73);
        v75 = v74;
        if (v74)
        {
          Width = CGImageGetWidth(v74);
          Height = CGImageGetHeight(v75);
          if (Width <= Height)
            Width = Height;
          CFRelease(v75);
        }
        else
        {
          Width = 0;
        }
      }
      v77 = (void *)MEMORY[0x2207A8350](v73);
      objc_msgSend_addObject_(v312, v78, (uint64_t)v77, v79, v80, v81, v82);

    }
  }

  v309 = objc_msgSend_count(v312, v83, v84, v85, v86, v87, v88);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = Width;
      _os_log_impl(&dword_21DFB1000, v89, OS_LOG_TYPE_INFO, "Real width is: %d", buf, 8u);
    }

  }
  v308 = 0;
  v90 = (float)Width;
  if (Width >= v63)
    v91 = v4;
  else
    v91 = (float)Width;
  if (Width >= v63)
    v90 = v5;
  v302 = (float)(unint64_t)v309;
  v318 = v309 - 1;
  v319 = 0;
  key = (void *)*MEMORY[0x24BDD96C8];
  v305 = (void *)*MEMORY[0x24BDD96C0];
  v300 = v90;
  v301 = v91;
  v93 = v91 * v90;
  v316 = *MEMORY[0x24BDD9598];
  v304 = *MEMORY[0x24BDD95A8];
  v307 = (void *)*MEMORY[0x24BDF83D8];
  v315 = *MEMORY[0x24BDD9590];
  while (1)
  {
    context = (void *)MEMORY[0x2207A8200]();
    v100 = (void *)objc_msgSend_mutableCopy(v312, v94, v95, v96, v97, v98, v99);
    v107 = (void *)objc_msgSend_mutableCopy(v311, v101, v102, v103, v104, v105, v106);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v309;
        _os_log_impl(&dword_21DFB1000, v108, OS_LOG_TYPE_INFO, "Trying to create GIF with %d frames", buf, 8u);
      }

    }
    if (v319 <= 0)
    {
      v176 = v309 - v319;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v319;
          _os_log_impl(&dword_21DFB1000, v115, OS_LOG_TYPE_INFO, "    Need to remove %d frame(s)", buf, 8u);
        }

      }
      v116 = v319;
      if (v318 >= 2)
      {
        v117 = 0;
        v118 = 1;
        v119 = 2;
        v120 = v302 / (float)(v319 + 1);
        do
        {
          v121 = (double)((int)v119 - 1);
          if (v121 == floorf(v120))
          {
            objc_msgSend_objectAtIndex_(v107, v109, v118, v111, v112, v113, v114, v121);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = v118;
            if (v118 <= 0)
              v129 = objc_msgSend_count(v100, v122, v123, v124, v125, v126, v127);
            v130 = v129 - 1;
            objc_msgSend_objectAtIndex_(v107, v122, v130, v124, v125, v126, v127);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_floatValue(v131, v133, v134, v135, v136, v137, v138);
            v140 = v139;
            objc_msgSend_floatValue(v128, v141, v142, v143, v144, v145, v146);
            *(float *)&v148 = v140 + v147;
            objc_msgSend_numberWithFloat_(v132, v149, v150, v151, v152, v153, v154, v148);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_replaceObjectAtIndex_withObject_(v107, v156, v130, (uint64_t)v155, v157, v158, v159);
            objc_msgSend_removeObjectAtIndex_(v107, v160, v118, v161, v162, v163, v164);
            objc_msgSend_removeObjectAtIndex_(v100, v165, v118, v166, v167, v168, v169);

            --v118;
            v120 = (float)(v302 / (float)(v319 + 1)) + v120;
            ++v117;
            v116 = v319;
          }
          if (v318 <= v119)
            break;
          ++v118;
          ++v119;
        }
        while (v116 > v117);
      }
      v176 = v309 - v319;
      if (objc_msgSend_count(v100, v109, v110, v111, v112, v113, v114) != v309 - v319)
        objc_msgSend_removeLastObject(v100, v170, v171, v172, v173, v174, v175);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v177 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
        {
          v184 = objc_msgSend_count(v100, v178, v179, v180, v181, v182, v183);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v184;
          _os_log_impl(&dword_21DFB1000, v177, OS_LOG_TYPE_INFO, "    Left with %d frame(s)", buf, 8u);
        }

      }
    }
    v92 = (double)(unint64_t)v309;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v191 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = (double)v319 / v92;
        _os_log_impl(&dword_21DFB1000, v191, OS_LOG_TYPE_INFO, "    Removed factor: %f", buf, 0xCu);
      }

    }
    if (v176 <= 5 && v319 || (double)v319 / (double)(unint64_t)v309 > 0.2)
      break;
    v192 = objc_msgSend_count(v100, v185, v186, v187, v188, v189, v190);
    v329[0] = 0;
    valuePtr = 0.0;
    v193 = CGImageSourceCopyPropertiesAtIndex(a1, 0, 0);
    v194 = v193;
    if (v193)
    {
      v195 = (const __CFNumber *)CFDictionaryGetValue(v193, key);
      if (v195)
        CFNumberGetValue(v195, kCFNumberCGFloatType, v329);
      v196 = (const __CFNumber *)CFDictionaryGetValue(v194, v305);
      if (v196)
        CFNumberGetValue(v196, kCFNumberCGFloatType, &valuePtr);
      CFRelease(v194);
      v197 = *(double *)v329;
      v198 = valuePtr;
    }
    else
    {
      v198 = 0.0;
      v197 = 0.0;
    }
    v199 = 3 * vcvtd_n_u64_f64(v93 * (double)v192, 2uLL)
         + a2
         + (unint64_t)(v197 * (v198 + 1.0) + 1293732.0)
         + vcvtd_n_u64_f64(v198 * v197 * (double)v192, 2uLL);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v200 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v199 >> 20;
        _os_log_impl(&dword_21DFB1000, v200, OS_LOG_TYPE_INFO, "  Projected memory footprint of GIF transcode: %lu megabytes", buf, 0xCu);
      }

    }
    if (v199 < 0x9600001)
    {
      properties = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v204 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v204, OS_LOG_TYPE_INFO, "  Enabling memory efficient GIF encoding", buf, 2u);
        }

      }
      v323 = v316;
      v321 = v304;
      v322 = MEMORY[0x24BDBD1C0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v201, (uint64_t)&v322, (uint64_t)&v321, 1, v202, v203);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v324 = v205;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v206, (uint64_t)&v324, (uint64_t)&v323, 1, v207, v208);
      properties = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    }
    v209 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend_identifier(v307, v210, v211, v212, v213, v214, v215);
    v216 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v217 = CGImageDestinationCreateWithData(v209, v216, v192, 0);

    if (objc_msgSend_count(properties, v218, v219, v220, v221, v222, v223))
      CGImageDestinationSetProperties(v217, properties);
    v229 = 0.0;
    if (v192)
    {
      for (j = 0; v192 != j; ++j)
      {
        objc_msgSend_objectAtIndex_(v100, v224, j, v225, v226, v227, v228);
        v231 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v237 = (CGImage *)v231[2]();
        if (v237)
        {
          v238 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend_objectAtIndex_(v107, v232, j, v233, v234, v235, v236);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dictionaryWithObjectsAndKeys_(v238, v240, (uint64_t)v239, v241, v242, v243, v244, v315, 0);
          v245 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x24BDBCE70], v246, (uint64_t)v245, v316, v247, v248, v249);
          v250 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CGImageDestinationAddImage(v217, v237, v250);
          CFRelease(v237);
          if (objc_msgSend_length(v209, v251, v252, v253, v254, v255, v256) > a2)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v263 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = j + 1;
                *(_WORD *)&buf[8] = 2048;
                *(_QWORD *)&buf[10] = v192;
                _os_log_impl(&dword_21DFB1000, v263, OS_LOG_TYPE_INFO, "  Bailing on frame %d out of %lu bceause we already exceeded the target data size", buf, 0x12u);
              }

            }
            v303 = objc_msgSend_length(v209, v257, v258, v259, v260, v261, v262);
            v270 = objc_msgSend_length(v209, v264, v265, v266, v267, v268, v269);

            v229 = (float)(unint64_t)v270 / (float)(v303 / (j + 1) * v192);
            break;
          }

        }
      }
    }
    CGImageDestinationFinalize(v217);
    v283 = objc_msgSend_length(v209, v271, v272, v273, v274, v275, v276) > a2 && a2 != 0;
    if (v283)
    {
      if (v229 == 0.0)
        v229 = (double)a2 / (double)(unint64_t)objc_msgSend_length(v209, v277, v278, v279, v280, v281, v282);
      v284 = v229 * (float)v192;
      v319 = (uint64_t)(fmax(floorf((float)v192 - v284), 1.0) + (double)v319);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v285 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v285, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&buf[4] = v319;
          *(_WORD *)&buf[8] = 2048;
          *(_QWORD *)&buf[10] = v192;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v284;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v229;
          _os_log_impl(&dword_21DFB1000, v285, OS_LOG_TYPE_INFO, "  Didn't fit, updating frames to remove: %d   (count: %lu   extra frames: %f  factorOff: %f)", buf, 0x26u);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v286 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v286, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v286, OS_LOG_TYPE_INFO, "  Fits!", buf, 2u);
        }

      }
      v287 = v209;

      v308 = v287;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v288 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
      {
        v295 = objc_msgSend_length(v209, v289, v290, v291, v292, v293, v294);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v295;
        _os_log_impl(&dword_21DFB1000, v288, OS_LOG_TYPE_INFO, "Final length was %d", buf, 8u);
      }

    }
    CFRelease(v217);

    objc_autoreleasePoolPop(context);
    if (!v283)
    {
      v297 = v308;
      v298 = v297;
      goto LABEL_132;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v296 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v296, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = (double)v319 / v92;
      _os_log_impl(&dword_21DFB1000, v296, OS_LOG_TYPE_INFO, "    Removed too many frames (%f), trying to shrink the image", buf, 0xCu);
    }

  }
  sub_21DFBD880(a1, a2, v301 * 0.85, v300 * 0.85);
  v298 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  v297 = v308;
LABEL_132:

  return v298;
}

id sub_21DFC2F1C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  v10 = objc_msgSend_longValue(v3, v4, v5, v6, v7, v8, v9);
  v11 = v3;
  if (v10 > *(int *)(a1 + 40))
    v11 = *(void **)(a1 + 32);
  v12 = v11;

  return v12;
}

const void *sub_21DFC3CB4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *ThumbnailAtIndex;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v8 = *(void **)(a1 + 32);
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], a2, *(_QWORD *)(a1 + 40), a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ThumbnailAtIndex = (const void *)objc_msgSend_objectForKey_(v8, v10, (uint64_t)v9, v11, v12, v13, v14);

  if (ThumbnailAtIndex)
  {
    CFRetain(ThumbnailAtIndex);
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x24BDBCED8]);
    v22 = (void *)objc_msgSend_initWithCapacity_(v16, v17, 3, v18, v19, v20, v21);
    v23 = MEMORY[0x24BDBD1C8];
    objc_msgSend_setObject_forKey_(v22, v24, MEMORY[0x24BDBD1C8], *MEMORY[0x24BDD9778], v25, v26, v27);
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v28, *(_QWORD *)(a1 + 48), v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v22, v34, (uint64_t)v33, *MEMORY[0x24BDD9808], v35, v36, v37);

    objc_msgSend_setObject_forKey_(v22, v38, v23, *MEMORY[0x24BDD9788], v39, v40, v41);
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(*(CGImageSourceRef *)(a1 + 56), *(_QWORD *)(a1 + 40), (CFDictionaryRef)v22);
    if (ThumbnailAtIndex)
    {
      v47 = *(void **)(a1 + 32);
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v42, *(_QWORD *)(a1 + 40), v43, v44, v45, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v47, v49, (uint64_t)ThumbnailAtIndex, (uint64_t)v48, v50, v51, v52);

    }
  }
  return ThumbnailAtIndex;
}

void sub_21DFC3DE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_21DFC5454(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21DFC5350);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21DFC5DA4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DFC5DB4(uint64_t a1)
{

}

void sub_21DFC5DBC(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  float v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  int v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v12 = a3;
  if (!v12)
  {
    objc_msgSend_bestTranscription(v5, v6, v7, v8, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    if (v14)
    {
      objc_msgSend_formattedString(v14, v15, v16, v17, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_length(v22, v23, v24, v25, v26, v27, v28);

      if (v29)
      {
        v30 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
        objc_msgSend_formattedString(v21, v15, v16, v17, v18, v19, v20);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v30, v32, (uint64_t)v31, v33, v34, v35, v36);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = *(_QWORD *)(a1[5] + 8);
        v39 = *(void **)(v38 + 40);
        *(_QWORD *)(v38 + 40) = v37;

        v40 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        objc_msgSend_segments(v21, v41, v42, v43, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend_count(v47, v48, v49, v50, v51, v52, v53) + v40;

        if (v54 < 0x33)
        {
          objc_msgSend_segments(v21, v15, v16, v17, v18, v19, v20);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend_count(v57, v58, v59, v60, v61, v62, v63);

          v64 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
          objc_msgSend_segments(v21, v65, v66, v67, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend_count(v71, v72, v73, v74, v75, v76, v77) + v64;

          if (!v56)
            goto LABEL_15;
        }
        else
        {
          v55 = *(_QWORD *)(a1[6] + 8);
          v56 = 50 - *(_QWORD *)(v55 + 24);
          *(_QWORD *)(v55 + 24) = 50;
          if (!v56)
            goto LABEL_15;
        }
        for (i = 0; i != v56; ++i)
        {
          v79 = *(double *)(*(_QWORD *)(a1[7] + 8) + 24);
          objc_msgSend_segments(v21, v15, v16, v17, v18, v19, v20);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v80, v81, i, v82, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_confidence(v86, v87, v88, v89, v90, v91, v92);
          *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = v79 + v93;

        }
      }
    }
LABEL_15:
    if (objc_msgSend_isFinal(v5, v15, v16, v17, v18, v19, v20))
    {
      objc_msgSend_commitTranscriptionWithString_confidenceSum_numberOfSegments_completion_(IMTranscriptionUtilities, v94, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), a1[4], v98, v99, *(double *)(*(_QWORD *)(a1[7] + 8) + 24));
    }
    else
    {
      v100 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      objc_msgSend_localizedSeparatorString(IMTranscriptionUtilities, v94, v95, v96, v97, v98, v99);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v100, v102, (uint64_t)v101, v103, v104, v105, v106);
      v107 = objc_claimAutoreleasedReturnValue();
      v108 = *(_QWORD *)(a1[5] + 8);
      v109 = *(void **)(v108 + 40);
      *(_QWORD *)(v108 + 40) = v107;

    }
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v110 = 138412290;
      v111 = v12;
      _os_log_impl(&dword_21DFB1000, v13, OS_LOG_TYPE_INFO, "Transcription failed with error: %@", (uint8_t *)&v110, 0xCu);
    }

  }
  (*(void (**)(void))(a1[4] + 16))();
LABEL_19:

}

void sub_21DFC6224()
{
  void *v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDD1488];
  v1 = objc_opt_class();
  objc_msgSend_bundleForClass_(v0, v2, v1, v3, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_2553B4010;
  qword_2553B4010 = v7;

}

void sub_21DFC8B8C(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_21DFC8B9C(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

id sub_21DFC8BA8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id result;

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = objc_msgSend_isFromMe(*(void **)(a1 + 48), a2, a3, a4, a5, a6, a7);
  objc_msgSend_generatedSnapshotForDataURL_contentInset_isFromMe_(v8, v11, v9, v10, v12, v13, v14, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  result = (id)_UIImageJPEGRepresentation();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

uint64_t sub_21DFC93B4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], a2, (uint64_t)a2, a4, a5, a6, a7);
}

void sub_21DFC93C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)MEMORY[0x24BDD16E0];
      v20 = objc_msgSend_length(*(void **)(a1 + 32), v13, v14, v15, v16, v17, v18);
      v26 = objc_msgSend_numberWithUnsignedInteger_(v19, v21, v20, v22, v23, v24, v25);
      v27 = CFSTR("NO");
      v28 = *(_QWORD *)(a1 + 40);
      v29 = *(_QWORD *)(a1 + 48);
      if (a5)
        v30 = CFSTR("YES");
      else
        v30 = CFSTR("NO");
      v31 = 138414082;
      if (a6)
        v27 = CFSTR("YES");
      v32 = v26;
      v33 = 2112;
      v34 = v28;
      v35 = 2112;
      v36 = a2;
      v37 = 2112;
      v38 = a4;
      v39 = 2112;
      v40 = v30;
      v41 = 2112;
      v42 = v27;
      v43 = 2112;
      v44 = a3;
      v45 = 2112;
      v46 = v29;
      _os_log_impl(&dword_21DFB1000, v12, OS_LOG_TYPE_INFO, "output trying to generate fallback for data %@ inFileURL %@ outputURLs %@ error %@ success %@ attemptedTranscode %@ text %@ attachments %@", (uint8_t *)&v31, 0x52u);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));

}

void sub_21DFC9578(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      v18 = objc_msgSend_length(*(void **)(a1 + 32), v11, v12, v13, v14, v15, v16);
      v24 = objc_msgSend_numberWithUnsignedInteger_(v17, v19, v18, v20, v21, v22, v23);
      v25 = CFSTR("NO");
      v26 = *(_QWORD *)(a1 + 40);
      v27 = *(_QWORD *)(a1 + 48);
      if (a4)
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      v29 = 138413826;
      if (a5)
        v25 = CFSTR("YES");
      v30 = v24;
      v31 = 2112;
      v32 = v26;
      v33 = 2112;
      v34 = a2;
      v35 = 2112;
      v36 = a3;
      v37 = 2112;
      v38 = v28;
      v39 = 2112;
      v40 = v25;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_21DFB1000, v10, OS_LOG_TYPE_INFO, "output trying to generate fallback for data %@ inFileURL %@ outputURLs %@ error %@ success %@ attemptedTranscode %@ attachments %@", (uint8_t *)&v29, 0x48u);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));

}

void sub_21DFC9720(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      v15 = 138413058;
      v16 = a2;
      if (a4)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (a5)
        v11 = CFSTR("YES");
      v17 = 2112;
      v18 = a3;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_21DFB1000, v10, OS_LOG_TYPE_INFO, "got fullquality for data at URLs %@ error %@ success %@ attemptedToGenerateFallback %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void (**)(uint64_t, uint64_t))(v13 + 16);
  if (a5)
    v14(v13, a2);
  else
    v14(v13, 0);

}

void sub_21DFC9884(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      v12 = 138412802;
      v13 = a2;
      v14 = 2112;
      if (a4)
        v9 = CFSTR("YES");
      v15 = a3;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_21DFB1000, v8, OS_LOG_TYPE_INFO, "got fullquality for data at URLs %@ error %@ success %@", (uint8_t *)&v12, 0x20u);
    }
  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void (**)(uint64_t, uint64_t))(v10 + 16);
  if (a4)
    v11(v10, a2);
  else
    v11(v10, 0);

}

void sub_21DFC9CDC(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_21DFC9CEC(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void *sub_21DFC9CF8()
{
  void *result;

  result = (void *)MEMORY[0x2207A8014]("PFCreateGIFFromVideoURL", CFSTR("PhotosFormats"));
  off_2553B4028 = result;
  return result;
}

void sub_21DFC9D24(double a1)
{
  NSObject *v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = 134217984;
      v4 = a1;
      _os_log_impl(&dword_21DFB1000, v2, OS_LOG_TYPE_INFO, "Converting to GIF progress {progress: %f}", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t sub_21DFC9E10(_QWORD *a1, int a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (a2)
        v9 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_21DFB1000, v8, OS_LOG_TYPE_INFO, "Finished transcoding GIF {success: %@}", buf, 0xCu);
    }
  }
  v10 = a1[5];
  if (!a2)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(v10 + 16))(a1[5], 0, 0, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), 0, 1);
  v13 = a1[4];
  v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v4, (uint64_t)&v13, 1, v5, v6, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v10 + 16))(v10, v11, 0, 0, 1, 1);
}

void sub_21DFCA00C()
{
  IMTranscodingAgentController *v0;
  void *v1;

  v0 = objc_alloc_init(IMTranscodingAgentController);
  v1 = (void *)qword_253E9BB50;
  qword_253E9BB50 = (uint64_t)v0;

}

void sub_21DFCB0FC(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6, char a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char v39;
  char v40;

  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v25 = a8;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v19, v20, v21, v22, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = sub_21DFCB258;
    v32[3] = &unk_24E1FF9E8;
    v38 = *(id *)(a1 + 32);
    v33 = v15;
    v34 = v16;
    v35 = v17;
    v36 = v18;
    v39 = a6;
    v40 = a7;
    v37 = v25;
    objc_msgSend___im_performBlock_(v26, v27, (uint64_t)v32, v28, v29, v30, v31);

  }
}

uint64_t sub_21DFCB258(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 64));
}

void sub_21DFCB278(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  objc_msgSend_lastObject(*(void **)(*(_QWORD *)(a1 + 32) + 16), a2, a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_21DFCB334;
  v14[3] = &unk_24E1FFA38;
  v11 = *(_QWORD *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 40);
  objc_msgSend_transcodeFileTransferContents_utiType_transcoderUserInfo_completionBlock_(v8, v12, v9, v10, v11, (uint64_t)v14, v13);

}

uint64_t sub_21DFCB334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, MEMORY[0x24BDBD1A8], a4, a5, a6, 0);
}

void sub_21DFCB360(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6, char a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = IMOSLoggingEnabled();
  if (a6)
  {
    if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v27, OS_LOG_TYPE_INFO, "Main transcoding finished, trying to generate thumbnail", buf, 2u);
      }

    }
    objc_msgSend_transcodeThumbnailFor_target_allSizes_commonCapabilities_maxDimension_transcoderUserInfo_isLQMEnabled_outputURLs_outputContextInfo_attemptedTranscode_additionalOutPutContext_completionBlock_(*(void **)(a1 + 32), v21, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 104), v16, v17, a7, v19, *(_QWORD *)(a1 + 72));
  }
  else
  {
    if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v18;
        _os_log_impl(&dword_21DFB1000, v28, OS_LOG_TYPE_INFO, "Failed to transcode, error %@", buf, 0xCu);
      }

    }
    _IMTranscoderLinkFile(*(void **)(a1 + 40), v21, v22, v23, v24, v25, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    IMSingleObjectArray();
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

uint64_t sub_21DFCB580(uint64_t a1, const char *a2)
{
  char v3;

  v3 = *(_BYTE *)(a1 + 120);
  return objc_msgSend_transcodeFileTransfer_utiType_allowUnfilteredUTIs_target_sizes_commonCapabilities_maxDimension_transcoderUserInfo_representations_isLQMEnabled_completionBlock_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 112), v3, *(_QWORD *)(a1 + 88));
}

void sub_21DFCBC04(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, uint64_t a7, void *a8)
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
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
  void *v44;
  id v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v46 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      if (a6)
        v24 = CFSTR("YES");
      v48 = v24;
      v49 = 2112;
      v50 = v15;
      v51 = 2112;
      v52 = v13;
      _os_log_impl(&dword_21DFB1000, v23, OS_LOG_TYPE_INFO, "Thumbnail generation result: %@, error %@ - %@", buf, 0x20u);
    }

  }
  v25 = (void *)objc_msgSend_mutableCopy(*(void **)(a1 + 32), v17, v18, v19, v20, v21, v22);
  objc_msgSend_addEntriesFromDictionary_(v25, v26, (uint64_t)v16, v27, v28, v29, v30);
  v36 = *(_QWORD *)(a1 + 64);
  if (v36)
  {
    v37 = *(_QWORD *)(a1 + 40);
    objc_msgSend_arrayByAddingObjectsFromArray_(*(void **)(a1 + 48), v31, (uint64_t)v13, v32, v33, v34, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(*(void **)(a1 + 56), v39, (uint64_t)v14, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, void *, id, _QWORD, _QWORD, void *))(v36 + 16))(v36, v37, v38, v44, v15, a6, *(unsigned __int8 *)(a1 + 72), v25);

  }
}

void sub_21DFCBFD8(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 72))
        v10 = CFSTR("NO");
      v38 = 138412546;
      v39 = v9;
      v40 = 2112;
      v41 = v10;
      _os_log_impl(&dword_21DFB1000, v8, OS_LOG_TYPE_INFO, "Found transcoder to transcode data for balloonBundleID %@ fallback %@", (uint8_t *)&v38, 0x16u);
    }

  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v2, v3, v4, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__randomTemporaryPathWithSuffix_fileName_(v11, v12, 0, 0, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingLastPathComponent(v16, v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v24, (uint64_t)v23, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(*(void **)(*(_QWORD *)(a1 + 40) + 16), v30, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcodeFileTransferData_balloonBundleID_attachments_inFileURL_fallBack_completionBlock_(v36, v37, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), (uint64_t)v29, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

uint64_t sub_21DFCCE10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21DFCCE20(uint64_t a1)
{

}

void sub_21DFCCE28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v13 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      v32 = objc_msgSend_copy(v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      v33 = objc_alloc(MEMORY[0x24BDD1540]);
      v32 = objc_msgSend_initWithDomain_code_userInfo_(v33, v34, *MEMORY[0x24BE50FD0], 1, 0, v35, v36);
    }
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v32;

  }
  else
  {
    MEMORY[0x2207A8008](CFSTR("BlastDoorVideoPreview"), CFSTR("BlastDoor"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v5;
    else
      v14 = 0;
    v15 = v14;
    objc_msgSend_image(v15, v16, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_cgImage(v22, v23, v24, v25, v26, v27, v28);

    v30 = IMOSLoggingEnabled();
    if (v29)
    {
      if (v30)
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          LOWORD(v42) = 0;
          _os_log_impl(&dword_21DFB1000, v31, OS_LOG_TYPE_INFO, "Video validation completed successfully", (uint8_t *)&v42, 2u);
        }

      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else if (v30)
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v42 = 138412290;
        v43 = 0;
        _os_log_impl(&dword_21DFB1000, v39, OS_LOG_TYPE_INFO, "Video validation failed: %@", (uint8_t *)&v42, 0xCu);
      }

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v42 = 138412290;
      v43 = v41;
      _os_log_impl(&dword_21DFB1000, v40, OS_LOG_TYPE_INFO, "Blastdoor validation completed, err: %@", (uint8_t *)&v42, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_21DFCD0D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
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
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    MEMORY[0x2207A8008](CFSTR("BlastDoorPreviewAudio"), CFSTR("BlastDoor"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v5;
    else
      v16 = 0;
    v17 = v16;
    objc_msgSend_powerLevels(v17, v18, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v24, v25, v26, v27, v28, v29, v30);

    if (v31)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_21DFB1000, v32, OS_LOG_TYPE_INFO, "Audio validation completed successfully", (uint8_t *)&v40, 2u);
        }

      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v40 = 138412290;
        v41 = v14;
        _os_log_impl(&dword_21DFB1000, v13, OS_LOG_TYPE_INFO, "Audio validation failed: %@", (uint8_t *)&v40, 0xCu);
      }

    }
    if (v6)
    {
      v15 = objc_msgSend_copy(v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      v33 = objc_alloc(MEMORY[0x24BDD1540]);
      v15 = objc_msgSend_initWithDomain_code_userInfo_(v33, v34, *MEMORY[0x24BE50FD0], 1, 0, v35, v36);
    }
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(id *)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v15;
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v40 = 138412290;
      v41 = v39;
      _os_log_impl(&dword_21DFB1000, v38, OS_LOG_TYPE_INFO, "Blastdoor validation completed, err: %@", (uint8_t *)&v40, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_21DFCD4F4(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;

  v11 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v5, v6, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_21DFCD5B0;
    v18[3] = &unk_24E1FFB78;
    v20 = *(id *)(a1 + 32);
    v21 = a2;
    v19 = v11;
    objc_msgSend___im_performBlock_(v12, v13, (uint64_t)v18, v14, v15, v16, v17);

  }
}

uint64_t sub_21DFCD5B0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t sub_21DFCD5C4(_QWORD *a1)
{
  return MEMORY[0x24BEDD108](IMSnapshotTranscoder, sel_generateSnapshotForMessageGUID_payloadURL_balloonBundleID_senderContext_completionBlock_, a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void sub_21DFCD768(uint64_t a1, char a2, void *a3, double a4, double a5)
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  double v26;
  char v27;

  v15 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v9, v10, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_21DFCD838;
    v22[3] = &unk_24E1FFBC8;
    v24 = *(id *)(a1 + 32);
    v27 = a2;
    v25 = a4;
    v26 = a5;
    v23 = v15;
    objc_msgSend___im_performBlock_(v16, v17, (uint64_t)v22, v18, v19, v20, v21);

  }
}

uint64_t sub_21DFCD838(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void sub_21DFCD850(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  const char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;
  id v20;
  __int128 v21;

  v21 = *MEMORY[0x24BDBF148];
  objc_msgSend_sharedInstance(MEMORY[0x24BE51278], a2, a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_OWORD *)(a1 + 88);
  v18[0] = *(_OWORD *)(a1 + 72);
  v18[1] = v13;
  v19 = *(_QWORD *)(a1 + 104);
  v20 = 0;
  v15 = objc_msgSend_generateAndPersistPreviewFromSourceURL_previewURL_senderContext_size_balloonBundleID_previewConstraints_error_(v8, v14, v9, v10, v11, (uint64_t)&v21, v12, v18, &v20);
  v16 = v20;

  v17 = *(_QWORD *)(a1 + 64);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, id, double, double))(v17 + 16))(v17, v15, v16, *(double *)&v21, *((double *)&v21 + 1));

}

void sub_21DFCDA60(uint64_t a1, char a2, void *a3, double a4, double a5)
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  double v26;
  char v27;

  v15 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v9, v10, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_21DFCDB30;
    v22[3] = &unk_24E1FFBC8;
    v24 = *(id *)(a1 + 32);
    v27 = a2;
    v25 = a4;
    v26 = a5;
    v23 = v15;
    objc_msgSend___im_performBlock_(v16, v17, (uint64_t)v22, v18, v19, v20, v21);

  }
}

uint64_t sub_21DFCDB30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void sub_21DFCDB48(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  const char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  _BYTE buf[32];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = *MEMORY[0x24BDBF148];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_21DFB1000, v8, OS_LOG_TYPE_INFO, "Will generate preview metadata for url %@ dst url %@", buf, 0x16u);
    }

  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE51278], v2, v3, v4, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  v20 = 0;
  v15 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&buf[16] = v15;
  v23 = *(_QWORD *)(a1 + 96);
  v17 = objc_msgSend_generateAndPersistMetadataFromSourceURL_destinationURL_senderContext_size_constraints_error_(v11, v16, v12, v13, v14, (uint64_t)&v21, (uint64_t)buf, &v20);
  v18 = v20;

  v19 = *(_QWORD *)(a1 + 56);
  if (v19)
    (*(void (**)(uint64_t, uint64_t, id, double, double))(v19 + 16))(v19, v17, v18, *(double *)&v21, *((double *)&v21 + 1));

}

void sub_21DFCDDF4(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;

  v9 = a3;
  v10 = a4;
  v17 = a5;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v11, v12, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_21DFCDEF8;
    v24[3] = &unk_24E1FFC68;
    v28 = *(id *)(a1 + 32);
    v29 = a2;
    v25 = v9;
    v26 = v10;
    v27 = v17;
    objc_msgSend___im_performBlock_(v18, v19, (uint64_t)v24, v20, v21, v22, v23);

  }
}

uint64_t sub_21DFCDEF8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_21DFCDF10(_QWORD *a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v9 = 0;
  v10 = 0;
  objc_msgSend_decodeiMessageAppPayload_senderContext_bundleID_outAttachmentURLs_error_(MEMORY[0x24BE51338], a2, v3, v4, v5, (uint64_t)&v10, (uint64_t)&v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v9;
  (*(void (**)(_QWORD, BOOL, void *, id, id))(a1[7] + 16))(a1[7], v6 != 0, v6, v7, v8);

}

uint64_t sub_21DFCE034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2, a3);
  return result;
}

uint64_t _IMTranscoderLinkFile(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *PathComponent;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v53;

  v53 = 0;
  v8 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, a3, a4, a5, a6, a7);
  PathComponent = (void *)objc_msgSend_lastPathComponent(a1, v9, v10, v11, v12, v13, v14);
  v22 = (void *)objc_msgSend_stringByDeletingPathExtension(PathComponent, v16, v17, v18, v19, v20, v21);
  v29 = objc_msgSend_pathExtension(a1, v23, v24, v25, v26, v27, v28);
  v35 = objc_msgSend_stringByAppendingPathExtension_(v22, v30, v29, v31, v32, v33, v34);
  v41 = objc_msgSend_im_randomTemporaryFileURLWithFileName_(v8, v36, v35, v37, v38, v39, v40);
  v48 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v42, v43, v44, v45, v46, v47);
  if (objc_msgSend_copyItemAtURL_toURL_error_(v48, v49, (uint64_t)a1, v41, (uint64_t)&v53, v50, v51))
    return v41;
  else
    return 0;
}

void sub_21DFCEB14(uint64_t a1, void *a2)
{
  Image_Estimator_HEIF *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    v3 = [Image_Estimator_HEIF alloc];
    v9 = (void *)objc_msgSend_initWithMLModel_(v3, v4, (uint64_t)v10, v5, v6, v7, v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_21DFCED6C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  Image_Estimator_HEIFOutput *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void (*v27)(uint64_t, _QWORD, id);
  id v28;

  v28 = a2;
  if (v28)
  {
    v5 = a3;
    v6 = [Image_Estimator_HEIFOutput alloc];
    objc_msgSend_featureValueForName_(v28, v7, (uint64_t)CFSTR("Target Quality Factor"), v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v12, v13, v14, v15, v16, v17, v18);
    v25 = (id)objc_msgSend_initWithTarget_Quality_Factor_(v6, v19, v20, v21, v22, v23, v24);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void (**)(uint64_t, _QWORD, id))(v26 + 16);
    v25 = a3;
    v27(v26, 0, v25);
  }

}

void sub_21DFCEEF4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  Image_Estimator_HEIFOutput *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void (*v27)(uint64_t, _QWORD, id);
  id v28;

  v28 = a2;
  if (v28)
  {
    v5 = a3;
    v6 = [Image_Estimator_HEIFOutput alloc];
    objc_msgSend_featureValueForName_(v28, v7, (uint64_t)CFSTR("Target Quality Factor"), v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v12, v13, v14, v15, v16, v17, v18);
    v25 = (id)objc_msgSend_initWithTarget_Quality_Factor_(v6, v19, v20, v21, v22, v23, v24);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void (**)(uint64_t, _QWORD, id))(v26 + 16);
    v25 = a3;
    v27(v26, 0, v25);
  }

}

void sub_21DFCF270(void *a1)
{

  objc_end_catch();
}

void sub_21DFCF290(void *a1)
{

  objc_end_catch();
}

void sub_21DFCF2AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF32C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF3AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF42C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF4AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF52C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF5AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF62C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF6AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21DFC3DF0();
  sub_21DFC3DE0(&dword_21DFB1000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_21DFC3E04();
}

void sub_21DFCF72C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21DFB1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load Image_Estimator_HEIF.mlmodelc in the bundle resource", v0, 2u);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BDB6828](inAudioConverter, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDC68](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x24BDD9028]();
}

uint64_t CGImageCreateWithWBMPData()
{
  return MEMORY[0x24BDD9038]();
}

void CGImageDestinationAddAuxiliaryDataInfo(CGImageDestinationRef idst, CFStringRef auxiliaryImageDataType, CFDictionaryRef auxiliaryDataInfoDictionary)
{
  MEMORY[0x24BDD9040](idst, auxiliaryImageDataType, auxiliaryDataInfoDictionary);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9098](idst, properties);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9140](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9168](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x24BDD91A0](isrc);
}

uint64_t CGImageSourceIsColorOptimizedForSharing()
{
  return MEMORY[0x24BDD91A8]();
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

uint64_t CMPhotoDecompressionContainerPredictTranscodedSize()
{
  return MEMORY[0x24BE11FA0]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x24BE11FA8]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x24BE11FB0]();
}

uint64_t CMPhotoJPEGCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x24BE11FC0]();
}

uint64_t CMPhotoJPEGCreateJPEGFromIOSurface()
{
  return MEMORY[0x24BE11FC8]();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x24BDC0550](retstr, start, end);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x24BDB6AB8](inURL, *(_QWORD *)&inFileType, inStreamDesc, inChannelLayout, *(_QWORD *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x24BDB6AC8](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6AD8](inExtAudioFile, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x24BDB6AF0](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x24BDB6B00](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BDB6B20](inExtAudioFile, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x24BDB6B40](inExtAudioFile, *(_QWORD *)&inNumberFrames, ioData);
}

uint64_t FigCreateIOSurfaceBackedCVPixelBuffer()
{
  return MEMORY[0x24BDF8FA0]();
}

uint64_t IMAVURLAssetOptionsDefault()
{
  return MEMORY[0x24BE50B08]();
}

uint64_t IMAVURLAssetOptionsWithExtraOptionsForWrite()
{
  return MEMORY[0x24BE50B10]();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x24BE50B28]();
}

uint64_t IMBalloonProviderBundlePaths()
{
  return MEMORY[0x24BE50B90]();
}

uint64_t IMCheckVideoURLProperties()
{
  return MEMORY[0x24BE50BB0]();
}

uint64_t IMImageSourceHasStereoPair()
{
  return MEMORY[0x24BE50E28]();
}

uint64_t IMIsAAVideoURL()
{
  return MEMORY[0x24BE50E30]();
}

uint64_t IMIsHEVCWithAlphaVideoURL()
{
  return MEMORY[0x24BE50E38]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x24BE50E48]();
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x24BE50170]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x24BE50E50]();
}

uint64_t IMMMSRestrictedModeEnabled()
{
  return MEMORY[0x24BE50180]();
}

uint64_t IMMaxBitDepthForVideo()
{
  return MEMORY[0x24BE50E58]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE501A0]();
}

uint64_t IMPluginSnapshotCachesFileURL()
{
  return MEMORY[0x24BE50FB8]();
}

uint64_t IMPreviewConstraintsFromDictionary()
{
  return MEMORY[0x24BE50FC8]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x24BE50FE8]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x24BE50238]();
}

uint64_t IMSupportedAVUTITypesForOutgoingTranscode()
{
  return MEMORY[0x24BE51090]();
}

uint64_t IMSupportedImageUTITypesForOutgoingTranscode()
{
  return MEMORY[0x24BE51098]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50270]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x24BE50278]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x24BE503A0]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE503A8]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x24BDC15A8](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x24BDC15D0](inUTI, inTagClass);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x24BDC15E8](inUTI1, inUTI2);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x24BDF8148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _iMessageTelemetryLogHandle()
{
  return MEMORY[0x24BE51340]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D8](__A, __I, __C, __N);
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3310](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3438](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vnegD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3448](__A, __IA, __C, __IC, __N);
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34C8](__A, __IA, __B, __C, __IC, __N);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x24BDB3638](buf, format, backgroundColor, image, *(_QWORD *)&flags);
}

vImage_Error vImageHistogramCalculation_ARGB8888(const vImage_Buffer *src, vImagePixelCount *histogram[4], vImage_Flags flags)
{
  return MEMORY[0x24BDB38E0](src, histogram, *(_QWORD *)&flags);
}

