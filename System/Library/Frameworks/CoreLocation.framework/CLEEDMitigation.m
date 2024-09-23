@implementation CLEEDMitigation

- (CLEEDMitigation)initWithStreamingAllowed:(BOOL)a3 framerateFps:(int64_t)a4 bitrateKbps:(int64_t)a5 dropStreaming:(BOOL)a6 uploadAllowed:(BOOL)a7 uploadMitigation:(int64_t)a8 source:(int64_t)a9
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v13;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  BOOL v18;
  _BOOL4 v19;
  int64_t v20;
  const char *v21;
  CLEEDMitigation *v22;
  const char *v23;
  _BOOL4 v24;
  int64_t v25;
  const char *v26;
  CLEEDMitigation *result;
  const char *v28;
  uint64_t v29;
  int64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  char *v34;
  CLEEDMitigation *v35;
  int64_t v36;
  _BOOL4 v37;
  objc_super v39;
  int v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int64_t v51;
  __int16 v52;
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int64_t v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int64_t v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v10 = a7;
  v11 = a6;
  v13 = a3;
  v68 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v15 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    v18 = !v13;
    v19 = v13;
    v20 = a4;
    if (v18)
      v21 = "NO";
    else
      v21 = "YES";
    v22 = self;
    if (v11)
      v23 = "YES";
    else
      v23 = "NO";
    v18 = !v10;
    v37 = v10;
    v24 = v11;
    v25 = a8;
    if (v18)
      v26 = "NO";
    else
      v26 = "YES";
    *(_DWORD *)buf = 136447746;
    v55 = "-[CLEEDMitigation initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:]";
    v56 = 2082;
    v57 = v21;
    a4 = v20;
    v13 = v19;
    v58 = 2050;
    v59 = a4;
    v60 = 2082;
    v61 = v23;
    self = v22;
    v62 = 2082;
    v63 = v26;
    a8 = v25;
    v11 = v24;
    v10 = v37;
    v64 = 2050;
    v65 = a8;
    v66 = 2082;
    v67 = objc_msgSend_sourceAsString_(CLEEDMitigation, v16, a9, v17);
    _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s[streamingAllowed:%{public}s,fps:%{public}ld,dropStreaming:%{public}s,uploadAllowed:%{public}s,uploadMitigation:%{public}ld,source:%{public}s]", buf, 0x48u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    v35 = self;
    v36 = a4;
    v30 = a8;
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    if (v13)
      v31 = "YES";
    else
      v31 = "NO";
    if (v11)
      v32 = "YES";
    else
      v32 = "NO";
    if (v10)
      v33 = "YES";
    else
      v33 = "NO";
    v40 = 136447746;
    v41 = "-[CLEEDMitigation initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:]";
    v42 = 2082;
    v43 = v31;
    v44 = 2050;
    v45 = v36;
    v46 = 2082;
    v47 = v32;
    v48 = 2082;
    v49 = v33;
    v50 = 2050;
    a8 = v30;
    v51 = v30;
    v52 = 2082;
    v53 = objc_msgSend_sourceAsString_(CLEEDMitigation, v28, a9, v29);
    v34 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation initWithStreamingAllowed:framerateFps:bitrateKbps:dropStreaming:uploadAllowed:uploadMitigation:source:]", "CoreLocation: %s\n", v34);
    if (v34 != (char *)buf)
      free(v34);
    self = v35;
    a4 = v36;
  }
  v39.receiver = self;
  v39.super_class = (Class)CLEEDMitigation;
  result = -[CLEEDMitigation init](&v39, sel_init);
  if (result)
  {
    result->_newStreamingAllowed = v13;
    result->_newUploadAllowed = v10;
    result->_streamingFPS = a4;
    result->_streamingBitrate = a5;
    result->_dropStreaming = v11;
    result->_uploadMigitation = a8;
    result->_source = a9;
  }
  return result;
}

- (CLEEDMitigation)init
{
  return (CLEEDMitigation *)objc_msgSend_initWithStreamingAllowed_framerateFps_bitrateKbps_dropStreaming_uploadAllowed_uploadMitigation_source_(self, a2, 1, 24, 800, 0, 1, 0, 1);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLEEDMitigation;
  -[CLEEDMitigation dealloc](&v2, sel_dealloc);
}

- (BOOL)anyChangeToNewRequestsComparedTo:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v23 = "-[CLEEDMitigation anyChangeToNewRequestsComparedTo:]";
    v24 = 2114;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "#EED2CXFW,%{public}s,other:%{public}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v21 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation anyChangeToNewRequestsComparedTo:]", "CoreLocation: %s\n", v21);
    if (v21 != (char *)buf)
      free(v21);
  }
  if (!a3)
    return 0;
  v9 = objc_msgSend_newUploadAllowed(self, v6, v7, v8);
  if (v9 != objc_msgSend_newUploadAllowed(a3, v10, v11, v12))
    return 1;
  v17 = objc_msgSend_newStreamingAllowed(self, v13, v14, v15);
  return v17 ^ objc_msgSend_newStreamingAllowed(a3, v18, v19, v20);
}

- (BOOL)updateWorseMitigationsFrom:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  int v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  char v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  int v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  int v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  NSObject *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  char *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  char *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  char *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  char *v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  char *v219;
  uint8_t buf[4];
  const char *v221;
  __int16 v222;
  uint64_t v223;
  __int16 v224;
  uint64_t v225;
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v221 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
    v222 = 2114;
    v223 = (uint64_t)a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "#EED2CXFW,%{public}s, incomingMitigation:%{public}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v174 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v174);
    if (v174 != (char *)buf)
      free(v174);
  }
  if (a3)
  {
    if (!objc_msgSend_newStreamingAllowed(self, v6, v7, v8)
      || (v12 = objc_msgSend_newStreamingAllowed(self, v9, v10, v11),
          v12 == objc_msgSend_newStreamingAllowed(a3, v13, v14, v15)))
    {
      v32 = 0;
    }
    else
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v16 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend_newStreamingAllowed(self, v17, v18, v19))
          v23 = "YES";
        else
          v23 = "NO";
        v24 = objc_msgSend_newStreamingAllowed(a3, v20, v21, v22);
        *(_DWORD *)buf = 136446722;
        v221 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
        if (v24)
          v25 = "YES";
        else
          v25 = "NO";
        v222 = 2082;
        v223 = (uint64_t)v23;
        v224 = 2082;
        v225 = (uint64_t)v25;
        _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, newStreamingAllowed[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_newStreamingAllowed(self, v189, v190, v191);
        objc_msgSend_newStreamingAllowed(a3, v192, v193, v194);
        v195 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v195);
        if (v195 != (char *)buf)
          free(v195);
      }
      v29 = objc_msgSend_newStreamingAllowed(a3, v26, v27, v28);
      objc_msgSend_setNewStreamingAllowed_(self, v30, v29, v31);
      v32 = 1;
    }
    if ((objc_msgSend_dropStreaming(self, v9, v10, v11) & 1) == 0)
    {
      v36 = objc_msgSend_dropStreaming(self, v33, v34, v35);
      if (v36 != objc_msgSend_dropStreaming(a3, v37, v38, v39))
      {
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v40 = qword_1EE172098;
        if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
        {
          if (objc_msgSend_dropStreaming(self, v41, v42, v43))
            v47 = "YES";
          else
            v47 = "NO";
          v48 = objc_msgSend_dropStreaming(a3, v44, v45, v46);
          *(_DWORD *)buf = 136446722;
          v221 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
          if (v48)
            v49 = "YES";
          else
            v49 = "NO";
          v222 = 2082;
          v223 = (uint64_t)v47;
          v224 = 2082;
          v225 = (uint64_t)v49;
          _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, dropStreaming[%{public}s->%{public}s]", buf, 0x20u);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          objc_msgSend_dropStreaming(self, v196, v197, v198);
          objc_msgSend_dropStreaming(a3, v199, v200, v201);
          v202 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v202);
          if (v202 != (char *)buf)
            free(v202);
        }
        v53 = objc_msgSend_dropStreaming(a3, v50, v51, v52);
        objc_msgSend_setDropStreaming_(self, v54, v53, v55);
        v32 = 1;
      }
    }
    v56 = objc_msgSend_streamingFPS(a3, v33, v34, v35);
    if (v56 < objc_msgSend_streamingFPS(self, v57, v58, v59))
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v63 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        v67 = objc_msgSend_streamingFPS(self, v64, v65, v66);
        v71 = objc_msgSend_streamingFPS(a3, v68, v69, v70);
        *(_DWORD *)buf = 136446722;
        v221 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
        v222 = 2050;
        v223 = v67;
        v224 = 2050;
        v225 = v71;
        _os_log_impl(&dword_18F5B3000, v63, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, streamingFPS[%{public}ld->%{public}ld]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_streamingFPS(self, v175, v176, v177);
        objc_msgSend_streamingFPS(a3, v178, v179, v180);
        v181 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v181);
        if (v181 != (char *)buf)
          free(v181);
      }
      v75 = objc_msgSend_streamingFPS(a3, v72, v73, v74);
      objc_msgSend_setStreamingFPS_(self, v76, v75, v77);
      v32 = 1;
    }
    v78 = objc_msgSend_streamingBitrate(a3, v60, v61, v62);
    if (v78 < objc_msgSend_streamingBitrate(self, v79, v80, v81))
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v85 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        v89 = objc_msgSend_streamingBitrate(self, v86, v87, v88);
        v93 = objc_msgSend_streamingBitrate(a3, v90, v91, v92);
        *(_DWORD *)buf = 136446722;
        v221 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
        v222 = 2050;
        v223 = v89;
        v224 = 2050;
        v225 = v93;
        _os_log_impl(&dword_18F5B3000, v85, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, streamingBitrate[%{public}ld->%{public}ld]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_streamingBitrate(self, v182, v183, v184);
        objc_msgSend_streamingBitrate(a3, v185, v186, v187);
        v188 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v188);
        if (v188 != (char *)buf)
          free(v188);
      }
      v97 = objc_msgSend_streamingBitrate(a3, v94, v95, v96);
      objc_msgSend_setStreamingBitrate_(self, v98, v97, v99);
      v32 = 1;
    }
    if (objc_msgSend_newUploadAllowed(self, v82, v83, v84))
    {
      v103 = objc_msgSend_newUploadAllowed(self, v100, v101, v102);
      if (v103 != objc_msgSend_newUploadAllowed(a3, v104, v105, v106))
      {
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v107 = qword_1EE172098;
        if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
        {
          if (objc_msgSend_newUploadAllowed(self, v108, v109, v110))
            v114 = "YES";
          else
            v114 = "NO";
          v115 = objc_msgSend_newUploadAllowed(a3, v111, v112, v113);
          *(_DWORD *)buf = 136446722;
          v221 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
          if (v115)
            v116 = "YES";
          else
            v116 = "NO";
          v222 = 2082;
          v223 = (uint64_t)v114;
          v224 = 2082;
          v225 = (uint64_t)v116;
          _os_log_impl(&dword_18F5B3000, v107, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, newUploadAllowed[%{public}s->%{public}s]", buf, 0x20u);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          objc_msgSend_newUploadAllowed(self, v203, v204, v205);
          objc_msgSend_newUploadAllowed(a3, v206, v207, v208);
          v209 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v209);
          if (v209 != (char *)buf)
            free(v209);
        }
        v120 = objc_msgSend_newUploadAllowed(a3, v117, v118, v119);
        objc_msgSend_setNewUploadAllowed_(self, v121, v120, v122);
        v32 = 1;
      }
    }
    if (objc_msgSend_uploadMigitation(self, v100, v101, v102) != 2)
    {
      v126 = objc_msgSend_uploadMigitation(self, v123, v124, v125);
      if (v126 != objc_msgSend_uploadMigitation(a3, v127, v128, v129))
      {
        v130 = objc_msgSend_uploadMigitation(self, v123, v124, v125);
        if (v130 == 1)
        {
          if (objc_msgSend_uploadMigitation(a3, v123, v124, v125) == 2)
          {
            if (qword_1EE1720A0 != -1)
              dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
            v152 = qword_1EE172098;
            if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
            {
              v156 = objc_msgSend_uploadMigitation(self, v153, v154, v155);
              v159 = objc_msgSend_toCLEEDUploadMitigationString_(self, v157, v156, v158);
              v163 = objc_msgSend_uploadMigitation(a3, v160, v161, v162);
              v166 = objc_msgSend_toCLEEDUploadMitigationString_(a3, v164, v163, v165);
              *(_DWORD *)buf = 136446722;
              v221 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
              v222 = 2082;
              v223 = v159;
              v224 = 2082;
              v225 = v166;
              _os_log_impl(&dword_18F5B3000, v152, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, uploadMitigation[%{public}s->%{public}s]", buf, 0x20u);
            }
            if (!sub_18F5C4AE0(115, 2))
              goto LABEL_82;
            bzero(buf, 0x65CuLL);
            if (qword_1EE1720A0 == -1)
              goto LABEL_111;
            goto LABEL_113;
          }
        }
        else if (!v130 && (unint64_t)(objc_msgSend_uploadMigitation(a3, v123, v124, v125) - 1) <= 1)
        {
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v131 = qword_1EE172098;
          if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
          {
            v135 = objc_msgSend_uploadMigitation(self, v132, v133, v134);
            v138 = objc_msgSend_toCLEEDUploadMitigationString_(self, v136, v135, v137);
            v142 = objc_msgSend_uploadMigitation(a3, v139, v140, v141);
            v145 = objc_msgSend_toCLEEDUploadMitigationString_(a3, v143, v142, v144);
            *(_DWORD *)buf = 136446722;
            v221 = "-[CLEEDMitigation updateWorseMitigationsFrom:]";
            v222 = 2082;
            v223 = v138;
            v224 = 2082;
            v225 = v145;
            _os_log_impl(&dword_18F5B3000, v131, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, uploadMitigation[%{public}s->%{public}s]", buf, 0x20u);
          }
          if (!sub_18F5C4AE0(115, 2))
            goto LABEL_82;
          bzero(buf, 0x65CuLL);
          if (qword_1EE1720A0 == -1)
          {
LABEL_111:
            v210 = objc_msgSend_uploadMigitation(self, v149, v150, v151);
            objc_msgSend_toCLEEDUploadMitigationString_(self, v211, v210, v212);
            v216 = objc_msgSend_uploadMigitation(a3, v213, v214, v215);
            objc_msgSend_toCLEEDUploadMitigationString_(a3, v217, v216, v218);
            v219 = (char *)_os_log_send_and_compose_impl();
            sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateWorseMitigationsFrom:]", "CoreLocation: %s\n", v219);
            if (v219 != (char *)buf)
              free(v219);
LABEL_82:
            v167 = objc_msgSend_uploadMigitation(a3, v146, v147, v148);
            objc_msgSend_setUploadMigitation_(self, v168, v167, v169);
LABEL_84:
            v170 = objc_msgSend_source(a3, v123, v124, v125);
            objc_msgSend_setSource_(self, v171, v170, v172);
            return 1;
          }
LABEL_113:
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          goto LABEL_111;
        }
      }
    }
    if ((v32 & 1) != 0)
      goto LABEL_84;
  }
  return 0;
}

- (BOOL)updateIfDifferentFrom:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  int v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  int v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  int v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  int v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  char *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  char *v203;
  uint8_t buf[4];
  const char *v205;
  __int16 v206;
  uint64_t v207;
  __int16 v208;
  uint64_t v209;
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v205 = "-[CLEEDMitigation updateIfDifferentFrom:]";
    v206 = 2114;
    v207 = (uint64_t)a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "#EED2CXFW,%{public}s, incomingMitigation:%{public}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v155 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v155);
    if (v155 != (char *)buf)
      free(v155);
  }
  if (a3)
  {
    v9 = objc_msgSend_newStreamingAllowed(self, v6, v7, v8);
    v16 = v9 ^ objc_msgSend_newStreamingAllowed(a3, v10, v11, v12);
    if (v16 == 1)
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v17 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend_newStreamingAllowed(self, v18, v19, v20))
          v24 = "YES";
        else
          v24 = "NO";
        v25 = objc_msgSend_newStreamingAllowed(a3, v21, v22, v23);
        *(_DWORD *)buf = 136446722;
        v205 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        if (v25)
          v26 = "YES";
        else
          v26 = "NO";
        v206 = 2082;
        v207 = (uint64_t)v24;
        v208 = 2082;
        v209 = (uint64_t)v26;
        _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, newStreamingAllowed[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_newStreamingAllowed(self, v156, v157, v158);
        objc_msgSend_newStreamingAllowed(a3, v159, v160, v161);
        v162 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v162);
        if (v162 != (char *)buf)
          free(v162);
      }
      v30 = objc_msgSend_newStreamingAllowed(a3, v27, v28, v29);
      objc_msgSend_setNewStreamingAllowed_(self, v31, v30, v32);
    }
    v33 = objc_msgSend_dropStreaming(self, v13, v14, v15);
    if (v33 != objc_msgSend_dropStreaming(a3, v34, v35, v36))
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v40 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend_dropStreaming(self, v41, v42, v43))
          v47 = "YES";
        else
          v47 = "NO";
        v48 = objc_msgSend_dropStreaming(a3, v44, v45, v46);
        *(_DWORD *)buf = 136446722;
        v205 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        if (v48)
          v49 = "YES";
        else
          v49 = "NO";
        v206 = 2082;
        v207 = (uint64_t)v47;
        v208 = 2082;
        v209 = (uint64_t)v49;
        _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, dropStreaming[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_dropStreaming(self, v163, v164, v165);
        objc_msgSend_dropStreaming(a3, v166, v167, v168);
        v169 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v169);
        if (v169 != (char *)buf)
          free(v169);
      }
      v53 = objc_msgSend_dropStreaming(a3, v50, v51, v52);
      objc_msgSend_setDropStreaming_(self, v54, v53, v55);
      LOBYTE(v16) = 1;
    }
    v56 = objc_msgSend_streamingFPS(a3, v37, v38, v39);
    if (v56 != objc_msgSend_streamingFPS(self, v57, v58, v59))
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v63 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        v67 = objc_msgSend_streamingFPS(self, v64, v65, v66);
        v71 = objc_msgSend_streamingFPS(a3, v68, v69, v70);
        *(_DWORD *)buf = 136446722;
        v205 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        v206 = 2050;
        v207 = v67;
        v208 = 2050;
        v209 = v71;
        _os_log_impl(&dword_18F5B3000, v63, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, streamingFPS[%{public}ld->%{public}ld]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_streamingFPS(self, v170, v171, v172);
        objc_msgSend_streamingFPS(a3, v173, v174, v175);
        v176 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v176);
        if (v176 != (char *)buf)
          free(v176);
      }
      v75 = objc_msgSend_streamingFPS(a3, v72, v73, v74);
      objc_msgSend_setStreamingFPS_(self, v76, v75, v77);
      LOBYTE(v16) = 1;
    }
    v78 = objc_msgSend_streamingBitrate(a3, v60, v61, v62);
    if (v78 != objc_msgSend_streamingBitrate(self, v79, v80, v81))
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v85 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        v89 = objc_msgSend_streamingBitrate(self, v86, v87, v88);
        v93 = objc_msgSend_streamingBitrate(a3, v90, v91, v92);
        *(_DWORD *)buf = 136446722;
        v205 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        v206 = 2050;
        v207 = v89;
        v208 = 2050;
        v209 = v93;
        _os_log_impl(&dword_18F5B3000, v85, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, streamingBitrate[%{public}ld->%{public}ld]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_streamingBitrate(self, v177, v178, v179);
        objc_msgSend_streamingBitrate(a3, v180, v181, v182);
        v183 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v183);
        if (v183 != (char *)buf)
          free(v183);
      }
      v97 = objc_msgSend_streamingBitrate(a3, v94, v95, v96);
      objc_msgSend_setStreamingBitrate_(self, v98, v97, v99);
      LOBYTE(v16) = 1;
    }
    v100 = objc_msgSend_newUploadAllowed(self, v82, v83, v84);
    if (v100 != objc_msgSend_newUploadAllowed(a3, v101, v102, v103))
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v107 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend_newUploadAllowed(self, v108, v109, v110))
          v114 = "YES";
        else
          v114 = "NO";
        v115 = objc_msgSend_newUploadAllowed(a3, v111, v112, v113);
        *(_DWORD *)buf = 136446722;
        v205 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        if (v115)
          v116 = "YES";
        else
          v116 = "NO";
        v206 = 2082;
        v207 = (uint64_t)v114;
        v208 = 2082;
        v209 = (uint64_t)v116;
        _os_log_impl(&dword_18F5B3000, v107, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, newUploadAllowed[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_newUploadAllowed(self, v184, v185, v186);
        objc_msgSend_newUploadAllowed(a3, v187, v188, v189);
        v190 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v190);
        if (v190 != (char *)buf)
          free(v190);
      }
      v120 = objc_msgSend_newUploadAllowed(a3, v117, v118, v119);
      objc_msgSend_setNewUploadAllowed_(self, v121, v120, v122);
      LOBYTE(v16) = 1;
    }
    v123 = objc_msgSend_uploadMigitation(self, v104, v105, v106);
    if (v123 != objc_msgSend_uploadMigitation(a3, v124, v125, v126))
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v130 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        v134 = objc_msgSend_uploadMigitation(self, v131, v132, v133);
        v137 = objc_msgSend_toCLEEDUploadMitigationString_(self, v135, v134, v136);
        v141 = objc_msgSend_uploadMigitation(a3, v138, v139, v140);
        v144 = objc_msgSend_toCLEEDUploadMitigationString_(a3, v142, v141, v143);
        *(_DWORD *)buf = 136446722;
        v205 = "-[CLEEDMitigation updateIfDifferentFrom:]";
        v206 = 2082;
        v207 = v137;
        v208 = 2082;
        v209 = v144;
        _os_log_impl(&dword_18F5B3000, v130, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, uploadMitigation[%{public}s->%{public}s]", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v194 = objc_msgSend_uploadMigitation(self, v191, v192, v193);
        objc_msgSend_toCLEEDUploadMitigationString_(self, v195, v194, v196);
        v200 = objc_msgSend_uploadMigitation(a3, v197, v198, v199);
        objc_msgSend_toCLEEDUploadMitigationString_(a3, v201, v200, v202);
        v203 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation updateIfDifferentFrom:]", "CoreLocation: %s\n", v203);
        if (v203 != (char *)buf)
          free(v203);
      }
      v148 = objc_msgSend_uploadMigitation(a3, v145, v146, v147);
      objc_msgSend_setUploadMigitation_(self, v149, v148, v150);
      LOBYTE(v16) = 1;
    }
    v151 = objc_msgSend_source(a3, v127, v128, v129);
    objc_msgSend_setSource_(self, v152, v151, v153);
  }
  else
  {
    LOBYTE(v16) = 0;
  }
  return v16;
}

- (BOOL)needsRequestStateUpdateComparedTo:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  int v24;
  const char *v25;
  BOOL v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  char *v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v72 = "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]";
    v73 = 2114;
    v74 = (uint64_t)a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "#EED2CXFW,%{public}s, incomingMitigation:%{public}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v50 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]", "CoreLocation: %s\n", v50);
    if (v50 != (char *)buf)
      free(v50);
  }
  if (!a3)
    return 0;
  v9 = objc_msgSend_dropStreaming(self, v6, v7, v8);
  if (v9 == objc_msgSend_dropStreaming(a3, v10, v11, v12)
    || !objc_msgSend_dropStreaming(a3, v13, v14, v15))
  {
    v26 = 0;
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v16 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend_dropStreaming(self, v17, v18, v19))
        v23 = "YES";
      else
        v23 = "NO";
      v24 = objc_msgSend_dropStreaming(a3, v20, v21, v22);
      *(_DWORD *)buf = 136446722;
      v72 = "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]";
      if (v24)
        v25 = "YES";
      else
        v25 = "NO";
      v73 = 2082;
      v74 = (uint64_t)v23;
      v75 = 2082;
      v76 = (uint64_t)v25;
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, dropStreaming[%{public}s->%{public}s]", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      objc_msgSend_dropStreaming(self, v51, v52, v53);
      objc_msgSend_dropStreaming(a3, v54, v55, v56);
      v57 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]", "CoreLocation: %s\n", v57);
      if (v57 != (char *)buf)
        free(v57);
    }
    v26 = 1;
  }
  v27 = objc_msgSend_uploadMigitation(self, v13, v14, v15);
  if (v27 != objc_msgSend_uploadMigitation(a3, v28, v29, v30) && objc_msgSend_uploadMigitation(a3, v31, v32, v33) == 1)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v34 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend_uploadMigitation(self, v35, v36, v37);
      v41 = objc_msgSend_toCLEEDUploadMitigationString_(self, v39, v38, v40);
      v45 = objc_msgSend_uploadMigitation(a3, v42, v43, v44);
      v48 = objc_msgSend_toCLEEDUploadMitigationString_(a3, v46, v45, v47);
      *(_DWORD *)buf = 136446722;
      v72 = "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]";
      v73 = 2082;
      v74 = v41;
      v75 = 2082;
      v76 = v48;
      _os_log_impl(&dword_18F5B3000, v34, OS_LOG_TYPE_DEFAULT, "#EED2CXFW,%{public}s, uploadMitigation[%{public}s->%{public}s]", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v61 = objc_msgSend_uploadMigitation(self, v58, v59, v60);
      objc_msgSend_toCLEEDUploadMitigationString_(self, v62, v61, v63);
      v67 = objc_msgSend_uploadMigitation(a3, v64, v65, v66);
      objc_msgSend_toCLEEDUploadMitigationString_(a3, v68, v67, v69);
      v70 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDMitigation needsRequestStateUpdateComparedTo:]", "CoreLocation: %s\n", v70);
      if (v70 != (char *)buf)
        free(v70);
    }
    return 1;
  }
  return v26;
}

- (const)toCLEEDUploadMitigationString:(int64_t)a3
{
  const char *v3;

  v3 = "None";
  if (a3 == 1)
    v3 = "Delay";
  if (a3 == 2)
    return "Drop";
  else
    return v3;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend_newStreamingAllowed(self, a2, v2, v3))
    v9 = "YES";
  else
    v9 = "NO";
  v10 = objc_msgSend_streamingFPS(self, v6, v7, v8);
  v14 = objc_msgSend_streamingBitrate(self, v11, v12, v13);
  if (objc_msgSend_dropStreaming(self, v15, v16, v17))
    v21 = "YES";
  else
    v21 = "NO";
  if (objc_msgSend_newUploadAllowed(self, v18, v19, v20))
    v25 = "YES";
  else
    v25 = "NO";
  v26 = objc_msgSend_uploadMigitation(self, v22, v23, v24);
  v29 = objc_msgSend_toCLEEDUploadMitigationString_(self, v27, v26, v28);
  v33 = objc_msgSend_source(self, v30, v31, v32);
  v36 = objc_msgSend_sourceAsString_(CLEEDMitigation, v34, v33, v35);
  return (id)objc_msgSend_stringWithFormat_(v5, v37, (uint64_t)CFSTR("[streamingAllowed:%s,fps:%ld,Kbps:%ld,dropStreaming:%s,uploadAllowed:%s,uploadMitigation:%s,source:%s]"), v38, v9, v10, v14, v21, v25, v29, v36);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  objc_msgSend_encodeBool_forKey_(a3, a2, self->_newStreamingAllowed, (uint64_t)CFSTR("newStreamingAllowed"));
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_streamingFPS, (uint64_t)CFSTR("streamingFPS"));
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_streamingBitrate, (uint64_t)CFSTR("bitrateBPS"));
  objc_msgSend_encodeBool_forKey_(a3, v7, self->_dropStreaming, (uint64_t)CFSTR("dropStreaming"));
  objc_msgSend_encodeBool_forKey_(a3, v8, self->_newUploadAllowed, (uint64_t)CFSTR("newUploadAllowed"));
  objc_msgSend_encodeInteger_forKey_(a3, v9, self->_uploadMigitation, (uint64_t)CFSTR("uploadMigitation"));
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_source, (uint64_t)CFSTR("MitigationSource"));
}

- (CLEEDMitigation)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  CLEEDMitigation *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLEEDMitigation;
  v6 = -[CLEEDMitigation init](&v20, sel_init);
  if (v6)
  {
    v6->_newStreamingAllowed = objc_msgSend_decodeBoolForKey_(a3, v4, (uint64_t)CFSTR("newStreamingAllowed"), v5);
    v6->_dropStreaming = objc_msgSend_decodeBoolForKey_(a3, v7, (uint64_t)CFSTR("dropStreaming"), v8);
    v6->_streamingFPS = objc_msgSend_decodeIntegerForKey_(a3, v9, (uint64_t)CFSTR("streamingFPS"), v10);
    v6->_streamingBitrate = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("bitrateBPS"), v12);
    v6->_newUploadAllowed = objc_msgSend_decodeBoolForKey_(a3, v13, (uint64_t)CFSTR("newUploadAllowed"), v14);
    v6->_uploadMigitation = objc_msgSend_decodeIntegerForKey_(a3, v15, (uint64_t)CFSTR("uploadMigitation"), v16);
    v6->_source = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("MitigationSource"), v18);
  }
  return v6;
}

- (id)newMitigationDict
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  NSObject *v67;
  char *v69;
  uint8_t buf[4];
  const char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = objc_msgSend_newStreamingAllowed(self, v3, v4, v5);
    v11 = objc_msgSend_numberWithBool_(v7, v9, v8, v10);
    objc_msgSend_setValue_forKey_(v6, v12, v11, (uint64_t)CFSTR("newStreamingAllowed"));
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v17 = objc_msgSend_dropStreaming(self, v14, v15, v16);
    v20 = objc_msgSend_numberWithBool_(v13, v18, v17, v19);
    objc_msgSend_setValue_forKey_(v6, v21, v20, (uint64_t)CFSTR("dropStreaming"));
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v26 = objc_msgSend_streamingFPS(self, v23, v24, v25);
    v29 = objc_msgSend_numberWithInteger_(v22, v27, v26, v28);
    objc_msgSend_setValue_forKey_(v6, v30, v29, (uint64_t)CFSTR("streamingFPS"));
    v31 = (void *)MEMORY[0x1E0CB37E8];
    v35 = objc_msgSend_streamingBitrate(self, v32, v33, v34);
    v38 = objc_msgSend_numberWithInteger_(v31, v36, v35, v37);
    objc_msgSend_setValue_forKey_(v6, v39, v38, (uint64_t)CFSTR("bitrateBPS"));
    v40 = (void *)MEMORY[0x1E0CB37E8];
    v44 = objc_msgSend_newUploadAllowed(self, v41, v42, v43);
    v47 = objc_msgSend_numberWithBool_(v40, v45, v44, v46);
    objc_msgSend_setValue_forKey_(v6, v48, v47, (uint64_t)CFSTR("newUploadAllowed"));
    v49 = (void *)MEMORY[0x1E0CB37E8];
    v53 = objc_msgSend_uploadMigitation(self, v50, v51, v52);
    v56 = objc_msgSend_numberWithInteger_(v49, v54, v53, v55);
    objc_msgSend_setValue_forKey_(v6, v57, v56, (uint64_t)CFSTR("uploadMigitation"));
    v58 = (void *)MEMORY[0x1E0CB37E8];
    v62 = objc_msgSend_source(self, v59, v60, v61);
    v65 = objc_msgSend_numberWithInteger_(v58, v63, v62, v64);
    objc_msgSend_setValue_forKey_(v6, v66, v65, (uint64_t)CFSTR("MitigationSource"));
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v67 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v71 = "-[CLEEDMitigation newMitigationDict]";
      _os_log_impl(&dword_18F5B3000, v67, OS_LOG_TYPE_ERROR, "#EED2CXFW,%{public}s,nil mediaItemDict, early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v69 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDMitigation newMitigationDict]", "CoreLocation: %s\n", v69);
      if (v69 != (char *)buf)
        free(v69);
    }
  }
  return v6;
}

+ (id)newMitigationFromDict:(id)a3
{
  const char *v4;
  uint64_t v5;
  CLEEDMitigation *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  char *v70;
  uint8_t buf[4];
  const char *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(CLEEDMitigation);
  if (v6)
  {
    v7 = (void *)objc_msgSend_valueForKey_(a3, v4, (uint64_t)CFSTR("MitigationSource"), v5);
    v11 = objc_msgSend_intValue(v7, v8, v9, v10);
    objc_msgSend_setSource_(v6, v12, v11, v13);
    v16 = (void *)objc_msgSend_valueForKey_(a3, v14, (uint64_t)CFSTR("uploadMigitation"), v15);
    v20 = objc_msgSend_intValue(v16, v17, v18, v19);
    objc_msgSend_setUploadMigitation_(v6, v21, v20, v22);
    v25 = (void *)objc_msgSend_valueForKey_(a3, v23, (uint64_t)CFSTR("streamingFPS"), v24);
    v29 = objc_msgSend_integerValue(v25, v26, v27, v28);
    objc_msgSend_setStreamingFPS_(v6, v30, v29, v31);
    v34 = (void *)objc_msgSend_valueForKey_(a3, v32, (uint64_t)CFSTR("bitrateBPS"), v33);
    v38 = objc_msgSend_integerValue(v34, v35, v36, v37);
    objc_msgSend_setStreamingBitrate_(v6, v39, v38, v40);
    v43 = (void *)objc_msgSend_valueForKey_(a3, v41, (uint64_t)CFSTR("newUploadAllowed"), v42);
    v47 = objc_msgSend_BOOLValue(v43, v44, v45, v46);
    objc_msgSend_setNewUploadAllowed_(v6, v48, v47, v49);
    v52 = (void *)objc_msgSend_valueForKey_(a3, v50, (uint64_t)CFSTR("newStreamingAllowed"), v51);
    v56 = objc_msgSend_BOOLValue(v52, v53, v54, v55);
    objc_msgSend_setNewStreamingAllowed_(v6, v57, v56, v58);
    v61 = (void *)objc_msgSend_valueForKey_(a3, v59, (uint64_t)CFSTR("dropStreaming"), v60);
    v65 = objc_msgSend_BOOLValue(v61, v62, v63, v64);
    objc_msgSend_setDropStreaming_(v6, v66, v65, v67);
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v68 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v72 = "+[CLEEDMitigation newMitigationFromDict:]";
      _os_log_impl(&dword_18F5B3000, v68, OS_LOG_TYPE_ERROR, "#EED2CXFW,%{public}s,nil mitigation, early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v70 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDMitigation newMitigationFromDict:]", "CoreLocation: %s\n", v70);
      if (v70 != (char *)buf)
        free(v70);
    }
  }
  return v6;
}

+ (const)sourceAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return "NotSet";
  else
    return off_1E2991628[a3 - 1];
}

- (BOOL)newStreamingAllowed
{
  return self->_newStreamingAllowed;
}

- (void)setNewStreamingAllowed:(BOOL)a3
{
  self->_newStreamingAllowed = a3;
}

- (BOOL)dropStreaming
{
  return self->_dropStreaming;
}

- (void)setDropStreaming:(BOOL)a3
{
  self->_dropStreaming = a3;
}

- (int64_t)streamingFPS
{
  return self->_streamingFPS;
}

- (void)setStreamingFPS:(int64_t)a3
{
  self->_streamingFPS = a3;
}

- (int64_t)streamingBitrate
{
  return self->_streamingBitrate;
}

- (void)setStreamingBitrate:(int64_t)a3
{
  self->_streamingBitrate = a3;
}

- (BOOL)newUploadAllowed
{
  return self->_newUploadAllowed;
}

- (void)setNewUploadAllowed:(BOOL)a3
{
  self->_newUploadAllowed = a3;
}

- (int64_t)uploadMigitation
{
  return self->_uploadMigitation;
}

- (void)setUploadMigitation:(int64_t)a3
{
  self->_uploadMigitation = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

@end
