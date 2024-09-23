BOOL sub_100003738(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "length") && (unint64_t)objc_msgSend(v2, "length") < 0x101;

  return v3;
}

BOOL sub_100003784(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "length") && (unint64_t)objc_msgSend(v2, "length") < 0x33;

  return v3;
}

void sub_10000396C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100003988(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24;
  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", v5, &off_100010D88, &off_100010DA0, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "inputValueToName"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

void sub_100003A1C(uint64_t a1, void *a2, void *a3)
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
  v10[2] = sub_100003B00;
  v10[3] = &unk_1000103F0;
  v11 = objc_alloc_init(OutputSpecification);
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  v9 = v11;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outputSpecifications"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

}

void sub_100003B00(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("mode"), &off_100010D88, &off_100010DB8, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setMode:", v2);

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("channel"), &off_100010D88, &off_100010DB8, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setChannel:", v3);

}

id *sub_100004024(id *result, void *a2)
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

void sub_100004570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
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

void sub_1000045D0(uint64_t a1, void *a2, void *a3)
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
            sub_100009728((uint64_t)v7, v30, v31, v32, v33, v34, v35, v36);

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
      sub_1000096C0((uint64_t)v7, v22, v23, v24, v25, v26, v27, v28);
LABEL_15:

    v20 = 0;
  }

  return v20;
}

void sub_1000052DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000060B0(uint64_t a1)
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
      objc_msgSend(v45, "setStatusCode:", &off_100010DD0);

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
            objc_msgSend(v63, "setStatusCode:", &off_100010DE8);

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

void sub_100006B88(uint64_t a1)
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

void sub_100007864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007890(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000078A0(uint64_t a1)
{

}

void sub_1000078A8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100007D28(uint64_t a1, void *a2, void *a3)
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
      sub_100009884(a1, v25, v26);

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
    sub_100009954();

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
      objc_msgSend(*(id *)(a1 + 72), "setCompletedResultCount:", &off_100010E00);
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
    sub_1000098F0();

  objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v21);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

LABEL_11:
}

void sub_10000946C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1000096C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000052DC((void *)&_mh_execute_header, a2, a3, "ERROR archiving logs: %@", a5, a6, a7, a8, 2u);
}

void sub_100009728(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000052DC((void *)&_mh_execute_header, a2, a3, "ERROR finding log(s): %@", a5, a6, a7, a8, 2u);
}

void sub_100009790(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Error clearing temporary files: %@", a1, 0xCu);

}

void sub_100009804(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100009480();
  sub_10000946C((void *)&_mh_execute_header, a2, v4, "Error clearing temporary files: %@", v5);

  sub_10000948C();
}

void sub_100009884(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  sub_10000946C((void *)&_mh_execute_header, a2, a3, "Sequence completed but results are empty! Sequence: {%@}", (uint8_t *)&v4);
  sub_100009478();
}

void sub_1000098F0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100009480();
  sub_10000946C((void *)&_mh_execute_header, v0, v1, "AVF audio playback error resolved to: %@", v2);
  sub_100009478();
}

void sub_100009954()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100009480();
  sub_10000946C((void *)&_mh_execute_header, v0, v1, "ERROR during audio playback: %@", v2);
  sub_100009478();
}

void sub_1000099B8(uint64_t a1, void *a2, NSObject *a3)
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

void sub_100009A68(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "inputID");
  sub_100009480();
  sub_10000946C((void *)&_mh_execute_header, a2, v3, "Input name missing for mic %ld", v4);
  sub_10000948C();
}

void sub_100009ADC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "performAnalysisOnResult called in base AudioSystemCommon controller!", v1, 2u);
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
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

id objc_msgSend_avAudioDeviceTestClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avAudioDeviceTestClass");
}

id objc_msgSend_avAudioDeviceTestSequenceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avAudioDeviceTestSequenceClass");
}

id objc_msgSend_balanceChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balanceChanged");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_calculateCrossCorrelationPeak(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateCrossCorrelationPeak");
}

id objc_msgSend_calculatePeakDBValueWithSourceSignalData_resultSignalData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculatePeakDBValueWithSourceSignalData:resultSignalData:error:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channel");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_completedResultCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedResultCount");
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

id objc_msgSend_correlationValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "correlationValue");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createNewTestSequenceWithOutput_andStimulusFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewTestSequenceWithOutput:andStimulusFile:");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRoute");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
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

id objc_msgSend_deleteTemporaryFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteTemporaryFiles");
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

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
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

id objc_msgSend_getAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAsset:completion:");
}

id objc_msgSend_getVolume_forCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVolume:forCategory:");
}

id objc_msgSend_headphoneDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headphoneDetector");
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

id objc_msgSend_initWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFloat:");
}

id objc_msgSend_initWithModelNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModelNumbers:");
}

id objc_msgSend_initWithPCMFormat_frameCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPCMFormat:frameCapacity:");
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

id objc_msgSend_internalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalInstall");
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

id objc_msgSend_makeOutputFromDictionary_validationFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeOutputFromDictionary:validationFailed:");
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

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processingFormat");
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

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
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

id objc_msgSend_sequenceTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequenceTimeout");
}

id objc_msgSend_sequences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequences");
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

id objc_msgSend_setAudioSystemResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioSystemResults:");
}

id objc_msgSend_setAudioTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioTest:");
}

id objc_msgSend_setBalanceChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBalanceChanged:");
}

id objc_msgSend_setCalculateCrossCorrelationPeak_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalculateCrossCorrelationPeak:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannel:");
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

id objc_msgSend_setDbValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDbValue:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDiagnosticResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticResponder:");
}

id objc_msgSend_setFileNameToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileNameToURL:");
}

id objc_msgSend_setFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFiles:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFrameLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrameLength:");
}

id objc_msgSend_setHeadphoneDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeadphoneDetector:");
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

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setMonoChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonoChanged:");
}

id objc_msgSend_setMotionDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionDetector:");
}

id objc_msgSend_setMotionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionManager:");
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

id objc_msgSend_setSoundDetectionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSoundDetectionState:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSource:");
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

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settings");
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

id objc_msgSend_startWithSequence_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithSequence:completion:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAccelerometerUpdates");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_systemSoundDetectionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemSoundDetectionState");
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

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForLocalNotifications");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validOutputDeviceSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validOutputDeviceSet");
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

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xThreshold");
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zThreshold");
}
