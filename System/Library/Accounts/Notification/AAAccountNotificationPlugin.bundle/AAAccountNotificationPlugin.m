void sub_230EA555C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_230EA5578(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_230EA5588(uint64_t a1)
{

}

void sub_230EA5590(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_230EA58A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;

  objc_msgSend_urlConfiguration(AASetupAssistantService, a2, a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_230EA5988(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v7 = objc_alloc(MEMORY[0x24BE04A20]);
  v8 = *(uint64_t **)(a1 + 32);
  if (v2)
  {
    v9 = (void *)objc_msgSend_initWithAccount_(v7, v3, v8[5], v5, v6);
    v10 = objc_alloc(MEMORY[0x24BE04970]);
    v14 = (void *)objc_msgSend_initWithAccount_(v10, v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v12, v13);
    objc_msgSend_addProvisioningInfoToAARequest_(v14, v15, (uint64_t)v9, v16, v17);
  }
  else
  {
    objc_msgSend_appleID(v8, v3, v4, v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_password(*(void **)(a1 + 32), v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend_initWithUsername_password_(v7, v23, (uint64_t)v14, (uint64_t)v22, v24);

  }
  objc_msgSend_setCookieStorage_(v9, v25, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v26, v27);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = sub_230EA5AA4;
  v31[3] = &unk_24FF9D040;
  v32 = *(id *)(a1 + 40);
  objc_msgSend_performRequestWithHandler_(v9, v28, (uint64_t)v31, v29, v30);

}

void sub_230EA5AA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_230EA5B38;
  v6[3] = &unk_24FF9D018;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void sub_230EA5B38(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend_error(v6, a2, a3, a4, a5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (id)v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_230EA5C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4, a6);
  return result;
}

void sub_230EA5D3C(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;

  v6 = (void *)objc_msgSend_mutableCopy(a1[4], a2, a3, a4, a5);
  objc_msgSend_appleID(a1[5], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("apple-id"), v13);

  objc_msgSend_password(a1[5], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v19, (uint64_t)v18, (uint64_t)CFSTR("password"), v20);

  objc_msgSend_appleIDClientIdentifier(MEMORY[0x24BE04958], v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v26, (uint64_t)v25, (uint64_t)CFSTR("client-id"), v27);

  v28 = objc_alloc(MEMORY[0x24BE04A30]);
  v29 = a1[5];
  v30 = v29[5];
  objc_msgSend__signingSession(v29, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_initWithAccount_withAppleIDParameters_signingSession_(v28, v36, v30, (uint64_t)v6, (uint64_t)v35);

  v42 = (void *)*((_QWORD *)a1[5] + 5);
  if (v42)
  {
    objc_msgSend_aa_personID(v42, v38, v39, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = objc_alloc(MEMORY[0x24BE04970]);
      v48 = (void *)objc_msgSend_initWithAccount_(v44, v45, *((_QWORD *)a1[5] + 5), v46, v47);
      objc_msgSend_addProvisioningInfoToAARequest_(v48, v49, (uint64_t)v37, v50, v51);

    }
  }
  objc_msgSend_setCookieStorage_(v37, v38, *((_QWORD *)a1[5] + 6), v40, v41);
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = sub_230EA5EE4;
  v55[3] = &unk_24FF9D040;
  v56 = a1[6];
  objc_msgSend_performRequestWithHandler_(v37, v52, (uint64_t)v55, v53, v54);

}

void sub_230EA5EE4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  _DWORD v63[2];
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_statusCode(v6, v8, v9, v10, v11) != 401)
  {
    if (!v6)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v13 = v7;
      goto LABEL_13;
    }
    v17 = v6;
    objc_msgSend_status(v17, v18, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22
      && (v27 = (void *)v22,
          objc_msgSend_status(v17, v23, v24, v25, v26),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend_intValue(v28, v29, v30, v31, v32),
          v28,
          v27,
          !v33))
    {
      objc_msgSend_personID(v17, v23, v24, v25, v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appleID(v17, v58, v59, v60, v61);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
    }
    else
    {
      objc_msgSend_statusMessage(v17, v23, v24, v25, v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v34, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_statusMessage(v17, v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v38, v44, (uint64_t)v43, *MEMORY[0x24BDD0FC8], v45);

        v46 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend_status(v17, v47, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend_intValue(v51, v52, v53, v54, v55);
        objc_msgSend_errorWithDomain_code_userInfo_(v46, v57, (uint64_t)CFSTR("com.apple.appleaccount"), v56, (uint64_t)v38);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = 0;
        v15 = 0;
        v16 = 0;
        goto LABEL_12;
      }
      v14 = 0;
      v16 = 0;
    }
    v13 = v7;
    goto LABEL_12;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v12, (uint64_t)CFSTR("com.apple.appleaccount"), 401, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = v7;
LABEL_12:

LABEL_13:
  _AALogSystem();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63[0] = 67109378;
    v63[1] = v16;
    v64 = 2112;
    v65 = v13;
    _os_log_impl(&dword_230EA3000, v62, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v63, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230EA627C(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  id v42;
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
  _QWORD v53[4];
  id v54;

  v6 = (void *)objc_msgSend_mutableCopy(a1[4], a2, a3, a4, a5);
  objc_msgSend_appleID(a1[5], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("apple-id"), v13);

  objc_msgSend_password(a1[5], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v19, (uint64_t)v18, (uint64_t)CFSTR("password"), v20);

  objc_msgSend_appleIDClientIdentifier(MEMORY[0x24BE04958], v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v6, v26, (uint64_t)v25, (uint64_t)CFSTR("client-id"), v27);

  v28 = objc_alloc(MEMORY[0x24BE04A50]);
  v29 = a1[5];
  v30 = v29[5];
  objc_msgSend__signingSession(v29, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_initWithAccount_withAppleIDParameters_signingSession_(v28, v36, v30, (uint64_t)v6, (uint64_t)v35);

  v41 = a1[5];
  if (v41[5])
  {
    v42 = objc_alloc(MEMORY[0x24BE04970]);
    v46 = (void *)objc_msgSend_initWithAccount_(v42, v43, *((_QWORD *)a1[5] + 5), v44, v45);
    objc_msgSend_addProvisioningInfoToAARequest_(v46, v47, (uint64_t)v37, v48, v49);

    v41 = a1[5];
  }
  objc_msgSend_setCookieStorage_(v37, v38, v41[6], v39, v40);
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = sub_230EA6410;
  v53[3] = &unk_24FF9D040;
  v54 = a1[6];
  objc_msgSend_performRequestWithHandler_(v37, v50, (uint64_t)v53, v51, v52);

}

void sub_230EA6410(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  const char *v52;
  void *v53;
  void *v54;
  int v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  _DWORD v61[2];
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v54 = 0;
    v28 = 0;
    v55 = 0;
    v53 = v9;
    goto LABEL_11;
  }
  v11 = v8;
  objc_msgSend_status(v11, v12, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v21 = (void *)v16;
    objc_msgSend_status(v11, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_intValue(v22, v23, v24, v25, v26);

    if (!v27)
    {
      objc_msgSend_personID(v11, v17, v18, v19, v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appleID(v11, v56, v57, v58, v59);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend_statusMessage(v11, v17, v18, v19, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v54 = 0;
    v55 = 0;
LABEL_9:
    v53 = v10;
    goto LABEL_10;
  }
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusMessage(v11, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v33, v39, (uint64_t)v38, *MEMORY[0x24BDD0FC8], v40);

  v41 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend_status(v11, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_intValue(v46, v47, v48, v49, v50);
  objc_msgSend_errorWithDomain_code_userInfo_(v41, v52, (uint64_t)CFSTR("com.apple.appleaccount"), v51, (uint64_t)v33);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0;
  v28 = 0;
  v55 = 0;
LABEL_10:

LABEL_11:
  _AALogSystem();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61[0] = 67109378;
    v61[1] = v55;
    v62 = 2112;
    v63 = v53;
    _os_log_impl(&dword_230EA3000, v60, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v61, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230EA6774(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_setValue_forKey_(v2, v3, *(_QWORD *)(a1 + 32), (uint64_t)CFSTR("delegates"), v4);
  objc_msgSend_appleID(*(void **)(a1 + 40), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v2, v10, (uint64_t)v9, (uint64_t)CFSTR("apple-id"), v11);

  objc_msgSend_password(*(void **)(a1 + 40), v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v2, v17, (uint64_t)v16, (uint64_t)CFSTR("password"), v18);

  objc_msgSend_emailChoice(*(void **)(a1 + 40), v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v2, v24, (uint64_t)v23, (uint64_t)CFSTR("email-choice"), v25);

  objc_msgSend_appleIDClientIdentifier(MEMORY[0x24BE04958], v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v2, v31, (uint64_t)v30, (uint64_t)CFSTR("client-id"), v32);

  v33 = objc_alloc(MEMORY[0x24BE04A40]);
  v34 = *(_QWORD **)(a1 + 40);
  v35 = v34[5];
  objc_msgSend__signingSession(v34, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend_initWithAccount_withSetupParameters_signingSession_(v33, v41, v35, (uint64_t)v2, (uint64_t)v40);

  v46 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v46 + 40))
  {
    v47 = objc_alloc(MEMORY[0x24BE04970]);
    v51 = (void *)objc_msgSend_initWithAccount_(v47, v48, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), v49, v50);
    objc_msgSend_addProvisioningInfoToAARequest_(v51, v52, (uint64_t)v42, v53, v54);

    v46 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend_setCookieStorage_(v42, v43, *(_QWORD *)(v46 + 48), v44, v45);
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = sub_230EA6944;
  v58[3] = &unk_24FF9D040;
  v59 = *(id *)(a1 + 48);
  objc_msgSend_performRequestWithHandler_(v42, v55, (uint64_t)v58, v56, v57);

}

void sub_230EA6944(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  const char *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  int v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v54 = 0;
    v53 = v9;
    goto LABEL_11;
  }
  v11 = v8;
  objc_msgSend_status(v11, v12, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v21 = (void *)v16;
    objc_msgSend_status(v11, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_intValue(v22, v23, v24, v25, v26);

    if (!v27)
    {
      objc_msgSend_responseParameters(v11, v17, v18, v19, v20);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  objc_msgSend_statusMessage(v11, v17, v18, v19, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v54 = 0;
LABEL_9:
    v53 = v10;
    goto LABEL_10;
  }
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusMessage(v11, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v33, v39, (uint64_t)v38, *MEMORY[0x24BDD0FC8], v40);

  v41 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend_status(v11, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_intValue(v46, v47, v48, v49, v50);
  objc_msgSend_errorWithDomain_code_userInfo_(v41, v52, (uint64_t)CFSTR("com.apple.appleaccount"), v51, (uint64_t)v33);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0;
LABEL_10:

LABEL_11:
  _AALogSystem();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = 138412290;
    v57 = v53;
    _os_log_impl(&dword_230EA3000, v55, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters calling handler with error %@", (uint8_t *)&v56, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230EA6C60(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_setValue_forKey_(v2, v3, *(_QWORD *)(a1 + 32), (uint64_t)CFSTR("delegates"), v4);
  objc_msgSend_appleID(*(void **)(a1 + 40), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v2, v10, (uint64_t)v9, (uint64_t)CFSTR("apple-id"), v11);

  objc_msgSend_password(*(void **)(a1 + 40), v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v2, v17, (uint64_t)v16, (uint64_t)CFSTR("password"), v18);

  objc_msgSend_emailChoice(*(void **)(a1 + 40), v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v2, v24, (uint64_t)v23, (uint64_t)CFSTR("email-choice"), v25);

  objc_msgSend_appleIDClientIdentifier(MEMORY[0x24BE04958], v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v2, v31, (uint64_t)v30, (uint64_t)CFSTR("client-id"), v32);

  v33 = objc_alloc(MEMORY[0x24BE049D8]);
  v34 = *(_QWORD **)(a1 + 40);
  v35 = v34[5];
  objc_msgSend__signingSession(v34, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend_initWithAccount_parameters_signingSession_(v33, v41, v35, (uint64_t)v2, (uint64_t)v40);

  v46 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v46 + 40))
  {
    v47 = objc_alloc(MEMORY[0x24BE04970]);
    v51 = (void *)objc_msgSend_initWithAccount_(v47, v48, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), v49, v50);
    objc_msgSend_addProvisioningInfoToAARequest_(v51, v52, (uint64_t)v42, v53, v54);

    v46 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend_setCookieStorage_(v42, v43, *(_QWORD *)(v46 + 48), v44, v45);
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = sub_230EA6E30;
  v58[3] = &unk_24FF9D040;
  v59 = *(id *)(a1 + 48);
  objc_msgSend_performRequestWithHandler_(v42, v55, (uint64_t)v58, v56, v57);

}

void sub_230EA6E30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
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
  void *v34;
  const char *v35;
  void *v36;
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
  int v47;
  const char *v48;
  NSObject *v49;
  int v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v15 = v9;
  v16 = v15;
  if (v10)
  {
    objc_msgSend_status(v10, v11, v12, v13, v14);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17
      || (v22 = (void *)v17,
          objc_msgSend_status(v10, v18, v19, v20, v21),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend_intValue(v23, v24, v25, v26, v27),
          v23,
          v22,
          v16 = v15,
          v28))
    {
      objc_msgSend_statusMessage(v10, v18, v19, v20, v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v15;
      if (v29)
      {
        v52 = *MEMORY[0x24BDD0FC8];
        objc_msgSend_statusMessage(v10, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = v34;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)v53, (uint64_t)&v52, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend_status(v10, v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend_intValue(v42, v43, v44, v45, v46);
        objc_msgSend_errorWithDomain_code_userInfo_(v37, v48, (uint64_t)CFSTR("com.apple.appleaccount"), v47, (uint64_t)v36);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  _AALogSystem();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = 138412290;
    v51 = v16;
    _os_log_impl(&dword_230EA3000, v49, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters calling completion handler with error %@", (uint8_t *)&v50, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_230EA70AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230EA7208(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
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
  _QWORD v22[4];
  id v23;

  v2 = objc_alloc(MEMORY[0x24BE04A48]);
  v9 = (void *)objc_msgSend_initWithAccount_(v2, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v4, v5);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v10 = objc_alloc(MEMORY[0x24BE04970]);
    v14 = (void *)objc_msgSend_initWithAccount_(v10, v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v12, v13);
    objc_msgSend_addProvisioningInfoToAARequest_(v14, v15, (uint64_t)v9, v16, v17);

  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    objc_msgSend_setCustomHeaders_(v9, v6, v18, v7, v8);
  objc_msgSend_setCookieStorage_(v9, v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v7, v8);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_230EA72F4;
  v22[3] = &unk_24FF9D040;
  v23 = *(id *)(a1 + 48);
  objc_msgSend_performRequestWithHandler_(v9, v19, (uint64_t)v22, v20, v21);

}

void sub_230EA72F4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v11 = a4;
  if (v6)
  {
    objc_msgSend_xmlUIData(v6, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_230EA3000, v13, OS_LOG_TYPE_DEFAULT, "We got the new iCloud Terms from the server", (uint8_t *)&v16, 2u);
      }
    }
    else if (v14)
    {
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_230EA3000, v13, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_230EA3000, v15, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_230EA7658(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  int v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
    objc_msgSend_upgradeStatus(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_230EA3000, v14, OS_LOG_TYPE_DEFAULT, "We got the upgrade status from the server", (uint8_t *)&v28, 2u);
      }

      v20 = *(_QWORD *)(a1 + 32);
      v25 = objc_msgSend_BOOLValue(v13, v21, v22, v23, v24);
      (*(void (**)(uint64_t, uint64_t, id))(v20 + 16))(v20, v25, v7);
    }
    else
    {
      if (v15)
      {
        objc_msgSend_responseDictionary(v8, v16, v17, v18, v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412546;
        v29 = v7;
        v30 = 2112;
        v31 = v27;
        _os_log_impl(&dword_230EA3000, v14, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status failed with error: %@ response: %@", (uint8_t *)&v28, 0x16u);

      }
      (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, v7);
    }

  }
  else
  {
    _AALogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v7;
      _os_log_impl(&dword_230EA3000, v26, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status got no response and error: %@", (uint8_t *)&v28, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t sub_230EA86C4(uint64_t a1, void *a2)
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
  char isEqualToString;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend_parentAccountIdentifier(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(*(void **)(a1 + 32), v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v8, v14, (uint64_t)v13, v15, v16);

  if ((isEqualToString & 1) != 0)
    goto LABEL_10;
  objc_msgSend_username(v3, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(*(void **)(a1 + 32), v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_isEqualToString_(v22, v28, (uint64_t)v27, v29, v30);

  if (v31)
  {
    _AALogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v38 = *(_QWORD *)(a1 + 32);
      v37 = *(_QWORD *)(a1 + 40);
      v54 = 138412546;
      v55 = v37;
      v56 = 2112;
      v57 = v38;
      v39 = "Found an orphaned accountType %@ for username of AppleAccount %@";
LABEL_8:
      _os_log_impl(&dword_230EA3000, v36, OS_LOG_TYPE_DEFAULT, v39, (uint8_t *)&v54, 0x16u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend_aa_appleIDAliases(*(void **)(a1 + 32), v32, v33, v34, v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_username(v3, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_containsObject_(v40, v46, (uint64_t)v45, v47, v48);

  if (!v49)
  {
LABEL_10:
    v52 = 0;
    goto LABEL_11;
  }
  _AALogSystem();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v51 = *(_QWORD *)(a1 + 32);
    v50 = *(_QWORD *)(a1 + 40);
    v54 = 138412546;
    v55 = v50;
    v56 = 2112;
    v57 = v51;
    v39 = "Found an orphaned accountType %@ for alias of AppleAccount %@";
    goto LABEL_8;
  }
LABEL_9:

  v52 = 1;
LABEL_11:

  return v52;
}

void sub_230EA9224(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_230EA97E8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  const char *v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v55 = v11;
      v12 = "Successfully sent AK account %@. Now moving on to main account.";
      v13 = v9;
      v14 = 12;
LABEL_6:
      _os_log_impl(&dword_230EA3000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else if (v10)
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v55 = v15;
    v56 = 2112;
    v57 = v8;
    v12 = "Failed to send AK account %@ to paired device. Error: %@";
    v13 = v9;
    v14 = 22;
    goto LABEL_6;
  }

  v20 = (void *)objc_msgSend_copy(*(void **)(a1 + 40), v16, v17, v18, v19);
  objc_msgSend__aa_rawPassword(*(void **)(a1 + 40), v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__aa_setRawPassword_(v20, v26, (uint64_t)v25, v27, v28);

  objc_msgSend_setAuthenticated_(v20, v29, 0, v30, v31);
  objc_msgSend_sharedInstance(MEMORY[0x24BE0AC98], v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_securityLevelForAccount_(v36, v37, *(_QWORD *)(a1 + 32), v38, v39);

  v45 = 0;
  if (a2 && v40 == 4)
  {
    objc_msgSend__saveOptionsForProxiedDeviceAuth(*(void **)(a1 + 48), v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_remoteDeviceProxy(*(void **)(a1 + 56), v41, v42, v43, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = *(_QWORD *)(a1 + 64);
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = sub_230EA9A08;
  v51[3] = &unk_24FF9D108;
  v48 = *(id *)(a1 + 40);
  v49 = *(_QWORD *)(a1 + 48);
  v52 = v48;
  v53 = v49;
  objc_msgSend_sendCommand_withAccount_options_completion_(v46, v50, v47, (uint64_t)v20, (uint64_t)v45, v51);

}

void sub_230EA9A08(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v13 = v8;
  if (a2)
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v34 = 138412290;
      v35 = v15;
      v16 = "Successfully signed in with account %@ on remote device!";
      v17 = v14;
      v18 = 12;
LABEL_12:
      _os_log_impl(&dword_230EA3000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v34, v18);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  objc_msgSend_domain(v8, v9, v10, v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqualToString_(v19, v20, (uint64_t)CFSTR("com.apple.appleaccount"), v21, v22))
  {

LABEL_10:
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(_QWORD *)(a1 + 32);
      v34 = 138412546;
      v35 = v33;
      v36 = 2112;
      v37 = v13;
      v16 = "Error encountered with signing in with account %@ on remote device: %@";
      v17 = v14;
      v18 = 22;
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  v27 = objc_msgSend_code(v13, v23, v24, v25, v26);

  if (v27 != -5)
    goto LABEL_10;
  _AALogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = *(_QWORD *)(a1 + 32);
    v34 = 138412290;
    v35 = v29;
    _os_log_impl(&dword_230EA3000, v28, OS_LOG_TYPE_DEFAULT, "Error! Cannot sign in with account %@. Two-factor auth is required.", (uint8_t *)&v34, 0xCu);
  }

  objc_msgSend__showRedirectToBridgeAlertForAccount_(*(void **)(a1 + 40), v30, *(_QWORD *)(a1 + 32), v31, v32);
LABEL_14:

}

void sub_230EAA050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint8_t v14[16];
  uint64_t v15;
  uint64_t v16;

  if (!a3)
  {
    v15 = v3;
    v16 = v4;
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_230EA3000, v5, OS_LOG_TYPE_DEFAULT, "We're sending the user to Bridge... wheeeeeeee!", v14, 2u);
    }

    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v6, (uint64_t)CFSTR("bridge:tab=SETTINGS&root=GENERAL_LINK&path=LINK_WITH_ICLOUD_LINK"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_230EAA140;
    block[3] = &unk_24FF9D198;
    v13 = v9;
    v11 = v9;
    dispatch_async(v10, block);

  }
}

void sub_230EAA140(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_defaultWorkspace(MEMORY[0x24BDC1548], a2, a3, a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openSensitiveURL_withOptions_(v8, v6, *(_QWORD *)(a1 + 32), 0, v7);

}

void sub_230EAA2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230EAA2FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, a2, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_230EA3000, v5, OS_LOG_TYPE_DEFAULT, "clearBridgeAppleIDFollowUp result : %@ error: %@", (uint8_t *)&v10, 0x16u);

  }
}

Class sub_230EAA3D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  Class result;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  if (!qword_255EAA490)
  {
    v12 = xmmword_24FF9D230;
    v13 = 0;
    qword_255EAA490 = _sl_dlopen();
  }
  if (!qword_255EAA490)
    sub_230EAC8D8(&v11, a2, a3, a4, a5);
  result = objc_getClass("FLFollowUpController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_230EAC954((uint64_t)result, v7, v8, v9, v10);
  qword_255EAA488 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230EAA5F4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x24BE04940]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = nullsub_1;
  v6[3] = &unk_24FF9D250;
  v3 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend_handleAppleAccountDeleteForAccount_completion_(v2, v4, v3, (uint64_t)v6, v5);

}

void sub_230EAABC4(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  objc_msgSend_aa_altDSID(*(void **)(a1 + 32), v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppleIDWithAltDSID_inUse_forService_(v13, v7, (uint64_t)v6, 1, 1);

  v8 = objc_alloc_init((Class)sub_230EAB9F8());
  sub_230EABB94();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didCompleteFlow_(v8, v10, (uint64_t)v9, v11, v12);

}

void sub_230EAAC50(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  objc_msgSend_aa_altDSID(*(void **)(a1 + 32), v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppleIDWithAltDSID_inUse_forService_(v8, v7, (uint64_t)v6, 0, 1);

}

void sub_230EAAE6C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_setWarmingUp_(*(void **)(a1 + 32), a2, 0, a4, a5);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v15 = 0;
  v10 = objc_msgSend_saveVerifiedAccount_error_(v6, v8, v7, (uint64_t)&v15, v9);
  v11 = v15;
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (v10)
      v14 = CFSTR("YES");
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_230EA3000, v12, OS_LOG_TYPE_DEFAULT, "Ended account warmup for account %@ with success: %@, error: %@", buf, 0x20u);
  }

}

uint64_t sub_230EAB0A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_childAccountsWithAccountTypeIdentifier_(*(void **)(a1 + 32), a2, *MEMORY[0x24BDB4028], a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v6, v7, v8, v9, v10);

  if (v11)
    return MEMORY[0x24BEDD108](AAFindMyAccountController, sel_updateDeviceLocatorChildAccountForAppleAccount_, *(_QWORD *)(a1 + 32), v12, v13);
  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v20 = 138412290;
    v21 = v15;
    _os_log_impl(&dword_230EA3000, v14, OS_LOG_TYPE_DEFAULT, "AppleAccount (%@) does not have a device locator child account.", (uint8_t *)&v20, 0xCu);
  }

  return objc_msgSend_addDeviceLocatorChildAccountToAppleAccount_(AAFindMyAccountController, v16, *(_QWORD *)(a1 + 32), v17, v18);
}

uint64_t sub_230EAB1C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_childAccountsWithAccountTypeIdentifier_(*(void **)(a1 + 32), a2, *MEMORY[0x24BDB4050], a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v6, v7, v8, v9, v10);

  if (v11)
    return MEMORY[0x24BEDD108](AAFindMyAccountController, sel_updateFMFChildAccountForAppleAccount_, *(_QWORD *)(a1 + 32), v12, v13);
  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v20 = 138412290;
    v21 = v15;
    _os_log_impl(&dword_230EA3000, v14, OS_LOG_TYPE_DEFAULT, "AppleAccount (%@) does not have a FMF child account.", (uint8_t *)&v20, 0xCu);
  }

  return objc_msgSend_addFMFChildAccountToAppleAccount_(AAFindMyAccountController, v16, *(_QWORD *)(a1 + 32), v17, v18);
}

void sub_230EAB5B0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[13];

  v18[12] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = *MEMORY[0x24BDB4060];
  v18[0] = *MEMORY[0x24BDB3FD8];
  v18[1] = v6;
  v7 = *MEMORY[0x24BDB40A0];
  v18[2] = *MEMORY[0x24BDB4180];
  v18[3] = v7;
  v8 = *MEMORY[0x24BDB4080];
  v18[4] = *MEMORY[0x24BDB4020];
  v18[5] = v8;
  v9 = *MEMORY[0x24BDB4038];
  v18[6] = *MEMORY[0x24BDB3FE8];
  v18[7] = v9;
  v10 = *MEMORY[0x24BDB4090];
  v18[8] = *MEMORY[0x24BDB4098];
  v18[9] = v10;
  v11 = *MEMORY[0x24BDB4000];
  v18[10] = *MEMORY[0x24BDB4010];
  v18[11] = v11;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v18, 12, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v13, (uint64_t)v12, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_255EAA498;
  qword_255EAA498 = v16;

}

void sub_230EAB734(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_230EAB74C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_230EAB758(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_230EAB788()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_255EAA4A8;
  v6 = qword_255EAA4A8;
  if (!qword_255EAA4A8)
  {
    v7 = xmmword_24FF9D300;
    v8 = *(_OWORD *)&off_24FF9D310;
    v1 = _sl_dlopen();
    v4[3] = v1;
    qword_255EAA4A8 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_230EAB838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_230EAB850()
{
  uint64_t result;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v5 = 0;
  result = sub_230EAB788();
  if (!result)
    sub_230EACDDC(&v5, v1, v2, v3, v4);
  return result;
}

void *sub_230EAB8A0()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_255EAA4B0;
  v6 = qword_255EAA4B0;
  if (!qword_255EAA4B0)
  {
    v1 = (void *)sub_230EAB850();
    v0 = dlsym(v1, "BYSetupAssistantIsRunningSilentTokenUpgrade");
    v4[3] = (uint64_t)v0;
    qword_255EAA4B0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_230EAB918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_230EAB930()
{
  uint64_t (*v0)(void);
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (uint64_t (*)(void))sub_230EAB8A0();
  if (!v0)
    sub_230EACE58(0, v1, v2, v3, v4);
  return v0();
}

void *sub_230EAB94C()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_255EAA4B8;
  v6 = qword_255EAA4B8;
  if (!qword_255EAA4B8)
  {
    v1 = (void *)sub_230EAB850();
    v0 = dlsym(v1, "BYSetupAssistantHasCompletedInitialRun");
    v4[3] = (uint64_t)v0;
    qword_255EAA4B8 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_230EAB9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_230EAB9DC()
{
  uint64_t (*v0)(void);
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (uint64_t (*)(void))sub_230EAB94C();
  if (!v0)
    sub_230EACEC8(0, v1, v2, v3, v4);
  return v0();
}

id sub_230EAB9F8()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_255EAA4C0;
  v7 = qword_255EAA4C0;
  if (!qword_255EAA4C0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_230EABAB0;
    v3[3] = &unk_24FF9D210;
    v3[4] = &v4;
    sub_230EABAB0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230EABA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_230EABAB0(uint64_t a1)
{
  Class result;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_230EAB850();
  result = objc_getClass("BYFlowSkipController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_230EACF38((uint64_t)result, v3, v4, v5, v6);
  qword_255EAA4C0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_230EABB04()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_255EAA4C8;
  v6 = qword_255EAA4C8;
  if (!qword_255EAA4C8)
  {
    v1 = (void *)sub_230EAB850();
    v0 = dlsym(v1, "BYFlowSkipIdentifierAppleID");
    v4[3] = (uint64_t)v0;
    qword_255EAA4C8 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_230EABB7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id sub_230EABB94()
{
  id *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (id *)sub_230EABB04();
  if (!v0)
    sub_230EACFB0(0, v1, v2, v3, v4);
  return *v0;
}

char *sub_230EABBB4()
{
  return dlerror();
}

void sub_230EABEE0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EA3000, v7, OS_LOG_TYPE_DEFAULT, "Found primary apple account, no reason to follow up.", buf, 2u);
    }

  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_230EAD020((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_230EA3000, v9, OS_LOG_TYPE_DEFAULT, "No primary apple account found, following up with user!", v17, 2u);
      }

      objc_msgSend_postFollowUpWithIdentifier_userInfo_completion_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v16, *MEMORY[0x24BE04840], 0, 0);
    }
  }

}

void sub_230EAC000(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t v29[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_230EAD088((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_4:

  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v5;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v34, 16);
    if (v16)
    {
      v21 = v16;
      v22 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v14);
          if ((objc_msgSend_isActive(*(void **)(*((_QWORD *)&v30 + 1) + 8 * i), v17, v18, v19, v20) & 1) != 0)
          {

            _AALogSystem();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v29 = 0;
              _os_log_impl(&dword_230EA3000, v7, OS_LOG_TYPE_DEFAULT, "Secondary accounts still present, leaving the follow up", v29, 2u);
            }
            goto LABEL_4;
          }
        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v34, 16);
        if (v21)
          continue;
        break;
      }
    }

    _AALogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_230EA3000, v24, OS_LOG_TYPE_DEFAULT, "No active secondary accounts found, removing our follow up.", v29, 2u);
    }

    objc_msgSend__dismissStartUsingFollowUp(*(void **)(a1 + 32), v25, v26, v27, v28);
  }

}

void sub_230EAC51C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_aa_appleAccounts(*(void **)(a1 + 32), a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aaf_firstObjectPassingTest_(v6, v7, (uint64_t)&unk_24FF9D390, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_230EA3000, v11, OS_LOG_TYPE_DEFAULT, "Found another account needing terms: %@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend_postFollowUpWithIdentifier_forAccount_userInfo_completion_(*(void **)(*(_QWORD *)(a1 + 40) + 8), v13, *MEMORY[0x24BE04848], (uint64_t)v10, 0, 0);
  }
  else
  {
    if (v12)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_230EA3000, v11, OS_LOG_TYPE_DEFAULT, "No other accounts need terms, dismissing...", (uint8_t *)&v16, 2u);
    }

    objc_msgSend_dismissFollowUpWithIdentifier_completion_(*(void **)(*(_QWORD *)(a1 + 40) + 8), v14, *MEMORY[0x24BE04848], 0, v15);
  }

}

uint64_t sub_230EAC668(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t hasOptionalTerms;

  v2 = a2;
  if ((objc_msgSend_aa_needsToVerifyTerms(v2, v3, v4, v5, v6) & 1) != 0)
    hasOptionalTerms = 1;
  else
    hasOptionalTerms = objc_msgSend_aa_hasOptionalTerms(v2, v7, v8, v9, v10);

  return hasOptionalTerms;
}

void sub_230EAC71C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = *MEMORY[0x24BDB4180];
  v13[0] = *MEMORY[0x24BDB4060];
  v13[1] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v13, 2, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v8, (uint64_t)v7, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)qword_255EAA4D0;
  qword_255EAA4D0 = v11;

}

void sub_230EAC870(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EA9224(&dword_230EA3000, a2, a3, "AppleAccount for %@ is not on disk. Unable to assign parent. Stopping.", a5, a6, a7, a8, 2u);
}

void sub_230EAC8D8(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, (uint64_t)"void *CoreFollowUpLibrary(void)", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, (uint64_t)CFSTR("AABridgeFollowUpController.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_230EAC954(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, (uint64_t)"Class getFLFollowUpControllerClass(void)_block_invoke", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, (uint64_t)CFSTR("AABridgeFollowUpController.m"), 20, CFSTR("Unable to find class %s"), "FLFollowUpController");

  __break(1u);
}

void sub_230EAC9CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EAB768();
  sub_230EAB734(&dword_230EA3000, v0, v1, "This account has already been warmed up! Failing save.", v2, v3, v4, v5, v6);
  sub_230EAB744();
}

void sub_230EAC9F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EAB768();
  sub_230EAB734(&dword_230EA3000, v0, v1, "Found an existing AppleAccount with matching IDs, bailing!", v2, v3, v4, v5, v6);
  sub_230EAB744();
}

void sub_230EACA24()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230EAB774();
  sub_230EAB74C(&dword_230EA3000, v0, v1, "Found an existing primary account (%@), failing new account save!", v2);
  sub_230EAB780();
}

void sub_230EACA88()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230EAB774();
  sub_230EAB74C(&dword_230EA3000, v0, v1, "Account %{public}@ is not valid, missing username!", v2);
  sub_230EAB780();
}

void sub_230EACAEC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_230EAB774();
  sub_230EAB74C(&dword_230EA3000, v0, v1, "Account %{public}@ is not valid, missing altDSID!", v2);
  sub_230EAB780();
}

void sub_230EACB50(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_aa_accountClass(a1, a2, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_230EA3000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Updated account class for account: %@ (%@)", (uint8_t *)&v8, 0x16u);

}

void sub_230EACBFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EAB768();
  sub_230EAB758(&dword_230EA3000, v0, v1, "Not setting AppleAccountInformationCache values", v2, v3, v4, v5, v6);
  sub_230EAB744();
}

void sub_230EACC28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EAB768();
  sub_230EAB758(&dword_230EA3000, v0, v1, "Profile picture cache deleted successfully.", v2, v3, v4, v5, v6);
  sub_230EAB744();
}

void sub_230EACC54(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230EAB774();
  sub_230EAB74C(&dword_230EA3000, a2, v7, "Profile picture cache could not be deleted. Error: %@", v8);

}

void sub_230EACCDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EAB768();
  sub_230EAB734(&dword_230EA3000, v0, v1, "Profile picture cache does not exist.", v2, v3, v4, v5, v6);
  sub_230EAB744();
}

void sub_230EACD08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EAB768();
  sub_230EAB758(&dword_230EA3000, v0, v1, "isSignedIn is true. Not writing to cache", v2, v3, v4, v5, v6);
  sub_230EAB744();
}

void sub_230EACD34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EAB768();
  sub_230EAB734(&dword_230EA3000, v0, v1, "Creation date is nil for comparison.", v2, v3, v4, v5, v6);
  sub_230EAB744();
}

void sub_230EACD60()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  sub_230EAB774();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_230EA3000, v1, OS_LOG_TYPE_ERROR, "Error deleting unsupported account (%@): %@", v2, 0x16u);
  sub_230EAB780();
}

void sub_230EACDDC(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, (uint64_t)"void *SetupAssistantLibrary(void)", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, (uint64_t)CFSTR("AASetupAssistantSoftLink.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_230EACE58(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  const char *v11;

  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, (uint64_t)"BOOL SBYSetupAssistantIsRunningSilentTokenUpgrade(void)", v8, v9);
  objc_claimAutoreleasedReturnValue();
  v10 = sub_230EABBB4();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v5, (uint64_t)CFSTR("AASetupAssistantSoftLink.m"), 13, CFSTR("%s"), v10);

  __break(1u);
}

void sub_230EACEC8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  const char *v11;

  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, (uint64_t)"BOOL SBYSetupAssistantHasCompletedInitialRun(void)", v8, v9);
  objc_claimAutoreleasedReturnValue();
  v10 = sub_230EABBB4();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v5, (uint64_t)CFSTR("AASetupAssistantSoftLink.m"), 14, CFSTR("%s"), v10);

  __break(1u);
}

void sub_230EACF38(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, (uint64_t)"Class getBYFlowSkipControllerClass(void)_block_invoke", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, (uint64_t)CFSTR("AASetupAssistantSoftLink.m"), 17, CFSTR("Unable to find class %s"), "BYFlowSkipController");

  __break(1u);
}

void sub_230EACFB0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  const char *v11;

  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, (uint64_t)"typeof (((typeof (BYFlowSkipIdentifierAppleID) (*)(void))0)()) getBYFlowSkipIdentifierAppleID(void)", v8, v9);
  objc_claimAutoreleasedReturnValue();
  v10 = sub_230EABBB4();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v5, (uint64_t)CFSTR("AASetupAssistantSoftLink.m"), 18, CFSTR("%s"), v10);

  __break(1u);
}

void sub_230EAD020(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EA9224(&dword_230EA3000, a2, a3, "Failed to query for primary account, error: %@", a5, a6, a7, a8, 2u);
}

void sub_230EAD088(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EA9224(&dword_230EA3000, a2, a3, "Failed to determine if we have any secondary accounts, error: %@", a5, a6, a7, a8, 2u);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t _AALogSystem()
{
  return MEMORY[0x24BE04AA8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

