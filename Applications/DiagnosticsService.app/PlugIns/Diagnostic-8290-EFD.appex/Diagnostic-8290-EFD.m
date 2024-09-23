id *sub_1000037A0(id *result, void *a2)
{
  id *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  int v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  const __CFString *v29;

  if (a2)
  {
    v2 = result;
    objc_msgSend(a2, "acceleration");
    v4 = v3;
    v6 = fabs(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[4], "xThreshold"));
    objc_msgSend(v7, "doubleValue");
    if (v6 > fabs(v8))
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[4], "zThreshold"));
      objc_msgSend(v9, "doubleValue");
      v11 = fabs(v10);

      if (fabs(v4) <= v11)
        return (id *)objc_msgSend(v2[4], "stop");
    }
    v12 = DiagnosticLogHandleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[4], "xThreshold"));
      objc_msgSend(v15, "doubleValue");
      v17 = fabs(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[4], "zThreshold"));
      objc_msgSend(v18, "doubleValue");
      v20 = 134219010;
      v21 = v6;
      v22 = 2048;
      v23 = fabs(v4);
      v24 = 2048;
      v25 = v17;
      v26 = 2048;
      v27 = fabs(v19);
      v28 = 2112;
      v29 = CFSTR("IncorrectOrientationNotification");
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Gyroscope values { x: %f z: %f } are out of the thresholds allowed { x: %f z: %f }. Posting %@", (uint8_t *)&v20, 0x34u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("IncorrectOrientationNotification"), 0);

    return (id *)objc_msgSend(v2[4], "stop");
  }
  return result;
}

void sub_100003E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Block_object_dispose((const void *)(v29 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100003EE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "acceleration");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v7 > *(double *)(v10 + 24))
      *(double *)(v10 + 24) = v7;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v7 < *(double *)(v11 + 24))
      *(double *)(v11 + 24) = v7;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8 > *(double *)(v12 + 24))
      *(double *)(v12 + 24) = v8;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v8 < *(double *)(v13 + 24))
      *(double *)(v13 + 24) = v8;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (v9 > *(double *)(v14 + 24))
      *(double *)(v14 + 24) = v9;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v16 = *(double *)(v15 + 24);
    if (v9 < v16)
    {
      *(double *)(v15 + 24) = v9;
      v16 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
    v17 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v22 = vabdd_f64(v17, v18);
    v23 = vabdd_f64(v19, v20);
    v24 = vabdd_f64(v21, v16);
    if (v23 < v24)
      v23 = v24;
    if (v22 >= v23)
      v25 = v22;
    else
      v25 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "threshold"));
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    if (v25 > v28)
    {
      v29 = DiagnosticLogHandleForCategory(3);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "threshold"));
        objc_msgSend(v34, "doubleValue");
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17 - v18));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 - v20));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21 - v16));
        v39 = 138413058;
        v40 = v35;
        v41 = 2112;
        v42 = v36;
        v43 = 2112;
        v44 = v37;
        v45 = 2112;
        v46 = v38;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Motion detection threshold value %@ exceeded. X: %@ Y: %@ Z: %@", (uint8_t *)&v39, 0x2Au);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v31, "postNotificationName:object:", CFSTR("MotionDetectedNotification"), 0);

    }
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (*(_BYTE *)(v32 + 24))
    {
      *(_BYTE *)(v32 + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0x10000000000000;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0x10000000000000;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x10000000000000;
    }
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "motionManager"));
    objc_msgSend(v33, "stopAccelerometerUpdates");

  }
}

void sub_100004B20(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t dsema;
  uint8_t buf[4];
  unsigned int v11;

  dsema = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "chamberReadySemaphore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v3 = dispatch_time(0, 1000000000 * objc_msgSend(v2, "detectChamberReadyWaitTime"));
  if (dispatch_semaphore_wait(dsema, v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "started");

    if (v4)
    {
      v5 = DiagnosticLogHandleForCategory(3);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
        *(_DWORD *)buf = 67109120;
        v11 = objc_msgSend(v7, "detectChamberReadyWaitTime");
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Chamber is not ready within timeout specified: %u", buf, 8u);

      }
      objc_msgSend(*(id *)(a1 + 32), "stop");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      objc_msgSend(v8, "handleChamberStatus:", 2);

    }
  }
  else
  {

  }
}

void sub_100005108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id archiveFiles(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DSMutableArchive archive](DSMutableArchive, "archive"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v5;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v41;
    while (2)
    {
      v13 = 0;
      v14 = v7;
      do
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v13);
        v39 = v14;
        v16 = objc_msgSend(v8, "addURL:error:", v15, &v39);
        v7 = v39;

        if ((v16 & 1) == 0)
        {
          v29 = DiagnosticLogHandleForCategory(0);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_10001059C((uint64_t)v7, v30, v31, v32, v33, v34, v35, v36);

          v22 = v9;
          goto LABEL_15;
        }
        v13 = (char *)v13 + 1;
        v14 = v7;
      }
      while (v11 != v13);
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = v7;

  v18 = DKTemporaryDirectoryURL();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v38 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "archiveAsTempFileWithTemplate:directory:suffix:error:", v6, v19, CFSTR(".tar.gz"), &v38));
  v7 = v38;

  if (!v20)
  {
    v21 = DiagnosticLogHandleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100010534((uint64_t)v7, v22, v23, v24, v25, v26, v27, v28);
LABEL_15:

    v20 = 0;
  }

  return v20;
}

void sub_100005C00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

FFTSetup AAT_initWithLength(FFTSetup result)
{
  vDSP_Length v1;
  unsigned int v2;

  if (!qword_100024380)
  {
    if (result < 2)
    {
      v1 = 0;
    }
    else
    {
      v1 = 0;
      v2 = 1;
      do
      {
        v2 *= 2;
        ++v1;
      }
      while (v2 < result);
    }
    result = vDSP_create_fftsetup(v1, 0);
    qword_100024380 = (uint64_t)result;
  }
  return result;
}

void AAT_cleanUp()
{
  vDSP_destroy_fftsetup((FFTSetup)qword_100024380);
  qword_100024380 = 0;
}

void AAT_processFrequencyResponseGxx(const float *a1, unsigned int a2, float *a3, unsigned int a4, uint64_t a5, unsigned int a6, unsigned int a7, _QWORD *a8)
{
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const float *v52;
  vDSP_Length v53;
  unsigned int v54;
  size_t v55;
  float *v56;
  float *v57;
  int v58;
  unsigned int v59;
  uint64_t v60;
  unsigned int v61;
  float v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  float v73;
  float v74;
  uint64_t v75;
  uint64_t v76;
  float *v77;
  double v78;
  double v79;
  unsigned int v80;
  _BOOL8 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  float v90;
  char *v91;
  float *v92;
  unint64_t v93;
  float *v94;
  float *v95;
  uint64_t v96;
  float v97;
  int64x2_t v98;
  uint64x2_t v99;
  int64x2_t v100;
  int32x2_t v101;
  _BOOL8 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  float v111;
  uint64_t v112;
  float v113;
  uint64_t v114;
  float *v115;
  float v116;
  unsigned int v117;
  float v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  float *v122;
  uint64_t v123;
  float *v124;
  float v125;
  unint64_t v126;
  _BOOL8 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _BOOL8 v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  float v145;
  DSPComplex *v146;
  DSPComplex *v147;
  uint64_t v148;
  _QWORD *v149;
  float *__X;
  float *v154;
  char *v155;
  uint8_t buf[4];
  int v157;
  __int16 v158;
  double v159;
  __int16 v160;
  double v161;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100010850();
  v149 = a8;
  v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v13)
    sub_10001081C(v13, v14, v15, v16, v17, v18, v19, v20);
  v21 = a6 >> 1;
  if (a6 >= 2)
  {
    v75 = 0;
    if (v21 <= 1)
      v76 = 1;
    else
      v76 = v21;
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v77 = (float *)(a5 + 8 * v75++);
        v78 = *v77;
        v79 = v77[1];
        *(_DWORD *)buf = 67109632;
        v157 = v75;
        v158 = 2048;
        v159 = v78;
        v160 = 2048;
        v161 = v79;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "  bin%d: %.0f - %.0f\n", buf, 0x1Cu);
      }
      else
      {
        ++v75;
      }
    }
    while (v75 != v76);
  }
  v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v22)
    sub_100010604(v22, v23, v24, v25, v26, v27, v28, v29);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_1000107B4();
  v30 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v31 = a3[v30++];
      *(_DWORD *)buf = 67109376;
      v157 = v30;
      v158 = 2048;
      v159 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v30;
    }
  }
  while (v30 != 5);
  v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v32)
    sub_100010604(v32, v33, v34, v35, v36, v37, v38, v39);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001074C();
  v40 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v41 = a1[v40++];
      *(_DWORD *)buf = 67109376;
      v157 = v40;
      v158 = 2048;
      v159 = v41;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v40;
    }
  }
  while (v40 != 5);
  v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v42)
    sub_100010604(v42, v43, v44, v45, v46, v47, v48, v49);
  v148 = a6 >> 1;
  __X = a3;
  v50 = 1;
  do
  {
    v51 = v50;
    v50 = (2 * v50);
  }
  while (v51 < a2);
  v146 = (DSPComplex *)malloc_type_calloc(v51, 4uLL, 0x100004052888210uLL);
  cblas_scopy(a2, a1, 1, (float *)v146, 1);
  v147 = (DSPComplex *)malloc_type_calloc(v51, 4uLL, 0x100004052888210uLL);
  v52 = a1;
  v53 = a2 + a4 - 1;
  if (a4 <= a2)
    v54 = a2 - a4;
  else
    v54 = a4 - a2;
  v55 = v54 + v53;
  v56 = (float *)malloc_type_calloc(v55, 4uLL, 0x100004052888210uLL);
  v57 = (float *)malloc_type_calloc(v53 + a2, 4uLL, 0x100004052888210uLL);
  cblas_scopy(a4, __X, 1, &v57[a2 - 1], 1);
  vDSP_conv(v57, 1, v52, 1, &v56[v54], 1, v53, a2);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_1000106D4();
  if (v53 >= 0xF)
    v58 = 15;
  else
    v58 = a2 + a4 - 1;
  v59 = v55 - v58;
  if (v59 < v55)
  {
    v60 = (int)v59;
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v62 = v56[v60++];
        *(_DWORD *)buf = 67109376;
        v157 = v60;
        v158 = 2048;
        v159 = v62;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d:  %.21g\n", buf, 0x12u);
        v61 = v60;
      }
      else
      {
        v61 = ++v60;
      }
    }
    while (v61 < v55);
  }
  v63 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v63)
    sub_100010604(v63, v64, v65, v66, v67, v68, v69, v70);
  free(v57);
  if ((_DWORD)v55)
  {
    v71 = 0;
    v72 = 0;
    v73 = 0.0;
    do
    {
      v74 = fabsf(v56[v71]);
      if (v74 > v73)
      {
        v72 = v71;
        v73 = v74;
      }
      ++v71;
    }
    while (v55 != v71);
  }
  else
  {
    v72 = 0;
  }
  v80 = (v72 - a4 + 1) & ~((int)(v72 - a4 + 1) >> 31);
  if (v80 + a2 > a4)
    v80 = 0;
  cblas_scopy(a2, &__X[v80], 1, (float *)v147, 1);
  free(v56);
  v81 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v81)
    sub_1000106A0(v81, v82, v83, v84, v85, v86, v87, v88);
  v89 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v90 = *(&v147->real + v89++);
      *(_DWORD *)buf = 67109376;
      v157 = v89;
      v158 = 2048;
      v159 = v90;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v89;
    }
  }
  while (v89 != 5);
  v91 = (char *)malloc_type_calloc((v51 >> 1) + 1, 4uLL, 0x100004052888210uLL);
  v155 = v91;
  sub_100006E3C(v146, v51, a7, &v155);
  free(v146);
  v92 = (float *)malloc_type_calloc((v51 >> 1) + 1, 4uLL, 0x100004052888210uLL);
  v154 = v92;
  sub_100006E3C(v147, v51, a7, &v154);
  v93 = 0;
  do
  {
    v92[v93 / 4] = log10f(v92[v93 / 4] / *(float *)&v91[v93]) * 10.0;
    v93 += 4;
  }
  while (((2 * v51) & 0x1FFFFFFFCLL) + 4 != v93);
  free(v147);
  free(v91);
  v94 = (float *)malloc_type_calloc(v51, 4uLL, 0x100004052888210uLL);
  v95 = v94;
  if ((_DWORD)v51)
  {
    v96 = 0;
    v97 = (float)a7 / (float)v51;
    v98 = (int64x2_t)xmmword_100015910;
    v99 = (uint64x2_t)vdupq_n_s64((unint64_t)v51 - 1);
    v100 = vdupq_n_s64(2uLL);
    do
    {
      v101 = vmovn_s64((int64x2_t)vcgeq_u64(v99, (uint64x2_t)v98));
      if ((v101.i8[0] & 1) != 0)
        v94[v96] = v97 * (float)(int)v96;
      if ((v101.i8[4] & 1) != 0)
        v94[v96 + 1] = v97 * (float)(v96 + 1);
      v96 += 2;
      v98 = vaddq_s64(v98, v100);
    }
    while (((v51 + 1) & 0x1FFFFFFFELL) != v96);
  }
  v102 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v102)
    sub_10001066C(v102, v103, v104, v105, v106, v107, v108, v109);
  v110 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v111 = v92[v110++];
      *(_DWORD *)buf = 67109376;
      v157 = v110;
      v158 = 2048;
      v159 = v111;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v110;
    }
  }
  while (v110 != 5);
  if (a6 > 1)
  {
    v112 = 0;
    v113 = v95[1] - *v95;
    do
    {
      v114 = 0;
      v115 = (float *)(a5 + 8 * v112);
      v116 = v115[1];
      while (v95[v114] <= *v115)
      {
        if ((v51 >> 1) + 1 == ++v114)
        {
          v117 = 0;
          goto LABEL_96;
        }
      }
      v118 = 0.0;
      if (v51 >> 1 < v114)
        goto LABEL_103;
      v117 = v114;
LABEL_96:
      v119 = v117;
      v120 = v117 - 1;
      v121 = v117;
      v122 = &v95[v121];
      while (*v122 <= v116)
      {
        ++v120;
        ++v122;
        if ((unint64_t)v51 >> 1 == v120)
        {
          LODWORD(v120) = 0;
          break;
        }
      }
      v118 = 0.0;
      if (v119 <= v120)
      {
        v123 = (v120 + 1) - v119;
        v124 = &v92[v121];
        do
        {
          v125 = *v124++;
          v118 = v118 + (float)(__exp10f(v125 / 10.0) * v113);
          --v123;
        }
        while (v123);
      }
LABEL_103:
      *(float *)(*v149 + 4 * v112++) = log10f(v118) * 10.0;
    }
    while (v112 != v148);
  }
  v126 = 0;
  do
  {
    __exp10f(v92[v126 / 4] / 10.0);
    v126 += 4;
  }
  while (((2 * v51) & 0x1FFFFFFFCLL) + 4 != v126);
  v127 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v127)
    sub_100010638(v127, v128, v129, v130, v131, v132, v133, v134);
  if (a6 >= 2)
  {
    v143 = 0;
    if (v148 <= 1)
      v144 = 1;
    else
      v144 = v148;
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v145 = *(float *)(*v149 + 4 * v143++);
        *(_DWORD *)buf = 67109376;
        v157 = v143;
        v158 = 2048;
        v159 = v145;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21f\n", buf, 0x12u);
      }
      else
      {
        ++v143;
      }
    }
    while (v143 != v144);
  }
  v135 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v135)
    sub_100010604(v135, v136, v137, v138, v139, v140, v141, v142);
  free(v92);
  free(v95);
}

void sub_100006E3C(const DSPComplex *a1, uint64_t a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v6;
  float *v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  float *imagp;
  float *realp;
  float *v14;
  float *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float *v19;
  _DWORD *v20;
  int v21;
  float v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  double v32;
  double v33;
  unint64_t v34;
  float *v35;
  float *v36;
  float v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  DSPSplitComplex __Z;
  uint8_t buf[4];
  int v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;

  v6 = a2 >> 1;
  v7 = (float *)malloc_type_calloc((v6 + 1), 4uLL, 0x100004052888210uLL);
  if (a2 < 2)
  {
    v8 = 0;
    v9 = 1;
  }
  else
  {
    v8 = 0;
    v9 = 1;
    do
    {
      v9 *= 2;
      ++v8;
    }
    while (v9 < a2);
  }
  if (v9 >= 0)
    v10 = v9;
  else
    v10 = v9 + 1;
  v11 = (v10 >> 1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100010954();
  __Z.realp = (float *)malloc_type_calloc(v9, 4uLL, 0x100004052888210uLL);
  __Z.imagp = (float *)malloc_type_calloc(v9, 4uLL, 0x100004052888210uLL);
  vDSP_ctoz(a1, 2, &__Z, 1, (int)v11);
  vDSP_fft_zrip((FFTSetup)qword_100024380, &__Z, 1, v8, 1);
  realp = __Z.realp;
  imagp = __Z.imagp;
  if (v9 >= 2)
  {
    v14 = __Z.realp;
    v15 = __Z.imagp;
    v16 = v11;
    do
    {
      *v14 = *v14 * 0.5;
      ++v14;
      *v15 = *v15 * 0.5;
      ++v15;
      --v16;
    }
    while (v16);
  }
  realp[(int)v11] = *imagp;
  *imagp = 0.0;
  if ((int)v11 + 1 < v9)
  {
    v17 = ~(uint64_t)(int)v11 + v9;
    v18 = 4 * (int)v11 + 4;
    v19 = (float *)((char *)imagp + v18);
    v20 = (_DWORD *)((char *)realp + v18);
    v21 = v11 - 1;
    do
    {
      *v20++ = LODWORD(realp[v21]);
      *v19++ = -imagp[v21--];
      --v17;
    }
    while (v17);
  }
  v22 = 1.0 / (float)a3;
  v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v23)
    sub_100010920(v23, v24, v25, v26, v27, v28, v29, v30);
  for (i = 0; i != 5; ++i)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v32 = __Z.realp[i];
      v33 = __Z.imagp[i];
      *(_DWORD *)buf = 67109632;
      v63 = i + 1;
      v64 = 2048;
      v65 = v32;
      v66 = 2048;
      v67 = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %8g  +  %8gi\n", buf, 0x1Cu);
    }
  }
  v34 = 0;
  v36 = __Z.realp;
  v35 = __Z.imagp;
  do
  {
    v37 = (float)((float)(v22 * v36[v34 / 4]) * (float)(v22 * v36[v34 / 4]))
        + (float)((float)(v22 * v35[v34 / 4]) * (float)(v22 * v35[v34 / 4]));
    v7[v34 / 4] = (float)(v37 + v37) / (float)(v22 * (float)a2);
    v34 += 4;
  }
  while (((2 * a2) & 0x1FFFFFFFCLL) + 4 != v34);
  free(v35);
  free(__Z.realp);
  *v7 = *v7 * 0.5;
  if ((a2 & 1) == 0)
    v7[v6] = v7[v6] * 0.5;
  v38 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v38)
    sub_1000108EC(v38, v39, v40, v41, v42, v43, v44, v45);
  v46 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v47 = v7[v46++];
      *(_DWORD *)buf = 67109376;
      v63 = v46;
      v64 = 2048;
      v65 = v47;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v46;
    }
  }
  while (v46 != 5);
  v48 = 0;
  do
  {
    if (!v48 || v48 == v6)
    {
      *(float *)(*a4 + 4 * v48) = v7[v48];
      ++v48;
    }
    else if (v48 == 1 || v48 == (_DWORD)v6 - 1)
    {
      *(float *)(*a4 + 4 * v48) = (float)((float)(v7[(v48 - 1)] + v7[v48]) + v7[v48 + 1]) / 3.0;
      ++v48;
    }
    else
    {
      *(float *)(*a4 + 4 * v48) = (float)((float)((float)((float)(v7[(v48 - 2)]
                                                                + v7[(v48 - 1)])
                                                        + v7[v48])
                                                + v7[v48 + 1])
                                        + v7[v48 + 2])
                                / 5.0;
      ++v48;
    }
  }
  while (v48 != (_DWORD)v6 + 1);
  v49 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v49)
    sub_1000108B8(v49, v50, v51, v52, v53, v54, v55, v56);
  v57 = 0;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v58 = *(float *)(*a4 + 4 * v57++);
      *(_DWORD *)buf = 67109376;
      v63 = v57;
      v64 = 2048;
      v65 = v58;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: %.21g\n", buf, 0x12u);
    }
    else
    {
      ++v57;
    }
  }
  while (v57 != 5);
  free(v7);
}

void AAT_processCrackledData(const float *a1, int a2, int a3, int a4, int a5, const vDSP_biquad_SetupStruct **a6, float *a7, float *a8, float *a9, _DWORD *a10)
{
  int v11;
  int v12;
  vDSP_Length v18;
  float *v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  float *v27;
  float v28;
  float v29;
  int v30;
  float v31;
  double v32;
  double v33;
  uint64_t v34;
  float v35;
  _DWORD *v36;
  float *v37;
  double v38;
  int v39;
  int v40;
  uint64_t v41;
  float *v42;
  uint64_t v43;
  float v44;
  uint64_t v46;
  float *v47;
  _DWORD *v48;

  if (a3 <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000109D4();
  }
  else if (a4 <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100010A3C();
  }
  else if (a5 <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100010AA4();
  }
  else
  {
    v11 = (int)(float)(2 * a3 / a4);
    v12 = v11 - 1;
    if (v11 >= 1)
    {
      v47 = a9;
      v48 = a10;
      v18 = a2;
      v19 = (float *)malloc_type_malloc(4 * a2, 0x100004052888210uLL);
      vDSP_biquad(*a6, a7, a1, 1, v19, 1, v18);
      v20 = (v11 + 1);
      __chkstk_darwin();
      v22 = (int *)((char *)&v46 - v21);
      v23 = 0;
      v24 = 0;
      do
      {
        v25 = 0.0;
        if (a2 - v11 >= 1)
        {
          v26 = (a2 - v11);
          v27 = v19;
          do
          {
            v28 = v27[v23];
            v29 = *v27++;
            v25 = v25 + (float)(v29 * v28);
            --v26;
          }
          while (v26);
        }
        *(float *)&v30 = v25;
        v22[v24++] = v30;
        ++v23;
      }
      while (v24 != v20);
      free(v19);
      v31 = *(float *)&v22[v11];
      if (v31 <= *(float *)&v22[v12])
        v31 = *(float *)&v22[v12];
      v32 = (float)((float)((float)v11 + 1.0) * 0.5);
      v33 = floor(v32) - (double)a5;
      if (v33 <= (double)(a5 - 1))
      {
        LODWORD(v34) = 0;
        v35 = 0.0;
        v37 = v47;
        v36 = v48;
      }
      else
      {
        v34 = 0;
        v35 = 0.0;
        v37 = v47;
        v36 = v48;
        do
        {
          v35 = v35 + fabsf(*(float *)&v22[a5 - 1 + v34]);
          v38 = (double)(a5 + (int)v34++);
        }
        while (v33 > v38);
      }
      v39 = *v22;
      v40 = (int)(ceil(v32) + (double)a5 + -1.0);
      if ((int)v20 - a5 > v40)
      {
        v41 = v40;
        v42 = (float *)&v22[v40];
        v43 = v41 + a5 - (int)v20;
        do
        {
          v44 = *v42++;
          v35 = v35 + fabsf(v44);
          LODWORD(v34) = v34 + 1;
        }
        while (!__CFADD__(v43++, 1));
      }
      *a8 = v31;
      *v37 = v31 / (float)(v35 / (float)(int)v34);
      *v36 = v39;
    }
  }
}

void sub_1000076A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000076BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000076CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_100007AE0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  intptr_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testCompletionSemaphore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sequenceTimeout"));
  v5 = objc_msgSend(v4, "unsignedLongValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sequences"));
  v8 = dispatch_time(0, 1000000000 * (_QWORD)v5 * (_QWORD)objc_msgSend(v7, "count"));
  v9 = dispatch_semaphore_wait(v2, v8);

  if (v9)
  {
    v10 = DiagnosticLogHandleForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Audio test has timed out while waiting for completion.", v12, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "endTesting:immediately:", 4294966292, 0);
  }
}

id sub_1000080F8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testEndedSemaphore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "airpodsInputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chamberInputs"));
  v5 = dispatch_time(0, 1000000000 * objc_msgSend(v4, "testCompleteAlertTime"));
  dispatch_semaphore_wait(v2, v5);

  objc_msgSend(*(id *)(a1 + 32), "stopAlerts");
  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

void sub_100009D28(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char *v18;
  __int128 v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  intptr_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  _BOOL4 v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  char *v57;
  uint64_t v58;
  void *j;
  void *v60;
  void *v61;
  char *v62;
  void *v63;
  __int128 v64;
  void *v65;
  NSObject *dsema;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  void *v80;
  const __CFString *v81;
  void *v82;
  NSErrorUserInfoKey v83;
  const __CFString *v84;
  uint8_t buf[4];
  uint64_t v86;
  _BYTE v87[128];
  NSErrorUserInfoKey v88;
  const __CFString *v89;
  _BYTE v90[128];

  v2 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(*(id *)(a1 + 32), "setAudioSystemResults:", v2);

  dsema = dispatch_semaphore_create(0);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sequences"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
  if (v5)
  {
    v6 = v5;
    v65 = 0;
    v7 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v76 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(*(id *)(a1 + 32), "testFailed"))
        {
          dispatch_semaphore_signal(dsema);
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outputs"));
          v11 = objc_msgSend(v10, "count");

          if (v11 == (id)1)
          {
            objc_msgSend(*(id *)(a1 + 32), "testSequence:completionSemaphore:", v9, dsema);
          }
          else
          {
            v88 = NSLocalizedDescriptionKey;
            v89 = CFSTR("Sequence has more than 1 output.");
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1));
            v13 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -64, v12));

            objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v13);
            dispatch_semaphore_signal(dsema);
            v65 = (void *)v13;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
    }
    while (v6);
  }
  else
  {
    v65 = 0;
  }

  v14 = DiagnosticLogHandleForCategory(3);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Waiting for sequences to complete...", buf, 2u);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sequences"));

  v18 = (char *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
  if (!v18)
  {
LABEL_28:

    v29 = DiagnosticLogHandleForCategory(3);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "All sequences complete", buf, 2u);
    }

    v31 = v65;
    if ((objc_msgSend(*(id *)(a1 + 32), "testFailed") & 1) != 0
      || !objc_msgSend(*(id *)(a1 + 32), "internalInstall")
      || (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs")),
          v33 = objc_msgSend(v32, "saveRawRecording"),
          v32,
          !v33))
    {
      v44 = 0;
      goto LABEL_40;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rawRecordings"));
    v35 = archiveFiles(v34, CFSTR("com.apple.Diagnostics.8079.XXXXXXXX"), v65);
    v36 = objc_claimAutoreleasedReturnValue(v35);

    v37 = DiagnosticLogHandleForCategory(3);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    if (v65)
    {
      if (v39)
      {
        *(_DWORD *)buf = 138412290;
        v86 = (uint64_t)v65;
        v40 = "ERROR archiving recording data: %@";
LABEL_56:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
      }
    }
    else if (v39)
    {
      *(_DWORD *)buf = 138412290;
      v86 = v36;
      v40 = "Successfully archived raw audio to [%@]";
      goto LABEL_56;
    }
    v44 = (void *)v36;

LABEL_40:
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 32), "testFailed") & 1) == 0)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
      objc_msgSend(v45, "setStatusCode:", &off_10001D4F0);

      v81 = CFSTR("dbResults");
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioSystemResults"));
      v82 = v46;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
      objc_msgSend(v48, "setData:", v47);

      if (objc_msgSend(*(id *)(a1 + 32), "internalInstall"))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
        v50 = objc_msgSend(v49, "saveRawRecording");

        if (v50)
        {
          if (v44)
          {
            v80 = v44;
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
            objc_msgSend(v52, "setFiles:", v51);

          }
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "sequences"));

          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
          if (v55)
          {
            v56 = v55;
            v57 = 0;
            v58 = *(_QWORD *)v68;
            do
            {
              for (j = 0; j != v56; j = (char *)j + 1)
              {
                if (*(_QWORD *)v68 != v58)
                  objc_enumerationMutation(v54);
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1)
                                                                                   + 8 * (_QWORD)j), "completedResultCount"));
                v57 += (int)objc_msgSend(v60, "intValue");

              }
              v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
            }
            while (v56);
          }
          else
          {
            v57 = 0;
          }

          v31 = v65;
          if (!v44
            || (v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rawRecordings")),
                v62 = (char *)objc_msgSend(v61, "count"),
                v61,
                v62 != v57))
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
            objc_msgSend(v63, "setStatusCode:", &off_10001D508);

          }
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "testFinishedSuccessfully");
    v17 = v44;
    goto LABEL_63;
  }
  v20 = v18;
  v21 = *(_QWORD *)v72;
  *(_QWORD *)&v19 = 136315138;
  v64 = v19;
  while (1)
  {
    if (*(_QWORD *)v72 != v21)
      objc_enumerationMutation(v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs", v64));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sequenceTimeout"));
    v24 = dispatch_time(0, 1000000000 * (_QWORD)objc_msgSend(v23, "unsignedLongValue"));
    v25 = dispatch_semaphore_wait(dsema, v24);

    v26 = DiagnosticLogHandleForCategory(3);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = "timed out";
      if (!v25)
        v28 = "finished";
      *(_DWORD *)buf = v64;
      v86 = (uint64_t)v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sequence has %s while waiting for completion.", buf, 0xCu);
    }

    if (v25)
      break;
    if (!--v20)
    {
      v20 = (char *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
      if (!v20)
        goto LABEL_28;
    }
  }
  v41 = DiagnosticLogHandleForCategory(3);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Timed out while waiting on sequence completion semaphore. Ending test.", buf, 2u);
  }

  v83 = NSLocalizedDescriptionKey;
  v84 = CFSTR("Timed out waiting for sequences to finish running.");
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -71, v43));

  objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v31);
  objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
LABEL_63:

}

void sub_10000A800(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = DiagnosticLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "This is the first time failedToExecuteWithError was called. Using this error for the failing status code", v8, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v4, "setData:", &__NSDictionary0__struct);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
  objc_msgSend(v6, "setStatusCode:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setTestFailed:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioTest"));
  objc_msgSend(v7, "cancel");

}

void sub_10000B4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B508(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000B518(uint64_t a1)
{

}

void sub_10000B520(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10000B9A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  NSErrorUserInfoKey v33;
  void *v34;
  NSErrorUserInfoKey v35;
  void *v36;
  uint8_t buf[4];
  uint64_t v38;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "testFailed"))
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v38 = v9;
      v10 = "Test appears to have already failed. Not proceeding with completion block for sequence {%@}";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      v11 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(*(id *)(a1 + 32), "parseTestResults:fromOutput:withFile:parsedResults:error:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v11, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioSystemResults"));
      objc_msgSend(v12, "addObject:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
      objc_msgSend(*(id *)(a1 + 72), "setCompletedResultCount:", v13);

      goto LABEL_7;
    }
LABEL_27:
    v24 = DiagnosticLogHandleForCategory(3);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100010CD0(a1, v25, v26);

    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("Sequence completed with no results");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -72, v27));

    objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v28);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

    goto LABEL_11;
  }
  v16 = DiagnosticLogHandleForCategory(3);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_100010DA0();

  if (v6)
  {
    if (objc_msgSend(v6, "code") == (id)-2 || objc_msgSend(v6, "code") == (id)-3)
    {
      v35 = NSLocalizedDescriptionKey;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      v36 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v20 = -56;
    }
    else
    {
      v33 = NSLocalizedDescriptionKey;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      v34 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
      v20 = -67;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), v20, v19));

  }
  else
  {
    v31 = NSLocalizedDescriptionKey;
    v32 = CFSTR("Sequence completed with nil result");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -72, v18));
  }

  if (!v21)
  {
    if (objc_msgSend(0, "count"))
    {
      objc_msgSend(*(id *)(a1 + 72), "setCompletedResultCount:", &off_10001D520);
LABEL_7:
      v14 = DiagnosticLogHandleForCategory(3);
      v8 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        v10 = "Completion finished for test sequence %@";
        goto LABEL_9;
      }
LABEL_10:

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      goto LABEL_11;
    }
    goto LABEL_27;
  }
  v22 = DiagnosticLogHandleForCategory(3);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_100010D3C();

  objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v21);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

LABEL_11:
}

void sub_10000D0E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id sub_10000D738(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scanAvailableNetworks");
}

uint64_t sensorEventTypeToString(unsigned int a1)
{
  if (a1 < 5)
    return (uint64_t)*(&off_10001C628 + (int)a1);
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Unexpected DAChamberSensorEventType."));
  return 0;
}

void ALSHIDEventCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;

  v8 = a1;
  v6 = objc_opt_class(DAALSSensor, v5);
  isKindOfClass = objc_opt_isKindOfClass(v8, v6);
  if (a4 && (isKindOfClass & 1) != 0)
    objc_msgSend(v8, "handleHIDEvent:", a4);

}

void sub_10000E1FC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "HIDSystemClient"))
  {
    CFRelease(objc_msgSend(*(id *)(a1 + 32), "HIDSystemClient"));
    objc_msgSend(*(id *)(a1 + 32), "setHIDSystemClient:", 0);
    v2 = DiagnosticLogHandleForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Release system client", buf, 2u);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 32), "HIDServiceClient"))
  {
    CFRelease(objc_msgSend(*(id *)(a1 + 32), "HIDServiceClient"));
    objc_msgSend(*(id *)(a1 + 32), "setHIDServiceClient:", 0);
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAALSSensor: Release service client", v6, 2u);
    }

  }
}

void sub_10000E820(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL sub_10000EFCC(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "length") && (unint64_t)objc_msgSend(v2, "length") < 0x101;

  return v3;
}

BOOL sub_10000F018(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "length") && (unint64_t)objc_msgSend(v2, "length") < 0x33;

  return v3;
}

void sub_10000F200(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000F21C(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24;
  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", v5, &off_10001D5E0, &off_10001D5F8, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "inputValueToName"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

void sub_10000F2B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  OutputSpecification *v9;
  _QWORD v10[4];
  OutputSpecification *v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  v6 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F394;
  v10[3] = &unk_10001C6E0;
  v11 = objc_alloc_init(OutputSpecification);
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  v9 = v11;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outputSpecifications"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

}

void sub_10000F394(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("mode"), &off_10001D5E0, &off_10001D610, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setMode:", v2);

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("channel"), &off_10001D5E0, &off_10001D610, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setChannel:", v3);

}

void sub_100010534(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C00((void *)&_mh_execute_header, a2, a3, "ERROR archiving logs: %@", a5, a6, a7, a8, 2u);
}

void sub_10001059C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C00((void *)&_mh_execute_header, a2, a3, "ERROR finding log(s): %@", a5, a6, a7, a8, 2u);
}

void sub_100010604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076A4((void *)&_mh_execute_header, &_os_log_default, a3, "\n", a5, a6, a7, a8, 0);
  sub_1000076B4();
}

void sub_100010638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076A4((void *)&_mh_execute_header, &_os_log_default, a3, "\nBin energy: \n", a5, a6, a7, a8, 0);
  sub_1000076B4();
}

void sub_10001066C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076A4((void *)&_mh_execute_header, &_os_log_default, a3, "\n binEnergy_dB input: \n", a5, a6, a7, a8, 0);
  sub_1000076B4();
}

void sub_1000106A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076A4((void *)&_mh_execute_header, &_os_log_default, a3, "\n Data_Align_Truncate() output: \n", a5, a6, a7, a8, 0);
  sub_1000076B4();
}

void sub_1000106D4()
{
  uint8_t v0[24];

  sub_1000076E8();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "xcorr output in the end:  input size = (%d, %d) \n", v0, 0xEu);
}

void sub_10001074C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000076DC();
  sub_1000076CC((void *)&_mh_execute_header, &_os_log_default, v0, "\nAAT_processFrequencyResponseGxx input stimulus (length=%d): \n", v1, v2, v3, v4, v5);
  sub_1000076B4();
}

void sub_1000107B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000076DC();
  sub_1000076CC((void *)&_mh_execute_header, &_os_log_default, v0, "\nAAT_processFrequencyResponseGxx input data (length=%d): \n", v1, v2, v3, v4, v5);
  sub_1000076B4();
}

void sub_10001081C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076A4((void *)&_mh_execute_header, &_os_log_default, a3, "\nEnergy Bins:\n", a5, a6, a7, a8, 0);
  sub_1000076B4();
}

void sub_100010850()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000076DC();
  sub_1000076CC((void *)&_mh_execute_header, &_os_log_default, v0, "\nfs = %d\n", v1, v2, v3, v4, v5);
  sub_1000076B4();
}

void sub_1000108B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076A4((void *)&_mh_execute_header, &_os_log_default, a3, "\n smooth() output: \n", a5, a6, a7, a8, 0);
  sub_1000076B4();
}

void sub_1000108EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076A4((void *)&_mh_execute_header, &_os_log_default, a3, "\n Gxx() output: \n", a5, a6, a7, a8, 0);
  sub_1000076B4();
}

void sub_100010920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076A4((void *)&_mh_execute_header, &_os_log_default, a3, "\n FFT output\n", a5, a6, a7, a8, 0);
  sub_1000076B4();
}

void sub_100010954()
{
  __int16 v0;
  int v1;
  uint8_t v2[14];
  __int16 v3;
  int v4;

  sub_1000076E8();
  v3 = v0;
  v4 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "\nAAT_fft: n = %d, log2n = %d, xLength = %d", v2, 0x14u);
}

void sub_1000109D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000076DC();
  sub_1000076BC((void *)&_mh_execute_header, &_os_log_default, v0, "AAT_processCrackledData unexpected value for crackleSamplingRate: %d", v1, v2, v3, v4, v5);
  sub_1000076B4();
}

void sub_100010A3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000076DC();
  sub_1000076BC((void *)&_mh_execute_header, &_os_log_default, v0, "AAT_processCrackledData unexpected value for crackleBaseFrequency: %d", v1, v2, v3, v4, v5);
  sub_1000076B4();
}

void sub_100010AA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000076DC();
  sub_1000076BC((void *)&_mh_execute_header, &_os_log_default, v0, "AAT_processCrackledData unexpected value for crackleNeighborDistance: %d", v1, v2, v3, v4, v5);
  sub_1000076B4();
}

void sub_100010B0C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C00((void *)&_mh_execute_header, a2, a3, "Failed to disable headphone exposure notifications: %@", a5, a6, a7, a8, 2u);
}

void sub_100010B74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C00((void *)&_mh_execute_header, a2, a3, "Failed to restore original headphone exposure notification setting: %@", a5, a6, a7, a8, 2u);
}

void sub_100010BDC(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Error clearing temporary files: %@", a1, 0xCu);

}

void sub_100010C50(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000D0F8();
  sub_10000D0E4((void *)&_mh_execute_header, a2, v4, "Error clearing temporary files: %@", v5);

  sub_10000D104();
}

void sub_100010CD0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  sub_10000D0E4((void *)&_mh_execute_header, a2, a3, "Sequence completed but results are empty! Sequence: {%@}", (uint8_t *)&v4);
  sub_10000D0F0();
}

void sub_100010D3C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000D0F8();
  sub_10000D0E4((void *)&_mh_execute_header, v0, v1, "AVF audio playback error resolved to: %@", v2);
  sub_10000D0F0();
}

void sub_100010DA0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000D0F8();
  sub_10000D0E4((void *)&_mh_execute_header, v0, v1, "ERROR during audio playback: %@", v2);
  sub_10000D0F0();
}

void sub_100010E04(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "outputDevice"));
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Sample rate mismatch between audio file %@ and speaker %@", (uint8_t *)&v6, 0x16u);

}

void sub_100010EB4(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "inputID");
  sub_10000D0F8();
  sub_10000D0E4((void *)&_mh_execute_header, a2, v3, "Input name missing for mic %ld", v4);
  sub_10000D104();
}

void sub_100010F28(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "performAnalysisOnResult called in base AudioSystemCommon controller!", v1, 2u);
}

void sub_100010F68(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "DAWifiSensor: Scan completed with error: %@", (uint8_t *)&v4, 0xCu);

}

void sub_100010FFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000E820((void *)&_mh_execute_header, a1, a3, "DAALSSensor: Failed to setup service client for ALS.", a5, a6, a7, a8, 0);
}

void sub_100011030(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000E820((void *)&_mh_execute_header, a1, a3, "DAALSSensor: HIDSystemClient and HIDServiceClient were already set up.", a5, a6, a7, a8, 0);
}

id objc_msgSend_ALSSamples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ALSSamples");
}

id objc_msgSend_HIDEventQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDEventQueue");
}

id objc_msgSend_HIDServiceClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDServiceClient");
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDSystemClient");
}

id objc_msgSend_RSSI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RSSI");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceleration");
}

id objc_msgSend_accessoryDetectorModelNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDetectorModelNumbers");
}

id objc_msgSend_accessoryDisconnectDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDisconnectDetector");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addURL:error:");
}

id objc_msgSend_airpodsInputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airpodsInputs");
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archive");
}

id objc_msgSend_archiveAsTempFileWithTemplate_directory_suffix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveAsTempFileWithTemplate:directory:suffix:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_audioDataAnalysisSettingsManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioDataAnalysisSettingsManager");
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioRouteChanged");
}

id objc_msgSend_audioSystemResultClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioSystemResultClass");
}

id objc_msgSend_audioSystemResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioSystemResults");
}

id objc_msgSend_audioTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioTest");
}

id objc_msgSend_audioTestType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioTestType");
}

id objc_msgSend_avAudioDeviceTestClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avAudioDeviceTestClass");
}

id objc_msgSend_avAudioDeviceTestSequenceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avAudioDeviceTestSequenceClass");
}

id objc_msgSend_averageSampleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averageSampleValue");
}

id objc_msgSend_balanceChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balanceChanged");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_calculateCrossCorrelationPeak(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateCrossCorrelationPeak");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_chamberDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chamberDetector");
}

id objc_msgSend_chamberInputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chamberInputs");
}

id objc_msgSend_chamberReadinessSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chamberReadinessSemaphore");
}

id objc_msgSend_chamberReadySemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chamberReadySemaphore");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channel");
}

id objc_msgSend_checkChamberIsReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkChamberIsReady");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_completedResultCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedResultCount");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedAccessories");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_convertNSDataToWAV_atURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertNSDataToWAV:atURL:error:");
}

id objc_msgSend_convertWAVtoNSDataWithFileStringURL_withSampleRate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertWAVtoNSDataWithFileStringURL:withSampleRate:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crackleBaseFrequency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crackleBaseFrequency");
}

id objc_msgSend_crackleFilterCoeffs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crackleFilterCoeffs");
}

id objc_msgSend_crackleNeighborDistance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crackleNeighborDistance");
}

id objc_msgSend_crackleNumberOfStages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crackleNumberOfStages");
}

id objc_msgSend_crackleSamplingRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crackleSamplingRate");
}

id objc_msgSend_createNewTestSequenceWithOutput_andStimulusFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewTestSequenceWithOutput:andStimulusFile:");
}

id objc_msgSend_cropAudioData_lengthFromFront_lengthFromEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cropAudioData:lengthFromFront:lengthFromEnd:");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRoute");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataCroppingLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataCroppingLength");
}

id objc_msgSend_dataFrontCroppingLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataFrontCroppingLength");
}

id objc_msgSend_dbValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dbValue");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteTemporaryFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteTemporaryFiles");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_detectChamberReadyALSThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectChamberReadyALSThreshold");
}

id objc_msgSend_detectChamberReadyWaitTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectChamberReadyWaitTime");
}

id objc_msgSend_detectChamberSensor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectChamberSensor");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceName");
}

id objc_msgSend_diagnosticResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticResponder");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryValue");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_arrayFromRequiredKey_types_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:types:maxLength:failed:");
}

id objc_msgSend_dk_arrayFromRequiredKey_types_maxLength_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_BOOLFromRequiredKey_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromRequiredKey:failed:");
}

id objc_msgSend_dk_dictionaryFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_dictionaryFromRequiredKey_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_dictionaryFromRequiredKey:failed:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_inSet_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:inSet:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadFilesWithResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadFilesWithResponder:");
}

id objc_msgSend_enableVolumeHUD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableVolumeHUD:");
}

id objc_msgSend_endTesting_immediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTesting:immediately:");
}

id objc_msgSend_energyValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "energyValues");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventQueue");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_expectations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectations");
}

id objc_msgSend_failedToExecuteWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedToExecuteWithError:");
}

id objc_msgSend_fileDownloadTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDownloadTimeout");
}

id objc_msgSend_fileNameToURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileNameToURL");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filterDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterDelay");
}

id objc_msgSend_filterSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterSetup");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatChannelData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatChannelData");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "format");
}

id objc_msgSend_frameLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameLength");
}

id objc_msgSend_freeFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeFilter");
}

id objc_msgSend_frequencyBins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frequencyBins");
}

id objc_msgSend_getAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAsset:completion:");
}

id objc_msgSend_getPreferenceFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPreferenceFor:");
}

id objc_msgSend_getVolume_forCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVolume:forCategory:");
}

id objc_msgSend_handleChamberStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleChamberStatus:");
}

id objc_msgSend_handleHIDEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleHIDEvent:");
}

id objc_msgSend_handleSensorEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSensorEvent:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_headphoneDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headphoneDetector");
}

id objc_msgSend_headphoneExposureNotificationsChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headphoneExposureNotificationsChanged");
}

id objc_msgSend_headphoneExposureNotificationsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headphoneExposureNotificationsEnabled");
}

id objc_msgSend_initFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFilter");
}

id objc_msgSend_initForReading_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReading:error:");
}

id objc_msgSend_initForWriting_settings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForWriting:settings:error:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCommonFormat_sampleRate_channels_interleaved_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCommonFormat:sampleRate:channels:interleaved:");
}

id objc_msgSend_initWithDelegate_scanInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:scanInterval:");
}

id objc_msgSend_initWithDelegate_threshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:threshold:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFloat:");
}

id objc_msgSend_initWithInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInputs:");
}

id objc_msgSend_initWithModelNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModelNumbers:");
}

id objc_msgSend_initWithPCMFormat_frameCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPCMFormat:frameCapacity:");
}

id objc_msgSend_initWithSensorType_eventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSensorType:eventType:");
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSet:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithThreshold:");
}

id objc_msgSend_initWithxThreshold_zThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithxThreshold:zThreshold:");
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "input");
}

id objc_msgSend_inputID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputID");
}

id objc_msgSend_inputNameToValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputNameToValue");
}

id objc_msgSend_inputValueToName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputValueToName");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interface");
}

id objc_msgSend_internalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalInstall");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAccelerometerActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccelerometerActive");
}

id objc_msgSend_isAccelerometerAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccelerometerAvailable");
}

id objc_msgSend_isAccessoryDetectorActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessoryDetectorActive");
}

id objc_msgSend_isBalanceChangeRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBalanceChangeRequired");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isDeviceConnectedToAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceConnectedToAccessory");
}

id objc_msgSend_isDeviceWatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceWatch");
}

id objc_msgSend_isDeviceiPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceiPad");
}

id objc_msgSend_isDeviceiPhone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceiPhone");
}

id objc_msgSend_isDeviceiPod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceiPod");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHeadphonesDetectorActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHeadphonesDetectorActive");
}

id objc_msgSend_isMonoChangeRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMonoChangeRequired");
}

id objc_msgSend_isMotionDetectorActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMotionDetectorActive");
}

id objc_msgSend_isOrientationDetectorActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOrientationDetectorActive");
}

id objc_msgSend_isOriginallyMono(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOriginallyMono");
}

id objc_msgSend_isOtherAudioPlaying(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOtherAudioPlaying");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isSoundRecognitionRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSoundRecognitionRequired");
}

id objc_msgSend_isUsingDBValuesFromSystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsingDBValuesFromSystem");
}

id objc_msgSend_isUsingMeasurementMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsingMeasurementMode");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_makeOutputFromDictionary_validationFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeOutputFromDictionary:validationFailed:");
}

id objc_msgSend_micBufferNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "micBufferNumbers");
}

id objc_msgSend_minimalALSSampleCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimalALSSampleCount");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_modelNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumbers");
}

id objc_msgSend_monoChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monoChanged");
}

id objc_msgSend_mostRecentEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mostRecentEvent");
}

id objc_msgSend_motionDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionDetector");
}

id objc_msgSend_motionDetectorThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionDetectorThreshold");
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionManager");
}

id objc_msgSend_mutableAudioBufferList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableAudioBufferList");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkName");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfChannels(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfChannels");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orientationDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientationDetector");
}

id objc_msgSend_orientationDetectorXThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientationDetectorXThreshold");
}

id objc_msgSend_orientationDetectorZThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientationDetectorZThreshold");
}

id objc_msgSend_originalBalance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalBalance");
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "output");
}

id objc_msgSend_outputDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputDevice");
}

id objc_msgSend_outputSpecifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputSpecifications");
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputs");
}

id objc_msgSend_outputsClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputsClass");
}

id objc_msgSend_overrideOriginalHeadphoneExposureNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideOriginalHeadphoneExposureNotification");
}

id objc_msgSend_parseTestResults_fromOutput_withFile_parsedResults_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseTestResults:fromOutput:withFile:parsedResults:error:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathToSoundFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathToSoundFile:");
}

id objc_msgSend_performAnalysisOnAVResult_fromOutput_withSourceSignalData_intoDKResult_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performAnalysisOnAVResult:fromOutput:withSourceSignalData:intoDKResult:error:");
}

id objc_msgSend_performScanWithParameters_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performScanWithParameters:error:");
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portType");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_previousAudioChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousAudioChanged");
}

id objc_msgSend_previousDeviceVolumeAudioVideo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousDeviceVolumeAudioVideo");
}

id objc_msgSend_previousDeviceVolumePlayAndRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousDeviceVolumePlayAndRecord");
}

id objc_msgSend_processCrackleData_audioRawDataSize_saveResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processCrackleData:audioRawDataSize:saveResult:");
}

id objc_msgSend_processFrequencyAndRearVentOcculusionWithPlayResult_sourceSignalData_dkResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processFrequencyAndRearVentOcculusionWithPlayResult:sourceSignalData:dkResult:");
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processingFormat");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rawRecordings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawRecordings");
}

id objc_msgSend_readIntoBuffer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readIntoBuffer:error:");
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForLocalNotifications");
}

id objc_msgSend_releaseALSClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseALSClient");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_restoreAccesibilityStateIfRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreAccesibilityStateIfRequired");
}

id objc_msgSend_restoreOriginalHeadphoneExposureNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreOriginalHeadphoneExposureNotification");
}

id objc_msgSend_restoreOriginalVolumes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreOriginalVolumes");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sampleRate");
}

id objc_msgSend_saveOriginalVolumes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveOriginalVolumes");
}

id objc_msgSend_saveRawRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveRawRecording");
}

id objc_msgSend_scanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanInterval");
}

id objc_msgSend_scanQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanQueue");
}

id objc_msgSend_scheduleNetworksScanWithDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleNetworksScanWithDelay:");
}

id objc_msgSend_sensorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensorType");
}

id objc_msgSend_sensors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensors");
}

id objc_msgSend_sequenceTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequenceTimeout");
}

id objc_msgSend_sequences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequences");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccelerometerUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccelerometerUpdateInterval:");
}

id objc_msgSend_setAccessibilityStateIfRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityStateIfRequired");
}

id objc_msgSend_setAccessoryDisconnectDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryDisconnectDetector:");
}

id objc_msgSend_setAirpodsInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAirpodsInputs:");
}

id objc_msgSend_setAudioDataAnalysisSettingsManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioDataAnalysisSettingsManager:");
}

id objc_msgSend_setAudioSystemResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioSystemResults:");
}

id objc_msgSend_setAudioTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioTest:");
}

id objc_msgSend_setAudioTestType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioTestType:");
}

id objc_msgSend_setBalanceChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBalanceChanged:");
}

id objc_msgSend_setCalculateCrossCorrelationPeak_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalculateCrossCorrelationPeak:");
}

id objc_msgSend_setChamberDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChamberDetector:");
}

id objc_msgSend_setChamberInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChamberInputs:");
}

id objc_msgSend_setChamberReadinessSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChamberReadinessSemaphore:");
}

id objc_msgSend_setChamberReadySemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChamberReadySemaphore:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannels:");
}

id objc_msgSend_setCode_forError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCode:forError:");
}

id objc_msgSend_setCompletedResultCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedResultCount:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetectChamberReadyALSThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectChamberReadyALSThreshold:");
}

id objc_msgSend_setDetectChamberReadyWaitTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectChamberReadyWaitTime:");
}

id objc_msgSend_setDetectChamberSensor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetectChamberSensor:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDiagnosticResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticResponder:");
}

id objc_msgSend_setEnergyValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnergyValues:");
}

id objc_msgSend_setEventQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventQueue:");
}

id objc_msgSend_setFileNameToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileNameToURL:");
}

id objc_msgSend_setFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFiles:");
}

id objc_msgSend_setFilterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilterDelay:");
}

id objc_msgSend_setFilterSetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilterSetup:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFrameLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrameLength:");
}

id objc_msgSend_setHIDServiceClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHIDServiceClient:");
}

id objc_msgSend_setHIDSystemClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHIDSystemClient:");
}

id objc_msgSend_setHeadphoneDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeadphoneDetector:");
}

id objc_msgSend_setHeadphoneExposureNotificationsChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeadphoneExposureNotificationsChanged:");
}

id objc_msgSend_setHeadphoneExposureNotificationsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeadphoneExposureNotificationsEnabled:");
}

id objc_msgSend_setIncludeProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeProperties:");
}

id objc_msgSend_setInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInput:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setInternalInstall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInternalInstall:");
}

id objc_msgSend_setIsDeviceWatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDeviceWatch:");
}

id objc_msgSend_setIsDeviceiPad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDeviceiPad:");
}

id objc_msgSend_setIsDeviceiPhone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDeviceiPhone:");
}

id objc_msgSend_setIsDeviceiPod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDeviceiPod:");
}

id objc_msgSend_setIsOriginallyMono_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsOriginallyMono:");
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRunning:");
}

id objc_msgSend_setMaximumCacheAge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumCacheAge:");
}

id objc_msgSend_setMergeScanResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMergeScanResults:");
}

id objc_msgSend_setMicBufferNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMicBufferNumbers:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setMonoChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonoChanged:");
}

id objc_msgSend_setMostRecentEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMostRecentEvent:");
}

id objc_msgSend_setMotionDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionDetector:");
}

id objc_msgSend_setMotionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionManager:");
}

id objc_msgSend_setNumberOfChannels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfChannels:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOrientationDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOrientationDetector:");
}

id objc_msgSend_setOriginalBalance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalBalance:");
}

id objc_msgSend_setOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutput:");
}

id objc_msgSend_setOutputDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputDevice:");
}

id objc_msgSend_setOutputID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputID:");
}

id objc_msgSend_setOutputMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputMode:");
}

id objc_msgSend_setOutputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputs:");
}

id objc_msgSend_setParallelCrossCorrelationCalculation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParallelCrossCorrelationCalculation:");
}

id objc_msgSend_setPreferenceFor_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferenceFor:value:");
}

id objc_msgSend_setPreviousAudioChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousAudioChanged:");
}

id objc_msgSend_setPreviousDeviceVolumeAudioVideo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousDeviceVolumeAudioVideo:");
}

id objc_msgSend_setPreviousDeviceVolumePlayAndRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousDeviceVolumePlayAndRecord:");
}

id objc_msgSend_setProcessSequenceAsynchronously_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessSequenceAsynchronously:");
}

id objc_msgSend_setRawRecordings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRawRecordings:");
}

id objc_msgSend_setRequiresBluetoothOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresBluetoothOutput:");
}

id objc_msgSend_setSoundDetectionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSoundDetectionState:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setStarted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStarted:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStimulusURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStimulusURL:");
}

id objc_msgSend_setSystemSoundDetectionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemSoundDetectionState:");
}

id objc_msgSend_setTestCompleteAlertTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCompleteAlertTime:");
}

id objc_msgSend_setTestCompleteChimeAlertEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCompleteChimeAlertEnabled:");
}

id objc_msgSend_setTestCompleteVibrationAlertEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCompleteVibrationAlertEnabled:");
}

id objc_msgSend_setTestCompletionSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestCompletionSemaphore:");
}

id objc_msgSend_setTestEndedSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestEndedSemaphore:");
}

id objc_msgSend_setTestFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestFailed:");
}

id objc_msgSend_setTmpdir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTmpdir:");
}

id objc_msgSend_setUpEventNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpEventNotifications");
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolume:");
}

id objc_msgSend_setVolumeTo_forCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeTo:forCategory:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXCorrCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXCorrCenter:");
}

id objc_msgSend_setXCorrPNR_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXCorrPNR:");
}

id objc_msgSend_setXCorrPeak_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXCorrPeak:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settings");
}

id objc_msgSend_setupALSClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupALSClient");
}

id objc_msgSend_setupHIDSystemClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupHIDSystemClient");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAccessoryManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldStopAfterEventReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldStopAfterEventReceived:");
}

id objc_msgSend_soundDetectionEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundDetectionEnabled");
}

id objc_msgSend_soundDetectionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundDetectionState");
}

id objc_msgSend_soundRecognitionChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundRecognitionChanged");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_sources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sources");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAccelerometerUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAccelerometerUpdatesToQueue:withHandler:");
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoring");
}

id objc_msgSend_startWithSequence_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithSequence:completion:");
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "started");
}

id objc_msgSend_stimulusCroppingLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stimulusCroppingLength");
}

id objc_msgSend_stimulusFrontCroppingLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stimulusFrontCroppingLength");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAccelerometerUpdates");
}

id objc_msgSend_stopAlerts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAlerts");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_systemSoundDetectionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemSoundDetectionState");
}

id objc_msgSend_testCompleteAlertTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCompleteAlertTime");
}

id objc_msgSend_testCompleteChimeAlertEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCompleteChimeAlertEnabled");
}

id objc_msgSend_testCompleteVibrationAlertEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCompleteVibrationAlertEnabled");
}

id objc_msgSend_testCompletionSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testCompletionSemaphore");
}

id objc_msgSend_testEndedSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testEndedSemaphore");
}

id objc_msgSend_testFailed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testFailed");
}

id objc_msgSend_testFinishedSuccessfully(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testFinishedSuccessfully");
}

id objc_msgSend_testSequence_completionSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testSequence:completionSemaphore:");
}

id objc_msgSend_threshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "threshold");
}

id objc_msgSend_tmpdir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tmpdir");
}

id objc_msgSend_unpairAirPodsOnFinish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpairAirPodsOnFinish");
}

id objc_msgSend_unpairSessionAccessoryOnTestCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpairSessionAccessoryOnTestCompletion");
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForLocalNotifications");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_useBundledAudioStimulus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useBundledAudioStimulus");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validOutputDeviceSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validOutputDeviceSet");
}

id objc_msgSend_validateAndInitializeParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAndInitializeParameters:");
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volume");
}

id objc_msgSend_writeFromBuffer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFromBuffer:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xCorrCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xCorrCenter");
}

id objc_msgSend_xCorrPNR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xCorrPNR");
}

id objc_msgSend_xCorrPeak(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xCorrPeak");
}

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xThreshold");
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zThreshold");
}
