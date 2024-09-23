id sub_227C0E9D0()
{
  if (qword_254058268 != -1)
    dispatch_once(&qword_254058268, &unk_24F05E388);
  return (id)qword_254058270;
}

void sub_227C0EA84()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.adplatforms", "Attribution");
  v1 = (void *)qword_254058270;
  qword_254058270 = (uint64_t)v0;

}

id *sub_227C0EAB4(id *a1, void *a2, char a3, void *a4)
{
  id v8;
  id v9;
  id *v10;
  id *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  id *v23;
  objc_super v25;
  uint8_t buf[4];
  os_signpost_id_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a4;
  if (a1 && v8)
  {
    v25.receiver = a1;
    v25.super_class = (Class)AAAttributionRequester;
    v10 = (id *)objc_msgSendSuper2(&v25, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      objc_msgSend_remoteObjectProxy(v11[2], v12, v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v11[3];
      v11[3] = (id)v17;

      *((_DWORD *)v11 + 3) = 0;
      *((_BYTE *)v11 + 9) = a3;
      objc_storeStrong(v11 + 4, a4);
      APPerfLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      v11[5] = (id)os_signpost_id_generate(v19);

      APPerfLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = (os_signpost_id_t)v11[5];
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_DWORD *)buf = 134349056;
        v27 = v22;
        _os_signpost_emit_with_name_impl(&dword_227C0D000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
      }

    }
    a1 = v11;
    v23 = a1;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

id sub_227C0EC44(id val, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  char v5;
  char v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_signpost_id_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
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
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  dispatch_time_t v59;
  intptr_t v60;
  __uint64_t v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  os_signpost_id_t v68;
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
  uint64_t isMainThread;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  NSObject *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  os_signpost_id_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  os_signpost_id_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  NSObject *v144;
  id v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  NSObject *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  os_signpost_id_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  NSObject *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  os_signpost_id_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  id v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
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
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  char isEqualToString;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  NSObject *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  os_signpost_id_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  __int128 v280;
  int v281;
  _QWORD v283[4];
  NSObject *v284;
  uint64_t *v285;
  id v286;
  _QWORD v287[4];
  NSObject *v288;
  id v289;
  uint64_t v290;
  uint64_t *v291;
  uint64_t v292;
  uint64_t (*v293)(uint64_t, uint64_t);
  void (*v294)(uint64_t);
  id v295;
  id location;
  uint8_t buf[4];
  uint64_t v298;
  __int16 v299;
  uint64_t v300;
  uint64_t v301;

  v2 = (uint64_t)val;
  v301 = *MEMORY[0x24BDAC8D0];
  if (!val)
    return (id)v2;
  objc_initWeak(&location, val);
  v3 = 0;
  v290 = 0;
  v291 = &v290;
  v292 = 0x3032000000;
  v293 = sub_227C0F73C;
  v294 = sub_227C0F74C;
  v295 = 0;
  *(_QWORD *)&v4 = 134349056;
  v280 = v4;
  v5 = 1;
  while (1)
  {
    v6 = v5;
    v7 = dispatch_semaphore_create(0);
    v287[0] = MEMORY[0x24BDAC760];
    v287[1] = 3221225472;
    v287[2] = sub_227C0F754;
    v287[3] = &unk_24F05E3B0;
    objc_copyWeak(&v289, &location);
    v8 = v7;
    v288 = v8;
    v9 = *(id *)(v2 + 16);
    objc_msgSend_setInterruptionHandler_(v9, v10, (uint64_t)v287, v11, v12, v13);

    objc_msgSend_setConnectionInterrupted_((void *)v2, v14, 0, v15, v16, v17);
    v18 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    APPerfLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_intervalId((void *)v2, v20, v21, v22, v23, v24);
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v31 = objc_msgSend_intervalId((void *)v2, v26, v27, v28, v29, v30);
      *(_DWORD *)buf = 134349312;
      v298 = v31;
      v299 = 2050;
      v300 = v3;
      _os_signpost_emit_with_name_impl(&dword_227C0D000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v25, "Token Request XPC", "id=%{public, name=id}lld retryCount=%{public, name=retryCount}ld", buf, 0x16u);
    }

    objc_msgSend_remoteProxy((void *)v2, v32, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestTime((void *)v2, v38, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend_intervalId((void *)v2, v44, v45, v46, v47, v48);
    v283[0] = MEMORY[0x24BDAC760];
    v283[1] = 3221225472;
    v283[2] = sub_227C0F7E0;
    v283[3] = &unk_24F05E3D8;
    objc_copyWeak(&v286, &location);
    v285 = &v290;
    v50 = v8;
    v284 = v50;
    objc_msgSend_attributionTokenRequestTimestamp_interval_completionHandler_(v37, v51, (uint64_t)v43, v49, (uint64_t)v283, v52);

    if (objc_msgSend_isMainThread((void *)v2, v53, v54, v55, v56, v57))
      v58 = 1500000000;
    else
      v58 = 10000000000;
    v59 = dispatch_time(0, v58);
    v60 = dispatch_semaphore_wait(v50, v59);
    v61 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    APPerfLogForCategory();
    v62 = objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_intervalId((void *)v2, v63, v64, v65, v66, v67);
    if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      v74 = objc_msgSend_intervalId((void *)v2, v69, v70, v71, v72, v73);
      v75 = (void *)MEMORY[0x24BDD16E0];
      isMainThread = objc_msgSend_isMainThread((void *)v2, v76, v77, v78, v79, v80);
      objc_msgSend_numberWithBool_(v75, v82, isMainThread, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v298 = v74;
      v299 = 2114;
      v300 = (uint64_t)v86;
      _os_signpost_emit_with_name_impl(&dword_227C0D000, v62, OS_SIGNPOST_INTERVAL_END, v68, "Token Request XPC", "id=%{public, name=id}lld thread=%{public, name=thread}@", buf, 0x16u);

    }
    v92 = v60 == 0;
    if (v60)
    {
      APLogForCategory();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227C0D000, v93, OS_LOG_TYPE_ERROR, "AAAttribution XPC call timed out.", buf, 2u);
      }

      if (a2)
      {
        objc_msgSend__createInternalError(AAAttributionRequester, v94, v95, v96, v97, v98);
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend__sendAnalyticsAndInvalidateConnection_end_((void *)v2, v94, v18, v61, v97, v98, v280);
      if (objc_msgSend_isMainThread((void *)v2, v99, v100, v101, v102, v103))
        objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v104, 1, 0, v105, v106, 0.0);
      else
        objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v104, 2, 0, v105, v106, 0.0);
      APPerfLogForCategory();
      v107 = objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend_intervalId((void *)v2, v108, v109, v110, v111, v112);
      if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
      {
        v119 = objc_msgSend_intervalId((void *)v2, v114, v115, v116, v117, v118);
        *(_DWORD *)buf = v280;
        v298 = v119;
        _os_signpost_emit_with_name_impl(&dword_227C0D000, v107, OS_SIGNPOST_INTERVAL_END, v113, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
      }
LABEL_29:

      v133 = 0;
      goto LABEL_30;
    }
    if (objc_msgSend_connectionInterrupted((void *)v2, v87, v88, v89, v90, v91))
    {
      APPerfLogForCategory();
      v120 = objc_claimAutoreleasedReturnValue();
      v126 = objc_msgSend_intervalId((void *)v2, v121, v122, v123, v124, v125);
      if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v120))
      {
        v132 = objc_msgSend_intervalId((void *)v2, v127, v128, v129, v130, v131);
        *(_DWORD *)buf = v280;
        v298 = v132;
        _os_signpost_emit_with_name_impl(&dword_227C0D000, v120, OS_SIGNPOST_EVENT, v126, "Connection Interrupted", "Connection Interrupted id=%{public, name=id}lld", buf, 0xCu);
      }

      APLogForCategory();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227C0D000, v107, OS_LOG_TYPE_INFO, "AAAttribution XPC call interrupted. Initiating a retry.", buf, 2u);
      }
      goto LABEL_29;
    }
    v92 = 0;
    v133 = 1;
LABEL_30:

    objc_destroyWeak(&v286);
    objc_destroyWeak(&v289);

    if (!v92)
      break;
    v5 = 0;
    v3 = 1;
    if ((v6 & 1) == 0)
      goto LABEL_35;
  }
  if (!v133)
  {
    v2 = 0;
    goto LABEL_71;
  }
LABEL_35:
  if (objc_msgSend_connectionInterrupted((void *)v2, v134, v135, v136, v137, v138, v280))
  {
    if (a2)
    {
      objc_msgSend__createInternalError(AAAttributionRequester, v139, v140, v141, v142, v143);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    APLogForCategory();
    v144 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227C0D000, v144, OS_LOG_TYPE_ERROR, "AAAttribution XPC call failed.", buf, 2u);
    }

    v145 = *(id *)(v2 + 16);
    objc_msgSend_invalidate(v145, v146, v147, v148, v149, v150);

    objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v151, 0, 0, v152, v153, 0.0);
    APPerfLogForCategory();
    v154 = objc_claimAutoreleasedReturnValue();
    v160 = objc_msgSend_intervalId((void *)v2, v155, v156, v157, v158, v159);
    if (v160 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
    {
      v166 = objc_msgSend_intervalId((void *)v2, v161, v162, v163, v164, v165);
      *(_DWORD *)buf = v281;
      v298 = v166;
      _os_signpost_emit_with_name_impl(&dword_227C0D000, v154, OS_SIGNPOST_INTERVAL_END, v160, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
    }
    goto LABEL_69;
  }
  objc_msgSend__sendAnalyticsAndInvalidateConnection_end_((void *)v2, v139, v18, v61, v142, v143);
  os_unfair_lock_lock_with_options();
  v154 = (id)v291[5];
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 12));
  if ((objc_msgSend_success(v154, v167, v168, v169, v170, v171) & 1) != 0)
  {
    if (objc_msgSend_source(v154, v172, v173, v174, v175, v176))
    {
      v182 = objc_msgSend_source(v154, v177, v178, v179, v180, v181);
      v187 = objc_msgSend__tokenStatusFromTokenSource_(AAAttributionRequester, v183, v182, v184, v185, v186);
      objc_msgSend_storeFront(v154, v188, v189, v190, v191, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_daemonRunningTime(v154, v194, v195, v196, v197, v198);
      objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v199, v187, (uint64_t)v193, v200, v201);

    }
    else
    {
      objc_msgSend_cStringUsingEncoding_(CFSTR("com.apple.ap.AdPlatformsCommon"), v177, 30, v179, v180, v181);
      if (os_variant_has_internal_content()
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        sub_227C1018C();
      }
    }
    APPerfLogForCategory();
    v209 = objc_claimAutoreleasedReturnValue();
    v215 = objc_msgSend_intervalId((void *)v2, v210, v211, v212, v213, v214);
    if (v215 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v209))
    {
      v221 = objc_msgSend_intervalId((void *)v2, v216, v217, v218, v219, v220);
      *(_DWORD *)buf = v281;
      v298 = v221;
      _os_signpost_emit_with_name_impl(&dword_227C0D000, v209, OS_SIGNPOST_INTERVAL_END, v215, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
    }

    objc_msgSend_token(v154, v222, v223, v224, v225, v226);
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_70;
  }
  if (a2)
  {
    objc_msgSend_error(v154, v172, v173, v174, v175, v176);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = v202;
    if (v202)
    {
      *a2 = objc_retainAutorelease(v202);
    }
    else
    {
      objc_msgSend__createInternalError(AAAttributionRequester, v203, v204, v205, v206, v207);
      v227 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a2 = v227;

    }
  }
  objc_msgSend_error(v154, v172, v173, v174, v175, v176);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  if (v233)
  {
    objc_msgSend_error(v154, v228, v229, v230, v231, v232);
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_code(v234, v235, v236, v237, v238, v239) == 3)
    {
      objc_msgSend_error(v154, v240, v241, v242, v243, v244);
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_domain(v245, v246, v247, v248, v249, v250);
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v251, v252, (uint64_t)CFSTR("com.apple.ap.adservices.attributionError"), v253, v254, v255);

      if ((isEqualToString & 1) != 0)
        goto LABEL_65;
    }
    else
    {

    }
  }
  objc_msgSend_storeFront(v154, v228, v229, v230, v231, v232);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_daemonRunningTime(v154, v258, v259, v260, v261, v262);
  objc_msgSend__reportTokenStatus_storeFront_daemonRunningTime_((void *)v2, v263, 0, (uint64_t)v257, v264, v265);

LABEL_65:
  APPerfLogForCategory();
  v266 = objc_claimAutoreleasedReturnValue();
  v272 = objc_msgSend_intervalId((void *)v2, v267, v268, v269, v270, v271);
  if (v272 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v266))
  {
    v278 = objc_msgSend_intervalId((void *)v2, v273, v274, v275, v276, v277);
    *(_DWORD *)buf = v281;
    v298 = v278;
    _os_signpost_emit_with_name_impl(&dword_227C0D000, v266, OS_SIGNPOST_INTERVAL_END, v272, "Attribution Request", "id=%{public, name=id}lld", buf, 0xCu);
  }

LABEL_69:
  v2 = 0;
LABEL_70:

LABEL_71:
  _Block_object_dispose(&v290, 8);

  objc_destroyWeak(&location);
  return (id)v2;
}

void sub_227C0F660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location, id *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  objc_destroyWeak((id *)(v32 - 152));
  _Unwind_Resume(a1);
}

uint64_t sub_227C0F73C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_227C0F74C(uint64_t a1)
{

}

intptr_t sub_227C0F754(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v9[16];

  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_227C0D000, v2, OS_LOG_TYPE_INFO, "AAAttribution XPC connection interrupted. Lost connection.", v9, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_setConnectionInterrupted_(WeakRetained, v4, 1, v5, v6, v7);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_227C0F7E0(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  id v5;

  v5 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    os_unfair_lock_unlock(WeakRetained + 3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id sub_227C0FA28(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t BucketForDaemonRunningTime;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v71[3];
  _QWORD v72[4];

  v72[3] = *MEMORY[0x24BDAC8D0];
  v7 = *(void **)(a1 + 32);
  objc_msgSend_requestTime(*(void **)(a1 + 40), a2, a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v7, v9, (uint64_t)v8, v10, v11, v12);
  v14 = v13;

  BucketForDaemonRunningTime = objc_msgSend__findBucketForDaemonRunningTime_(AAAttributionRequester, v15, v16, v17, v18, v19, *(double *)(a1 + 56));
  v71[0] = CFSTR("tokenClientVendingTime");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v21, (uint64_t)(v14 * 1000.0), v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v25;
  v71[1] = CFSTR("tokenStatus");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v26, *(_QWORD *)(a1 + 64), v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v30;
  v71[2] = CFSTR("daemonRunningTime");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v31, BucketForDaemonRunningTime, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v35;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v36, (uint64_t)v72, (uint64_t)v71, 3, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 48))
  {
    v44 = (void *)objc_msgSend_mutableCopy(v38, v39, v40, v41, v42, v43);
    objc_msgSend_componentsSeparatedByString_(*(void **)(a1 + 48), v45, (uint64_t)CFSTR("-"), v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v49, v50, v51, v52, v53, v54))
    {
      objc_msgSend_firstObject(v49, v55, v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v44, v61, (uint64_t)v60, (uint64_t)CFSTR("storeFront"), v62, v63);

    }
    else
    {
      objc_msgSend_setObject_forKey_(v44, v55, *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("storeFront"), v58, v59);
    }
    v69 = objc_msgSend_copy(v44, v64, v65, v66, v67, v68);

    v38 = (void *)v69;
  }
  return v38;
}

uint64_t sub_227C0FD60(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    return objc_msgSend_invalidate(*(void **)(v6 + 16), a2, a3, a4, a5, a6);
  else
    return objc_msgSend_invalidate(0, a2, a3, a4, a5, a6);
}

void sub_227C1018C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_227C0D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Simulating crash with description: \"Unexpected token source AATokenSourceNone\"", v0, 2u);
}

uint64_t APLogForCategory()
{
  return MEMORY[0x24BDFD458]();
}

uint64_t APPerfLogForCategory()
{
  return MEMORY[0x24BDFD460]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

