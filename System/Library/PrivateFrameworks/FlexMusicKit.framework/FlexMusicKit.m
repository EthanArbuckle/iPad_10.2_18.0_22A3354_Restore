void sub_20D018370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t sub_20D01839C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t isEqualToString;

  objc_msgSend_assetID(a2, (const char *)a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetID(*(void **)(a1 + 32), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v12, (uint64_t)v11, v13, v14);

  return isEqualToString;
}

void sub_20D018554(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D019AA8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  FlexLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_20D016000, v4, OS_LOG_TYPE_DEFAULT, "Posting kFlexReachabilityChangedNotification for %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v9, v10, (uint64_t)CFSTR("kFlexNetworkReachabilityChangedNotification"), (uint64_t)v3, v11);

}

void sub_20D01A114(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D01A2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_20D01A330(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend_library(WeakRetained, v2, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__updateFromCloud(v6, v7, v8, v9, v10);

    WeakRetained = v11;
  }

}

void sub_20D01A558(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D01A72C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20D01ADA8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_isEqualToString_(a2, (const char *)a2, (uint64_t)&stru_24C5F0F80, a4, a5);
}

intptr_t sub_20D01BE00(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_20D01C008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20D01C050(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
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
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double Seconds;
  _QWORD v59[4];
  CMTime time;

  v3 = a2;
  objc_msgSend_values(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("SegmentType"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("SILENCE"), v14, v15) & 1) == 0)
  {
    objc_msgSend_values(v3, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v20, v21, (uint64_t)CFSTR("PeakValue"), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_doubleValue(v24, v25, v26, v27, v28);
      v34 = *(_QWORD *)(a1[4] + 8);
      if (v33 > *(double *)(v34 + 24))
        *(double *)(v34 + 24) = v33;
    }
    else
    {
      ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      FlexLogForCategory(0);
      v35 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEBUG))
        sub_20D01C404(v3, v35, v36, v37, v38);

    }
    objc_msgSend_values(v3, v29, v30, v31, v32);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v39, v40, (uint64_t)CFSTR("Loudness"), v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend_doubleValue(v43, v44, v45, v46, v47);
      if (v52 >= -70.0)
        v53 = v52;
      else
        v53 = -70.0;
      if (v3)
        objc_msgSend_timeRange(v3, v48, v49, v50, v51);
      else
        memset(v59, 0, sizeof(v59));
      time = *(CMTime *)&v59[1];
      Seconds = CMTimeGetSeconds(&time);
      if (Seconds > 0.0)
      {
        *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) + v53 * Seconds;
        *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = Seconds + *(double *)(*(_QWORD *)(a1[7] + 8) + 24);
      }
    }
    else
    {
      ++*(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
      FlexLogForCategory(0);
      v54 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEBUG))
        sub_20D01C35C(v3, v54, v55, v56, v57);

    }
  }

}

void sub_20D01C338(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

void sub_20D01C35C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("Missing loudness value for segment item: %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D01C338(&dword_20D016000, v11, v12, "%@", v13, v14, v15, v16, (uint64_t)v6, v17, 2u);

  sub_20D01C34C();
}

void sub_20D01C404(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("Missing peak value for segment item: %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D01C338(&dword_20D016000, v11, v12, "%@", v13, v14, v15, v16, (uint64_t)v6, v17, 2u);

  sub_20D01C34C();
}

void sub_20D01C54C(uint64_t a1)
{
  FMSongLibrary *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = [FMSongLibrary alloc];
  v6 = objc_msgSend_initWithOptions_(v2, v3, *(_QWORD *)(a1 + 32), v4, v5);
  v7 = (void *)qword_2549A1968;
  qword_2549A1968 = v6;

}

void sub_20D01C928(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D01CC40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D01CEA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20D01D06C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__updateFromCloud(*(void **)(a1 + 32), a2, a3, a4, a5);
}

void sub_20D01D0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D01D2A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D01D2C8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20[16];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!a3)
    {
      objc_msgSend_setContactedCloud_(WeakRetained, v7, 1, v9, v10);
      objc_msgSend__notifySongsChanged_(*(void **)(a1 + 32), v17, (uint64_t)v5, v18, v19);
      goto LABEL_8;
    }
    objc_msgSend_cloudManager(WeakRetained, v7, v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_retryFetchAllSongs(v12, v13, v14, v15, v16);
  }
  else
  {
    FlexLogForCategory(2uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_20D016000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to handle success or error from fetchAllSongsWithCompletion: but self is nil.", v20, 2u);
    }
  }

LABEL_8:
}

void sub_20D01DA00(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;

  objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a2, (uint64_t)CFSTR("songName"), a4, a5, CFSTR("artistName"), CFSTR("songVersion"), CFSTR("artVersion"), CFSTR("compatibilityVersion"), CFSTR("recordID"), CFSTR("mood"), CFSTR("moodAlt"), CFSTR("pace"), CFSTR("arousal"), CFSTR("valence"), CFSTR("visualTempo"), CFSTR("genreStrings"), CFSTR("regionStrings"), CFSTR("format"),
    CFSTR("style"),
    CFSTR("audioEncoderPresetName"),
    CFSTR("hidden"),
    CFSTR("recalled"),
    0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_2549A1988;
  qword_2549A1988 = v5;

}

BOOL sub_20D01FD90(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  _BOOL8 v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;

  v6 = a2;
  objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
  v12 = v11;
  objc_msgSend_doubleValue(*(void **)(a1 + 32), v13, v14, v15, v16);
  if (v12 > v21)
    *a4 = 1;
  objc_msgSend_doubleValue(v6, v17, v18, v19, v20);
  v23 = v22;
  objc_msgSend_doubleValue(*(void **)(a1 + 40), v24, v25, v26, v27);
  if (v23 >= v32)
  {
    objc_msgSend_doubleValue(v6, v28, v29, v30, v31);
    v35 = v34;
    objc_msgSend_doubleValue(*(void **)(a1 + 32), v36, v37, v38, v39);
    v33 = v35 < v40;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void sub_20D0210B4(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend_count(a1, a2, a3, a4, a5);
  objc_msgSend_numberWithUnsignedInteger_(v6, v8, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412290;
  v13 = v11;
  _os_log_debug_impl(&dword_20D016000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Found %@ number of loop points in rendition.", (uint8_t *)&v12, 0xCu);

}

void sub_20D0214B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D0214D4(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double Seconds;
  CMTime v24;
  CMTime time;

  v9 = a2;
  if (a3)
  {
    objc_msgSend_allDurations(*(void **)(a1 + 32), v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v10, v11, a3 - 1, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend_CMTimeValue(v9, v15, v16, v17, v18);
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    if (v14)
      objc_msgSend_CMTimeValue(v14, v19, v20, v21, v22);
    else
      memset(&v24, 0, sizeof(v24));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = Seconds
                                                                - CMTimeGetSeconds(&v24)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  }
}

void sub_20D02391C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  id v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v7, v6, (uint64_t)CFSTR("FMSongAssetsChanged"), *(_QWORD *)(a1 + 32), 0);

}

void sub_20D023B7C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  id v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v7, v6, (uint64_t)CFSTR("FMSongAssetDownloadProgressChanged"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_20D024B94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  _QWORD v7[44];

  v7[43] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("Mood_Ethereal");
  v7[1] = CFSTR("Mood_Sentimental");
  v7[2] = CFSTR("Mood_Chill");
  v7[3] = CFSTR("Mood_Gentle");
  v7[4] = CFSTR("Mood_Happy");
  v7[5] = CFSTR("Mood_Uplifting");
  v7[6] = CFSTR("Mood_Party");
  v7[7] = CFSTR("Mood_Action");
  v7[8] = CFSTR("Mood_Epic");
  v7[9] = CFSTR("Mood_Neutral");
  v7[10] = CFSTR("SongPace_Slow");
  v7[11] = CFSTR("SongPace_Medium");
  v7[12] = CFSTR("SongPace_Fast");
  v7[13] = CFSTR("MoodAlt_Sentimental");
  v7[14] = CFSTR("MoodAlt_Playful");
  v7[15] = CFSTR("MoodAlt_Action");
  v7[16] = CFSTR("MoodAlt_Event");
  v7[17] = CFSTR("MoodAlt_Chill");
  v7[18] = CFSTR("MoodAlt_Retro");
  v7[19] = CFSTR("MoodAlt_Pop");
  v7[20] = CFSTR("Genre_Blues");
  v7[21] = CFSTR("Genre_Classical");
  v7[22] = CFSTR("Genre_Country");
  v7[23] = CFSTR("Genre_Dance");
  v7[24] = CFSTR("Genre_Electronic");
  v7[25] = CFSTR("Genre_HipHopRap");
  v7[26] = CFSTR("Genre_Holiday");
  v7[27] = CFSTR("Genre_Indie");
  v7[28] = CFSTR("Genre_Jazz");
  v7[29] = CFSTR("Genre_KidsFamily");
  v7[30] = CFSTR("Genre_Latin");
  v7[31] = CFSTR("Genre_Lounge");
  v7[32] = CFSTR("Genre_Metal");
  v7[33] = CFSTR("Genre_Pop");
  v7[34] = CFSTR("Genre_R&B");
  v7[35] = CFSTR("Genre_Reggae");
  v7[36] = CFSTR("Genre_Rock");
  v7[37] = CFSTR("Genre_SingerSongwriter");
  v7[38] = CFSTR("Genre_SoulFunk");
  v7[39] = CFSTR("Genre_StageScreen");
  v7[40] = CFSTR("Genre_World");
  v7[41] = CFSTR("Genre_Alternative");
  v7[42] = CFSTR("Genre_Downtempo");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v7, 43, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_2549A1990;
  qword_2549A1990 = v5;

}

void sub_20D025838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D025864(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D025874(uint64_t a1)
{

}

void sub_20D02587C(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;

  v11 = a2;
  if (objc_msgSend_hasPrefix_(v11, v3, (uint64_t)CFSTR("Mood_"), v4, v5))
  {
    objc_msgSend_addObject_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v11, (uint64_t)v11, v7, v8);
  }
  else if (objc_msgSend_hasPrefix_(v11, v6, (uint64_t)CFSTR("SongPace_"), v7, v8))
  {
    objc_msgSend_addObject_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11, (uint64_t)v11, v9, v10);
  }

}

void sub_20D0259C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_20D0259E8(uint64_t a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_uid(a2, (const char *)a2, (uint64_t)a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_20D016000, a3, OS_LOG_TYPE_ERROR, "ERROR: client provide uid %@ does not match expected UID %@", (uint8_t *)&v8, 0x16u);

}

void sub_20D025A98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D0259DC();
  sub_20D0259C4(&dword_20D016000, v0, v1, "ERROR: Error loading client initiated backend", v2, v3, v4, v5, v6);
  sub_20D0259D4();
}

void sub_20D025AC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_20D0259DC();
  sub_20D0259C4(&dword_20D016000, v0, v1, "ERROR: Client provided unexpected assets", v2, v3, v4, v5, v6);
  sub_20D0259D4();
}

void _FMLogMessage(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t v11;
  NSObject *v12;
  char __str[1024];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  vsnprintf(__str, 0x400uLL, a3, &a9);
  v11 = strlen(__str);
  if (v11 <= 0x3FE)
    snprintf(&__str[v11], 1024 - v11, " (file: %s, line: %u)", a1, a2);
  FlexLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_20D025BCC((uint64_t)__str, v12);

}

void sub_20D025BCC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_20D016000, a2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v2, 0xCu);
}

id FlexLogForCategory(unint64_t a1)
{
  if (a1 >= 4)
    sub_20D025D30();
  if (qword_253E5D838 != -1)
    dispatch_once(&qword_253E5D838, &unk_24C5EFBC8);
  return (id)qword_253E5D818[a1];
}

void sub_20D025C9C()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.FlexMusicKit", "FlexMusicKit");
  v1 = (void *)qword_253E5D818[0];
  qword_253E5D818[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.FlexMusicKit", "FlexMusicSequencer");
  v3 = (void *)qword_253E5D820;
  qword_253E5D820 = (uint64_t)v2;

  v4 = os_log_create("com.apple.FlexMusicKit", "FlexMusicCloud");
  v5 = (void *)qword_253E5D828;
  qword_253E5D828 = (uint64_t)v4;

  v6 = os_log_create("com.apple.FlexMusicKit", "FlexMusicDatabase");
  v7 = (void *)qword_253E5D830;
  qword_253E5D830 = (uint64_t)v6;

}

void sub_20D025D30()
{
  __assert_rtn("FlexLogForCategory", "FlexLogging.m", 15, "category < FlexLoggingCategoryCount");
}

id FlexDynamicCast(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void sub_20D026CA4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CMTime *v15;
  uint64_t i;
  void *v17;
  int32_t v18;
  Float64 v19;
  void *v20;
  Float64 Seconds;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  CMTime v30;
  CMTime lhs;
  CMTime v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v34;
    v15 = (CMTime *)MEMORY[0x24BDC0D40];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v6);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        memset(&v32, 0, sizeof(v32));
        if (v17)
        {
          v18 = *(_DWORD *)(a1 + 32);
          objc_msgSend_doubleValue(v17, v9, v10, v11, v12);
          CMTimeMakeWithSeconds(&lhs, v19, v18);
        }
        else
        {
          lhs = *v15;
        }
        v30 = *(CMTime *)(a1 + 36);
        CMTimeAdd(&v32, &lhs, &v30);
        v20 = (void *)MEMORY[0x24BDD16E0];
        v30 = v32;
        Seconds = CMTimeGetSeconds(&v30);
        objc_msgSend_numberWithDouble_(v20, v22, v23, v24, v25, Seconds);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v5, v27, (uint64_t)v26, v28, v29);

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v13);
  }

}

void sub_20D02847C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v10 = a3;
  if (v10)
  {
    FlexLogForCategory(3uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_20D016000, v11, OS_LOG_TYPE_DEFAULT, "Failed to load local song local database %@, error %@", (uint8_t *)&v15, 0x16u);
    }

  }
  else
  {
    v12 = objc_msgSend_newBackgroundContext(*(void **)(*(_QWORD *)(a1 + 32) + 16), v6, v7, v8, v9);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 24);
    *(_QWORD *)(v13 + 24) = v12;

  }
}

void sub_20D0287B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D0287E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D0287F4(uint64_t a1)
{

}

void sub_20D0287FC(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  id v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int hasChanges;
  id v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  id obj;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  id to;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;
  void *v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  objc_copyWeak(&to, (id *)(a1 + 56));
  v2 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend_uid(*(void **)(a1 + 32), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)objc_msgSend_initWithUUIDString_(v2, v8, (uint64_t)v7, v9, v10);

  if (v93)
  {
    objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v11, (uint64_t)CFSTR("LocalSongs"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v16, (uint64_t)CFSTR("uuid == %@"), v17, v18, v93);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPredicate_(v15, v20, (uint64_t)v19, v21, v22);

    v23 = objc_loadWeakRetained(&to);
    v99 = 0;
    objc_msgSend_executeFetchRequest_error_(v23, v24, (uint64_t)v15, (uint64_t)&v99, v25);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v99;

    if (objc_msgSend_count(v92, v27, v28, v29, v30) || v26)
    {
      if (v26)
      {
        FlexLogForCategory(3uLL);
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          sub_20D029EB4();

        v67 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v68 = v26;
        v35 = *(NSObject **)(v67 + 40);
        *(_QWORD *)(v67 + 40) = v68;
      }
      else
      {
        FlexLogForCategory(3uLL);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_20D029E50();
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x24BDBB658];
      v32 = objc_loadWeakRetained(&to);
      objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(v31, v33, (uint64_t)CFSTR("LocalSongs"), (uint64_t)v32, v34);
      v35 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_setUuid_(v35, v36, (uint64_t)v93, v37, v38);
      objc_msgSend_songData(*(void **)(a1 + 32), v39, v40, v41, v42);
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v95, (uint64_t)v107, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v96 != v49)
              objc_enumerationMutation(v43);
            v51 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v43, v45, v51, v46, v47);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setValue_forKey_(v35, v53, (uint64_t)v52, v51, v54);

          }
          v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v95, (uint64_t)v107, 16);
        }
        while (v48);
      }

    }
    v65 = v92;
  }
  else
  {
    v55 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_uid(*(void **)(a1 + 32), v11, v12, v13, v14);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v55, v57, (uint64_t)CFSTR("'%@' is an invalid UUID. Record not saved to local database"), v58, v59, v56);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (void *)MEMORY[0x24BDD1540];
    v105 = *MEMORY[0x24BDD0BA0];
    v106 = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v61, (uint64_t)&v106, (uint64_t)&v105, 1);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v60, v62, (uint64_t)CFSTR("com.apple.FlexMusicKit.DatabaseError"), 0, (uint64_t)v26);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v65 = *(void **)(v64 + 40);
    *(_QWORD *)(v64 + 40) = v63;
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v69 = objc_loadWeakRetained(&to);
    hasChanges = objc_msgSend_hasChanges(v69, v70, v71, v72, v73);

    if (hasChanges)
    {
      v75 = objc_loadWeakRetained(&to);
      v76 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v76 + 40);
      v80 = objc_msgSend_save_(v75, v77, (uint64_t)&obj, v78, v79);
      objc_storeStrong((id *)(v76 + 40), obj);

      if (!v80)
      {
        FlexLogForCategory(3uLL);
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localizedDescription(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v82, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localizedRecoverySuggestion(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v102 = v86;
          v103 = 2112;
          v104 = v91;
          _os_log_impl(&dword_20D016000, v81, OS_LOG_TYPE_DEFAULT, "Error updating database\n%@\n%@", buf, 0x16u);

        }
        goto LABEL_28;
      }
    }
    else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      goto LABEL_28;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_28:

  objc_destroyWeak(&to);
}

void sub_20D028CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D028E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20D028E7C(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int hasChanges;
  id v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id obj;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id to;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  objc_copyWeak(&to, (id *)(a1 + 56));
  v2 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend_uid(*(void **)(a1 + 32), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend_initWithUUIDString_(v2, v8, (uint64_t)v7, v9, v10);

  if (v84)
  {
    objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v11, (uint64_t)CFSTR("LocalSongs"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v15, (uint64_t)CFSTR("uuid == %@"), v16, v17, v84);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPredicate_(v14, v19, (uint64_t)v18, v20, v21);
    v83 = v14;

    v22 = objc_loadWeakRetained(&to);
    v90 = 0;
    objc_msgSend_executeFetchRequest_error_(v22, v23, (uint64_t)v14, (uint64_t)&v90, v24);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v90;

    if (v25)
    {
      FlexLogForCategory(3uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_20D029EB4();

      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v32 = v25;
      v33 = *(NSObject **)(v31 + 40);
      *(_QWORD *)(v31 + 40) = v32;
    }
    else if (objc_msgSend_count(v82, v26, v27, v28, v29))
    {
      objc_msgSend_firstObject(v82, v34, v35, v36, v37);
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_songData(*(void **)(a1 + 32), v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      objc_msgSend_allKeys(v42, v43, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v86, (uint64_t)v96, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v87;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v87 != v53)
              objc_enumerationMutation(v47);
            v55 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v42, v49, v55, v50, v51);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setValue_forKey_(v33, v57, (uint64_t)v56, v55, v58);

          }
          v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v49, (uint64_t)&v86, (uint64_t)v96, 16);
        }
        while (v52);
      }

    }
    else
    {
      FlexLogForCategory(3uLL);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_20D029F14();
    }

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v59 = objc_loadWeakRetained(&to);
    hasChanges = objc_msgSend_hasChanges(v59, v60, v61, v62, v63);

    if (hasChanges)
    {
      v65 = objc_loadWeakRetained(&to);
      v66 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v66 + 40);
      v70 = objc_msgSend_save_(v65, v67, (uint64_t)&obj, v68, v69);
      objc_storeStrong((id *)(v66 + 40), obj);

      if (!v70)
      {
        FlexLogForCategory(3uLL);
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localizedDescription(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v72, v73, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localizedRecoverySuggestion(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v77, v78, v79, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v93 = v76;
          v94 = 2112;
          v95 = v81;
          _os_log_impl(&dword_20D016000, v71, OS_LOG_TYPE_DEFAULT, "Error updating database\n%@\n%@", buf, 0x16u);

        }
        goto LABEL_26;
      }
    }
    else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      goto LABEL_26;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_26:

  objc_destroyWeak(&to);
}

void sub_20D029264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D029428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20D02945C(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int hasChanges;
  id v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id to;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  objc_copyWeak(&to, (id *)(a1 + 64));
  v2 = objc_alloc(MEMORY[0x24BDD1880]);
  v9 = (void *)objc_msgSend_initWithUUIDString_(v2, v3, *(_QWORD *)(a1 + 32), v4, v5);
  if (v9)
  {
    objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v6, (uint64_t)CFSTR("LocalSongs"), v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v11, (uint64_t)CFSTR("uuid == %@"), v12, v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPredicate_(v10, v15, (uint64_t)v14, v16, v17);

    v18 = objc_loadWeakRetained(&to);
    v70 = 0;
    objc_msgSend_executeFetchRequest_error_(v18, v19, (uint64_t)v10, (uint64_t)&v70, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v70;

    if (v22)
    {
      FlexLogForCategory(3uLL);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_20D029EB4();

      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v29 = v22;
      v30 = *(NSObject **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v29;
    }
    else if (objc_msgSend_count(v21, v23, v24, v25, v26))
    {
      objc_msgSend_firstObject(v21, v31, v32, v33, v34);
      v30 = objc_claimAutoreleasedReturnValue();
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v35 = *(id *)(a1 + 40);
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v66, (uint64_t)v76, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v67;
        do
        {
          v41 = 0;
          do
          {
            if (*(_QWORD *)v67 != v40)
              objc_enumerationMutation(v35);
            objc_msgSend_setValue_forKey_(v30, v37, 0, *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v41++), v38);
          }
          while (v39 != v41);
          v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v66, (uint64_t)v76, 16);
        }
        while (v39);
      }

    }
    else
    {
      FlexLogForCategory(3uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_20D029F14();
    }

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v42 = objc_loadWeakRetained(&to);
    hasChanges = objc_msgSend_hasChanges(v42, v43, v44, v45, v46);

    if (hasChanges)
    {
      v48 = objc_loadWeakRetained(&to);
      v49 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v49 + 40);
      v53 = objc_msgSend_save_(v48, v50, (uint64_t)&obj, v51, v52);
      objc_storeStrong((id *)(v49 + 40), obj);

      if (!v53)
      {
        FlexLogForCategory(3uLL);
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localizedDescription(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v55, v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localizedRecoverySuggestion(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v60, v61, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v73 = v59;
          v74 = 2112;
          v75 = v64;
          _os_log_impl(&dword_20D016000, v54, OS_LOG_TYPE_DEFAULT, "Error updating database\n%@\n%@", buf, 0x16u);

        }
        goto LABEL_26;
      }
    }
    else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      goto LABEL_26;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
LABEL_26:

  objc_destroyWeak(&to);
}

void sub_20D0297E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D029914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D02992C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v46 = 0;
  objc_msgSend_executeFetchRequest_error_(v7, a2, v6, (uint64_t)&v46, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v46;
  if (objc_msgSend_count(v8, v10, v11, v12, v13))
  {
    objc_msgSend_firstObject(v8, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(v18, v19, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

  }
  else if (v8)
  {
    if (!objc_msgSend_count(v8, v14, v15, v16, v17))
    {
      objc_msgSend_distantPast(MEMORY[0x24BDBCE60], v26, v27, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v32 = *(void **)(v31 + 40);
      *(_QWORD *)(v31 + 40) = v30;

      objc_msgSend__insertFirstCloudCheckDate_andSave_(*(void **)(a1 + 32), v33, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 1, v34);
    }
  }
  else
  {
    FlexLogForCategory(0);
    v35 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
      sub_20D029F78(v9, v35, v36, v37, v38);

    objc_msgSend_distantPast(MEMORY[0x24BDBCE60], v39, v40, v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v45 = *(void **)(v44 + 40);
    *(_QWORD *)(v44 + 40) = v43;

  }
}

void sub_20D029B28(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v40 = 0;
  objc_msgSend_executeFetchRequest_error_(v7, a2, v6, (uint64_t)&v40, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v40;
  if (objc_msgSend_count(v8, v10, v11, v12, v13))
  {
    objc_msgSend_firstObject(v8, v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDate_(v18, v19, *(_QWORD *)(a1 + 48), v20, v21);
LABEL_3:

    goto LABEL_6;
  }
  if (!v8)
  {
    FlexLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_20D029F78(v9, (const char *)v18, v36, v37, v38);
    goto LABEL_3;
  }
  objc_msgSend__insertFirstCloudCheckDate_andSave_(*(void **)(a1 + 32), v14, *(_QWORD *)(a1 + 48), 0, v17);
LABEL_6:
  if (objc_msgSend_hasChanges(*(void **)(*(_QWORD *)(a1 + 32) + 24), v22, v23, v24, v25))
  {
    v29 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v39 = 0;
    v30 = objc_msgSend_save_(v29, v26, (uint64_t)&v39, v27, v28);
    v31 = v39;
    if ((v30 & 1) == 0)
    {
      FlexLogForCategory(0);
      v32 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        sub_20D029FF0(v31, v32, v33, v34, v35);

    }
  }

}

void sub_20D029D6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20D029D80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_20D029D8C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_20D029DD8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D029DC4();
  sub_20D029D6C(&dword_20D016000, v6, v7, "Error fetching song records:\n%@", v8, v9, v10, v11, v12);

  sub_20D029DA0();
}

void sub_20D029E50()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_20D029DC4();
  sub_20D029D80(&dword_20D016000, v0, v1, "Song with UID %@ already present in database, new record not saved", v2);
  sub_20D029DD0();
}

void sub_20D029EB4()
{
  uint64_t v0;
  os_log_t v1;

  sub_20D029DAC();
  sub_20D029D8C(&dword_20D016000, v0, v1, "Error fetching record for UID %@\n%@");
  sub_20D029DD0();
}

void sub_20D029F14()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_20D029DC4();
  sub_20D029D80(&dword_20D016000, v0, v1, "No song record found for UID %@. No database update performed.", v2);
  sub_20D029DD0();
}

void sub_20D029F78(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D029DC4();
  sub_20D029D6C(&dword_20D016000, v6, v7, "Failed to execute date fetch request\n%@", v8, v9, v10, v11, v12);

  sub_20D029DA0();
}

void sub_20D029FF0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D029DC4();
  sub_20D029D6C(&dword_20D016000, v6, v7, "Error saving last cloud check date to database.\n%@", v8, v9, v10, v11, v12);

  sub_20D029DA0();
}

BOOL sub_20D02A52C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_refreshState(a1, a2, a3, a4, a5);
  return (unint64_t)objc_msgSend_state(a1, v6, v7, v8, v9) > 1;
}

BOOL sub_20D02A55C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString **v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BOOL8 v77;

  v4 = a3;
  objc_msgSend_attributes(a1, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)CFSTR("uuid"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  FlexDynamicCast(v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  objc_msgSend_objectForKeyedSubscript_(v9, v17, (uint64_t)CFSTR("FMAssetType"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  FlexDynamicCast(v16, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqualToString_(v21, v22, (uint64_t)CFSTR("SongBundle"), v23, v24) & 1) != 0)
  {
    v28 = FMSongBundleAssetID;
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v21, v25, (uint64_t)CFSTR("Artwork"), v26, v27))
    {
LABEL_10:
      v77 = 0;
      goto LABEL_15;
    }
    v28 = FMSongArtworkAssetID;
  }
  v29 = *v28;
  if (!v29)
    goto LABEL_10;
  v30 = v29;
  v31 = objc_opt_class();
  objc_msgSend_objectForKeyedSubscript_(v9, v32, (uint64_t)CFSTR("_ContentVersion"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  FlexDynamicCast(v31, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_integerValue(v36, v37, v38, v39, v40);

  v42 = objc_opt_class();
  objc_msgSend_objectForKeyedSubscript_(v9, v43, (uint64_t)CFSTR("_CompatibilityVersion"), v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  FlexDynamicCast(v42, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_integerValue(v47, v48, v49, v50, v51);

  objc_msgSend_songUID(v4, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v57, v58, (uint64_t)v15, v59, v60))
  {
    objc_msgSend_assetID(v4, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend_isEqualToString_(v65, v66, (uint64_t)v30, v67, v68)
       && objc_msgSend_contentVersion(v4, v69, v70, v71, v72) == v41
       && objc_msgSend_compatibilityVersion(v4, v73, v74, v75, v76) == v52;

  }
  else
  {
    v77 = 0;
  }

LABEL_15:
  return v77;
}

void sub_20D02AE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D02AE70(uint64_t a1, int a2)
{
  _DWORD *WeakRetained;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained[28] == a2 || WeakRetained[29] == a2)
  {
    v7 = WeakRetained;
    objc_msgSend_fetchAllSongsWithCompletion_(WeakRetained, v4, (uint64_t)&unk_24C5EFBE8, v5, v6);
    WeakRetained = v7;
  }

}

void sub_20D02B754(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_20D02B770(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void **WeakRetained;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v3 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend_attributes(v3, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("_CompatibilityVersion"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_integerValue(v13, v14, v15, v16, v17);

    if (objc_msgSend_isEqualToString_(WeakRetained[5], v19, (uint64_t)CFSTR("Ph"), v20, v21))
      v25 = (unint64_t)(v18 - 1) >= 2;
    else
      v25 = 1;
    if (v25)
    {
      objc_msgSend_objectForKeyedSubscript_(v9, v22, (uint64_t)CFSTR("uuid"), v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(*(void **)(a1 + 32), v27, (uint64_t)v26, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v30;
      if (v30)
      {
        objc_msgSend_attributes(v30, v31, v32, v33, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend_objectForKeyedSubscript_(v36, v38, (uint64_t)CFSTR("clientIDs"), v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithArray_(v37, v42, (uint64_t)v41, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = objc_msgSend_containsObject_(v45, v46, (uint64_t)WeakRetained[5], v47, v48);
      }
      else
      {
        v49 = 0;
      }

    }
    else
    {
      v49 = 1;
    }

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

void sub_20D02B928(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;

  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], a2, (uint64_t)CFSTR("%K <= %d"), a4, a5, CFSTR("_CompatibilityVersion"), 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_2549A19A0;
  qword_2549A19A0 = v5;

}

uint64_t sub_20D02BDCC(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t isEqualToString;

  v3 = a2;
  objc_msgSend_stringByDeletingPathExtension(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsString_(v8, v9, *(_QWORD *)(a1 + 32), v10, v11))
  {
    objc_msgSend_pathExtension(v3, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)CFSTR("smsbundle"), v18, v19);

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

uint64_t sub_20D02C0FC(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t isEqualToString;

  v3 = a2;
  objc_msgSend_stringByDeletingPathExtension(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsString_(v8, v9, *(_QWORD *)(a1 + 32), v10, v11))
  {
    objc_msgSend_pathExtension(v3, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)CFSTR("jpg"), v18, v19);

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

void sub_20D02C5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D02C5F0(void **a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[8];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend_allObjects(a1[4], v2, v3, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithArray_(v7, v9, (uint64_t)v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDD1758];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_20D02C7E8;
    v35[3] = &unk_24C5F0308;
    v36 = a1[5];
    v37 = a1[6];
    objc_msgSend_predicateWithBlock_(v13, v14, (uint64_t)v35, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_filterUsingPredicate_(v12, v18, (uint64_t)v17, v19, v20);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = v12;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v31, (uint64_t)v39, 16);
    if (v23)
    {
      v28 = v23;
      v29 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v32 != v29)
            objc_enumerationMutation(v21);
          objc_msgSend_purgeSync(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i), v24, v25, v26, v27, (_QWORD)v31);
        }
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v31, (uint64_t)v39, 16);
      }
      while (v28);
    }

  }
  else
  {
    FlexLogForCategory(2uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v21, OS_LOG_TYPE_DEFAULT, "StrongSelf is nil in _newestContentSetFromAssets. Returning...", buf, 2u);
    }
  }

}

uint64_t sub_20D02C7E8(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int isEqualToString;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const __CFString *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t isPresent;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend_attributes(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("uuid");
  objc_msgSend_objectForKeyedSubscript_(v8, v10, (uint64_t)CFSTR("uuid"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsObject_(*(void **)(a1 + 32), v14, (uint64_t)v3, v15, v16) & 1) != 0)
  {
LABEL_15:
    if ((objc_msgSend_containsObject_(*(void **)(a1 + 40), v17, (uint64_t)v13, v18, v19) & 1) == 0)
    {
      isPresent = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v94 = a1;
    v95 = v8;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v20 = *(id *)(a1 + 32);
    v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v103, (uint64_t)v107, 16);
    if (v102)
    {
      v26 = *(_QWORD *)v104;
      v96 = v20;
      v100 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v102; ++i)
        {
          if (*(_QWORD *)v104 != v26)
            objc_enumerationMutation(v20);
          v28 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
          objc_msgSend_attributes(v28, v22, v23, v24, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)v9, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v13, v35, v36);

          if (isEqualToString)
          {
            objc_msgSend_attributes(v28, v22, v23, v24, v25);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v101, v38, (uint64_t)CFSTR("_ContentVersion"), v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend_integerValue(v41, v42, v43, v44, v45);
            objc_msgSend_attributes(v3, v47, v48, v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v51, v52, (uint64_t)CFSTR("_ContentVersion"), v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46 == objc_msgSend_integerValue(v55, v56, v57, v58, v59))
            {
              objc_msgSend_attributes(v28, v60, v61, v62, v63);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v98, v64, (uint64_t)CFSTR("_CompatibilityVersion"), v65, v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = objc_msgSend_integerValue(v67, v68, v69, v70, v71);
              objc_msgSend_attributes(v3, v72, v73, v74, v75);
              v76 = v13;
              v77 = v3;
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v78, v79, (uint64_t)CFSTR("_CompatibilityVersion"), v80, v81);
              v82 = v9;
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = objc_msgSend_integerValue(v83, v84, v85, v86, v87);

              v9 = v82;
              v3 = v77;
              v13 = v76;
              v20 = v96;

              v26 = v100;
              if (v99 == v97)
              {

                a1 = v94;
                v8 = v95;
                goto LABEL_15;
              }
            }
            else
            {

              v26 = v100;
            }
          }
        }
        v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v103, (uint64_t)v107, 16);
      }
      while (v102);
    }

    v8 = v95;
  }
  isPresent = objc_msgSend_isPresent(v3, v88, v89, v90, v91);
LABEL_18:

  return isPresent;
}

void sub_20D02CBDC(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  id v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[2];
  _QWORD v90[2];
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  FlexLogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__mobileAssetDownloadResultStringValue_(*(void **)(a1 + 32), v5, a2, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v93 = v8;
    _os_log_impl(&dword_20D016000, v4, OS_LOG_TYPE_DEFAULT, "Completed catalog download with MADownloadResult: %@", buf, 0xCu);

  }
  v15 = objc_msgSend__responseForDownloadResult_(*(void **)(a1 + 32), v9, a2, v10, v11);
  switch(v15)
  {
    case 0:
    case 2:
      objc_msgSend__mobileAssetsForAssetType_andUIDs_(*(void **)(a1 + 32), v12, (uint64_t)CFSTR("SongBundle"), 0, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set(MEMORY[0x24BDBCEF0], v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v22 = v16;
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v85, (uint64_t)v91, 16);
      if (v24)
      {
        v29 = v24;
        v30 = *(_QWORD *)v86;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v86 != v30)
              objc_enumerationMutation(v22);
            v32 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
            objc_msgSend_attributes(v32, v25, v26, v27, v28);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)CFSTR("uuid"), v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend_attributes(v32, v38, v39, v40, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)CFSTR("uuid"), v44, v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v21, v47, (uint64_t)v46, v48, v49);

            }
          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v85, (uint64_t)v91, 16);
        }
        while (v29);
      }

      objc_msgSend__metadataMappingForUUIDSet_(*(void **)(a1 + 32), v50, (uint64_t)v21, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(*(void **)(a1 + 32), v54, (uint64_t)v22, (uint64_t)v53, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (id)objc_msgSend__processResults_metadataMapping_(*(void **)(a1 + 32), v57, (uint64_t)v56, (uint64_t)v53, v58);
      v60 = *(_QWORD *)(a1 + 40);
      objc_msgSend_cloudManagedSongs(*(void **)(a1 + 32), v61, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v60 + 16))(v60, v65, 0);

      objc_msgSend__mobileAssetsForAssetType_andUIDs_(*(void **)(a1 + 32), v66, (uint64_t)CFSTR("Artwork"), 0, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__newestContentSetFromAssets_metadataMapping_(*(void **)(a1 + 32), v69, (uint64_t)v68, (uint64_t)v53, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_filterByClientIDForAssets_forMetadataMapping_(*(void **)(a1 + 32), v72, (uint64_t)v71, (uint64_t)v53, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = (id)objc_msgSend__processResults_metadataMapping_(*(void **)(a1 + 32), v75, (uint64_t)v74, (uint64_t)v53, v76);
      goto LABEL_17;
    case 1:
    case 3:
      objc_msgSend__mobileAssetDownloadResultStringValue_(*(void **)(a1 + 32), v12, a2, v13, v14);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v78, (uint64_t)CFSTR("An error occurred while downloading the Mobile Assets catalog: %@"), v79, v80, v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      FlexLogForCategory(2uLL);
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v93 = v21;
        _os_log_impl(&dword_20D016000, v81, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v82 = *MEMORY[0x24BDD0FD8];
      v89[0] = *MEMORY[0x24BDD0FC8];
      v89[1] = v82;
      v90[0] = v21;
      v90[1] = v22;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v83, (uint64_t)v90, (uint64_t)v89, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v84, (uint64_t)CFSTR("com.apple.FlexMusicKit"), v15, (uint64_t)v53);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_17:

      break;
    default:
      return;
  }
}

void sub_20D02EADC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20D02EB14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  objc_msgSend_attributes(a2, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("_ContentVersion"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attributes(v4, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("_ContentVersion"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_compare_(v13, v23, (uint64_t)v22, v24, v25);

  return v26;
}

void sub_20D02F360(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__runNextAsyncAssetDownloadAndPurge(WeakRetained, v2, v3, v4, v5);
  }
  else
  {
    FlexLogForCategory(2uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20D016000, v7, OS_LOG_TYPE_DEFAULT, "FlexMobileAssetManagerV2 is nil from _dispatchNextAsyncAssetDownloadAndPurge:", v8, 2u);
    }

  }
}

void sub_20D02F5A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D02F7A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D02F9AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D02FD38(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *WeakRetained;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char isEqualToString;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString **v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend_assetID(*(void **)(a1 + 32), v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("FMSongBundleAssetID"), v9, v10);

    if ((isEqualToString & 1) != 0)
    {
      v16 = FlexMobileAssetPropertySongBundle;
    }
    else
    {
      objc_msgSend_assetID(*(void **)(a1 + 32), v12, v13, v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)CFSTR("FMSongArtworkAssetID"), v20, v21);

      if (!v22)
      {
        v17 = 0;
        goto LABEL_15;
      }
      v16 = FlexMobileAssetPropertyArtwork;
    }
    v17 = *v16;
    if (v17)
    {
      v27 = *(void **)(a1 + 40);
      objc_msgSend_uid(*(void **)(a1 + 48), v23, v24, v25, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v28;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v29, (uint64_t)v72, 1, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__mobileAssetsForAssetType_andUIDs_(v27, v32, (uint64_t)v17, (uint64_t)v31, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_assetWithNewestContentVersionInAssets_preferInstalled_(FlexMobileAssetManagerV2, v35, (uint64_t)v34, 0, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        if (objc_msgSend_isPresent(v37, v38, v39, v40, v41))
        {
          FlexLogForCategory(2uLL);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = *(_QWORD *)(a1 + 56);
            v70 = 138412290;
            v71 = v46;
            _os_log_impl(&dword_20D016000, v45, OS_LOG_TYPE_DEFAULT, "Not downloading %@ because mobile asset is alredy installed.", (uint8_t *)&v70, 0xCu);
          }

        }
        else if ((objc_msgSend__isDownloadingAsset_(*(void **)(a1 + 40), v42, *(_QWORD *)(a1 + 32), v43, v44) & 1) == 0)
        {
          v49 = WeakRetained[7];
          objc_sync_enter(v49);
          objc_msgSend_addObject_(WeakRetained[9], v50, (uint64_t)v37, v51, v52);
          objc_msgSend_setObject_forKey_(WeakRetained[11], v53, *(_QWORD *)(a1 + 64), (uint64_t)v37, v54);
          if (objc_msgSend_containsObject_(WeakRetained[12], v55, (uint64_t)v37, v56, v57))
            objc_msgSend_removeObject_(WeakRetained[12], v58, (uint64_t)v37, v59, v60);
          if (objc_msgSend_containsObject_(WeakRetained[13], v58, (uint64_t)v37, v59, v60))
            objc_msgSend_removeObject_(WeakRetained[13], v61, (uint64_t)v37, v62, v63);
          objc_sync_exit(v49);

          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 48), v64, *(_QWORD *)(a1 + 32), 0, v65, 0.01);
          objc_msgSend__dispatchNextAsyncAssetDownloadAndPurge(WeakRetained, v66, v67, v68, v69);
        }
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_15:
    FlexLogForCategory(2uLL);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = *(_QWORD *)(a1 + 56);
      v70 = 138412290;
      v71 = v48;
      _os_log_impl(&dword_20D016000, v47, OS_LOG_TYPE_DEFAULT, "Not downloading %@ because no mobile asset exists.", (uint8_t *)&v70, 0xCu);
    }

    v37 = 0;
    goto LABEL_18;
  }
  FlexLogForCategory(2uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v70) = 0;
    _os_log_impl(&dword_20D016000, v17, OS_LOG_TYPE_DEFAULT, "FlexMobileAssetManagerV2 is nil from _dispatchNextAsyncAssetDownloadAndPurge:", (uint8_t *)&v70, 2u);
  }
LABEL_19:

}

void sub_20D03007C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D03059C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D0305D8(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  if (objc_msgSend_totalExpected(v19, v3, v4, v5, v6) < 1)
  {
    objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 32), v7, *(_QWORD *)(a1 + 40), 0, v10, 0.01);
  }
  else
  {
    v11 = (double)objc_msgSend_totalWritten(v19, v7, v8, v9, v10);
    v16 = v11 / (double)objc_msgSend_totalExpected(v19, v12, v13, v14, v15);
    objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 32), v17, *(_QWORD *)(a1 + 40), 0, v18, v16);
  }

}

void sub_20D030650(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
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
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD v108[2];
  _QWORD v109[2];
  uint8_t buf[4];
  uint64_t v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  FlexLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v6)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend__mobileAssetDownloadResultStringValue_(*(void **)(a1 + 48), v7, a2, v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v111 = v11;
      v112 = 2112;
      v113 = v10;
      v114 = 2112;
      v115 = (uint64_t)v12;
      _os_log_impl(&dword_20D016000, v5, OS_LOG_TYPE_DEFAULT, "Ending download task for UID: %@ assetID: %@. MADownloadResult: %@", buf, 0x20u);

    }
    v16 = objc_msgSend__responseForDownloadResult_(WeakRetained, v13, a2, v14, v15);
    switch(v16)
    {
      case 0:
      case 2:
        v17 = WeakRetained[7];
        objc_sync_enter(v17);
        v21 = objc_msgSend_containsObject_(WeakRetained[10], v18, *(_QWORD *)(a1 + 56), v19, v20);
        objc_sync_exit(v17);

        if (v21)
        {
          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v22, *(_QWORD *)(a1 + 72), 0, v23, 1.0);
          objc_msgSend_refreshState(*(void **)(a1 + 56), v24, v25, v26, v27);
          v28 = WeakRetained[7];
          objc_sync_enter(v28);
          objc_msgSend_removeObject_(WeakRetained[10], v29, *(_QWORD *)(a1 + 56), v30, v31);
          objc_msgSend_removeObjectForKey_(WeakRetained[11], v32, *(_QWORD *)(a1 + 56), v33, v34);
          objc_sync_exit(v28);

          objc_msgSend_setWithObject_(MEMORY[0x24BDBCF20], v35, *(_QWORD *)(a1 + 32), v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__metadataMappingForUUIDSet_(WeakRetained, v39, (uint64_t)v38, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectForKey_(v42, v43, *(_QWORD *)(a1 + 32), v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__updateExistingSong_usingAsset_metadataAsset_(WeakRetained, v47, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), (uint64_t)v46);

        }
        else
        {
          FlexLogForCategory(2uLL);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v67 = *(_QWORD *)(a1 + 32);
            v68 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v111 = v67;
            v112 = 2112;
            v113 = v68;
            _os_log_impl(&dword_20D016000, v66, OS_LOG_TYPE_DEFAULT, "Cancel request after downloading, purging %@ %@", buf, 0x16u);
          }

          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v69, *(_QWORD *)(a1 + 72), 0, v70, -1.0);
          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v71, *(_QWORD *)(a1 + 72), 0, v72, 0.0);
          v73 = WeakRetained[7];
          objc_sync_enter(v73);
          objc_msgSend_addObject_(WeakRetained[12], v74, *(_QWORD *)(a1 + 56), v75, v76);
          objc_msgSend_removeObject_(WeakRetained[10], v77, *(_QWORD *)(a1 + 56), v78, v79);
          objc_msgSend_removeObjectForKey_(WeakRetained[11], v80, *(_QWORD *)(a1 + 56), v81, v82);
          objc_sync_exit(v73);

        }
        v83 = 1;
        goto LABEL_26;
      case 1:
      case 3:
        v48 = WeakRetained[7];
        objc_sync_enter(v48);
        if (objc_msgSend_containsObject_(WeakRetained[10], v49, *(_QWORD *)(a1 + 56), v50, v51))
        {
          FlexLogForCategory(2uLL);
          v52 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          v53 = *(_QWORD *)(a1 + 32);
          v54 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          v111 = v53;
          v112 = 2112;
          v113 = v54;
          v114 = 2048;
          v115 = v16;
          v55 = "Asset download failed when attempting to download asset %@ %@ - %lu";
          v56 = v52;
          v57 = 32;
        }
        else
        {
          FlexLogForCategory(2uLL);
          v52 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          v58 = *(_QWORD *)(a1 + 32);
          v59 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v111 = v58;
          v112 = 2112;
          v113 = v59;
          v55 = "Asset download canceled %@ %@";
          v56 = v52;
          v57 = 22;
        }
        _os_log_impl(&dword_20D016000, v56, OS_LOG_TYPE_DEFAULT, v55, buf, v57);
LABEL_16:

        objc_msgSend_removeObjectForKey_(WeakRetained[11], v60, *(_QWORD *)(a1 + 56), v61, v62);
        objc_sync_exit(v48);

        if (a2 == 10)
        {
          if (objc_msgSend_containsObject_(WeakRetained[13], v63, *(_QWORD *)(a1 + 56), v64, v65))
            goto LABEL_18;
        }
        else if (a2 == 48)
        {
LABEL_18:
          objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v63, *(_QWORD *)(a1 + 72), 0, v65, 0.0);
          goto LABEL_25;
        }
        v84 = *MEMORY[0x24BDD0FD8];
        v108[0] = *MEMORY[0x24BDD0FC8];
        v108[1] = v84;
        v109[0] = CFSTR("Download operation was unsuccessful.");
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v63, (uint64_t)CFSTR("MobileAsset error %li"), v64, v65, a2);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v109[1] = v85;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v86, (uint64_t)v109, (uint64_t)v108, 2);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v88, (uint64_t)CFSTR("com.apple.FlexMusicKit"), a2, (uint64_t)v87);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v90, *(_QWORD *)(a1 + 72), (uint64_t)v89, v91, -1.0);
        objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 64), v92, *(_QWORD *)(a1 + 72), 0, v93, 0.0);

LABEL_25:
        v83 = 0;
LABEL_26:
        FlexLogForCategory(2uLL);
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          v95 = *(_QWORD *)(a1 + 32);
          v96 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v111 = v95;
          v112 = 2112;
          v113 = v96;
          _os_log_impl(&dword_20D016000, v94, OS_LOG_TYPE_DEFAULT, "Completed processing of %@ %@", buf, 0x16u);
        }

        if ((v83 & 1) == 0)
        {
          v101 = WeakRetained[7];
          objc_sync_enter(v101);
          objc_msgSend_removeObject_(WeakRetained[10], v102, *(_QWORD *)(a1 + 56), v103, v104);
          objc_msgSend_removeObjectForKey_(WeakRetained[11], v105, *(_QWORD *)(a1 + 56), v106, v107);
          objc_sync_exit(v101);

        }
        objc_msgSend__dispatchNextAsyncAssetDownloadAndPurge(WeakRetained, v97, v98, v99, v100);
        break;
      default:
        goto LABEL_25;
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v5, OS_LOG_TYPE_DEFAULT, "attempted to download but no cloud manager", buf, 2u);
    }

  }
}

void sub_20D030C98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D031130(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D03116C(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  FlexLogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend__mobileAssetCancelDownloadResultStringValue_(*(void **)(a1 + 48), v6, a2, v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v9;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_20D016000, v4, OS_LOG_TYPE_DEFAULT, "Cancel download failed for mobile asset with songUID: %@ assetID: %@ MACancelDownloadResult: %@", buf, 0x20u);

    }
    if (a2 != 3)
    {
      v15 = *MEMORY[0x24BDD0FD8];
      v29[0] = *MEMORY[0x24BDD0FC8];
      v29[1] = v15;
      v30[0] = CFSTR("Cancel operation was unsuccessful.");
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("MobileAsset error %li"), v13, v14, a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v16;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)v30, (uint64_t)v29, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("com.apple.FlexMusicKit"), a2, (uint64_t)v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 56), v21, *(_QWORD *)(a1 + 64), (uint64_t)v20, v22, -1.0);
      objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 56), v23, *(_QWORD *)(a1 + 64), 0, v24, 0.0);

      return;
    }
  }
  else
  {
    if (v5)
    {
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_20D016000, v4, OS_LOG_TYPE_DEFAULT, "Cancel download success for mobile asset with songUID: %@ assetID: %@ ", buf, 0x16u);
    }

  }
  objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 56), v12, *(_QWORD *)(a1 + 64), 0, v14, -1.0);
  objc_msgSend_updateAsset_downloadProgress_error_(*(void **)(a1 + 56), v27, *(_QWORD *)(a1 + 64), 0, v28, 0.0);
}

void sub_20D031574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D031718(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  FlexMobileAssetV2SongAsset *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  id v168;
  const char *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t i;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  NSObject *v193;
  const char *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  id v199;
  uint64_t v200;
  void *j;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  id v209;
  const char *v210;
  id v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  NSObject *v215;
  __int16 v216;
  FlexSongProxy *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  _QWORD block[5];
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  _BYTE v235[128];
  _BYTE v236[128];
  uint64_t v237;
  uint8_t buf[4];
  void *v239;
  __int16 v240;
  uint64_t v241;
  __int16 v242;
  void *v243;
  void *v244;
  _QWORD v245[2];
  void *v246;
  _QWORD v247[5];

  v247[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[7];
    objc_sync_enter(v4);
    if ((objc_msgSend_containsObject_(*(void **)(v3 + 104), v5, *(_QWORD *)(a1 + 32), v6, v7) & 1) != 0)
    {
      objc_sync_exit(v4);

      if (!objc_msgSend_isPresent(*(void **)(a1 + 32), v12, v13, v14, v15))
      {
LABEL_54:
        v211 = *(id *)(v3 + 56);
        objc_sync_enter(v211);
        objc_msgSend_removeObject_(*(void **)(v3 + 104), v212, *(_QWORD *)(a1 + 32), v213, v214);
        objc_sync_exit(v211);

        v215 = *(NSObject **)(v3 + 144);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_20D031F90;
        block[3] = &unk_24C5EFCC8;
        block[4] = v3;
        dispatch_async(v215, block);
        goto LABEL_55;
      }
      v19 = (void **)(a1 + 48);
      objc_msgSend_existingAssetWithID_(*(void **)(a1 + 40), v16, *(_QWORD *)(a1 + 48), v17, v18);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(*(void **)(a1 + 48), v20, (uint64_t)CFSTR("FMSongBundleAssetID"), v21, v22))objc_msgSend_existingAssetWithID_(*(void **)(a1 + 40), v23, (uint64_t)CFSTR("FMSongArtworkAssetID"), v24, v25);
      else
        objc_msgSend_existingAssetWithID_(*(void **)(a1 + 40), v23, (uint64_t)CFSTR("FMSongBundleAssetID"), v24, v25);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = [FlexMobileAssetV2SongAsset alloc];
      v27 = *v19;
      v32 = objc_msgSend_contentVersion(v225, v28, v29, v30, v31);
      v37 = objc_msgSend_compatibilityVersion(v225, v33, v34, v35, v36);
      v223 = (void *)objc_msgSend_initWithAssetID_localURL_cloudManager_contentVersion_compatibilityVersion_(v26, v38, (uint64_t)v27, 0, v3, v32, v37);
      if (objc_msgSend_isEqualToString_(*v19, v39, (uint64_t)CFSTR("FMSongBundleAssetID"), v40, v41))
      {
        v217 = [FlexSongProxy alloc];
        objc_msgSend_uid(*(void **)(a1 + 40), v45, v46, v47, v48);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_songName(*(void **)(a1 + 40), v49, v50, v51, v52);
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_artistName(*(void **)(a1 + 40), v53, v54, v55, v56);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tagIDs(*(void **)(a1 + 40), v57, v58, v59, v60);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_keywords(*(void **)(a1 + 40), v61, v62, v63, v64);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_weightedKeywords(*(void **)(a1 + 40), v65, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend_hidden(*(void **)(a1 + 40), v70, v71, v72, v73);
        v81 = objc_msgSend_recalled(*(void **)(a1 + 40), v75, v76, v77, v78);
        if (v224)
        {
          v247[0] = v224;
          v247[1] = v223;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v79, (uint64_t)v247, 2, v80);
          v82 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v246 = v223;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v79, (uint64_t)&v246, 1, v80);
          v82 = objc_claimAutoreleasedReturnValue();
        }
        v97 = (void *)v82;
        objc_msgSend_audioEncoderPresetName(*(void **)(a1 + 40), v83, v84, v85, v86);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend_metadataVersion(*(void **)(a1 + 40), v99, v100, v101, v102);
        objc_msgSend_songFormat(*(void **)(a1 + 40), v104, v105, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        HIBYTE(v216) = v81;
        LOBYTE(v216) = v74;
        v110 = (void *)objc_msgSend_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_assets_audioEncoderPresetName_metadataVersion_songFormat_(v217, v109, (uint64_t)v221, (uint64_t)v222, (uint64_t)v220, v219, v218, v69, v216, v97, v98, v103, v108);

        objc_msgSend_updateBackend_(*(void **)(a1 + 40), v111, (uint64_t)v110, v112, v113);
        objc_msgSend_uid(*(void **)(a1 + 40), v114, v115, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__loadBundledSongForSongID_((void *)v3, v119, (uint64_t)v118, v120, v121);

      }
      else
      {
        if (!objc_msgSend_isEqualToString_(*(void **)(a1 + 48), v42, (uint64_t)CFSTR("FMSongArtworkAssetID"), v43, v44))goto LABEL_22;
        v92 = *(void **)(a1 + 40);
        if (v224)
        {
          v245[0] = v224;
          v245[1] = v223;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v88, (uint64_t)v245, 2, v91);
          v93 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v244 = v223;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v88, (uint64_t)&v244, 1, v91);
          v93 = objc_claimAutoreleasedReturnValue();
        }
        v122 = (void *)v93;
        objc_msgSend_updateAssets_(v92, v94, v93, v95, v96);

        objc_msgSend_uid(*(void **)(a1 + 40), v123, v124, v125, v126);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__loadBundledArtworkForSongID_((void *)v3, v127, (uint64_t)v110, v128, v129);
      }

LABEL_22:
      v134 = objc_msgSend_purgeSync(*(void **)(a1 + 32), v88, v89, v90, v91);
      if (v134)
      {
        FlexLogForCategory(2uLL);
        v135 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_uid(*(void **)(a1 + 40), v136, v137, v138, v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v141 = *(_QWORD *)(a1 + 48);
          objc_msgSend__mobileAssetPurgeResultStringValue_((void *)v3, v142, v134, v143, v144);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v239 = v140;
          v240 = 2112;
          v241 = v141;
          v242 = 2112;
          v243 = v145;
          _os_log_impl(&dword_20D016000, v135, OS_LOG_TYPE_DEFAULT, "purge failed for %@ %@ error: %@", buf, 0x20u);

        }
      }
      v150 = objc_msgSend_state(*(void **)(a1 + 32), v130, v131, v132, v133);
      v151 = *(void **)(a1 + 32);
      if (v150 == 3)
      {
        objc_msgSend_attributes(v151, v146, v147, v148, v149);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v152, v153, (uint64_t)CFSTR("FMAssetType"), v154, v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        v237 = *(_QWORD *)(a1 + 56);
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v157, (uint64_t)&v237, 1, v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__mobileAssetsForAssetType_andUIDs_((void *)v3, v160, (uint64_t)v156, (uint64_t)v159, v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_set(MEMORY[0x24BDBCEF0], v163, v164, v165, v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v233 = 0u;
        v234 = 0u;
        v231 = 0u;
        v232 = 0u;
        v168 = v162;
        v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v169, (uint64_t)&v231, (uint64_t)v236, 16);
        if (v174)
        {
          v175 = *(_QWORD *)v232;
          do
          {
            for (i = 0; i != v174; ++i)
            {
              if (*(_QWORD *)v232 != v175)
                objc_enumerationMutation(v168);
              objc_msgSend_attributes(*(void **)(*((_QWORD *)&v231 + 1) + 8 * i), v170, v171, v172, v173);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v177, v178, (uint64_t)CFSTR("uuid"), v179, v180);
              v181 = (void *)objc_claimAutoreleasedReturnValue();

              if (v181)
                objc_msgSend_addObject_(v167, v182, (uint64_t)v181, v183, v184);

            }
            v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v170, (uint64_t)&v231, (uint64_t)v236, 16);
          }
          while (v174);
        }

        objc_msgSend__metadataMappingForUUIDSet_((void *)v3, v185, (uint64_t)v167, v186, v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v188, v189, *(_QWORD *)(a1 + 56), v190, v191);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        v229 = 0u;
        v230 = 0u;
        v227 = 0u;
        v228 = 0u;
        v193 = v168;
        v199 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v194, (uint64_t)&v227, (uint64_t)v235, 16);
        if (v199)
        {
          v200 = *(_QWORD *)v228;
          while (2)
          {
            for (j = 0; j != v199; j = (char *)j + 1)
            {
              if (*(_QWORD *)v228 != v200)
                objc_enumerationMutation(v193);
              v202 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend_state(v202, v195, v196, v197, v198) != 3)
              {
                v199 = v202;
                goto LABEL_49;
              }
            }
            v199 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v195, (uint64_t)&v227, (uint64_t)v235, 16);
            if (v199)
              continue;
            break;
          }
        }
LABEL_49:

        v209 = *(id *)(a1 + 64);
        objc_sync_enter(v209);
        if (v199)
          objc_msgSend__updateExistingSong_usingAsset_metadataAsset_forceUpdate_((void *)v3, v210, *(_QWORD *)(a1 + 40), (uint64_t)v199, (uint64_t)v192, 1);
        objc_sync_exit(v209);

      }
      else
      {
        if ((objc_msgSend_refreshState(v151, v146, v147, v148, v149) & 1) != 0)
        {
LABEL_53:

          goto LABEL_54;
        }
        FlexLogForCategory(2uLL);
        v193 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_uid(*(void **)(a1 + 40), v203, v204, v205, v206);
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          v208 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          v239 = v207;
          v240 = 2112;
          v241 = v208;
          _os_log_impl(&dword_20D016000, v193, OS_LOG_TYPE_DEFAULT, "refreshState failed for %@ %@", buf, 0x16u);

        }
      }

      goto LABEL_53;
    }
    objc_msgSend__dispatchNextAsyncAssetDownloadAndPurge((void *)v3, v8, v9, v10, v11);
    objc_sync_exit(v4);

  }
  else
  {
    FlexLogForCategory(2uLL);
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D016000, v87, OS_LOG_TYPE_DEFAULT, "attempted to purge but no cloud manager", buf, 2u);
    }

  }
LABEL_55:

}

void sub_20D031F64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20D031F90(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__runNextAsyncAssetDownloadAndPurge(*(void **)(a1 + 32), a2, a3, a4, a5);
}

void sub_20D0321C8(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  void *v64;
  __int16 v65;
  void *v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend_songUID(*(void **)(a1 + 40), v2, v3, v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = *(void **)(a1 + 48);
        v9 = *(_QWORD *)(a1 + 32);
        objc_msgSend_songUID(*(void **)(a1 + 40), v2, v3, v4, v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v10;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, (uint64_t)v67, 1, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__mobileAssetsForAssetType_andUIDs_(v8, v14, v9, (uint64_t)v13, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_assetWithNewestContentVersionInAssets_preferInstalled_(FlexMobileAssetManagerV2, v17, (uint64_t)v16, 1, v18);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          FlexLogForCategory(2uLL);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_songUID(*(void **)(a1 + 40), v20, v21, v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetID(*(void **)(a1 + 40), v25, v26, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = 138412546;
            v64 = v24;
            v65 = 2112;
            v66 = v29;
            _os_log_impl(&dword_20D016000, v19, OS_LOG_TYPE_DEFAULT, "cannot purge due to nil mobileAsset %@ %@", (uint8_t *)&v63, 0x16u);

          }
        }

      }
    }
    else
    {
      v7 = 0;
    }
    v30 = *(void **)(a1 + 48);
    objc_msgSend_songUID(*(void **)(a1 + 40), v2, v3, v4, v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__existingSongForUID_(v30, v32, (uint64_t)v31, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = WeakRetained[7];
    objc_sync_enter(v36);
    if (!v7)
      goto LABEL_15;
    if (objc_msgSend__isDownloadingAsset_(*(void **)(a1 + 48), v37, *(_QWORD *)(a1 + 40), v38, v39))
    {
      objc_msgSend_removeObject_(WeakRetained[9], v40, (uint64_t)v7, v41, v42);
      objc_msgSend_removeObject_(WeakRetained[10], v43, (uint64_t)v7, v44, v45);
      objc_msgSend_updateAsset_downloadProgress_error_(v35, v46, *(_QWORD *)(a1 + 40), 0, v47, 0.0);
    }
    if ((objc_msgSend_containsObject_(WeakRetained[13], v40, (uint64_t)v7, v41, v42) & 1) != 0)
    {
      objc_sync_exit(v36);

    }
    else
    {
LABEL_15:
      objc_sync_exit(v36);

      if (objc_msgSend_assetStatus(*(void **)(a1 + 40), v48, v49, v50, v51) == 2)
        objc_msgSend_cancelDownloadOfAsset_(*(void **)(a1 + 48), v52, *(_QWORD *)(a1 + 40), v53, v54);
      v55 = WeakRetained[7];
      objc_sync_enter(v55);
      if (v7)
        objc_msgSend_addObject_(WeakRetained[12], v56, (uint64_t)v7, v57, v58);
      objc_sync_exit(v55);

      objc_msgSend__dispatchNextAsyncAssetDownloadAndPurge(*(void **)(a1 + 48), v59, v60, v61, v62);
    }

  }
}

void sub_20D03248C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20D0338AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_isEqualToString_(a2, (const char *)a2, (uint64_t)&stru_24C5F0F80, a4, a5);
}

void sub_20D033908(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D033DAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20D034744(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a2;
  v5 = a3;
  v10 = objc_msgSend_sampleCount(v4, v6, v7, v8, v9);
  if (v10 >= objc_msgSend_sampleCount(v5, v11, v12, v13, v14))
  {
    v20 = objc_msgSend_sampleCount(v4, v15, v16, v17, v18);
    v19 = v20 > objc_msgSend_sampleCount(v5, v21, v22, v23, v24);
  }
  else
  {
    v19 = -1;
  }

  return v19;
}

void sub_20D034F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_20D034F38(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_type(v5, v6, v7, v8, v9) == 2;

  return v10;
}

uint64_t sub_20D034F74(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D034F84(uint64_t a1)
{

}

uint64_t sub_20D034F8C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;

  v3 = a2;
  objc_msgSend_segment(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v3, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(v8, v14, (uint64_t)v13, v15, v16) & 1) != 0)
    v21 = 0;
  else
    v21 = objc_msgSend_barsUsed(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v17, v18, v19, v20) - 1;

  objc_msgSend_segment(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v27, (uint64_t)v26, (uint64_t)v3, v21, 1);

  return v28;
}

void sub_20D0352E4()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = (id)objc_opt_new();
  for (i = 0; i != 100; ++i)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v0, (uint64_t)CFSTR("%ld"), v1, v2, i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v10, v5, (uint64_t)v4, v6, v7);

  }
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v0, (uint64_t)v10, v1, v2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_253E5D810;
  qword_253E5D810 = v8;

}

uint64_t sub_20D0361D4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int isEqualToString;
  uint64_t v25;

  objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_type(v6, v7, v8, v9, v10);
  objc_msgSend_nameIndex(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("%lu"), v18, v19, *(_QWORD *)(a1 + 32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v16, v21, (uint64_t)v20, v22, v23);

  if (v11 == 3)
    v25 = isEqualToString;
  else
    v25 = 0;

  return v25;
}

uint64_t sub_20D03627C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t isEqualToString;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
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
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;

  v3 = a2;
  objc_msgSend_segment(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_indexOfObject_(*(void **)(a1 + 32), v9, (uint64_t)v3, v10, v11);
  if (v12 >= objc_msgSend_count(*(void **)(a1 + 32), v13, v14, v15, v16) - 1)
  {
    v50 = 0;
    v31 = 0;
    objc_msgSend_name(0, v17, v18, v19, v20);
  }
  else
  {
    v21 = v12 + 1;
    objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v17, v12 + 1, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segment(v22, v23, v24, v25, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      if (v21 >= objc_msgSend_count(*(void **)(a1 + 32), v27, v28, v29, v30))
      {
        v50 = 0;
        goto LABEL_9;
      }
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v32, v21, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(v35, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_type(v40, v41, v42, v43, v44);

      if (v45 == 2)
        break;

      ++v21;
    }
    objc_msgSend_segment(v35, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    objc_msgSend_name(v50, v51, v52, v53, v54);
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v8, v56, (uint64_t)v55, 0, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58
    && v31
    && (objc_msgSend_transitionSegmentName(v58, v59, v60, v61, v62),
        v63 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_name(v31, v64, v65, v66, v67),
        v68 = (void *)objc_claimAutoreleasedReturnValue(),
        v72 = objc_msgSend_isEqualToString_(v63, v69, (uint64_t)v68, v70, v71),
        v68,
        v63,
        (v72 & 1) != 0))
  {
    isEqualToString = 0;
  }
  else
  {
    objc_msgSend_name(v8, v59, v60, v61, v62);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_namePrefix(v8, v75, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v74, v80, (uint64_t)v79, (uint64_t)&stru_24C5F0F80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_nameStem(v8, v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v82, v88, (uint64_t)v87, (uint64_t)&stru_24C5F0F80, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v90, v91, *(_QWORD *)(a1 + 40), v92, v93))
    {
      objc_msgSend_transitionSegmentName(v58, v94, v95, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segment(*(void **)(a1 + 48), v99, v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v103, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v98, v109, (uint64_t)v108, v110, v111);

    }
    else
    {
      isEqualToString = 0;
    }

  }
  return isEqualToString;
}

uint64_t sub_20D036A90(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t isEqualToString;

  objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(*(void **)(a1 + 32), v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v11, v17, (uint64_t)v16, v18, v19);

  return isEqualToString;
}

uint64_t sub_20D037C60(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_sliceable(a2, (const char *)a2, a3, a4, a5);
}

uint64_t sub_20D038A68(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a2;
  v5 = a3;
  v10 = objc_msgSend_priority(v4, v6, v7, v8, v9);
  if (v10 <= objc_msgSend_priority(v5, v11, v12, v13, v14))
  {
    v20 = objc_msgSend_priority(v4, v15, v16, v17, v18);
    v19 = v20 < objc_msgSend_priority(v5, v21, v22, v23, v24);
  }
  else
  {
    v19 = -1;
  }

  return v19;
}

uint64_t sub_20D038AE8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_sliceable(a2, (const char *)a2, a3, a4, a5);
}

uint64_t sub_20D038AF0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t isEqualToString;

  objc_msgSend_name(a2, (const char *)a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(*(void **)(a1 + 32), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v12, (uint64_t)v11, v13, v14);

  return isEqualToString;
}

uint64_t sub_20D038D38(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a2;
  v5 = a3;
  v10 = objc_msgSend_sampleCount(v4, v6, v7, v8, v9);
  if (v10 <= objc_msgSend_sampleCount(v5, v11, v12, v13, v14))
  {
    v20 = objc_msgSend_sampleCount(v4, v15, v16, v17, v18);
    v19 = v20 < objc_msgSend_sampleCount(v5, v21, v22, v23, v24);
  }
  else
  {
    v19 = -1;
  }

  return v19;
}

void sub_20D039224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D039258(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;

  v3 = a2;
  objc_msgSend_segment(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v3, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(v8, v14, (uint64_t)v13, v15, v16) & 1) != 0)
    v21 = 0;
  else
    v21 = objc_msgSend_barsUsed(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v17, v18, v19, v20) - 1;

  objc_msgSend_segment(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v27, (uint64_t)v26, (uint64_t)v3, v21, 1);

  return v28;
}

BOOL sub_20D03A0EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;

  objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  return v11;
}

BOOL sub_20D03A130(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;

  objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  return v11;
}

BOOL sub_20D03A174(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;

  objc_msgSend_segment(a2, (const char *)a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  return v11;
}

uint64_t sub_20D03B368(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t isEqualToString;

  objc_msgSend_name(a2, (const char *)a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segment(*(void **)(a1 + 32), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v17, (uint64_t)v16, v18, v19);

  return isEqualToString;
}

void sub_20D03B494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D03B4AC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = a2;
  objc_msgSend_segment(v23, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16 = (void *)v11;
    objc_msgSend_segment(v23, v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_type(v17, v18, v19, v20, v21);

    if (v22 == 4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

uint64_t sub_20D03C0C0(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v3 = a2;
  objc_msgSend_segment(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nameIndex(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nameIndex(*(void **)(a1 + 32), v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v13, v19, (uint64_t)v18, v20, v21))
  {
    objc_msgSend_segment(v3, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nameSuffix(v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)CFSTR("a"), v33, v34) ^ 1;

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

uint64_t sub_20D03C4AC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a2;
  v5 = a3;
  v10 = objc_msgSend_priority(v4, v6, v7, v8, v9);
  if (v10 <= objc_msgSend_priority(v5, v11, v12, v13, v14))
  {
    v20 = objc_msgSend_priority(v4, v15, v16, v17, v18);
    v19 = v20 < objc_msgSend_priority(v5, v21, v22, v23, v24);
  }
  else
  {
    v19 = -1;
  }

  return v19;
}

BOOL sub_20D03C52C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;

  objc_msgSend_name(a2, (const char *)a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(*(void **)(a1 + 32), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 == v11;

  return v12;
}

intptr_t sub_20D03D26C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_20D03F034(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_20D03F040(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_20D03F034(&dword_20D016000, a1, a3, "cannot call _actualOutroDurationForAssemblyList without first assembling body segments!", v3);
}

void sub_20D03F078(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_20D03F034(&dword_20D016000, a3, (uint64_t)a3, "expected silence or outro at end. Algorithm bug?", a1);
}

void sub_20D03F0AC(void *a1, char *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_lastPathComponent(a1, a2, (uint64_t)a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412546;
  v13 = v7;
  v14 = 2048;
  v15 = objc_msgSend_sampleCount(a2, v8, v9, v10, v11);
  _os_log_debug_impl(&dword_20D016000, a3, OS_LOG_TYPE_DEBUG, "%@: kExtAudioFileProperty_FileLengthFrames is 1 sample longer than segment.sampleCount %lld", (uint8_t *)&v12, 0x16u);

}

void sub_20D03F464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D03F490(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D03F4A0(uint64_t a1)
{

}

void sub_20D03F4A8(_QWORD *a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  id v56;

  v7 = a2;
  v8 = a1[6];
  v56 = v7;
  if (v8 == objc_msgSend_sampleTime(v7, v9, v10, v11, v12))
    goto LABEL_5;
  v17 = a1[6];
  if (v17 > objc_msgSend_sampleTime(v56, v13, v14, v15, v16))
  {
    if (objc_msgSend_count(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v18, v19, v20, v21) - 1 > a3)
    {
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v13, a3 + 1, v15, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_value(v56, v23, v24, v25, v26);
      v28 = v27;
      objc_msgSend_value(v22, v29, v30, v31, v32);
      v34 = v33;
      objc_msgSend_value(v56, v35, v36, v37, v38);
      v40 = a1[6];
      v45 = (float)(v34 - v39) * (float)(v40 - objc_msgSend_sampleTime(v56, v41, v42, v43, v44));
      v50 = objc_msgSend_sampleTime(v22, v46, v47, v48, v49);
      *(float *)(*(_QWORD *)(a1[4] + 8) + 24) = v28
                                                  + (float)(v45
                                                          / (float)(v50
                                                                  - objc_msgSend_sampleTime(v56, v51, v52, v53, v54)));

LABEL_6:
      *a4 = 1;
      goto LABEL_7;
    }
LABEL_5:
    objc_msgSend_value(v56, v13, v14, v15, v16);
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v55;
    goto LABEL_6;
  }
LABEL_7:

}

void sub_20D03F750(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D03F76C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void **WeakRetained;
  const char *v32;
  uint64_t v33;
  void **v34;
  id v35;

  v35 = a2;
  v11 = objc_msgSend_sampleTime(*(void **)(a1 + 32), v7, v8, v9, v10);
  v20 = objc_msgSend_sampleTime(v35, v12, v13, v14, v15);
  v21 = *(void **)(a1 + 32);
  if (v11 == v20)
  {
    objc_msgSend_value(v21, v16, v17, v18, v19);
    objc_msgSend_setValue_(v35, v22, v23, v24, v25);
    *a4 = 1;
  }
  else
  {
    v26 = objc_msgSend_sampleTime(v21, v16, v17, v18, v19);
    if (v26 > objc_msgSend_sampleTime(v35, v27, v28, v29, v30))
    {
      WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
      v34 = WeakRetained;
      if (WeakRetained)
        objc_msgSend_insertObject_atIndex_(WeakRetained[1], v32, *(_QWORD *)(a1 + 32), a3 + 1, v33);
      *a4 = 1;

    }
  }

}

void sub_20D03F8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20D03F900(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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
  uint64_t v15;

  v6 = a2;
  if (objc_msgSend_sampleTime(v6, v7, v8, v9, v10) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  v15 = objc_msgSend_sampleTime(v6, v11, v12, v13, v14);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v15;
}

void sub_20D03FAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20D03FAFC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  float v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  id v39;

  v5 = a2;
  if (a3)
  {
    v39 = v5;
    objc_msgSend_value(v5, v6, v7, v8, v9);
    if (v14 == *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend_volumeKeyFrames(*(void **)(a1 + 32), v10, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v15, v16, a3 - 1, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_value(v19, v20, v21, v22, v23);
      v25 = v24;
      objc_msgSend_value(v39, v26, v27, v28, v29);
      if (v25 == v33)
      {
        v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (!v34)
        {
          v35 = objc_opt_new();
          v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v37 = *(void **)(v36 + 40);
          *(_QWORD *)(v36 + 40) = v35;

          v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        }
        objc_msgSend_addObject_(v34, v30, (uint64_t)v39, v31, v32);

        goto LABEL_9;
      }

    }
    objc_msgSend_value(v39, v10, v11, v12, v13);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v38;
LABEL_9:
    v5 = v39;
  }

}

void sub_20D041E70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20D041E80(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_20D041E70(&dword_20D016000, a2, a3, "Failed to fetch genre:\n%@", a5, a6, a7, a8, 2u);
}

void sub_20D041EE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_20D041E70(&dword_20D016000, a2, a3, "Failed to fetch region:\n%@", a5, a6, a7, a8, 2u);
}

uint64_t sub_20D0435AC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a2;
  v5 = a3;
  v10 = objc_msgSend_position(v4, v6, v7, v8, v9);
  if (v10 >= objc_msgSend_position(v5, v11, v12, v13, v14))
  {
    v20 = objc_msgSend_position(v4, v15, v16, v17, v18);
    v19 = v20 > objc_msgSend_position(v5, v21, v22, v23, v24);
  }
  else
  {
    v19 = -1;
  }

  return v19;
}

void sub_20D0448E4(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (objc_msgSend_type(v10, v3, v4, v5, v6) == *(_QWORD *)(a1 + 40))
    objc_msgSend_addObject_(*(void **)(a1 + 32), v7, (uint64_t)v10, v8, v9);

}

void sub_20D044A34(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  char isEqualToString;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = a2;
  v7 = objc_msgSend_type(v27, v3, v4, v5, v6);
  v11 = (char *)v27;
  if (v7 == *(_QWORD *)(a1 + 56))
  {
    objc_msgSend_nameIndex(v27, (const char *)v27, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v12, v13, *(_QWORD *)(a1 + 32), v14, v15))
    {
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend_nameSuffix(v27, v16, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v20, v21, *(_QWORD *)(a1 + 40), v22, v23);

        v11 = (char *)v27;
        if ((isEqualToString & 1) == 0)
          goto LABEL_10;
      }
      else
      {

      }
      objc_msgSend_addObject_(*(void **)(a1 + 48), v11, (uint64_t)v27, v25, v26);
    }
    else
    {

    }
    v11 = (char *)v27;
  }
LABEL_10:

}

void sub_20D044BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D044BF0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D044C00(uint64_t a1)
{

}

void sub_20D044C08(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int isEqualToString;
  id v16;

  v16 = a2;
  objc_msgSend_name(v16, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *(_QWORD *)(a1 + 32), v13, v14);

  if (isEqualToString)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void sub_20D04504C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_20D045058(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_name(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412290;
  v9 = v6;
  sub_20D04504C(&dword_20D016000, a2, v7, "Relinking transitions for segment %@ because it is not Sliceable", (uint8_t *)&v8);

}

void sub_20D0450E4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D016000, log, OS_LOG_TYPE_DEBUG, "Invalid sole marker", v1, 2u);
}

void sub_20D045124(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  sub_20D04504C(&dword_20D016000, a2, a3, "%@", (uint8_t *)&v3);
}

void sub_20D046190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20D0461D4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20D0461E4(uint64_t a1)
{

}

void sub_20D0461EC(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  _OWORD v38[3];
  __int128 v39;

  v6 = a2;
  objc_msgSend_values(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("SectionType"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isEqualToString_(v15, v16, (uint64_t)CFSTR("OUTRO"), v17, v18))
  {
    if (v6)
    {
      objc_msgSend_timeRange(v6, v19, v20, v21, v22);
      v23 = *(_QWORD *)(a1[4] + 8);
      *(_OWORD *)(v23 + 32) = v38[2];
      *(_QWORD *)(v23 + 48) = v39;
      objc_msgSend_timeRange(v6, v24, v25, v26, v27);
    }
    else
    {
      v28 = *(_QWORD **)(a1[4] + 8);
      v28[4] = 0;
      v28[5] = 0;
      v28[6] = 0;
      v37 = 0u;
      memset(v38, 0, 32);
    }
    v29 = *(_QWORD *)(a1[5] + 8);
    *(_QWORD *)(v29 + 48) = *((_QWORD *)&v38[1] + 1);
    *(_OWORD *)(v29 + 32) = *(_OWORD *)((char *)v38 + 8);
    objc_msgSend_values(v6, v19, v20, v21, v22, v37, *(_QWORD *)&v38[0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v30, v31, (uint64_t)CFSTR("OutroEarlyFade"), v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(a1[6] + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

    *a4 = 1;
  }

}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x24BDB6830](inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x24BDB6850](inAudioFile, *(_QWORD *)&inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileGetPropertyInfo(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *outDataSize, UInt32 *isWritable)
{
  return MEMORY[0x24BDB6858](inAudioFile, *(_QWORD *)&inPropertyID, outDataSize, isWritable);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x24BDB6880](inFileRef, inPermissions, *(_QWORD *)&inFileTypeHint, outAudioFile);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0420](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x24BDC0460](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x24BDC04E8](retstr, time, *(_QWORD *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x24BDC04F0](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x24BDC0508](range, time);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5770](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF57A8](target, queue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

