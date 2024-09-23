void sub_100003CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
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

void sub_100003D40(uint64_t a1, void *a2, void *a3)
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

id *sub_100004374(id *result, void *a2)
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

void sub_10000514C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005178(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005188(uint64_t a1)
{

}

void sub_100005190(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10000525C(uint64_t a1)
{
  DAAudioDevice *v2;
  void *v3;
  DAAudioDevice *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id obja;
  id obj;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  id v88;
  const __CFString *v89;
  void *v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];

  v2 = [DAAudioDevice alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
  v88 = 0;
  v4 = -[DAAudioDevice initWithSequentialAudioInput:error:](v2, "initWithSequentialAudioInput:error:", objc_msgSend(v3, "sequentialAudioInput"), &v88);
  v5 = v88;
  objc_msgSend(*(id *)(a1 + 32), "setAudioDevice:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioDevice"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(*(id *)(a1 + 32), "setPlayResults:", v7);

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audioFilesPerOutputComponent"));
    v10 = objc_msgSend(v9, "count");

    v72 = a1;
    if (v10)
    {
      v11 = 0;
      while (1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "audioFilesPerOutputComponent"));
        v62 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v11));

        if (objc_msgSend(v14, "count"))
          break;
        v25 = v5;
LABEL_11:

        v11 = v62 + 1;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputs"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "audioFilesPerOutputComponent"));
        v30 = objc_msgSend(v29, "count");

        v5 = v25;
        if ((unint64_t)v30 <= v62 + 1)
          goto LABEL_15;
      }
      v15 = 0;
      v16 = v5;
      while (1)
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
        {
          v25 = v16;
          goto LABEL_48;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", v15));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioDevice"));
        v70 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fileNameToURL"));
        v68 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileName"));
        obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", v68));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fileName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "volume"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "channel"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v72 + 32), "inputs"));
        v22 = objc_msgSend(v21, "sendRawData");
        v87 = v16;
        v23 = v16;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "playSignalFile:fileName:fromOutput:atVolume:withChannel:sendRawData:error:", obja, v18, v62, v19, v20, v22, &v87));
        v25 = v87;

        a1 = v72;
        v26 = *(void **)(v72 + 32);
        if (!v24)
          break;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "playResults"));
        objc_msgSend(v27, "addObject:", v24);

        ++v15;
        v16 = v25;
        if ((unint64_t)objc_msgSend(v14, "count") <= v15)
          goto LABEL_11;
      }
      objc_msgSend(v26, "failedToExecuteWithError:", v25);

LABEL_48:
    }
    else
    {
      v25 = v5;
LABEL_15:
      if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
      {
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "playResults"));
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
        if (v58)
        {
          v31 = *(_QWORD *)v84;
          v57 = *(_QWORD *)v84;
LABEL_18:
          v32 = 0;
          while (1)
          {
            if (*(_QWORD *)v84 != v31)
            {
              v33 = v32;
              objc_enumerationMutation(obj);
              v32 = v33;
            }
            v59 = v32;
            v34 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v32);
            v79 = 0u;
            v80 = 0u;
            v81 = 0u;
            v82 = 0u;
            v69 = v34;
            v60 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
            if (v60)
            {
              v67 = *(_QWORD *)v80;
LABEL_23:
              v35 = 0;
              while (1)
              {
                if (*(_QWORD *)v80 != v67)
                  objc_enumerationMutation(v69);
                v36 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v35);
                v75 = 0u;
                v76 = 0u;
                v77 = 0u;
                v78 = 0u;
                v71 = v36;
                v37 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
                if (v37)
                {
                  v38 = v37;
                  v39 = *(_QWORD *)v76;
                  v63 = v35;
                  while (2)
                  {
                    v40 = 0;
                    v41 = v25;
                    do
                    {
                      if (*(_QWORD *)v76 != v39)
                        objc_enumerationMutation(v71);
                      v42 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v40);
                      if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
                      {
                        v25 = v41;
                        v35 = v63;
                        goto LABEL_37;
                      }
                      v74 = v41;
                      v43 = (void *)objc_claimAutoreleasedReturnValue(+[DAAudioCalculation calculateCrossCorrelation:error:](DAAudioCalculation, "calculateCrossCorrelation:error:", v42, &v74));
                      v25 = v74;

                      if (!v43)
                      {
                        objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v25);

                        goto LABEL_49;
                      }
                      v44 = v25;
                      v45 = objc_msgSend(v42, "outputID");
                      v46 = objc_msgSend(v42, "inputID");
                      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "fileName"));
                      a1 = v72;
                      v56 = v45;
                      v25 = v44;
                      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu,%lu,%@"), v56, v46, v47));

                      objc_msgSend(v61, "setObject:forKey:", v43, v48);
                      v40 = (char *)v40 + 1;
                      v41 = v44;
                    }
                    while (v38 != v40);
                    v38 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
                    v35 = v63;
                    if (v38)
                      continue;
                    break;
                  }
                }
LABEL_37:

                if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
                  break;
                if ((id)++v35 == v60)
                {
                  v60 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
                  if (v60)
                    goto LABEL_23;
                  break;
                }
              }
            }

            if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
              break;
            v32 = v59 + 1;
            v31 = v57;
            if ((id)(v59 + 1) == v58)
            {
              v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
              v31 = v57;
              v58 = v49;
              if (v49)
                goto LABEL_18;
              break;
            }
          }
        }

        if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "allKeys"));
          v51 = objc_msgSend(v50, "count");

          if (v51)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
            objc_msgSend(v52, "setStatusCode:", &off_100010858);

            v89 = CFSTR("dbValues");
            v90 = v61;
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
            objc_msgSend(v54, "setData:", v53);

          }
          else
          {
            v73 = v25;
            +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -60, &v73);
            v55 = v73;

            objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v55);
            v25 = v55;
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
      }
    }
LABEL_49:

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedToExecuteWithError:", v5);
    v25 = v5;
  }

}

void sub_1000077B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007A70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t sub_1000084E8(uint64_t result, AudioUnitRenderActionFlags *a2, const AudioTimeStamp *a3, UInt32 a4, UInt32 a5)
{
  if (result)
    return AudioUnitRender(*(AudioUnit *)(result + 80), a2, a3, a4, a5, *(AudioBufferList **)(result + 88));
  return result;
}

uint64_t sub_1000084FC(void *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && *a2 == 8)
    objc_msgSend(a1, "grabRecordedFrameData:withNumberOfFrames:", a6, a5);
  return 0;
}

uint64_t sub_10000852C(void *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && *a2 == 8)
    objc_msgSend(a1, "grabPlayBackFrameData:withNumberOfFrames:", a6, a5);
  return 0;
}

BOOL sub_100008EA8(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "length") && (unint64_t)objc_msgSend(v2, "length") < 0x101;

  return v3;
}

BOOL sub_100008EF4(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "length") && (unint64_t)objc_msgSend(v2, "length") < 0x33;

  return v3;
}

void sub_100009078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009094(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v10 = a2;
  if ((unint64_t)objc_msgSend(v10, "count") > 0x31)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000091A8;
    v11[3] = &unk_1000104D8;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v13 = v6;
    v14 = v8;
    v12 = v7;
    v9 = v6;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

    if (!a4)
      goto LABEL_7;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;
LABEL_7:

}

void sub_1000091A8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  AudioFileTestCase *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
  {
    v7 = objc_opt_new(AudioFileTestCase);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("name"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    -[AudioFileTestCase setFileName:](v7, "setFileName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("volume"), &off_100010900, &off_100010910, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    -[AudioFileTestCase setVolume:](v7, "setVolume:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("channel"), &off_100010888, &off_1000108A0, &off_100010888, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    -[AudioFileTestCase setChannel:](v7, "setChannel:", v10);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!a4)
      goto LABEL_7;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;
LABEL_7:

}

void sub_100009938(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009A00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__applyComponentArrayParameter_requiredFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyComponentArrayParameter:requiredFiles:");
}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceleration");
}

id objc_msgSend_accessoryDisconnectDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDisconnectDetector");
}

id objc_msgSend_accessoryModelNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryModelNumbers");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_audioDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioDevice");
}

id objc_msgSend_audioFilesPerOutputComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioFilesPerOutputComponent");
}

id objc_msgSend_audioPlayingSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioPlayingSemaphore");
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioRouteChanged");
}

id objc_msgSend_audioSessionInterruptDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioSessionInterruptDetector");
}

id objc_msgSend_availableInputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableInputs");
}

id objc_msgSend_balanceChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balanceChanged");
}

id objc_msgSend_calculateCrossCorrelation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateCrossCorrelation:error:");
}

id objc_msgSend_calculateFileDurationForFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateFileDurationForFile:error:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channel");
}

id objc_msgSend_cleanUpPlayResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpPlayResults");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_confirmDeviceDocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmDeviceDocked");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedAccessories");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
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

id objc_msgSend_createAUGraphWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAUGraphWithError:");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRoute");
}

id objc_msgSend_dataSourceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSourceID");
}

id objc_msgSend_dataSources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSources");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_diagnosticResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticResponder");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
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

id objc_msgSend_enableVolumeHUD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableVolumeHUD:");
}

id objc_msgSend_endAudioTestCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endAudioTestCase");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_failedToExecuteWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedToExecuteWithError:");
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileName");
}

id objc_msgSend_fileNameToURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileNameToURL");
}

id objc_msgSend_fileTimeInFrames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileTimeInFrames");
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURL");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_freeReceivedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeReceivedData");
}

id objc_msgSend_freeSourceData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeSourceData");
}

id objc_msgSend_getAllMicrophoneSourceForPort_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllMicrophoneSourceForPort:error:");
}

id objc_msgSend_getAsset_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAsset:completion:");
}

id objc_msgSend_getBandPassDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBandPassDescription");
}

id objc_msgSend_getBasicStreamDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBasicStreamDescription");
}

id objc_msgSend_getBuiltInMicrophonePortWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBuiltInMicrophonePortWithError:");
}

id objc_msgSend_getGeneratorDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGeneratorDescription");
}

id objc_msgSend_getMixerDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMixerDescription");
}

id objc_msgSend_getRemoteIODescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRemoteIODescription");
}

id objc_msgSend_getVolume_forCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVolume:forCategory:");
}

id objc_msgSend_grabPlayBackFrameData_withNumberOfFrames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "grabPlayBackFrameData:withNumberOfFrames:");
}

id objc_msgSend_grabRecordedFrameData_withNumberOfFrames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "grabRecordedFrameData:withNumberOfFrames:");
}

id objc_msgSend_headphoneDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headphoneDetector");
}

id objc_msgSend_initWithFileURL_fileName_numberOfInputs_inputID_outputID_volume_channel_sendRawData_delegate_sequentialAudioInput_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileURL:fileName:numberOfInputs:inputID:outputID:volume:channel:sendRawData:delegate:sequentialAudioInput:error:");
}

id objc_msgSend_initWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFloat:");
}

id objc_msgSend_initWithModelNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModelNumbers:");
}

id objc_msgSend_initWithSequentialAudioInput_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSequentialAudioInput:error:");
}

id objc_msgSend_initWithSourceSignal_receivedSignal_minimumDelay_maximumDelay_fileTimeInFrames_outputID_inputID_fileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSourceSignal:receivedSignal:minimumDelay:maximumDelay:fileTimeInFrames:outputID:inputID:fileName:");
}

id objc_msgSend_initWithThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithThreshold:");
}

id objc_msgSend_initWithxThreshold_zThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithxThreshold:zThreshold:");
}

id objc_msgSend_initilizeAudioSessionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initilizeAudioSessionWithError:");
}

id objc_msgSend_inputID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputID");
}

id objc_msgSend_inputNumberOfChannels(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputNumberOfChannels");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isAccelerometerActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccelerometerActive");
}

id objc_msgSend_isAccelerometerAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccelerometerAvailable");
}

id objc_msgSend_isBalanceChangeRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBalanceChangeRequired");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isDockRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDockRequired");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHeadphonesConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHeadphonesConnected");
}

id objc_msgSend_isMonoChangeRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMonoChangeRequired");
}

id objc_msgSend_isOriginallyMono(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOriginallyMono");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_makeSignalsDataObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeSignalsDataObjects");
}

id objc_msgSend_maximumDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumDelay");
}

id objc_msgSend_minimumDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumDelay");
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

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionManager");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numInputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numInputs");
}

id objc_msgSend_numberOfInputComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfInputComponents");
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

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orientationDetector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientationDetector");
}

id objc_msgSend_originalBalance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalBalance");
}

id objc_msgSend_outputID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputID");
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputs");
}

id objc_msgSend_overrideOutputAudioPort_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideOutputAudioPort:error:");
}

id objc_msgSend_playAndRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playAndRecord");
}

id objc_msgSend_playAndRecordFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playAndRecordFinished");
}

id objc_msgSend_playFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playFrameCount");
}

id objc_msgSend_playResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playResults");
}

id objc_msgSend_playSignalFile_fileName_fromOutput_atVolume_withChannel_sendRawData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playSignalFile:fileName:fromOutput:atVolume:withChannel:sendRawData:error:");
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

id objc_msgSend_previousDeviceVolumeAudioVideo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousDeviceVolumeAudioVideo");
}

id objc_msgSend_previousDeviceVolumePlayAndRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousDeviceVolumePlayAndRecord");
}

id objc_msgSend_receivedSignal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedSignal");
}

id objc_msgSend_recordFrameCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordFrameCount");
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForLocalNotifications");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_requiredFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiredFiles");
}

id objc_msgSend_resetToPreviousVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetToPreviousVolume");
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

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_saveOriginalVolumes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveOriginalVolumes");
}

id objc_msgSend_sendRawData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRawData");
}

id objc_msgSend_sequentialAudioInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequentialAudioInput");
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

id objc_msgSend_setAccessoryModelNumbers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryModelNumbers:");
}

id objc_msgSend_setActive_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:error:");
}

id objc_msgSend_setAllowAllBuiltInDataSources_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowAllBuiltInDataSources:");
}

id objc_msgSend_setAudioDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioDevice:");
}

id objc_msgSend_setAudioFilesPerOutputComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioFilesPerOutputComponent:");
}

id objc_msgSend_setAudioPlayingSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioPlayingSemaphore:");
}

id objc_msgSend_setAudioSessionInterruptDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioSessionInterruptDetector:");
}

id objc_msgSend_setBalanceChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBalanceChanged:");
}

id objc_msgSend_setCategory_mode_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:mode:options:error:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setCode_forError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCode:forError:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceVolume:");
}

id objc_msgSend_setDiagnosticResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticResponder:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileName:");
}

id objc_msgSend_setFileNameToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileNameToURL:");
}

id objc_msgSend_setFileTimeInFrames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileTimeInFrames:");
}

id objc_msgSend_setFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileURL:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setHeadphoneDetector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeadphoneDetector:");
}

id objc_msgSend_setInputID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputID:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIsCancelled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCancelled:");
}

id objc_msgSend_setIsOriginallyMono_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsOriginallyMono:");
}

id objc_msgSend_setMaximumDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumDelay:");
}

id objc_msgSend_setMinimumDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumDelay:");
}

id objc_msgSend_setMode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:error:");
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

id objc_msgSend_setNumInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumInputs:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
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

id objc_msgSend_setOutputID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputID:");
}

id objc_msgSend_setPlayAndRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayAndRecord:");
}

id objc_msgSend_setPlayFrameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayFrameCount:");
}

id objc_msgSend_setPlayResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayResults:");
}

id objc_msgSend_setPreferredDataSource_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredDataSource:error:");
}

id objc_msgSend_setPreferredInput_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredInput:error:");
}

id objc_msgSend_setPreviousDeviceVolumeAudioVideo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousDeviceVolumeAudioVideo:");
}

id objc_msgSend_setPreviousDeviceVolumePlayAndRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousDeviceVolumePlayAndRecord:");
}

id objc_msgSend_setReceivedSignal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReceivedSignal:");
}

id objc_msgSend_setRecordFrameCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordFrameCount:");
}

id objc_msgSend_setRequiredFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiredFiles:");
}

id objc_msgSend_setResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResults:");
}

id objc_msgSend_setSendRawData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSendRawData:");
}

id objc_msgSend_setSequentialAudioInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSequentialAudioInput:");
}

id objc_msgSend_setSourceSignal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceSignal:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setUpEventNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpEventNotifications");
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolume:");
}

id objc_msgSend_setVolumeNeedsReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumeNeedsReset:");
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

id objc_msgSend_setXComponentAccelThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXComponentAccelThreshold:");
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

id objc_msgSend_sourceSignal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceSignal");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAccelerometerUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAccelerometerUpdatesToQueue:withHandler:");
}

id objc_msgSend_startAudioTestCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAudioTestCase");
}

id objc_msgSend_startPlayAndRecordWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPlayAndRecordWithError:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAccelerometerUpdates");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_threshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "threshold");
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForLocalNotifications");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volume");
}

id objc_msgSend_volumeNeedsReset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeNeedsReset");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xComponentAccelThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xComponentAccelThreshold");
}

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xThreshold");
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zThreshold");
}
