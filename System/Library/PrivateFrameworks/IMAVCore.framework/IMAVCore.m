void sub_218FEB978()
{
  IMAVHandler *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v0 = objc_alloc_init(IMAVHandler);
  v1 = (void *)qword_253DE9488;
  qword_253DE9488 = (uint64_t)v0;

  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v2, v3, v4, v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_listener(v14, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addHandler_(v10, v11, qword_253DE9488, v12, v13);

}

void sub_218FEEA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218FEEA88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  NSObject *v23;
  _BOOL4 v24;
  double v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  const char *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  id v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  double v77;
  __int16 v78;
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__timings(*(void **)(a1 + 32), a2, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTimingForKey_(v7, v8, (uint64_t)CFSTR("incoming-network-check"), v9, v10);

  sub_2190076D0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    IMTimeOfDay();
    v13 = v12 - *(double *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    v77 = v13;
    _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "Network check complete (Took %f seconds)", buf, 0xCu);
  }

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v22 = objc_msgSend_state(*(void **)(a1 + 32), v18, v19, v20, v21);
    sub_2190076D0();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22 > 4)
    {
      if (v24)
      {
        v63 = *(double *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v77 = v63;
        _os_log_impl(&dword_218FEA000, v23, OS_LOG_TYPE_DEFAULT, "*** not notifying for chat, already ended: %@", buf, 0xCu);
      }

      if (WeakRetained)
        objc_msgSend_removeObject_(*(void **)(*(_QWORD *)(a1 + 40) + 16), v64, (uint64_t)WeakRetained, v65, v66);
      objc_msgSend_removeObject_(*(void **)(*(_QWORD *)(a1 + 40) + 8), v64, *(_QWORD *)(a1 + 32), v65, v66);
    }
    else
    {
      if (v24)
      {
        v25 = *(double *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v77 = v25;
        _os_log_impl(&dword_218FEA000, v23, OS_LOG_TYPE_DEFAULT, "Notifying for chat: %@", buf, 0xCu);
      }

      objc_msgSend__notifyOfIncomingInvitationFor_notifyInvitationListeners_(*(void **)(a1 + 40), v26, *(_QWORD *)(a1 + 32), 1, v27);
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v28 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v71, (uint64_t)v80, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v72 != v32)
              objc_enumerationMutation(v28);
            v34 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            sub_2190076D0();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              v77 = *(double *)&v34;
              v78 = 2112;
              v79 = v36;
              _os_log_impl(&dword_218FEA000, v35, OS_LOG_TYPE_DEFAULT, "Comparing thisChat %@ and chat %@", buf, 0x16u);
            }

            if (*(void **)(a1 + 32) != v34)
            {
              sub_2190076D0();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v77 = *(double *)&v34;
                _os_log_impl(&dword_218FEA000, v38, OS_LOG_TYPE_DEFAULT, "Declining other chat: %@", buf, 0xCu);
              }

              objc_msgSend_declineInvitationWithResponse_(v34, v39, 2, v40, v41);
            }
          }
          v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v37, (uint64_t)&v71, (uint64_t)v80, 16);
        }
        while (v31);
      }

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v42 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v67, (uint64_t)v75, 16);
      if (v44)
      {
        v49 = v44;
        v50 = *(_QWORD *)v68;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v68 != v50)
              objc_enumerationMutation(v42);
            v52 = *(id *)(*((_QWORD *)&v67 + 1) + 8 * j);
            if (v52 != WeakRetained)
              objc_msgSend_cancel(v52, v45, v46, v47, v48);
          }
          v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v67, (uint64_t)v75, 16);
        }
        while (v49);
      }

      sub_2190076D0();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v53, OS_LOG_TYPE_DEFAULT, "Flushing queue", buf, 2u);
      }

      objc_msgSend_removeAllObjects(*(void **)(*(_QWORD *)(a1 + 40) + 16), v54, v55, v56, v57);
      objc_msgSend_removeAllObjects(*(void **)(*(_QWORD *)(a1 + 40) + 8), v58, v59, v60, v61);
    }

  }
  else
  {
    v62 = *(void **)(a1 + 32);
    if ((*(_BYTE *)(a1 + 64) & 2) != 0)
      objc_msgSend_declineInvitationWithResponse_(v62, v14, 4, v15, v16);
    else
      objc_msgSend_declineInvitationWithResponse_(v62, v14, 5, v15, v16);
  }
}

BOOL sub_218FF106C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (objc_msgSend_capabilities(a1, a2, a3, a4, a5) & 0x1FF0000) == 0;
}

void sub_218FF1BB4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int buf, __int128 a12, uint64_t a13, __int128 a14)
{
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;

  if (a2 == 1)
  {
    v16 = objc_begin_catch(a1);
    sub_2190076D0();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("NO");
      buf = 138413058;
      WORD2(a12) = 2112;
      if (v15)
        v18 = CFSTR("YES");
      *(_QWORD *)((char *)&a12 + 6) = v18;
      HIWORD(a12) = 2112;
      LOWORD(a14) = 2112;
      *(_QWORD *)((char *)&a14 + 2) = v16;
      _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] -[IMAVChat initIncomingFrom:%@ isVideo:%@ callerProperties:%@] threw exception %@", (uint8_t *)&buf, 0x2Au);
    }

    objc_end_catch();
    JUMPOUT(0x218FF1B5CLL);
  }
  _Unwind_Resume(a1);
}

void sub_218FF8144(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  objc_msgSend_remoteICEData(v17, v3, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = (void *)v7;
    objc_msgSend_localICEData(v17, v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend_addObject_(*(void **)(a1 + 32), v14, (uint64_t)v17, v15, v16);
  }

}

void sub_218FF8238(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend_remoteICEData(v17, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_5:
    v16 = v17;
    goto LABEL_6;
  }
  objc_msgSend_localICEData(v17, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v17;
  if (v12)
  {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v13, (uint64_t)v17, v14, v15);
    goto LABEL_5;
  }
LABEL_6:

}

void sub_218FF94D8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
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
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v21 = 138412290;
    v22 = v3;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "_hangupCallLaterIfReinitiateFailsForCallInfo is firing for call info %@", (uint8_t *)&v21, 0xCu);
  }

  if (objc_msgSend_state(*(void **)(a1 + 32), v4, v5, v6, v7) <= 2)
  {
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_avChat(*(void **)(a1 + 40), v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v13;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Reinitiate call info still has not connected. Ending chat: %@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend_avChat(*(void **)(a1 + 40), v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__endChatWithReason_andError_(v18, v19, 7, 32001, v20);

  }
}

void sub_218FFA6A4()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_253DE9500;
  qword_253DE9500 = (uint64_t)v0;

}

void sub_218FFAAF0()
{
  IMAVController *v0;
  void *v1;

  v0 = objc_alloc_init(IMAVController);
  v1 = (void *)qword_253DE94D8;
  qword_253DE94D8 = (uint64_t)v0;

}

void sub_218FFAC10(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int isEqualToIgnoringCase;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;

  objc_msgSend_ensureHandlerSetup(IMAVHandler, a2, a3, a4, a5);
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUsesPowerNotifications_(v9, v10, 1, v11, v12);

  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWatchesScreenLightState_(v17, v18, 1, v19, v20);

  IMGetMainBundleIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v21, v22, (uint64_t)CFSTR("com.apple.TelephonyUtilities"), v23, v24);

  IMGetMainBundleIdentifier();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_isEqualToIgnoringCase_(v26, v27, (uint64_t)CFSTR("com.apple.TelephonyUtilities"), v28, v29);

  v35 = *MEMORY[0x24BE503F8];
  if (!isEqualToIgnoringCase)
    v35 = 0;
  v36 = v35 | *MEMORY[0x24BE503F0];
  v37 = *MEMORY[0x24BE50400];
  if (!v30)
    v37 = 0;
  v38 = v36 | v37;
  objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v31, v32, v33, v34);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addListenerID_capabilities_(v41, v39, (uint64_t)CFSTR("@\"com.apple.imavcore.imavcontroller\""), v38, v40);

}

void sub_218FFCE50(void *a1, _DWORD *a2, int *a3, _BYTE *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int isEqualToString;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  int v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  int v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  unint64_t v89;

  v7 = a1;
  v89 = 0;
  objc_msgSend_domain(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)off_25503B050, v14, v15);

  if (isEqualToString)
  {
    v21 = objc_msgSend_code(v7, v17, v18, v19, v20);
    sub_218FFD2D4(v21, (char *)&v89 + 4, (int *)&v89, v22, v23);
    if (HIDWORD(v89))
      goto LABEL_60;
  }
  objc_msgSend_domain(v7, v17, v18, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BE4FEF8];
  v29 = objc_msgSend_isEqualToString_(v24, v26, *MEMORY[0x24BE4FEF8], v27, v28);

  if (v29)
  {
    objc_msgSend_userInfo(v7, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v34, v35, v36, v37, v38))
    {
      objc_msgSend_objectForKey_(v34, v39, (uint64_t)CFSTR("internalCode"), v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend_integerValue(v42, v43, v44, v45, v46);
      v48 = 0;
      if (v47 > 5056)
      {
        v49 = 0;
        switch(v47)
        {
          case 5057:
            v49 = 6900;
            v48 = 26;
            break;
          case 5058:
            v48 = 25;
            goto LABEL_18;
          case 5059:
          case 5060:
          case 5061:
          case 5062:
            break;
          case 5063:
            v49 = 7001;
            goto LABEL_27;
          case 5064:
            v49 = 7002;
LABEL_27:
            v48 = 28;
            break;
          default:
            if ((v47 - 5085) >= 3)
            {
              v49 = 0;
              if (v47 != 10000)
                break;
              v48 = 6600;
            }
            else
            {
              v48 = 28;
            }
LABEL_18:
            v49 = v47;
            break;
        }
      }
      else
      {
        v49 = 0;
        switch(v47)
        {
          case 5000:
          case 5006:
          case 5011:
          case 5012:
          case 5029:
          case 5032:
          case 5033:
            v48 = 24;
            goto LABEL_18;
          case 5001:
            v49 = 32000;
            v48 = 15;
            break;
          case 5002:
          case 5003:
          case 5004:
          case 5007:
          case 5008:
          case 5009:
          case 5013:
          case 5015:
          case 5016:
          case 5017:
          case 5031:
            v48 = 15;
            goto LABEL_18;
          case 5005:
          case 5030:
            v48 = 23;
            goto LABEL_18;
          case 5010:
          case 5014:
          case 5018:
          case 5019:
          case 5020:
          case 5021:
          case 5022:
          case 5023:
          case 5024:
          case 5025:
          case 5026:
          case 5027:
          case 5028:
            break;
          default:
            v49 = 0;
            break;
        }
      }
      v89 = __PAIR64__(v48, v49);

    }
  }
  if (HIDWORD(v89)
    || (objc_msgSend_domain(v7, v30, v31, v32, v33),
        v50 = (void *)objc_claimAutoreleasedReturnValue(),
        v54 = objc_msgSend_isEqualToString_(v50, v51, v25, v52, v53),
        v50,
        !v54))
  {
LABEL_60:
    v66 = v89;
    if ((_DWORD)v89 == 7000)
    {
      v89 = 0x1800001B58;
      v66 = 7000;
    }
  }
  else
  {
    v59 = objc_msgSend_code(v7, v55, v56, v57, v58);
    v64 = -1;
    v65 = 6;
    switch(v59)
    {
      case 0:
        goto LABEL_38;
      case 1:
        v64 = 3000;
        goto LABEL_30;
      case 2:
        v64 = 3001;
LABEL_30:
        v65 = 16;
        goto LABEL_38;
      case 3:
        v64 = 3002;
        v65 = 18;
        goto LABEL_38;
      case 4:
        v64 = 3003;
        v65 = 17;
        goto LABEL_38;
      case 5:
        v64 = 3004;
        v65 = 19;
        goto LABEL_38;
      case 6:
        v64 = 3005;
        v65 = 20;
        goto LABEL_38;
      case 7:
        v64 = 8000;
        goto LABEL_38;
      case 8:
        v64 = 8005;
        goto LABEL_38;
      case 9:
        v64 = 8006;
LABEL_38:
        v89 = __PAIR64__(v65, v64);
        objc_msgSend_userInfo(v7, v60, v61, v62, v63);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v67, v68, v69, v70, v71))
        {
          objc_msgSend_objectForKey_(v67, v72, (uint64_t)CFSTR("internalCode"), v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v67, v76, (uint64_t)CFSTR("internalErrorDomain"), v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v79;
          if (v75)
          {
            if (objc_msgSend_isEqualToString_(v79, v80, *MEMORY[0x24BDD1308], v81, v82))
            {
              switch(objc_msgSend_intValue(v75, v84, v85, v86, v87))
              {
                case 0xFFFFFC04:
                case 0xFFFFFC06:
                case 0xFFFFFC12:
                case 0xFFFFFC14:
                case 0xFFFFFC15:
                  v88 = 6700;
                  break;
                case 0xFFFFFC07:
                case 0xFFFFFC08:
                case 0xFFFFFC09:
                case 0xFFFFFC0A:
                case 0xFFFFFC0D:
                  v88 = 6701;
                  break;
                case 0xFFFFFC0F:
                case 0xFFFFFC16:
                case 0xFFFFFC18:
                  v88 = 6600;
                  break;
                case 0xFFFFFC13:
                  v88 = 6500;
                  break;
                case 0xFFFFFC17:
                  v88 = 1002;
                  break;
                default:
                  goto LABEL_43;
              }
              LODWORD(v89) = v88;
            }
            else
            {
LABEL_43:
              LODWORD(v89) = objc_msgSend_intValue(v75, v84, v85, v86, v87);
            }
          }

        }
        goto LABEL_60;
      case 10:
        v66 = 3006;
        goto LABEL_50;
      case 11:
        v66 = 3007;
        goto LABEL_50;
      case 12:
        v66 = 3008;
        goto LABEL_50;
      case 13:
        v66 = 3009;
        goto LABEL_50;
      case 14:
        v66 = 3010;
        goto LABEL_50;
      case 15:
        v66 = 3011;
        goto LABEL_50;
      default:
        v66 = 0;
LABEL_50:
        HIDWORD(v89) = 0;
        break;
    }
  }
  if (a2)
    *a2 = HIDWORD(v89);
  if (a3)
    *a3 = v66;
  if (a4)
    *a4 = isEqualToString;

}

BOOL sub_218FFD244(int a1)
{
  return a1 < 1;
}

BOOL sub_218FFD250(int a1)
{
  return (a1 - 1000) < 0x3E8;
}

BOOL sub_218FFD260(int a1)
{
  return (a1 - 32000) < 0x3E8;
}

BOOL sub_218FFD274(int a1)
{
  return (a1 - 3000) < 0x3E8;
}

BOOL sub_218FFD284(int a1)
{
  return (a1 - 6000) < 0x3E8;
}

BOOL sub_218FFD298(int a1)
{
  return (a1 - 7000) < 0x3E8;
}

BOOL sub_218FFD2AC(int a1)
{
  return (a1 - 8000) < 0x3E8;
}

BOOL sub_218FFD2C0(int a1)
{
  return (a1 - 5000) < 0x3E8;
}

void sub_218FFD2D4(uint64_t a1, char *a2, int *a3, uint64_t a4, uint64_t a5)
{
  int v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int valid;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  BOOL v42;
  int v43;
  int v44;
  id v45;

  v7 = a1;
  if ((unint64_t)(a1 - 32000) >= 0x18)
    v8 = 15;
  else
    v8 = dword_219027840[a1 - 32000];
  objc_msgSend_sharedInstance(MEMORY[0x24BE30360], a2, (uint64_t)a3, a4, a5);
  v45 = (id)objc_claimAutoreleasedReturnValue();
  valid = objc_msgSend_validNetworkActive(v45, v9, v10, v11, v12);
  v18 = objc_msgSend_validNetworkEnabled(v45, v14, v15, v16, v17);
  v23 = objc_msgSend_validNetworkReachable(v45, v19, v20, v21, v22);
  if ((objc_msgSend_allowAnyNetwork(v45, v24, v25, v26, v27) & 1) != 0
    || (objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v28, v29, v30, v31),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v37 = objc_msgSend_nonWifiFaceTimeAvailable(v32, v33, v34, v35, v36),
        v32,
        v37))
  {
    v38 = v18 & valid;
    v39 = 6600;
  }
  else
  {
    v38 = v18 & valid;
    v39 = 6000;
  }
  if (v23)
    v40 = v7;
  else
    v40 = 6500;
  if (v23)
    v41 = v8;
  else
    v41 = 7;
  v42 = v38 == 1;
  if (v38 == 1)
    v43 = v40;
  else
    v43 = v39;
  if (v42)
    v44 = v41;
  else
    v44 = 7;
  if (a2)
    *(_DWORD *)a2 = v44;
  if (a3)
    *a3 = v43;

}

void sub_218FFFE10(char a1)
{
  _QWORD block[4];
  char v3;

  if (qword_25503B8E0 != -1)
    dispatch_once(&qword_25503B8E0, &unk_24DA57488);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_218FFFEC8;
  block[3] = &unk_24DA574A8;
  v3 = a1;
  dispatch_async((dispatch_queue_t)qword_25503B8D8, block);
}

void sub_218FFFE9C()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("IMAVCoreSetEnableNetworkingFlagsQueue", 0);
  v1 = (void *)qword_25503B8D8;
  qword_25503B8D8 = (uint64_t)v0;

}

void sub_218FFFEC8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = *(unsigned __int8 *)(a1 + 32);
  if (byte_25503B8D0 != (_DWORD)v5)
  {
    byte_25503B8D0 = *(_BYTE *)(a1 + 32);
    v7 = off_25503B8E8;
    if (!off_25503B8E8)
    {
      v7 = (void *)MEMORY[0x219A282F8]("SBSSpringBoardServerPort", CFSTR("SpringBoardServices"));
      off_25503B8E8 = v7;
    }
    v8 = off_25503B8F0;
    if (!off_25503B8F0)
    {
      v8 = (void *)MEMORY[0x219A282F8]("SBSetApplicationNetworkFlags", CFSTR("SpringBoardServices"));
      off_25503B8F0 = v8;
      v7 = off_25503B8E8;
    }
    if (v8)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      v10 = ((uint64_t (*)(void))v7)();
      ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v10, v5, v5);
    }
    v11 = (void *)qword_25503B8F8;
    if (!qword_25503B8F8)
    {
      v11 = (void *)MEMORY[0x219A282EC](CFSTR("UIApplication"), CFSTR("UIKit"));
      qword_25503B8F8 = (uint64_t)v11;
    }
    objc_msgSend_sharedApplication(v11, a2, a3, a4, a5);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsesBackgroundNetwork_(v15, v12, *(unsigned __int8 *)(a1 + 32), v13, v14);

  }
}

void sub_219000014()
{
  IMAVTelephonyManager *v0;
  void *v1;

  v0 = objc_alloc_init(IMAVTelephonyManager);
  v1 = (void *)qword_253DE94E0;
  qword_253DE94E0 = (uint64_t)v0;

}

uint64_t ShouldAutoAcceptInvitations()
{
  return IMGetDomainBoolForKey();
}

BOOL IsIMAVChatEndedReasonACallFailure(unsigned int a1)
{
  return a1 > 5 && a1 - 12 < 0xFFFFFFFC && a1 - 23 < 0xFFFFFFFE && a1 != 27 && (a1 & 0xFFFFFFFD) != 29;
}

__CFString *_NSStringDescriptionForIMAVResponse(unsigned int a1)
{
  if (a1 > 0xB)
    return 0;
  else
    return off_24DA574E8[a1];
}

__CFString *_NSStringDescriptionForIMAVChatState(unsigned int a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_24DA57648[a1];
}

id _NSStringDescriptionForIMAVChatError(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  void *v6;
  const __CFString *v7;

  v5 = a1;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Unknown Error %d"), a4, a5, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 <= 5999)
  {
    if (v5 > 2999)
    {
      switch(v5)
      {
        case 5000:
          v7 = CFSTR("Unauthenticated");
          goto LABEL_154;
        case 5001:
        case 5035:
        case 5036:
        case 5037:
        case 5038:
        case 5039:
        case 5040:
        case 5041:
        case 5042:
        case 5043:
        case 5044:
        case 5045:
        case 5046:
        case 5047:
        case 5048:
        case 5049:
        case 5050:
        case 5051:
        case 5052:
        case 5053:
        case 5054:
        case 5055:
        case 5056:
        case 5057:
        case 5058:
        case 5065:
        case 5066:
        case 5067:
        case 5068:
        case 5069:
        case 5070:
        case 5071:
        case 5072:
        case 5073:
        case 5074:
        case 5075:
        case 5076:
        case 5077:
        case 5078:
        case 5079:
        case 5080:
        case 5081:
        case 5082:
        case 5083:
        case 5084:
          return v6;
        case 5002:
          v7 = CFSTR("Version Mismatch");
          goto LABEL_154;
        case 5003:
          v7 = CFSTR("Bad Request");
          goto LABEL_154;
        case 5004:
          v7 = CFSTR("Server Too Busy");
          goto LABEL_154;
        case 5005:
          v7 = CFSTR("No Such Player ID");
          goto LABEL_154;
        case 5006:
          v7 = CFSTR("Bad Push Token");
          goto LABEL_154;
        case 5007:
          v7 = CFSTR("No Such Achievement");
          goto LABEL_154;
        case 5008:
          v7 = CFSTR("Missing Required Key");
          goto LABEL_154;
        case 5009:
          v7 = CFSTR("Missing Required Header");
          goto LABEL_154;
        case 5010:
          v7 = CFSTR("Unrecognized Game Descriptor Headers");
          goto LABEL_154;
        case 5011:
          v7 = CFSTR("Must Accept Terms of Service");
          goto LABEL_154;
        case 5012:
          v7 = CFSTR("Invalid Name or Password");
          goto LABEL_154;
        case 5013:
          v7 = CFSTR("Cancelled by User");
          goto LABEL_154;
        case 5014:
          v7 = CFSTR("No Such Friend Relationship");
          goto LABEL_154;
        case 5015:
          v7 = CFSTR("No Such Alias");
          goto LABEL_154;
        case 5016:
          v7 = CFSTR("Email Not in Network");
          goto LABEL_154;
        case 5017:
          v7 = CFSTR("Request Disallowed");
          goto LABEL_154;
        case 5018:
          v7 = CFSTR("No Such RID");
          goto LABEL_154;
        case 5019:
          v7 = CFSTR("No Such Game");
          goto LABEL_154;
        case 5020:
          v7 = CFSTR("DSError");
          goto LABEL_154;
        case 5021:
          v7 = CFSTR("Profile Exists");
          goto LABEL_154;
        case 5022:
          v7 = CFSTR("Alias Exists");
          goto LABEL_154;
        case 5023:
          v7 = CFSTR("Account Name Not Email Address");
          goto LABEL_154;
        case 5024:
          v7 = CFSTR("Alias Too Long");
          goto LABEL_154;
        case 5025:
          v7 = CFSTR("Alias Too Frequent Updates");
          goto LABEL_154;
        case 5026:
          v7 = CFSTR("Player Status Not Allowed");
          goto LABEL_154;
        case 5027:
          v7 = CFSTR("Player Status Too Long");
          goto LABEL_154;
        case 5028:
          v7 = CFSTR("No Such Bucket ID");
          goto LABEL_154;
        case 5029:
          v7 = CFSTR("Authenticated Not Authorized");
          goto LABEL_154;
        case 5030:
          v7 = CFSTR("No Push Token for ID");
          goto LABEL_154;
        case 5031:
          v7 = CFSTR("Push Payload Too Big");
          goto LABEL_154;
        case 5032:
          v7 = CFSTR("Bad Signature");
          goto LABEL_154;
        case 5033:
          v7 = CFSTR("New Signature Required");
          goto LABEL_154;
        case 5034:
          v7 = CFSTR("New Registration Required");
          goto LABEL_154;
        case 5059:
          v7 = CFSTR("Phone Number Too Short");
          goto LABEL_154;
        case 5060:
          v7 = CFSTR("Phone Number Too Long");
          goto LABEL_154;
        case 5061:
          v7 = CFSTR("Phone Number Bad Country Code");
          goto LABEL_154;
        case 5062:
          v7 = CFSTR("Phone Number Malformed");
          goto LABEL_154;
        case 5063:
          v7 = CFSTR("Bad Invitation Context");
          goto LABEL_154;
        case 5064:
          v7 = CFSTR("Unpromotable Phone Number");
          goto LABEL_154;
        case 5085:
          v7 = CFSTR("Bad Cert");
          goto LABEL_154;
        case 5086:
          v7 = CFSTR("Bad Nonce");
          goto LABEL_154;
        case 5087:
          v7 = CFSTR("Bad Nonce Timestamp");
          goto LABEL_154;
        default:
          switch(v5)
          {
            case 3000:
              v7 = CFSTR("Invitation Failed");
              goto LABEL_154;
            case 3001:
              v7 = CFSTR("Counter Proposal Failed");
              goto LABEL_154;
            case 3002:
              v7 = CFSTR("Cancel Failed");
              goto LABEL_154;
            case 3003:
              v7 = CFSTR("Response Failed");
              goto LABEL_154;
            case 3004:
              v7 = CFSTR("VCUpdate Failed");
              goto LABEL_154;
            case 3005:
              v7 = CFSTR("AVMessage Failed");
              goto LABEL_154;
            case 3006:
              v7 = CFSTR("Request AVInfo Failed");
              goto LABEL_154;
            case 3007:
              v7 = CFSTR("Request Audio Reflector Failed");
              goto LABEL_154;
            case 3008:
              v7 = CFSTR("Request Video Still Failed");
              goto LABEL_154;
            case 3009:
              v7 = CFSTR("Provide AVInfo Failed");
              goto LABEL_154;
            case 3010:
              v7 = CFSTR("Provide Video Still Failed");
              goto LABEL_154;
            case 3011:
              v7 = CFSTR("Set AVManager Client URL Failed");
              goto LABEL_154;
            default:
              return v6;
          }
      }
      return v6;
    }
    if (v5 > 999)
    {
      switch(v5)
      {
        case 1000:
          v7 = CFSTR("VCChannel Auth Failed");
          goto LABEL_154;
        case 1001:
          v7 = CFSTR("VCChannel Connection Failed");
          goto LABEL_154;
        case 1002:
          v7 = CFSTR("NetworkTimeout");
          goto LABEL_154;
        case 1003:
          v7 = CFSTR("Insufficient Bandwidth");
          goto LABEL_154;
        case 1004:
          v7 = CFSTR("Local Video Error");
          goto LABEL_154;
        case 1005:
          v7 = CFSTR("No Packets");
          goto LABEL_154;
        case 1006:
          v7 = CFSTR("Local Cert Not Trusted");
          goto LABEL_154;
        case 1007:
          v7 = CFSTR("Invalid Security");
          goto LABEL_154;
        case 1008:
          v7 = CFSTR("Timeout");
          goto LABEL_154;
        case 1009:
          v7 = CFSTR("Cancel During Connect");
          goto LABEL_154;
        case 1010:
          v7 = CFSTR("Invalid Remote Size");
          goto LABEL_154;
        case 1011:
          v7 = CFSTR("Invalid Local Size");
          goto LABEL_154;
        case 1012:
          v7 = CFSTR("Invalid IP Addr or Port");
          goto LABEL_154;
        case 1013:
          v7 = CFSTR("Invalid State");
          goto LABEL_154;
        case 1014:
          v7 = CFSTR("Expired Framework");
          goto LABEL_154;
        case 1015:
          v7 = CFSTR("Remote Party Declined");
          goto LABEL_154;
        case 1016:
          v7 = CFSTR("Remote Party is Busy");
          goto LABEL_154;
        case 1017:
          v7 = CFSTR("Caller Cancelled");
          goto LABEL_154;
        default:
          return v6;
      }
      return v6;
    }
    if (v5 == -2)
    {
      v7 = CFSTR("Generic Error");
    }
    else if (v5 == -1)
    {
      v7 = CFSTR("Unknown Error");
    }
    else
    {
      if (v5)
        return v6;
      v7 = CFSTR("No Error");
    }
LABEL_154:

    v6 = (void *)v7;
    return v6;
  }
  if (v5 <= 31999)
  {
    if (v5 > 6899)
    {
      if (v5 <= 7001)
      {
        switch(v5)
        {
          case 6900:
            v7 = CFSTR("System needs update");
            break;
          case 7000:
            v7 = CFSTR("Not Registered");
            break;
          case 7001:
            v7 = CFSTR("Region info needs update");
            break;
          default:
            return v6;
        }
      }
      else
      {
        switch(v5)
        {
          case 8000:
            v7 = CFSTR("Relay Invitation Failed");
            goto LABEL_154;
          case 8001:
            v7 = CFSTR("Relay Not Found");
            goto LABEL_154;
          case 8002:
            v7 = CFSTR("Relay Connection Failed");
            goto LABEL_154;
          case 8003:
            v7 = CFSTR("Relay Authorization Failed");
            goto LABEL_154;
          case 8004:
            v7 = CFSTR("Relay Disconnected");
            goto LABEL_154;
          case 8005:
            v7 = CFSTR("Relay Update Failed");
            goto LABEL_154;
          case 8006:
            v7 = CFSTR("Relay Cancel Failed");
            goto LABEL_154;
          default:
            if (v5 != 7002)
              return v6;
            v7 = CFSTR("Region info not sufficient");
            break;
        }
      }
    }
    else if (v5 <= 6599)
    {
      if (v5 <= 6099)
      {
        if (v5 == 6000)
        {
          v7 = CFSTR("No Local Wifi");
        }
        else
        {
          if (v5 != 6001)
            return v6;
          v7 = CFSTR("No Remote Wifi");
        }
      }
      else
      {
        switch(v5)
        {
          case 6100:
            v7 = CFSTR("Could not create AVConference");
            break;
          case 6400:
            v7 = CFSTR("Invalid remote ID");
            break;
          case 6500:
            v7 = CFSTR("Network Disconnected");
            break;
          default:
            return v6;
        }
      }
    }
    else if (v5 > 6700)
    {
      switch(v5)
      {
        case 6701:
          v7 = CFSTR("Bad Server Response");
          break;
        case 6800:
          v7 = CFSTR("Feature Disabled");
          break;
        case 6801:
          v7 = CFSTR("Not Allowed");
          break;
        default:
          return v6;
      }
    }
    else
    {
      switch(v5)
      {
        case 6600:
          v7 = CFSTR("No Local Network");
          break;
        case 6601:
          v7 = CFSTR("No Remote Network");
          break;
        case 6700:
          v7 = CFSTR("Server Not Found");
          break;
        default:
          return v6;
      }
    }
    goto LABEL_154;
  }
  switch(v5)
  {
    case 32000:
      v7 = CFSTR("Internal Error");
      goto LABEL_154;
    case 32001:
      v7 = CFSTR("No Remote Packets Error");
      goto LABEL_154;
    case 32002:
      v7 = CFSTR("Unable to Connect Error");
      goto LABEL_154;
    case 32003:
      v7 = CFSTR("Remote Participant Hangup Error");
      goto LABEL_154;
    case 32004:
      v7 = CFSTR("Invalid Call ID Error");
      goto LABEL_154;
    case 32005:
      v7 = CFSTR("Audio Unavailable Error");
      goto LABEL_154;
    case 32006:
      v7 = CFSTR("Uninitialized Client Error");
      goto LABEL_154;
    case 32007:
      v7 = CFSTR("Client Missing Required Methods Error");
      goto LABEL_154;
    case 32008:
      v7 = CFSTR("Remote Participant Busy Error");
      goto LABEL_154;
    case 32009:
      v7 = CFSTR("Remote Participant Cancelled Error");
      goto LABEL_154;
    case 32010:
      v7 = CFSTR("Remote Participant Response Invalid Error");
      goto LABEL_154;
    case 32011:
      v7 = CFSTR("Remote Participant Declined Invite Error");
      goto LABEL_154;
    case 32012:
      v7 = CFSTR("Method Currently Invalid Error");
      goto LABEL_154;
    case 32013:
      v7 = CFSTR("Network Configuration Error");
      goto LABEL_154;
    case 32014:
      v7 = CFSTR("Unsupported Remote Version Error");
      goto LABEL_154;
    case 32015:
      v7 = CFSTR("Out of Memory Error");
      goto LABEL_154;
    case 32016:
      v7 = CFSTR("Invalid Parameter Error");
      goto LABEL_154;
    case 32017:
      v7 = CFSTR("Video Unavailable Error");
      goto LABEL_154;
    case 32018:
      v7 = CFSTR("SRTP Encryption Setup Error");
      goto LABEL_154;
    case 32019:
      v7 = CFSTR("Network Relay Configuration Error");
      goto LABEL_154;
    case 32020:
      v7 = CFSTR("Bad Network Conditions Error");
      goto LABEL_154;
    case 32021:
      v7 = CFSTR("No Local Identity Error");
      goto LABEL_154;
    case 32022:
      v7 = CFSTR("Relay Channel Error");
      goto LABEL_154;
    default:
      return v6;
  }
  return v6;
}

__CFString *_NSStringDescriptionForIMAVChatEndedReason(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 < 0x20)
    return off_24DA57548[(int)a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Unknown Reason %d"), a4, a5, a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *_NSStringDescriptionForIMAVChatParticipantState(unsigned int a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_24DA57648[a1];
}

__CFString *sub_219000BD0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
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
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t buf[16];

  v5 = a3;
  v7 = objc_msgSend_count(a1, a2, a3, a4, a5);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD1488];
    v9 = objc_opt_class();
    objc_msgSend_bundleForClass_(v8, v10, v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v13;
    if (v7 == 2)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_localizedStringForKey_value_table_(v13, v14, (uint64_t)CFSTR("%@ and %@"), (uint64_t)&stru_24DA584C8, (uint64_t)CFSTR("IMAVCoreLocalizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___imFirstObject(a1, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(a1, v29, 1, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v22, v33, (uint64_t)v23, v34, v35, v28, v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v7 == 1)
      {
        objc_msgSend_lastObject(a1, v14, v15, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        return (__CFString *)v19;
      }
      if (v5 < 3 || (v36 = v7 - v5, v7 <= v5))
      {
        v37 = v7 - 1;
        v43 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_localizedStringForKey_value_table_(v13, v14, (uint64_t)CFSTR(", and %@"), (uint64_t)&stru_24DA584C8, (uint64_t)CFSTR("IMAVCoreLocalizable"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(a1, v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v43, v49, (uint64_t)v39, v50, v51, v48);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v37 = (v5 - 1);
        v38 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_localizedStringForKey_value_table_(v13, v14, (uint64_t)CFSTR(", and %d others"), (uint64_t)&stru_24DA584C8, (uint64_t)CFSTR("IMAVCoreLocalizable"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v38, v40, (uint64_t)v39, v41, v42, (v36 + 1));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend_subarrayWithRange_(a1, v52, 0, v37, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v18, v55, (uint64_t)CFSTR(", "), (uint64_t)&stru_24DA584C8, (uint64_t)CFSTR("IMAVCoreLocalizable"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v54, v57, (uint64_t)v56, v58, v59);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringByAppendingString_(v28, v60, (uint64_t)v23, v61, v62);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }
  sub_2190076D0();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Can't join 0 items!", buf, 2u);
  }

  return &stru_24DA584C8;
}

void sub_219000E70(void *a1)
{
  __CFString *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const __CFString *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const __CFString *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const __CFString *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const __CFString *v81;
  NSObject *v82;
  int v83;
  const __CFString *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v83 = 138412290;
    v84 = v1;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "************ %@ *************", (uint8_t *)&v83, 0xCu);
  }

  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_allowAnyNetwork(v6, v9, v10, v11, v12))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v83 = 138412290;
    v84 = v13;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Allow any network: %@", (uint8_t *)&v83, 0xCu);
  }

  sub_2190076D0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_supportsNonWiFiFaceTime(v19, v20, v21, v22, v23))
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v83 = 138412290;
    v84 = v24;
    _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "Supports non WiFi: %@", (uint8_t *)&v83, 0xCu);

  }
  sub_2190076D0();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE30340], v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_faceTimeNonWiFiEntitled(v30, v31, v32, v33, v34))
      v35 = CFSTR("YES");
    else
      v35 = CFSTR("NO");
    v83 = 138412290;
    v84 = v35;
    _os_log_impl(&dword_218FEA000, v25, OS_LOG_TYPE_DEFAULT, "Entitled non WiFi: %@", (uint8_t *)&v83, 0xCu);

  }
  sub_2190076D0();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_nonWifiFaceTimeAvailable(v41, v42, v43, v44, v45))
      v46 = CFSTR("YES");
    else
      v46 = CFSTR("NO");
    v83 = 138412290;
    v84 = v46;
    _os_log_impl(&dword_218FEA000, v36, OS_LOG_TYPE_DEFAULT, "Allowed non WiFi: %@", (uint8_t *)&v83, 0xCu);

  }
  sub_2190076D0();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE30388], v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_cellularFaceTimeEnabled(v52, v53, v54, v55, v56))
      v57 = CFSTR("YES");
    else
      v57 = CFSTR("NO");
    v83 = 138412290;
    v84 = v57;
    _os_log_impl(&dword_218FEA000, v47, OS_LOG_TYPE_DEFAULT, "User enabled non WiFi: %@", (uint8_t *)&v83, 0xCu);

  }
  sub_2190076D0();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_validNetworkEnabled(v6, v59, v60, v61, v62))
      v63 = CFSTR("YES");
    else
      v63 = CFSTR("NO");
    v83 = 138412290;
    v84 = v63;
    _os_log_impl(&dword_218FEA000, v58, OS_LOG_TYPE_DEFAULT, "Is Network Enabled: %@", (uint8_t *)&v83, 0xCu);
  }

  sub_2190076D0();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_validNetworkActive(v6, v65, v66, v67, v68))
      v69 = CFSTR("YES");
    else
      v69 = CFSTR("NO");
    v83 = 138412290;
    v84 = v69;
    _os_log_impl(&dword_218FEA000, v64, OS_LOG_TYPE_DEFAULT, "Is Network Active: %@", (uint8_t *)&v83, 0xCu);
  }

  sub_2190076D0();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_validNetworkReachable(v6, v71, v72, v73, v74))
      v75 = CFSTR("YES");
    else
      v75 = CFSTR("NO");
    v83 = 138412290;
    v84 = v75;
    _os_log_impl(&dword_218FEA000, v70, OS_LOG_TYPE_DEFAULT, "Is Network Reachable: %@", (uint8_t *)&v83, 0xCu);
  }

  sub_2190076D0();
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_willSearchForNetwork(v6, v77, v78, v79, v80))
      v81 = CFSTR("YES");
    else
      v81 = CFSTR("NO");
    v83 = 138412290;
    v84 = v81;
    _os_log_impl(&dword_218FEA000, v76, OS_LOG_TYPE_DEFAULT, "Will Search for Wifi: %@", (uint8_t *)&v83, 0xCu);
  }

  sub_2190076D0();
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v83) = 0;
    _os_log_impl(&dword_218FEA000, v82, OS_LOG_TYPE_DEFAULT, "**********************************", (uint8_t *)&v83, 2u);
  }

}

uint64_t sub_219001324(int a1, int a2)
{
  uint64_t v2;
  char v3;
  int v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  unsigned int v9;
  unsigned int v10;

  v2 = a2 | a1;
  if (a1 && a2)
  {
    if (((a2 | a1) & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      v3 = 0;
      v4 = a1;
      do
      {
        a1 = v4 >> 1;
        a2 >>= 1;
        ++v3;
        v5 = a2 | (v4 >> 1);
        v4 >>= 1;
      }
      while ((v5 & 1) == 0);
    }
    do
    {
      v6 = a1;
      a1 >>= 1;
    }
    while ((v6 & 1) == 0);
    do
    {
      do
      {
        v7 = a2;
        a2 >>= 1;
      }
      while ((v7 & 1) == 0);
      v9 = v6 - v7;
      v8 = v6 - v7 < 0;
      if (v6 >= v7)
        v6 = v7;
      if (v8)
        v10 = -v9;
      else
        v10 = v9;
      a2 = v10 >> 1;
    }
    while (v10 > 1);
    return (v6 << v3);
  }
  return v2;
}

id sub_219001398(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (id)objc_msgSend_copyStringGUID(MEMORY[0x24BDD17C8], a2, a3, a4, a5);
}

id sub_2190013B4()
{
  id v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v0 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend_stringGUID(MEMORY[0x24BDD17C8], v1, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_initWithFormat_(v0, v6, (uint64_t)CFSTR("ConferenceID:%@"), v7, v8, v5);

  return v9;
}

const __CFString *sub_219001414(unsigned int a1)
{
  if (a1 > 5)
    return CFSTR("Unknown");
  else
    return off_24DA57678[a1];
}

void sub_219001478()
{
  IMAVCallManager *v0;
  void *v1;

  v0 = objc_alloc_init(IMAVCallManager);
  v1 = (void *)qword_253DE94E8;
  qword_253DE94E8 = (uint64_t)v0;

}

void sub_219001744(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char shouldRunConferences;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunConferences = objc_msgSend__shouldRunConferences(v7, v8, v9, v10, v11);

  if ((shouldRunConferences & 1) == 0)
    objc_msgSend__setAVCallState_(*(void **)(a1 + 32), v13, a3, v14, v15);
}

void sub_2190017A8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char shouldRunACConferences;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunACConferences = objc_msgSend__shouldRunACConferences(v7, v8, v9, v10, v11);

  if ((shouldRunACConferences & 1) == 0)
    objc_msgSend__setACCallState_(*(void **)(a1 + 32), v13, a3, v14, v15);
}

void *sub_219002F10()
{
  void *result;

  result = (void *)MEMORY[0x219A282F8]("PLLogRegisteredEvent", CFSTR("PowerLog"));
  off_253DE9470 = result;
  return result;
}

void *sub_219002F3C()
{
  void *result;

  result = (void *)MEMORY[0x219A282F8]("PLLogRegisteredEvent", CFSTR("PowerLog"));
  off_25503B900 = result;
  return result;
}

void sub_21900462C(void *a1, void *a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  char v24;
  char v25;

  v9 = a1;
  v10 = a2;
  v11 = a5;
  v16 = (void *)objc_msgSend_copy(a4, v12, v13, v14, v15);
  if (!v11)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_219006790;
  v20[3] = &unk_24DA57800;
  v24 = a3;
  v25 = 0;
  v22 = v10;
  v23 = v16;
  v21 = v9;
  v17 = v10;
  v18 = v16;
  v19 = v9;
  dispatch_async(v11, v20);

}

void sub_219004730(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  objc_msgSend_conferenceID(v9, v12, v13, v14, v15);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  sub_2190047BC(a2, a3, (uint64_t)v11, v10, v16, *(void **)(a1 + 40));

}

void sub_2190047BC(int a1, int a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  const __CFString *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
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
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __CFString *Mutable;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int isVideo;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  __CFString *v140;
  NSObject *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  __CFString *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  NSObject *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  __CFString *v162;
  NSObject *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const __CFString *v173;
  NSObject *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const __CFString *v184;
  NSObject *v185;
  NSObject *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char isConnected;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  NSObject *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  NSObject *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  NSObject *v249;
  NSObject *v250;
  const char *v251;
  NSObject *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  unsigned int v257;
  __CFString *v258;
  void *v259;
  id v260;
  id v261;
  void *v262;
  uint8_t buf[4];
  const __CFString *v264;
  __int16 v265;
  void *v266;
  __int16 v267;
  void *v268;
  uint64_t v269;

  v269 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v13 = a4;
  objc_msgSend__avChatWithGUID_(IMAVChat, v14, a3, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantWithID_(v17, v18, (uint64_t)v13, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  sub_2190076D0();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("NO");
    if (a1)
      v23 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v264 = v23;
    _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "Found WiFi: %@", buf, 0xCu);
  }

  sub_2190076D0();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CFSTR("NO");
    if (a2)
      v25 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v264 = v25;
    _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "Found Network: %@", buf, 0xCu);
  }

  sub_219000E70(CFSTR("Done"));
  if ((a2 & 1) == 0)
  {
    sub_2190076D0();
    v249 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v249, OS_LOG_TYPE_DEFAULT, "  => Failing, no valid network", buf, 2u);
    }

    sub_2190076D0();
    v250 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v251 = "[WARN] Failed invite! network is not good";
    goto LABEL_53;
  }
  objc_msgSend__timings(v17, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTimingForKey_(v30, v31, (uint64_t)CFSTR("time-to-av-fetch-ice-data-start-gather"), v32, v33);

  sub_219006E54(v17, v21, v12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (__CFString *)objc_msgSend_mutableCopy(v34, v35, v36, v37, v38);

  if (!v39)
  {
    sub_2190076D0();
    v252 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v252, OS_LOG_TYPE_DEFAULT, "  => Failing, missing invitees info (Missing ICE Data)", buf, 2u);
    }

    sub_2190076D0();
    v250 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v251 = "[WARN] Failed invite! Invitees info returned nil (Missing ICE Data)";
LABEL_53:
    _os_log_impl(&dword_218FEA000, v250, OS_LOG_TYPE_DEFAULT, v251, buf, 2u);
LABEL_54:

    sub_219006DDC(v17);
    goto LABEL_58;
  }
  objc_msgSend_inviteesInfo(v17, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_count(v44, v45, v46, v47, v48);

  if (v49)
  {
    objc_msgSend_inviteesInfo(v17, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v39, v55, (uint64_t)v54, v56, v57);

  }
  objc_msgSend_imHandle(v21, v50, v51, v52, v53);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callerProperties(v17, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (__CFString *)objc_msgSend_mutableCopy(v63, v64, v65, v66, v67);

  if (!Mutable)
    Mutable = (__CFString *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v73 = (void *)MEMORY[0x24BDD16E0];
  v74 = objc_msgSend_sessionID(v17, v69, v70, v71, v72);
  objc_msgSend_numberWithUnsignedInt_(v73, v75, v74, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = *MEMORY[0x24BE504F0];
  objc_msgSend_setObject_forKey_(v39, v80, (uint64_t)v78, *MEMORY[0x24BE504F0], v81);

  objc_msgSend_plistData(v39, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(Mutable, v87, (uint64_t)v86, *MEMORY[0x24BE50468], v88);

  v89 = (void *)MEMORY[0x24BDD16E0];
  isVideo = objc_msgSend_isVideo(v17, v90, v91, v92, v93);
  objc_msgSend_numberWithBool_(v89, v95, isVideo ^ 1u, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(Mutable, v99, (uint64_t)v98, *MEMORY[0x24BE50450], v100);

  v101 = (void *)MEMORY[0x24BDD16E0];
  v106 = objc_msgSend_sessionID(v17, v102, v103, v104, v105);
  objc_msgSend_numberWithUnsignedInt_(v101, v107, v106, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(Mutable, v111, (uint64_t)v110, v79, v112);

  if (v11)
  {
    objc_msgSend_setObject_forKey_(Mutable, v113, (uint64_t)v11, *MEMORY[0x24BE504A0], v116);
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v117, 1, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(Mutable, v121, (uint64_t)v120, *MEMORY[0x24BE50460], v122);

  }
  objc_msgSend__extraServerContext(v17, v113, v114, v115, v116);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v123, v124, v125, v126, v127))
    objc_msgSend_addEntriesFromDictionary_(Mutable, v128, (uint64_t)v123, v130, v131);
  if (objc_msgSend_isActive(v17, v128, v129, v130, v131))
  {
    v261 = v11;
    objc_msgSend_setState_(v12, v132, 1, v133, v134);
    sub_2190076D0();
    v135 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_ID(v58, v136, v137, v138, v139);
      v140 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v264 = v140;
      _os_log_impl(&dword_218FEA000, v135, OS_LOG_TYPE_DEFAULT, "Sending VC invite for %@ to service", buf, 0xCu);

    }
    sub_2190076D0();
    v141 = objc_claimAutoreleasedReturnValue();
    v262 = v58;
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_conferenceID(v17, v142, v143, v144, v145);
      v146 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(v58, v147, v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v264 = v146;
      v265 = 2112;
      v266 = v151;
      v267 = 2112;
      v268 = v262;
      _os_log_impl(&dword_218FEA000, v141, OS_LOG_TYPE_DEFAULT, "Conference ID: %@     Account: %@    Handle: %@", buf, 0x20u);

      v58 = v262;
    }

    sub_2190076D0();
    v152 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_account(v58, v153, v154, v155, v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_loginStatusMessage(v157, v158, v159, v160, v161);
      v162 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v264 = v162;
      _os_log_impl(&dword_218FEA000, v152, OS_LOG_TYPE_DEFAULT, "    Account login status: %@", buf, 0xCu);

      v58 = v262;
    }

    sub_2190076D0();
    v163 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_account(v58, v164, v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isActive(v168, v169, v170, v171, v172))
        v173 = CFSTR("YES");
      else
        v173 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v264 = v173;
      _os_log_impl(&dword_218FEA000, v163, OS_LOG_TYPE_DEFAULT, "          Account active: %@", buf, 0xCu);

    }
    sub_2190076D0();
    v174 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v175, v176, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isConnected(v179, v180, v181, v182, v183))
        v184 = CFSTR("YES");
      else
        v184 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v264 = v184;
      _os_log_impl(&dword_218FEA000, v174, OS_LOG_TYPE_DEFAULT, "        Daemon Connected: %@", buf, 0xCu);

    }
    sub_2190076D0();
    v185 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v264 = Mutable;
      _os_log_impl(&dword_218FEA000, v185, OS_LOG_TYPE_DEFAULT, "              Properties: %@", buf, 0xCu);
    }

    sub_2190076D0();
    v186 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v264 = v39;
      _os_log_impl(&dword_218FEA000, v186, OS_LOG_TYPE_DEFAULT, "           Invitees Info: %@", buf, 0xCu);
    }
    v260 = v12;

    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v187, v188, v189, v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    isConnected = objc_msgSend_isConnected(v191, v192, v193, v194, v195);

    if ((isConnected & 1) == 0)
    {
      sub_2190076D0();
      v201 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v201, OS_LOG_TYPE_DEFAULT, "[WARN] Daemon was disconnected, we're connecting here....", buf, 2u);
      }

      objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v202, v203, v204, v205);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_connectToDaemon(v206, v207, v208, v209, v210);

    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v197, v198, v199, v200, v123);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v262;
    objc_msgSend_ID(v262, v212, v213, v214, v215);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conferenceID(v17, v217, v218, v219, v220);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v262, v222, v223, v224, v225);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uniqueID(v226, v227, v228, v229, v230);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestVCWithPerson_properties_conference_account_(v211, v232, (uint64_t)v216, (uint64_t)Mutable, (uint64_t)v221, v231);

    objc_msgSend__timings(v17, v233, v234, v235, v236);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimingForKey_(v237, v238, (uint64_t)CFSTR("invitation-delivery-time"), v239, v240);

    objc_msgSend__timings(v17, v241, v242, v243, v244);
    v245 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimingForKey_(v245, v246, (uint64_t)CFSTR("time-to-response"), v247, v248);
    v12 = v260;
    v11 = v261;
    v123 = v259;
  }
  else
  {
    sub_2190076D0();
    v245 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
    {
      v257 = objc_msgSend_state(v17, v253, v254, v255, v256);
      _NSStringDescriptionForIMAVChatState(v257);
      v258 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v264 = v258;
      _os_log_impl(&dword_218FEA000, v245, OS_LOG_TYPE_DEFAULT, "Chat state is %@, not sending invite to daemon", buf, 0xCu);

    }
  }

LABEL_58:
}

void sub_2190052B8(uint64_t a1, int a2, int a3, uint64_t a4, void *a5)
{
  sub_2190047BC(a2, a3, a4, a5, 0, *(void **)(a1 + 32));
}

void sub_219005818(uint64_t a1, int a2, int a3, uint64_t a4, void *a5)
{
  sub_21900583C(*(_DWORD *)(a1 + 40), 1, a2, a3, a4, a5, *(void **)(a1 + 32));
}

void sub_21900583C(int a1, int a2, int a3, int a4, uint64_t a5, void *a6, void *a7)
{
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  NSObject *v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  const __CFString *v27;
  NSObject *v28;
  const __CFString *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __CFString *Mutable;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int isVideo;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t hasReinitiateCapability;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  NSObject *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  __CFString *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  NSObject *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  __CFString *v190;
  NSObject *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const __CFString *v201;
  NSObject *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const __CFString *v212;
  NSObject *v213;
  NSObject *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  char isConnected;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  NSObject *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  void *v261;
  NSObject *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  unsigned int v267;
  __CFString *v268;
  NSObject *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  __CFString *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  __CFString *v295;
  void *v296;
  void *v297;
  _QWORD block[4];
  __CFString *v299;
  id v300;
  id v301;
  uint8_t buf[4];
  const __CFString *v303;
  __int16 v304;
  void *v305;
  __int16 v306;
  void *v307;
  uint64_t v308;

  v308 = *MEMORY[0x24BDAC8D0];
  v13 = a7;
  v14 = a6;
  objc_msgSend__avChatWithGUID_(IMAVChat, v15, a5, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantWithID_(v18, v19, (uint64_t)v14, v20, v21);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  sub_2190076D0();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v303) = a1;
    _os_log_impl(&dword_218FEA000, v23, OS_LOG_TYPE_DEFAULT, "Send response processing complete for: %d", buf, 8u);
  }

  sub_2190076D0();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CFSTR("NO");
    if (a2)
      v25 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v303 = v25;
    _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "  Needs Network: %@", buf, 0xCu);
  }

  sub_2190076D0();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = CFSTR("NO");
    if (a3)
      v27 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v303 = v27;
    _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "     Found WiFi: %@", buf, 0xCu);
  }

  sub_2190076D0();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = CFSTR("NO");
    if (a4)
      v29 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v303 = v29;
    _os_log_impl(&dword_218FEA000, v28, OS_LOG_TYPE_DEFAULT, "  Found Network: %@", buf, 0xCu);
  }

  if (v13
    || (objc_msgSend__callInfosWaitingForAcceptAction(v22, v30, v31, v32, v33),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend___imFirstObject(v34, v35, v36, v37, v38),
        v13 = (id)objc_claimAutoreleasedReturnValue(),
        v34,
        v13))
  {
    if (a2)
      goto LABEL_18;
LABEL_33:
    v44 = (__CFString *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    goto LABEL_34;
  }
  sub_2190076D0();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__participantsCallInfo(v22, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v303 = v22;
    v304 = 2112;
    v305 = v58;
    _os_log_impl(&dword_218FEA000, v53, OS_LOG_TYPE_DEFAULT, "[WARN] No Call info found for participant: %@  (All: %@)", buf, 0x16u);

  }
  v13 = 0;
  if (!a2)
    goto LABEL_33;
LABEL_18:
  sub_219000E70(CFSTR("Done"));
  if ((a4 & 1) == 0)
  {
    sub_2190076D0();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v52, OS_LOG_TYPE_DEFAULT, "  => Failing, no valid network", buf, 2u);
    }

    sub_2190076D0();
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v51 = "[WARN] Failed invite! network is not good";
    goto LABEL_28;
  }
  sub_219006E54(v18, v22, v13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (__CFString *)objc_msgSend_mutableCopy(v39, v40, v41, v42, v43);

  if (v44)
  {
LABEL_34:
    if (!objc_msgSend_isActive(v18, v45, v46, v47, v48))
    {
      sub_2190076D0();
      v262 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
      {
        v267 = objc_msgSend_state(v18, v263, v264, v265, v266);
        _NSStringDescriptionForIMAVChatState(v267);
        v268 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v303 = v268;
        _os_log_impl(&dword_218FEA000, v262, OS_LOG_TYPE_DEFAULT, "Chat state is %@, not sending response to daemon", buf, 0xCu);

      }
      goto LABEL_78;
    }
    objc_msgSend_imHandle(v22, v59, v60, v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)v63;
    if (a1 == 1)
    {
      sub_2190076D0();
      v269 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_ID(v64, v270, v271, v272, v273);
        v274 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v303 = v274;
        _os_log_impl(&dword_218FEA000, v269, OS_LOG_TYPE_DEFAULT, "Dealloc: Declining current chat with: %@", buf, 0xCu);

      }
      objc_msgSend_sharedInstance(IMAVController, v275, v276, v277, v278);
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_callerProperties(v18, v279, v280, v281, v282);
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(v64, v284, v285, v286, v287);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_conferenceID(v18, v289, v290, v291, v292);
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v261, v294, (uint64_t)v64, 1, (uint64_t)v283, v288, v293);

    }
    else
    {
      if (a1)
      {
LABEL_77:

LABEL_78:
        goto LABEL_79;
      }
      v297 = (void *)v63;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_2190071EC;
      block[3] = &unk_24DA57850;
      v295 = v22;
      v299 = v295;
      v65 = v13;
      v300 = v65;
      v66 = v18;
      v301 = v66;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_msgSend_setState_(v65, v67, 1, v68, v69);
      objc_msgSend_callerProperties(v66, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      Mutable = (__CFString *)objc_msgSend_mutableCopy(v74, v75, v76, v77, v78);

      v80 = (void *)MEMORY[0x24BDD16E0];
      v85 = objc_msgSend_sessionID(v66, v81, v82, v83, v84);
      objc_msgSend_numberWithUnsignedInt_(v80, v86, v85, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = *MEMORY[0x24BE504F0];
      objc_msgSend_setObject_forKey_(v44, v91, (uint64_t)v89, *MEMORY[0x24BE504F0], v92);

      objc_msgSend_remoteICEData(v65, v93, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      if (v97)
        CFDictionarySetValue((CFMutableDictionaryRef)v44, (const void *)*MEMORY[0x24BE504A8], v97);

      objc_msgSend_remoteNATType(v65, v98, v99, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if (v102)
        CFDictionarySetValue((CFMutableDictionaryRef)v44, (const void *)*MEMORY[0x24BE504C0], v102);

      objc_msgSend_remoteNATIP(v65, v103, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      if (v107)
        CFDictionarySetValue((CFMutableDictionaryRef)v44, (const void *)*MEMORY[0x24BE504B8], v107);

      if (!Mutable)
        Mutable = (__CFString *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      objc_msgSend_removeObjectForKey_(Mutable, v108, *MEMORY[0x24BE504D0], v109, v110);
      v111 = (void *)MEMORY[0x24BDD16E0];
      isVideo = objc_msgSend_isVideo(v66, v112, v113, v114, v115);
      objc_msgSend_numberWithBool_(v111, v117, isVideo ^ 1u, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(Mutable, v121, (uint64_t)v120, *MEMORY[0x24BE50450], v122);

      v123 = (void *)MEMORY[0x24BDD16E0];
      v128 = objc_msgSend_sessionID(v66, v124, v125, v126, v127);
      objc_msgSend_numberWithUnsignedInt_(v123, v129, v128, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(Mutable, v133, (uint64_t)v132, v90, v134);

      objc_msgSend_plistData(v44, v135, v136, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(Mutable, v140, (uint64_t)v139, *MEMORY[0x24BE504E0], v141);

      v142 = (void *)MEMORY[0x24BDD16E0];
      hasReinitiateCapability = objc_msgSend_hasReinitiateCapability(v295, v143, v144, v145, v146);
      objc_msgSend_numberWithInt_(v142, v148, hasReinitiateCapability, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(Mutable, v152, (uint64_t)v151, *MEMORY[0x24BE50470], v153);

      objc_msgSend__extraServerContext(v66, v154, v155, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v158, v159, v160, v161, v162))
        objc_msgSend_addEntriesFromDictionary_(Mutable, v163, (uint64_t)v158, v164, v165);
      v296 = v158;
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v163, 0, v164, v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(Mutable, v167, (uint64_t)v166, *MEMORY[0x24BE504D8], v168);

      sub_2190076D0();
      v169 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_conferenceID(v66, v170, v171, v172, v173);
        v174 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_account(v297, v175, v176, v177, v178);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v303 = v174;
        v304 = 2112;
        v305 = v179;
        v306 = 2112;
        v307 = v297;
        _os_log_impl(&dword_218FEA000, v169, OS_LOG_TYPE_DEFAULT, "Conference ID: %@     Account: %@    Handle: %@", buf, 0x20u);

      }
      sub_2190076D0();
      v180 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_account(v297, v181, v182, v183, v184);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_loginStatusMessage(v185, v186, v187, v188, v189);
        v190 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v303 = v190;
        _os_log_impl(&dword_218FEA000, v180, OS_LOG_TYPE_DEFAULT, "        Account login status: %@", buf, 0xCu);

      }
      sub_2190076D0();
      v191 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_account(v297, v192, v193, v194, v195);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isActive(v196, v197, v198, v199, v200))
          v201 = CFSTR("YES");
        else
          v201 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v303 = v201;
        _os_log_impl(&dword_218FEA000, v191, OS_LOG_TYPE_DEFAULT, "        Account active: %@", buf, 0xCu);

      }
      sub_2190076D0();
      v202 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v203, v204, v205, v206);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isConnected(v207, v208, v209, v210, v211))
          v212 = CFSTR("YES");
        else
          v212 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v303 = v212;
        _os_log_impl(&dword_218FEA000, v202, OS_LOG_TYPE_DEFAULT, "        Daemon Connected: %@", buf, 0xCu);

      }
      sub_2190076D0();
      v213 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v303 = Mutable;
        _os_log_impl(&dword_218FEA000, v213, OS_LOG_TYPE_DEFAULT, "                Response: %@", buf, 0xCu);
      }

      sub_2190076D0();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v303 = v44;
        _os_log_impl(&dword_218FEA000, v214, OS_LOG_TYPE_DEFAULT, "                Invitees: %@", buf, 0xCu);
      }

      objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v215, v216, v217, v218);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      isConnected = objc_msgSend_isConnected(v219, v220, v221, v222, v223);

      if ((isConnected & 1) == 0)
      {
        sub_2190076D0();
        v229 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218FEA000, v229, OS_LOG_TYPE_DEFAULT, "[WARN] Daemon was disconnected, we're connecting here....", buf, 2u);
        }

        objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v230, v231, v232, v233);
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_connectToDaemon(v234, v235, v236, v237, v238);

      }
      objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v225, v226, v227, v228);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ID(v297, v240, v241, v242, v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_conferenceID(v66, v245, v246, v247, v248);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(v297, v250, v251, v252, v253);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueID(v254, v255, v256, v257, v258);
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_respondToVCInvitationWithPerson_properties_conference_account_(v239, v260, (uint64_t)v244, (uint64_t)Mutable, (uint64_t)v249, v259);

      v64 = v297;
      v261 = v299;
    }

    goto LABEL_77;
  }
  sub_2190076D0();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v49, OS_LOG_TYPE_DEFAULT, "  => Failing, missing invitees info (Missing ICE Data)", buf, 2u);
  }

  sub_2190076D0();
  v50 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    goto LABEL_29;
  *(_WORD *)buf = 0;
  v51 = "[WARN] Failed invite! Invitees info returned nil (Missing ICE Data)";
LABEL_28:
  _os_log_impl(&dword_218FEA000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 2u);
LABEL_29:

  sub_219006DDC(v18);
LABEL_79:

}

void sub_219006790(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int isScreenLit;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  NSObject *v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  id v71;
  id v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  __int128 *p_buf;
  uint64_t v84;
  uint8_t v85[4];
  uint64_t v86;
  __int16 v87;
  double v88;
  __int128 buf;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__avChatWithGUID_(IMAVChat, a2, *(_QWORD *)(a1 + 32), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_219000E70(CFSTR("Network"));
  objc_msgSend_sharedInstance(MEMORY[0x24BE30360], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_allowAnyNetwork(v11, v12, v13, v14, v15) & 1) != 0)
  {
    sub_2190076D0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_218FEA000, v16, OS_LOG_TYPE_DEFAULT, "We're allowed to use any network, bypassing check", (uint8_t *)&buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    sub_218FFFE10(1);
    if (*(_BYTE *)(a1 + 56))
      v21 = 1;
    else
      v21 = 5;
    v22 = *(_BYTE *)(a1 + 57) == 0;
    objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v17, v18, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_nonWifiFaceTimeAvailable(v23, v24, v25, v26, v27);

    if ((v28 & v22) != 0)
      v33 = v21;
    else
      v33 = v21 | 2;
    if (v28)
      v34 = 7.0;
    else
      v34 = 30.0;
    if (v28)
      v35 = 3;
    else
      v35 = 1;
    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v29, v30, v31, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    isScreenLit = objc_msgSend_isScreenLit(v36, v37, v38, v39, v40);

    if (isScreenLit)
    {
      v42 = objc_alloc_init(MEMORY[0x24BDBCE60]);
      objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v43, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateScreenLightLastChanged(v47, v48, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_timeIntervalSinceDate_(v42, v53, (uint64_t)v52, v54, v55);
      v57 = v56;
      sub_2190076D0();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = v57;
        _os_log_impl(&dword_218FEA000, v58, OS_LOG_TYPE_DEFAULT, "Time since lights on: %f", (uint8_t *)&buf, 0xCu);
      }

      v59 = 0.0;
      if (v57 < v34)
        v59 = v34 - v57;
      if (v57 > 0.0)
        v34 = v59;

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v90 = 0x2020000000;
    v91 = 0;
    IMTimeOfDay();
    v61 = v60;
    objc_msgSend__timings(v6, v62, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimingForKey_(v66, v67, (uint64_t)CFSTR("network-check"), v68, v69);

    sub_2190076D0();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v85 = 134218240;
      v86 = 0x404E000000000000;
      v87 = 2048;
      v88 = v34;
      _os_log_impl(&dword_218FEA000, v70, OS_LOG_TYPE_DEFAULT, "Starting availability check with network timeout: %fs   wifi timeout: %fs", v85, 0x16u);
    }

    v71 = objc_alloc(MEMORY[0x24BE50330]);
    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3221225472;
    v79[2] = sub_219006B70;
    v79[3] = &unk_24DA577D8;
    v72 = *(id *)(a1 + 32);
    v84 = v61;
    v80 = v72;
    p_buf = &buf;
    v82 = *(id *)(a1 + 48);
    v81 = *(id *)(a1 + 40);
    v74 = (void *)objc_msgSend_initWithFlags_options_timeout_wifiTimeout_completionBlock_(v71, v73, v35, v33, (uint64_t)v79, 60.0, v34);
    objc_msgSend_start(v74, v75, v76, v77, v78);

    _Block_object_dispose(&buf, 8);
  }

}

void sub_219006B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_219006B70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  const char *v8;
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
  NSObject *v20;
  double v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  const __CFString *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  void *v34;
  int v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__avChatWithGUID_(IMAVChat, a2, *(_QWORD *)(a1 + 32), a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isActive(v7, v8, v9, v10, v11) & 1) != 0)
  {
    objc_msgSend__timings(v7, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTimingForKey_(v16, v17, (uint64_t)CFSTR("network-check"), v18, v19);

    sub_2190076D0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      IMTimeOfDay();
      v22 = v21 - *(double *)(a1 + 64);
      v35 = 134217984;
      v36 = v22;
      _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "      * Network check complete  (Took %f seconds)", (uint8_t *)&v35, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    sub_2190076D0();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      if (v23)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v35 = 138412290;
      v36 = *(double *)&v25;
      _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "     Found Usable Network: %@", (uint8_t *)&v35, 0xCu);
    }

    sub_2190076D0();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if ((v23 & 1) != 0)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      v35 = 138412290;
      v36 = *(double *)&v27;
      _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "        Found Active WiFi: %@", (uint8_t *)&v35, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    sub_2190076D0();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend_state(v7, v29, v30, v31, v32);
      _NSStringDescriptionForIMAVChatState(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412290;
      v36 = *(double *)&v34;
      _os_log_impl(&dword_218FEA000, v28, OS_LOG_TYPE_DEFAULT, "Chat state is %@, not finishing operation", (uint8_t *)&v35, 0xCu);

    }
  }

}

void sub_219006DDC(void *a1)
{
  id v1;
  id v2;
  _QWORD block[4];
  id v4;

  v1 = a1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_219007190;
  block[3] = &unk_24DA57828;
  v4 = v1;
  v2 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

id sub_219006E54(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
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
  int v20;
  NSObject *v21;
  const __CFString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
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
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  NSObject *v60;
  int v62;
  id v63;
  __int16 v64;
  const __CFString *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v62 = 138412290;
    v63 = v6;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Getting network data for: %@", (uint8_t *)&v62, 0xCu);
  }

  if (v7)
  {
    objc_msgSend__timings(v5, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimingForKey_(v13, v14, (uint64_t)CFSTR("ice-data-query"), v15, v16);

    v20 = objc_msgSend__generateCallInfo_(v6, v17, (uint64_t)v7, v18, v19);
    sub_2190076D0();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = CFSTR("NO");
      if (v20)
        v22 = CFSTR("YES");
      v62 = 138412546;
      v63 = v7;
      v64 = 2112;
      v65 = v22;
      _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "   Got call info: %@  (Success: %@)", (uint8_t *)&v62, 0x16u);
    }

    objc_msgSend_localICEData(v7, v23, v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_localNATIP(v7, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localNATType(v7, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localSKEData(v7, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__timings(v5, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTimingForKey_(v47, v48, (uint64_t)CFSTR("ice-data-query"), v49, v50);

    v51 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (objc_msgSend_length(v27, v52, v53, v54, v55))
    {
      objc_msgSend_setObject_forKey_(v51, v56, (uint64_t)v27, *MEMORY[0x24BE50478], v57);
      if (v32)
        objc_msgSend_setObject_forKey_(v51, v58, (uint64_t)v32, *MEMORY[0x24BE50490], v59);
      if (v37)
        objc_msgSend_setObject_forKey_(v51, v58, (uint64_t)v37, *MEMORY[0x24BE50498], v59);
      if (v42)
        objc_msgSend_setObject_forKey_(v51, v58, (uint64_t)v42, *MEMORY[0x24BE504E8], v59);
    }
    else
    {
      sub_2190076D0();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v62 = 138412290;
        v63 = v6;
        _os_log_impl(&dword_218FEA000, v60, OS_LOG_TYPE_DEFAULT, "[WARN] Could not gather ICE Data for participant: %@", (uint8_t *)&v62, 0xCu);
      }

      v51 = 0;
    }

  }
  else
  {
    sub_2190076D0();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v62 = 138412290;
      v63 = v6;
      _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "[WARN]  *** No CallInfo passed into network check for: %@", (uint8_t *)&v62, 0xCu);
    }
    v51 = 0;
  }

  return v51;
}

uint64_t sub_219007190(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_nonWifiFaceTimeAvailable(v6, v7, v8, v9, v10);

  if (v11)
    v14 = 6600;
  else
    v14 = 6000;
  return objc_msgSend__endChatWithReason_andError_(*(void **)(a1 + 32), v12, 12, v14, v13);
}

void sub_2190071EC(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  int v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__callInfoWithState_(a1[4], a2, 3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (v6)
  {
    objc_msgSend_setIsBeingHandedOff_(v6, v7, 1, v8, v9);
    objc_msgSend_setIsReinitiate_(a1[5], v11, 1, v12, v13);
    objc_msgSend_sharedInstance(IMAVInterface, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (uint64_t)a1[6];
    v24 = objc_msgSend_callID(v10, v20, v21, v22, v23);
    objc_msgSend_endAVConferenceWithChat_callID_(v18, v25, v19, v24, v26);

    sub_2190076D0();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v56 = 138412290;
      v57 = v10;
      _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "Officially stopping the call we're handing off from %@", (uint8_t *)&v56, 0xCu);
    }

    v28 = a1[6];
    objc_msgSend_vcPartyID(a1[4], v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conferencePersonWithID_mediaDidStall_(v28, v34, (uint64_t)v33, 1, v35);

    objc_msgSend__setIsAudioInterrupted_(a1[6], v36, 1, v37, v38);
    objc_msgSend__setIsVideoInterrupted_(a1[6], v39, 1, v40, v41);
  }
  else
  {
    sub_2190076D0();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v51 = a1[4];
      objc_msgSend__participantsCallInfo(v51, v47, v48, v49, v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 138412546;
      v57 = v51;
      v58 = 2112;
      v59 = v52;
      _os_log_impl(&dword_218FEA000, v46, OS_LOG_TYPE_DEFAULT, "No connected call info found for participant: %@  (All: %@)", (uint8_t *)&v56, 0x16u);

    }
  }
  objc_msgSend_sharedInstance(IMAVInterface, v42, v43, v44, v45);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_avChat_prepareConnectionWithCallInfo_(v53, v54, (uint64_t)a1[6], (uint64_t)a1[5], v55);

}

id sub_2190076D0()
{
  if (qword_253DE9308 != -1)
    dispatch_once(&qword_253DE9308, &unk_24DA57870);
  return (id)qword_253DE9300;
}

void sub_219007710()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.imavcore", "Default");
  v1 = (void *)qword_253DE9300;
  qword_253DE9300 = (uint64_t)v0;

}

void sub_219007FC4(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], a2, *(_QWORD *)(a1 + 32), (uint64_t)sel__connectionTimeout_, 0, 0, *(double *)(*(_QWORD *)(a1 + 32) + 272));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setConnectionTimeoutTimer_(*(void **)(a1 + 32), v3, (uint64_t)v6, v4, v5);

}

void sub_219008324(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_msgSend_date(MEMORY[0x24BDBCE60], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setInviteTimeoutTimerStart_(*(void **)(a1 + 32), v7, (uint64_t)v6, v8, v9);

  objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], v10, *(_QWORD *)(a1 + 32), (uint64_t)sel__invitationTimeout_, 0, 0, *(double *)(*(_QWORD *)(a1 + 32) + 280));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setInviteTimeoutTimer_(*(void **)(a1 + 32), v11, (uint64_t)v14, v12, v13);

}

void sub_219008718(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = 0x4008000000000000;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "Setting first frame timeout timer for %f seconds", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], v3, *(_QWORD *)(a1 + 32), (uint64_t)sel__firstFrameTimeout_, 0, 0, 3.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setFirstFrameTimeoutTimer_(*(void **)(a1 + 32), v5, (uint64_t)v4, v6, v7);

}

void sub_21900A7E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  NSObject *v46;
  uint8_t v47[16];
  uint8_t buf[16];

  objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), a2, 2, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 3, v7, v8),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    sub_2190076D0();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v13, OS_LOG_TYPE_DEFAULT, "Connection started, passing relay initiate along", buf, 2u);
    }

    objc_msgSend_sharedInstance(IMAVInterface, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleRelayInitate_fromParticipant_callInfo_(v18, v19, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), (uint64_t)v9);

    v28 = objc_msgSend_state(*(void **)(a1 + 48), v20, v21, v22, v23);
    v29 = *(void **)(a1 + 48);
    if (v28 == 3)
    {
      objc_msgSend__clearInvitationTimeoutTimer(v29, v24, v25, v26, v27);
      objc_msgSend__setConnectionTimeoutTimer(*(void **)(a1 + 48), v30, v31, v32, v33);
    }
    else if (objc_msgSend_state(v29, v24, v25, v26, v27) == 4)
    {
      objc_msgSend__clearConnectionTimeoutTimer(*(void **)(a1 + 48), v34, v35, v36, v37);
      objc_msgSend__clearInvitationTimeoutTimer(*(void **)(a1 + 48), v38, v39, v40, v41);
    }
  }
  else
  {
    objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v10, 1, v11, v12);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v9 = v42;
      objc_msgSend_setRelayInitiate_(v42, v43, *(_QWORD *)(a1 + 40), v44, v45);
    }
    else
    {
      sub_2190076D0();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_218FEA000, v46, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping relay initiate, no call info found", v47, 2u);
      }

      v9 = 0;
    }
  }

}

void sub_21900AB38(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), a2, 2, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 3, v8, v9),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = objc_msgSend_state(*(void **)(a1 + 40), v6, v7, v8, v9);
    sub_2190076D0();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 >= 3)
    {
      if (v13)
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "Connection started, passing relay update along", (uint8_t *)&v27, 2u);
      }

      objc_msgSend_sharedInstance(IMAVInterface, v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleRelayUpdate_fromParticipant_callInfo_(v18, v19, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (uint64_t)v10);

      goto LABEL_11;
    }
    if (!v13)
    {
LABEL_10:

      objc_msgSend_setRelayUpdate_(v10, v23, *(_QWORD *)(a1 + 48), v24, v25);
      goto LABEL_11;
    }
    v27 = 138412290;
    v28 = v10;
    v20 = "Connection has not yet started, but participant call info has: %@";
    v21 = v12;
    v22 = 12;
LABEL_9:
    _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, v22);
    goto LABEL_10;
  }
  objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v12 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v26)
      goto LABEL_10;
    LOWORD(v27) = 0;
    v20 = "Connection has not yet started, holding onto relay update";
    v21 = v12;
    v22 = 2;
    goto LABEL_9;
  }
  if (v26)
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping relay update, no call info found", (uint8_t *)&v27, 2u);
  }
  v10 = v12;
LABEL_11:

}

void sub_21900AE98(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];

  objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), a2, 2, a4, a5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    || (objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 3, v8, v9),
        (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (objc_msgSend_state(*(void **)(a1 + 40), v6, v7, v8, v9) < 3)
    {
      objc_msgSend_setRelayCancel_(v10, v11, *(_QWORD *)(a1 + 48), v12, v13);
      sub_2190076D0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "Connection has not yet started, holding onto relay cancel", v27, 2u);
      }

    }
    else
    {
      sub_2190076D0();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "Connection started, passing relay cancel along", buf, 2u);
      }

      objc_msgSend_sharedInstance(IMAVInterface, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleRelayCancel_fromParticipant_callInfo_(v19, v20, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (uint64_t)v10);

    }
  }
  else
  {
    objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 1, v8, v9);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v10 = v22;
      objc_msgSend_setRelayCancel_(v22, v23, *(_QWORD *)(a1 + 48), v24, v25);
    }
    else
    {
      sub_2190076D0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping relay cancel, no call info found", v26, 2u);
      }
    }
  }

}

void sub_21900E924()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1788]);
  v1 = (void *)qword_253DE9468;
  qword_253DE9468 = (uint64_t)v0;

}

void sub_219010FD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_applicationProxyForIdentifier_(MEMORY[0x24BDC1538], a2, (uint64_t)CFSTR("com.apple.facetime"), a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_machOUUIDs(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v10, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)qword_25503B950;
  qword_25503B950 = v15;

  if (!qword_25503B950)
  {
    sub_2190076D0();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = CFSTR("com.apple.facetime");
      _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not determine UUID for %@", (uint8_t *)&v18, 0xCu);
    }

  }
}

uint64_t sub_2190116CC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "Could not create AVConference for avChat %@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend__endChatWithReason_andError_(*(void **)(a1 + 32), v4, 15, 6100, v5);
}

void sub_219014234(void **a1)
{
  int AppBooleanValue;
  _BOOL8 v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t isVideo;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t isVideoPaused;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  const char *v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  _BOOL8 v103;
  const char *v104;
  uint64_t v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t isCaller;
  const char *v150;
  char v151;
  id v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  NSObject *v170;
  id v171;
  void *v172;
  id v173;
  _QWORD block[4];
  id v175;
  void *v176;
  id v177;
  id v178;
  id v179;
  char v180;
  id v181;
  uint8_t buf[4];
  uint64_t v183;
  __int16 v184;
  id v185;
  uint64_t v186;

  v186 = *MEMORY[0x24BDAC8D0];
  CFPreferencesAppSynchronize(CFSTR("com.apple.conference"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("disablePeerCerts"), CFSTR("com.apple.conference"), 0);
  v3 = CFPreferencesGetAppBooleanValue(CFSTR("disableKeyExchange"), CFSTR("com.apple.conference"), 0) == 0;
  v4 = objc_alloc_init((Class)qword_253DE9458);
  objc_msgSend_setIsKeyExchangeEnabled_(v4, v5, v3, v6, v7);
  objc_msgSend_setIsAudioEnabled_(v4, v8, 1, v9, v10);
  isVideo = objc_msgSend_isVideo(a1[4], v11, v12, v13, v14);
  objc_msgSend_setIsVideoEnabled_(v4, v16, isVideo, v17, v18);
  v19 = CFPreferencesGetAppBooleanValue(CFSTR("forceRelay"), CFSTR("com.apple.conference"), 0) != 0;
  objc_msgSend_setIsRelayForced_(v4, v20, v19, v21, v22);
  v23 = CFPreferencesGetAppBooleanValue(CFSTR("disableRelay"), CFSTR("com.apple.conference"), 0) == 0;
  objc_msgSend_setIsRelayEnabled_(v4, v24, v23, v25, v26);
  v30 = objc_msgSend__deviceRoleForAVChat_(a1[5], v27, (uint64_t)a1[4], v28, v29);
  objc_msgSend_setDeviceRole_(v4, v31, v30, v32, v33);
  if (IMGetAppBoolForKey())
    objc_msgSend_setIsAudioPausedToStart_(v4, v34, 1, v35, v36);
  if (IMGetAppBoolForKey())
    objc_msgSend_setIsVideoPausedToStart_(v4, v37, 1, v39, v40);
  if ((objc_msgSend_isVideo(a1[4], v37, v38, v39, v40) & 1) == 0)
  {
    objc_msgSend_setIsVideoPausedToStart_(v4, v41, 1, v43, v44);
    objc_msgSend_setIsVideoEnabled_(v4, v45, 0, v46, v47);
  }
  v48 = objc_msgSend_callID(a1[6], v41, v42, v43, v44);
  sub_2190076D0();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = a1[4];
    *(_DWORD *)buf = 138412546;
    v183 = (uint64_t)v50;
    v184 = 1024;
    LODWORD(v185) = v48;
    _os_log_impl(&dword_218FEA000, v49, OS_LOG_TYPE_DEFAULT, "chat: %@  callID: %d", buf, 0x12u);
  }
  v51 = v48;

  objc_msgSend_peerCN(a1[6], v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isReinitiate(a1[6], v57, v58, v59, v60))
  {
    v65 = a1[7];
    objc_msgSend_localParticipant(a1[4], v61, v62, v63, v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    isVideoPaused = objc_msgSend_isVideoPaused(v66, v67, v68, v69, v70);
    v76 = objc_msgSend_callID(a1[6], v72, v73, v74, v75);
    objc_msgSend_setPauseVideo_callID_error_(v65, v77, isVideoPaused, v76, 0);

  }
  if (!AppBooleanValue)
  {
    sub_2190076D0();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v183 = (uint64_t)v56;
      _os_log_impl(&dword_218FEA000, v78, OS_LOG_TYPE_DEFAULT, "Setting peer CN to: %@", buf, 0xCu);
    }

    objc_msgSend__timings(a1[4], v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimingForKey_(v83, v84, (uint64_t)CFSTR("setting-peer-cn-time"), v85, v86);

    objc_msgSend_setPeerCN_callID_(a1[7], v87, (uint64_t)v56, v51, v88);
    objc_msgSend__timings(a1[4], v89, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTimingForKey_(v93, v94, (uint64_t)CFSTR("setting-peer-cn-time"), v95, v96);

  }
  objc_msgSend_peerProtocolVersion(a1[6], v61, v62, v63, v64);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend_integerValue(v97, v98, v99, v100, v101);

  v103 = v102 > 1;
  objc_msgSend_setPeerProtocolVersion_forCallID_(a1[7], v104, v103, v51, v105);
  sub_2190076D0();
  v106 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v183) = v103;
    _os_log_impl(&dword_218FEA000, v106, OS_LOG_TYPE_DEFAULT, "Setting peer protocol version %d", buf, 8u);
  }

  sub_2190148AC(a1[6]);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v108 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v183 = v51;
    v184 = 2112;
    v185 = v4;
    _os_log_impl(&dword_218FEA000, v108, OS_LOG_TYPE_DEFAULT, "Calling startConnectionWithCallID with callID %ld capabilities %@", buf, 0x16u);
  }

  objc_msgSend_relayInitiate(a1[6], v109, v110, v111, v112);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (v117)
  {
    objc_msgSend_relayInitiate(a1[6], v113, v114, v115, v116);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2190149FC(v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v119 = 0;
  }

  sub_2190076D0();
  v120 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_localParticipant(a1[4], v121, v122, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vcPartyID(v125, v126, v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vcPartyID(a1[8], v131, v132, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v183 = (uint64_t)v130;
    v184 = 2112;
    v185 = v135;
    _os_log_impl(&dword_218FEA000, v120, OS_LOG_TYPE_DEFAULT, "Calling startConnection for: %@ <=> %@", buf, 0x16u);

  }
  objc_msgSend__timings(a1[4], v136, v137, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTimingForKey_(v140, v141, (uint64_t)CFSTR("start-connection-time"), v142, v143);

  v144 = a1[7];
  isCaller = objc_msgSend_isCaller(a1[4], v145, v146, v147, v148);
  v181 = 0;
  v151 = objc_msgSend_startConnectionWithCallID_usingInviteData_isCaller_relayResponseDict_didOriginateRelayRequest_capabilities_error_(v144, v150, v51, (uint64_t)v107, isCaller, v119, 0, v4, &v181);
  v152 = v181;
  objc_msgSend__timings(a1[4], v153, v154, v155, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTimingForKey_(v157, v158, (uint64_t)CFSTR("start-connection-time"), v159, v160);

  objc_msgSend_setRelayInitiate_(a1[6], v161, 0, v162, v163);
  objc_msgSend_setState_(a1[6], v164, 2, v165, v166);
  objc_msgSend__setConnectionStarted_(a1[4], v167, 1, v168, v169);
  if ((v151 & 1) == 0)
  {
    sub_2190076D0();
    v170 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v183 = (uint64_t)v152;
      _os_log_impl(&dword_218FEA000, v170, OS_LOG_TYPE_DEFAULT, "[WARN]         startConnectionWithParticipantID error: %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_219015130;
  block[3] = &unk_24DA578D8;
  v180 = v151;
  v171 = a1[6];
  v172 = a1[5];
  v175 = v171;
  v176 = v172;
  v177 = a1[8];
  v178 = a1[4];
  v179 = v152;
  v173 = v152;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

id sub_2190148AC(void *a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void **v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *Mutable;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v5 = a1;
  if (!qword_25503B940)
  {
    v6 = (void **)MEMORY[0x219A282F8]("AVConferenceInviteDataConnectionBlob", CFSTR("AVConference"));
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&qword_25503B940, v7);
  }
  if (!qword_25503B948)
  {
    v8 = (void **)MEMORY[0x219A282F8]("AVConferenceInviteDataSKEBlob", CFSTR("AVConference"));
    if (v8)
      v9 = *v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&qword_25503B948, v9);
  }
  objc_msgSend_remoteSKEData(v5, v1, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else
  {
    objc_msgSend_remoteICEData(v5, v11, v12, v13, v14);
    Mutable = (void *)objc_claimAutoreleasedReturnValue();

    if (!Mutable)
      goto LABEL_19;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  objc_msgSend_remoteSKEData(v5, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, (const void *)qword_25503B948, v20);

  objc_msgSend_remoteICEData(v5, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, (const void *)qword_25503B940, v25);

LABEL_19:
  return Mutable;
}

id sub_2190149FC(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
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
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
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
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
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
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = *MEMORY[0x24BE4FF48];
  objc_msgSend_objectForKey_(v1, v4, *MEMORY[0x24BE4FF48], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_objectForKey_(v1, v8, v3, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v12, (uint64_t)v11, qword_253DE93B0, v13);

  }
  v14 = *MEMORY[0x24BE4FF68];
  objc_msgSend_objectForKey_(v1, v8, *MEMORY[0x24BE4FF68], v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_objectForKey_(v1, v16, v14, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v20, (uint64_t)v19, qword_253DE9418, v21);

  }
  v22 = *MEMORY[0x24BE4FF58];
  objc_msgSend_objectForKey_(v1, v16, *MEMORY[0x24BE4FF58], v17, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_objectForKey_(v1, v24, v22, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v28, (uint64_t)v27, qword_253DE9408, v29);

  }
  v30 = *MEMORY[0x24BE4FF60];
  objc_msgSend_objectForKey_(v1, v24, *MEMORY[0x24BE4FF60], v25, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_objectForKey_(v1, v32, v30, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v36, (uint64_t)v35, qword_253DE9410, v37);

  }
  v38 = *MEMORY[0x24BE4FF10];
  objc_msgSend_objectForKey_(v1, v32, *MEMORY[0x24BE4FF10], v33, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_objectForKey_(v1, v40, v38, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v44, (uint64_t)v43, qword_253DE93D0, v45);

  }
  v46 = *MEMORY[0x24BE4FF20];
  objc_msgSend_objectForKey_(v1, v40, *MEMORY[0x24BE4FF20], v41, v42);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_objectForKey_(v1, v48, v46, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v52, (uint64_t)v51, qword_253DE93D8, v53);

  }
  v54 = *MEMORY[0x24BE4FF08];
  objc_msgSend_objectForKey_(v1, v48, *MEMORY[0x24BE4FF08], v49, v50);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend_objectForKey_(v1, v56, v54, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v60, (uint64_t)v59, qword_253DE93C0, v61);

  }
  v62 = *MEMORY[0x24BE4FF18];
  objc_msgSend_objectForKey_(v1, v56, *MEMORY[0x24BE4FF18], v57, v58);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend_objectForKey_(v1, v64, v62, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v68, (uint64_t)v67, qword_253DE93C8, v69);

  }
  v70 = *MEMORY[0x24BE4FFA0];
  objc_msgSend_objectForKey_(v1, v64, *MEMORY[0x24BE4FFA0], v65, v66);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend_objectForKey_(v1, v72, v70, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v76, (uint64_t)v75, qword_253DE9450, v77);

  }
  v78 = *MEMORY[0x24BE4FF00];
  objc_msgSend_objectForKey_(v1, v72, *MEMORY[0x24BE4FF00], v73, v74);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend_objectForKey_(v1, v80, v78, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v84, (uint64_t)v83, qword_253DE93B8, v85);

  }
  v86 = *MEMORY[0x24BE4FF98];
  objc_msgSend_objectForKey_(v1, v80, *MEMORY[0x24BE4FF98], v81, v82);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend_objectForKey_(v1, v88, v86, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v92, (uint64_t)v91, qword_253DE9448, v93);

  }
  v94 = *MEMORY[0x24BE4FF90];
  objc_msgSend_objectForKey_(v1, v88, *MEMORY[0x24BE4FF90], v89, v90);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (v95)
  {
    objc_msgSend_objectForKey_(v1, v96, v94, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v100, (uint64_t)v99, qword_253DE9440, v101);

  }
  v102 = *MEMORY[0x24BE4FF28];
  objc_msgSend_objectForKey_(v1, v96, *MEMORY[0x24BE4FF28], v97, v98);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v103)
  {
    objc_msgSend_objectForKey_(v1, v104, v102, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v108, (uint64_t)v107, qword_253DE93E0, v109);

  }
  v110 = *MEMORY[0x24BE4FF40];
  objc_msgSend_objectForKey_(v1, v104, *MEMORY[0x24BE4FF40], v105, v106);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  if (v111)
  {
    objc_msgSend_objectForKey_(v1, v112, v110, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v116, (uint64_t)v115, qword_253DE93F8, v117);

  }
  v118 = *MEMORY[0x24BE4FF70];
  objc_msgSend_objectForKey_(v1, v112, *MEMORY[0x24BE4FF70], v113, v114);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (v119)
  {
    objc_msgSend_objectForKey_(v1, v120, v118, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v124, (uint64_t)v123, qword_253DE9420, v125);

  }
  v126 = *MEMORY[0x24BE4FF88];
  objc_msgSend_objectForKey_(v1, v120, *MEMORY[0x24BE4FF88], v121, v122);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  if (v127)
  {
    objc_msgSend_objectForKey_(v1, v128, v126, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v132, (uint64_t)v131, qword_253DE9438, v133);

  }
  v134 = *MEMORY[0x24BE4FF78];
  objc_msgSend_objectForKey_(v1, v128, *MEMORY[0x24BE4FF78], v129, v130);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  if (v135)
  {
    objc_msgSend_objectForKey_(v1, v136, v134, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v140, (uint64_t)v139, qword_253DE9428, v141);

  }
  v142 = *MEMORY[0x24BE4FF80];
  objc_msgSend_objectForKey_(v1, v136, *MEMORY[0x24BE4FF80], v137, v138);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  if (v143)
  {
    objc_msgSend_objectForKey_(v1, v144, v142, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v148, (uint64_t)v147, qword_253DE9430, v149);

  }
  v150 = *MEMORY[0x24BE4FF30];
  objc_msgSend_objectForKey_(v1, v144, *MEMORY[0x24BE4FF30], v145, v146);
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  if (v151)
  {
    objc_msgSend_objectForKey_(v1, v152, v150, v153, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v156, (uint64_t)v155, qword_253DE93E8, v157);

  }
  v158 = *MEMORY[0x24BE4FF38];
  objc_msgSend_objectForKey_(v1, v152, *MEMORY[0x24BE4FF38], v153, v154);
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  if (v159)
  {
    objc_msgSend_objectForKey_(v1, v160, v158, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v164, (uint64_t)v163, qword_253DE93F0, v165);

  }
  if (qword_253DE9400)
  {
    v166 = *MEMORY[0x24BE4FF50];
    objc_msgSend_objectForKey_(v1, v160, *MEMORY[0x24BE4FF50], v161, v162);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    if (v167)
    {
      objc_msgSend_objectForKey_(v1, v168, v166, v169, v170);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v2, v172, (uint64_t)v171, qword_253DE9400, v173);

    }
  }

  return v2;
}

void sub_219015130(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend_relayInitiate(*(void **)(a1 + 32), a2, a3, a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      sub_2190076D0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "Also passing along a pending relay initate", buf, 2u);
      }

      objc_msgSend_handleRelayInitate_fromParticipant_callInfo_(*(void **)(a1 + 40), v12, (uint64_t)v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      objc_msgSend_setRelayInitiate_(*(void **)(a1 + 32), v13, 0, v14, v15);
    }
    objc_msgSend_relayUpdate(*(void **)(a1 + 32), v6, v7, v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      sub_2190076D0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "Also passing along a pending relay update", v33, 2u);
      }

      objc_msgSend_handleRelayUpdate_fromParticipant_callInfo_(*(void **)(a1 + 40), v22, (uint64_t)v16, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      objc_msgSend_setRelayUpdate_(*(void **)(a1 + 32), v23, 0, v24, v25);
    }
    objc_msgSend_relayCancel(*(void **)(a1 + 32), v17, v18, v19, v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      sub_2190076D0();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "Also passing along a pending relay cancel", v32, 2u);
      }

      objc_msgSend_handleRelayCancel_fromParticipant_callInfo_(*(void **)(a1 + 40), v28, (uint64_t)v26, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      objc_msgSend_setRelayCancel_(*(void **)(a1 + 32), v29, 0, v30, v31);
    }

  }
  else
  {
    objc_msgSend__handleAVError_(*(void **)(a1 + 56), a2, *(_QWORD *)(a1 + 64), a4, a5);
  }
}

void sub_2190155AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2190155D8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2190155E8(uint64_t a1)
{

}

void sub_2190155F0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  int v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  const __CFString *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  dispatch_semaphore_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unsigned int v104;
  const char *v105;
  uint64_t v106;
  NSObject *v107;
  void *v108;
  uint64_t v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  const char *v115;
  dispatch_time_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  _QWORD v173[4];
  id v174;
  NSObject *v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t (*v182)(uint64_t, uint64_t);
  void (*v183)(uint64_t);
  id v184;
  uint8_t buf[4];
  uint64_t v186;
  __int16 v187;
  uint64_t v188;
  __int16 v189;
  int v190;
  uint64_t v191;

  v191 = *MEMORY[0x24BDAC8D0];
  v179 = 0;
  v180 = &v179;
  v181 = 0x3032000000;
  v182 = sub_2190155D8;
  v183 = sub_2190155E8;
  v184 = 0;
  objc_msgSend_localParticipant(*(void **)(a1 + 32), a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__timings(*(void **)(a1 + 32), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTimingForKey_(v11, v12, (uint64_t)CFSTR("initialize-new-call-time"), v13, v14);

  v18 = objc_msgSend__deviceRoleForAVChat_(*(void **)(a1 + 40), v15, *(_QWORD *)(a1 + 32), v16, v17);
  v22 = objc_msgSend_initializeNewCallWithDeviceRole_(*(void **)(a1 + 48), v19, v18, v20, v21);
  objc_msgSend_setCallID_(*(void **)(a1 + 56), v23, v22, v24, v25);
  objc_msgSend__timings(*(void **)(a1 + 32), v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTimingForKey_(v30, v31, (uint64_t)CFSTR("initialize-new-call-time"), v32, v33);

  sub_2190076D0();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v186 = v22;
    v187 = 1024;
    LODWORD(v188) = v18;
    _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, "Created call ID %ld with device role %d", buf, 0x12u);
  }

  sub_2190076D0();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v40 = *(void **)(a1 + 32);
    v41 = *(_QWORD *)(a1 + 64);
    v42 = objc_msgSend__bustedCallID(v40, v36, v37, v38, v39);
    *(_DWORD *)buf = 138412802;
    v186 = (uint64_t)v40;
    v187 = 2112;
    v188 = v41;
    v189 = 1024;
    v190 = v42;
    _os_log_impl(&dword_218FEA000, v35, OS_LOG_TYPE_DEFAULT, "chat: %@  handle: %@ callID: %d", buf, 0x1Cu);
  }

  sub_2190076D0();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_vcPartyID(v6, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v186 = (uint64_t)v48;
    _os_log_impl(&dword_218FEA000, v43, OS_LOG_TYPE_DEFAULT, "Getting connection data for: %@", buf, 0xCu);

  }
  sub_2190076D0();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v54 = *(void **)(a1 + 32);
    v55 = *(_QWORD *)(a1 + 64);
    v56 = objc_msgSend__bustedCallID(v54, v50, v51, v52, v53);
    *(_DWORD *)buf = 138412802;
    v186 = (uint64_t)v54;
    v187 = 2112;
    v188 = v55;
    v189 = 1024;
    v190 = v56;
    _os_log_impl(&dword_218FEA000, v49, OS_LOG_TYPE_DEFAULT, "chat: %@  handle: %@ callID: %d", buf, 0x1Cu);
  }

  sub_219000E70(CFSTR("AVConference Configuration"));
  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_nonWifiFaceTimeAvailable(v61, v62, v63, v64, v65);

  if (v66)
    objc_msgSend_setRequiresWifi_(*(void **)(a1 + 48), v67, 0, v68, v69);
  sub_2190076D0();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    v71 = CFSTR("YES");
    if (v66)
      v71 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v186 = (uint64_t)v71;
    _os_log_impl(&dword_218FEA000, v70, OS_LOG_TYPE_DEFAULT, "setRequiresWiFi: %@ after checking network availability", buf, 0xCu);
  }

  objc_msgSend__timings(*(void **)(a1 + 32), v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTimingForKey_(v76, v77, (uint64_t)CFSTR("time-to-connection-data-gathering"), v78, v79);

  objc_msgSend__timings(*(void **)(a1 + 32), v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTimingForKey_(v84, v85, (uint64_t)CFSTR("connection-data-time"), v86, v87);

  v88 = dispatch_semaphore_create(0);
  objc_msgSend_peerCN(*(void **)(a1 + 56), v89, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    v98 = *(void **)(a1 + 48);
    objc_msgSend_peerCN(*(void **)(a1 + 56), v94, v95, v96, v97);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend_callID(*(void **)(a1 + 56), v100, v101, v102, v103);
    objc_msgSend_setPeerCN_callID_(v98, v105, (uint64_t)v99, v104, v106);

  }
  sub_2190076D0();
  v107 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v107, OS_LOG_TYPE_DEFAULT, "Calling inviteDictionaryForCallID", buf, 2u);
  }

  v173[0] = MEMORY[0x24BDAC760];
  v173[2] = sub_219015DB4;
  v173[3] = &unk_24DA57928;
  v108 = *(void **)(a1 + 56);
  v109 = *(_QWORD *)(a1 + 80);
  v176 = *(_QWORD *)(a1 + 72);
  v177 = &v179;
  v173[1] = 3221225472;
  v178 = v109;
  v174 = v108;
  v110 = v88;
  v175 = v110;
  v111 = (void *)MEMORY[0x219A2864C](v173);
  sub_2190148AC(*(void **)(a1 + 56));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = *(void **)(a1 + 48);
  dispatch_get_global_queue(2, 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inviteDictionaryForCallID_remoteInviteDictionary_nonCellularCandidateTimeout_block_queue_(v113, v115, v22, (uint64_t)v112, (uint64_t)v111, v114, 0.0);

  v116 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v110, v116))
  {
    sub_2190076D0();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v186 = 0x4024000000000000;
      _os_log_impl(&dword_218FEA000, v121, OS_LOG_TYPE_DEFAULT, "*** Timed out gathering connection data **** (%f seconds)", buf, 0xCu);
    }

  }
  objc_msgSend__timings(*(void **)(a1 + 32), v117, v118, v119, v120);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTimingForKey_(v122, v123, (uint64_t)CFSTR("connection-data-time"), v124, v125);

  sub_2190076D0();
  v126 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend__timings(*(void **)(a1 + 32), v127, v128, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_totalTimeForKey_(v131, v132, (uint64_t)CFSTR("connection-data-time"), v133, v134);
    *(_DWORD *)buf = 134217984;
    v186 = v135;
    _os_log_impl(&dword_218FEA000, v126, OS_LOG_TYPE_DEFAULT, "Connection data gathering took %f", buf, 0xCu);

  }
  if (!objc_msgSend_length(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v136, v137, v138, v139))
  {
    sub_2190076D0();
    v143 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v143, OS_LOG_TYPE_DEFAULT, "*** Empty connection data ***", buf, 2u);
    }

    v144 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v145 = *(void **)(v144 + 40);
    *(_QWORD *)(v144 + 40) = 0;

  }
  v146 = v180[5];
  if (v146)
    objc_msgSend__handleAVError_(*(void **)(a1 + 32), v140, v146, v141, v142);
  if (objc_msgSend_state(*(void **)(a1 + 32), v140, v146, v141, v142) == 5)
  {
    objc_msgSend_endConferenceForAVChat_(*(void **)(a1 + 40), v147, *(_QWORD *)(a1 + 32), v148, v149);
    v150 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v151 = *(void **)(v150 + 40);
    *(_QWORD *)(v150 + 40) = 0;

  }
  v152 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v152)
  {
    objc_msgSend_setLocalICEData_(*(void **)(a1 + 56), v147, v152, v148, v149);
    v153 = *(void **)(a1 + 56);
    objc_msgSend_getNatIPFromICEData_(*(void **)(a1 + 40), v154, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v155, v156);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalNATIP_(v153, v158, (uint64_t)v157, v159, v160);

    v161 = *(void **)(a1 + 56);
    objc_msgSend_natTypeForAVChat_(*(void **)(a1 + 40), v162, *(_QWORD *)(a1 + 32), v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocalNATType_(v161, v166, (uint64_t)v165, v167, v168);

    v172 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v172)
      objc_msgSend_setLocalSKEData_(*(void **)(a1 + 56), v169, v172, v170, v171);
  }

  _Block_object_dispose(&v179, 8);
}

void sub_219015D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_219015DB4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  void **v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
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
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  int v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v40 = 138412546;
    v41 = v5;
    v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "   AV Response: %@   Error: %@", (uint8_t *)&v40, 0x16u);
  }

  if (!qword_25503B940)
  {
    v11 = (void **)MEMORY[0x219A282F8]("AVConferenceInviteDataConnectionBlob", CFSTR("AVConference"));
    if (v11)
      v12 = *v11;
    else
      v12 = 0;
    objc_storeStrong((id *)&qword_25503B940, v12);
  }
  if (qword_25503B948
    || ((v13 = (void **)MEMORY[0x219A282F8]("AVConferenceInviteDataSKEBlob", CFSTR("AVConference"))) == 0
      ? (v14 = 0)
      : (v14 = *v13),
        objc_storeStrong((id *)&qword_25503B948, v14),
        qword_25503B948))
  {
    objc_msgSend_objectForKey_(v5, v8, qword_25503B940, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }
  else
  {
    v15 = 0;
    v16 = 1;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v15);
  if ((v16 & 1) == 0)

  sub_2190076D0();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v40 = 134217984;
    v41 = v18;
    _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, "Got connection data: %p", (uint8_t *)&v40, 0xCu);
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    sub_2190076D0();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v40 = 138412290;
      v41 = v23;
      _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Connection data error: %@", (uint8_t *)&v40, 0xCu);
    }

  }
  v24 = qword_25503B948;
  if (qword_25503B948)
  {
    objc_msgSend_objectForKey_(v5, v19, qword_25503B948, v20, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v25);
  if (v24)

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend_remoteSKEData(*(void **)(a1 + 32), v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

    }
    else
    {
      objc_msgSend_remoteICEData(*(void **)(a1 + 32), v31, v32, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        goto LABEL_35;
    }
    sub_2190076D0();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_218FEA000, v35, OS_LOG_TYPE_DEFAULT, "[WARN] skeData was nil", (uint8_t *)&v40, 2u);
    }

  }
LABEL_35:
  v37 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v38 = *(void **)(v37 + 40);
  *(_QWORD *)(v37 + 40) = v6;
  v39 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_219016264(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
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
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
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
  uint64_t v55;
  uint64_t v56;
  const char *v57;
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
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  void *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  void *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  unsigned int v160;
  uint8_t buf[4];
  uint64_t v162;
  __int16 v163;
  _BYTE v164[14];
  __int16 v165;
  int v166;
  __int16 v167;
  int v168;
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v162 = v4;
    v163 = 1024;
    *(_DWORD *)v164 = v3;
    *(_WORD *)&v164[4] = 2112;
    *(_QWORD *)&v164[6] = v5;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "conference: %@  didStartSession: %d  withUserInfo: %@", buf, 0x1Cu);
  }

  if (qword_253DE9358)
  {
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_253DE9358, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_integerValue(v9, v10, v11, v12, v13);

  }
  else
  {
    v14 = 0;
  }
  if (qword_253DE9360)
  {
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_253DE9360, v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_integerValue(v15, v16, v17, v18, v19);

  }
  else
  {
    v20 = 0;
  }
  if (qword_253DE9368)
  {
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_253DE9368, v7, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  if (qword_253DE9370)
  {
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_253DE9370, v7, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_integerValue(v22, v23, v24, v25, v26);

  }
  else
  {
    v27 = 0;
  }
  if (qword_253DE9378)
  {
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_253DE9378, v7, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_integerValue(v28, v29, v30, v31, v32);

  }
  else
  {
    v33 = 0;
  }
  sub_2190076D0();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v162 = v14;
    v163 = 2112;
    *(_QWORD *)v164 = v21;
    *(_WORD *)&v164[8] = 1024;
    *(_DWORD *)&v164[10] = v20;
    v165 = 1024;
    v166 = v27;
    v167 = 1024;
    v168 = v33;
    _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, "User info callID: %ld error: %@ type: %d local: %d  remote: %d", buf, 0x28u);
  }

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v35, *(_QWORD *)(a1 + 32), v14, (uint64_t)CFSTR("didStartSession"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantWithAVConferenceCallID_(v36, v37, v14, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__callInfoForCallID_(v40, v41, v14, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWaitingToConnect_(v40, v45, 0, v46, v47);
  if (*(_BYTE *)(a1 + 56))
  {
    v160 = v20;
    objc_msgSend__setConnectionType_(v36, v48, v20, v49, v50);
    v51 = (void *)MEMORY[0x24BDD16E0];
    v56 = objc_msgSend_natType(*(void **)(a1 + 32), v52, v53, v54, v55);
    objc_msgSend_numberWithUnsignedInt_(v51, v57, v56, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setNatType_(v36, v61, (uint64_t)v60, v62, v63);

    if (v33)
    {
      v67 = 1;
      objc_msgSend__setRemoteNetworkConnectionType_(v36, v64, 1, v65, v66);
    }
    else
    {
      v67 = 2;
      objc_msgSend__setRemoteNetworkConnectionType_(v36, v64, 2, v65, v66);
    }
    if (v27)
    {
      v71 = 1;
      objc_msgSend__setLocalNetworkConnectionType_(v36, v68, 1, v69, v70);
    }
    else
    {
      v71 = 2;
      objc_msgSend__setLocalNetworkConnectionType_(v36, v68, 2, v69, v70);
    }
    if (objc_msgSend_isReinitiate(v44, v72, v73, v74, v75))
    {
      objc_msgSend__setIsAudioInterrupted_(v36, v76, 0, v78, v79);
      objc_msgSend__setIsVideoInterrupted_(v36, v80, 0, v81, v82);
      objc_msgSend_conference_withCallID_remoteMediaStalled_(*(void **)(a1 + 48), v83, *(_QWORD *)(a1 + 32), v14, 0);
      objc_msgSend_conference_videoQualityNotificationForCallID_isDegraded_isRemote_(*(void **)(a1 + 48), v84, *(_QWORD *)(a1 + 32), v14, 0, 1);
    }
    objc_msgSend_isSendingVideoExpected(*(void **)(a1 + 48), v76, v77, v78, v79);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      v159 = v21;
      sub_2190076D0();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_isSendingVideoExpected(*(void **)(a1 + 48), v87, v88, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend_BOOLValue(v91, v92, v93, v94, v95);
        *(_DWORD *)buf = 67109120;
        LODWORD(v162) = v96;
        _os_log_impl(&dword_218FEA000, v86, OS_LOG_TYPE_DEFAULT, "Session started and has sendingVideoExpected value %d, updating AVConference's pauseVideo", buf, 8u);

      }
      v97 = *(void **)(a1 + 48);
      v98 = *(_QWORD *)(a1 + 32);
      objc_msgSend_isSendingVideoExpected(v97, v99, v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend_BOOLValue(v103, v104, v105, v106, v107);
      objc_msgSend_conference_callID_setPauseVideo_(v97, v109, v98, v14, v108 ^ 1u);

      objc_msgSend_setSendingVideoExpected_(*(void **)(a1 + 48), v110, 0, v111, v112);
      v21 = v159;
    }
    sub_2190076D0();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v162 = (uint64_t)v44;
      _os_log_impl(&dword_218FEA000, v113, OS_LOG_TYPE_DEFAULT, "Telling the call info %@ that we are connected", buf, 0xCu);
    }

    objc_msgSend_setState_(v44, v114, 3, v115, v116);
    objc_msgSend_setLocalConnectionType_(v44, v117, v71, v118, v119);
    objc_msgSend_setRemoteConnectionType_(v44, v120, v67, v121, v122);
    objc_msgSend__cleanupOrphanedCallInfos(v40, v123, v124, v125, v126);
    if (MarcoShouldLog())
    {
      sub_219001414(v160);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      MarcoLogCallInfo();

      v132 = (void *)MEMORY[0x24BDD16E0];
      v137 = objc_msgSend_natType(*(void **)(a1 + 32), v133, v134, v135, v136);
      objc_msgSend_numberWithUnsignedInt_(v132, v138, v137, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringValue(v141, v142, v143, v144, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      MarcoLogCallInfo();

      MarcoLogCallInfo();
      MarcoLogCallInfo();
    }
    if ((objc_msgSend_isVideo(v36, v127, v128, v129, v130, v159) & 1) == 0)
    {
      objc_msgSend_dateConnected(v36, v147, v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v151)
      {
        objc_msgSend__setDateConnected(v36, v147, v152, v153, v150);
        objc_msgSend__submitCallConnectedLogging(v36, v154, v155, v156, v157);
      }
    }
  }
  else
  {
    objc_msgSend_setState_(v44, v48, 4, v49, v50);
    if (v21)
      objc_msgSend__handleAVError_(v36, v147, (uint64_t)v21, v158, v150);
  }
  objc_msgSend_conferenceAVConferenceCallID_didConnect_(v36, v147, v14, *(unsigned __int8 *)(a1 + 56), v150);

}

void sub_2190169C4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  int isBeingHandedOff;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v33 = 138413058;
    v34 = v4;
    v35 = 1024;
    v36 = v3;
    v37 = 2112;
    v38 = v5;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "conference: %@  didStopWithCallID: %d   error: %@   callMetadata: %@", (uint8_t *)&v33, 0x26u);
  }

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 56), v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), (uint64_t)CFSTR("didStopWithCallID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantWithAVConferenceCallID_(v8, v9, *(_QWORD *)(a1 + 64), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__callInfoForCallID_(v12, v13, *(_QWORD *)(a1 + 64), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isBeingHandedOff = objc_msgSend_isBeingHandedOff(v16, v17, v18, v19, v20);
  v24 = *(_QWORD *)(a1 + 48);
  v23 = *(void **)(a1 + 56);
  if (isBeingHandedOff)
  {
    objc_msgSend_updateAVChat_withCallMetadata_isFinalUpdate_(v23, v21, (uint64_t)v8, v24, 0);
    sub_2190076D0();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(a1 + 64);
      v33 = 67109120;
      LODWORD(v34) = v26;
      _os_log_impl(&dword_218FEA000, v25, OS_LOG_TYPE_DEFAULT, "call is being handed off, only cleaning this call ID: %d", (uint8_t *)&v33, 8u);
    }

    objc_msgSend_endAVConferenceWithChat_callID_(*(void **)(a1 + 56), v27, (uint64_t)v8, *(_QWORD *)(a1 + 64), v28);
  }
  else
  {
    objc_msgSend_updateAVChat_withCallMetadata_isFinalUpdate_(v23, v21, (uint64_t)v8, v24, 1);
    sub_2190076D0();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(a1 + 64);
      v33 = 67109120;
      LODWORD(v34) = v30;
      _os_log_impl(&dword_218FEA000, v29, OS_LOG_TYPE_DEFAULT, "tearing down normally for call ID: %d", (uint8_t *)&v33, 8u);
    }

    objc_msgSend_conferenceDidStopWithCallID_error_(v8, v31, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v32);
  }

}

void sub_219016C9C(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), 0, (uint64_t)CFSTR("updateInputFrequencyLevel"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localParticipant(v11, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInFrequencyLevel_(v7, v8, *(_QWORD *)(a1 + 48), v9, v10);

}

void sub_219016DBC(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), 0, (uint64_t)CFSTR("updateOutputFrequencyLevel"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localParticipant(v11, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOutFrequencyLevel_(v7, v8, *(_QWORD *)(a1 + 48), v9, v10);

}

void sub_219016F3C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;
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
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v35 = 138412546;
    v36 = v3;
    v37 = 1024;
    v38 = v4;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  receivedFirstRemoteFrameForCallID: %d", (uint8_t *)&v35, 0x12u);
  }

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("receivedFirstRemoteFrameForCallID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__noteFirstFrame(v6, v7, v8, v9, v10);
  objc_msgSend__clearFirstFrameTimeoutTimer(v6, v11, v12, v13, v14);
  objc_msgSend_remoteParticipants(v6, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_remoteParticipants(v6, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v29, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = 0;
  }
  sub_219017088(CFSTR("__kIMAVChatParticipantReceivedFirstFrameNotification"), v34, 0);

}

void sub_219017088(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Posting notification name: %@  object: %@  userInfo: %@", (uint8_t *)&v15, 0x20u);
  }

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v13, v14, (uint64_t)v5, (uint64_t)v6, (uint64_t)v7);

}

void sub_2190172B0(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  __CFDictionary *theDict;

  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = *(unsigned __int8 *)(a1 + 96);
  if (!*(_BYTE *)(a1 + 96)
    && (*(_BYTE *)(a1 + 97) || *(_BYTE *)(a1 + 98) || *(_BYTE *)(a1 + 99) || *(_BYTE *)(a1 + 100)))
  {
    goto LABEL_10;
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v2, *(unsigned int *)(a1 + 88), v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(theDict, CFSTR("__kIMAVChatCameraTypeKey"), v7);

  if (v6)
  {
LABEL_10:
    if (!*(_BYTE *)(a1 + 100))
      goto LABEL_16;
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  objc_msgSend_valueWithRect_(MEMORY[0x24BDD1968], v2, v3, v4, v5, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(theDict, CFSTR("__kIMAVChatCameraContentRectKey"), v9);

  if ((v8 & 1) != 0)
  {
    v10 = 1;
    goto LABEL_18;
  }
LABEL_16:
  if (!*(_BYTE *)(a1 + 97))
    goto LABEL_22;
  v10 = 0;
LABEL_18:
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v2, *(unsigned int *)(a1 + 92), v4, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(theDict, CFSTR("__kIMAVChatCameraOrientationKey"), v11);

  if ((v10 & 1) != 0)
  {
    v12 = 1;
    goto LABEL_24;
  }
LABEL_22:
  if (!*(_BYTE *)(a1 + 98))
    goto LABEL_27;
  v12 = 0;
LABEL_24:
  objc_msgSend_valueWithSize_(MEMORY[0x24BDD1968], v2, v3, v4, v5, *(double *)(a1 + 72), *(double *)(a1 + 80));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    CFDictionarySetValue(theDict, CFSTR("__kIMAVChatCameraAspectRatioKey"), v13);

  if ((v12 & 1) != 0)
    goto LABEL_28;
LABEL_27:
  if (*(_BYTE *)(a1 + 99))
LABEL_28:
    CFDictionarySetValue(theDict, CFSTR("__kIMAVChatCameraWillChangeKey"), &unk_24DA62EB8);
  sub_219017088(CFSTR("__kIMAVChatParticipantMediaPropertiesChangedNotification"), *(void **)(a1 + 32), theDict);

}

void sub_219017568(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  __CFDictionary *theDict;

  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (*(_BYTE *)(a1 + 60))
  {
    if (!*(_BYTE *)(a1 + 61))
      goto LABEL_12;
    goto LABEL_5;
  }
  if (*(_BYTE *)(a1 + 61))
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 62) || *(_BYTE *)(a1 + 63))
    goto LABEL_12;
  v6 = 1;
LABEL_6:
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v2, *(unsigned int *)(a1 + 56), v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(theDict, CFSTR("__kIMAVChatCameraOrientationKey"), v7);

  if ((v6 & 1) == 0)
  {
LABEL_12:
    if (!*(_BYTE *)(a1 + 62))
      goto LABEL_16;
  }
  objc_msgSend_valueWithSize_(MEMORY[0x24BDD1968], v2, v3, v4, v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(theDict, CFSTR("__kIMAVChatCameraAspectRatioKey"), v8);

LABEL_16:
  sub_219017088(CFSTR("__kIMAVChatParticipantScreenPropertiesChangedNotification"), *(void **)(a1 + 32), theDict);

}

void sub_219017740(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
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
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  _BOOL8 v43;
  int v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v55 = v3;
    v56 = 1024;
    v57 = v4;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d", buf, 0x12u);
  }

  sub_219017914(*(void **)(a1 + 40));
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), (uint64_t)CFSTR("remoteScreenAttributesChanged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteParticipants(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend_camera(*(void **)(a1 + 40), v17, v18, v19, v20);
  v26 = objc_msgSend_orientation(*(void **)(a1 + 40), v22, v23, v24, v25);
  objc_msgSend_ratio(*(void **)(a1 + 40), v27, v28, v29, v30);
  v32 = v31;
  v34 = v33;
  objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(v16, v35, v26, v21, v36);
  v43 = v34 != v42 || v32 != v41;
  v44 = objc_msgSend__screenOrientation(v16, v37, v38, v39, v40);
  v48 = v44;
  if (v43 || v44 != (_DWORD)v26)
  {
    objc_msgSend__setScreenOrientation_(v16, v45, v26, v46, v47);
    if (v26 > 1)
      objc_msgSend__setRemotePIPLandscapeOrientation_(v16, v49, v50, v51, v52, v32, v34);
    else
      objc_msgSend__setRemotePIPPortraitOrientation_(v16, v49, v50, v51, v52, v32, v34);
    objc_msgSend__postParticipantScreenAttributesChangeNotification_cameraChanged_orientationChanged_aspectChanged_cameraWillSwitch_camera_orentation_aspect_(IMAVConferenceInterface, v53, (uint64_t)v16, 0, v48 != (_DWORD)v26, v43, 0, v21, v32, v34, v26);
  }

}

void sub_219017914(void *a1)
{
  __CFString *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  __CFString *v41;
  NSObject *v42;
  __CFString *v43;
  NSObject *v44;
  const __CFString *v45;
  int v46;
  const __CFString *v47;
  uint64_t v48;
  NSSize v49;
  NSRect v50;

  v48 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v6 = objc_msgSend_camera(v1, v2, v3, v4, v5);
  v11 = objc_msgSend_orientation(v1, v7, v8, v9, v10);
  objc_msgSend_ratio(v1, v12, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v24 = objc_msgSend_cameraSwitching(v1, v20, v21, v22, v23);
  objc_msgSend_contentsRect(v1, v25, v26, v27, v28);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  sub_2190076D0();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v46 = 138412290;
    v47 = v1;
    _os_log_impl(&dword_218FEA000, v37, OS_LOG_TYPE_DEFAULT, "    Attributes: %@", (uint8_t *)&v46, 0xCu);
  }

  sub_2190076D0();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v46 = 67109120;
    LODWORD(v47) = v6;
    _os_log_impl(&dword_218FEA000, v38, OS_LOG_TYPE_DEFAULT, "          Camera: %d", (uint8_t *)&v46, 8u);
  }

  sub_2190076D0();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v46 = 67109120;
    LODWORD(v47) = v11;
    _os_log_impl(&dword_218FEA000, v39, OS_LOG_TYPE_DEFAULT, "     Orientation: %d", (uint8_t *)&v46, 8u);
  }

  sub_2190076D0();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v49.width = v17;
    v49.height = v19;
    NSStringFromSize(v49);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v46 = 138412290;
    v47 = v41;
    _os_log_impl(&dword_218FEA000, v40, OS_LOG_TYPE_DEFAULT, "          Aspect: %@", (uint8_t *)&v46, 0xCu);

  }
  sub_2190076D0();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v50.origin.x = v30;
    v50.origin.y = v32;
    v50.size.width = v34;
    v50.size.height = v36;
    NSStringFromRect(v50);
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v46 = 138412290;
    v47 = v43;
    _os_log_impl(&dword_218FEA000, v42, OS_LOG_TYPE_DEFAULT, "    Content Rect: %@", (uint8_t *)&v46, 0xCu);

  }
  sub_2190076D0();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = CFSTR("NO");
    if (v24)
      v45 = CFSTR("YES");
    v46 = 138412290;
    v47 = v45;
    _os_log_impl(&dword_218FEA000, v44, OS_LOG_TYPE_DEFAULT, "   Camera switch: %@", (uint8_t *)&v46, 0xCu);
  }

}

void sub_219017CD0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  double v66;
  _BOOL4 v67;
  double v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  _BOOL8 v75;
  double v76;
  BOOL v77;
  BOOL v78;
  int v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  int v117;
  void *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  _BOOL4 v125;
  unsigned int v126;
  uint8_t buf[4];
  uint64_t v128;
  __int16 v129;
  int v130;
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v128 = v3;
    v129 = 1024;
    v130 = v4;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d", buf, 0x12u);
  }

  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    LODWORD(v128) = v6;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Informed about video attributes change for call ID: %d", buf, 8u);
  }

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), (uint64_t)CFSTR("remoteVideoAttributesChanged"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteParticipants(v124, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend_camera(*(void **)(a1 + 48), v18, v19, v20, v21);
  v27 = objc_msgSend_orientation(*(void **)(a1 + 48), v23, v24, v25, v26);
  objc_msgSend_ratio(*(void **)(a1 + 48), v28, v29, v30, v31);
  v33 = v32;
  v35 = v34;
  v126 = objc_msgSend_cameraSwitching(*(void **)(a1 + 48), v36, v37, v38, v39);
  objc_msgSend_contentsRect(*(void **)(a1 + 48), v40, v41, v42, v43);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  sub_219017914(*(void **)(a1 + 48));
  v56 = objc_msgSend_cameraType(v17, v52, v53, v54, v55);
  v61 = objc_msgSend_cameraOrientation(v17, v57, v58, v59, v60);
  objc_msgSend_aspectRatioForCameraOrientation_cameraType_(v17, v62, v27, v22, v63);
  v67 = v33 != v66;
  if (v35 != v68)
    v67 = 1;
  v125 = v67;
  objc_msgSend_contentRectForCameraOrientation_cameraType_(v17, v64, v27, v22, v65);
  v75 = 1;
  if (v49 != v76 || v51 != v74)
    goto LABEL_22;
  v75 = v47 != v73 || v45 != v72;
  if (v17)
    v77 = (_DWORD)v22 == v56;
  else
    v77 = 0;
  v78 = v77 && (_DWORD)v27 == v61;
  v79 = v125;
  if (!v78)
    v79 = 1;
  if (((v79 | v126) & 1) != 0 || v75)
  {
LABEL_22:
    objc_msgSend__setCameraOrientation_(v17, v69, v27, v70, v71);
    objc_msgSend__setCameraType_(v17, v80, v22, v81, v82);
    if (v27 > 1)
    {
      objc_msgSend__setRemoteLandscapeOrientation_(v17, v83, v84, v85, v86, v33, v35);
      objc_msgSend__setRemoteLandscapeContentRect_(v17, v95, v96, v97, v98, v45, v47, v49, v51);
    }
    else
    {
      objc_msgSend__setRemotePortraitOrientation_(v17, v83, v84, v85, v86, v33, v35);
      objc_msgSend__setRemotePortraitContentRect_(v17, v87, v88, v89, v90, v45, v47, v49, v51);
    }
    if (v126)
      sub_219017088(CFSTR("__kIMAVChatParticipantCameraWillChangeNotification"), v17, 0);
    if ((_DWORD)v27 != v61)
    {
      v99 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v91, v27, v93, v94);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryWithObjectsAndKeys_(v99, v101, (uint64_t)v100, v102, v103, CFSTR("__kIMAVChatCameraOrientationKey"), 0);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      sub_219017088(CFSTR("__kIMAVChatParticipantCameraOrientationChangedNotification"), v17, v104);

    }
    if ((_DWORD)v22 != v56)
    {
      v105 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v91, v22, v93, v94);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryWithObjectsAndKeys_(v105, v107, (uint64_t)v106, v108, v109, CFSTR("__kIMAVChatCameraTypeKey"), 0);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      sub_219017088(CFSTR("__kIMAVChatParticipantCameraDidChangeNotification"), v17, v110);

    }
    if (v75)
    {
      v111 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend_valueWithRect_(MEMORY[0x24BDD1968], v91, v92, v93, v94, v45, v47, v49, v51);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryWithObjectsAndKeys_(v111, v113, (uint64_t)v112, v114, v115, CFSTR("__kIMAVChatCameraContentRectKey"), 0);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      sub_219017088(CFSTR("__kIMAVChatParticipantContentRectChangedNotification"), v17, v116);

    }
    v117 = v125;
    if ((_DWORD)v27 != v61)
      v117 = 1;
    if (v117 == 1)
    {
      v118 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend_valueWithSize_(MEMORY[0x24BDD1968], v91, v92, v93, v94, v33, v35);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryWithObjectsAndKeys_(v118, v120, (uint64_t)v119, v121, v122, CFSTR("__kIMAVChatCameraAspectRatioKey"), 0);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      sub_219017088(CFSTR("__kIMAVChatParticipantAspectRatioChangedNotification"), v17, v123);

    }
    objc_msgSend__postParticipantMediaChangeNotification_cameraChanged_orientationChanged_aspectChanged_contentRectChanged_cameraWillSwitch_camera_orentation_aspect_contentRect_(IMAVConferenceInterface, v91, (uint64_t)v17, (_DWORD)v22 != v56, (_DWORD)v27 != v61, v125, v75, v126, v33, v35, v45, v47, v49, v51, __PAIR64__(v27, v22));
  }

}

void sub_2190182A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
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
  uint64_t v19;
  char shouldRunACConferences;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  const char *v28;
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
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  int v66;
  NSObject *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10))
  {

LABEL_4:
    sub_2190076D0();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(NSObject **)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      v66 = 138412802;
      v67 = v23;
      v68 = 1024;
      v69 = v22;
      v70 = 2112;
      v71 = v24;
      _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d parameters: %@", (uint8_t *)&v66, 0x1Cu);
    }

    sub_2190185CC(*(void **)(a1 + 40));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v26, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), (uint64_t)CFSTR("inititiateRelayRequest"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantWithAVConferenceCallID_(v27, v28, *(_QWORD *)(a1 + 56), v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v25, v32, *MEMORY[0x24BE4FF50], v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setRelayRemotePrimaryIdentifier_(v27, v36, (uint64_t)v35, v37, v38);
    sub_2190076D0();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_vcPartyID(v31, v40, v41, v42, v43);
      v44 = objc_claimAutoreleasedReturnValue();
      v66 = 138412290;
      v67 = v44;
      _os_log_impl(&dword_218FEA000, v39, OS_LOG_TYPE_DEFAULT, "Instructed to initiate relay request to: %@", (uint8_t *)&v66, 0xCu);

    }
    objc_msgSend_natTypeForAVChat_(*(void **)(a1 + 48), v45, (uint64_t)v27, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
      CFDictionarySetValue((CFMutableDictionaryRef)v25, (const void *)*MEMORY[0x24BE4FF68], v48);

    objc_msgSend_properties(v31, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v53, v54, *MEMORY[0x24BE50498], v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
      CFDictionarySetValue((CFMutableDictionaryRef)v25, (const void *)*MEMORY[0x24BE4FF20], v57);

    sub_2190076D0();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v66 = 138412290;
      v67 = v25;
      _os_log_impl(&dword_218FEA000, v58, OS_LOG_TYPE_DEFAULT, "Built new relay parameters: %@", (uint8_t *)&v66, 0xCu);
    }

    objc_msgSend_vcPartyID(v31, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conferencePersonWithID_sendRelayRequest_(v27, v64, (uint64_t)v63, (uint64_t)v25, v65);

    goto LABEL_15;
  }
  objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunACConferences = objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19);

  if ((shouldRunACConferences & 1) != 0)
    goto LABEL_4;
  sub_2190076D0();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v66) = 0;
    _os_log_impl(&dword_218FEA000, v25, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", (uint8_t *)&v66, 2u);
  }
LABEL_15:

}

id sub_2190185CC(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_objectForKey_(v1, v3, qword_253DE93B0, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_objectForKey_(v1, v7, qword_253DE93B0, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v11, (uint64_t)v10, *MEMORY[0x24BE4FF48], v12);

  }
  objc_msgSend_objectForKey_(v1, v7, qword_253DE9418, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_objectForKey_(v1, v14, qword_253DE9418, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v18, (uint64_t)v17, *MEMORY[0x24BE4FF68], v19);

  }
  objc_msgSend_objectForKey_(v1, v14, qword_253DE9408, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_objectForKey_(v1, v21, qword_253DE9408, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v25, (uint64_t)v24, *MEMORY[0x24BE4FF58], v26);

  }
  objc_msgSend_objectForKey_(v1, v21, qword_253DE9410, v22, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend_objectForKey_(v1, v28, qword_253DE9410, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v32, (uint64_t)v31, *MEMORY[0x24BE4FF60], v33);

  }
  objc_msgSend_objectForKey_(v1, v28, qword_253DE93D0, v29, v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend_objectForKey_(v1, v35, qword_253DE93D0, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v39, (uint64_t)v38, *MEMORY[0x24BE4FF10], v40);

  }
  objc_msgSend_objectForKey_(v1, v35, qword_253DE93D8, v36, v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend_objectForKey_(v1, v42, qword_253DE93D8, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v46, (uint64_t)v45, *MEMORY[0x24BE4FF20], v47);

  }
  objc_msgSend_objectForKey_(v1, v42, qword_253DE93C0, v43, v44);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend_objectForKey_(v1, v49, qword_253DE93C0, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v53, (uint64_t)v52, *MEMORY[0x24BE4FF08], v54);

  }
  objc_msgSend_objectForKey_(v1, v49, qword_253DE93C8, v50, v51);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend_objectForKey_(v1, v56, qword_253DE93C8, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v60, (uint64_t)v59, *MEMORY[0x24BE4FF18], v61);

  }
  objc_msgSend_objectForKey_(v1, v56, qword_253DE9450, v57, v58);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend_objectForKey_(v1, v63, qword_253DE9450, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v67, (uint64_t)v66, *MEMORY[0x24BE4FFA0], v68);

  }
  objc_msgSend_objectForKey_(v1, v63, qword_253DE93B8, v64, v65);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    objc_msgSend_objectForKey_(v1, v70, qword_253DE93B8, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v74, (uint64_t)v73, *MEMORY[0x24BE4FF00], v75);

  }
  objc_msgSend_objectForKey_(v1, v70, qword_253DE9448, v71, v72);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend_objectForKey_(v1, v77, qword_253DE9448, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v81, (uint64_t)v80, *MEMORY[0x24BE4FF98], v82);

  }
  objc_msgSend_objectForKey_(v1, v77, qword_253DE9440, v78, v79);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    objc_msgSend_objectForKey_(v1, v84, qword_253DE9440, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v88, (uint64_t)v87, *MEMORY[0x24BE4FF90], v89);

  }
  objc_msgSend_objectForKey_(v1, v84, qword_253DE93E0, v85, v86);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    objc_msgSend_objectForKey_(v1, v91, qword_253DE93E0, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v95, (uint64_t)v94, *MEMORY[0x24BE4FF28], v96);

  }
  objc_msgSend_objectForKey_(v1, v91, qword_253DE93F8, v92, v93);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    objc_msgSend_objectForKey_(v1, v98, qword_253DE93F8, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v102, (uint64_t)v101, *MEMORY[0x24BE4FF40], v103);

  }
  objc_msgSend_objectForKey_(v1, v98, qword_253DE9420, v99, v100);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    objc_msgSend_objectForKey_(v1, v105, qword_253DE9420, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v109, (uint64_t)v108, *MEMORY[0x24BE4FF70], v110);

  }
  objc_msgSend_objectForKey_(v1, v105, qword_253DE9438, v106, v107);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  if (v111)
  {
    objc_msgSend_objectForKey_(v1, v112, qword_253DE9438, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v116, (uint64_t)v115, *MEMORY[0x24BE4FF88], v117);

  }
  objc_msgSend_objectForKey_(v1, v112, qword_253DE9428, v113, v114);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (v118)
  {
    objc_msgSend_objectForKey_(v1, v119, qword_253DE9428, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v123, (uint64_t)v122, *MEMORY[0x24BE4FF78], v124);

  }
  objc_msgSend_objectForKey_(v1, v119, qword_253DE9430, v120, v121);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if (v125)
  {
    objc_msgSend_objectForKey_(v1, v126, qword_253DE9430, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v130, (uint64_t)v129, *MEMORY[0x24BE4FF80], v131);

  }
  objc_msgSend_objectForKey_(v1, v126, qword_253DE93E8, v127, v128);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  if (v132)
  {
    objc_msgSend_objectForKey_(v1, v133, qword_253DE93E8, v134, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v137, (uint64_t)v136, *MEMORY[0x24BE4FF30], v138);

  }
  objc_msgSend_objectForKey_(v1, v133, qword_253DE93F0, v134, v135);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  if (v139)
  {
    objc_msgSend_objectForKey_(v1, v140, qword_253DE93F0, v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v2, v144, (uint64_t)v143, *MEMORY[0x24BE4FF38], v145);

  }
  if (qword_253DE9400)
  {
    objc_msgSend_objectForKey_(v1, v140, qword_253DE9400, v141, v142);
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    if (v146)
    {
      objc_msgSend_objectForKey_(v1, v147, qword_253DE9400, v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v2, v151, (uint64_t)v150, *MEMORY[0x24BE4FF50], v152);

    }
  }

  return v2;
}

void sub_219018D6C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
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
  uint64_t v19;
  char shouldRunACConferences;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  int v45;
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10))
  {

LABEL_4:
    sub_2190076D0();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(void **)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      v45 = 138412802;
      v46 = v23;
      v47 = 1024;
      v48 = v22;
      v49 = 2112;
      v50 = v24;
      _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d parameters: %@", (uint8_t *)&v45, 0x1Cu);
    }

    objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v25, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), (uint64_t)CFSTR("sendRelayUpdate"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantWithAVConferenceCallID_(v26, v27, *(_QWORD *)(a1 + 56), v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_vcPartyID(v30, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412290;
      v46 = v36;
      _os_log_impl(&dword_218FEA000, v31, OS_LOG_TYPE_DEFAULT, "Instructed to send relay update to: %@", (uint8_t *)&v45, 0xCu);

    }
    objc_msgSend_vcPartyID(v30, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2190185CC(*(void **)(a1 + 40));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conferencePersonWithID_sendRelayUpdate_(v26, v43, (uint64_t)v41, (uint64_t)v42, v44);

    goto LABEL_9;
  }
  objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunACConferences = objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19);

  if ((shouldRunACConferences & 1) != 0)
    goto LABEL_4;
  sub_2190076D0();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v45) = 0;
    _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", (uint8_t *)&v45, 2u);
  }
LABEL_9:

}

void sub_219019064(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
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
  uint64_t v19;
  char shouldRunACConferences;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  int v45;
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10))
  {

LABEL_4:
    sub_2190076D0();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(void **)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      v45 = 138412802;
      v46 = v23;
      v47 = 1024;
      v48 = v22;
      v49 = 2112;
      v50 = v24;
      _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d parameters: %@", (uint8_t *)&v45, 0x1Cu);
    }

    objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v25, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), (uint64_t)CFSTR("cancelRelayReqest"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantWithAVConferenceCallID_(v26, v27, *(_QWORD *)(a1 + 56), v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_vcPartyID(v30, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412290;
      v46 = v36;
      _os_log_impl(&dword_218FEA000, v31, OS_LOG_TYPE_DEFAULT, "Instructed to send relay cancel to: %@", (uint8_t *)&v45, 0xCu);

    }
    objc_msgSend_vcPartyID(v30, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2190185CC(*(void **)(a1 + 40));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conferencePersonWithID_sendRelayCancel_(v26, v43, (uint64_t)v41, (uint64_t)v42, v44);

    goto LABEL_9;
  }
  objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  shouldRunACConferences = objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19);

  if ((shouldRunACConferences & 1) != 0)
    goto LABEL_4;
  sub_2190076D0();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v45) = 0;
    _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", (uint8_t *)&v45, 2u);
  }
LABEL_9:

}

void sub_219019344(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(unsigned __int8 *)(a1 + 56);
    v13 = 138412802;
    v14 = v3;
    v15 = 1024;
    v16 = v4;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  call ID: %d   isNetworkBad: %d", (uint8_t *)&v13, 0x18u);
  }

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("networkHint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend__submitCallInterruptionBeganLogging(v7, v8, v9, v10, v11);
  else
    objc_msgSend__submitCallInterruptionEndedLogging(v7, v8, v9, v10, v11);

}

void sub_2190194FC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(unsigned __int8 *)(a1 + 56);
    v6 = *(unsigned __int8 *)(a1 + 57);
    *(_DWORD *)buf = 138413058;
    v37 = v3;
    v38 = 1024;
    v39 = v4;
    v40 = 1024;
    v41 = v5;
    v42 = 1024;
    v43 = v6;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  call ID: %d   isDegraded: %d   isRemote: %d", buf, 0x1Eu);
  }

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("videoQualityChanged"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend_remoteParticipants(v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_localParticipant(v8, v9, v10, v11, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_vcPartyID(v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferencePersonWithID_didDegrade_(v13, v25, (uint64_t)v24, *(unsigned __int8 *)(a1 + 56), v26);

  v27 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v28, *(unsigned __int8 *)(a1 + 56), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(v27, v32, (uint64_t)v31, v33, v34, CFSTR("__kIMAVChatVideoDegradedKey"), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  sub_219017088(CFSTR("__kIMAVChatParticipantVideoQualityChangedNotification"), v19, v35);

}

void sub_219019778(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
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
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    v42 = v3;
    v43 = 1024;
    v44 = v4;
    v45 = 1024;
    v46 = v5;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  call ID: %d   remoteMediaStalled: %d", buf, 0x18u);
  }

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("remoteMediaStalled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteParticipants(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vcPartyID(v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferencePersonWithID_mediaDidStall_(v7, v23, (uint64_t)v22, *(unsigned __int8 *)(a1 + 56), v24);

  v25 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend__setIsAudioInterrupted_(v7, v26, v25, v27, v28);
  objc_msgSend__setIsVideoInterrupted_(v7, v29, v25, v30, v31);
  v32 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v33, *(unsigned __int8 *)(a1 + 56), v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(v32, v37, (uint64_t)v36, v38, v39, CFSTR("__kIMAVChatMediaStalledKey"), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  sub_219017088(CFSTR("__kIMAVChatParticipantMediaStalledChangedNotification"), v17, v40);

}

void sub_219019A50(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  int v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), (uint64_t)CFSTR("reinitializeCallForCallID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantWithAVConferenceCallID_(v3, v4, *(unsigned int *)(a1 + 48), v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v7;
  if (v3)
    v12 = v7 == 0;
  else
    v12 = 1;
  if (v12)
  {
    sub_2190076D0();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_DWORD *)(a1 + 48);
      v15 = 138412802;
      v16 = v3;
      v17 = 2112;
      v18 = v11;
      v19 = 1024;
      v20 = v14;
      _os_log_impl(&dword_218FEA000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown chat (%@) or participant(%@) for callID %d", (uint8_t *)&v15, 0x1Cu);
    }

  }
  objc_msgSend_reinitializeCallForCallID_(v11, v8, *(unsigned int *)(a1 + 48), v9, v10);

}

void sub_219019CC4(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("didPauseAudio"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferenceDidPauseAudioWithCallID_didPauseAudio_(v5, v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), v4);

}

void sub_219019ED4(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("remoteAudioPaused"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantWithAVConferenceCallID_(v23, v3, *(_QWORD *)(a1 + 48), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vcPartyID(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferencePersonWithID_didMute_(v23, v12, (uint64_t)v11, *(unsigned __int8 *)(a1 + 56), v13);

  v14 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v15, *(unsigned __int8 *)(a1 + 56), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(v14, v19, (uint64_t)v18, v20, v21, CFSTR("__kIMAVChatMuteStateKey"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sub_219017088(CFSTR("__kIMAVChatParticipantMuteChangedNotification"), v6, v22);

}

void sub_21901A17C(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("remoteVideoPaused"));
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteParticipants(v29, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vcPartyID(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferencePersonWithID_didPause_(v29, v18, (uint64_t)v17, *(unsigned __int8 *)(a1 + 56), v19);

  v20 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v21, *(unsigned __int8 *)(a1 + 56), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(v20, v25, (uint64_t)v24, v26, v27, CFSTR("__kIMAVChatPauseStateKey"), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  sub_219017088(CFSTR("__kIMAVChatParticipantPauseChangedNotification"), v12, v28);

}

void sub_21901A424(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), (uint64_t)CFSTR("localIPChange"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteParticipants(v20, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vcPartyID(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferencePersonWithID_localIPDidChange_(v20, v18, (uint64_t)v17, *(_QWORD *)(a1 + 48), v19);

}

void sub_21901A5E4(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (uint64_t)CFSTR("didChangeLocalVariablesForCallID"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__clearCache(v15, v2, v3, v4, v5);
  objc_msgSend_sharedInstance(IMAVCallManager, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sendProxyUpdate(v10, v11, v12, v13, v14);

}

void sub_21901A6E4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v4, *(_QWORD *)(a1 + 32), 0, (uint64_t)CFSTR("serverDiedForConference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "Informed about server crash for: %@  (Chat: %@)", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend_endChatWithReason_(v5, v8, 30, v9, v10);
}

void sub_21901AFE8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t isLocalParticipant;
  const char *v13;
  id v14;

  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend_callID(*(void **)(a1 + 40), a2, a3, a4, a5);
  sub_2190149FC(*(void **)(a1 + 48));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  isLocalParticipant = objc_msgSend_isLocalParticipant(*(void **)(a1 + 56), v8, v9, v10, v11);
  objc_msgSend_processRelayRequestResponse_responseDict_didOriginateRequest_(v6, v13, v7, (uint64_t)v14, isLocalParticipant);

}

void sub_21901B340(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t isLocalParticipant;
  const char *v13;
  id v14;

  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend_callID(*(void **)(a1 + 40), a2, a3, a4, a5);
  sub_2190149FC(*(void **)(a1 + 48));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  isLocalParticipant = objc_msgSend_isLocalParticipant(*(void **)(a1 + 56), v8, v9, v10, v11);
  objc_msgSend_processRelayUpdate_updateDict_didOriginateRequest_(v6, v13, v7, (uint64_t)v14, isLocalParticipant);

}

void sub_21901B698(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t isLocalParticipant;
  const char *v13;
  id v14;

  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend_callID(*(void **)(a1 + 40), a2, a3, a4, a5);
  sub_2190149FC(*(void **)(a1 + 48));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  isLocalParticipant = objc_msgSend_isLocalParticipant(*(void **)(a1 + 56), v8, v9, v10, v11);
  objc_msgSend_processCancelRelayRequest_cancelDict_didOriginateRequest_(v6, v13, v7, (uint64_t)v14, isLocalParticipant);

}

void sub_21901B960(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend_avChat(*(void **)(a1 + 48), a2, a3, a4, a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend__bustedCallID(v14, v7, v8, v9, v10);
  objc_msgSend_processRemoteIPChange_callID_(v5, v12, v6, v11, v13);

}

void sub_21901BB50(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  qword_253DE9458 = MEMORY[0x219A282EC](CFSTR("VCCapabilities"), CFSTR("AVConference"));
  v2 = objc_alloc_init((Class)qword_253DE9458);
  v6 = objc_msgSend__deviceRoleForAVChat_(*(void **)(a1 + 32), v3, *(_QWORD *)(a1 + 40), v4, v5);
  objc_msgSend_setDeviceRole_(v2, v7, v6, v8, v9);
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 48);
    v20 = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v2;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Updating capabilities for conference %@ to %@", (uint8_t *)&v20, 0x16u);
  }

  v12 = *(void **)(a1 + 48);
  v17 = objc_msgSend__bustedCallID(*(void **)(a1 + 40), v13, v14, v15, v16);
  objc_msgSend_updateCapabilities_forCallID_(v12, v18, (uint64_t)v2, v17, v19);

}

void sub_21901C42C(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = *(id *)(a1 + 32);
  if (!v5)
  {
    objc_msgSend_callMetadataForCallID_(*(void **)(a1 + 40), v2, *(_QWORD *)(a1 + 56), v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21901C4E0;
  block[3] = &unk_24DA57B08;
  v6 = *(id *)(a1 + 48);
  v11 = *(_BYTE *)(a1 + 64);
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void sub_21901C4E0(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  void **v13;
  void *v14;
  void **v15;
  void *v16;
  void **v17;
  void *v18;
  void **v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  uint8_t buf[4];
  uint64_t v177;
  __int16 v178;
  int v179;
  __int16 v180;
  uint64_t v181;
  uint64_t v182;

  v182 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v177 = v4;
    v178 = 1024;
    v179 = v3;
    v180 = 2112;
    v181 = v5;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "Updating chat %@ with call metadata (isFinalUpdate: %d): %@", buf, 0x1Cu);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    if (!qword_25503B910)
    {
      v9 = (void **)MEMORY[0x219A282F8]("AVConferenceFrontCaptureTime", CFSTR("AVConference"));
      if (v9)
        v10 = *v9;
      else
        v10 = 0;
      objc_storeStrong((id *)&qword_25503B910, v10);
    }
    if (!qword_25503B918)
    {
      v11 = (void **)MEMORY[0x219A282F8]("AVConferenceBackCaptureTime", CFSTR("AVConference"));
      if (v11)
        v12 = *v11;
      else
        v12 = 0;
      objc_storeStrong((id *)&qword_25503B918, v12);
    }
    if (!qword_25503B920)
    {
      v13 = (void **)MEMORY[0x219A282F8]("AVConferenceSessionBitRate", CFSTR("AVConference"));
      if (v13)
        v14 = *v13;
      else
        v14 = 0;
      objc_storeStrong((id *)&qword_25503B920, v14);
    }
    if (!qword_25503B928)
    {
      v15 = (void **)MEMORY[0x219A282F8]("AVConferenceSessionSentBytes", CFSTR("AVConference"));
      if (v15)
        v16 = *v15;
      else
        v16 = 0;
      objc_storeStrong((id *)&qword_25503B928, v16);
    }
    if (!qword_25503B930)
    {
      v17 = (void **)MEMORY[0x219A282F8]("AVConferenceSessionReceivedBytes", CFSTR("AVConference"));
      if (v17)
        v18 = *v17;
      else
        v18 = 0;
      objc_storeStrong((id *)&qword_25503B930, v18);
    }
    if (!qword_25503B938)
    {
      v19 = (void **)MEMORY[0x219A282F8]("AVConferenceSessionConnectionType", CFSTR("AVConference"));
      if (v19)
        v20 = *v19;
      else
        v20 = 0;
      objc_storeStrong((id *)&qword_25503B938, v20);
    }
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_25503B910, v7, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v22, qword_25503B918, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v26, qword_25503B920, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v30, qword_25503B928, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(*(void **)(a1 + 40), v34, qword_25503B930, v35, v36);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(void **)(a1 + 32);
    v38 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend__frontCameraCaptureTime(v37, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_integerValue(v43, v44, v45, v46, v47);
    v53 = objc_msgSend_integerValue(v21, v49, v50, v51, v52);
    objc_msgSend_numberWithInteger_(v38, v54, v53 + v48, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setFrontCameraCaptureTime_(v37, v58, (uint64_t)v57, v59, v60);

    v61 = *(void **)(a1 + 32);
    v62 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend__backCameraCaptureTime(v61, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend_integerValue(v67, v68, v69, v70, v71);
    v77 = objc_msgSend_integerValue(v25, v73, v74, v75, v76);
    objc_msgSend_numberWithInteger_(v62, v78, v77 + v72, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setBackCameraCaptureTime_(v61, v82, (uint64_t)v81, v83, v84);

    objc_msgSend_setDataRate_(*(void **)(a1 + 32), v85, (uint64_t)v29, v86, v87);
    v88 = *(void **)(a1 + 32);
    v89 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_dataUploaded(v88, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend_integerValue(v94, v95, v96, v97, v98);
    v104 = objc_msgSend_integerValue(v33, v100, v101, v102, v103);
    objc_msgSend_numberWithInteger_(v89, v105, v104 + v99, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDataUploaded_(v88, v109, (uint64_t)v108, v110, v111);

    v112 = *(void **)(a1 + 32);
    v113 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_dataDownloaded(v112, v114, v115, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend_integerValue(v118, v119, v120, v121, v122);
    v128 = objc_msgSend_integerValue(v175, v124, v125, v126, v127);
    objc_msgSend_numberWithInteger_(v113, v129, v128 + v123, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDataDownloaded_(v112, v133, (uint64_t)v132, v134, v135);

    if (qword_25503B938)
    {
      v139 = *(void **)(a1 + 32);
      objc_msgSend_objectForKey_(*(void **)(a1 + 40), v136, qword_25503B938, v137, v138);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_msgSend_intValue(v140, v141, v142, v143, v144);
      objc_msgSend__setConnectionType_(v139, v146, v145, v147, v148);

    }
    if (qword_253DE9370)
    {
      objc_msgSend_objectForKey_(*(void **)(a1 + 40), v136, qword_253DE9370, v137, v138);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = v149;
      if (v149)
      {
        v155 = *(void **)(a1 + 32);
        if (objc_msgSend_integerValue(v149, v150, v151, v152, v153))
          objc_msgSend__setLocalNetworkConnectionType_(v155, v156, 1, v157, v158);
        else
          objc_msgSend__setLocalNetworkConnectionType_(v155, v156, 2, v157, v158);
      }

    }
    v159 = qword_253DE9378;
    if (qword_253DE9378)
    {
      objc_msgSend_objectForKey_(*(void **)(a1 + 40), v136, qword_253DE9378, v137, v138);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = v160;
      if (v160)
      {
        v166 = *(void **)(a1 + 32);
        if (objc_msgSend_integerValue(v160, v161, v162, v163, v164))
          objc_msgSend__setRemoteNetworkConnectionType_(v166, v167, 1, v168, v169);
        else
          objc_msgSend__setRemoteNetworkConnectionType_(v166, v167, 2, v168, v169);
      }

    }
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend_setMetadataFinalized(*(void **)(a1 + 32), v136, v159, v137, v138);
    objc_msgSend_sharedInstance(IMAVCallManager, v136, v159, v137, v138);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sendProxyUpdate(v170, v171, v172, v173, v174);

  }
}

void sub_21901CCEC()
{
  IMAVLocalPreviewClient *v0;
  void *v1;

  v0 = objc_alloc_init(IMAVLocalPreviewClient);
  v1 = (void *)qword_253DE94F0;
  qword_253DE94F0 = (uint64_t)v0;

}

uint64_t sub_21901EE8C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__updatePreviewState(*(void **)(a1 + 32), a2, a3, a4, a5);
}

void sub_21901FD30()
{
  IMAVDaemonController *v0;
  void *v1;

  v0 = objc_alloc_init(IMAVDaemonController);
  v1 = (void *)qword_253DE94F8;
  qword_253DE94F8 = (uint64_t)v0;

}

void sub_2190200A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2190200C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend_isValid(*(void **)(*(_QWORD *)(a1 + 32) + 16), a2, a3, a4, a5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_2190201BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2190201D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend_isValid(*(void **)(*(_QWORD *)(a1 + 32) + 8), a2, a3, a4, a5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_2190203B0(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) != 0;
  return result;
}

uint64_t sub_219020470(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16) != 0;
  return result;
}

void sub_2190204E4(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up LOCAL object", v12, 2u);
  }

  objc_msgSend_setTarget_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v3, 0, v4, v5);
  objc_msgSend_invalidate(*(void **)(*(_QWORD *)(a1 + 32) + 16), v6, v7, v8, v9);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = 0;

}

void sub_2190205D0(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up REMOTE object", v9, 2u);
  }

  objc_msgSend_invalidate(*(void **)(*(_QWORD *)(a1 + 32) + 8), v3, v4, v5, v6);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = 0;

}

void sub_219020780(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2190207A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend_count(*(void **)(*(_QWORD *)(a1 + 32) + 40), a2, a3, a4, a5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_219020914(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Adding listener with ID: %@", (uint8_t *)&v11, 0xCu);
  }

  return objc_msgSend_addObject_(*(void **)(*(_QWORD *)(a1 + 32) + 40), v7, *(_QWORD *)(a1 + 40), v8, v9);
}

uint64_t sub_219020A9C(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend_containsObject_(*(void **)(a1[4] + 40), a2, a1[5], a4, a5);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void sub_219020C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_219020C48(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_containsObject_(*(void **)(a1[4] + 40), a2, a1[5], a4, a5);
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = a1[5];
      v15 = 138412290;
      v16 = v9;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Removing listener with ID: %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend_removeObject_(*(void **)(a1[4] + 40), v10, a1[5], v11, v12);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (v8)
    {
      v13 = a1[5];
      v14 = *(_QWORD *)(a1[4] + 40);
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring we don't have a listener with ID: %@   (%@)", (uint8_t *)&v15, 0x16u);
    }

  }
}

void sub_2190210A0(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 48);
  _IMGetAVAgentRemoteObject();

}

void sub_21902112C(uint64_t a1, void *a2, void *a3)
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
  id v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  _QWORD block[5];
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend__remoteObjectCleanup(*(void **)(a1 + 32), v7, v8, v9, v10);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = MEMORY[0x24BDAC760];
  v13 = *(NSObject **)(v11 + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2190213B8;
  block[3] = &unk_24DA572E0;
  block[4] = v11;
  v14 = v5;
  v48 = v14;
  dispatch_sync(v13, block);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(NSObject **)(v15 + 80);
  v46[0] = v12;
  v46[1] = 3221225472;
  v46[2] = sub_2190213C4;
  v46[3] = &unk_24DA57828;
  v46[4] = v15;
  dispatch_sync(v16, v46);
  objc_msgSend__localObjectCleanup(*(void **)(a1 + 32), v17, v18, v19, v20);
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(NSObject **)(v21 + 80);
  v44[0] = v12;
  v44[1] = 3221225472;
  v44[2] = sub_219021418;
  v44[3] = &unk_24DA572E0;
  v44[4] = v21;
  v23 = v14;
  v45 = v23;
  dispatch_sync(v22, v44);
  if (objc_msgSend_remoteObjectExists(*(void **)(a1 + 32), v24, v25, v26, v27))
  {
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(NSObject **)(v28 + 64);
    v43[0] = v12;
    v43[1] = 3221225472;
    v43[2] = sub_219021494;
    v43[3] = &unk_24DA57828;
    v43[4] = v28;
    dispatch_sync(v29, v43);
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(NSObject **)(v30 + 80);
    v42[0] = v12;
    v42[1] = 3221225472;
    v42[2] = sub_219021574;
    v42[3] = &unk_24DA57828;
    v42[4] = v30;
    dispatch_sync(v31, v42);
    objc_msgSend_setupComplete_info_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v32, 1, (uint64_t)v6, v33);
  }
  else
  {
    sub_2190076D0();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      v50 = v35;
      _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, "  Failed to build remote object for listener: %@", buf, 0xCu);
    }

    sub_2190076D0();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v36, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to launch and connect to daemon", buf, 2u);
    }

    objc_msgSend__localObjectCleanup(*(void **)(a1 + 32), v37, v38, v39, v40);
  }
  v41 = *(_QWORD *)(a1 + 40);
  if (v41)
    (*(void (**)(void))(v41 + 16))();

}

void sub_2190213B8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

void sub_2190213C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  id v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v7, v6, *(_QWORD *)(a1 + 32), *MEMORY[0x24BE50168], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

}

void sub_219021418(uint64_t a1)
{
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = objc_alloc(MEMORY[0x24BE50300]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend_connection(*(void **)(a1 + 40), v4, v5, v6, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_initWithTarget_connection_protocol_(v2, v8, v3, (uint64_t)v12, (uint64_t)&unk_25504A400);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v9;

}

void sub_219021494(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "  Built object: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v8, v9, *(_QWORD *)(a1 + 32), (uint64_t)sel_remoteObjectDiedNotification_, *MEMORY[0x24BE501D0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

}

void sub_219021574(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  id v7;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v7, v6, *(_QWORD *)(a1 + 32), (uint64_t)sel_localObjectDiedNotification_, *MEMORY[0x24BE50168], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

}

void sub_2190215D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___im_performBlock_afterDelay_modes_(v7, v5, (uint64_t)&unk_24DA57C80, *MEMORY[0x24BE501E0], v6, 0.0);

}

id sub_21902161C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (id)objc_msgSend_standardControls(MEMORY[0x24BE50340], a2, a3, a4, a5);
  return (id)objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v6, v7, v8, v9);
}

void sub_2190218E8(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 97) = 0;
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
  if (objc_msgSend_remoteObjectExists(*(void **)(a1 + 32), v2, v3, v4, v5))
  {
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v6, v7, v8, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v12, v10, (uint64_t)CFSTR("__kIMAVDaemonDidConnectNotification"), 0, v11);

  }
}

uint64_t sub_219021C80(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v8[16];

  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, " ...auto reconnecting", v8, 2u);
  }

  return objc_msgSend__listenerSetUpdated(*(void **)(a1 + 32), v3, v4, v5, v6);
}

void sub_219021F90(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = (const char *)objc_msgSend_selector(v7, v3, v4, v5, v6);
    NSStringFromSelector(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "Not connected to the avDaemon, not forwarding invocation: (invocation %@,  selector  %@,  remoteObject %@)", (uint8_t *)&v11, 0x20u);

  }
}

void sub_219022070(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char isLocalObjectValidOnQueue;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  char v12;

  isLocalObjectValidOnQueue = objc_msgSend___isLocalObjectValidOnQueue_(*(void **)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), a4, a5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2190220F8;
  block[3] = &unk_24DA57B08;
  v12 = isLocalObjectValidOnQueue;
  block[4] = v7;
  v11 = v8;
  dispatch_sync(v9, block);

}

void sub_2190220F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int isSetupComplete;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend_listener(*(void **)(a1 + 32), a2, a3, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isSetupComplete = objc_msgSend_isSetupComplete(v6, v7, v8, v9, v10);

    if (isSetupComplete)
    {
      if (objc_msgSend___isRemoteObjectValidOnQueue_(*(void **)(a1 + 32), v12, 0, v13, v14))
      {
        sub_2190076D0();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(void **)(a1 + 40);
          v21 = (const char *)objc_msgSend_selector(v20, v16, v17, v18, v19);
          NSStringFromSelector(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v34 = 138412802;
          v35 = v20;
          v36 = 2112;
          v37 = v22;
          v38 = 2112;
          v39 = v23;
          _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "Forwarding invocation to avDaemon: (invocation %@,  selector  %@,  remoteObject %@)", (uint8_t *)&v34, 0x20u);

        }
        objc_msgSend_defaultBroadcaster(MEMORY[0x24BE50350], v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_broadcastProxyForTarget_messageContext_protocol_(v28, v29, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, (uint64_t)&unk_25504A4C8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          objc_msgSend_invokeWithTarget_(*(void **)(a1 + 40), v31, (uint64_t)v30, v32, v33);

      }
    }
  }
}

void sub_2190226EC()
{
  objc_end_catch();
  JUMPOUT(0x2190226FCLL);
}

uint64_t sub_21902271C(uint64_t a1)
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 7)
  {
    sub_2190076D0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = a1;
      _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "[WARN] AVConferenceConnType unknown/unhandled type: %d", (uint8_t *)v4, 8u);
    }

  }
  return a1;
}

uint64_t sub_2190227C8(uint64_t a1)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 7 && (a1 - 128) >= 7)
  {
    sub_2190076D0();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = a1;
      _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] AVConferenceNATType unknown/unhandled type: %d", (uint8_t *)v4, 8u);
    }

  }
  return a1;
}

uint64_t sub_219022884(uint64_t a1)
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 0x20)
  {
    sub_2190076D0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = a1;
      _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatEndedReason unknown/unhandled reason: %d", (uint8_t *)v4, 8u);
    }

  }
  return a1;
}

uint64_t sub_219022930(int a1)
{
  if (a1 == -2)
    return 1;
  else
    return 2 * (a1 == -1);
}

uint64_t sub_219022948(int a1)
{
  if ((a1 - 1000) >= 0x12)
    return 0;
  else
    return (a1 - 999);
}

uint64_t sub_21902295C(int a1)
{
  if ((a1 - 32000) >= 0x18)
    return 0;
  else
    return (a1 - 31999);
}

uint64_t sub_219022978(int a1)
{
  if ((a1 - 3000) >= 0xC)
    return 0;
  else
    return (a1 - 2999);
}

uint64_t sub_21902298C(int a1)
{
  unsigned int v1;
  int v2;
  int v3;
  unsigned int v4;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  if (a1 > 6600)
  {
    if (a1 == 6900)
      v6 = 10;
    else
      v6 = 0;
    if (a1 == 6801)
      v7 = 9;
    else
      v7 = v6;
    if (a1 == 6800)
      v8 = 8;
    else
      v8 = v7;
    if (a1 == 6701)
      v9 = 7;
    else
      v9 = 0;
    if (a1 == 6700)
      v10 = 6;
    else
      v10 = v9;
    if (a1 == 6601)
      v11 = 5;
    else
      v11 = v10;
    if (a1 <= 6799)
      return v11;
    else
      return v8;
  }
  else
  {
    if (a1 == 6600)
      v1 = 4;
    else
      v1 = 0;
    if (a1 == 6500)
      v1 = 3;
    if (a1 == 6400)
      v1 = 11;
    if (a1 == 6100)
      v2 = 12;
    else
      v2 = 0;
    if (a1 == 6001)
      v3 = 2;
    else
      v3 = v2;
    if (a1 == 6000)
      v4 = 1;
    else
      v4 = v3;
    if (a1 <= 6399)
      return v4;
    else
      return v1;
  }
}

uint64_t sub_219022A74(int a1)
{
  if ((a1 - 7000) >= 3)
    return 0;
  else
    return (a1 - 6999);
}

uint64_t sub_219022A90(int a1)
{
  if ((a1 - 8000) >= 7)
    return 0;
  else
    return (a1 - 7999);
}

uint64_t sub_219022AAC(int a1)
{
  if ((a1 - 5000) > 0x57)
    return 0;
  else
    return dword_2190279E8[a1 - 5000];
}

uint64_t sub_219022AD4(unint64_t a1)
{
  int v1;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v1 = a1;
  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 < 4)
    return (a1 + 1);
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVInterfaceNetworkCheckResult unknown/unhandled result: %d", (uint8_t *)v4, 8u);
  }

  return 0;
}

uint64_t sub_219024490(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  int v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 40) != 32001)
  {
    sub_2190076D0();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v51) = 0;
      _os_log_impl(&dword_218FEA000, v41, OS_LOG_TYPE_DEFAULT, " => Will not run network check", (uint8_t *)&v51, 2u);
    }

    goto LABEL_17;
  }
  objc_msgSend_sharedInstance(MEMORY[0x24BE30378], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("gk-p2p-post-connectivity-check"), v8, v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_intValue(v10, v11, v12, v13, v14);
  sub_2190076D0();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v51 = 138412290;
    v52 = v10;
    _os_log_impl(&dword_218FEA000, v16, OS_LOG_TYPE_DEFAULT, "Bag value key for connectivity check: %@", (uint8_t *)&v51, 0xCu);
  }

  sub_2190076D0();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("NO");
    if (v15 > 0)
      v18 = CFSTR("YES");
    v51 = 138412290;
    v52 = v18;
    _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, " => Will run check: %@", (uint8_t *)&v51, 0xCu);
  }

  if (v15 < 1)
  {
LABEL_17:
    objc_msgSend__setNetworkCheckResult_(*(void **)(a1 + 32), v19, -1, v20, v21);
    goto LABEL_18;
  }
  sub_2190076D0();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v51) = 0;
    _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "Running network connectivity check", (uint8_t *)&v51, 2u);
  }

  v27 = objc_msgSend__localNetworkConnectionType(*(void **)(a1 + 32), v23, v24, v25, v26) == 2;
  objc_msgSend_sharedInstance(IMAVInterface, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend__checkNetworkForChat_requiresWifi_(v32, v33, *(_QWORD *)(a1 + 32), v27, v34);

  sub_2190076D0();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v51 = 67109120;
    LODWORD(v52) = v35;
    _os_log_impl(&dword_218FEA000, v36, OS_LOG_TYPE_DEFAULT, " => Done with result: %d", (uint8_t *)&v51, 8u);
  }

LABEL_18:
  objc_msgSend_sharedInstance(IMAVInterface, v37, v38, v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__runPingTestForChat_(v42, v43, *(_QWORD *)(a1 + 32), v44, v45);

  objc_msgSend___sendEndCallMetricToAWDWithReason_andError_(*(void **)(a1 + 32), v46, *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 40), v47);
  return objc_msgSend___sendEndCallMetricToViceroyWithReason_andError_(*(void **)(a1 + 32), v48, *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 40), v49);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

uint64_t FTAWDLogCallConnected()
{
  return MEMORY[0x24BE30248]();
}

uint64_t FTAWDLogCallEnded()
{
  return MEMORY[0x24BE30258]();
}

uint64_t FTAWDLogCallEndedViceroy()
{
  return MEMORY[0x24BE30260]();
}

uint64_t FTAWDLogCallFailed()
{
  return MEMORY[0x24BE30268]();
}

uint64_t FTAWDLogCallInterruptionBegan()
{
  return MEMORY[0x24BE30270]();
}

uint64_t FTAWDLogCallInterruptionEnded()
{
  return MEMORY[0x24BE30278]();
}

uint64_t FTAWDLogCallStarted()
{
  return MEMORY[0x24BE302B0]();
}

uint64_t FTAWDSetSubmissionDate()
{
  return MEMORY[0x24BE302B8]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x24BE50128]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x24BE50130]();
}

uint64_t IMGetDomainIntForKey()
{
  return MEMORY[0x24BE50138]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x24BE50140]();
}

uint64_t IMGetMainBundleIdentifier()
{
  return MEMORY[0x24BE50148]();
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x24BE50170]();
}

uint64_t IMLogSimulateCrashForException()
{
  return MEMORY[0x24BE50178]();
}

uint64_t IMOperationalAccountForService()
{
  return MEMORY[0x24BE501A8]();
}

uint64_t IMPerformPingTest()
{
  return MEMORY[0x24BE501B0]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x24BE50238]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x24BE50250]();
}

uint64_t IMTimeOfDay()
{
  return MEMORY[0x24BE50268]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50270]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x24BE50278]();
}

uint64_t MarcoLogCallInfo()
{
  return MEMORY[0x24BE64000]();
}

uint64_t MarcoShouldLog()
{
  return MEMORY[0x24BE64020]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x24BDD1270]((__n128)aSize, *(__n128 *)&aSize.height);
}

uint64_t SecureRandomUInt()
{
  return MEMORY[0x24BE503B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _FTAreIDsEquivalent()
{
  return MEMORY[0x24BE30390]();
}

uint64_t _IMGetAVAgentRemoteObject()
{
  return MEMORY[0x24BE503B8]();
}

uint64_t _IMLoggingSetFailureReason()
{
  return MEMORY[0x24BE503C0]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x24BE503D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x24BE503D8]();
}

uint64_t im_main_thread()
{
  return MEMORY[0x24BE503E0]();
}

uint64_t im_notify_register_dispatch()
{
  return MEMORY[0x24BE503E8]();
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
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

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x24BEDD4E8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

