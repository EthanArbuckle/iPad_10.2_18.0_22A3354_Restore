void sub_1A4C8076C(uint64_t a1)
{
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  v2 = objc_alloc(MEMORY[0x1E0C99D20]);
  v4 = (void *)objc_msgSend_initWithObjects_(v2, v3, (uint64_t)CFSTR("3Gvenice"), CFSTR("venice"), 0);
  qword_1ECF9D7E0 = MGRegisterForUpdates();
  objc_msgSend__updateCapabilities(*(void **)(a1 + 32), v5, v6);

}

uint64_t sub_1A4C80810()
{
  uint64_t result;

  qword_1ECF9D7C0 = MEMORY[0x1A85A5DE0](CFSTR("MCProfileConnection"), CFSTR("ManagedConfiguration"));
  result = MEMORY[0x1A85A5DE0](CFSTR("MCRestrictionManager"), CFSTR("ManagedConfiguration"));
  qword_1ECF9D7D0 = result;
  return result;
}

void sub_1A4C80E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4C82010()
{
  FTSelectedPNRSubscription *v0;
  void *v1;

  v0 = objc_alloc_init(FTSelectedPNRSubscription);
  v1 = (void *)qword_1ECF9D868;
  qword_1ECF9D868 = (uint64_t)v0;

}

void sub_1A4C82038()
{
  FTEntitlementSupport *v0;
  void *v1;

  v0 = objc_alloc_init(FTEntitlementSupport);
  v1 = (void *)qword_1ECF9D888;
  qword_1ECF9D888 = (uint64_t)v0;

}

void sub_1A4C82060()
{
  FTServiceStatus *v0;
  const char *v1;
  uint64_t v2;
  uint64_t inited;
  void *v4;

  v0 = [FTServiceStatus alloc];
  inited = objc_msgSend_initPrivate(v0, v1, v2);
  v4 = (void *)qword_1ECF9D808;
  qword_1ECF9D808 = inited;

}

void sub_1A4C8208C()
{
  FTDeviceSupport *v0;
  void *v1;

  v0 = objc_alloc_init(FTDeviceSupport);
  v1 = (void *)qword_1ECF9D860;
  qword_1ECF9D860 = (uint64_t)v0;

}

uint64_t sub_1A4C820B4(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend__registerForServiceStatusNotifications(*(void **)(a1 + 32), a2, a3);
  objc_msgSend__registerForCarrierNotifications(*(void **)(a1 + 32), v4, v5);
  objc_msgSend__registerForCapabilityNotifications(*(void **)(a1 + 32), v6, v7);
  objc_msgSend__registerForLockdownNotifications(*(void **)(a1 + 32), v8, v9);
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__registerForManagedConfigurationNotifications, v10);
}

void sub_1A4C833D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4C84BE8(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  __SecKey *v36;
  const char *v37;
  uint64_t v38;
  __SecKey *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  int v46;
  _QWORD v47[4];
  id v48;
  void (**v49)(_QWORD);
  char v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  char v58;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__correctServerTimestampForDriftOnMessage_currentDate_(v4, v7, v5, v6);

  v8 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = sub_1A4C84F20;
  v51[3] = &unk_1E4DD9540;
  v52 = *(id *)(a1 + 40);
  v58 = *(_BYTE *)(a1 + 88);
  v53 = *(id *)(a1 + 48);
  v54 = *(id *)(a1 + 56);
  v55 = *(id *)(a1 + 64);
  v56 = *(id *)(a1 + 72);
  v57 = *(id *)(a1 + 80);
  v9 = (void (**)(_QWORD))MEMORY[0x1A85A6380](v51);
  if (!objc_msgSend_wantsPushSignatures(*(void **)(a1 + 40), v10, v11)
    || (objc_msgSend_ignorePushSigHeaders(*(void **)(a1 + 40), v12, v13) & 1) != 0)
  {
    goto LABEL_8;
  }
  v16 = _os_feature_enabled_impl();
  v17 = *(void **)(a1 + 40);
  if (!v16)
  {
    v46 = *(unsigned __int8 *)(a1 + 88);
    objc_msgSend_pushToken(v17, v14, v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pushCertificate(*(void **)(a1 + 40), v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (__SecKey *)objc_msgSend_pushPublicKey(*(void **)(a1 + 40), v34, v35);
    v39 = (__SecKey *)objc_msgSend_pushPrivateKey(*(void **)(a1 + 40), v37, v38);
    v40 = *(void **)(a1 + 56);
    v41 = *(void **)(a1 + 64);
    v42 = *(void **)(a1 + 48);
    objc_msgSend_serverTimestamp(*(void **)(a1 + 40), v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1A4C8556C(v46, v30, v33, v36, v39, v42, v40, v41, v45, CFSTR("push"), 0, *(void **)(a1 + 72));

LABEL_8:
    v9[2](v9);
    goto LABEL_9;
  }
  v18 = *(void **)(a1 + 48);
  v19 = *(void **)(a1 + 56);
  objc_msgSend_pushToken(v17, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A4C89574(v18, v19, v20, *(void **)(a1 + 64));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v21;
    _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, "Using push signing API to sign { signatureBody: %@ }", buf, 0xCu);
  }

  v25 = *(void **)(a1 + 32);
  objc_msgSend_serverTimestamp(*(void **)(a1 + 40), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v8;
  v47[1] = 3221225472;
  v47[2] = sub_1A4C85858;
  v47[3] = &unk_1E4DD9568;
  v50 = *(_BYTE *)(a1 + 88);
  v48 = *(id *)(a1 + 72);
  v49 = v9;
  objc_msgSend_signDataWithPushIdentity_serverTimestamp_withCompletion_(v25, v29, (uint64_t)v21, v28, v47);

LABEL_9:
}

uint64_t sub_1A4C84F20(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  __SecKey *v20;
  const char *v21;
  uint64_t v22;
  __SecKey *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void **v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  __SecKey *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  __SecKey *v51;
  void *v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  __SecKey *v83;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  __SecKey *v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  NSObject *v100;
  NSObject *v101;
  const char *v102;
  uint64_t v103;
  CFMutableDictionaryRef *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  int v111;
  int v112;
  void **v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  const char *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t *)(a1 + 32);
  objc_msgSend_certDataArray(*(void **)(a1 + 32), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend_count(v5, v6, v7);

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1A4CB9F3C(v4, v10);
  v113 = (void **)v4;

  v11 = *(unsigned __int8 *)(a1 + 80);
  objc_msgSend_pushToken(*(void **)(a1 + 32), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IDCertificate(*(void **)(a1 + 32), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (__SecKey *)objc_msgSend_identityPublicKey(*(void **)(a1 + 32), v18, v19);
  v23 = (__SecKey *)objc_msgSend_identityPrivateKey(*(void **)(a1 + 32), v21, v22);
  v24 = *(void **)(a1 + 48);
  v25 = *(void **)(a1 + 56);
  v26 = *(void **)(a1 + 40);
  objc_msgSend_serverTimestamp(*(void **)(a1 + 32), v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = a1;
  v105 = (CFMutableDictionaryRef *)(a1 + 64);
  sub_1A4C8556C(v11, v14, v17, v20, v23, v26, v24, v25, v29, CFSTR("id"), 0, *(void **)(a1 + 64));

  if (v110 == 1)
  {
    v32 = v113;
    v33 = v116;
    if ((objc_msgSend_isMultipleAuthCertCapable(*v113, v30, v31) & 1) == 0)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v30, v31);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        sub_1A4CB9EC4((uint64_t)v113);

      v111 = *(unsigned __int8 *)(v116 + 80);
      objc_msgSend_pushToken(*(void **)(v116 + 32), v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_certDataArray(*(void **)(v116 + 32), v38, v39);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v114, v40, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicKeyArray(*(void **)(v116 + 32), v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (__SecKey *)objc_msgSend_objectAtIndex_(v44, v45, 0);
      objc_msgSend_privateKeyArray(*(void **)(v116 + 32), v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (__SecKey *)objc_msgSend_objectAtIndex_(v49, v50, 0);
      v53 = *(void **)(v116 + 48);
      v52 = *(void **)(v116 + 56);
      v54 = *(void **)(v116 + 40);
      objc_msgSend_serverTimestamp(*(void **)(v116 + 32), v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1A4C8556C(v111, v37, v41, v46, v51, v54, v53, v52, v57, CFSTR("auth"), 0, *(void **)(v116 + 64));

      v33 = v116;
      objc_msgSend_userIDArray(*(void **)(v116 + 32), v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v60, v61, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        CFDictionarySetValue(*v105, CFSTR("x-auth-user-id"), v62);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1A4CB9E40();
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v102, v103);
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
        sub_1A4CB9D50((uint64_t)v105);
LABEL_30:

      return (*(uint64_t (**)(void))(*(_QWORD *)(v33 + 72) + 16))();
    }
  }
  else
  {
    v32 = v113;
    v33 = v116;
    if (v110 > 1)
    {
LABEL_11:
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v30, v31);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        sub_1A4CB9DC8((uint64_t)v32);

      if (v110 >= 1)
      {
        v66 = 0;
        v67 = v110;
        if (v110 <= 1uLL)
          v67 = 1;
        v106 = v67;
        do
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v64, (uint64_t)CFSTR("-%d"), v66);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = *(unsigned __int8 *)(v33 + 80);
          objc_msgSend_pushToken(*(void **)(v33 + 32), v69, v70);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_certDataArray(*(void **)(v33 + 32), v71, v72);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndex_(v115, v73, v66);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_publicKeyArray(*(void **)(v33 + 32), v75, v76);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend_objectAtIndex_(v108, v77, v66);
          objc_msgSend_privateKeyArray(*(void **)(v116 + 32), v79, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = (__SecKey *)objc_msgSend_objectAtIndex_(v81, v82, v66);
          v107 = *(void **)(v116 + 48);
          v84 = *(void **)(v116 + 56);
          v85 = *(void **)(v116 + 40);
          objc_msgSend_serverTimestamp(*(void **)(v116 + 32), v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = (__SecKey *)v78;
          v33 = v116;
          sub_1A4C8556C(v112, v109, v74, v89, v83, v85, v107, v84, v88, CFSTR("auth"), v68, *(void **)(v116 + 64));

          v90 = v68;
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v91, (uint64_t)CFSTR("x-auth-user-id%@"), v68);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_userIDArray(*(void **)(v116 + 32), v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndex_(v95, v96, v66);
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          if (v97)
          {
            CFDictionarySetValue(*v105, v92, v97);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v118 = v92;
            v119 = 2080;
            v120 = "dictionary";
            _os_log_error_impl(&dword_1A4C7F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
          }

          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v98, v99);
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v92;
            _os_log_debug_impl(&dword_1A4C7F000, v100, OS_LOG_TYPE_DEBUG, "   adding userID: %@", buf, 0xCu);
          }

          ++v66;
        }
        while (v106 != v66);
      }
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v64, v65);
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
        sub_1A4CB9D50((uint64_t)v105);
      goto LABEL_30;
    }
  }
  if (objc_msgSend_isMultipleAuthCertCapable(*v32, v30, v31))
    goto LABEL_11;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v33 + 72) + 16))();
}

void sub_1A4C8556C(int a1, void *a2, void *a3, __SecKey *a4, __SecKey *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  id v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  __CFString *v22;
  id v23;
  id v24;
  const char *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *value;
  void *v44;
  id v45;

  v19 = a3;
  v20 = a12;
  v21 = v20;
  if (v19 && a5 && a10 && v20)
  {
    value = v19;
    v44 = 0;
    v45 = 0;
    v22 = a11;
    v23 = a10;
    _FTGenerateNonceAndSignatureFromComponents(a4, a5, a6, a7, a2, a8, a9, &v45, &v44);
    v24 = v45;
    v26 = v44;
    if (v22)
    {
      v27 = v22;
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("x-%@-cert%@"), v23, v22);
    }
    else
    {
      v27 = &stru_1E4DDA770;
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("x-%@-cert%@"), v23, &stru_1E4DDA770);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v29, (uint64_t)CFSTR("x-%@-nonce%@"), v23, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v31, (uint64_t)CFSTR("x-%@-sig%@"), v23, v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (a1)
    {
      v19 = value;
      CFDictionarySetValue(v21, v28, value);
      v35 = v24;
      if (v35)
      {
        CFDictionarySetValue(v21, v30, v35);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1A4CB9FB0();
      }

      v37 = v26;
      if (!v37)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        goto LABEL_28;
      }
    }
    else
    {
      v19 = value;
      objc_msgSend__FTStringFromBaseData(value, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        CFDictionarySetValue(v21, v28, v36);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1A4CB9FB0();
      }

      objc_msgSend__FTStringFromBaseData(v24, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        CFDictionarySetValue(v21, v30, v40);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1A4CB9FB0();
      }

      objc_msgSend__FTStringFromBaseData(v26, v41, v42);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
LABEL_27:
          sub_1A4CB9FB0();
LABEL_28:

        goto LABEL_29;
      }
    }
    CFDictionarySetValue(v21, v32, v37);
    goto LABEL_28;
  }
LABEL_29:

}

void sub_1A4C85858(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = v9;
  if (*(_BYTE *)(a1 + 48))
  {
    v13 = v9;
  }
  else
  {
    objc_msgSend__FTStringFromBaseData(v9, v10, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v13;
  if (*(_BYTE *)(a1 + 48))
  {
    v17 = v7;
  }
  else
  {
    objc_msgSend__FTStringFromBaseData(v7, v14, v15);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  IDSPEMFormatCertificatesForPushHeader();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("x-push-cert"), v21);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1A4CBA12C();
  }

  v22 = v16;
  if (v22)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("x-push-nonce"), v22);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1A4CBA0A8();
  }

  v23 = v18;
  if (v23)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("x-push-sig"), v23);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1A4CBA024();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1A4C859F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  int isEqualToString;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  const char *v40;
  int v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v11 = a4;
  if (v7)
  {
    objc_msgSend_addEntriesFromDictionary_(*(void **)(a1 + 40), v9, (uint64_t)v7);
  }
  else
  {
    objc_msgSend_nonce(MEMORY[0x1E0D36AA8], v9, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 32);
      objc_msgSend_signingSession(v17, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v17;
      v51 = 2112;
      v52 = v18;
      v53 = 2112;
      v54 = v8;
      _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, "Failed to sign message {message: %@, signingSession: %@, error: %@}", buf, 0x20u);

    }
  }
  objc_msgSend_signingDigest(v11, v12, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v22 = *(void **)(a1 + 32);
    objc_msgSend_signingDigest(v11, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBaaSigningDigest_(v22, v24, (uint64_t)v23);

  }
  if (v8)
  {
    objc_msgSend_domain(v8, v20, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("IDSBAASignerErrorDomain"));

    if (isEqualToString)
    {
      objc_msgSend_setBaaSigningError_(*(void **)(a1 + 32), v28, (uint64_t)v8);
    }
    else
    {
      v42 = v11;
      v43 = v7;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend_underlyingErrors(v8, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v44, v48, 16);
      if (v32)
      {
        v35 = v32;
        v36 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v45 != v36)
              objc_enumerationMutation(v30);
            v38 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend_domain(v38, v33, v34);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend_isEqualToString_(v39, v40, (uint64_t)CFSTR("IDSBAASignerErrorDomain"));

            if (v41)
            {
              objc_msgSend_setBaaSigningError_(*(void **)(a1 + 32), v33, (uint64_t)v38);
              goto LABEL_21;
            }
          }
          v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v44, v48, 16);
          if (v35)
            continue;
          break;
        }
      }
LABEL_21:

      v11 = v42;
      v7 = v43;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1A4C85C80(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend_baaSigner(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend_serverTimestamp(*(void **)(a1 + 48), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topic(*(void **)(a1 + 48), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1A4C85D70;
  v13[3] = &unk_1E4DD95B8;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  objc_msgSend_headersBySigningData_serverTimestamp_topic_completion_(v4, v12, v5, v8, v11, v13);

}

void sub_1A4C85D70(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v11 = a4;
  if (v8)
  {
    objc_msgSend_nonce(MEMORY[0x1E0D36AA8], v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v20 = 138412546;
      v21 = v13;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_DEFAULT, "Failed to baa sign message {message: %@, error: %@}", (uint8_t *)&v20, 0x16u);
    }

  }
  if (v7)
    objc_msgSend_addEntriesFromDictionary_(*(void **)(a1 + 40), v9, (uint64_t)v7);
  objc_msgSend_signingDigest(v11, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend_signingDigest(v11, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBaaSigningDigest_(v17, v19, (uint64_t)v18);

  }
  objc_msgSend_setBaaSigningError_(*(void **)(a1 + 32), v15, (uint64_t)v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t sub_1A4C86000()
{
  uint64_t result;

  result = MEMORY[0x1A85A5DE0](CFSTR("APSSignDataWithIdentityRequest"), CFSTR("ApplePushService"));
  qword_1EE788A70 = result;
  return result;
}

void sub_1A4C8602C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend_signature(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Failed to sign with push identity", buf, 2u);
    }

  }
  objc_msgSend_certificates(v3, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v10, v11, v12);

  if (!v13)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Failed to retrieve push certificates", buf, 2u);
    }

  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_signature(v3, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_debugDescription(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nonce(v3, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_debugDescription(v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_certificates(v3, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v40 = v23;
    v41 = 2112;
    v42 = v29;
    v43 = 2112;
    v44 = v32;
    _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Signed with push certs { signature: %@, nonce: %@, certs: %@", buf, 0x20u);

  }
  im_primary_queue();
  v33 = objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_1A4C86298;
  v36[3] = &unk_1E4DD9628;
  v34 = *(id *)(a1 + 32);
  v37 = v3;
  v38 = v34;
  v35 = v3;
  dispatch_async(v33, v36);

}

void sub_1A4C86298(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend_signature(*(void **)(a1 + 32), a2, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_certificates(*(void **)(a1 + 32), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nonce(*(void **)(a1 + 32), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v4 + 16))(v4, v11, v7, v10);

}

void sub_1A4C864F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1A4C86504(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1A4C86558(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_1A4C865F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](a2, sel__timeoutHit, a3);
}

void sub_1A4C8880C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;

  v13 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  if (objc_msgSend_length(v5, v7, v8))
    objc_msgSend_appendString_(*(void **)(a1 + 32), v9, (uint64_t)CFSTR("&"));
  v10 = (void *)IMCopyURLEscapedString();
  v11 = (void *)IMCopyURLEscapedString();

  objc_msgSend_appendFormat_(*(void **)(a1 + 32), v12, (uint64_t)CFSTR("%@=%@"), v10, v11);
}

void sub_1A4C888A8(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, uint64_t, void *);
  void *v20;
  id v21;
  uint64_t v22;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend_addEntriesFromDictionary_(v5, v6, (uint64_t)v4);

  objc_msgSend_additionalMessageHeaders(*(void **)(a1 + 32), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(v5, v10, (uint64_t)v9);

  objc_msgSend_setMessageHeaders_(*(void **)(a1 + 40), v11, (uint64_t)v5);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = sub_1A4C88988;
  v20 = &unk_1E4DD96E8;
  v12 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 48);
  v21 = v13;
  v22 = v14;
  objc_msgSend_setCompletionBlock_(v12, v15, (uint64_t)&v17);
  objc_msgSend_sendMessage_(*(void **)(*(_QWORD *)(a1 + 48) + 16), v16, *(_QWORD *)(a1 + 40), v17, v18, v19, v20);

}

void sub_1A4C88988(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  NSObject *v67;
  uint64_t v68;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  OSLogHandleForIDSCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v71 = a4;
    _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_DEFAULT, "Web Tunnel Response got %ld", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v68 = a4;
    _IDSLogV();
  }
  v15 = v9;
  if ((unint64_t)(a4 - 5200) <= 7)
  {
    if (((1 << (a4 - 80)) & 0x78) == 0)
      objc_msgSend__enterBackOffMode(*(void **)(a1 + 40), v13, v14);
    objc_msgSend_sendMessage_(*(void **)(*(_QWORD *)(a1 + 40) + 8), v13, *(_QWORD *)(a1 + 32));
    goto LABEL_25;
  }
  if (a4 == 20001)
  {
    objc_msgSend_setHasAttemptedAPSDelivery_(*(void **)(a1 + 32), v13, 0);
  }
  else if (!a4)
  {
    OSLogHandleForIDSCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Web Tunnel Query was successful; passing along the completion information",
        buf,
        2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
    objc_msgSend_handleResponseDictionary_(*(void **)(a1 + 32), v17, (uint64_t)v11, v68);
    v18 = *(void **)(a1 + 32);
    objc_msgSend_responseBodyData(v15, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleResponseBody_(v18, v22, (uint64_t)v21);

    v23 = *(void **)(a1 + 32);
    objc_msgSend_responseHeaders(v15, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleResponseHeaders_(v23, v27, (uint64_t)v26);

    v28 = *(void **)(a1 + 32);
    objc_msgSend_responseCode(v15, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_integerValue(v31, v32, v33);
    objc_msgSend_handleResponseStatus_(v28, v35, v34);

    objc_msgSend_completionBlock(*(void **)(a1 + 32), v36, v37);
    v38 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDeliveryMechanism_(*(void **)(a1 + 32), v39, 1);
    v40 = *(void **)(a1 + 32);
    v43 = objc_msgSend_sentByteCount(v15, v41, v42);
    objc_msgSend_setSentByteCount_(v40, v44, v43);
    v45 = *(void **)(a1 + 32);
    v48 = objc_msgSend_receivedByteCount(v15, v46, v47);
    objc_msgSend_setReceivedByteCount_(v45, v49, v48);
    v50 = *(void **)(a1 + 32);
    objc_msgSend_requestStart(v15, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestStart_(v50, v54, (uint64_t)v53);

    v55 = *(void **)(a1 + 32);
    objc_msgSend_requestEnd(v15, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestEnd_(v55, v59, (uint64_t)v58);

    v60 = *(void **)(a1 + 32);
    objc_msgSend_responseReceived(v15, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setResponseReceived_(v60, v64, (uint64_t)v63);

    ((void (**)(_QWORD, _QWORD, id, _QWORD, id))v38)[2](v38, *(_QWORD *)(a1 + 32), v10, 0, v11);
    goto LABEL_25;
  }
  OSLogHandleForIDSCategory();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v65, OS_LOG_TYPE_DEFAULT, "Unknown Error, Falling back to HTTP", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  objc_msgSend_sendMessage_(*(void **)(*(_QWORD *)(a1 + 40) + 8), v66, *(_QWORD *)(a1 + 32), v68);
LABEL_25:
  im_primary_queue();
  v67 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4C88E34;
  block[3] = &unk_1E4DD96C0;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v67, block);

}

uint64_t sub_1A4C88E34(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_dequeueMessageIfNeeded(*(void **)(a1 + 32), a2, a3);
}

uint64_t _FZErrorTypeFromNSError(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  void **v5;
  void *v6;
  void *v7;
  const char *v8;
  int isEqualToString;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int *v21;
  void *v22;
  const char *v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v1 = a1;
  v4 = v1;
  if (qword_1ECF9D720)
  {
    if (!v1)
      goto LABEL_23;
  }
  else
  {
    v5 = (void **)MEMORY[0x1A85A5DEC]("APSErrorDomain", CFSTR("ApplePushService"));
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&qword_1ECF9D720, v6);
    if (!v4)
      goto LABEL_23;
  }
  objc_msgSend_domain(v4, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)FTErrorDomain);

  if (isEqualToString)
  {
    v12 = objc_msgSend_code(v4, v10, v11);
    if (v12 == 20000)
      v13 = 8;
    else
      v13 = 1;
    if (v12 == 10000)
      v14 = 9;
    else
      v14 = v13;
  }
  else
  {
    objc_msgSend_domain(v4, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E0CB32E8]);

    if (v17)
    {
      v20 = objc_msgSend_code(v4, v18, v19) + 1020;
      if (v20 >= 0x15)
      {
LABEL_23:
        v14 = 1;
        goto LABEL_24;
      }
      v21 = (unsigned int *)&unk_1A4CBEEA8;
    }
    else
    {
      if (!qword_1ECF9D720)
        goto LABEL_23;
      objc_msgSend_domain(v4, v18, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_isEqualToString_(v22, v23, qword_1ECF9D720);

      if (!v24)
        goto LABEL_23;
      v20 = objc_msgSend_code(v4, v25, v26) - 2;
      if (v20 >= 5)
        goto LABEL_23;
      v21 = (unsigned int *)&unk_1A4CBEEFC;
    }
    v14 = v21[v20];
  }
LABEL_24:

  return v14;
}

uint64_t _FZErrorTypeFromResponseCodeAndError(int a1, void *a2)
{
  uint64_t result;

  result = _FZErrorTypeFromNSError(a2);
  if ((_DWORD)result == 1)
  {
    if (a1 > 5000)
    {
      if (a1 > 5031)
      {
        switch(a1)
        {
          case 5032:
            return 12;
          case 6000:
            return 18;
          case 10000:
            return 9;
        }
      }
      else
      {
        switch(a1)
        {
          case 5001:
            return 15;
          case 5006:
            return 19;
          case 5008:
            return 17;
        }
      }
      return 4;
    }
    else
    {
      switch(a1)
      {
        case 1000:
          result = 14;
          break;
        case 1001:
          return 17;
        case 1002:
        case 1003:
          result = 20;
          break;
        case 1004:
        case 1005:
          result = 13;
          break;
        default:
          if (a1 >= 2)
            return 4;
          result = 0;
          break;
      }
    }
  }
  return result;
}

__CFDictionary *_AuthenticationDictionaryFromParameters(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  const char *v10;
  uint64_t v11;
  const __CFString *v12;
  const void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = v9;
    if (a1)
    {
      v12 = CFSTR("auth-token");
      v13 = v5;
    }
    else
    {
      objc_msgSend__FTDataFromBase64String(v5, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IMSingleObjectArray();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        CFDictionarySetValue(v8, CFSTR("sigs"), v15);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1A4CBA1F0();
      }

      v12 = CFSTR("push-token");
      v9 = v8;
      v13 = v7;
    }
    CFDictionarySetValue(v9, v12, v13);
  }

  return v8;
}

__CFDictionary *_DeviceCapabilitiesFromParameters(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  __CFDictionary *v6;
  const char *v7;
  __CFDictionary *v8;
  void *v9;
  const char *v10;
  void *v11;

  v5 = a1;
  v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v6;
  if (v5)
    CFDictionarySetValue(v6, CFSTR("name"), v5);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v8, CFSTR("version"), v9);

  if (a3)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      CFDictionarySetValue(v8, CFSTR("flags"), v11);

  }
  return v8;
}

id _BindingsArrayFromURIs(void *a1)
{
  id v1;
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  __CFDictionary *v10;
  const char *v11;
  __CFDictionary *v12;
  const char *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = v1;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(const void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v12 = v10;
        if (v9)
          CFDictionarySetValue(v10, CFSTR("uri"), v9);
        objc_msgSend_addObject_(v2, v11, (uint64_t)v12, (_QWORD)v15);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v13, (uint64_t)&v15, v19, 16);
    }
    while (v6);
  }

  return v2;
}

uint64_t _FTIDSFlagsNumber(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  int isC2KEquipment;
  const char *v7;
  uint64_t v8;

  objc_msgSend_sharedInstance(FTDeviceSupport, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isC2KEquipment = objc_msgSend_isC2KEquipment(v3, v4, v5);

  if (isC2KEquipment)
    v8 = 17;
  else
    v8 = 1;
  return objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v7, v8);
}

void *_FTProfileVersionNumber()
{
  return &unk_1E4DE6508;
}

void _FTGenerateDigestForSigningFromComponents(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, _QWORD *a7, _QWORD *a8)
{
  id v15;
  id v16;

  v15 = a6;
  sub_1A4C89574(a2, a3, a4, a5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  _FTGenerateDigestForSigningFromPayload(a1, v16, v15, a7, a8);

}

id sub_1A4C89574(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  int v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  int v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  int v67;
  const char *v68;
  uint64_t v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  int v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  int v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  id v92;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  unsigned int v102;
  uint8_t buf[4];
  _DWORD v104[7];

  *(_QWORD *)&v104[5] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (objc_msgSend_length(v7, v12, v13) && (objc_msgSend_length(v8, v14, v15) || objc_msgSend_length(v10, v14, v16)))
  {
    objc_msgSend_dataUsingEncoding_(v7, v14, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = bswap32(objc_msgSend_length(v17, v18, v19));
    OSLogHandleForIDSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v104[0] = objc_msgSend_length(v17, v21, v22);
      LOWORD(v104[1]) = 2112;
      *(_QWORD *)((char *)&v104[1] + 2) = CFSTR("bag-key");
      _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "Appending %d length header for %@ segment", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v94 = (const __CFString *)objc_msgSend_length(v17, v23, v24);
      v97 = CFSTR("bag-key");
      _IDSLogV();
    }
    objc_msgSend_appendBytes_length_(v11, v23, (uint64_t)&v102, 4, v94, v97);
    if (objc_msgSend_length(v17, v25, v26))
    {
      OSLogHandleForIDSCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_msgSend_length(v17, v28, v29);
        *(_DWORD *)buf = 67109378;
        v104[0] = v30;
        LOWORD(v104[1]) = 2112;
        *(_QWORD *)((char *)&v104[1] + 2) = CFSTR("bag-key");
        _os_log_impl(&dword_1A4C7F000, v27, OS_LOG_TYPE_DEFAULT, "Appending %d bytes for %@ segment", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v95 = (const __CFString *)objc_msgSend_length(v17, v31, v32);
        v98 = CFSTR("bag-key");
        _IDSLogV();
      }
      objc_msgSend_appendData_(v11, v31, (uint64_t)v17, v95, v98);
    }
    else
    {
      OSLogHandleForIDSCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v104 = CFSTR("bag-key");
        _os_log_impl(&dword_1A4C7F000, v33, OS_LOG_TYPE_DEFAULT, "Appending no bytes for %@ segment", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v95 = CFSTR("bag-key");
        _IDSLogV();
      }
    }

    objc_msgSend_dataUsingEncoding_(v8, v34, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = -1431655766;
    v102 = bswap32(objc_msgSend_length(v35, v36, v37));
    OSLogHandleForIDSCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_msgSend_length(v35, v39, v40);
      *(_DWORD *)buf = 67109378;
      v104[0] = v41;
      LOWORD(v104[1]) = 2112;
      *(_QWORD *)((char *)&v104[1] + 2) = CFSTR("query-string");
      _os_log_impl(&dword_1A4C7F000, v38, OS_LOG_TYPE_DEFAULT, "Appending %d length header for %@ segment", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v95 = (const __CFString *)objc_msgSend_length(v35, v42, v43);
      v98 = CFSTR("query-string");
      _IDSLogV();
    }
    objc_msgSend_appendBytes_length_(v11, v42, (uint64_t)&v102, 4, v95, v98);
    if (objc_msgSend_length(v35, v44, v45))
    {
      OSLogHandleForIDSCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v49 = objc_msgSend_length(v35, v47, v48);
        *(_DWORD *)buf = 67109378;
        v104[0] = v49;
        LOWORD(v104[1]) = 2112;
        *(_QWORD *)((char *)&v104[1] + 2) = CFSTR("query-string");
        _os_log_impl(&dword_1A4C7F000, v46, OS_LOG_TYPE_DEFAULT, "Appending %d bytes for %@ segment", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v96 = (const __CFString *)objc_msgSend_length(v35, v50, v51);
        v99 = CFSTR("query-string");
        _IDSLogV();
      }
      objc_msgSend_appendData_(v11, v50, (uint64_t)v35, v96, v99);
    }
    else
    {
      OSLogHandleForIDSCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v104 = CFSTR("query-string");
        _os_log_impl(&dword_1A4C7F000, v52, OS_LOG_TYPE_DEFAULT, "Appending no bytes for %@ segment", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v96 = CFSTR("query-string");
        _IDSLogV();
      }
    }

    v53 = v10;
    v102 = -1431655766;
    v102 = bswap32(objc_msgSend_length(v53, v54, v55));
    OSLogHandleForIDSCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v59 = objc_msgSend_length(v53, v57, v58);
      *(_DWORD *)buf = 67109378;
      v104[0] = v59;
      LOWORD(v104[1]) = 2112;
      *(_QWORD *)((char *)&v104[1] + 2) = CFSTR("body");
      _os_log_impl(&dword_1A4C7F000, v56, OS_LOG_TYPE_DEFAULT, "Appending %d length header for %@ segment", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v96 = (const __CFString *)objc_msgSend_length(v53, v60, v61);
      v99 = CFSTR("body");
      _IDSLogV();
    }
    objc_msgSend_appendBytes_length_(v11, v60, (uint64_t)&v102, 4, v96, v99);
    if (objc_msgSend_length(v53, v62, v63))
    {
      OSLogHandleForIDSCategory();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v67 = objc_msgSend_length(v53, v65, v66);
        *(_DWORD *)buf = 67109378;
        v104[0] = v67;
        LOWORD(v104[1]) = 2112;
        *(_QWORD *)((char *)&v104[1] + 2) = CFSTR("body");
        _os_log_impl(&dword_1A4C7F000, v64, OS_LOG_TYPE_DEFAULT, "Appending %d bytes for %@ segment", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v94 = (const __CFString *)objc_msgSend_length(v53, v68, v69);
        v100 = CFSTR("body");
        _IDSLogV();
      }
      objc_msgSend_appendData_(v11, v68, (uint64_t)v53, v94, v100);
    }
    else
    {
      OSLogHandleForIDSCategory();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v104 = CFSTR("body");
        _os_log_impl(&dword_1A4C7F000, v70, OS_LOG_TYPE_DEFAULT, "Appending no bytes for %@ segment", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v94 = CFSTR("body");
        _IDSLogV();
      }
    }

    if (objc_msgSend_length(v53, v71, v72))
    {
      v73 = v9;
      v102 = bswap32(objc_msgSend_length(v73, v74, v75));
      OSLogHandleForIDSCategory();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v79 = objc_msgSend_length(v73, v77, v78);
        *(_DWORD *)buf = 67109378;
        v104[0] = v79;
        LOWORD(v104[1]) = 2112;
        *(_QWORD *)((char *)&v104[1] + 2) = CFSTR("push-token");
        _os_log_impl(&dword_1A4C7F000, v76, OS_LOG_TYPE_DEFAULT, "Appending %d length header for %@ segment", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v94 = (const __CFString *)objc_msgSend_length(v73, v80, v81);
        v100 = CFSTR("push-token");
        _IDSLogV();
      }
      objc_msgSend_appendBytes_length_(v11, v80, (uint64_t)&v102, 4, v94, v100);
      if (objc_msgSend_length(v73, v82, v83))
      {
        OSLogHandleForIDSCategory();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          v87 = objc_msgSend_length(v73, v85, v86);
          *(_DWORD *)buf = 67109378;
          v104[0] = v87;
          LOWORD(v104[1]) = 2112;
          *(_QWORD *)((char *)&v104[1] + 2) = CFSTR("push-token");
          _os_log_impl(&dword_1A4C7F000, v84, OS_LOG_TYPE_DEFAULT, "Appending %d bytes for %@ segment", buf, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v94 = (const __CFString *)objc_msgSend_length(v73, v88, v89);
          v101 = CFSTR("push-token");
          _IDSLogV();
        }
        objc_msgSend_appendData_(v11, v88, (uint64_t)v73, v94, v101);
      }
      else
      {
        OSLogHandleForIDSCategory();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v104 = CFSTR("push-token");
          _os_log_impl(&dword_1A4C7F000, v90, OS_LOG_TYPE_DEFAULT, "Appending no bytes for %@ segment", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v94 = CFSTR("push-token");
          _IDSLogV();
        }
      }

    }
  }
  if (objc_msgSend_length(v11, v14, v15, v94))
    v91 = v11;
  else
    v91 = 0;
  v92 = v91;

  return v92;
}

void _FTGenerateDigestForSigningFromPayload(uint64_t a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  const char *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  _BYTE buf[22];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (a4)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v14, v15, v16);
    v18 = v17;

    if (v10)
    {
      objc_msgSend_doubleValue(v10, v19, v20);
      v18 = v21 / 1000.0;
    }
    v22 = 1000 * (unint64_t)v18;
    *(_QWORD *)&buf[9] = 0xAAAAAAAAAAAAAAAALL;
    buf[0] = 1;
    *(_QWORD *)&buf[1] = (0xE800000000000000 * (unint64_t)v18) | HIBYTE(v22) | (256000 * (unint64_t)v18) & 0xFF00000000 | (0x3E8000000 * (unint64_t)v18) & 0xFF0000000000 | (0x3E80000000000 * (unint64_t)v18) & 0xFF000000000000 | (v22 >> 40) & 0xFF00 | (v22 >> 24) & 0xFF0000 | (v22 >> 8) & 0xFF000000;
    SecureRandomBytes();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v23, (uint64_t)buf, 17);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v24;
    if (v24)
      objc_msgSend_appendData_(v13, v11, (uint64_t)v24);
  }
  if (v9)
    objc_msgSend_appendData_(v13, v11, (uint64_t)v9);
  OSLogHandleForIDSCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend_length(v13, v26, v27);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v28;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v13;
    _os_log_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_DEFAULT, "Signature input is %d bytes (%@)", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_length(v13, v29, v30);
    _IDSLogV();
  }
  if (a1)
  {
    if (a1 == 2)
    {
      objc_msgSend_SHA256Data(v13, v29, v30);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a1 != 1)
        goto LABEL_25;
      objc_msgSend_SHA1Data(v13, v29, v30);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)v31;
    if (v31)
    {
      if (!a5)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0;
      _os_log_impl(&dword_1A4C7F000, v32, OS_LOG_TYPE_ERROR, "Unknown digest type provided as input to digest generation function -- returning empty digest { digestType: %ld }", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
LABEL_25:
  OSLogHandleForIDSCategory();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v37 = objc_msgSend_length(v13, v35, v36);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a1;
    _os_log_impl(&dword_1A4C7F000, v34, OS_LOG_TYPE_DEFAULT, "No digest generated { signatureInputDataLength: %lu, digestType: %ld }", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_length(v13, v38, v39);
    _IDSLogV();
  }
  v33 = 0;
  if (a5)
LABEL_31:
    *a5 = objc_retainAutorelease(v33);
LABEL_32:

}

BOOL _FTGenerateNonceAndSignatureFromComponents(__SecKey *a1, __SecKey *a2, void *a3, void *a4, void *a5, void *a6, void *a7, _QWORD *a8, void **a9)
{
  id v11;
  _BOOL8 v12;
  id v14;

  v14 = 0;
  _FTGenerateDigestForSigningFromComponents(1, a3, a4, a5, a6, a7, a8, &v14);
  v11 = v14;
  v12 = sub_1A4C8A6B0(a1, a2, v11, a9);

  return v12;
}

BOOL sub_1A4C8A6B0(__SecKey *a1, __SecKey *a2, void *a3, void **a4)
{
  const __CFData *v7;
  _BOOL8 v8;
  const __CFString *v9;
  const char *v10;
  uint64_t v11;
  const __CFData *v12;
  int v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  __CFError *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  __CFError *v26;
  const char *v27;
  uint64_t v28;
  CFErrorRef v30;
  __int16 v31;
  uint8_t buf[4];
  CFErrorRef v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = 0;
  if (a2 && a4)
  {
    v31 = 257;
    v9 = (const __CFString *)*MEMORY[0x1E0CD6E58];
    v30 = 0;
    v12 = SecKeyCreateSignature(a2, v9, v7, &v30);
    if (v12)
    {
      if (!a1)
      {
LABEL_9:
        objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99DF0], v10, (uint64_t)&v31, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendData_(v19, v20, (uint64_t)v12);
        *a4 = (id)objc_msgSend_copy(v19, v21, v22);

        objc_msgSend_security(MEMORY[0x1E0D36A40], v23, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = (__CFError *)*a4;
          *(_DWORD *)buf = 138412290;
          v33 = v26;
          _os_log_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_DEFAULT, "Succeeded signing: %@", buf, 0xCu);
        }

        v8 = objc_msgSend_length(*a4, v27, v28) != 0;
        goto LABEL_17;
      }
      v13 = SecKeyVerifySignature(a1, v9, v7, v12, &v30);
      objc_msgSend_security(MEMORY[0x1E0D36A40], v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v13)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (__CFError *)*a4;
          *(_DWORD *)buf = 138412290;
          v33 = v18;
          _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Succeeded verifying signature for: %@", buf, 0xCu);
        }

        goto LABEL_9;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1A4CBA288((uint64_t *)&v30, v17);
    }
    else
    {
      objc_msgSend_security(MEMORY[0x1E0D36A40], v10, v11);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Failed signing  with error: %@", buf, 0xCu);
      }
    }

    v8 = 0;
    *a4 = 0;
LABEL_17:

  }
  return v8;
}

BOOL _FTGenerateNonceAndSignatureFromPayload(__SecKey *a1, __SecKey *a2, void *a3, void *a4, _QWORD *a5, void **a6)
{
  id v9;
  _BOOL8 v10;
  id v12;

  v12 = 0;
  _FTGenerateDigestForSigningFromPayload(1, a3, a4, a5, &v12);
  v9 = v12;
  v10 = sub_1A4C8A6B0(a1, a2, v9, a6);

  return v10;
}

id sub_1A4C8A9A0(void *a1)
{
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = a1;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v22, v26, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = objc_msgSend__FZBestGuessFZIDType(v11, v6, v7, (_QWORD)v22);
        objc_msgSend__stripFZIDPrefix(v11, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__URIFromFZIDType_(v15, v16, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_length(v17, v18, v19))
          objc_msgSend_addObject_(v2, v20, (uint64_t)v17);

      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v22, v26, 16);
    }
    while (v8);
  }

  return v2;
}

id sub_1A4C8AAF4(void *a1)
{
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a1;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, v23, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v3);
        objc_msgSend__stripFZIDPrefix(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v10), v6, v7, (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__im_normalizedURIString(v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_length(v14, v15, v16))
          objc_msgSend_addObject_(v2, v17, (uint64_t)v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v19, v23, 16);
    }
    while (v8);
  }

  return v2;
}

id sub_1A4C8AC2C(void *a1)
{
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a1;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_base64EncodedStringWithOptions_(v9, v10, 0);
          v11 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v17 = (void *)v11;
          objc_msgSend_addObject_(v2, v12, v11, (_QWORD)v21);

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend__FTFilteredArrayForAPS(v9, v13, v14);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend__FTFilteredDictionaryForAPS(v9, v15, v16);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        objc_msgSend_addObject_(v2, v15, (uint64_t)v9, (_QWORD)v21);
LABEL_13:
        ++v8;
      }
      while (v6 != v8);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v18, (uint64_t)&v21, v25, 16);
      v6 = v19;
    }
    while (v19);
  }

  return v2;
}

id sub_1A4C8ADE0(void *a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_allKeys(a1, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        objc_msgSend_objectForKey_(a1, v8, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_base64EncodedStringWithOptions_(v13, v14, 0);
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v21 = (void *)v15;
          objc_msgSend_setObject_forKey_(v2, v16, v15, v12);

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend__FTFilteredDictionaryForAPS(v13, v17, v18);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend__FTFilteredArrayForAPS(v13, v19, v20);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        objc_msgSend_setObject_forKey_(v2, v19, (uint64_t)v13, v12);
LABEL_13:

        ++v11;
      }
      while (v9 != v11);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, v28, 16);
      v9 = v22;
    }
    while (v22);
  }

  return v2;
}

id sub_1A4C8AFBC(uint64_t a1)
{
  id v2;
  const char *v3;

  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  return (id)objc_msgSend_initWithBase64EncodedString_options_(v2, v3, a1, 0);
}

id sub_1A4C8AFF0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  size_t v10;
  _BYTE *v11;
  const char *v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  const char *v17;
  void *v18;
  char __str[3];

  v4 = objc_msgSend_length(a1, a2, a3);
  if (v4)
  {
    v7 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFFFELL;
    v9 = (char *)malloc_type_malloc(2 * (v4 & 0xFFFFFFFFFFFFFFFELL), 0xB090F96EuLL);
    v10 = v7 >> 1;
    v11 = malloc_type_malloc(v10, 0x720A47uLL);
    objc_msgSend_getCharacters_range_(a1, v12, (uint64_t)v9, 0, v8);
    __str[2] = 0;
    if (v8)
    {
      v13 = ((v8 - 1) >> 1) + 1;
      v14 = v9 + 2;
      v15 = v11;
      do
      {
        __str[0] = *(v14 - 2);
        v16 = *v14;
        v14 += 4;
        __str[1] = v16;
        *v15++ = strtol(__str, 0, 16);
        --v13;
      }
      while (v13);
    }
    free(v9);
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v17, (uint64_t)v11, v10, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_data(MEMORY[0x1E0C99D50], v5, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v18;
}

uint64_t sub_1A4C8B0F4(void *a1, const char *a2)
{
  return objc_msgSend_base64EncodedStringWithOptions_(a1, a2, 0);
}

id sub_1A4C8B0FC(void *a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;

  if ((unint64_t)objc_msgSend_length(a1, a2, a3) >> 14)
    return (id)objc_msgSend__FTCopyGzippedData(a1, v3, v4);
  else
    return a1;
}

id sub_1A4C8B138(void *a1, const char *a2, uint64_t a3)
{
  __int128 v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uLong total_out;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  z_stream strm;

  if (!objc_msgSend_length(a1, a2, a3))
    return a1;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  strm.msg = (char *)0xAAAAAAAAAAAAAAAALL;
  strm.state = (internal_state *)0xAAAAAAAAAAAAAAAALL;
  strm.reserved = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&strm.data_type = v3;
  *(_OWORD *)&strm.next_out = v3;
  *(_OWORD *)&strm.avail_in = v3;
  strm.total_out = 0;
  memset(&strm.zalloc, 0, 24);
  v4 = objc_retainAutorelease(a1);
  strm.next_in = (Bytef *)objc_msgSend_bytes(v4, v5, v6);
  strm.avail_in = objc_msgSend_length(v4, v7, v8);
  v9 = 0;
  if (!deflateInit2_(&strm, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    v10 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v14 = (void *)objc_msgSend_initWithLength_(v10, v11, 0x4000);
    do
    {
      total_out = strm.total_out;
      if (total_out >= objc_msgSend_length(v14, v12, v13))
        objc_msgSend_increaseLengthBy_(v14, v16, 0x4000);
      v9 = objc_retainAutorelease(v14);
      v19 = objc_msgSend_mutableBytes(v9, v17, v18);
      strm.next_out = (Bytef *)(v19 + strm.total_out);
      v22 = objc_msgSend_length(v9, v20, v21);
      strm.avail_out = v22 - LODWORD(strm.total_out);
      deflate(&strm, 4);
    }
    while (!strm.avail_out);
    objc_msgSend_setLength_(v9, v12, strm.total_out);
    deflateEnd(&strm);
  }
  return v9;
}

uint64_t sub_1A4C8B38C(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = a2;
    v12 = 2112;
    v13 = a3;
    _os_log_impl(&dword_1A4C7F000, v6, OS_LOG_TYPE_DEFAULT, "MG capabilities changed: %@  (%@)", (uint8_t *)&v10, 0x16u);
  }

  return objc_msgSend__updateCapabilities(*(void **)(a1 + 32), v7, v8);
}

void sub_1A4C8B458(uint64_t a1, char *a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 138412290;
    *(_QWORD *)&v9[4] = a3;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "DeviceCenterRegistrationCommCenterReadyCallback: %@", v9, 0xCu);
  }

  *(_QWORD *)v9 = 0xAAAAAAAAAAAAAAAALL;
  v6 = objc_initWeak((id *)v9, a2);
  if (a2)
    objc_msgSend__commCenterAlive(a2, v7, v8);

  objc_destroyWeak((id *)v9);
}

void sub_1A4C8B53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

void sub_1A4C8C928(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v8 = objc_msgSend_hwSupport(a2, v6, v7);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v12)
    {
      v15 = 138412290;
      v16 = v5;
      v13 = "Failed to get stewie hw support { error: %@ }";
LABEL_8:
      _os_log_impl(&dword_1A4C7F000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v12)
  {
    v14 = CFSTR("NO");
    if ((_DWORD)v8)
      v14 = CFSTR("YES");
    v15 = 138412290;
    v16 = v14;
    v13 = "Got stewie hw support { stewieHWSupport: %@ }";
    goto LABEL_8;
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = v8;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8);

}

void sub_1A4C8CC60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A4C8D13C(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  const char *v7;
  uint64_t result;
  const char *v9;
  uint64_t v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Received phone number registration ready state change callback { state: %@, context: %@ }", (uint8_t *)&v11, 0x16u);
  }

  result = objc_msgSend_isSelectedPhoneNumberRegistrationSubscriptionContext_(*(void **)(*(_QWORD *)(a1 + 40) + 160), v7, *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend__handlePotentialPhoneNumberRegistrationStateChanged(*(void **)(a1 + 40), v9, v10);
  return result;
}

uint64_t sub_1A4C8D2A0(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t result;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Received phone number changed delegate callback { context: %@ }", (uint8_t *)&v10, 0xCu);
  }

  result = objc_msgSend_isSelectedPhoneNumberRegistrationSubscriptionContext_(*(void **)(*(_QWORD *)(a1 + 40) + 160), v6, *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend__handlePotentialPhoneNumberRegistrationStateChanged(*(void **)(a1 + 40), v8, v9);
  return result;
}

uint64_t sub_1A4C8D3D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__handleCarrierSettingsChanged, a3);
}

uint64_t sub_1A4C8D444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__handleCarrierSettingsChanged, a3);
}

uint64_t sub_1A4C8D4F4(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t result;
  const char *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "SIM status changed { status: %@, context: %@ }", (uint8_t *)&v10, 0x16u);
  }

  result = objc_msgSend_isSelectedPhoneNumberRegistrationSubscriptionContext_(*(void **)(*(_QWORD *)(a1 + 48) + 160), v7, *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend__handleSIMStatusChangedToStatus_(*(void **)(a1 + 48), v9, *(_QWORD *)(a1 + 32));
  return result;
}

void sub_1A4C8D748(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  id v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v4, v3, (uint64_t)CFSTR("__kFaceTimeDeviceSIMRemovedNotification"), 0);

  }
}

uint64_t sub_1A4C8D884(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateCapabilities(*(void **)(a1 + 32), a2, a3);
}

void sub_1A4C8D948(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  byte_1EE788A40 = 0;
  objc_msgSend_registrationState(*(void **)(a1 + 32), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = qword_1EE788A38;
  if (v5)
    v7 = qword_1EE788A38 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((objc_msgSend_isEqualToDictionary_((void *)qword_1EE788A38, v3, (uint64_t)v5) & 1) != 0)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = (const __CFString *)qword_1EE788A38;
        v18 = 2112;
        v19 = v5;
        _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "No change to phone number registration state -- not posting notification { lastState: %@, state: %@ }", (uint8_t *)&v16, 0x16u);
      }
      goto LABEL_14;
    }
    v6 = qword_1EE788A38;
  }
  if ((void *)v6 != v5)
    objc_storeStrong((id *)&qword_1EE788A38, v5);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = CFSTR("__kFTCTRegistrationStatusChangedNotification");
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Phone number registration state changed -- posting notification { notification: %@, state: %@ } ", (uint8_t *)&v16, 0x16u);
  }

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v10, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(FTEntitlementSupport, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v8, v15, (uint64_t)CFSTR("__kFTCTRegistrationStatusChangedNotification"), v14, v5);

LABEL_14:
}

void *sub_1A4C8E360()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("_CTServerConnectionCreate", CFSTR("CoreTelephony"));
  off_1EE788AD0 = result;
  return result;
}

void *sub_1A4C8E38C()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("_CTServerConnectionIsPhoneNumberRegistrationSupported", CFSTR("CoreTelephony"));
  off_1EE788AE0 = result;
  return result;
}

void sub_1A4C8E73C()
{
  const void *v0;
  const void *v1;
  uint64_t v2;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    if (CFEqual(v0, CFSTR("AppleTV")))
    {
      v2 = 5;
    }
    else
    {
      if (!CFEqual(v1, CFSTR("AudioAccessory")))
      {
LABEL_8:
        CFRelease(v1);
        return;
      }
      v2 = 7;
    }
    qword_1ECF9D7E8 = v2;
    goto LABEL_8;
  }
}

void *sub_1A4C8EA34()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("PKCanMakePaymentsForIDS", CFSTR("PassKitCore"));
  off_1EE7889F8 = result;
  return result;
}

void *sub_1A4C8EB60()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("PKSupportsManateeForAppleCashForIDS", CFSTR("PassKitCore"));
  off_1EE788A18 = result;
  return result;
}

void *sub_1A4C8EC8C()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("PKSupportsRegionForAppleCashForIDS", CFSTR("PassKitCore"));
  off_1EE788A28 = result;
  return result;
}

void *sub_1A4C8ED28()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("sp_IDS_supportsIDSRegistrationPropertySupportsFMDV2", CFSTR("SPOwner"));
  off_1EE788A10 = result;
  return result;
}

void *sub_1A4C8EF78()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("PKShareableCredentialsSupportsHarmony", CFSTR("PassKitCore"));
  off_1ECF9D6F8 = result;
  return result;
}

void *sub_1A4C8F0A4()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("isEligibleForReceivingZelkova", CFSTR("SafetyMonitor"));
  off_1EE788A60 = result;
  return result;
}

uint64_t sub_1A4C8F3AC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  char v4;
  BOOL v5;
  int v6;

  result = objc_msgSend_cpuFamily(*(void **)(a1 + 32), a2, a3);
  v4 = 1;
  if ((int)result <= 506291072)
  {
    if ((int)result > -823913144)
    {
      if ((int)result <= -310978391)
      {
        v5 = (_DWORD)result == -823913143;
        v6 = -416119890;
      }
      else
      {
        v5 = (_DWORD)result == -310978390 || (_DWORD)result == 214503012;
        v6 = 280134364;
      }
    }
    else if ((int)result <= -1471079479)
    {
      v5 = (_DWORD)result == -1879695144;
      v6 = -1777893647;
    }
    else
    {
      v5 = (_DWORD)result == -1471079478 || (_DWORD)result == -1439483605;
      v6 = -1122301207;
    }
  }
  else if ((int)result <= 1418770315)
  {
    if ((int)result <= 747742333)
    {
      v5 = (_DWORD)result == 506291073;
      v6 = 526772277;
    }
    else
    {
      v5 = (_DWORD)result == 747742334 || (_DWORD)result == 933271106;
      v6 = 1404044789;
    }
  }
  else if ((int)result > 1801080017)
  {
    v5 = (_DWORD)result == 1801080018 || (_DWORD)result == 2009171118;
    v6 = 2028621756;
  }
  else
  {
    v5 = (_DWORD)result == 1418770316 || (_DWORD)result == 1463508716;
    v6 = 1479463068;
  }
  if (!v5 && (_DWORD)result != v6)
    v4 = 0;
  byte_1EE788AF8 = v4;
  return result;
}

uint64_t sub_1A4C8F588()
{
  size_t v1;

  v1 = 4;
  return sysctlbyname("hw.cpufamily", &dword_1EE788B08, &v1, 0, 0);
}

uint64_t sub_1A4C8F63C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend_memorySize(*(void **)(a1 + 32), a2, a3);
  byte_1EE788A58 = result < 1610612737;
  return result;
}

uint64_t sub_1A4C8F6AC()
{
  size_t v1;
  int v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v2 = 0x1800000006;
  v1 = 8;
  return sysctl(v2, 2u, &qword_1ECF9D6E8, &v1, 0, 0);
}

void sub_1A4C8F91C()
{
  const __CFString *v0;
  const __CFString *v1;
  BOOL v2;

  v0 = (const __CFString *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    if (CFStringHasSuffix(v0, CFSTR("DEV")))
      v2 = 1;
    else
      v2 = CFStringHasSuffix(v1, CFSTR("dev")) != 0;
    byte_1EE788B18 = v2;
    CFRelease(v1);
  }
}

void sub_1A4C8F994(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1A4C8F9A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A4C904CC(uint64_t a1, char *a2, uint64_t a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((byte_1EE788B20 & 1) == 0)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = a2;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Selected subscription externally changed -- clearing cached selected phone number registration subscription { observer: %@ }", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend_invalidateCache(a2, v5, v6);
  }
}

void sub_1A4C90C04()
{
  byte_1EE788B20 = 0;
}

uint64_t sub_1A4C927BC()
{
  uint64_t result;

  result = _CTServerConnectionCreate();
  qword_1EE788A50 = result;
  return result;
}

void sub_1A4C92844(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A4C92854(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A4C928AC()
{
  FTNetworkSupport *v0;
  void *v1;

  v0 = objc_alloc_init(FTNetworkSupport);
  v1 = (void *)qword_1ECF9D870;
  qword_1ECF9D870 = (uint64_t)v0;

}

uint64_t sub_1A4C9360C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__tryToEnableReliability, a3);
}

void sub_1A4C93E64(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend__reload(WeakRetained, v2, v3);
    WeakRetained = v4;
  }

}

void sub_1A4C93EF0()
{
  FTiMessageStatus *v0;
  const char *v1;
  uint64_t v2;
  uint64_t inited;
  void *v4;

  v0 = [FTiMessageStatus alloc];
  inited = objc_msgSend_initPrivate(v0, v1, v2);
  v4 = (void *)qword_1ECF9D810;
  qword_1ECF9D810 = inited;

}

void *sub_1A4C940C0()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("SCNetworkReachabilityCreateWithName", CFSTR("SystemConfiguration"));
  off_1EE788B28 = result;
  return result;
}

void *sub_1A4C9416C()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("SCNetworkReachabilityCreateWithAddress", CFSTR("SystemConfiguration"));
  off_1ECF9D740 = result;
  return result;
}

void sub_1A4C9429C(int a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((a1 & 0x40000) != 0)
      v5 = 87;
    else
      v5 = 45;
    v14[0] = 67111426;
    v14[1] = v5;
    if ((a1 & 2) != 0)
      v6 = 82;
    else
      v6 = 45;
    v15 = 1024;
    v16 = v6;
    if ((a1 & 1) != 0)
      v7 = 116;
    else
      v7 = 45;
    v17 = 1024;
    v18 = v7;
    if ((a1 & 4) != 0)
      v8 = 99;
    else
      v8 = 45;
    v19 = 1024;
    v20 = v8;
    if ((a1 & 8) != 0)
      v9 = 67;
    else
      v9 = 45;
    v21 = 1024;
    if ((a1 & 0x10) != 0)
      v10 = 105;
    else
      v10 = 45;
    v22 = v9;
    v23 = 1024;
    if ((a1 & 0x20) != 0)
      v11 = 68;
    else
      v11 = 45;
    v24 = v10;
    if ((a1 & 0x10000) != 0)
      v12 = 108;
    else
      v12 = 45;
    v25 = 1024;
    v26 = v11;
    if ((a1 & 0x20000) != 0)
      v13 = 100;
    else
      v13 = 45;
    v27 = 1024;
    v28 = v12;
    v29 = 1024;
    v30 = v13;
    v31 = 2080;
    v32 = a2;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Reachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n", (uint8_t *)v14, 0x42u);
  }

}

void *sub_1A4C94574()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("SCNetworkReachabilityGetFlags", CFSTR("SystemConfiguration"));
  off_1EE788B38 = result;
  return result;
}

void *sub_1A4C94680()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("SCNetworkReachabilityGetFlags", CFSTR("SystemConfiguration"));
  off_1ECF9D750 = result;
  return result;
}

void sub_1A4C95230()
{
  FTAuthKitManager *v0;
  void *v1;

  v0 = objc_alloc_init(FTAuthKitManager);
  v1 = (void *)qword_1ECF9D878;
  qword_1ECF9D878 = (uint64_t)v0;

}

void sub_1A4C95400(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v2, OS_LOG_TYPE_DEFAULT, "AuthKit - gathering headers", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
      MarcoLog();
    if (IMShouldLog())
      IMLogString();
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "AuthKit - gathering headers", buf, 2u);
  }

  objc_msgSend_appleIDHeadersForRequest_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend_count(v7, v11, v12);
    *(_DWORD *)buf = 134217984;
    v21 = v13;
    _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "AuthKit - received headers, count: %lu", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1A4C95654;
  v17[3] = &unk_1E4DD9628;
  v14 = *(NSObject **)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v18 = v7;
  v19 = v15;
  v16 = v7;
  dispatch_async(v14, v17);

}

uint64_t sub_1A4C95654(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1A4C95738(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  uint8_t buf[15];
  char v12;

  v12 = 0;
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v2, OS_LOG_TYPE_DEFAULT, "AuthKit - handling response", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
      MarcoLog();
    if (IMShouldLog())
      IMLogString();
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "AuthKit - handling response", buf, 2u);
  }

  objc_msgSend_handleResponse_forRequest_shouldRetry_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v12);
  im_primary_queue();
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A4C958FC;
  v8[3] = &unk_1E4DD9B18;
  v10 = v12;
  v9 = *(id *)(a1 + 56);
  dispatch_async(v7, v8);

}

uint64_t sub_1A4C958FC(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  const char *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1A4C7F000, v2, OS_LOG_TYPE_DEFAULT, "AuthKit - shouldRetry: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      if (*(_BYTE *)(a1 + 40))
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v11 = v6;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      if (*(_BYTE *)(a1 + 40))
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v11 = v7;
      IMLogString();
    }
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "AuthKit - shouldRetry: %@", buf, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

double sub_1A4C95CA0(double result, uint64_t a2, uint64_t a3)
{
  double v3;
  double v4;
  BOOL v5;
  double v6;

  if (result < 10.0)
  {
    v3 = (double)a3 / 10.0;
    v4 = v3 + 1.0;
    v5 = v3 <= 3.0;
    v6 = 4.0;
    if (v5)
      v6 = v4;
    result = __exp10(v6);
  }
  if (result > 43200.0)
    return 43200.0;
  return result;
}

long double sub_1A4C95CF0(uint64_t a1, uint64_t a2)
{
  return exp2((double)(a2 & ~(a2 >> 63))) * 60.0;
}

void sub_1A4C9757C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;

  v13 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  if (objc_msgSend_length(v5, v7, v8))
    objc_msgSend_appendString_(*(void **)(a1 + 32), v9, (uint64_t)CFSTR("&"));
  v10 = (void *)IMCopyURLEscapedString();
  v11 = (void *)IMCopyURLEscapedString();

  objc_msgSend_appendFormat_(*(void **)(a1 + 32), v12, (uint64_t)CFSTR("%@=%@"), v10, v11);
}

id sub_1A4C97618()
{
  if (qword_1ECF9D6B8 != -1)
    dispatch_once(&qword_1ECF9D6B8, &unk_1E4DD9330);
  return (id)off_1ECF9D6A8();
}

uint64_t sub_1A4C9765C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1A4C9766C(uint64_t a1)
{

}

void sub_1A4C97674(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  const char *v4;
  id WeakRetained;
  void *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v19;
  uint64_t v20;
  double v21;
  int v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void (**v41)(_QWORD);
  const char *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    OSLogHandleForIDSCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v24, *(_QWORD *)(a1 + 72));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringValue(v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v28;
      _os_log_impl(&dword_1A4C7F000, v23, OS_LOG_TYPE_DEFAULT, "Message with ID %@ not found in queue.  Abandoning anisette header collection.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v29, *(_QWORD *)(a1 + 72));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringValue(v30, v31, v32);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    goto LABEL_17;
  }
  objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 152), v4, (uint64_t)CFSTR("anisette-headers-disabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLValue(v6, v7, v8);

  v12 = objc_msgSend_isIDSMessage(WeakRetained, v10, v11) ^ 1 | v9;
  objc_msgSend_anisetteHeadersTimeout(WeakRetained, v13, v14);
  if (v17 > 0.0 && v12 != 0)
  {
    OSLogHandleForIDSCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v36;
      _os_log_impl(&dword_1A4C7F000, v33, OS_LOG_TYPE_DEFAULT, "anisette headers are required for messageType %@ but disabled by the server bag anisette-headers-disabled", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
LABEL_17:
    v3[2](v3);
    goto LABEL_25;
  }
  objc_msgSend_anisetteHeadersTimeout(WeakRetained, v15, v16);
  if (v21 < 0.0)
    v22 = 1;
  else
    v22 = v12;
  if (v22 == 1)
  {
    v3[2](v3);
  }
  else
  {
    objc_msgSend_sharedInstance(FTAuthKitManager, v19, v20);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *(_QWORD *)(a1 + 48);
    im_primary_queue();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1A4C97A14;
    v45[3] = &unk_1E4DD9BC0;
    v47 = *(_QWORD *)(a1 + 56);
    v41 = v3;
    v45[4] = *(_QWORD *)(a1 + 32);
    v46 = v41;
    objc_msgSend_anisetteHeadersForRequest_completionBlockQueue_completionBlock_(v38, v42, v39, v40, v45);

  }
LABEL_25:

}

void sub_1A4C97A14(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];

  v3 = a2;
  im_primary_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  (*(void (**)(void))(a1[5] + 16))();
  im_primary_queue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4C97AD4;
  block[3] = &unk_1E4DD96C0;
  block[4] = a1[4];
  dispatch_async(v8, block);

}

uint64_t sub_1A4C97AD4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  const char *v5;
  uint64_t v6;

  result = objc_msgSend_busy(*(void **)(a1 + 32), a2, a3);
  if ((result & 1) == 0)
    return objc_msgSend__dequeueIfNeeded(*(void **)(a1 + 32), v5, v6);
  return result;
}

void sub_1A4C97B0C(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  __int128 v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  char v15;

  im_primary_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = sub_1A4C97BF0;
  block[3] = &unk_1E4DD9C38;
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  block[1] = 3221225472;
  v15 = a2;
  v10 = v6;
  v8 = *(_OWORD *)(a1 + 64);
  v7 = (id)v8;
  v13 = v8;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  dispatch_async(v4, block);

}

void sub_1A4C97BF0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  const char *v37;
  char isBAAProtocolHeader;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  int v51;
  const char *v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  id v61;
  void (**v62)(_QWORD, _QWORD);
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  int v70;
  void *v71;
  void *context;
  void *v73;
  int v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  NSObject *v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  objc_msgSend__queue(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_messageForUniqueID_(v4, v5, *(_QWORD *)(a1 + 80));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v73)
  {
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v9, *(_QWORD *)(a1 + 80));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringValue(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v13;
      _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "Message with ID %@ not found in queue.  Abandoning anisette header collection.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, *(_QWORD *)(a1 + 80));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringValue(v14, v15, v16);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
  }
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend_URL(*(void **)(a1 + 40), v6, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v20;
      _os_log_impl(&dword_1A4C7F000, v23, OS_LOG_TYPE_DEFAULT, "************* Couldn't gather Anisette headers for %@ *************", buf, 0xCu);
    }

    OSLogHandleForIDSCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v20;
      _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, "************* Couldn't gather Anisette headers %@ *************", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v71 = v20;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v71 = v20;
        IMLogString();
      }
    }

  }
  else
  {
    v25 = os_variant_allows_internal_security_policies();
    v74 = v25;
    context = (void *)MEMORY[0x1A85A61F4](v25);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend_allKeys(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v79, v87, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v80 != v33)
            objc_enumerationMutation(v28);
          v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          objc_msgSend_baaSigner(*(void **)(a1 + 32), v30, v31, v71);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          isBAAProtocolHeader = objc_msgSend_isBAAProtocolHeader_(v36, v37, (uint64_t)v35);

          if ((isBAAProtocolHeader & 1) != 0)
          {
            objc_msgSend_registration(MEMORY[0x1E0D36AA8], v39, v40);
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v35;
              _os_log_impl(&dword_1A4C7F000, v41, OS_LOG_TYPE_DEFAULT, "ignoring %@", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v39, (uint64_t)v35);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              v44 = *(void **)(a1 + 40);
              objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v43, (uint64_t)v35);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setValue_forHTTPHeaderField_(v44, v46, (uint64_t)v45, v35);

            }
            objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v43, (uint64_t)v35);
            v41 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_lowercaseString(v35, v47, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend_containsObject_(&unk_1E4DE65D8, v50, (uint64_t)v49);

            if (((v51 ^ 1 | v74) & 1) == 0)
            {

              v41 = CFSTR("<redacted>");
            }
            objc_msgSend_registration(MEMORY[0x1E0D36AA8], v52, v53);
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412547;
              v84 = v35;
              v85 = 2113;
              v86 = v41;
              _os_log_impl(&dword_1A4C7F000, v54, OS_LOG_TYPE_DEFAULT, "       %@: %{private}@", buf, 0x16u);
            }

          }
        }
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v79, v87, 16);
      }
      while (v32);
    }

    objc_autoreleasePoolPop(context);
    if (objc_msgSend_wantsUDID(v73, v55, v56))
      objc_msgSend_ak_addDeviceUDIDHeader(*(void **)(a1 + 40), v57, v58);
    if (objc_msgSend_wantsClientInfo(v73, v57, v58, v71))
      objc_msgSend_ak_addClientInfoHeader(*(void **)(a1 + 40), v59, v60);
  }
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = sub_1A4C98280;
  v75[3] = &unk_1E4DD9C10;
  v76 = *(id *)(a1 + 40);
  v61 = v73;
  v77 = v61;
  v78 = *(id *)(a1 + 64);
  v62 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A6380](v75);
  if ((objc_msgSend_wantsSignature(v61, v63, v64) & 1) != 0
    || objc_msgSend_wantsBAASigning(v61, v65, v66))
  {
    if (objc_msgSend_wantsBodySignature(v61, v65, v66, v71))
    {
      v69 = *(void **)(a1 + 32);
    }
    else
    {
      v70 = objc_msgSend_wantsBAASigning(v61, v67, v68);
      v69 = *(void **)(a1 + 32);
      if (!v70)
      {
        objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(v69, v67, (uint64_t)v61, 0, 0, *(_QWORD *)(a1 + 56), v62);
        goto LABEL_47;
      }
    }
    objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(v69, v67, (uint64_t)v61, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v62);
  }
  else
  {
    v62[2](v62, 0);
  }
LABEL_47:

}

void sub_1A4C98280(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  im_primary_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A4C98350;
  v6[3] = &unk_1E4DD9AF0;
  v7 = v3;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t sub_1A4C98350(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  int isInternalInstall;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend_allKeys(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v51, v60, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend_objectForKey_(*(void **)(a1 + 32), v6, v10, v45, v46);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v13 = *(void **)(a1 + 40);
          objc_msgSend_objectForKey_(*(void **)(a1 + 32), v12, v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forHTTPHeaderField_(v13, v15, (uint64_t)v14, v10);

        }
        OSLogHandleForIDSCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_objectForKey_(*(void **)(a1 + 32), v17, v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v57 = v10;
          v58 = 2112;
          v59 = v18;
          _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            objc_msgSend_objectForKey_(*(void **)(a1 + 32), v19, v10);
            v45 = v10;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            MarcoLog();

          }
          if (IMShouldLog())
          {
            objc_msgSend_objectForKey_(*(void **)(a1 + 32), v6, v10);
            v45 = v10;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            IMLogString();

          }
        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v51, v60, 16);
    }
    while (v7);
  }

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalInstall = objc_msgSend_isInternalInstall(v22, v23, v24);

  if (isInternalInstall)
  {
    objc_msgSend_additionalInternalHeaders(*(void **)(a1 + 48), v26, v27);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v47, v55, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v48 != v32)
            objc_enumerationMutation(v28);
          v34 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend_objectForKey_(v28, v30, v34, v45, v46);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            v37 = *(void **)(a1 + 40);
            objc_msgSend_objectForKey_(v28, v36, v34);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setValue_forHTTPHeaderField_(v37, v39, (uint64_t)v38, v34);

          }
          OSLogHandleForIDSCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v28, v41, v34);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v57 = v34;
            v58 = 2112;
            v59 = v42;
            _os_log_impl(&dword_1A4C7F000, v40, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);

          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              objc_msgSend_objectForKey_(v28, v43, v34);
              v45 = v34;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              MarcoLog();

            }
            if (IMShouldLog())
            {
              objc_msgSend_objectForKey_(v28, v30, v34);
              v45 = v34;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
          }
        }
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v47, v55, 16);
      }
      while (v31);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void sub_1A4C98844(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  im_primary_queue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4C988B4;
  block[3] = &unk_1E4DD9C88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void sub_1A4C988B4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

uint64_t sub_1A4C988C8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1A4C98A58(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int buf, int a14, int a15, __int16 a16)
{
  id v16;
  NSObject *v17;

  if (a2 == 1)
  {
    v16 = objc_begin_catch(a1);
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      buf = 138412546;
      a16 = 2112;
      _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_ERROR, "Exception processing result: %@   for message: %@", (uint8_t *)&buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }

    objc_end_catch();
    JUMPOUT(0x1A4C98A40);
  }
  _Unwind_Resume(a1);
}

void sub_1A4C98DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A4C99230(_Unwind_Exception *exc_buf, int a2)
{
  void *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1A4C98FD4);
  }
  objc_sync_exit(v2);
  _Unwind_Resume(exc_buf);
}

void sub_1A4C99280(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  __CFString *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  __CFString *v20;
  const char *v21;
  uint64_t v22;
  int CanBeLogged;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  const __CFString *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  int v40;
  const __CFString *v41;
  int v42;
  const __CFString *v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  const __CFString *v47;
  __CFString *v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  int v54;
  const __CFString *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  __CFString *v59;
  id v60;
  const char *v61;
  const char *v62;
  id v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  int v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  int isIDSMessage;
  const char *v113;
  const char *v114;
  uint64_t v115;
  NSObject *v116;
  const char *v117;
  uint64_t v118;
  NSObject *v119;
  const __CFString *v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  void *v125;
  const __CFString *v126;
  __CFString *v127;
  void *v128;
  __CFString *v129;
  void *v130;
  _QWORD v131[5];
  __CFString *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(uint64_t, const char *, uint64_t);
  void *v138;
  id v139;
  uint64_t v140;
  uint8_t buf[4];
  const __CFString *v142;
  __int16 v143;
  __CFString *v144;
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v129 = a2;
  objc_msgSend__queue(*(void **)(a1 + 32), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_messageForUniqueID_(v5, v6, *(_QWORD *)(a1 + 56));
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v130)
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v8, *(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringValue(v9, v10, v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v142 = v12;
      _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Message with ID %@ not found in queue.  Abandoning URL request.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v13, *(_QWORD *)(a1 + 56));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringValue(v14, v15, v16);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
  }
  OSLogHandleForIDSCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v142 = v129;
    v143 = 2112;
    v144 = v129;
    _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Created URL Request: %@  from URL: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v125 = v129;
    v127 = v129;
    _IDSLogV();
  }
  if (v129)
  {
    OSLogHandleForIDSCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(const __CFString **)(a1 + 56);
      v20 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v142 = v19;
      v143 = 2112;
      v144 = v20;
      _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_DEFAULT, "Delivering message %lu to URL: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v125 = *(void **)(a1 + 56);
        v127 = *(__CFString **)(a1 + 40);
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v125 = *(void **)(a1 + 56);
        v127 = *(__CFString **)(a1 + 40);
        IMLogString();
      }
    }
    CanBeLogged = objc_msgSend_payloadCanBeLogged(v130, v21, v22, v125, v127);
    v26 = MEMORY[0x1E0C809B0];
    if (CanBeLogged)
    {
      v27 = *(_QWORD *)(a1 + 56);
      objc_msgSend_description(*(void **)(a1 + 48), v24, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      IDSLoggableDescriptionForObjectOnService();
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v135 = v26;
      v136 = 3221225472;
      v137 = sub_1A4C99C90;
      v138 = &unk_1E4DD9CD8;
      v139 = v29;
      v140 = v27;
      v30 = v29;
      cut_dispatch_log_queue();

    }
    OSLogHandleForIDSCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend_forceCellular(v130, v32, v33);
      v35 = CFSTR("NO");
      if (v34)
        v35 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v142 = v35;
      _os_log_impl(&dword_1A4C7F000, v31, OS_LOG_TYPE_DEFAULT, "Force cellular: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v40 = objc_msgSend_forceCellular(v130, v38, v39);
        v41 = CFSTR("NO");
        if (v40)
          v41 = CFSTR("YES");
        v126 = v41;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v42 = objc_msgSend_forceCellular(v130, v36, v37);
        v43 = CFSTR("NO");
        if (v42)
          v43 = CFSTR("YES");
        v126 = v43;
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 32), v36, v37, v126))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v44, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = *(const __CFString **)(a1 + 56);
        v48 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v142 = v47;
        v143 = 2112;
        v144 = v48;
        _os_log_impl(&dword_1A4C7F000, v46, OS_LOG_TYPE_DEFAULT, "Delivering message %lu to URL: %@", buf, 0x16u);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v49, v50);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v54 = objc_msgSend_forceCellular(v130, v52, v53);
        v55 = CFSTR("NO");
        if (v54)
          v55 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v142 = v55;
        _os_log_impl(&dword_1A4C7F000, v51, OS_LOG_TYPE_DEFAULT, "Force cellular: %@", buf, 0xCu);
      }

    }
    v131[0] = v26;
    v131[1] = 3221225472;
    v131[2] = sub_1A4C99D48;
    v131[3] = &unk_1E4DD9D28;
    v57 = *(_QWORD *)(a1 + 32);
    v56 = (_QWORD *)(a1 + 32);
    v58 = v56[3];
    v131[4] = v57;
    v134 = v58;
    v59 = v129;
    v132 = v59;
    v60 = v130;
    v133 = v60;
    v128 = (void *)MEMORY[0x1A85A6380](v131);
    objc_msgSend_setRequest_(*(void **)(*v56 + 96), v61, (uint64_t)v59);
    objc_msgSend_setBlock_(*(void **)(*v56 + 96), v62, (uint64_t)v128);
    v63 = *(id *)(*v56 + 152);
    objc_msgSend_objectForKey_(v63, v64, (uint64_t)CFSTR("do-http-pipelining"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_BOOLValue(v65, v66, v67);

    objc_msgSend_objectForKey_(v63, v69, (uint64_t)CFSTR("max-concurrent-connections"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_intValue(v70, v71, v72);

    objc_msgSend_objectForKey_(v63, v74, (uint64_t)CFSTR("do-http-keep-alive"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_BOOLValue(v75, v76, v77);

    objc_msgSend_objectForKey_(v63, v79, (uint64_t)CFSTR("http-keep-alive-idle-timeout-wifi-millis"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend_intValue(v80, v81, v82);

    objc_msgSend_objectForKey_(v63, v84, (uint64_t)CFSTR("http-keep-alive-idle-timeout-cell-millis"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend_intValue(v85, v86, v87);

    objc_msgSend_setShouldUsePipelining_(*(void **)(*v56 + 96), v89, v68);
    objc_msgSend_setConcurrentConnections_(*(void **)(*v56 + 96), v90, v73);
    objc_msgSend_setDisableKeepAlive_(*(void **)(*v56 + 96), v91, v78 ^ 1u);
    objc_msgSend_setKeepAliveWifi_(*(void **)(*v56 + 96), v92, v83);
    objc_msgSend_setKeepAliveCell_(*(void **)(*v56 + 96), v93, v88);
    v94 = *(void **)(*v56 + 96);
    objc_msgSend_dataUsageBundleIdentifier(v60, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBundleIdentifierForDataUsage_(v94, v98, (uint64_t)v97);

    v99 = *(void **)(*v56 + 96);
    v102 = objc_msgSend_forceCellular(v60, v100, v101);
    objc_msgSend_setForceCellularIfPossible_(v99, v103, v102);
    v104 = *(void **)(*v56 + 96);
    v107 = objc_msgSend_wantsIDSServer(v60, v105, v106);
    objc_msgSend_setRequireIDSHost_(v104, v108, v107);
    v109 = *(void **)(*v56 + 96);
    isIDSMessage = objc_msgSend_isIDSMessage(v60, v110, v111);
    objc_msgSend_setShouldReturnTimingData_(v109, v113, isIDSMessage ^ 1u);
    objc_msgSend_load(*(void **)(*v56 + 96), v114, v115);

  }
  else
  {
    OSLogHandleForIDSCategory();
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v116, OS_LOG_TYPE_DEFAULT, "Failing message, empty url request", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v117, v118, v125, v127);
    v119 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      v120 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v142 = v120;
      _os_log_impl(&dword_1A4C7F000, v119, OS_LOG_TYPE_DEFAULT, "Failing message, empty url request for URL: %@", buf, 0xCu);
    }

    v121 = *(void **)(a1 + 32);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v122, *MEMORY[0x1E0CB32E8], -1000, 0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyDelegateAboutError_(v121, v124, (uint64_t)v123);

  }
}

void sub_1A4C99C90(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_messageDelivery_oversized(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "%lu Message body: %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1A4C99D48(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  id v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  id v83;
  id v84;
  uint64_t v85;
  id v86;
  id v87;
  id v88;
  void (**v89)(_QWORD, _QWORD);
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  double v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  _QWORD v105[4];
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  id v110;
  id v111;
  id v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(uint64_t, const char *, uint64_t);
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void (*v123)(uint64_t, const char *, uint64_t);
  void *v124;
  id v125;
  uint64_t v126;
  uint8_t buf[4];
  _BYTE v128[18];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v103 = a4;
  v102 = a5;
  v101 = a6;
  if (a3 == 503)
  {
    objc_msgSend_warning(MEMORY[0x1E0D36AA8], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1A4CBABB8(v13);

    objc_msgSend_forceBagLoad(*(void **)(*(_QWORD *)(a1 + 32) + 152), v14, v15);
    objc_msgSend_forceBagLoad(*(void **)(*(_QWORD *)(a1 + 32) + 160), v16, v17);
  }
  objc_msgSend_allHeaderFields(v10, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("x-bag-refresh"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_intValue(v20, v21, v22);

  if ((objc_opt_respondsToSelector() & (v23 > 0)) == 1)
  {
    objc_msgSend_warning(MEMORY[0x1E0D36AA8], v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1A4CBAB48(v23, v26);

    objc_msgSend_timeIntervalSinceNow((void *)qword_1EE788B48, v27, v28);
    v32 = (void *)qword_1EE788B48;
    if (fabs(v31) > (double)v23)
    {
      v33 = 0;
LABEL_15:
      qword_1EE788B48 = (uint64_t)v33;

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v128 = v23;
        *(_WORD *)&v128[4] = 2112;
        *(_QWORD *)&v128[6] = qword_1EE788B48;
        _os_log_impl(&dword_1A4C7F000, v37, OS_LOG_TYPE_DEFAULT, "  * Sending refresh, we're outside our interval: %d  (Last date: %@)", buf, 0x12u);
      }

      objc_msgSend_forceBagLoad(*(void **)(*(_QWORD *)(a1 + 32) + 152), v38, v39);
      objc_msgSend_forceBagLoad(*(void **)(*(_QWORD *)(a1 + 32) + 160), v40, v41);
      goto LABEL_18;
    }
    if (!qword_1EE788B48)
    {
      v33 = objc_alloc_init(MEMORY[0x1E0C99D68]);
      v32 = (void *)qword_1EE788B48;
      goto LABEL_15;
    }
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v29, v30);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v128 = v23;
      *(_WORD *)&v128[4] = 2112;
      *(_QWORD *)&v128[6] = qword_1EE788B48;
      _os_log_impl(&dword_1A4C7F000, v34, OS_LOG_TYPE_DEFAULT, "  * Not refreshing, we're still inside our interval: %d (Laste date: %@)", buf, 0x12u);
    }

  }
LABEL_18:
  OSLogHandleForIDSCategory();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = *(_QWORD *)(a1 + 56);
    v44 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v128 = v43;
    *(_WORD *)&v128[8] = 2048;
    *(_QWORD *)&v128[10] = v44;
    _os_log_impl(&dword_1A4C7F000, v42, OS_LOG_TYPE_DEFAULT, "%lu Finished URL request: %p", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v99 = *(_QWORD *)(a1 + 56);
      v100 = *(_QWORD *)(a1 + 40);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v99 = *(_QWORD *)(a1 + 56);
      v100 = *(_QWORD *)(a1 + 40);
      IMLogString();
    }
  }
  v47 = *(_QWORD *)(a1 + 56);
  objc_msgSend_description(*(void **)(a1 + 40), v45, v46, v99, v100);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = MEMORY[0x1E0C809B0];
  v122 = 3221225472;
  v123 = sub_1A4C9A59C;
  v124 = &unk_1E4DD9CD8;
  v126 = v47;
  v49 = v48;
  v125 = v49;
  cut_dispatch_log_queue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_allHeaderFields(v10, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v52, v53, (uint64_t)CFSTR("X-Apple-Splunk-Hint"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSplunkHint_(*(void **)(a1 + 48), v55, (uint64_t)v54);
    if (IMShouldLog())
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v56, v57);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v128 = v10;
        _os_log_impl(&dword_1A4C7F000, v58, OS_LOG_TYPE_DEFAULT, "Response: %p", buf, 0xCu);
      }

      objc_msgSend_description(v52, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = MEMORY[0x1E0C809B0];
      v116 = 3221225472;
      v117 = sub_1A4C9A654;
      v118 = &unk_1E4DD9CD8;
      v119 = v61;
      v120 = v47;
      v62 = v61;
      cut_dispatch_log_queue();

    }
  }
  else
  {
    v54 = 0;
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v50, v51);
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v128 = v10;
    _os_log_impl(&dword_1A4C7F000, v63, OS_LOG_TYPE_DEFAULT, "           Response: %@", buf, 0xCu);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v64, v65);
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v128 = a3;
    _os_log_impl(&dword_1A4C7F000, v66, OS_LOG_TYPE_DEFAULT, "       Replied Code: %d", buf, 8u);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v67, v68);
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    v72 = objc_msgSend_length(v103, v70, v71);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v128 = v72;
    _os_log_impl(&dword_1A4C7F000, v69, OS_LOG_TYPE_DEFAULT, " Result Data Length: %d", buf, 8u);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v73, v74);
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v128 = v102;
    _os_log_impl(&dword_1A4C7F000, v75, OS_LOG_TYPE_DEFAULT, "              Error: %@", buf, 0xCu);
  }

  objc_msgSend__clearRetryTimer(*(void **)(a1 + 32), v76, v77);
  v78 = *(void **)(a1 + 48);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseReceived_(v78, v82, (uint64_t)v81);

  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = sub_1A4C9A70C;
  v105[3] = &unk_1E4DD9D00;
  v114 = a3;
  v106 = *(id *)(a1 + 48);
  v83 = v10;
  v107 = v83;
  v84 = v102;
  v85 = *(_QWORD *)(a1 + 32);
  v108 = v84;
  v109 = v85;
  v110 = *(id *)(a1 + 40);
  v86 = v103;
  v111 = v86;
  v87 = v101;
  v112 = v87;
  v88 = v54;
  v113 = v88;
  v89 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A6380](v105);
  if (objc_msgSend_isIDSMessage(*(void **)(a1 + 48), v90, v91)
    && (objc_msgSend_anisetteHeadersTimeout(*(void **)(a1 + 48), v92, v93), v96 > -1.0))
  {
    objc_msgSend_sharedInstance(FTAuthKitManager, v94, v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleResponse_forRequest_completionBlock_(v97, v98, (uint64_t)v83, *(_QWORD *)(a1 + 40), v89);

  }
  else
  {
    v89[2](v89, 0);
  }

}

void sub_1A4C9A59C(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_messageDelivery_oversized(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "%lu Information about finished URL request: %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1A4C9A654(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_messageDelivery_oversized(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "%lu Information about response headers: %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1A4C9A70C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t *v4;
  int isIDSMessage;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  void **v14;
  int v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  id v31;
  const char *v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
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
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  NSObject *v93;
  const char *v94;
  uint64_t v95;
  NSObject *v96;
  const char *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  void *v103;
  const char *v104;
  int isEqualToString;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  NSObject *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  BOOL v123;
  void *v124;
  const char *v125;
  void *v126;
  const char *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  BOOL v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  id v151;
  void *v152;
  NSObject *v153;
  const char *v154;
  void *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  int v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  int v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  NSObject *v168;
  const char *v169;
  uint64_t v170;
  int v171;
  const char *v172;
  int v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  double v178;
  double v179;
  const char *v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  NSObject *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  int shouldRetryError;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  const char *v195;
  int v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  id v203;
  const char *v204;
  NSObject *v205;
  const char *v206;
  uint64_t v207;
  NSObject *v208;
  const char *v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  NSObject *v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  NSObject *v217;
  const char *v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  NSObject *v222;
  const char *v223;
  NSObject *v224;
  uint32_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  const char *v234;
  const char *v235;
  const char *v236;
  const char *v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  NSObject *v241;
  NSObject *v242;
  const char *v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  int CanBeLogged;
  const char *v248;
  uint64_t v249;
  __CFString *v250;
  const char *v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  void *v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  const char *v264;
  uint64_t v265;
  int v266;
  const char *v267;
  uint64_t v268;
  int v269;
  const char *v270;
  uint64_t v271;
  NSObject *v272;
  NSObject *v273;
  const char *v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  uint64_t v280;
  void *v281;
  NSObject *v282;
  const char *v283;
  uint64_t v284;
  id v285;
  const char *v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  NSObject *v290;
  const char *v291;
  NSObject *v292;
  const char *v293;
  uint64_t v294;
  int v295;
  const char *v296;
  uint64_t v297;
  NSObject *v298;
  void *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  __CFString *v303;
  void *v304;
  uint64_t v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  _BOOL4 v310;
  int context;
  void *contexta;
  void *v313;
  void *v314;
  id v315;
  uint8_t buf[4];
  _BYTE v317[14];
  __int16 v318;
  int v319;
  __int16 v320;
  id v321;
  __int16 v322;
  void *v323;
  uint64_t v324;

  context = (int)a2;
  v324 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t *)(a1 + 96);
  v310 = (unint64_t)(*(_QWORD *)(a1 + 96) - 400) < 0xC8;
  isIDSMessage = objc_msgSend_isIDSMessage(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_allHeaderFields((void *)*(v4 - 7), v6, v7);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl()
    && (v8 = (void *)MEMORY[0x1A85A5DE0](CFSTR("IDSBAASigner"), CFSTR("IDS"))) != 0
    && objc_msgSend_isBAAHTTPResponseCode_(v8, v9, *v4))
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, *v4);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v317 = v313;
      _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Noticed BAA failure in response %@", buf, 0xCu);
    }

    v310 = 0;
    context = 0;
  }
  else
  {
    v313 = 0;
  }
  v14 = (void **)(a1 + 48);
  v15 = v310;
  if (*(_QWORD *)(a1 + 48))
    v15 = 1;
  if (((context | v15) & isIDSMessage) == 1)
  {
    OSLogHandleForIDSCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *v14;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v317 = v17;
      _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Connection failed with error: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v299 = *v14;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v299 = *v14;
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v18, v19, v299))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *v14;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v317 = v23;
        _os_log_impl(&dword_1A4C7F000, v22, OS_LOG_TYPE_DEFAULT, "Connection failed with error: %@", buf, 0xCu);
      }

    }
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v20, v21))
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1A4CBAD00((int *)v4, (void **)(a1 + 48), v26);

    }
    OSLogHandleForIDSCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_DWORD *)v4;
      objc_msgSend_domain(*v14, v28, v29);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend_code(*v14, v32, v33);
      objc_msgSend_localizedDescription(*v14, v35, v36);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(*v14, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v40, v41, *MEMORY[0x1E0CB3300]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v317 = v30;
      *(_WORD *)&v317[4] = 2112;
      *(_QWORD *)&v317[6] = v31;
      v318 = 1024;
      v319 = v34;
      v320 = 2112;
      v321 = v37;
      v322 = 2112;
      v323 = v42;
      _os_log_impl(&dword_1A4C7F000, v27, OS_LOG_TYPE_ERROR, "FTMessageDelivery failed! (HTTP Status Code: %d) Error (%@:%d): %@ %@", buf, 0x2Cu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v45 = *(unsigned int *)v4;
      objc_msgSend_domain(*v14, v43, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_code(*v14, v47, v48);
      objc_msgSend_localizedDescription(*v14, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(*v14, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *MEMORY[0x1E0CB3300];
      objc_msgSend_objectForKey_(v55, v57, *MEMORY[0x1E0CB3300]);
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      v301 = v45;
      _IDSWarnV();

      v58 = *(unsigned int *)v4;
      objc_msgSend_domain(*v14, v59, v60, v301, v46, v49, v52, v308);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend_code(*v14, v62, v63);
      objc_msgSend_localizedDescription(*v14, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(*v14, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v70, v71, v56);
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      v302 = v58;
      _IDSLogV();

      v72 = *(unsigned int *)v4;
      objc_msgSend_domain(*v14, v73, v74, v302, v61, v64, v67, v309);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend_code(*v14, v76, v77);
      objc_msgSend_localizedDescription(*v14, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(*v14, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v84, v85, v56);
      v306 = v81;
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      v304 = v75;
      v305 = v78;
      v300 = v72;
      _IDSLogTransport();

    }
    v86 = *v4;
    if ((unint64_t)(*v4 - 500) <= 0x63)
    {
      objc_msgSend_URL(*(void **)(a1 + 64), v43, v44);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v91, v92);
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        sub_1A4CBAC88();

      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v94, v95);
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        sub_1A4CBABF4();

      objc_msgSend_metricWithDomain_type_error_bagURL_(MEMORY[0x1E0D34E68], v97, 2, 0, v86, v90);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logger(MEMORY[0x1E0D34E60], v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logMetric_(v101, v102, (uint64_t)v98);

    }
    objc_msgSend_domain(*v14, v43, v44, v300, v304, v305, v306, v307);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v103, v104, *MEMORY[0x1E0D367A0]);

    v108 = *v14;
    if (isEqualToString)
    {
      if (objc_msgSend_code(v108, v106, v107) == -1)
      {
        if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v109, v110))
        {
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v109, v110);
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v112 = "... this was a remote loader crash";
LABEL_196:
            _os_log_impl(&dword_1A4C7F000, v111, OS_LOG_TYPE_DEFAULT, v112, buf, 2u);
            goto LABEL_197;
          }
          goto LABEL_197;
        }
        goto LABEL_207;
      }
LABEL_206:
      if (((v310 | context) & 1) == 0)
        goto LABEL_211;
      goto LABEL_207;
    }
    objc_msgSend_domain(v108, v106, v107);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = objc_msgSend_isEqualToString_(v161, v162, *MEMORY[0x1E0D34B88]);

    v166 = *v14;
    if (v163)
    {
      v167 = objc_msgSend_code(v166, v164, v165);
      switch(v167)
      {
        case 2:
          if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v109, v110))
          {
            objc_msgSend_registration(MEMORY[0x1E0D36AA8], v109, v110);
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v112 = "... IDS message timed out";
              goto LABEL_196;
            }
            goto LABEL_197;
          }
          goto LABEL_207;
        case 1:
          if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v109, v110))
          {
            objc_msgSend_registration(MEMORY[0x1E0D36AA8], v109, v110);
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v112 = "... IDS message failed sending";
              goto LABEL_196;
            }
            goto LABEL_197;
          }
          goto LABEL_207;
        case 0:
          OSLogHandleForIDSCategory();
          v168 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4C7F000, v168, OS_LOG_TYPE_DEFAULT, "... no error, ignoring...", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            _IDSLogV();
          break;
      }
      goto LABEL_206;
    }
    objc_msgSend_domain(v166, v164, v165);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = objc_msgSend_isEqualToString_(v194, v195, *MEMORY[0x1E0CB32E8]);

    if (!v196)
      goto LABEL_206;
    v197 = objc_msgSend_code(*v14, v109, v110);
    if (v197 <= -1023)
    {
      if (v197 != -2000 && v197 != -1200)
        goto LABEL_202;
    }
    else if (((unint64_t)(v197 + 1022) > 0x16 || ((1 << (v197 - 2)) & 0x6F6C3D) == 0)
           && v197 != -1)
    {
LABEL_202:
      if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v198, v199))
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v109, v110);
        v292 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v292, OS_LOG_TYPE_DEFAULT))
        {
          v295 = objc_msgSend_code(*v14, v293, v294);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v317 = v295;
          _os_log_impl(&dword_1A4C7F000, v292, OS_LOG_TYPE_DEFAULT, "... we're done here, code: %d", buf, 8u);
        }

      }
      goto LABEL_206;
    }
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v198, v199))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v109, v110);
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v112 = "... we should retry this";
        goto LABEL_196;
      }
LABEL_197:

    }
LABEL_207:
    if ((objc_msgSend_wantsCFNetworkTimeout(*(void **)(a1 + 32), v109, v110) & 1) == 0
      && objc_msgSend_wantsManagedRetries(*(void **)(a1 + 32), v109, v110))
    {
      if ((objc_msgSend__tryRetryMessageWithTimeInterval_(*(void **)(a1 + 56), v109, v110, 0.0) & 1) != 0)
        goto LABEL_216;
      goto LABEL_215;
    }
LABEL_211:
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v109, v110))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v296, v297);
      v298 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v298, OS_LOG_TYPE_DEFAULT, "... not going to retry, we're done", buf, 2u);
      }

    }
LABEL_215:
    objc_msgSend__informDelegatesOfMessage_result_resultCode_error_(*(void **)(a1 + 56), v296, *(_QWORD *)(a1 + 32), 0, 20000, *(_QWORD *)(a1 + 48));
    goto LABEL_216;
  }
  contexta = (void *)MEMORY[0x1A85A61F4]();
  v115 = objc_msgSend_statusCode(*(void **)(a1 + 40), v113, v114);
  OSLogHandleForIDSCategory();
  v116 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v317 = v314;
    _os_log_impl(&dword_1A4C7F000, v116, OS_LOG_TYPE_DEFAULT, "  headers: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v299 = v314;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v299 = v314;
      IMLogString();
    }
  }
  OSLogHandleForIDSCategory();
  v117 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v317 = v115;
    _os_log_impl(&dword_1A4C7F000, v117, OS_LOG_TYPE_DEFAULT, "  status code: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v299 = (void *)v115;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v299 = (void *)v115;
      IMLogString();
    }
  }
  if (objc_msgSend_count(v314, v118, v119, v299))
  {
    objc_msgSend_currentMessage(*(void **)(a1 + 56), v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v122 == 0;

    if (!v123)
    {
      objc_msgSend_currentMessage(*(void **)(a1 + 56), v120, v121);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleResponseHeaders_(v124, v125, (uint64_t)v314);

    }
  }
  if (v115)
  {
    objc_msgSend_currentMessage(*(void **)(a1 + 56), v120, v121);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleResponseStatus_(v126, v127, v115);

  }
  if (objc_msgSend_length(*(void **)(a1 + 72), v120, v121))
  {
    objc_msgSend_currentMessage(*(void **)(a1 + 56), v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleResponseBody_(v130, v131, *(_QWORD *)(a1 + 72));

  }
  objc_msgSend_currentMessage(*(void **)(a1 + 56), v128, v129);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isIDSMessage(v132, v133, v134) & 1) == 0)
  {
    v135 = *(_QWORD *)(a1 + 80) == 0;

    if (v135)
      goto LABEL_67;
    objc_msgSend_currentMessage(*(void **)(a1 + 56), v136, v137);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_setTimingData_(v132, v138, *(_QWORD *)(a1 + 80));
  }

LABEL_67:
  objc_msgSend_currentMessage(*(void **)(a1 + 56), v136, v137);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend_length(*(void **)(a1 + 72), v140, v141);
  objc_msgSend_setReceivedByteCount_(v139, v143, v142);

  v144 = *(void **)(a1 + 56);
  v145 = *(_QWORD *)(a1 + 72);
  v146 = *(_QWORD *)(a1 + 32);
  v315 = 0;
  objc_msgSend__processResultData_forMessage_error_(v144, v147, v145, v146, &v315);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v315;
  v152 = (void *)0x1E0D36000;
  if (v151)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v149, v150);
    v153 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
      sub_1A4CBAEA0();

  }
  objc_msgSend_objectForKey_(v148, v149, (uint64_t)CFSTR("status"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    objc_msgSend_objectForKey_(v148, v154, (uint64_t)CFSTR("status"));
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = objc_msgSend_intValue(v156, v157, v158);

    v160 = v159;
  }
  else
  {
    v160 = 1;
  }

  v171 = objc_msgSend_isIDSMessage(*(void **)(a1 + 32), v169, v170);
  if (v160 == 1)
    v173 = v171;
  else
    v173 = 1;
  if (v173)
    v174 = v160;
  else
    v174 = 0;
  objc_msgSend_objectForKey_(v148, v172, (uint64_t)CFSTR("retry-interval"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v175, v176, v177);
  v179 = v178;

  objc_msgSend_objectForKey_(v148, v180, (uint64_t)CFSTR("current-timestamp-ms"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    if (v313)
    {
      v174 = objc_msgSend_integerValue(v313, v182, v183);
      if (v174 == 440)
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v182, v184);
        v185 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v185, OS_LOG_TYPE_DEFAULT, "BAA Do Not Retry detected. Swapping status code to Do Not Retry", buf, 2u);
        }

        v187 = (void *)MEMORY[0x1A85A5DE0](CFSTR("IDSBAASigner"), CFSTR("IDS"));
        if (v187
          && (objc_msgSend_baaSigningError(*(void **)(a1 + 32), v182, v186),
              v160 = objc_claimAutoreleasedReturnValue(),
              shouldRetryError = objc_msgSend_shouldRetryError_(v187, v188, v160),
              (id)v160,
              shouldRetryError))
        {
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v182, v190);
          v160 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v160, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_baaSigningError(*(void **)(a1 + 32), v191, v192);
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v317 = v193;
            _os_log_impl(&dword_1A4C7F000, (os_log_t)v160, OS_LOG_TYPE_DEFAULT, "Received BAA DoNotRetry, but see we should retry due to client error %@", buf, 0xCu);

          }
          v174 = 6002;
        }
        else
        {
          v174 = 6001;
        }
      }
    }
    objc_msgSend_objectForKey_(v314, v182, (uint64_t)CFSTR("x-apple-server-time"));
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    if (v200)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v203 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
        objc_msgSend_numberFromString_(v203, v204, (uint64_t)v200);
        v160 = objc_claimAutoreleasedReturnValue();

        v181 = (void *)v160;
      }
      if (!v181)
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v201, v202);
        v205 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v205, OS_LOG_TYPE_FAULT))
          sub_1A4CBAE34();

        v181 = 0;
      }
    }

  }
  if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v182, v183))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v206, v207);
    v208 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v317 = v174;
      _os_log_impl(&dword_1A4C7F000, v208, OS_LOG_TYPE_DEFAULT, "Result status code: %d", buf, 8u);
    }

    objc_msgSend_objectForKey_(v148, v209, (uint64_t)CFSTR("message"));
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v211, v212);
    v213 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
    {
      v214 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v317 = v214;
      _os_log_impl(&dword_1A4C7F000, v213, OS_LOG_TYPE_DEFAULT, "SplunkHint: %{public}@", buf, 0xCu);
    }

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v215, v216);
    v217 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v317 = v210;
      _os_log_impl(&dword_1A4C7F000, v217, OS_LOG_TYPE_DEFAULT, "ServerErrorDetail: %{public}@", buf, 0xCu);
    }

  }
  if (!objc_msgSend_wantsStatusCodeBasedRetries(*(void **)(a1 + 32), v206, v207))
    goto LABEL_143;
  if (v174 > 442)
  {
    if (v174 == 443 || v174 == 6003)
    {
      if (v181)
      {
        objc_msgSend_setServerTimestamp_(*(void **)(a1 + 32), v218, (uint64_t)v181);
        v226 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_date(MEMORY[0x1E0C99D68], v227, v228);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSince1970(v229, v230, v231);
        objc_msgSend_numberWithDouble_(v226, v232, v233);
        v222 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_setServerTimestampReceivedDate_(*(void **)(a1 + 32), v234, (uint64_t)v222);
        objc_msgSend_setFtMessageDeliveryServerTimestamp_(MEMORY[0x1E0D36AF8], v235, (uint64_t)v181);
        objc_msgSend_setFtMessageDeliveryServerTimestampReceivedDate_(MEMORY[0x1E0D36AF8], v236, (uint64_t)v222);
        if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v237, v238))
        {
          objc_msgSend_nonce(MEMORY[0x1E0D36AA8], v239, v240);
          v241 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v317 = v181;
            _os_log_impl(&dword_1A4C7F000, v241, OS_LOG_TYPE_DEFAULT, "Setting server timestamp %@", buf, 0xCu);
          }

        }
        goto LABEL_158;
      }
    }
    else if (v174 == 6002)
    {
      if (v179 < 10.0)
        v179 = 300.0;
      if (!objc_msgSend_logToRegistration(*(void **)(a1 + 56), v218, v219))
        goto LABEL_159;
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v220, v221);
      v222 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
        goto LABEL_158;
      *(_DWORD *)buf = 134217984;
      *(double *)v317 = v179;
      v223 = "Server requested retry with delay, will retry after %f seconds";
      v224 = v222;
      v225 = 12;
      goto LABEL_157;
    }
LABEL_143:
    OSLogHandleForIDSCategory();
    v242 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
    {
      CanBeLogged = objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 32), v243, v244);
      if (CanBeLogged)
      {
        objc_msgSend_messageBodyUsingCache(*(void **)(a1 + 32), v245, v246);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(v152, v248, v249);
        v160 = objc_claimAutoreleasedReturnValue();
        IDSLoggableDescriptionForObjectOnService();
        v250 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v250 = CFSTR("(Not Loggable)");
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v317 = v250;
      _os_log_impl(&dword_1A4C7F000, v242, OS_LOG_TYPE_DEFAULT, "sent dictionary: %@", buf, 0xCu);
      if (CanBeLogged)
      {

      }
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        if ((objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 32), v251, v252) & 1) != 0)
        {
          objc_msgSend_messageBodyUsingCache(*(void **)(a1 + 32), v253, v254);
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v255, v256, v257);
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v303 = (__CFString *)objc_claimAutoreleasedReturnValue();
          MarcoLog();

        }
        else
        {
          v303 = CFSTR("(Not Loggable)");
          MarcoLog();
        }
      }
      if (IMShouldLog())
      {
        if ((objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 32), v274, v275) & 1) != 0)
        {
          objc_msgSend_messageBodyUsingCache(*(void **)(a1 + 32), v276, v277);
          v278 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v278, v279, v280);
          v281 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v303 = (__CFString *)objc_claimAutoreleasedReturnValue();
          IMLogString();

        }
        else
        {
          v303 = CFSTR("(Not Loggable)");
          IMLogString();
        }
      }
    }
    OSLogHandleForIDSCategory();
    v282 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v282, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_allKeys(v148, v283, v284);
      v285 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v317 = v285;
      _os_log_impl(&dword_1A4C7F000, v282, OS_LOG_TYPE_DEFAULT, "         result: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        objc_msgSend_allKeys(v148, v286, v287);
        v303 = (__CFString *)objc_claimAutoreleasedReturnValue();
        MarcoLog();

      }
      if (IMShouldLog())
      {
        objc_msgSend_allKeys(v148, v288, v289);
        v303 = (__CFString *)objc_claimAutoreleasedReturnValue();
        IMLogString();

      }
    }
    OSLogHandleForIDSCategory();
    v290 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v290, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v317 = v174;
      _os_log_impl(&dword_1A4C7F000, v290, OS_LOG_TYPE_DEFAULT, "    status code: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v303 = (__CFString *)v174;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v303 = (__CFString *)v174;
        IMLogString();
      }
    }
    objc_msgSend__informDelegatesOfMessage_result_resultCode_error_(*(void **)(a1 + 56), v291, *(_QWORD *)(a1 + 32), v148, v174, *(_QWORD *)(a1 + 48), v303);
    goto LABEL_189;
  }
  if (v174 != 441)
  {
    if (v174 != 442)
      goto LABEL_143;
    if (!objc_msgSend_logToRegistration(*(void **)(a1 + 56), v218, v219))
      goto LABEL_159;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v220, v221);
    v222 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
      goto LABEL_158;
    *(_WORD *)buf = 0;
    v223 = "Server requested BAA cert purge, will retry";
LABEL_156:
    v224 = v222;
    v225 = 2;
LABEL_157:
    _os_log_impl(&dword_1A4C7F000, v224, OS_LOG_TYPE_DEFAULT, v223, buf, v225);
    goto LABEL_158;
  }
  objc_msgSend_baaSigner(*(void **)(a1 + 56), v218, v219);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topic(*(void **)(a1 + 32), v260, v261);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeBAACertForTopic_(v259, v263, (uint64_t)v262);

  if (!objc_msgSend_logToRegistration(*(void **)(a1 + 56), v264, v265))
    goto LABEL_159;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v220, v221);
  v222 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v223 = "Server requested BAA cert purge, will retry";
    goto LABEL_156;
  }
LABEL_158:

LABEL_159:
  v266 = objc_msgSend__tryRetryMessageWithTimeInterval_(*(void **)(a1 + 56), v220, v221, v179);
  v269 = objc_msgSend_logToRegistration(*(void **)(a1 + 56), v267, v268);
  if (v266)
  {
    if (v269)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v270, v271);
      v272 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v272, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v272, OS_LOG_TYPE_DEFAULT, "Kicked off server retry", buf, 2u);
      }

    }
  }
  else
  {
    if (v269)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v270, v271);
      v273 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v273, OS_LOG_TYPE_DEFAULT, "Unable to retry this message any further", buf, 2u);
      }

    }
    objc_msgSend__informDelegatesOfMessage_result_resultCode_error_(*(void **)(a1 + 56), v270, *(_QWORD *)(a1 + 32), v148, v174, *(_QWORD *)(a1 + 48));
  }
LABEL_189:

  objc_autoreleasePoolPop(contexta);
LABEL_216:

}

void sub_1A4C9CD44(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_messageDelivery_oversized(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "%@ Message body: %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1A4C9CDFC(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_messageDelivery_oversized(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "%@ Message body: %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1A4C9CEB4(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_messageDelivery_oversized(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "%@ Message body: %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1A4C9CF6C(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend_messageDelivery_oversized(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "%@ Message body: %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1A4C9D0E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4C9DCBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4C9DEB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4C9E074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *sub_1A4C9E538()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("_CFNetworkCopyPreferredLanguageCode", CFSTR("CFNetwork"));
  off_1ECF9D6A8 = result;
  return result;
}

void sub_1A4C9E5B4()
{
  FTMessageDelivery_APS *v0;
  void *v1;

  v0 = objc_alloc_init(FTMessageDelivery_APS);
  v1 = (void *)qword_1ECF9D880;
  qword_1ECF9D880 = (uint64_t)v0;

}

void sub_1A4C9E8D0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend_connection(v3, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelOutgoingMessage_(v8, v7, (uint64_t)v4);

}

uint64_t sub_1A4C9E91C(uint64_t a1, const char *a2, void *a3)
{
  return objc_msgSend_invalidate(a3, a2, (uint64_t)a3);
}

uint64_t sub_1A4C9E924(uint64_t a1, const char *a2, void *a3)
{
  return objc_msgSend_invalidate(a3, a2, (uint64_t)a3);
}

uint64_t sub_1A4C9F464(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__messageCompletelyTimedOut_, a2);
}

void sub_1A4CA0604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4CA0734(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__messageNeedsRetry_(WeakRetained, v5, (uint64_t)v3);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Self dealloced, not calling timer handler for message retry.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
  }

}

void sub_1A4CA0830(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__messageAckGracePeriodTimedOut_(WeakRetained, v5, (uint64_t)v3);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Self dealloced, not calling timer handler for message ack grace period timeout.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
  }

}

void sub_1A4CA16B0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__messageACKTimedOut_(WeakRetained, v5, (uint64_t)v3);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Self dealloced, not calling timer handler for message ACK timeout.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
  }

}

void sub_1A4CA17AC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__messageSendTimedOut_(WeakRetained, v5, (uint64_t)v3);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Self dealloced, not calling timer handler for message send timeout.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
  }

}

void sub_1A4CA1958(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend__noteMessageSent_ftMessage_body_(*(void **)(a1 + 32), v3, (uint64_t)v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend__updateTopics(*(void **)(a1 + 32), v5, v6);
    v7 = *(void **)(a1 + 40);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestStart_(v7, v11, (uint64_t)v10);

    v12 = (void *)MEMORY[0x1A85A61F4]();
    objc_msgSend_connection(*(void **)(a1 + 32), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendOutgoingMessage_(v15, v16, (uint64_t)v4);

    objc_autoreleasePoolPop(v12);
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_bagKey(*(void **)(a1 + 40), v18, v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIDString(*(void **)(a1 + 40), v21, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_connection(*(void **)(a1 + 32), v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v39 = v4;
      v40 = 2112;
      v41 = v20;
      v42 = 2112;
      v43 = v23;
      v44 = 2112;
      v45 = v26;
      _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Sent outgoing message: %@ to command: %@   (Request ID: %@   Connection: %@)", buf, 0x2Au);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_bagKey(*(void **)(a1 + 40), v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIDString(*(void **)(a1 + 40), v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_connection(*(void **)(a1 + 32), v33, v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v39 = v36;
      _os_log_impl(&dword_1A4C7F000, v35, OS_LOG_TYPE_ERROR, "Could not generate APSMessage for message: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }

}

void sub_1A4CA2B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A4CA2B88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1A4CA2B98(uint64_t a1)
{

}

void sub_1A4CA2BA0(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend_topic(v16, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v5, v6, v7))
  {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v8, (uint64_t)v5);
    if (objc_msgSend_ultraConstrainedAllowed(v16, v9, v10))
    {
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v12)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend_addObject_(v12, v11, (uint64_t)v5);
    }
  }

}

void sub_1A4CA2C44(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend_topic(v16, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v5, v6, v7))
  {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v8, (uint64_t)v5);
    if (objc_msgSend_ultraConstrainedAllowed(v16, v9, v10))
    {
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v12)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend_addObject_(v12, v11, (uint64_t)v5);
    }
  }

}

void sub_1A4CA42A4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {

    objc_end_catch();
    JUMPOUT(0x1A4CA317CLL);
  }
  _Unwind_Resume(a1);
}

id sub_1A4CA431C()
{
  if (qword_1ECF9D6C0 != -1)
    dispatch_once(&qword_1ECF9D6C0, &unk_1E4DD9E90);
  return (id)off_1ECF9D6B0();
}

void sub_1A4CA4360(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int CanBeLogged;
  const char *v24;
  uint64_t v25;
  __CFString *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend_allKeys(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v39, v47, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        objc_msgSend_objectForKey_(v3, v8, v12, v35, v37);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        if (v2)
        {
          v14 = *(void **)(a1 + 32);
          objc_msgSend_objectForKey_(v3, v13, v12);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v14, v15, (uint64_t)v2, v12);

        }
        OSLogHandleForIDSCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_objectForKey_(v3, v17, v12);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v44 = v12;
          v45 = 2112;
          v46 = v2;
          _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);

        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          objc_msgSend_objectForKey_(v3, v8, v12);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v12;
          v37 = v2;
          _IDSLogV();

        }
      }
      v9 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v39, v47, 16);
    }
    while (v9);
  }

  OSLogHandleForIDSCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    CanBeLogged = objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 40), v19, v20);
    if (CanBeLogged)
    {
      objc_msgSend_description(*(void **)(a1 + 48), v21, v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_service(*(void **)(a1 + 40), v24, v25);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      IDSLoggableDescriptionForObjectOnService();
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = CFSTR("(Not Loggable)");
    }
    *(_DWORD *)buf = 138412290;
    v44 = (uint64_t)v26;
    _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_DEFAULT, "Final delivery payload: %@", buf, 0xCu);
    if (CanBeLogged)
    {

    }
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if ((objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 40), v27, v28) & 1) != 0)
    {
      objc_msgSend_description(*(void **)(a1 + 48), v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_service(*(void **)(a1 + 40), v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      IDSLoggableDescriptionForObjectOnService();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    else
    {
      _IDSLogV();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_1A4CA4850(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  CFMutableDictionaryRef Mutable;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFDictionary *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint8_t buf[4];
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  objc_msgSend_uniqueIDString(*(void **)(a1 + 40), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144))
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 144);
      *(_QWORD *)(v13 + 144) = Mutable;

    }
    if (v3)
    {
      v15 = *(void **)(a1 + 40);
      v16 = *(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 144);
      v17 = v3;
      v20 = (const void *)objc_msgSend_uniqueIDString(v15, v18, v19);
      CFDictionarySetValue(v16, v20, v17);

    }
  }
  if ((objc_msgSend_wantsBinaryPush(*(void **)(a1 + 40), v10, v11) & 1) == 0)
  {
    objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogSimulateCrashForProcess();

  }
  if (objc_msgSend_wantsBinaryPush(*(void **)(a1 + 40), v21, v22))
  {
    v29 = v3;
  }
  else
  {
    objc_msgSend__FTFilteredDictionaryForAPS(v3, v27, v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;
  v31 = objc_alloc(*(Class *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend_topic(*(void **)(a1 + 40), v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend_initWithTopic_userInfo_(v31, v35, (uint64_t)v34, v30);

  if (objc_msgSend_wantsBinaryPush(*(void **)(a1 + 40), v37, v38))
  {
    OSLogHandleForIDSCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v56 = v42;
      _os_log_impl(&dword_1A4C7F000, v41, OS_LOG_TYPE_DEFAULT, "Sending message: %@ as binary push", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v54 = *(_QWORD *)(a1 + 40);
      _IDSLogV();
    }
    objc_msgSend_setPayloadFormat_(v36, v43, 1, v54);
  }
  v44 = objc_msgSend_uniqueID(*(void **)(a1 + 40), v39, v40);
  objc_msgSend_setIdentifier_(v36, v45, v44);
  objc_msgSend_timeout(*(void **)(a1 + 40), v46, v47);
  objc_msgSend_setTimeout_(v36, v49, (unint64_t)v48);
  if (objc_msgSend_highPriority(*(void **)(a1 + 40), v50, v51))
  {
    objc_msgSend_setCritical_(v36, v52, 1);
    objc_msgSend_setPriority_(v36, v53, 2);
  }
  else
  {
    objc_msgSend_setPriority_(v36, v52, 1);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void *sub_1A4CA4BD4()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("PLLogRegisteredEvent", CFSTR("PowerLog"));
  off_1ECF9D780 = result;
  return result;
}

void sub_1A4CA4F70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4CA4FAC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  uint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  const char *v11;
  uint64_t v12;
  __CFString *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  __CFString *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  const char *v39;
  const char *v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  __CFString *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  __CFString *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  const char *v61;
  const __CFString *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint8_t buf[4];
  const __CFString *v67;
  __int16 v68;
  __CFString *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("YES");
    if (!v3)
      v5 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v67 = v5;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Created APSOutgoingMessage body: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v8 = CFSTR("YES");
    if (!v3)
      v8 = CFSTR("NO");
    v62 = v8;
    _IDSLogV();
  }
  if (objc_msgSend_count(v3, v6, v7, v62))
  {
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v67 = v10;
      _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Delivering message to command: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v63 = *(_QWORD *)(a1 + 32);
      _IDSLogV();
    }
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12, v63);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v3, v14, (uint64_t)CFSTR("c"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_objectForKey_(v3, v16, (uint64_t)CFSTR("c"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v13, v18, (uint64_t)v17, CFSTR("CommandID"));

    }
    objc_msgSend_objectForKey_(v3, v16, (uint64_t)CFSTR("i"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend_objectForKey_(v3, v20, (uint64_t)CFSTR("i"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v13, v23, (uint64_t)v22, CFSTR("MessageIdentifier"));

    }
    objc_msgSend_topic(*(void **)(a1 + 40), v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_topic(*(void **)(a1 + 40), v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v13, v28, (uint64_t)v27, CFSTR("Topic"));

    }
    objc_msgSend_objectForKey_(v3, v25, (uint64_t)CFSTR("U"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend_objectForKey_(v3, v30, (uint64_t)CFSTR("U"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__IDSDataFromBase64String_(v31, v33, (uint64_t)v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      JWUUIDPushObjectToString();
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_objectForKey_(v3, v30, (uint64_t)CFSTR("U"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKey_(v3, v40, (uint64_t)CFSTR("U"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        JWUUIDPushObjectToString();
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        JWUUIDPushObjectToString();
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    if (v35)
    {
      OSLogHandleForIDSCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_topic(*(void **)(a1 + 40), v43, v44);
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = v35;
        v68 = 2112;
        v69 = v45;
        _os_log_impl(&dword_1A4C7F000, v42, OS_LOG_TYPE_DEFAULT, "OUTGOING-APS_DELIVERY:%@ SERVICE:%@", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        objc_msgSend_topic(*(void **)(a1 + 40), v46, v47);
        v64 = v35;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV();

      }
      objc_msgSend_setObject_forKey_(v13, v46, (uint64_t)v35, CFSTR("MessageGUID"), v64, v65);
    }
    v48 = objc_opt_class();
    sub_1A4CA57B8(v48, v3, (void *)*MEMORY[0x1E0D344E8]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
      objc_msgSend_setObject_forKey_(v13, v49, (uint64_t)v50, CFSTR("CommandContext"));
    OSLogHandleForIDSCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_service(*(void **)(a1 + 40), v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      IDSLoggableDescriptionForObjectOnService();
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v67 = v55;
      v68 = 2112;
      v69 = v35;
      _os_log_impl(&dword_1A4C7F000, v51, OS_LOG_TYPE_DEFAULT, "Message body: %@ [guid: %@]", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_service(*(void **)(a1 + 40), v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      IDSLoggableDescriptionForObjectOnService();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v35;
      _IDSLogV();

    }
    OSLogHandleForIDSCategory();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v13;
      _os_log_impl(&dword_1A4C7F000, v59, OS_LOG_TYPE_DEFAULT, "Logging outgoing push power event: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v64 = v13;
      _IDSLogV();
    }
    objc_msgSend__powerLogEvent_dictionary_(*(void **)(a1 + 48), v60, (uint64_t)CFSTR("IDS OutgoingPushSent"), v13, v64, v65);
    objc_msgSend__sendMessage_ftMessage_(*(void **)(a1 + 48), v61, (uint64_t)v3, *(_QWORD *)(a1 + 40));

  }
  else
  {
    OSLogHandleForIDSCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v36, OS_LOG_TYPE_DEFAULT, "Failing message, empty message", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
    v38 = *(void **)(a1 + 48);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v37, *MEMORY[0x1E0CB32E8], -1000, 0);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v38, v39, (uint64_t)v13, 20000, *(_QWORD *)(a1 + 40));
  }

}

id sub_1A4CA57B8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;

  v5 = a3;
  objc_msgSend_objectForKey_(a2, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
  }
  else
  {
    if (v7)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_1A4CBB350((uint64_t)v5, a1, v11);

    }
    v10 = 0;
  }

  return v10;
}

void sub_1A4CA691C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_activity_scope_state_s state, char a13)
{
  void *v13;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1A4CA67CCLL);
  }
  objc_sync_exit(v13);
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(exc_buf);
}

void sub_1A4CA723C(_Unwind_Exception *exc_buf, int a2)
{
  void *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1A4CA7198);
  }
  objc_sync_exit(v2);
  _Unwind_Resume(exc_buf);
}

void sub_1A4CA8EF8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1A4CA8CA4);
  }
  _Unwind_Resume(a1);
}

void *sub_1A4CA95F0()
{
  void *result;

  result = (void *)MEMORY[0x1A85A5DEC]("_CFNetworkCopyPreferredLanguageCode", CFSTR("CFNetwork"));
  off_1ECF9D6B0 = result;
  return result;
}

id sub_1A4CA9DA0(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend_length(v4, v5, v6))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("%@:b"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v3, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    if (v10)
      objc_msgSend__FTDataFromBase64String(v10, v11, v12);
    else
      objc_msgSend_objectForKey_(v3, v11, (uint64_t)v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id sub_1A4CA9E64(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  void *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  int hasSuffix;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!objc_msgSend_count(v1, v2, v3))
  {
    v4 = v1;
    goto LABEL_38;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend_allKeys(v1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v52, v56, 16);
  if (!v51)
    goto LABEL_36;
  v9 = *(_QWORD *)v53;
  v46 = v4;
  v47 = v1;
  v48 = v7;
  v49 = *(_QWORD *)v53;
  do
  {
    for (i = 0; i != v51; ++i)
    {
      if (*(_QWORD *)v53 != v9)
        objc_enumerationMutation(v7);
      v11 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * i);
      if (objc_msgSend_length(v11, v12, v13))
      {
        v15 = objc_msgSend_rangeOfString_(v11, v14, (uint64_t)CFSTR(":b"));
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = v11;
        }
        else
        {
          objc_msgSend_substringToIndex_(v11, v16, v15);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;
      }
      else
      {
        v18 = 0;
      }

      objc_msgSend_objectForKey_(v1, v19, (uint64_t)v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        sub_1A4CA9E64(v20);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v20)
          goto LABEL_34;
        sub_1A4CA9DA0(v1, v18);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_30:
        v31 = (void *)v21;
        objc_msgSend_setValue_forKey_(v4, v22, v21, v18, v46, v47);
        goto LABEL_33;
      }
      v23 = v20;
      v24 = v11;
      v50 = v23;
      if (!objc_msgSend_length(v24, v25, v26))
      {
        v31 = 0;
        goto LABEL_32;
      }
      hasSuffix = objc_msgSend_hasSuffix_(v24, v27, (uint64_t)CFSTR(":b"));
      v31 = (void *)objc_msgSend_mutableCopy(v23, v29, v30);
      v34 = objc_msgSend_count(v31, v32, v33);
      if (v34 - 1 < 0)
        goto LABEL_27;
      v36 = v34;
      do
      {
        objc_msgSend_objectAtIndex_(v31, v35, --v36, v46, v47);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          sub_1A4CA9E64(v37);
          v38 = objc_claimAutoreleasedReturnValue();
LABEL_21:
          v40 = (void *)v38;
          objc_msgSend_replaceObjectAtIndex_withObject_(v31, v39, v36, v38);

          goto LABEL_25;
        }
        if (hasSuffix)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend__FTDataFromBase64String(v37, v41, v42);
            v38 = objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
        }
LABEL_25:

      }
      while (v36 > 0);
      v4 = v46;
      v1 = v47;
LABEL_27:
      v7 = v48;
LABEL_32:

      v9 = v49;
      objc_msgSend_setValue_forKey_(v4, v43, (uint64_t)v31, v18, v46, v47);
LABEL_33:

LABEL_34:
    }
    v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v44, (uint64_t)&v52, v56, 16);
  }
  while (v51);
LABEL_36:

LABEL_38:
  return v4;
}

void sub_1A4CAAFE0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = a2;
    v14 = 2112;
    v15 = a3;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "CT Request callback: %@: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend_sharedInstance(FTEntitlementSupport, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__handleCTServiceRequestName_userInfo_contextInfo_(v10, v11, (uint64_t)a2, a3, a4);

}

void sub_1A4CAB200(uint64_t a1, const char *a2, const __CFString *a3)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = a3;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "CT Daemon ready: %@", (uint8_t *)&v16, 0xCu);
  }

  if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x1E0CA7360], 1uLL) == kCFCompareEqualTo)
  {
    objc_msgSend_sharedInstance(FTEntitlementSupport, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend__setupCTServerConnection(v7, v8, v9);

    if (v10)
    {
      objc_msgSend_sharedInstance(FTEntitlementSupport, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__registerForCTEntitlementNotifications(v13, v14, v15);

    }
  }
}

void sub_1A4CAB57C()
{
  FTUserConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(FTUserConfiguration);
  v1 = (void *)qword_1ECF9D890;
  qword_1ECF9D890 = (uint64_t)v0;

}

void sub_1A4CABBFC(uint64_t a1, const void *a2)
{
  _QWORD *WeakRetained;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E0CA7490]))
    {
      OSLogHandleForIDSCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = a2;
        _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Received %@ so nuking cached values", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend__clearCaches(WeakRetained, v5, v6);
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E0CA7358]))
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = a2;
        _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ disconnecting and clearing values", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend__clearCaches(WeakRetained, v8, v9);
      WeakRetained[6] = 0;
    }
  }

}

void sub_1A4CAC814(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_object(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__clearCaches(v5, v3, v4);

}

void sub_1A4CACA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A4CACA54(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1A4CACA64(uint64_t a1)
{

}

void sub_1A4CACA6C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  char WiFi_data_allowed_from_policy;
  void *v8;
  char cell_data_allowed_from_policy;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  const __CFString *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const __CFString *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1A85A6578]() == MEMORY[0x1E0C812C8])
  {
    if (xpc_array_get_count(v3))
    {
      xpc_array_get_dictionary(v3, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      WiFi_data_allowed_from_policy = network_usage_policy_get_WiFi_data_allowed_from_policy();

      xpc_array_get_dictionary(v3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      cell_data_allowed_from_policy = network_usage_policy_get_cell_data_allowed_from_policy();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = WiFi_data_allowed_from_policy & cell_data_allowed_from_policy;
      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      OSLogHandleForIDSCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v40 = v15;
        v41 = 2112;
        v42 = v16;
        _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEBUG, "Caching canUseNonBT {canUseNonBT: %@, bundle: %@}", buf, 0x16u);
      }

      objc_msgSend_object(*(void **)(a1 + 40), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_nonBTAllowedCache(v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_((void *)v22, v23, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 32));

      xpc_array_get_dictionary(v3, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v22) = network_usage_policy_get_first_use_flow_performed_from_policy();

      if ((v22 & 1) == 0)
      {
        OSLogHandleForIDSCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(const __CFString **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v40 = v26;
          _os_log_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_DEFAULT, "Showing network usage policy first alert {bundle: %@}", buf, 0xCu);
        }

        v27 = objc_retainAutorelease(*(id *)(a1 + 32));
        objc_msgSend_UTF8String(v27, v28, v29);
        perform_first_network_use_flow();
      }
    }
  }
  else if (MEMORY[0x1A85A6578](v3) == MEMORY[0x1E0C81350])
  {
    OSLogHandleForIDSCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v40 = v31;
      _os_log_impl(&dword_1A4C7F000, v30, OS_LOG_TYPE_DEFAULT, "Received NULL policy for canUseNonBT -- caching NO {bundle: %@}", buf, 0xCu);
    }

    objc_msgSend_object(*(void **)(a1 + 40), v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nonBTAllowedCache(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v37, v38, MEMORY[0x1E0C9AAA0], *(_QWORD *)(a1 + 32));

  }
  else
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v40 = v5;
      v41 = 2112;
      v42 = v3;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_ERROR, "Unexpected network usage policy {bundle: %@, policies: %@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

id sub_1A4CAD7E4(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  char isEqualToString;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend_length(v3, v5, v6) && objc_msgSend_count(v4, v7, v8))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = v4;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v36, v41, 16);
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend_regionID(v17, v12, v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)v3);

          if ((isEqualToString & 1) != 0)
          {
            v30 = v17;
            goto LABEL_22;
          }
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v36, v41, 16);
        if (v14)
          continue;
        break;
      }
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v9;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v32, v40, 16);
    if (v23)
    {
      v26 = v23;
      v27 = *(_QWORD *)v33;
LABEL_13:
      v28 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v21);
        objc_msgSend_subRegions(*(void **)(*((_QWORD *)&v32 + 1) + 8 * v28), v24, v25, (_QWORD)v32);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1A4CAD7E4(v3, v29);
        v30 = (id)objc_claimAutoreleasedReturnValue();

        if (v30)
          break;
        if (v26 == ++v28)
        {
          v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v32, v40, 16);
          v30 = 0;
          if (v26)
            goto LABEL_13;
          break;
        }
      }
    }
    else
    {
      v30 = 0;
    }
LABEL_22:

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

void sub_1A4CADB8C()
{
  FTRegionSupport *v0;
  void *v1;

  v0 = objc_alloc_init(FTRegionSupport);
  v1 = (void *)qword_1ECF9D898;
  qword_1ECF9D898 = (uint64_t)v0;

}

void sub_1A4CADD20(uint64_t a1, void *a2, void *a3, unint64_t a4, void *a5)
{
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  FTRegion *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  id v32;
  unint64_t v33;
  id v34;
  id v35;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  unint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v37 = a3;
  v35 = a5;
  if (a4 > 1)
  {
    OSLogHandleForIDSCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = (uint64_t)v37;
      v45 = 2048;
      v46 = a4;
      _os_log_impl(&dword_1A4C7F000, v30, OS_LOG_TYPE_ERROR, "Failed querying regions: %@  code: %ld", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      v32 = v37;
      v33 = a4;
      _IDSLogTransport();
    }
    objc_msgSend_setRegions_(*(void **)(a1 + 32), v31, 0, v32, v33);
  }
  else
  {
    v34 = v8;
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Succeeded loading region information", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend_responseRegionInformation(v34, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v39, v47, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          OSLogHandleForIDSCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v17;
            _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_DEFAULT, "   Region info: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            _IDSLogV();
          v19 = [FTRegion alloc];
          v21 = (void *)objc_msgSend__initWithDictionary_(v19, v20, v17);
          OSLogHandleForIDSCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = (uint64_t)v21;
            _os_log_impl(&dword_1A4C7F000, v22, OS_LOG_TYPE_DEFAULT, "   Loaded region: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            _IDSLogV();
          if (v21)
            objc_msgSend_addObject_(v38, v23, (uint64_t)v21);

        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v24, (uint64_t)&v39, v47, 16);
      }
      while (v14);
    }

    objc_msgSend_setRegions_(*(void **)(a1 + 32), v25, (uint64_t)v38);
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v28, v29, (uint64_t)CFSTR("__kFTRegionListFinishedLoadingNotification"), *(_QWORD *)(a1 + 32));

  }
}

void sub_1A4CAE7AC()
{
  FTPasswordManager *v0;
  void *v1;

  v0 = objc_alloc_init(FTPasswordManager);
  v1 = (void *)qword_1ECF9D8A0;
  qword_1ECF9D8A0 = (uint64_t)v0;

}

id sub_1A4CAE918()
{
  if (qword_1ECF9D6D8 != -1)
    dispatch_once(&qword_1ECF9D6D8, &unk_1E4DDA2D0);
  return (id)qword_1ECF9D6D0;
}

id sub_1A4CAE958()
{
  if (qword_1ECF9D718 != -1)
    dispatch_once(&qword_1ECF9D718, &unk_1E4DDA2F0);
  return (id)qword_1ECF9D710;
}

id sub_1A4CAEF9C(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v1 = a1;
  objc_msgSend_accountProperties(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("profile-id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v6, v7, v8))
  {
    objc_msgSend_accountProperties(v1, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("profileID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend_length(v13, v14, v15))
    {
      v16 = 0;
      goto LABEL_5;
    }
    v6 = v13;
  }
  v16 = v6;
  v13 = v16;
LABEL_5:

  return v16;
}

__CFString *sub_1A4CAF050(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  __CFString *v11;

  v1 = a1;
  v4 = v1;
  if (v1)
  {
    if (objc_msgSend_length(v1, v2, v3))
    {
      if ((unint64_t)objc_msgSend_length(v4, v5, v6) < 0xB)
      {
        v11 = CFSTR("(short auth token)");
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_substringToIndex_(v4, v7, 10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("%@..."), v9);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v11 = CFSTR("(empty auth token)");
    }
  }
  else
  {
    v11 = CFSTR("(nil auth token)");
  }

  return v11;
}

id sub_1A4CAF108(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend_credential(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_credential(v1, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_token(v7, v8, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id sub_1A4CAF16C(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v2, v3);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountProperties(v1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("handles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v1;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v8;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_objectForKey_(v15, v16, (uint64_t)CFSTR("uri"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v15, v18, (uint64_t)CFSTR("status"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && objc_msgSend_integerValue(v19, v20, v21) == 5051
                && objc_msgSend_length(v17, v22, v23)
                && IMStringIsEmail())
              {
                objc_msgSend_addObject_(v27, v24, (uint64_t)v17);
              }
            }

          }
        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v16, (uint64_t)&v28, v32, 16);
      }
      while (v12);
    }

    v1 = v26;
  }

  return v27;
}

uint64_t sub_1A4CAF89C(uint64_t a1, void *a2)
{
  return sub_1A4CAF8A4(*(void **)(a1 + 32), a2);
}

uint64_t sub_1A4CAF8A4(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t isEqualToIgnoringCase;
  int v23;
  NSObject *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v7 = v4;
  if (v3 && v4)
  {
    objc_msgSend__stripFZIDPrefix(v3, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_username(v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountProperties(v7, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("originalUsername"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412802;
      v24 = v8;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v16;
      _os_log_debug_impl(&dword_1A4C7F000, v19, OS_LOG_TYPE_DEBUG, "Comparing strippedUserName %@, accountUserName %@ and accountOriginalUserName %@", (uint8_t *)&v23, 0x20u);
    }

    if (v11 && (objc_msgSend_isEqualToIgnoringCase_(v11, v20, (uint64_t)v8) & 1) != 0)
    {
      isEqualToIgnoringCase = 1;
    }
    else if (v16)
    {
      isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v16, v20, (uint64_t)v8);
    }
    else
    {
      isEqualToIgnoringCase = 0;
    }

  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1A4CBB710();
    isEqualToIgnoringCase = 0;
  }

  return isEqualToIgnoringCase;
}

uint64_t sub_1A4CAFAF4(uint64_t a1, void *a2)
{
  return sub_1A4CAF8A4(*(void **)(a1 + 32), a2);
}

BOOL sub_1A4CAFE98(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (sub_1A4CAFEF4(*(void **)(a1 + 32), v3))
  {
    sub_1A4CAF108(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t sub_1A4CAFEF4(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  char isEqualToIgnoringCase;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = 0;
  if (v3 && a2)
  {
    sub_1A4CAF16C(a2);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v21, v25, 16);
    if (v4)
    {
      v9 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend__stripFZIDPrefix(v3, v7, v8, (_QWORD)v21);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend__stripFZIDPrefix(v3, v7, v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__stripFZIDPrefix(v11, v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v14, v18, (uint64_t)v17);

            if ((isEqualToIgnoringCase & 1) != 0)
            {
              v4 = 1;
              goto LABEL_14;
            }
          }
        }
        v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v21, v25, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v4;
}

BOOL sub_1A4CB0070(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  _BOOL8 v12;

  v3 = a2;
  if (sub_1A4CAFEF4(*(void **)(a1 + 32), v3))
  {
    objc_msgSend_credential(v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_password(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_length(v9, v10, v11) != 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t sub_1A4CB00EC(uint64_t a1, void *a2)
{
  return sub_1A4CAFEF4(*(void **)(a1 + 32), a2);
}

BOOL sub_1A4CB04A8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  sub_1A4CAEF9C(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    sub_1A4CAEF9C(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToIgnoringCase_(v5, v7, (uint64_t)v6))
    {
      sub_1A4CAF108(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL sub_1A4CB0540(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  _BOOL8 v16;

  v3 = a2;
  sub_1A4CAEF9C(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    sub_1A4CAEF9C(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToIgnoringCase_(v5, v7, (uint64_t)v6))
    {
      objc_msgSend_credential(v3, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_password(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_length(v13, v14, v15) != 0;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t sub_1A4CB05F8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v3 = a2;
  sub_1A4CAEF9C(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    sub_1A4CAEF9C(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToIgnoringCase_(v5, v7, (uint64_t)v6))
      v8 = sub_1A4CAF8A4(*(void **)(a1 + 40), v3);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t sub_1A4CB0690(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t isEqualToIgnoringCase;

  v3 = a2;
  sub_1A4CAEF9C(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    sub_1A4CAEF9C(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v5, v7, (uint64_t)v6);

  }
  else
  {
    isEqualToIgnoringCase = 0;
  }

  return isEqualToIgnoringCase;
}

void sub_1A4CB0B88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  im_primary_queue();
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = sub_1A4CB0C7C;
  v12[3] = &unk_1E4DDA030;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v5;
  v15 = v8;
  v12[1] = 3221225472;
  v13 = v6;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void sub_1A4CB0C7C(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  const char *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || (a3 = *(_QWORD *)(a1 + 40)) == 0)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1A4CBB780();
  }
  else
  {
    objc_msgSend_accountsWithAccountType_(*(void **)(*(_QWORD *)(a1 + 48) + 16), a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v4 = v5;
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v34, v41, 16);
    if (v8)
    {
      v11 = v8;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v4);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend_length(*(void **)(a1 + 56), v9, v10)
            && sub_1A4CAF8A4(*(void **)(a1 + 56), v14))
          {
            objc_msgSend_addObject_(v6, v9, (uint64_t)v14);
          }
        }
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v9, (uint64_t)&v34, v41, 16);
      }
      while (v11);
    }

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v6;
      _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Updating username on accounts { accountsToUpdate : %@ }", buf, 0xCu);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = v6;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v30, v38, 16);
    if (v20)
    {
      v22 = v20;
      v23 = *(_QWORD *)v31;
      v24 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v18);
          v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend_setUsername_(v26, v21, *(_QWORD *)(a1 + 64));
          v27 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
          v29[0] = v24;
          v29[1] = 3221225472;
          v29[2] = sub_1A4CB0F44;
          v29[3] = &unk_1E4DDA008;
          v29[4] = v26;
          objc_msgSend_saveVerifiedAccount_withCompletionHandler_(v27, v28, (uint64_t)v26, v29);
        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v30, v38, 16);
      }
      while (v22);
    }

  }
}

void sub_1A4CB0F44(uint64_t a1, int a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (a2)
      v9 = CFSTR("YES");
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", (uint8_t *)&v13, 0x16u);
  }

  if (v5)
  {
    objc_msgSend_warning(MEMORY[0x1E0D36AA8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1A4CBB7E8(a1, (uint64_t)v5, v12);

  }
}

void sub_1A4CB15D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  im_primary_queue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4CB16BC;
  block[3] = &unk_1E4DDA080;
  v11 = v6;
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void sub_1A4CB16BC(_QWORD *a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  _QWORD *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  id obj;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a1[4] || (a3 = a1[5]) == 0)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1A4CBB85C();

    v5 = a1[8];
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }
  else
  {
    objc_msgSend_accountsWithAccountType_(*(void **)(a1[6] + 16), a2, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v6;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v49, v56, 16);
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v50;
      v14 = *MEMORY[0x1E0D34458];
      *(_QWORD *)&v11 = 138412290;
      v41 = v11;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend_accountPropertyForKey_(v16, v10, v14, v41);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v18);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v41;
              v55 = (uint64_t)v16;
              _os_log_impl(&dword_1A4C7F000, v19, OS_LOG_TYPE_DEFAULT, "Found candidate account for clean-up { account : %@ }", buf, 0xCu);
            }

            objc_msgSend_setAccountProperty_forKey_(v16, v20, 0, v14);
            objc_msgSend_addObject_(v7, v21, (uint64_t)v16);
          }
        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v49, v56, 16);
      }
      while (v12);
    }
    v22 = a1;

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = (uint64_t)v7;
      _os_log_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_DEFAULT, "Requesting save of cleaned-up accounts { accountsToSave : %@ }", buf, 0xCu);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v26 = v7;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v45, v53, 16);
    if (v28)
    {
      v32 = v28;
      v33 = *(_QWORD *)v46;
      *(_QWORD *)&v31 = 138412290;
      v42 = v31;
      v34 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v46 != v33)
            objc_enumerationMutation(v26);
          v36 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v29, v30, v42);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v42;
            v55 = v36;
            _os_log_impl(&dword_1A4C7F000, v37, OS_LOG_TYPE_DEFAULT, "Saving account { account: %@ }", buf, 0xCu);
          }

          v38 = *(void **)(v22[6] + 16);
          v44[0] = v34;
          v44[1] = 3221225472;
          v44[2] = sub_1A4CB1AA0;
          v44[3] = &unk_1E4DDA008;
          v44[4] = v36;
          objc_msgSend_saveVerifiedAccount_withCompletionHandler_(v38, v39, v36, v44);
        }
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v45, v53, 16);
      }
      while (v32);
    }

    v40 = v22[8];
    if (v40)
      (*(void (**)(uint64_t, uint64_t))(v40 + 16))(v40, 1);

  }
}

void sub_1A4CB1AA0(uint64_t a1, int a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("NO");
    v11 = 138412802;
    if (a2)
      v10 = CFSTR("YES");
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "Save completed { account: %@, success: %@, error: %@ }", (uint8_t *)&v11, 0x20u);
  }

}

void sub_1A4CB1D74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  im_primary_queue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = sub_1A4CB1EA4;
  block[3] = &unk_1E4DDA0D0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v5;
  v15 = v8;
  block[1] = 3221225472;
  v13 = v6;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v21 = *(id *)(a1 + 80);
  v20 = *(id *)(a1 + 72);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void sub_1A4CB1EA4(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  int isEqualToIgnoringCase;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  const char *v32;
  int v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  int v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id obj;
  int v69;
  _QWORD v70[5];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
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
  uint8_t v87[128];
  uint8_t buf[4];
  uint64_t v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1A85A61F4]();
  v5 = (void *)v2;
  if (*(_QWORD *)(a1 + 32) || (v4 = *(_QWORD *)(a1 + 40)) == 0)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1A4CBB8C4();

    v7 = *(_QWORD *)(a1 + 96);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  else
  {
    v64 = (void *)v2;
    objc_msgSend_accountsWithAccountType_(*(void **)(*(_QWORD *)(a1 + 48) + 16), v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    obj = v8;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v83, v92, 16);
    if (v10)
    {
      v13 = v10;
      v14 = *(_QWORD *)v84;
      v66 = *(_QWORD *)v84;
      do
      {
        v15 = 0;
        v67 = v13;
        do
        {
          if (*(_QWORD *)v84 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v15);
          if (objc_msgSend_length(*(void **)(a1 + 56), v11, v12))
          {
            if ((sub_1A4CAF8A4(*(void **)(a1 + 56), v16) & 1) != 0)
              v19 = 1;
            else
              v19 = sub_1A4CAFEF4(*(void **)(a1 + 56), v16);
          }
          else
          {
            v19 = 0;
          }
          if (objc_msgSend_length(*(void **)(a1 + 64), v17, v18))
          {
            sub_1A4CAEF9C(v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = *(void **)(a1 + 64);
              sub_1A4CAEF9C(v16);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v21, v23, (uint64_t)v22);

            }
            else
            {
              isEqualToIgnoringCase = 0;
            }

          }
          else
          {
            isEqualToIgnoringCase = 0;
          }
          if ((v19 | isEqualToIgnoringCase) == 1)
          {
            v81 = 0u;
            v82 = 0u;
            v79 = 0u;
            v80 = 0u;
            v25 = *(id *)(a1 + 72);
            v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v79, v91, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v80;
              while (2)
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v80 != v29)
                    objc_enumerationMutation(v25);
                  v31 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
                  if ((sub_1A4CAF8A4(v31, v16) & 1) != 0 || (sub_1A4CAFEF4(v31, v16) & 1) != 0)
                  {
                    v33 = 0;
                    goto LABEL_36;
                  }
                }
                v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v32, (uint64_t)&v79, v91, 16);
                v33 = 1;
                if (v28)
                  continue;
                break;
              }
            }
            else
            {
              v33 = 1;
            }
LABEL_36:
            v69 = v33;

            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            v34 = *(id *)(a1 + 80);
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v75, v90, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v76;
              while (2)
              {
                for (j = 0; j != v37; ++j)
                {
                  if (*(_QWORD *)v76 != v38)
                    objc_enumerationMutation(v34);
                  v40 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
                  sub_1A4CAEF9C(v16);
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (v41)
                  {
                    v43 = (void *)v41;
                    sub_1A4CAEF9C(v16);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_msgSend_isEqualToIgnoringCase_(v40, v45, (uint64_t)v44);

                    if (v46)
                    {

                      v14 = v66;
                      v13 = v67;
                      goto LABEL_48;
                    }
                  }
                }
                v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v42, (uint64_t)&v75, v90, 16);
                if (v37)
                  continue;
                break;
              }
            }

            v14 = v66;
            v13 = v67;
            if (v69)
              objc_msgSend_addObject_(v65, v11, (uint64_t)v16);
          }
LABEL_48:
          ++v15;
        }
        while (v15 != v13);
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v83, v92, 16);
      }
      while (v13);
    }

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v89 = (uint64_t)v65;
      _os_log_impl(&dword_1A4C7F000, v49, OS_LOG_TYPE_DEFAULT, "Requesting deletion of accounts { accountsToDelete : %@ }", buf, 0xCu);
    }

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v50 = v65;
    v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v71, v87, 16);
    if (v52)
    {
      v55 = v52;
      v56 = *(_QWORD *)v72;
      v57 = MEMORY[0x1E0C809B0];
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v72 != v56)
            objc_enumerationMutation(v50);
          v59 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * k);
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v53, v54);
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v89 = v59;
            _os_log_impl(&dword_1A4C7F000, v60, OS_LOG_TYPE_DEFAULT, "Deleting unused account { account: %@ }", buf, 0xCu);
          }

          v61 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
          v70[0] = v57;
          v70[1] = 3221225472;
          v70[2] = sub_1A4CB2454;
          v70[3] = &unk_1E4DDA008;
          v70[4] = v59;
          objc_msgSend_removeAccount_withCompletionHandler_(v61, v62, v59, v70);
        }
        v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v71, v87, 16);
      }
      while (v55);
    }

    v63 = *(_QWORD *)(a1 + 96);
    if (v63)
      (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, 1);

    v5 = v64;
  }
  objc_autoreleasePoolPop(v5);
}

void sub_1A4CB2454(uint64_t a1, int a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("NO");
    v11 = 138412802;
    if (a2)
      v10 = CFSTR("YES");
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "Delete completed { account: %@, success: %@, error: %@ }", (uint8_t *)&v11, 0x20u);
  }

}

void sub_1A4CB26F4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  im_primary_queue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4CB2800;
  block[3] = &unk_1E4DDA120;
  v17 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v13 = v6;
  v14 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v18 = v8;
  v15 = v9;
  v19 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void sub_1A4CB2800(_QWORD *a1)
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  const char *v26;
  int v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  void *v38;
  const char *v39;
  char isEqualToIgnoringCase;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  double v56;
  double v57;
  NSObject *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  __int128 v77;
  id v78;
  id obj;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint8_t v106[128];
  uint8_t buf[4];
  uint64_t v108;
  __int16 v109;
  void *v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[8] + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[9] + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v108 = (uint64_t)v2;
    v109 = 2112;
    v110 = v3;
    _os_log_impl(&dword_1A4C7F000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up unused accounts { usernames : %@, profileIDs : %@ }", buf, 0x16u);
  }

  if (a1[4] || (v8 = a1[5]) == 0)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1A4CBB85C();

    v10 = a1[10];
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }
  else
  {
    v85 = a1;
    objc_msgSend_accountsWithAccountType_(*(void **)(a1[6] + 16), v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    obj = v11;
    v80 = v3;
    v81 = v2;
    v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v99, v106, 16);
    if (v84)
    {
      v83 = *(_QWORD *)v100;
      v82 = *MEMORY[0x1E0D34430];
      *(_QWORD *)&v15 = 138412290;
      v77 = v15;
      while (2)
      {
        for (i = 0; i != v84; ++i)
        {
          if (*(_QWORD *)v100 != v83)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14, v77);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v77;
            v108 = (uint64_t)v17;
            _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_INFO, "Checking if account should be deleted { account: %@ }", buf, 0xCu);
          }

          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v19 = v2;
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v95, v105, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v96;
            while (2)
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v96 != v23)
                  objc_enumerationMutation(v19);
                v25 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
                if ((sub_1A4CAF8A4(v25, v17) & 1) != 0 || (sub_1A4CAFEF4(v25, v17) & 1) != 0)
                {
                  v27 = 0;
                  goto LABEL_28;
                }
              }
              v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v26, (uint64_t)&v95, v105, 16);
              v27 = 1;
              if (v22)
                continue;
              break;
            }
          }
          else
          {
            v27 = 1;
          }
LABEL_28:

          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          v28 = v3;
          v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v91, v104, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v92;
            while (2)
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v92 != v32)
                  objc_enumerationMutation(v28);
                v34 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
                sub_1A4CAEF9C(v17);
                v35 = objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  v37 = (void *)v35;
                  sub_1A4CAEF9C(v17);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v34, v39, (uint64_t)v38);

                  if ((isEqualToIgnoringCase & 1) != 0)
                  {
                    v27 = 0;
                    goto LABEL_39;
                  }
                }
              }
              v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v36, (uint64_t)&v91, v104, 16);
              if (v31)
                continue;
              break;
            }
LABEL_39:
            v3 = v80;
            v2 = v81;
          }

          objc_msgSend_accountProperties(v17, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v43, v44, v82);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            v48 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend_doubleValue(v45, v46, v47);
            objc_msgSend_dateWithTimeIntervalSince1970_(v48, v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_now(MEMORY[0x1E0C99D68], v52, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSinceDate_(v54, v55, (uint64_t)v51);
            v57 = v56;

            if (v57 <= 60.0)
            {
              objc_msgSend_registration(MEMORY[0x1E0D36AA8], v46, v47);
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4C7F000, v59, OS_LOG_TYPE_INFO, "Account was recently added. Not deleting", buf, 2u);
              }

              goto LABEL_52;
            }
          }
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v46, v47);
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4C7F000, v58, OS_LOG_TYPE_INFO, "Account was not recently added", buf, 2u);
          }

          if (v27)
            objc_msgSend_addObject_(v78, v13, (uint64_t)v17);
        }
        v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v99, v106, 16);
        if (v84)
          continue;
        break;
      }
    }
LABEL_52:

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v60, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v108 = (uint64_t)v78;
      _os_log_impl(&dword_1A4C7F000, v62, OS_LOG_TYPE_DEFAULT, "Requesting deletion of accounts { accountsToDelete : %@ }", buf, 0xCu);
    }

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v63 = v78;
    v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v87, v103, 16);
    if (v65)
    {
      v68 = v65;
      v69 = *(_QWORD *)v88;
      v70 = MEMORY[0x1E0C809B0];
      do
      {
        for (m = 0; m != v68; ++m)
        {
          if (*(_QWORD *)v88 != v69)
            objc_enumerationMutation(v63);
          v72 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * m);
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v66, v67);
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v108 = v72;
            _os_log_impl(&dword_1A4C7F000, v73, OS_LOG_TYPE_DEFAULT, "Deleting unused account { account: %@ }", buf, 0xCu);
          }

          v74 = *(void **)(v85[6] + 16);
          v86[0] = v70;
          v86[1] = 3221225472;
          v86[2] = sub_1A4CB2F28;
          v86[3] = &unk_1E4DDA008;
          v86[4] = v72;
          objc_msgSend_removeAccount_withCompletionHandler_(v74, v75, v72, v86);
        }
        v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v87, v103, 16);
      }
      while (v68);
    }

    v76 = v85[10];
    if (v76)
      (*(void (**)(uint64_t, uint64_t))(v76 + 16))(v76, 1);

    v3 = v80;
    v2 = v81;
  }

}

void sub_1A4CB2F28(uint64_t a1, int a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("NO");
    v11 = 138412802;
    if (a2)
      v10 = CFSTR("YES");
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "Delete completed { account: %@, success: %@, error: %@ }", (uint8_t *)&v11, 0x20u);
  }

}

void sub_1A4CB36C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state, char a15)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

id sub_1A4CB3730(void *a1)
{
  id v1;
  const char *v2;
  char hasPrefix;
  const char *v4;
  id *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id v9;
  id v10;

  v1 = a1;
  hasPrefix = objc_msgSend_hasPrefix_(v1, v2, (uint64_t)CFSTR("FaceTime"));
  v5 = (id *)MEMORY[0x1E0D34BA0];
  if ((hasPrefix & 1) != 0
    || (objc_msgSend_hasPrefix_(v1, v4, (uint64_t)CFSTR("iMessage")) & 1) != 0
    || (objc_msgSend_hasPrefix_(v1, v6, (uint64_t)CFSTR("Calling")) & 1) != 0
    || (v9 = v1, objc_msgSend_hasPrefix_(v1, v7, (uint64_t)CFSTR("Multiway"))))
  {
    v9 = *v5;

  }
  if (objc_msgSend_hasPrefix_(v1, v8, (uint64_t)CFSTR("com.apple")))
  {
    v10 = *v5;

    v9 = v10;
  }

  return v9;
}

id sub_1A4CB37F4(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;

  objc_msgSend_accountProperties(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("self-handle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend_count(v5, v7, v8))
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend_objectForKey_(v5, v9, (uint64_t)CFSTR("uri"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v6;
LABEL_8:

  return v10;
}

void sub_1A4CB38A4(void *a1)
{
  const char *v1;
  const char *v2;
  id v3;
  const char *v4;
  id v5;

  v5 = a1;
  objc_msgSend_accountPropertyForKey_(v5, v1, (uint64_t)CFSTR("bundleRef"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend_setAccountProperty_forKey_(v5, v4, (uint64_t)v3, CFSTR("bundleRef"));
  }
  objc_msgSend_addObject_(v3, v2, (uint64_t)CFSTR("com.apple.imcore"));

}

void sub_1A4CB4380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, os_activity_scope_state_s state,char a21)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1A4CB483C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state, char a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1A4CB488C(uint64_t a1, void *a2)
{
  id v3;
  void **WeakRetained;
  const char *v5;
  void **v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  id v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  BOOL v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 64));
  v6 = WeakRetained;
  if (!WeakRetained || !objc_msgSend_containsObject_(WeakRetained[1], v5, *(_QWORD *)(a1 + 32)))
    goto LABEL_21;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v41 = v10;
    v42 = 2112;
    v43 = v11;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Handle user notification complete: %@:%@", buf, 0x16u);
  }

  objc_msgSend_responseInformation(v3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v14, v15, *MEMORY[0x1E0D36950]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0;
    v18 = v16;
  }
  else
  {
    objc_opt_class();
    v18 = 0;
    v21 = 0;
    v22 = 0;
    v17 = v16;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
  }
  v23 = v16;
  v21 = v17;
  v22 = v18;
LABEL_9:
  if ((unint64_t)objc_msgSend_count(v21, v19, v20) >= 2)
  {
    objc_msgSend_objectAtIndex_(v21, v24, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v21, v27, 1);
LABEL_13:
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend_count(v21, v24, v25) == 1)
  {
    v26 = *(id *)(a1 + 40);
    objc_msgSend_objectAtIndex_(v21, v30, 0);
    goto LABEL_13;
  }
  if (!v22)
  {
    v26 = 0;
    v32 = 0;
    goto LABEL_15;
  }
  v26 = *(id *)(a1 + 40);
  v31 = v22;
LABEL_14:
  v32 = v31;
LABEL_15:
  v35 = objc_msgSend_response(v3, v28, v29) == 3 || objc_msgSend_response(v3, v33, v34) == 1;
  v37 = objc_msgSend_response(v3, v33, v34);
  v38 = *(_QWORD *)(a1 + 56);
  if (v38)
  {
    BYTE2(v39) = v37 == 2;
    BYTE1(v39) = 1;
    LOBYTE(v39) = v35;
    (*(void (**)(uint64_t, _QWORD, id, _QWORD, id, _QWORD, void *, _QWORD, int))(v38 + 16))(v38, *(_QWORD *)(a1 + 32), v26, *(_QWORD *)(a1 + 48), v26, 0, v32, 0, v39);
  }
  objc_msgSend_removeObject_(v6[1], v36, *(_QWORD *)(a1 + 32));

LABEL_21:
}

void sub_1A4CB5374(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 200));
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1A4CB53DC(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, __int16 a10, char a11)
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  id v29;

  v29 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  if (*(_BYTE *)(a1 + 48))
  {
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 32);
    *(_QWORD *)(v25 + 32) = 0;

  }
  v27 = *(_QWORD *)(a1 + 40);
  if (v27)
  {
    BYTE2(v28) = a11;
    LOWORD(v28) = a10;
    (*(void (**)(uint64_t, id, id, id, id, id, id, id, id, int))(v27 + 16))(v27, v29, v18, v19, v20, v21, v22, v23, v24, v28);
  }

}

void sub_1A4CB5504(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a3;
  im_primary_queue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A4CB5614;
  block[3] = &unk_1E4DDA1E8;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v20 = a2;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 72);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = *(id *)(a1 + 80);
  v10 = v5;
  dispatch_async(v6, block);

}

void sub_1A4CB5614(uint64_t a1)
{
  id v2;
  void **v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  _QWORD block[4];
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  BOOL v86;
  __int16 v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = (void **)(a1 + 40);
  sub_1A4CB37F4(*(void **)(a1 + 40), v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountProperties(*(void **)(a1 + 40), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("status"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend_warning(MEMORY[0x1E0D36AA8], v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1A4CBBA2C();

  }
  objc_msgSend_reload(*v3, v13, v14);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 56);
    v20 = *(_QWORD *)(a1 + 64);
    v21 = *(_QWORD *)(a1 + 96);
    v22 = *(_QWORD *)(a1 + 40);
    v23 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413314;
    v89 = v19;
    v90 = 2112;
    v91 = v20;
    v92 = 2112;
    v93 = v22;
    v94 = 2048;
    v95 = v21;
    v96 = 2112;
    v97 = v23;
    _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_DEFAULT, "Renewal complete for: %@  service: %@ account: %@  renewResult: %ld  error: %@", buf, 0x34u);
  }

  if ((objc_msgSend_containsObject_(*(void **)(*(_QWORD *)(a1 + 72) + 8), v24, *(_QWORD *)(a1 + 80)) & 1) != 0)
  {
    objc_msgSend__credentialForAccount_(*(void **)(a1 + 72), v25, *(_QWORD *)(a1 + 40));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_token(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_length(v2, v31, v32))
    {
      sub_1A4CAEF9C(*v3);
      v35 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v35;
    }
    if (!objc_msgSend_length(v6, v33, v34))
    {
      sub_1A4CB37F4(*v3, v36, v37);
      v38 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v38;
    }
    v39 = *(_QWORD *)(a1 + 96);
    if (v39)
    {
      v40 = v39 == 1;

      v30 = 0;
    }
    else
    {
      v40 = 0;
    }
    if (!objc_msgSend_length(v2, v36, v37))
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v41, v42);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        sub_1A4CBB9F8(v43, v44, v45, v46, v47, v48, v49, v50);

      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v51, v52);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        sub_1A4CBB98C((uint64_t *)(a1 + 40), v53, v54);

      v30 = 0;
    }
    im_primary_queue();
    v55 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A4CB5AD8;
    block[3] = &unk_1E4DDA1C0;
    v85 = *(id *)(a1 + 88);
    v78 = *(id *)(a1 + 80);
    v79 = *(id *)(a1 + 56);
    v80 = *(id *)(a1 + 64);
    v2 = v2;
    v81 = v2;
    v6 = v6;
    v82 = v6;
    v83 = v30;
    v84 = v12;
    v86 = v40;
    v87 = 1;
    v56 = v30;
    dispatch_async(v55, block);

    objc_msgSend_removeObject_(*(void **)(*(_QWORD *)(a1 + 72) + 8), v57, *(_QWORD *)(a1 + 80));
    objc_msgSend_domain(*(void **)(a1 + 48), v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_code(*(void **)(a1 + 48), v61, v62);
    FTAWDLogRegistrationRenewCredentialsCompleted();

    v63 = objc_alloc(MEMORY[0x1E0D34E50]);
    v64 = *(_QWORD *)(a1 + 96);
    objc_msgSend_domain(*(void **)(a1 + 48), v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_code(*(void **)(a1 + 48), v68, v69);
    v72 = (void *)objc_msgSend_initWithRenewResult_errorDomain_errorCode_(v63, v71, v64, v67, v70);

    objc_msgSend_defaultLogger(MEMORY[0x1E0D34CF0], v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logMetric_(v75, v76, (uint64_t)v72);

  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v27, OS_LOG_TYPE_DEFAULT, "  => Cancelled, bailing", buf, 2u);
    }
  }

}

uint64_t sub_1A4CB5AD8(uint64_t a1)
{
  int v2;

  *(_WORD *)((char *)&v2 + 1) = *(_WORD *)(a1 + 97);
  LOBYTE(v2) = *(_BYTE *)(a1 + 96);
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))(*(_QWORD *)(a1 + 88) + 16))(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 80), v2);
}

void sub_1A4CB5B24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Completed verify credentials", buf, 2u);
  }

  im_primary_queue();
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1A4CB5CCC;
  v14[3] = &unk_1E4DDA288;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = v6;
  v11 = *(void **)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = v11;
  v21 = v5;
  v24 = *(id *)(a1 + 88);
  v22 = *(id *)(a1 + 72);
  v23 = *(id *)(a1 + 80);
  v26 = *(_BYTE *)(a1 + 104);
  v25 = *(id *)(a1 + 96);
  v12 = v5;
  v13 = v6;
  dispatch_async(v10, v14);

}

void sub_1A4CB5CCC(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  id v64;
  const char *v65;
  NSObject *v66;
  NSObject *v67;
  _QWORD block[4];
  id v69;
  id v70;
  id v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  NSObject *v81;
  uint8_t buf[4];
  NSObject *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(NSObject **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    v83 = v5;
    v84 = 2112;
    v85 = v6;
    v86 = 2112;
    v87 = v7;
    v88 = 2112;
    v89 = v8;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Verification complete for: %@  service: %@ account: %@  error: %@", buf, 0x2Au);
  }

  v11 = (_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend_warning(MEMORY[0x1E0D36AA8], v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1A4CBBC4C();

  }
  if ((objc_msgSend_containsObject_(*(void **)(*(_QWORD *)(a1 + 64) + 8), v9, *(_QWORD *)(a1 + 72)) & 1) != 0)
  {
    if (!*v11 && !*(_QWORD *)(a1 + 80))
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1A4CBBBE4();

    }
    v16 = *(void **)(a1 + 80);
    if (v16)
    {
      v19 = v16;
      goto LABEL_18;
    }
    v19 = *(id *)(a1 + 48);
    if (v19)
    {
LABEL_18:
      if (*v11)
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v17, v18);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(NSObject **)(a1 + 56);
          v22 = *(_QWORD *)(a1 + 88);
          *(_DWORD *)buf = 138412546;
          v83 = v21;
          v84 = 2112;
          v85 = v22;
          _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "   Verification failed with error: %@, starting renew for service: %@", buf, 0x16u);
        }

        objc_msgSend_setCredential_(v19, v23, 0);
        objc_msgSend__renewCredentialsIfPossibleForAccount_username_inServiceIdentifier_originalInServiceIdentifier_serviceName_failIfNotSilent_renewHandler_shortCircuitCompletionBlock_(*(void **)(a1 + 64), v24, (uint64_t)v19, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 104));
      }
      else
      {
        objc_msgSend__credentialForAccount_(*(void **)(a1 + 64), v17, (uint64_t)v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_token(v25, v26, v27);
        v28 = objc_claimAutoreleasedReturnValue();
        sub_1A4CAEF9C(v19);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1A4CB37F4(v19, v30, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v33, v34);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v19;
          _os_log_impl(&dword_1A4C7F000, v35, OS_LOG_TYPE_DEFAULT, "Verification succeeded for account: %@", buf, 0xCu);
        }

        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v36, v37);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v28;
          _os_log_impl(&dword_1A4C7F000, v38, OS_LOG_TYPE_DEFAULT, "     => Token: %@", buf, 0xCu);
        }

        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v39, v40);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v32;
          _os_log_impl(&dword_1A4C7F000, v41, OS_LOG_TYPE_DEFAULT, "    => SelfID: %@", buf, 0xCu);
        }

        if (!objc_msgSend_length(v29, v42, v43))
        {
          objc_msgSend_warning(MEMORY[0x1E0D36AA8], v44, v45);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            sub_1A4CBB9F8(v46, v47, v48, v49, v50, v51, v52, v53);

          objc_msgSend_warning(MEMORY[0x1E0D36AA8], v54, v55);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            sub_1A4CBBB80();

          objc_msgSend_warning(MEMORY[0x1E0D36AA8], v57, v58);
          v59 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR))
            sub_1A4CBBAFC(v19, v59, v60);

          v28 = 0;
        }
        im_primary_queue();
        v61 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1A4CB6354;
        block[3] = &unk_1E4DDA260;
        v76 = *(id *)(a1 + 104);
        v69 = *(id *)(a1 + 72);
        v70 = *(id *)(a1 + 32);
        v71 = *(id *)(a1 + 40);
        v72 = v29;
        v73 = v32;
        v74 = v28;
        v75 = v19;
        v19 = v19;
        v62 = v28;
        v63 = v32;
        v64 = v29;
        dispatch_async(v61, block);

        objc_msgSend_removeObject_(*(void **)(*(_QWORD *)(a1 + 64) + 8), v65, *(_QWORD *)(a1 + 72));
      }
      goto LABEL_40;
    }
    objc_msgSend_warning(MEMORY[0x1E0D36AA8], v17, v18);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      sub_1A4CBBA94();

    im_primary_queue();
    v67 = objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = sub_1A4CB6308;
    v77[3] = &unk_1E4DDA238;
    v81 = *(id *)(a1 + 104);
    v78 = *(id *)(a1 + 72);
    v79 = *(id *)(a1 + 32);
    v80 = *(id *)(a1 + 40);
    dispatch_async(v67, v77);

    v19 = v81;
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v19, OS_LOG_TYPE_DEFAULT, "  => Cancelled, bailing", buf, 2u);
    }
  }
LABEL_40:

}

uint64_t sub_1A4CB6308(_QWORD *a1)
{
  int v2;

  BYTE2(v2) = 0;
  LOWORD(v2) = 256;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0, 0, 0, 0, 0, v2);
}

void sub_1A4CB6354(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  int v12;
  id v13;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 88);
  objc_msgSend_accountPropertyForKey_(*(void **)(a1 + 80), a2, *MEMORY[0x1E0D34410]);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountPropertyForKey_(*(void **)(a1 + 80), v10, *MEMORY[0x1E0D34420]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v12) = 0;
  LOWORD(v12) = 256;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *, int))(v9 + 16))(v9, v3, v4, v5, v6, v7, v8, v13, v11, v12);

}

void sub_1A4CB6D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state, char a15)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1A4CB7D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, char a17)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1A4CB917C(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  int isEqualToIgnoringCase;
  uint64_t v8;
  void *v9;

  sub_1A4CAEF9C(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_profileID(*(void **)(*(_QWORD *)(a1 + 40) + 32), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v2, v6, (uint64_t)v5);

  if (isEqualToIgnoringCase)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

  }
}

void sub_1A4CB9290(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  int isEqualToIgnoringCase;
  uint64_t v8;
  void *v9;

  sub_1A4CAEF9C(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_profileID(*(void **)(*(_QWORD *)(a1 + 40) + 32), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v2, v6, (uint64_t)v5);

  if (isEqualToIgnoringCase)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

  }
}

CFTypeRef sub_1A4CB9358()
{
  CFTypeRef result;

  result = *(CFTypeRef *)MEMORY[0x1A85A5DEC]("ACAccountTypeIdentifierIdentityServices", CFSTR("Accounts"));
  qword_1ECF9D6D0 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef sub_1A4CB9394()
{
  CFTypeRef result;

  result = *(CFTypeRef *)MEMORY[0x1A85A5DEC]("ACAccountTypeIdentifierGameCenter", CFSTR("Accounts"));
  qword_1ECF9D710 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef sub_1A4CB93D0()
{
  CFTypeRef result;

  result = *(CFTypeRef *)MEMORY[0x1A85A5DEC]("ACAccountTypeIdentifierIDMS", CFSTR("Accounts"));
  qword_1EE788A88 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef sub_1A4CB940C()
{
  CFTypeRef result;

  result = *(CFTypeRef *)MEMORY[0x1A85A5DEC]("kACRenewCredentialsShouldForceKey", CFSTR("Accounts"));
  qword_1EE788AA8 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef sub_1A4CB9448()
{
  CFTypeRef result;

  result = *(CFTypeRef *)MEMORY[0x1A85A5DEC]("kACRenewCredentialsReasonStringKey", CFSTR("Accounts"));
  qword_1EE788AA0 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef sub_1A4CB9484()
{
  CFTypeRef result;

  result = *(CFTypeRef *)MEMORY[0x1A85A5DEC]("kACRenewCredentialsAppleIDServiceTypeKey", CFSTR("Accounts"));
  qword_1EE788A90 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef sub_1A4CB94C0()
{
  CFTypeRef result;

  result = *(CFTypeRef *)MEMORY[0x1A85A5DEC]("kACRenewCredentialsProxiedAppBundleIDKey", CFSTR("Accounts"));
  qword_1EE788A98 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef sub_1A4CB94FC()
{
  CFTypeRef result;

  result = *(CFTypeRef *)MEMORY[0x1A85A5DEC]("kACRenewCredentialsShouldAvoidUIKey", CFSTR("Accounts"));
  qword_1EE788B58 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

void sub_1A4CB9538(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], a2, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/IMDaemonCore.framework"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1EE788B68;
  qword_1EE788B68 = v2;

}

void sub_1A4CB958C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1A4CB95C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1A4CB9D50(uint64_t a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v1 = (void *)sub_1A4C86558(a1);
  objc_msgSend_allKeys(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A4C8654C();
  sub_1A4C86504(&dword_1A4C7F000, v5, v6, "   result dictionary: %@", v7, v8, v9, v10, v11);

  sub_1A4C86540();
}

void sub_1A4CB9DC8(uint64_t a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v1 = (void *)sub_1A4C86558(a1);
  objc_msgSend_userIDArray(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A4C8654C();
  sub_1A4C86504(&dword_1A4C7F000, v5, v6, "   Multiple signatures for: %@", v7, v8, v9, v10, v11);

  sub_1A4C86540();
}

void sub_1A4CB9E40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C86534();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CB9EC4(uint64_t a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v1 = (void *)sub_1A4C86558(a1);
  objc_msgSend_userIDArray(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A4C8654C();
  sub_1A4C86504(&dword_1A4C7F000, v5, v6, "   Single signing for: %@", v7, v8, v9, v10, v11);

  sub_1A4C86540();
}

void sub_1A4CB9F3C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1A4C7F000, a2, OS_LOG_TYPE_DEBUG, "Signing message: %@", (uint8_t *)&v3, 0xCu);
  sub_1A4C8652C();
}

void sub_1A4CB9FB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1A4C86518();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_1A4C8652C();
}

void sub_1A4CBA024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C86534();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBA0A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C86534();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBA12C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C86534();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBA1B0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A4C7F000, log, OS_LOG_TYPE_FAULT, "Failed to weak link APSSignDataWithIdentityRequest", v1, 2u);
}

void sub_1A4CBA1F0()
{
  int v0;
  const __CFString *v1;
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = 138412546;
  v1 = CFSTR("sigs");
  v2 = 2080;
  v3 = "dictionary";
  _os_log_error_impl(&dword_1A4C7F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1A4CBA288(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A4C7F000, a2, OS_LOG_TYPE_ERROR, "Failed verifying signature with error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1A4CBA300()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sub_1A4C8654C();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_1A4C7F000, v1, OS_LOG_TYPE_FAULT, "Failed to create CoreTelephonyClient object! { self: %@, coreTelephonyClient: %@ }", v2, 0x16u);
  sub_1A4C8652C();
}

void sub_1A4CBA380()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1A4C8654C();
  _os_log_error_impl(&dword_1A4C7F000, v0, OS_LOG_TYPE_ERROR, "Unable to read SIM status { simStatusError: %@ }", v1, 0xCu);
  sub_1A4C8652C();
}

void sub_1A4CBA3EC()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4C8F9B8();
  sub_1A4C8F994(&dword_1A4C7F000, v0, v1, "Failed to request phone number registration state from telephony -- returning nil { error: %@, context: %@ }");
  sub_1A4C8652C();
}

void sub_1A4CBA44C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C8F9A8(&dword_1A4C7F000, v0, v1, "No value found for telephony network key { key: %@ }", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBA4AC()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4C8F9B8();
  sub_1A4C8F994(&dword_1A4C7F000, v0, v1, "Failure checking isPNRSupported -- falling back { error: %@, subscription: %@ }");
  sub_1A4C8652C();
}

void sub_1A4CBA50C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C8F9A8(&dword_1A4C7F000, v0, v1, "Selected subscription to check isPNRSupported { selectedSubscription: %@ }", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBA56C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBA5EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBA66C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBA6EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C92844(&dword_1A4C7F000, v0, v1, "Unable to get dual SIM capability { dualSIMError: %@ }", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBA74C()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sub_1A4C8654C();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1A4C7F000, v1, OS_LOG_TYPE_DEBUG, "No valid subscriptions found { subscriptionInfo: %@, subscriptions: %@ }", v2, 0x16u);
  sub_1A4C8652C();
}

void sub_1A4CBA7C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C92844(&dword_1A4C7F000, v0, v1, "Failed to fetch subscriptions { error: %@ }", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBA828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C92844(&dword_1A4C7F000, v0, v1, "Failed to fetch active contexts { error: %@ }", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBA888(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A4C92854(&dword_1A4C7F000, a1, a3, "Unable to determine user-selected subscription due to missing coreTelephonyClient instance!", a5, a6, a7, a8, 0);
  sub_1A4C92864();
}

void sub_1A4CBA8B8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4C7F000, log, OS_LOG_TYPE_DEBUG, "No subscription found to return selected registration phone number", v1, 2u);
  sub_1A4C92864();
}

void sub_1A4CBA8F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C92844(&dword_1A4C7F000, v0, v1, "No phone number info found to return selected registration phone number { error: %@ }", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBA954()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1A4C8654C();
  _os_log_debug_impl(&dword_1A4C7F000, v0, OS_LOG_TYPE_DEBUG, "Loaded phone number info { phoneNumberInfo: %@ }", v1, 0xCu);
  sub_1A4C8652C();
}

void sub_1A4CBA9C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A4C92854(&dword_1A4C7F000, a1, a3, "_CTServerConnectionIsEmergencyNumber - could not connect to CT.", a5, a6, a7, a8, 0);
  sub_1A4C92864();
}

void sub_1A4CBA9F0(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 2048;
  v5 = a1 >> 32;
  _os_log_error_impl(&dword_1A4C7F000, log, OS_LOG_TYPE_ERROR, "_CTServerConnectionIsEmergencyNumber - encountered error %d %ld", (uint8_t *)v3, 0x12u);
  sub_1A4C8652C();
}

void sub_1A4CBAA74()
{
  int v0;
  const __CFString *v1;
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = 138412546;
  v1 = CFSTR("v");
  v2 = 2080;
  v3 = "dictionary";
  _os_log_error_impl(&dword_1A4C7F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1A4CBAB0C(void *a1)
{

  objc_end_catch();
}

void sub_1A4CBAB2C(void *a1)
{

  objc_end_catch();
}

void sub_1A4CBAB48(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4C7F000, a2, OS_LOG_TYPE_ERROR, "**** Server sent status code header codes to refresh the bag (Interval: %d), reloading IDS and iMessage bags ****", (uint8_t *)v2, 8u);
  sub_1A4C92864();
}

void sub_1A4CBABB8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4C7F000, log, OS_LOG_TYPE_ERROR, "**** Server sent status code header codes to refresh the bag, reloading IDS and iMessage bags ****", v1, 2u);
  sub_1A4C92864();
}

void sub_1A4CBABF4()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1A4C9E564();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Eu);
}

void sub_1A4CBAC88()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1A4C8654C();
  sub_1A4C9E564();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
  sub_1A4C8652C();
}

void sub_1A4CBAD00(int *a1, void **a2, NSObject *a3)
{
  int v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  objc_msgSend_domain(*a2, (const char *)a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_code(*a2, v7, v8);
  objc_msgSend_localizedDescription(*a2, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userInfo(*a2, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v15, v16, *MEMORY[0x1E0CB3300]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 67110146;
  v18[1] = v5;
  v19 = 2112;
  v20 = v6;
  v21 = 1024;
  v22 = v9;
  v23 = 2112;
  v24 = v12;
  v25 = 2112;
  v26 = v17;
  _os_log_error_impl(&dword_1A4C7F000, a3, OS_LOG_TYPE_ERROR, "FTMessageDelivery failed! (HTTP Status Code: %d) Error (%@:%d): %@ %@", (uint8_t *)v18, 0x2Cu);

}

void sub_1A4CBAE34()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1A4C8654C();
  _os_log_fault_impl(&dword_1A4C7F000, v0, OS_LOG_TYPE_FAULT, "Failed to parse x-apple-server-time %@", v1, 0xCu);
  sub_1A4C8652C();
}

void sub_1A4CBAEA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C92844(&dword_1A4C7F000, v0, v1, "Result parse error: %@", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBAF00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C92844(&dword_1A4C7F000, v0, v1, "%@ Message not being delivered, network is unavailable, can attempt stewie", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBAF60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C92844(&dword_1A4C7F000, v0, v1, "%@ Message not being delivered, vm traffic is disable", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBAFC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C92844(&dword_1A4C7F000, v0, v1, "%@ Message not being delivered, airplane mode is enabled", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBB020()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_1A4C8654C();
  sub_1A4C9E564();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
  sub_1A4C8652C();
}

void sub_1A4CBB094(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A4C7F000, log, OS_LOG_TYPE_FAULT, "Gave up, too many attempts", v1, 2u);
  sub_1A4C92864();
}

void sub_1A4CBB0D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBB150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBB1D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBB250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBB2D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBB350(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1A4C7F000, log, OS_LOG_TYPE_FAULT, "Server Bag provided us with a retry interval of %f ", (uint8_t *)&v3, 0x16u);
  sub_1A4C8652C();
}

void sub_1A4CBB3D0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4C7F000, log, OS_LOG_TYPE_ERROR, "Message not being delivered, vm traffic is disable", v1, 2u);
}

void sub_1A4CBB410(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A4C7F000, a2, OS_LOG_TYPE_ERROR, "Message not being delivered, missing some required keys: %@", (uint8_t *)&v2, 0xCu);
  sub_1A4C8652C();
}

void sub_1A4CBB480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBB500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1A4C9010C();
  sub_1A4C864F4(&dword_1A4C7F000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
  sub_1A4C8652C();
}

void sub_1A4CBB580()
{
  int v0;
  const __CFString *v1;
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = 138412546;
  v1 = CFSTR("x-protocol-version");
  v2 = 2080;
  v3 = "dictionary";
  _os_log_error_impl(&dword_1A4C7F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1A4CBB618()
{
  int v0;
  const __CFString *v1;
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = 138412546;
  v1 = CFSTR("accept-language");
  v2 = 2080;
  v3 = "dictionary";
  _os_log_error_impl(&dword_1A4C7F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1A4CBB6B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C8F9A8(&dword_1A4C7F000, v0, v1, "Checking keychain with prefixed username %@", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBB710()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1A4C8F9B8();
  _os_log_debug_impl(&dword_1A4C7F000, v0, OS_LOG_TYPE_DEBUG, "Invalid username %@ or account %@", v1, 0x16u);
  sub_1A4C8652C();
}

void sub_1A4CBB780()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4CB95CC();
  sub_1A4CB956C();
  sub_1A4CB958C(&dword_1A4C7F000, v0, v1, "Failed to request account type from identifier { typeIdentifierIDS: %@, accountType: %@, accountTypeError: %@ }");
  sub_1A4CB95B8();
}

void sub_1A4CBB7E8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  sub_1A4C8F994(&dword_1A4C7F000, a2, a3, "Failed saving account %@ with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_1A4C8652C();
}

void sub_1A4CBB85C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4CB95CC();
  sub_1A4CB956C();
  sub_1A4CB958C(&dword_1A4C7F000, v0, v1, "Failed to request account type from identifier { typeIdentifierIDS: %@, accountType: %@, accountTypeError: %@ }");
  sub_1A4CB95B8();
}

void sub_1A4CBB8C4()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4CB95CC();
  sub_1A4CB956C();
  sub_1A4CB958C(&dword_1A4C7F000, v0, v1, "Failed to request account type from identifier { typeIdentifierIDS: %@, accountType: %@, accountTypeError: %@ }");
  sub_1A4CB95B8();
}

void sub_1A4CBB92C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4C8F9B8();
  sub_1A4C8F994(&dword_1A4C7F000, v0, v1, "Failed saving account %@ with error: %@");
  sub_1A4C8652C();
}

void sub_1A4CBB98C(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  sub_1A4CB95C0(&dword_1A4C7F000, a2, a3, "*** Account: %@", (uint8_t *)&v4);
  sub_1A4C8652C();
}

void sub_1A4CBB9F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A4C92854(&dword_1A4C7F000, a1, a3, "*** Empty profile ID handed back during token gathering, please file a radar", a5, a6, a7, a8, 0);
}

void sub_1A4CBBA2C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4CB95A0();
  sub_1A4C8F994(&dword_1A4C7F000, v0, v1, "Failed renewing account %@ with error: %@");
  sub_1A4C8652C();
}

void sub_1A4CBBA94()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4CB95A0();
  sub_1A4C8F994(&dword_1A4C7F000, v0, v1, "*** No account found to use for renewal, please file a radar (input: %@  output: %@)");
  sub_1A4C8652C();
}

void sub_1A4CBBAFC(void *a1, char *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend_accountProperties(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A4C8654C();
  sub_1A4CB95C0(&dword_1A4C7F000, a2, v5, "*** Account properties: %@", v6);

  sub_1A4CB95B8();
}

void sub_1A4CBBB80()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1A4C8654C();
  sub_1A4CB95C0(&dword_1A4C7F000, v0, v1, "*** Account: %@", v2);
  sub_1A4C8652C();
}

void sub_1A4CBBBE4()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4CB95A0();
  sub_1A4C8F994(&dword_1A4C7F000, v0, v1, "*** No error reported for account verification, but verified account is nil, please file a radar (input: %@  output: %@)");
  sub_1A4C8652C();
}

void sub_1A4CBBC4C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1A4CB95A0();
  sub_1A4C8F994(&dword_1A4C7F000, v0, v1, "Failed verifying account %@ with error: %@");
  sub_1A4C8652C();
}

void sub_1A4CBBCB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A4C8654C();
  sub_1A4C8F9A8(&dword_1A4C7F000, v0, v1, "Assigning credential: %@", v2, v3, v4, v5, v6);
  sub_1A4C8652C();
}

void sub_1A4CBBD14()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_1A4C8F9B8();
  _os_log_fault_impl(&dword_1A4C7F000, v0, OS_LOG_TYPE_FAULT, "Failed saving account %@ with error: %@", v1, 0x16u);
  sub_1A4C8652C();
}

void sub_1A4CBBD84(os_log_t log)
{
  int v1;
  const __CFString *v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 138412546;
  v2 = CFSTR("FTPasswordManager");
  v3 = 2080;
  v4 = "-[FTPasswordManager acAccountWithProfileID:username:accountStore:]";
  _os_log_error_impl(&dword_1A4C7F000, log, OS_LOG_TYPE_ERROR, "%@ - %s: invalid arguments!", (uint8_t *)&v1, 0x16u);
  sub_1A4C8652C();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
  MEMORY[0x1E0C988E8](center, name, object, userInfo, options);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

uint64_t CTSettingCopyMyPhoneNumber()
{
  return MEMORY[0x1E0CA6CB0]();
}

uint64_t FTAWDLogRegistrationRenewCredentialsCompleted()
{
  return MEMORY[0x1E0D20BD8]();
}

uint64_t IDSAuthenticationDelegateUpdateTimeOfLastRequestPost()
{
  return MEMORY[0x1E0D34428]();
}

uint64_t IDSIsVirtualMachine()
{
  return MEMORY[0x1E0D348A8]();
}

uint64_t IDSLoggableDescriptionForObjectOnService()
{
  return MEMORY[0x1E0D348D8]();
}

uint64_t IDSPEMFormatCertificatesForPushHeader()
{
  return MEMORY[0x1E0D34A50]();
}

uint64_t IMCanonicalFormForEmail()
{
  return MEMORY[0x1E0D36340]();
}

uint64_t IMCopyURLEscapedString()
{
  return MEMORY[0x1E0D36390]();
}

uint64_t IMCurrentPreferredLanguage()
{
  return MEMORY[0x1E0D363C8]();
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x1E0D36400]();
}

uint64_t IMGenerateLoginID()
{
  return MEMORY[0x1E0D36488]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x1E0D36498]();
}

uint64_t IMGetAppIntForKey()
{
  return MEMORY[0x1E0D364A0]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x1E0D364B8]();
}

uint64_t IMGetConferenceSettings()
{
  return MEMORY[0x1E0D364E0]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x1E0D364E8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x1E0D36500]();
}

uint64_t IMGetKeychainAuthToken()
{
  return MEMORY[0x1E0D36510]();
}

uint64_t IMGetKeychainPassword()
{
  return MEMORY[0x1E0D36528]();
}

uint64_t IMGetMainBundleIdentifier()
{
  return MEMORY[0x1E0D36530]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x1E0D365E0]();
}

uint64_t IMLocalizedStringFromTableInBundle()
{
  return MEMORY[0x1E0D36600]();
}

uint64_t IMLogSimulateCrashForProcess()
{
  return MEMORY[0x1E0D36630]();
}

uint64_t IMLogString()
{
  return MEMORY[0x1E0D36640]();
}

uint64_t IMRemoveAppValueForKey()
{
  return MEMORY[0x1E0D367A8]();
}

uint64_t IMSetAppValueForKey()
{
  return MEMORY[0x1E0D367F0]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x1E0D367F8]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x1E0D36808]();
}

uint64_t IMSetKeychainAuthToken()
{
  return MEMORY[0x1E0D36810]();
}

uint64_t IMSetKeychainPassword()
{
  return MEMORY[0x1E0D36820]();
}

uint64_t IMShouldLog()
{
  return MEMORY[0x1E0D36830]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x1E0D36838]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1E0D36868]();
}

uint64_t IMStringIsInHardcodedEmergencyNumberSet()
{
  return MEMORY[0x1E0D36888]();
}

uint64_t IMUserScopedNotification()
{
  return MEMORY[0x1E0D36960]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1E0D36970]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1E0D36978]();
}

uint64_t JWUUIDPushObjectToString()
{
  return MEMORY[0x1E0D369F8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1E0DE2BA8]();
}

uint64_t MarcoLog()
{
  return MEMORY[0x1E0D47410]();
}

uint64_t MarcoNoteCheckpoint()
{
  return MEMORY[0x1E0D47428]();
}

uint64_t MarcoShouldLog()
{
  return MEMORY[0x1E0D47430]();
}

uint64_t MarcoShouldLogCheckpoints()
{
  return MEMORY[0x1E0D47438]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x1E0D36B28]();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x1E0CE8738](store, nameEncoding);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6390](key, algorithm, dataToSign, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

uint64_t SecureRandomBytes()
{
  return MEMORY[0x1E0D36B48]();
}

uint64_t VTCopyHEVCDecoderCapabilitiesDictionary()
{
  return MEMORY[0x1E0CEC9B8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLRequestSetProtocolProperty()
{
  return MEMORY[0x1E0C92F68]();
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x1E0CA6E80]();
}

uint64_t _CTServerConnectionCopySystemCapabilities()
{
  return MEMORY[0x1E0CA6F00]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1E0CA6F18]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1E0CA6F30]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1E0CA6F40]();
}

uint64_t _CTServerConnectionGetCarrierEntitlements()
{
  return MEMORY[0x1E0CA6F78]();
}

uint64_t _CTServerConnectionGetCommCenterInitializationState()
{
  return MEMORY[0x1E0CA6F98]();
}

uint64_t _CTServerConnectionIsEmergencyNumber()
{
  return MEMORY[0x1E0CA6FF8]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1E0CA7030]();
}

uint64_t _CTServerConnectionSetCellularUsagePolicy()
{
  return MEMORY[0x1E0CA7068]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1E0CA7078]();
}

uint64_t _CTServerConnectionVerifyCarrierEntitlements()
{
  return MEMORY[0x1E0CA70A8]();
}

uint64_t _IDSAreIDsEquivalent()
{
  return MEMORY[0x1E0D34ED0]();
}

uint64_t _IDSIDProtocolVersionNumber()
{
  return MEMORY[0x1E0D34F30]();
}

uint64_t _IDSLogTransport()
{
  return MEMORY[0x1E0D34F78]();
}

uint64_t _IDSLogV()
{
  return MEMORY[0x1E0D34F80]();
}

uint64_t _IDSShouldLog()
{
  return MEMORY[0x1E0D34FB0]();
}

uint64_t _IDSWarnV()
{
  return MEMORY[0x1E0D34FD8]();
}

uint64_t _IDSWebTunnelServiceVersionNumber()
{
  return MEMORY[0x1E0D34FE0]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x1E0D36B60]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x1E0D36BB0]();
}

uint64_t _UIStringForIDSRegistrationServiceType()
{
  return MEMORY[0x1E0D34FF0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint64_t cut_arc_os_release()
{
  return MEMORY[0x1E0D13248]();
}

uint64_t cut_dispatch_log_queue()
{
  return MEMORY[0x1E0D13250]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t im_dispatch_after_primary_queue()
{
  return MEMORY[0x1E0D36BC0]();
}

uint64_t im_dispatch_async_with_timeout()
{
  return MEMORY[0x1E0D36BC8]();
}

uint64_t im_primary_queue()
{
  return MEMORY[0x1E0D36BF0]();
}

uint64_t jw_uuid_to_data()
{
  return MEMORY[0x1E0D36BF8]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint64_t network_usage_policy_create_client()
{
  return MEMORY[0x1E0DE55E8]();
}

uint64_t network_usage_policy_get_WiFi_data_allowed_from_policy()
{
  return MEMORY[0x1E0DE5600]();
}

uint64_t network_usage_policy_get_cell_data_allowed_from_policy()
{
  return MEMORY[0x1E0DE5610]();
}

uint64_t network_usage_policy_get_first_use_flow_performed_from_policy()
{
  return MEMORY[0x1E0DE5618]();
}

uint64_t network_usage_policy_get_for_bundle()
{
  return MEMORY[0x1E0DE5620]();
}

uint64_t network_usage_policy_set_changed_handler()
{
  return MEMORY[0x1E0DE5628]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x1E0C84768]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t perform_first_network_use_flow()
{
  return MEMORY[0x1E0DE5630]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E50](xarray, index);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

