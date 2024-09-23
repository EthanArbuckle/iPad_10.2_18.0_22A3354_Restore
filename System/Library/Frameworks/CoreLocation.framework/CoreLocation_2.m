uint64_t sub_18F752764()
{
  return 3;
}

void sub_18F75276C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __objc2_class *v4;
  __objc2_class *v5;
  NSObject *v7;
  os_log_type_t v8;
  _QWORD *v9;
  int v10;
  _BYTE *v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t **v15;
  int v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  uint64_t *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD *, uint64_t);
  _QWORD *v26;
  int v27;
  int v28;
  NSObject *v29;
  _QWORD *v30;
  NSObject *v31;
  os_log_type_t v32;
  _QWORD *v33;
  _BYTE *v34;
  NSObject *v35;
  os_log_type_t v36;
  _QWORD *v37;
  __objc2_class *v38;
  int v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t **v44;
  uint64_t *v45;
  uint64_t v46;
  _QWORD *v47;
  NSObject *v48;
  os_log_type_t v49;
  _QWORD *v50;
  __objc2_class *v51;
  int v52;
  _BYTE *v53;
  _BYTE *v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t **v57;
  uint64_t *v58;
  uint64_t v59;
  _QWORD *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  _QWORD *v67;
  int v68;
  _BYTE *v69;
  _BYTE *v70;
  void **v71;
  char *v72;
  _QWORD *v73;
  _BYTE *v74;
  char *v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  _QWORD *v79;
  char *v80;
  _QWORD *v81;
  __objc2_class *v82;
  int v83;
  _BYTE *v84;
  _BYTE *v85;
  void **v86;
  char *v87;
  NSObject *vtable;
  NSObject *v89;
  NSObject *v90;
  _QWORD *v91;
  __objc2_class *v92;
  int v93;
  _BYTE *v94;
  _BYTE *v95;
  void **v96;
  char *v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  uint64_t **v101;
  uint64_t **v102;
  int v103;
  void *v104[2];
  char v105;
  int v106;
  _BYTE __p[12];
  __int16 v108;
  _BYTE *v109;
  __int16 v110;
  void **v111;
  _BYTE buf[1596];
  _BYTE v113[12];
  __int16 v114;
  _BYTE *v115;
  char v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  ++*(_DWORD *)(a1 + 88);
  v2 = *(int *)(a1 + 4);
  v106 = *(_DWORD *)(a1 + 4);
  if (!*(_QWORD *)(a1 + 32))
  {
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v61 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "handler && \"invalid handler\"";
      _os_log_impl(&dword_18F5B3000, v61, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v62 = qword_1EE172130;
    if (os_signpost_enabled((os_log_t)qword_1EE172130))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "handler && \"invalid handler\"";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v62, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v63 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "handler && \"invalid handler\"";
      _os_log_impl(&dword_18F5B3000, v63, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_112;
  }
  v4 = &OBJC_METACLASS___CLHeadingInternal;
  v5 = &OBJC_METACLASS___CLHeadingInternal;
  if (!*(_BYTE *)(a1 + 48))
  {
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v64 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "fIniitalized && \"must call initialize(state) first\"";
      _os_log_impl(&dword_18F5B3000, v64, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v65 = qword_1EE172130;
    if (os_signpost_enabled((os_log_t)qword_1EE172130))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "fIniitalized && \"must call initialize(state) first\"";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v65, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v66 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "fIniitalized && \"must call initialize(state) first\"";
      _os_log_impl(&dword_18F5B3000, v66, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_112:
    abort_report_np();
    goto LABEL_219;
  }
  if (qword_1EE172128 != -1)
    dispatch_once(&qword_1EE172128, &unk_1E2993038);
  v7 = qword_1EE172130;
  v8 = *(_BYTE *)(a1 + 120);
  if (os_log_type_enabled((os_log_t)qword_1EE172130, v8))
  {
    v9 = (_QWORD *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v9 = (_QWORD *)*v9;
    sub_18F5D5990(__p, off_1E2993080[*(int *)(a1 + 4)]);
    v10 = SHIBYTE(v110);
    v11 = *(_BYTE **)__p;
    sub_18F754134(v113, a2);
    v12 = __p;
    if (v10 < 0)
      v12 = v11;
    if (v116 >= 0)
      v13 = v113;
    else
      v13 = *(_BYTE **)v113;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = v13;
    _os_log_impl(&dword_18F5B3000, v7, v8, "%scurrent_state,%s,event,%s", buf, 0x20u);
    if (v116 < 0)
      operator delete(*(void **)v113);
    v4 = &OBJC_METACLASS___CLHeadingInternal;
    if (SHIBYTE(v110) < 0)
      operator delete(*(void **)__p);
    v5 = &OBJC_METACLASS___CLHeadingInternal;
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v67 = (_QWORD *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v67 = (_QWORD *)*v67;
    sub_18F754144(v113, *(_DWORD *)(a1 + 4));
    v68 = v116;
    v69 = *(_BYTE **)v113;
    sub_18F754134(v104, a2);
    v70 = v113;
    if (v68 < 0)
      v70 = v69;
    if (v105 >= 0)
      v71 = v104;
    else
      v71 = (void **)v104[0];
    *(_DWORD *)__p = 136315650;
    *(_QWORD *)&__p[4] = v67;
    v108 = 2080;
    v109 = v70;
    v110 = 2080;
    v111 = v71;
    v72 = (char *)_os_log_send_and_compose_impl();
    if (v105 < 0)
      operator delete(v104[0]);
    v4 = &OBJC_METACLASS___CLHeadingInternal;
    if (v116 < 0)
      operator delete(*(void **)v113);
    sub_18F5F2740("Generic", 1, 0, 2, "State CLStateMachine<CLEmergencyLocationSelectorInternal>::handleEvent(Event) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v72);
    if (v72 != buf)
      free(v72);
  }
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
    goto LABEL_29;
  v15 = (uint64_t **)(a1 + 8);
  v16 = *(_DWORD *)(a1 + 4);
  v17 = a1 + 16;
  do
  {
    v18 = *(_DWORD *)(v14 + 32);
    v19 = v18 < v16;
    if (v18 >= v16)
      v20 = (uint64_t *)v14;
    else
      v20 = (uint64_t *)(v14 + 8);
    if (!v19)
      v17 = v14;
    v14 = *v20;
  }
  while (*v20);
  if (v17 == a1 + 16 || v16 < *(_DWORD *)(v17 + 32))
  {
LABEL_29:
    if (v4[7].cache != (void *)-1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v21 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "handlerFn != std::end(state_handlers)";
      _os_log_impl(&dword_18F5B3000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v22 = qword_1EE172130;
    if (os_signpost_enabled((os_log_t)qword_1EE172130))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "handlerFn != std::end(state_handlers)";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v23 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "handlerFn != std::end(state_handlers)";
      _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_192:
    abort_report_np();
    goto LABEL_219;
  }
  v25 = *(uint64_t (**)(_QWORD *, uint64_t))(v17 + 40);
  v24 = *(_QWORD *)(v17 + 48);
  v26 = (_QWORD *)(*(_QWORD *)(a1 + 32) + (v24 >> 1));
  if ((v24 & 1) != 0)
    v25 = *(uint64_t (**)(_QWORD *, uint64_t))(*v26 + v25);
  v27 = v25(v26, a2);
  v28 = v27;
  v103 = v27;
  if (a2 <= 1 && v27 != (_DWORD)v2)
  {
    if (v4[7].cache != (void *)-1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v76 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "newState == oldState";
      _os_log_impl(&dword_18F5B3000, v76, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v77 = qword_1EE172130;
    if (os_signpost_enabled((os_log_t)qword_1EE172130))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "newState == oldState";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v77, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v78 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "newState == oldState";
      _os_log_impl(&dword_18F5B3000, v78, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_192;
  }
  if (*(_DWORD *)(a1 + 88) >= 2u)
  {
    if (v4[7].cache != (void *)-1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v29 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_ERROR))
    {
      v30 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v30 = (_QWORD *)*v30;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_ERROR, "%sNested invocation of state machine", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      v79 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v79 = (_QWORD *)*v79;
      *(_DWORD *)__p = 136315138;
      *(_QWORD *)&__p[4] = v79;
      v80 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "State CLStateMachine<CLEmergencyLocationSelectorInternal>::handleEvent(Event) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v80);
      if (v80 != buf)
        free(v80);
    }
  }
  if (v4[7].cache != (void *)-1)
    dispatch_once(&qword_1EE172128, &unk_1E2993038);
  v31 = qword_1EE172130;
  v32 = *(_BYTE *)(a1 + 120);
  if (os_log_type_enabled((os_log_t)qword_1EE172130, v32))
  {
    v33 = (_QWORD *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v33 = (_QWORD *)*v33;
    sub_18F5D5990(buf, off_1E2993080[v28]);
    if (buf[23] >= 0)
      v34 = buf;
    else
      v34 = *(_BYTE **)buf;
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = v33;
    v108 = 2080;
    v109 = v34;
    _os_log_impl(&dword_18F5B3000, v31, v32, "%snewState,%s", __p, 0x16u);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (v4[7].cache != (void *)-1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v73 = (_QWORD *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v73 = (_QWORD *)*v73;
    sub_18F754144(__p, v28);
    if (v110 >= 0)
      v74 = __p;
    else
      v74 = *(_BYTE **)__p;
    *(_DWORD *)v113 = 136315394;
    *(_QWORD *)&v113[4] = v73;
    v114 = 2080;
    v115 = v74;
    v75 = (char *)_os_log_send_and_compose_impl();
    if (SHIBYTE(v110) < 0)
      operator delete(*(void **)__p);
    sub_18F5F2740("Generic", 1, 0, 2, "State CLStateMachine<CLEmergencyLocationSelectorInternal>::handleEvent(Event) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v75);
    if (v75 != buf)
      free(v75);
  }
  if (v28 != (_DWORD)v2)
  {
    if (v4[7].cache != (void *)-1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v35 = qword_1EE172130;
    v36 = *(_BYTE *)(a1 + 120);
    if (os_log_type_enabled((os_log_t)qword_1EE172130, v36))
    {
      v37 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v37 = (_QWORD *)*v37;
      sub_18F5D5990(__p, off_1E2993080[v2]);
      v38 = v4;
      v39 = SHIBYTE(v110);
      v40 = *(_BYTE **)__p;
      sub_18F5D5990(v113, "Exit");
      v41 = __p;
      if (v39 < 0)
        v41 = v40;
      if (v116 >= 0)
        v42 = v113;
      else
        v42 = *(_BYTE **)v113;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v42;
      _os_log_impl(&dword_18F5B3000, v35, v36, "%soldState,%s,event,%s", buf, 0x20u);
      if (v116 < 0)
        operator delete(*(void **)v113);
      v5 = &OBJC_METACLASS___CLHeadingInternal;
      v4 = v38;
      if (SHIBYTE(v110) < 0)
        operator delete(*(void **)__p);
      v15 = (uint64_t **)(a1 + 8);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      v81 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v81 = (_QWORD *)*v81;
      sub_18F754144(v113, v2);
      v101 = v15;
      v82 = v4;
      v83 = v116;
      v84 = *(_BYTE **)v113;
      sub_18F5D5990(v104, "Exit");
      v85 = v113;
      if (v83 < 0)
        v85 = v84;
      if (v105 >= 0)
        v86 = v104;
      else
        v86 = (void **)v104[0];
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = v81;
      v108 = 2080;
      v109 = v85;
      v110 = 2080;
      v111 = v86;
      v87 = (char *)_os_log_send_and_compose_impl();
      if (v105 < 0)
        operator delete(v104[0]);
      v5 = &OBJC_METACLASS___CLHeadingInternal;
      v4 = v82;
      if (v116 < 0)
        operator delete(*(void **)v113);
      sub_18F5F2740("Generic", 1, 0, 2, "State CLStateMachine<CLEmergencyLocationSelectorInternal>::handleEvent(Event) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v87);
      v15 = v101;
      if (v87 != buf)
        free(v87);
    }
    v43 = *(_QWORD *)(a1 + 32);
    v44 = sub_18F759008(v15, v2, &v106);
    v45 = v44[5];
    v46 = (uint64_t)v44[6];
    v47 = (_QWORD *)(v43 + (v46 >> 1));
    if ((v46 & 1) != 0)
      v45 = *(uint64_t **)(*v47 + v45);
    if (((unsigned int (*)(_QWORD *, uint64_t))v45)(v47, 1) != (_DWORD)v2)
    {
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      vtable = v5[7].vtable;
      if (os_log_type_enabled(vtable, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "assert";
        *(_WORD *)&buf[28] = 2081;
        *(_QWORD *)&buf[30] = "retState == oldState";
        _os_log_impl(&dword_18F5B3000, vtable, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (v4[7].cache != (void *)-1)
          dispatch_once(&qword_1EE172128, &unk_1E2993038);
      }
      v89 = v5[7].vtable;
      if (os_signpost_enabled(v89))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "assert";
        *(_WORD *)&buf[28] = 2081;
        *(_QWORD *)&buf[30] = "retState == oldState";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v89, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (v4[7].cache != (void *)-1)
          dispatch_once(&qword_1EE172128, &unk_1E2993038);
      }
      v90 = v5[7].vtable;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "assert";
        *(_WORD *)&buf[28] = 2081;
        *(_QWORD *)&buf[30] = "retState == oldState";
        _os_log_impl(&dword_18F5B3000, v90, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
      goto LABEL_192;
    }
    *(_DWORD *)(a1 + 4) = v28;
    if (v4[7].cache != (void *)-1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v48 = v5[7].vtable;
    v49 = *(_BYTE *)(a1 + 120);
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v50 = (_QWORD *)*v50;
      sub_18F5D5990(__p, off_1E2993080[v28]);
      v51 = v4;
      v52 = SHIBYTE(v110);
      v53 = *(_BYTE **)__p;
      sub_18F5D5990(v113, "Enter");
      v54 = __p;
      if (v52 < 0)
        v54 = v53;
      if (v116 >= 0)
        v55 = v113;
      else
        v55 = *(_BYTE **)v113;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v54;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v55;
      _os_log_impl(&dword_18F5B3000, v48, v49, "%snewState,%s,event,%s", buf, 0x20u);
      if (v116 < 0)
        operator delete(*(void **)v113);
      v4 = v51;
      if (SHIBYTE(v110) < 0)
        operator delete(*(void **)__p);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      v91 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v91 = (_QWORD *)*v91;
      sub_18F754144(v113, v28);
      v102 = v15;
      v92 = v4;
      v93 = v116;
      v94 = *(_BYTE **)v113;
      sub_18F5D5990(v104, "Enter");
      v95 = v113;
      if (v93 < 0)
        v95 = v94;
      if (v105 >= 0)
        v96 = v104;
      else
        v96 = (void **)v104[0];
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = v91;
      v108 = 2080;
      v109 = v95;
      v110 = 2080;
      v111 = v96;
      v97 = (char *)_os_log_send_and_compose_impl();
      if (v105 < 0)
        operator delete(v104[0]);
      v4 = v92;
      if (v116 < 0)
        operator delete(*(void **)v113);
      sub_18F5F2740("Generic", 1, 0, 2, "State CLStateMachine<CLEmergencyLocationSelectorInternal>::handleEvent(Event) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v97);
      v15 = v102;
      if (v97 != buf)
        free(v97);
    }
    v56 = *(_QWORD *)(a1 + 32);
    v57 = sub_18F759008(v15, v28, &v103);
    v58 = v57[5];
    v59 = (uint64_t)v57[6];
    v60 = (_QWORD *)(v56 + (v59 >> 1));
    if ((v59 & 1) != 0)
      v58 = *(uint64_t **)(*v60 + v58);
    if (((unsigned int (*)(_QWORD *, _QWORD))v58)(v60, 0) != v28)
    {
      if (v4[7].cache != (void *)-1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      v98 = v5[7].vtable;
      if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "assert";
        *(_WORD *)&buf[28] = 2081;
        *(_QWORD *)&buf[30] = "retState == newState";
        _os_log_impl(&dword_18F5B3000, v98, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (v4[7].cache != (void *)-1)
          dispatch_once(&qword_1EE172128, &unk_1E2993038);
      }
      v99 = v5[7].vtable;
      if (os_signpost_enabled(v99))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "assert";
        *(_WORD *)&buf[28] = 2081;
        *(_QWORD *)&buf[30] = "retState == newState";
        _os_signpost_emit_with_name_impl(&dword_18F5B3000, v99, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (v4[7].cache != (void *)-1)
          dispatch_once(&qword_1EE172128, &unk_1E2993038);
      }
      v100 = v5[7].vtable;
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = "assert";
        *(_WORD *)&buf[28] = 2081;
        *(_QWORD *)&buf[30] = "retState == newState";
        _os_log_impl(&dword_18F5B3000, v100, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
      abort_report_np();
LABEL_219:
      __break(1u);
    }
  }
  --*(_DWORD *)(a1 + 88);
}

void sub_18F7540E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;

  if (*(char *)(v24 - 105) < 0)
    operator delete(*(void **)(v24 - 128));
  _Unwind_Resume(exception_object);
}

_QWORD *sub_18F754134(_QWORD *a1, int a2)
{
  return sub_18F5D5990(a1, off_1E2993058[a2]);
}

_QWORD *sub_18F754144(_QWORD *a1, int a2)
{
  return sub_18F5D5990(a1, off_1E2993080[a2]);
}

void sub_18F754154(uint64_t a1, double a2)
{
  NSObject *v3;
  NSObject *v5;
  _QWORD *v6;
  _BYTE *v7;
  _QWORD *v8;
  _BYTE *v9;
  char *v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t *v16;
  NSObject *v17;
  dispatch_source_t v18;
  uint64_t *v19;
  uint64_t **v20;
  int v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  dispatch_time_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _QWORD *v28;
  _BYTE *v29;
  _QWORD *v30;
  _BYTE *v31;
  NSObject *v32;
  _QWORD *v33;
  _BYTE *v34;
  _QWORD *v35;
  _BYTE *v36;
  NSObject *v37;
  _QWORD *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  _QWORD *v42;
  char *v43;
  _QWORD handler[5];
  int v45;
  _BYTE v46[12];
  __int16 v47;
  _BYTE *v48;
  char v49;
  _BYTE __p[12];
  __int16 v51;
  _BYTE *v52;
  __int16 v53;
  double v54;
  _BYTE buf[1634];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = *(NSObject **)(a1 + 80);
  if (!v3)
  {
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v37 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_ERROR))
    {
      v38 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v38 = (_QWORD *)*v38;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v38;
      _os_log_impl(&dword_18F5B3000, v37, OS_LOG_TYPE_ERROR, "%sInvoking timers without callback queue set", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      v42 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v42 = (_QWORD *)*v42;
      *(_DWORD *)__p = 136315138;
      *(_QWORD *)&__p[4] = v42;
      v43 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "void CLStateMachine<CLEmergencyLocationSelectorInternal>::setTimeoutEvent(Event, double) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v43);
      if (v43 != buf)
        free(v43);
    }
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v39 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "false";
      _os_log_impl(&dword_18F5B3000, v39, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v40 = qword_1EE172130;
    if (os_signpost_enabled((os_log_t)qword_1EE172130))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "false";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
    }
    v41 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "assert";
      *(_WORD *)&buf[28] = 2081;
      *(_QWORD *)&buf[30] = "false";
      _os_log_impl(&dword_18F5B3000, v41, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  if (a2 < 0.0)
  {
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v5 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_FAULT))
    {
      v6 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v6 = (_QWORD *)*v6;
      sub_18F5D5990(__p, "SendLocationTimeout");
      if (v53 >= 0)
        v7 = __p;
      else
        v7 = *(_BYTE **)__p;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2050;
      *(double *)&buf[24] = a2;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_FAULT, "%sCannot start timer, event, %{public}s, timeOutSec, %{public}.2f", buf, 0x20u);
      if (SHIBYTE(v53) < 0)
        operator delete(*(void **)__p);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      v8 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v8 = (_QWORD *)*v8;
      sub_18F5D5990(v46, "SendLocationTimeout");
      if (v49 >= 0)
        v9 = v46;
      else
        v9 = *(_BYTE **)v46;
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = v8;
      v51 = 2082;
      v52 = v9;
      v53 = 2050;
      v54 = a2;
      v10 = (char *)_os_log_send_and_compose_impl();
      if (v49 < 0)
        operator delete(*(void **)v46);
LABEL_89:
      sub_18F5F2740("Generic", 1, 0, 0, "void CLStateMachine<CLEmergencyLocationSelectorInternal>::setTimeoutEvent(Event, double) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v10);
LABEL_90:
      if (v10 != buf)
        free(v10);
      return;
    }
    return;
  }
  v12 = (uint64_t **)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 64);
  if (v11)
  {
    v13 = a1 + 64;
    do
    {
      v14 = *(_DWORD *)(v11 + 32);
      v15 = v14 < 4;
      if (v14 >= 4)
        v16 = (uint64_t *)v11;
      else
        v16 = (uint64_t *)(v11 + 8);
      if (!v15)
        v13 = v11;
      v11 = *v16;
    }
    while (*v16);
    if ((uint64_t **)v13 != v12 && *(int *)(v13 + 32) <= 4)
    {
      v17 = *(NSObject **)(v13 + 40);
      if (v17)
      {
LABEL_47:
        v25 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
        dispatch_source_set_timer(v17, v25, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
        if (qword_1EE172128 != -1)
          dispatch_once(&qword_1EE172128, &unk_1E2993038);
        v26 = qword_1EE172130;
        v27 = *(_BYTE *)(a1 + 120);
        if (os_log_type_enabled((os_log_t)qword_1EE172130, v27))
        {
          v28 = (_QWORD *)(a1 + 96);
          if (*(char *)(a1 + 119) < 0)
            v28 = (_QWORD *)*v28;
          sub_18F754134(__p, 4);
          if (v53 >= 0)
            v29 = __p;
          else
            v29 = *(_BYTE **)__p;
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v29;
          *(_WORD *)&buf[22] = 2048;
          *(double *)&buf[24] = a2;
          _os_log_impl(&dword_18F5B3000, v26, v27, "%sevent,%s,timeout,%.2f", buf, 0x20u);
          if (SHIBYTE(v53) < 0)
            operator delete(*(void **)__p);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE172128 != -1)
            dispatch_once(&qword_1EE172128, &unk_1E2993038);
          v30 = (_QWORD *)(a1 + 96);
          if (*(char *)(a1 + 119) < 0)
            v30 = (_QWORD *)*v30;
          sub_18F754134(v46, 4);
          if (v49 >= 0)
            v31 = v46;
          else
            v31 = *(_BYTE **)v46;
          *(_DWORD *)__p = 136315650;
          *(_QWORD *)&__p[4] = v30;
          v51 = 2080;
          v52 = v31;
          v53 = 2048;
          v54 = a2;
          v10 = (char *)_os_log_send_and_compose_impl();
          if (v49 < 0)
            operator delete(*(void **)v46);
          sub_18F5F2740("Generic", 1, 0, 2, "void CLStateMachine<CLEmergencyLocationSelectorInternal>::setTimeoutEvent(Event, double) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v10);
          goto LABEL_90;
        }
        return;
      }
    }
  }
  v18 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  if (v18)
  {
    v17 = v18;
    v19 = *v12;
    v20 = (uint64_t **)(a1 + 64);
    if (*v12)
    {
      while (1)
      {
        while (1)
        {
          v20 = (uint64_t **)v19;
          v21 = *((_DWORD *)v19 + 8);
          if (v21 < 5)
            break;
          v19 = *v20;
          v12 = v20;
          if (!*v20)
            goto LABEL_43;
        }
        if (v21 == 4)
          break;
        v19 = v20[1];
        if (!v19)
        {
          v12 = v20 + 1;
          goto LABEL_43;
        }
      }
    }
    else
    {
LABEL_43:
      v22 = (uint64_t *)v20;
      v20 = (uint64_t **)operator new(0x30uLL);
      *((_DWORD *)v20 + 8) = 4;
      v20[5] = 0;
      *v20 = 0;
      v20[1] = 0;
      v20[2] = v22;
      *v12 = (uint64_t *)v20;
      v23 = **(_QWORD **)(a1 + 56);
      v24 = (uint64_t *)v20;
      if (v23)
      {
        *(_QWORD *)(a1 + 56) = v23;
        v24 = *v12;
      }
      sub_18F62A74C(*(uint64_t **)(a1 + 64), v24);
      ++*(_QWORD *)(a1 + 72);
    }
    v20[5] = (uint64_t *)v17;
    dispatch_source_set_timer(v17, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_18F7590D4;
    handler[3] = &unk_1E2990D90;
    handler[4] = a1;
    v45 = 4;
    dispatch_source_set_event_handler(v17, handler);
    dispatch_resume(v17);
    goto LABEL_47;
  }
  if (qword_1EE172128 != -1)
    dispatch_once(&qword_1EE172128, &unk_1E2993038);
  v32 = qword_1EE172130;
  if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_FAULT))
  {
    v33 = (_QWORD *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v33 = (_QWORD *)*v33;
    sub_18F5D5990(buf, "SendLocationTimeout");
    if (buf[23] >= 0)
      v34 = buf;
    else
      v34 = *(_BYTE **)buf;
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = v33;
    v51 = 2082;
    v52 = v34;
    _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_FAULT, "%scannot create timer, event, %{public}s", __p, 0x16u);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v35 = (_QWORD *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0)
      v35 = (_QWORD *)*v35;
    sub_18F5D5990(__p, "SendLocationTimeout");
    if (v53 >= 0)
      v36 = __p;
    else
      v36 = *(_BYTE **)__p;
    *(_DWORD *)v46 = 136315394;
    *(_QWORD *)&v46[4] = v35;
    v47 = 2082;
    v48 = v36;
    v10 = (char *)_os_log_send_and_compose_impl();
    if (SHIBYTE(v53) < 0)
      operator delete(*(void **)__p);
    goto LABEL_89;
  }
}

void sub_18F754C9C(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  uint64_t *v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  _QWORD *v12;
  void **v13;
  _QWORD *v14;
  _BYTE *v15;
  char *v16;
  NSObject *v17;
  _QWORD *v18;
  void **v19;
  _QWORD *v20;
  _BYTE *v21;
  _BYTE buf[12];
  __int16 v23;
  void **v24;
  char v25;
  int v26;
  _QWORD *v27;
  __int16 v28;
  _BYTE *v29;
  void *__p[2];
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4)
    goto LABEL_33;
  v5 = a1 + 64;
  do
  {
    v6 = *(_DWORD *)(v4 + 32);
    v7 = v6 < a2;
    if (v6 >= a2)
      v8 = (uint64_t *)v4;
    else
      v8 = (uint64_t *)(v4 + 8);
    if (!v7)
      v5 = v4;
    v4 = *v8;
  }
  while (*v8);
  if (v5 != a1 + 64 && *(_DWORD *)(v5 + 32) <= a2 && (v9 = *(NSObject **)(v5 + 40)) != 0)
  {
    dispatch_source_set_timer(v9, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v10 = qword_1EE172130;
    v11 = *(_BYTE *)(a1 + 120);
    if (os_log_type_enabled((os_log_t)qword_1EE172130, v11))
    {
      v12 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v12 = (_QWORD *)*v12;
      sub_18F754134(__p, a2);
      if (v31 >= 0)
        v13 = __p;
      else
        v13 = (void **)__p[0];
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v12;
      v23 = 2080;
      v24 = v13;
      _os_log_impl(&dword_18F5B3000, v10, v11, "%scancel timer,event,%s", buf, 0x16u);
      if (v31 < 0)
        operator delete(__p[0]);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      v14 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v14 = (_QWORD *)*v14;
      sub_18F754134(buf, a2);
      if (v25 >= 0)
        v15 = buf;
      else
        v15 = *(_BYTE **)buf;
      v26 = 136315394;
      v27 = v14;
      v28 = 2080;
      v29 = v15;
      v16 = (char *)_os_log_send_and_compose_impl();
      if (v25 < 0)
        operator delete(*(void **)buf);
LABEL_54:
      sub_18F5F2740("Generic", 1, 0, 2, "void CLStateMachine<CLEmergencyLocationSelectorInternal>::cancelTimeoutEvent(Event) [T = CLEmergencyLocationSelectorInternal]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)__p)
        free(v16);
    }
  }
  else
  {
LABEL_33:
    if (qword_1EE172128 != -1)
      dispatch_once(&qword_1EE172128, &unk_1E2993038);
    v17 = qword_1EE172130;
    if (os_log_type_enabled((os_log_t)qword_1EE172130, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v18 = (_QWORD *)*v18;
      sub_18F754134(__p, a2);
      if (v31 >= 0)
        v19 = __p;
      else
        v19 = (void **)__p[0];
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v18;
      v23 = 2080;
      v24 = v19;
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEFAULT, "#Warning,%s,cancel timer,notFound, event,%s", buf, 0x16u);
      if (v31 < 0)
        operator delete(__p[0]);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE172128 != -1)
        dispatch_once(&qword_1EE172128, &unk_1E2993038);
      v20 = (_QWORD *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0)
        v20 = (_QWORD *)*v20;
      sub_18F754134(buf, a2);
      if (v25 >= 0)
        v21 = buf;
      else
        v21 = *(_BYTE **)buf;
      v26 = 136315394;
      v27 = v20;
      v28 = 2080;
      v29 = v21;
      v16 = (char *)_os_log_send_and_compose_impl();
      if (v25 < 0)
        operator delete(*(void **)buf);
      goto LABEL_54;
    }
  }
}

uint64_t sub_18F75512C(void **a1, char *a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t result;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  uint8_t *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  unsigned int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint8_t buf[4];
  uint64_t v119;
  __int16 v120;
  double v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  if (!*a1)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v30 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      v119 = (uint64_t)a1;
      _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,isLocationUsable,this:%{private}p,nil fConfig,early return", buf, 0xCu);
    }
    v31 = sub_18F5C4AE0(115, 0);
    result = 0;
    if (!v31)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v32 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLEmergencyLocationSelectorInternal::isLocationUsable(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n");
LABEL_24:
    if (v32 == buf)
      return 0;
    goto LABEL_40;
  }
  if (!a2 || !a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v33 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend_feature(*a1, v34, v35, v36);
      *(_DWORD *)buf = 138543362;
      v119 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v38, v37, v39);
      _os_log_impl(&dword_18F5B3000, v33, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsable,invalid parameters", buf, 0xCu);
    }
    result = sub_18F5C4AE0(115, 2);
    if (!(_DWORD)result)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      goto LABEL_73;
LABEL_39:
    v47 = objc_msgSend_feature(*a1, v27, v28, v29);
    objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v48, v47, v49);
    v32 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLEmergencyLocationSelectorInternal::isLocationUsable(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n", (const char *)v32);
    if (v32 == buf)
      return 0;
LABEL_40:
    free(v32);
    return 0;
  }
  objc_msgSend_coordinate(a3, a2, (uint64_t)a3, a4);
  if (v10 < -180.0 || v10 > 180.0 || v9 > 90.0 || v9 < -90.0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v40 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_msgSend_feature(*a1, v41, v42, v43);
      *(_DWORD *)buf = 138543362;
      v119 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v45, v44, v46);
      _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsable,invalid coordinates", buf, 0xCu);
    }
    result = sub_18F5C4AE0(115, 2);
    if ((_DWORD)result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 == -1)
        goto LABEL_39;
      goto LABEL_73;
    }
    return result;
  }
  v11 = sub_18F757C18(a1, (char *)a3, v7, v8);
  objc_msgSend_maxUsableAge(a2, v12, v13, v14);
  if (fabs(v11) > v18)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v19 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend_feature(*a1, v20, v21, v22);
      *(_DWORD *)buf = 138543618;
      v119 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v24, v23, v25);
      v120 = 2050;
      v121 = v11;
      _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsable,location too old. Age:%{public}f", buf, 0x16u);
    }
    result = sub_18F5C4AE0(115, 2);
    if ((_DWORD)result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 == -1)
        goto LABEL_39;
LABEL_73:
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      goto LABEL_39;
    }
    return result;
  }
  objc_msgSend_horizontalAccuracy(a3, v15, v16, v17);
  if (v53 <= 0.0
    || (objc_msgSend_horizontalAccuracy(a3, v50, v51, v52),
        v55 = v54,
        objc_msgSend_maxUsableHunc(a2, v56, v57, v58),
        v55 > v62))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v63 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v67 = objc_msgSend_feature(*a1, v64, v65, v66);
      v70 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v68, v67, v69);
      objc_msgSend_horizontalAccuracy(a3, v71, v72, v73);
      *(_DWORD *)buf = 138543618;
      v119 = v70;
      v120 = 2050;
      v121 = v74;
      _os_log_impl(&dword_18F5B3000, v63, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsable,horizontal accuracy too low. Hunc:%{public}f", buf, 0x16u);
    }
    result = sub_18F5C4AE0(115, 2);
    if (!(_DWORD)result)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v112 = objc_msgSend_feature(*a1, v109, v110, v111);
    objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v113, v112, v114);
    objc_msgSend_horizontalAccuracy(a3, v115, v116, v117);
LABEL_72:
    v32 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLEmergencyLocationSelectorInternal::isLocationUsable(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n");
    goto LABEL_24;
  }
  v75 = objc_msgSend_integrity(a3, v59, v60, v61);
  if (v75 < objc_msgSend_minUsableIntegrity(a2, v76, v77, v78))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v82 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v86 = objc_msgSend_feature(*a1, v83, v84, v85);
      *(_DWORD *)buf = 138543618;
      v119 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v87, v86, v88);
      v120 = 1026;
      LODWORD(v121) = objc_msgSend_integrity(a3, v89, v90, v91);
      _os_log_impl(&dword_18F5B3000, v82, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsable,integrity too low. Integrity:%{public}d", buf, 0x12u);
    }
    result = sub_18F5C4AE0(115, 2);
    if (!(_DWORD)result)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v95 = objc_msgSend_feature(*a1, v92, v93, v94);
    objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v96, v95, v97);
    objc_msgSend_integrity(a3, v98, v99, v100);
    goto LABEL_72;
  }
  if (!objc_msgSend_vuncCheckRequiredForUsability(a2, v79, v80, v81)
    || (sub_18F755BD8(a1, a2, a3, v101) & 1) != 0)
  {
    return 1;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v102 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v106 = objc_msgSend_feature(*a1, v103, v104, v105);
    *(_DWORD *)buf = 138543362;
    v119 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v107, v106, v108);
    _os_log_impl(&dword_18F5B3000, v102, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsable,unusable altitude", buf, 0xCu);
  }
  result = sub_18F5C4AE0(115, 2);
  if ((_DWORD)result)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      goto LABEL_73;
    goto LABEL_39;
  }
  return result;
}

uint64_t sub_18F755BD8(void **a1, char *a2, void *a3, uint64_t a4)
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  char *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  if (*a1)
  {
    if (a2 && a3)
    {
      objc_msgSend_verticalAccuracy(a3, a2, (uint64_t)a3, a4);
      if (v10 > 0.0
        && (objc_msgSend_verticalAccuracy(a3, v7, v8, v9),
            v12 = v11,
            objc_msgSend_maxUsableVunc(a2, v13, v14, v15),
            v12 <= v19))
      {
        objc_msgSend_ellipsoidalAltitude(a3, v16, v17, v18);
        if (v55 >= -450.0 && (objc_msgSend_ellipsoidalAltitude(a3, v52, v53, v54), v56 <= 8850.0))
        {
          return 1;
        }
        else
        {
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
          v57 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            v61 = objc_msgSend_feature(*a1, v58, v59, v60);
            v64 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v62, v61, v63);
            objc_msgSend_ellipsoidalAltitude(a3, v65, v66, v67);
            *(_DWORD *)buf = 138543619;
            v85 = v64;
            v86 = 2049;
            v87 = v68;
            _os_log_impl(&dword_18F5B3000, v57, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isAltitudeUsable,NO,received altitude is not valid,%{private}.2f", buf, 0x16u);
          }
          result = sub_18F5C4AE0(115, 2);
          if ((_DWORD)result)
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
            v72 = objc_msgSend_feature(*a1, v69, v70, v71);
            objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v73, v72, v74);
            objc_msgSend_ellipsoidalAltitude(a3, v75, v76, v77);
            goto LABEL_38;
          }
        }
      }
      else
      {
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        v20 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_msgSend_feature(*a1, v21, v22, v23);
          v27 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v25, v24, v26);
          objc_msgSend_verticalAccuracy(a3, v28, v29, v30);
          *(_DWORD *)buf = 138543618;
          v85 = v27;
          v86 = 2050;
          v87 = v31;
          _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isAltitudeUsable,NO,vertical accuracy too low,%{public}.2f", buf, 0x16u);
        }
        result = sub_18F5C4AE0(115, 2);
        if ((_DWORD)result)
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
          v36 = objc_msgSend_feature(*a1, v33, v34, v35);
          objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v37, v36, v38);
          objc_msgSend_verticalAccuracy(a3, v39, v40, v41);
LABEL_38:
          v44 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLEmergencyLocationSelectorInternal::isAltitudeUsable(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n");
          goto LABEL_39;
        }
      }
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v45 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v49 = objc_msgSend_feature(*a1, v46, v47, v48);
        *(_DWORD *)buf = 138543362;
        v85 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v50, v49, v51);
        _os_log_impl(&dword_18F5B3000, v45, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isAltitudeUsable,NO,invalid parameters", buf, 0xCu);
      }
      result = sub_18F5C4AE0(115, 2);
      if ((_DWORD)result)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        v81 = objc_msgSend_feature(*a1, v78, v79, v80);
        objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v82, v81, v83);
        v44 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLEmergencyLocationSelectorInternal::isAltitudeUsable(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n", v44);
        if (v44 == (char *)buf)
          return 0;
        goto LABEL_40;
      }
    }
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v42 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      v85 = (uint64_t)a1;
      _os_log_impl(&dword_18F5B3000, v42, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,isAltitudeUsable,this:%{private}p,nil fConfig,early return", buf, 0xCu);
    }
    v43 = sub_18F5C4AE0(115, 0);
    result = 0;
    if (v43)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v44 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLEmergencyLocationSelectorInternal::isAltitudeUsable(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n");
LABEL_39:
      if (v44 == (char *)buf)
        return 0;
LABEL_40:
      free(v44);
      return 0;
    }
  }
  return result;
}

void sub_18F756288(uint64_t a1, char *a2, int a3, uint64_t a4)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  CLLocation *v59;
  const char *v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  __int128 v75;
  unint64_t v76;
  uint64_t v77;
  _BYTE v78[528];
  _OWORD v79[8];
  _OWORD v80[2];
  int v81;
  uint64_t v82;
  __int128 v83;
  _OWORD v84[2];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _OWORD v90[2];
  uint8_t buf[4];
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)a1)
  {
    if (!a2 || (v7 = *(void **)(a1 + 176)) == 0)
    {
      sub_18F7586E8(a1, 0);
      return;
    }
    if (sub_18F755BD8((void **)a1, a2, v7, a4))
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v11 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend_feature(*(void **)a1, v12, v13, v14);
        *(_DWORD *)buf = 138543362;
        v92 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v16, v15, v17);
        _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,sendCachedLocation,location sent to client without altitude stitching", buf, 0xCu);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        v66 = objc_msgSend_feature(*(void **)a1, v63, v64, v65);
        LODWORD(v83) = 138543362;
        *(_QWORD *)((char *)&v83 + 4) = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v67, v66, v68);
        v69 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::sendCachedLocation(CLEmergencyLocationUsabilityCriteria *, BOOL)", "CoreLocation: %s\n", v69);
        if (v69 != (char *)buf)
          free(v69);
      }
      sub_18F7586E8(a1, *(void **)(a1 + 176));
      sub_18F758044(a1, *(void **)(a1 + 176), a3);
      if ((a3 & 1) == 0)
        ++*(_DWORD *)(a1 + 256);
      return;
    }
    objc_msgSend_trustedTimestamp(*(void **)(a1 + 176), v8, v9, v10);
    v24 = v23;
    v89 = 0u;
    memset(v90, 0, 28);
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    memset(v84, 0, sizeof(v84));
    v83 = 0u;
    v25 = *(void **)(a1 + 176);
    if (v25)
      objc_msgSend_clientLocation(v25, v20, v21, v22);
    *(_QWORD *)&v90[1] = 0;
    *(_OWORD *)((char *)v84 + 12) = xmmword_18F7722C0;
    if (objc_msgSend_altitudeStitchingEnabled(a2, v20, v21, v22)
      && (v27 = *(char **)(a1 + 184)) != 0
      && sub_18F756B84((void **)a1, a2, v27, v26))
    {
      objc_msgSend_altitude(*(void **)(a1 + 184), v28, v29, v30);
      *(_QWORD *)((char *)v84 + 12) = v31;
      objc_msgSend_ellipsoidalAltitude(*(void **)(a1 + 184), v32, v33, v34);
      *(_QWORD *)&v90[1] = v35;
      objc_msgSend_verticalAccuracy(*(void **)(a1 + 184), v36, v37, v38);
      *(_QWORD *)((char *)&v84[1] + 4) = v39;
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v40 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v44 = objc_msgSend_feature(*(void **)a1, v41, v42, v43);
        v47 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v45, v44, v46);
        *(_DWORD *)buf = 138543362;
        v92 = v47;
        _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,sendCachedLocation,location sent to client with altitude stitching", buf, 0xCu);
      }
      if (!sub_18F5C4AE0(115, 2))
        goto LABEL_39;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 == -1)
      {
LABEL_55:
        v70 = objc_msgSend_feature(*(void **)a1, v48, v49, v50);
        v81 = 138543362;
        v82 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v71, v70, v72);
        v73 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::sendCachedLocation(CLEmergencyLocationUsabilityCriteria *, BOOL)", "CoreLocation: %s\n", v73);
        if (v73 != (char *)buf)
          free(v73);
LABEL_39:
        v59 = [CLLocation alloc];
        v79[6] = v88;
        v79[7] = v89;
        v80[0] = v90[0];
        *(_OWORD *)((char *)v80 + 12) = *(_OWORD *)((char *)v90 + 12);
        v79[2] = v84[1];
        v79[3] = v85;
        v79[4] = v86;
        v79[5] = v87;
        v79[0] = v83;
        v79[1] = v84[0];
        v75 = xmmword_18F773410;
        v76 = 0xBFF0000000000000;
        v77 = v24;
        memcpy(v78, &unk_18F773430, sizeof(v78));
        v61 = (void *)objc_msgSend_initWithClientLocation_clientLocationPrivate_(v59, v60, (uint64_t)v79, (uint64_t)&v75);
        sub_18F7586E8(a1, v61);
        if (v61)
        {
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
          v62 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18F5B3000, v62, OS_LOG_TYPE_DEFAULT, "#CLELS,sendCachedLocation,updating metrics", buf, 2u);
          }
          if (sub_18F5C4AE0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
            LOWORD(v81) = 0;
            v74 = (char *)_os_log_send_and_compose_impl();
            sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::sendCachedLocation(CLEmergencyLocationUsabilityCriteria *, BOOL)", "CoreLocation: %s\n", v74);
            if (v74 != (char *)buf)
              free(v74);
          }
          sub_18F758044(a1, *(void **)(a1 + 176), a3);
        }
        if ((a3 & 1) == 0)
          ++*(_DWORD *)(a1 + 256);

        return;
      }
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v51 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v55 = objc_msgSend_feature(*(void **)a1, v52, v53, v54);
        v58 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v56, v55, v57);
        *(_DWORD *)buf = 138543362;
        v92 = v58;
        _os_log_impl(&dword_18F5B3000, v51, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,sendCachedLocation,location sent to client with altitude cleared", buf, 0xCu);
      }
      if (!sub_18F5C4AE0(115, 2))
        goto LABEL_39;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 == -1)
        goto LABEL_55;
    }
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    goto LABEL_55;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v18 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134283521;
    v92 = a1;
    _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,sendCachedLocation,this:%{private}p,nil fConfig,early return", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    LODWORD(v83) = 134283521;
    *(_QWORD *)((char *)&v83 + 4) = a1;
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "void CLEmergencyLocationSelectorInternal::sendCachedLocation(CLEmergencyLocationUsabilityCriteria *, BOOL)", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
}

uint64_t sub_18F756B84(void **a1, void *a2, char *a3, uint64_t a4)
{
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t result;
  NSObject *v12;
  int v13;
  char *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!*a1)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v12 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      v36 = (uint64_t)a1;
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,isLocationRecentEnough,this:%{private}p,nil fConfig,early return", buf, 0xCu);
    }
    v13 = sub_18F5C4AE0(115, 0);
    result = 0;
    if (!v13)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLEmergencyLocationSelectorInternal::isLocationRecentEnough(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      goto LABEL_30;
    return 0;
  }
  if (!a2 || !a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v15 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend_feature(*a1, v16, v17, v18);
      *(_DWORD *)buf = 138543362;
      v36 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v20, v19, v21);
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,canSendLocationAtTimeout,will send nil location", buf, 0xCu);
    }
    result = sub_18F5C4AE0(115, 2);
    if (!(_DWORD)result)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 == -1)
    {
LABEL_29:
      v32 = objc_msgSend_feature(*a1, v22, v23, v24);
      objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v33, v32, v34);
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLEmergencyLocationSelectorInternal::isLocationRecentEnough(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf)
LABEL_30:
        free(v14);
      return 0;
    }
LABEL_32:
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    goto LABEL_29;
  }
  v6 = sub_18F757C18(a1, a3, (uint64_t)a3, a4);
  objc_msgSend_maxUsableAge(a2, v7, v8, v9);
  if (fabs(v6) <= v10)
    return 1;
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v25 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend_feature(*a1, v26, v27, v28);
    *(_DWORD *)buf = 138543618;
    v36 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v30, v29, v31);
    v37 = 2050;
    v38 = v6;
    _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,canSendLocationAtTimeout,not sending,location too old. Age:%{public}f", buf, 0x16u);
  }
  result = sub_18F5C4AE0(115, 2);
  if ((_DWORD)result)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 == -1)
      goto LABEL_29;
    goto LABEL_32;
  }
  return result;
}

uint64_t sub_18F757038(void **a1, char *a2, void *a3, uint64_t a4)
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  NSObject *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  char *v130;
  uint8_t buf[4];
  uint64_t v132;
  __int16 v133;
  double v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  if (*a1)
  {
    if (a2 && a3)
    {
      objc_msgSend_horizontalAccuracy(a3, a2, (uint64_t)a3, a4);
      if (v10 > 0.0)
      {
        v11 = objc_msgSend_integrity(a3, v7, v8, v9);
        if (v11 < objc_msgSend_minUsableIntegrity(a2, v12, v13, v14))
        {
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
          v18 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_msgSend_feature(*a1, v19, v20, v21);
            *(_DWORD *)buf = 138543618;
            v132 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v23, v22, v24);
            v133 = 1026;
            LODWORD(v134) = objc_msgSend_integrity(a3, v25, v26, v27);
            _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsableForFirstUpdate,not saving,integrity too low. Integrity:%{public}d", buf, 0x12u);
          }
          result = sub_18F5C4AE0(115, 2);
          if ((_DWORD)result)
          {
            bzero(buf, 0x65CuLL);
            if (qword_1ECD8E758 != -1)
              dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
            v32 = objc_msgSend_feature(*a1, v29, v30, v31);
            objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v33, v32, v34);
            objc_msgSend_integrity(a3, v35, v36, v37);
            v38 = (char *)_os_log_send_and_compose_impl();
            sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLEmergencyLocationSelectorInternal::isLocationUsableForFirstUpdate(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n");
            goto LABEL_22;
          }
          return result;
        }
        v61 = a1[24];
        if (v61)
        {
          objc_msgSend_horizontalAccuracy(v61, v15, v16, v17);
          v63 = v62;
          objc_msgSend_horizontalAccuracy(a3, v64, v65, v66);
          if (v63 < v70)
          {
            objc_msgSend_coordinate(a1[24], v67, v68, v69);
            v72 = v71;
            objc_msgSend_coordinate(a1[24], v73, v74, v75);
            v77 = v76;
            objc_msgSend_coordinate(a3, v78, v79, v80);
            v82 = v81;
            objc_msgSend_coordinate(a3, v83, v84, v85);
            v87 = sub_18F5BD12C(v72, v77, v82, v86);
            objc_msgSend_locationUpdateDistanceMovedToSendEarly(*a1, v88, v89, v90);
            if (v87 < v94 || (objc_msgSend_horizontalAccuracy(a3, v91, v92, v93), v87 < v95))
            {
              if (qword_1ECD8E758 != -1)
                dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
              v96 = qword_1ECD8E750;
              if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
              {
                v100 = objc_msgSend_feature(*a1, v97, v98, v99);
                *(_DWORD *)buf = 138543362;
                v132 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v101, v100, v102);
                _os_log_impl(&dword_18F5B3000, v96, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsableForFirstUpdate,not saving", buf, 0xCu);
              }
              result = sub_18F5C4AE0(115, 2);
              if (!(_DWORD)result)
                return result;
              bzero(buf, 0x65CuLL);
              if (qword_1ECD8E758 == -1)
                goto LABEL_37;
LABEL_75:
              dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
              goto LABEL_37;
            }
            if (qword_1EE1720A0 != -1)
              dispatch_once(&qword_1EE1720A0, &unk_1E2993018);
            v120 = qword_1EE172098;
            if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
            {
              v124 = objc_msgSend_feature(*a1, v121, v122, v123);
              *(_DWORD *)buf = 138543618;
              v132 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v125, v124, v126);
              v133 = 2050;
              v134 = v87;
              _os_log_impl(&dword_18F5B3000, v120, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsableForFirstUpdate,saving,location changed significantly,dist,%{public}f", buf, 0x16u);
            }
            if (!sub_18F5C4AE0(115, 2))
              return 1;
            bzero(buf, 0x65CuLL);
            if (qword_1EE1720A0 != -1)
              dispatch_once(&qword_1EE1720A0, &unk_1E2993018);
LABEL_73:
            v127 = objc_msgSend_feature(*a1, v110, v111, v112);
            objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v128, v127, v129);
            v130 = (char *)_os_log_send_and_compose_impl();
            sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLEmergencyLocationSelectorInternal::isLocationUsableForFirstUpdate(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n", v130);
            if (v130 != (char *)buf)
              free(v130);
            return 1;
          }
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
          v113 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            v117 = objc_msgSend_feature(*a1, v114, v115, v116);
            *(_DWORD *)buf = 138543362;
            v132 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v118, v117, v119);
            _os_log_impl(&dword_18F5B3000, v113, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsableForFirstUpdate,saving,better Hunc", buf, 0xCu);
          }
          if (!sub_18F5C4AE0(115, 2))
            return 1;
          bzero(buf, 0x65CuLL);
          if (qword_1ECD8E758 == -1)
            goto LABEL_73;
        }
        else
        {
          if (qword_1ECD8E758 != -1)
            dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
          v103 = qword_1ECD8E750;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
          {
            v107 = objc_msgSend_feature(*a1, v104, v105, v106);
            *(_DWORD *)buf = 138543362;
            v132 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v108, v107, v109);
            _os_log_impl(&dword_18F5B3000, v103, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsableForFirstUpdate,saving,haven't save first update before.", buf, 0xCu);
          }
          if (!sub_18F5C4AE0(115, 2))
            return 1;
          bzero(buf, 0x65CuLL);
          if (qword_1ECD8E758 == -1)
            goto LABEL_73;
        }
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        goto LABEL_73;
      }
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v51 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v55 = objc_msgSend_feature(*a1, v52, v53, v54);
        *(_DWORD *)buf = 138543362;
        v132 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v56, v55, v57);
        _os_log_impl(&dword_18F5B3000, v51, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsableForFirstUpdate,not saving,invalid hunc", buf, 0xCu);
      }
      result = sub_18F5C4AE0(115, 2);
      if (!(_DWORD)result)
        return result;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        goto LABEL_75;
    }
    else
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v41 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_msgSend_feature(*a1, v42, v43, v44);
        *(_DWORD *)buf = 138543362;
        v132 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v46, v45, v47);
        _os_log_impl(&dword_18F5B3000, v41, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,isLocationUsableForFirstUpdate,not saving,invalid parameters", buf, 0xCu);
      }
      result = sub_18F5C4AE0(115, 2);
      if (!(_DWORD)result)
        return result;
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        goto LABEL_75;
    }
LABEL_37:
    v58 = objc_msgSend_feature(*a1, v48, v49, v50);
    objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v59, v58, v60);
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLEmergencyLocationSelectorInternal::isLocationUsableForFirstUpdate(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n", v38);
    if (v38 == (char *)buf)
      return 0;
LABEL_38:
    free(v38);
    return 0;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v39 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134283521;
    v132 = (uint64_t)a1;
    _os_log_impl(&dword_18F5B3000, v39, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,isLocationUsableForFirstUpdate,this:%{private}p,nil fConfig,early return", buf, 0xCu);
  }
  v40 = sub_18F5C4AE0(115, 0);
  result = 0;
  if (v40)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLEmergencyLocationSelectorInternal::isLocationUsableForFirstUpdate(CLEmergencyLocationUsabilityCriteria *, CLLocation *)", "CoreLocation: %s\n");
LABEL_22:
    if (v38 == (char *)buf)
      return 0;
    goto LABEL_38;
  }
  return result;
}

double sub_18F757C18(void **a1, char *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double result;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!*a1)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v14 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      v30 = (uint64_t)a1;
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,getAge,this:%{private}p,nil fConfig,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 1.79769313e308;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "CFTimeInterval CLEmergencyLocationSelectorInternal::getAge(CLLocation *)", "CoreLocation: %s\n", v15);
    if (v15 == (char *)buf)
      return 1.79769313e308;
    goto LABEL_22;
  }
  if (a2)
  {
    v6 = (void *)objc_msgSend_date(MEMORY[0x1E0C99D68], a2, a3, a4);
    v10 = objc_msgSend_timestamp(a2, v7, v8, v9);
    objc_msgSend_timeIntervalSinceDate_(v6, v11, v10, v12);
    return result;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v16 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend_feature(*a1, v17, v18, v19);
    *(_DWORD *)buf = 138543362;
    v30 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v21, v20, v22);
    _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,getAge,invalid parameters", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v26 = objc_msgSend_feature(*a1, v23, v24, v25);
    objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v27, v26, v28);
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "CFTimeInterval CLEmergencyLocationSelectorInternal::getAge(CLLocation *)", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf)
LABEL_22:
      free(v15);
  }
  return 1.79769313e308;
}

uint64_t sub_18F757FA4(uint64_t result, double *a2, double *a3)
{
  void *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  if (result)
  {
    v5 = (void *)result;
    v21 = 0.0;
    v22 = 0.0;
    CLGetUncertaintyScaleFactors(0x5Fu, &v22, &v21);
    v6 = v22;
    objc_msgSend_horizontalAccuracy(v5, v7, v8, v9);
    *a2 = v6 * v10;
    result = objc_msgSend_verticalAccuracy(v5, v11, v12, v13);
    v17 = -1.0;
    if (v18 > 0.0)
    {
      v19 = v21;
      result = objc_msgSend_verticalAccuracy(v5, v14, v15, v16);
      v17 = v19 * v20;
    }
    *a3 = v17;
  }
  else
  {
    *a2 = -1.0;
    *a3 = -1.0;
  }
  return result;
}

void sub_18F758044(uint64_t a1, void *a2, int a3)
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  double v51;
  double v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  char *v63;
  char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint8_t buf[4];
  int v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v5 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#CLELS,updateSessionStats,updating metrics for first location", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v63 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::updateSessionStats(CLLocation *, BOOL)", "CoreLocation: %s\n", v63);
      if (v63 != (char *)buf)
        free(v63);
    }
    *(_BYTE *)(a1 + 208) = 1;
    *(_DWORD *)(a1 + 224) = objc_msgSend_integrity(a2, v6, v7, v8);
    *(_DWORD *)(a1 + 212) = objc_msgSend_type(a2, v9, v10, v11);
    objc_msgSend_horizontalAccuracy(a2, v12, v13, v14);
    *(_DWORD *)(a1 + 216) = (int)v15;
    objc_msgSend_verticalAccuracy(a2, v16, v17, v18);
    *(_DWORD *)(a1 + 220) = (int)v19;
    *(_DWORD *)(a1 + 228) = (int)sub_18F757C18((void **)a1, (char *)a2, v20, v21);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v22 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_DEFAULT, "#CLELS,updateSessionStats,updating metrics for periodic update", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v64 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::updateSessionStats(CLLocation *, BOOL)", "CoreLocation: %s\n", v64);
      if (v64 != (char *)buf)
        free(v64);
    }
    v26 = *(_DWORD *)(a1 + 264);
    if (v26 < 1 || (v27 = (double)v26, objc_msgSend_horizontalAccuracy(a2, v23, v24, v25), v31 < v27))
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v32 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v36 = *(_DWORD *)(a1 + 264);
        objc_msgSend_horizontalAccuracy(a2, v33, v34, v35);
        *(_DWORD *)buf = 67109376;
        v74 = v36;
        v75 = 2048;
        v76 = v37;
        _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_DEFAULT, "#CLELS,updateSessionStats,updating HACC for periodic update,horizontalAccOfLocInBestPeriodicUpdate,%d,horizontalAccuracy,%f", buf, 0x12u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        objc_msgSend_horizontalAccuracy(a2, v65, v66, v67);
        v68 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::updateSessionStats(CLLocation *, BOOL)", "CoreLocation: %s\n", v68);
        if (v68 != (char *)buf)
          free(v68);
      }
      *(_DWORD *)(a1 + 272) = objc_msgSend_integrity(a2, v38, v39, v40);
      *(_DWORD *)(a1 + 280) = objc_msgSend_type(a2, v41, v42, v43);
      objc_msgSend_horizontalAccuracy(a2, v44, v45, v46);
      *(_DWORD *)(a1 + 264) = (int)v47;
      *(_DWORD *)(a1 + 276) = (int)sub_18F757C18((void **)a1, (char *)a2, v48, v49);
    }
    v50 = *(_DWORD *)(a1 + 268);
    if (v50 < 1 || (v51 = (double)v50, objc_msgSend_verticalAccuracy(a2, v28, v29, v30), v52 < v51))
    {
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
      v53 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
      {
        v57 = *(_DWORD *)(a1 + 268);
        objc_msgSend_verticalAccuracy(a2, v54, v55, v56);
        *(_DWORD *)buf = 67109376;
        v74 = v57;
        v75 = 2048;
        v76 = v58;
        _os_log_impl(&dword_18F5B3000, v53, OS_LOG_TYPE_DEFAULT, "#CLELS,updateSessionStats,updating VACC for periodic update,verticalAccOfLocInBestPeriodicUpdate,%d,verticalAccuracy,%f", buf, 0x12u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
        objc_msgSend_verticalAccuracy(a2, v69, v70, v71);
        v72 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::updateSessionStats(CLLocation *, BOOL)", "CoreLocation: %s\n", v72);
        if (v72 != (char *)buf)
          free(v72);
      }
      objc_msgSend_verticalAccuracy(a2, v59, v60, v61);
      *(_DWORD *)(a1 + 268) = (int)v62;
    }
    ++*(_DWORD *)(a1 + 260);
  }
}

void sub_18F7586E8(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  NSObject *v56;
  NSObject *v57;
  char *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
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
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
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
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  int v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  _OWORD v122[6];
  __int128 v123;
  __int128 v124;
  _BYTE v125[28];
  int v126;
  uint64_t v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  uint64_t v131;
  __int16 v132;
  uint64_t v133;
  __int16 v134;
  uint64_t v135;
  __int16 v136;
  uint64_t v137;
  __int16 v138;
  uint64_t v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  int v143;
  __int16 v144;
  int v145;
  uint8_t buf[16];
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[28];
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)a1)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v56 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_18F5B3000, v56, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,sendLocation,this:%{private}p,nil fConfig,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    LODWORD(v122[0]) = 134283521;
    *(_QWORD *)((char *)v122 + 4) = a1;
LABEL_25:
    v58 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "void CLEmergencyLocationSelectorInternal::sendLocation(CLLocation *)", "CoreLocation: %s\n", v58);
    if (v58 == (char *)buf)
      return;
    goto LABEL_46;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v57 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_18F5B3000, v57, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,sendLocation,this:%{private}p,nil fSendLocationCb,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    LODWORD(v122[0]) = 134283521;
    *(_QWORD *)((char *)v122 + 4) = a1;
    goto LABEL_25;
  }

  *(_QWORD *)(a1 + 160) = a2;
  v4 = mach_continuous_time();
  *(double *)(a1 + 168) = sub_18F6BDF00(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  if (*(_QWORD *)(a1 + 160))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v5 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_feature(*(void **)a1, v6, v7, v8);
      v12 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v10, v9, v11);
      objc_msgSend_coordinate(*(void **)(a1 + 160), v13, v14, v15);
      v17 = v16;
      objc_msgSend_coordinate(*(void **)(a1 + 160), v18, v19, v20);
      v22 = v21;
      objc_msgSend_horizontalAccuracy(*(void **)(a1 + 160), v23, v24, v25);
      v27 = v26;
      objc_msgSend_altitude(*(void **)(a1 + 160), v28, v29, v30);
      v32 = v31;
      objc_msgSend_ellipsoidalAltitude(*(void **)(a1 + 160), v33, v34, v35);
      v37 = v36;
      objc_msgSend_verticalAccuracy(*(void **)(a1 + 160), v38, v39, v40);
      v42 = v41;
      v49 = objc_msgSend_timestamp(*(void **)(a1 + 160), v43, v44, v45);
      v50 = *(void **)(a1 + 160);
      if (v50)
      {
        objc_msgSend_clientLocation(v50, v46, v47, v48);
        v51 = v152;
        v55 = objc_msgSend_integrity(*(void **)(a1 + 160), v52, v53, v54);
      }
      else
      {
        v51 = 0;
        v153 = 0u;
        memset(v154, 0, sizeof(v154));
        v151 = 0u;
        v152 = 0u;
        v149 = 0u;
        v150 = 0u;
        v147 = 0u;
        v148 = 0u;
        *(_OWORD *)buf = 0u;
        v55 = objc_msgSend_integrity(0, v46, v47, v48);
      }
      LODWORD(v122[0]) = 138545667;
      *(_QWORD *)((char *)v122 + 4) = v12;
      WORD6(v122[0]) = 2049;
      *(_QWORD *)((char *)v122 + 14) = v17;
      WORD3(v122[1]) = 2049;
      *((_QWORD *)&v122[1] + 1) = v22;
      LOWORD(v122[2]) = 2050;
      *(_QWORD *)((char *)&v122[2] + 2) = v27;
      WORD5(v122[2]) = 2049;
      *(_QWORD *)((char *)&v122[2] + 12) = v32;
      WORD2(v122[3]) = 2049;
      *(_QWORD *)((char *)&v122[3] + 6) = v37;
      HIWORD(v122[3]) = 2050;
      *(_QWORD *)&v122[4] = v42;
      WORD4(v122[4]) = 2114;
      *(_QWORD *)((char *)&v122[4] + 10) = v49;
      WORD1(v122[5]) = 1026;
      DWORD1(v122[5]) = v51;
      WORD4(v122[5]) = 1026;
      *(_DWORD *)((char *)&v122[5] + 10) = v55;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,sendLocation,lat,%{private}.7f,lon,%{private}.7f,hunc,%{public}f,alt,%{private}f,ellipsoidalAlt,%{private}f,vunc,%{public}f,timestamp,%{public}@,locationType,%{public}d,integrity,%{public}d", (uint8_t *)v122, 0x5Eu);
    }
    if (!sub_18F5C4AE0(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v75 = objc_msgSend_feature(*(void **)a1, v72, v73, v74);
    v78 = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v76, v75, v77);
    objc_msgSend_coordinate(*(void **)(a1 + 160), v79, v80, v81);
    v83 = v82;
    objc_msgSend_coordinate(*(void **)(a1 + 160), v84, v85, v86);
    v88 = v87;
    objc_msgSend_horizontalAccuracy(*(void **)(a1 + 160), v89, v90, v91);
    v93 = v92;
    objc_msgSend_altitude(*(void **)(a1 + 160), v94, v95, v96);
    v98 = v97;
    objc_msgSend_ellipsoidalAltitude(*(void **)(a1 + 160), v99, v100, v101);
    v103 = v102;
    objc_msgSend_verticalAccuracy(*(void **)(a1 + 160), v104, v105, v106);
    v108 = v107;
    v115 = objc_msgSend_timestamp(*(void **)(a1 + 160), v109, v110, v111);
    v116 = *(void **)(a1 + 160);
    if (v116)
    {
      objc_msgSend_clientLocation(v116, v112, v113, v114);
      v117 = v123;
      v121 = objc_msgSend_integrity(*(void **)(a1 + 160), v118, v119, v120);
    }
    else
    {
      v117 = 0;
      v124 = 0u;
      memset(v125, 0, sizeof(v125));
      v123 = 0u;
      memset(v122, 0, sizeof(v122));
      v121 = objc_msgSend_integrity(0, v112, v113, v114);
    }
    v126 = 138545667;
    v127 = v78;
    v128 = 2049;
    v129 = v83;
    v130 = 2049;
    v131 = v88;
    v132 = 2050;
    v133 = v93;
    v134 = 2049;
    v135 = v98;
    v136 = 2049;
    v137 = v103;
    v138 = 2050;
    v139 = v108;
    v140 = 2114;
    v141 = v115;
    v142 = 1026;
    v143 = v117;
    v144 = 1026;
    v145 = v121;
    goto LABEL_45;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v59 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v63 = objc_msgSend_feature(*(void **)a1, v60, v61, v62);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v64, v63, v65);
    _os_log_impl(&dword_18F5B3000, v59, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,sendLocation,nil location sent to client", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    v69 = objc_msgSend_feature(*(void **)a1, v66, v67, v68);
    LODWORD(v122[0]) = 138543362;
    *(_QWORD *)((char *)v122 + 4) = objc_msgSend_featureString_(CLEmergencyLocationSelectorConfig, v70, v69, v71);
LABEL_45:
    v58 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::sendLocation(CLLocation *)", "CoreLocation: %s\n", v58);
    if (v58 == (char *)buf)
      return;
LABEL_46:
    free(v58);
  }
}

uint64_t sub_18F758E68(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

os_log_t sub_18F758E70()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Core", "Client");
  qword_1ECD8E750 = (uint64_t)result;
  return result;
}

os_log_t sub_18F758E9C()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Position", "Emergency");
  qword_1EE172098 = (uint64_t)result;
  return result;
}

void sub_18F758ECC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x194002D30);
}

uint64_t sub_18F758EF4(uint64_t a1, uint64_t a2)
{
  if (sub_18F64FAAC(a2, (uint64_t)&unk_1E298E360))
    return a1 + 24;
  else
    return 0;
}

os_log_t sub_18F758F34()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Position", "Gnss");
  qword_1EE172130 = (uint64_t)result;
  return result;
}

uint64_t sub_18F758F60(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;

  v2 = *(_QWORD **)(a1 + 56);
  v3 = (_QWORD *)(a1 + 64);
  if (v2 != (_QWORD *)(a1 + 64))
  {
    do
    {
      sub_18F754C9C(a1, *((_DWORD *)v2 + 8));
      v4 = (_QWORD *)v2[1];
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (_QWORD *)v2[2];
          v6 = *v5 == (_QWORD)v2;
          v2 = v5;
        }
        while (!v6);
      }
      v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(char *)(a1 + 119) < 0)
    operator delete(*(void **)(a1 + 96));
  sub_18F6EC574(*(_QWORD **)(a1 + 64));
  sub_18F5D6004(a1 + 32);
  sub_18F6EC574(*(_QWORD **)(a1 + 16));
  return a1;
}

uint64_t **sub_18F759008(uint64_t **a1, int a2, _DWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  int v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = a1 + 1;
LABEL_9:
    v9 = (uint64_t *)v7;
    v7 = (uint64_t **)operator new(0x38uLL);
    *((_DWORD *)v7 + 8) = *a3;
    v7[5] = 0;
    v7[6] = 0;
    *v7 = 0;
    v7[1] = 0;
    v7[2] = v9;
    *v6 = (uint64_t *)v7;
    v10 = (uint64_t *)**a1;
    v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      v11 = *v6;
    }
    sub_18F62A74C(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

void sub_18F7590D4(uint64_t a1)
{
  sub_18F75276C(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

os_log_t sub_18F7590E4()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Core", "Client");
  qword_1ECD8E750 = (uint64_t)result;
  return result;
}

os_log_t sub_18F759CD0()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Core", "Core");
  qword_1ECD8E740 = (uint64_t)result;
  return result;
}

uint64_t sub_18F75B748(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
}

_QWORD *sub_18F75B758(_QWORD *a1)
{
  __CFNotificationCenter *LocalCenter;

  *a1 = off_1E298F7D8;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, a1);
  if (*((char *)a1 + 151) < 0)
    operator delete((void *)a1[16]);
  if (*((char *)a1 + 127) < 0)
    operator delete((void *)a1[13]);
  if (*((char *)a1 + 103) < 0)
    operator delete((void *)a1[10]);
  if (*((char *)a1 + 79) < 0)
    operator delete((void *)a1[7]);
  sub_18F66AD0C((uint64_t)(a1 + 5));
  sub_18F5D6004((uint64_t)(a1 + 3));
  return a1;
}

uint64_t sub_18F75B7EC()
{
  const char *v0;
  uint64_t v1;

  qword_1ECD8F8F0 = objc_opt_new();
  return objc_msgSend_setDateFormat_((void *)qword_1ECD8F8F0, v0, (uint64_t)CFSTR("yyyy-MM-dd_HH-mm-ss"), v1);
}

void sub_18F75B818(uint64_t a1@<X8>)
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&qword_1ECD8F900);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1ECD8F900))
  {
    unk_1ECD8F940 = 0;
    xmmword_1ECD8F930 = 0uLL;
    __cxa_atexit(MEMORY[0x1E0DE44D0], &xmmword_1ECD8F930, &dword_18F5B3000);
    __cxa_guard_release(&qword_1ECD8F900);
  }
  if (qword_1ECD8F908 != -1)
    dispatch_once(&qword_1ECD8F908, &unk_1E29930C8);
  if (byte_1ECD8F947 < 0)
  {
    sub_18F5C6990((_BYTE *)a1, (void *)xmmword_1ECD8F930, *((unint64_t *)&xmmword_1ECD8F930 + 1));
  }
  else
  {
    *(_OWORD *)a1 = xmmword_1ECD8F930;
    *(_QWORD *)(a1 + 16) = unk_1ECD8F940;
  }
}

void sub_18F75B8EC()
{
  JUMPOUT(0x194002BECLL);
}

void sub_18F75B900(uint64_t a1@<X8>)
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&qword_1ECD8F910);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1ECD8F910))
  {
    unk_1ECD8F958 = 0;
    xmmword_1ECD8F948 = 0uLL;
    __cxa_atexit(MEMORY[0x1E0DE44D0], &xmmword_1ECD8F948, &dword_18F5B3000);
    __cxa_guard_release(&qword_1ECD8F910);
  }
  if (qword_1ECD8F918 != -1)
    dispatch_once(&qword_1ECD8F918, &unk_1E29930E8);
  if (byte_1ECD8F95F < 0)
  {
    sub_18F5C6990((_BYTE *)a1, (void *)xmmword_1ECD8F948, *((unint64_t *)&xmmword_1ECD8F948 + 1));
  }
  else
  {
    *(_OWORD *)a1 = xmmword_1ECD8F948;
    *(_QWORD *)(a1 + 16) = unk_1ECD8F958;
  }
}

void sub_18F75B9D4()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15[2];
  char v16;
  void *__p[2];
  char v18;

  v0 = (void *)MEMORY[0x1E0CB3940];
  sub_18F5D5990(v15, "mobile");
  sub_18F687DDC((uint64_t)v15, __p);
  if (v18 >= 0)
    v3 = objc_msgSend_stringWithUTF8String_(v0, v1, (uint64_t)__p, v2);
  else
    v3 = objc_msgSend_stringWithUTF8String_(v0, v1, (uint64_t)__p[0], v2);
  v6 = (void *)v3;
  v7 = objc_msgSend_componentsJoinedByString_(&unk_1E29B5B98, v4, (uint64_t)CFSTR("/"), v5);
  v10 = (void *)objc_msgSend_stringByAppendingPathComponent_(v6, v8, v7, v9);
  v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
  MEMORY[0x194002BEC](&xmmword_1ECD8F948, v14);
  if (v18 < 0)
    operator delete(__p[0]);
  if (v16 < 0)
    operator delete(v15[0]);
}

void sub_18F75BA8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_18F75BAC0(uint64_t a1@<X8>)
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&qword_1ECD8F920);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1ECD8F920))
  {
    unk_1ECD8F970 = 0;
    xmmword_1ECD8F960 = 0uLL;
    __cxa_atexit(MEMORY[0x1E0DE44D0], &xmmword_1ECD8F960, &dword_18F5B3000);
    __cxa_guard_release(&qword_1ECD8F920);
  }
  if (qword_1ECD8F928 != -1)
    dispatch_once(&qword_1ECD8F928, &unk_1E2993108);
  if (byte_1ECD8F977 < 0)
  {
    sub_18F5C6990((_BYTE *)a1, (void *)xmmword_1ECD8F960, *((unint64_t *)&xmmword_1ECD8F960 + 1));
  }
  else
  {
    *(_OWORD *)a1 = xmmword_1ECD8F960;
    *(_QWORD *)(a1 + 16) = unk_1ECD8F970;
  }
}

void sub_18F75BB94()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15[2];
  char v16;
  void *__p[2];
  char v18;

  v0 = (void *)MEMORY[0x1E0CB3940];
  sub_18F5D5990(v15, "mobile");
  sub_18F687DDC((uint64_t)v15, __p);
  if (v18 >= 0)
    v3 = objc_msgSend_stringWithUTF8String_(v0, v1, (uint64_t)__p, v2);
  else
    v3 = objc_msgSend_stringWithUTF8String_(v0, v1, (uint64_t)__p[0], v2);
  v6 = (void *)v3;
  v7 = objc_msgSend_componentsJoinedByString_(&unk_1E29B5BB0, v4, (uint64_t)CFSTR("/"), v5);
  v10 = (void *)objc_msgSend_stringByAppendingPathComponent_(v6, v8, v7, v9);
  v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
  MEMORY[0x194002BEC](&xmmword_1ECD8F960, v14);
  if (v18 < 0)
    operator delete(__p[0]);
  if (v16 < 0)
    operator delete(v15[0]);
}

void sub_18F75BC4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_18F75BC80(const void **a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, std::string *a5@<X8>)
{
  size_t v10;
  std::string *v11;
  const void *v12;
  int v13;
  const std::string::value_type *v14;
  std::string::size_type v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  const char *v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void **v27;
  std::string::size_type v28;
  std::string *v29;
  __int128 v30;
  int v31;
  const std::string::value_type *v32;
  std::string::size_type v33;
  std::string *v34;
  void *__p[2];
  unsigned __int8 v36;
  std::string v37;
  std::string v38;
  std::string v39;
  std::string v40;

  if (*((char *)a1 + 23) >= 0)
    v10 = *((unsigned __int8 *)a1 + 23);
  else
    v10 = (size_t)a1[1];
  v11 = &v37;
  sub_18F673A90((uint64_t)&v37, v10 + 1);
  if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v11 = (std::string *)v37.__r_.__value_.__r.__words[0];
  if (v10)
  {
    if (*((char *)a1 + 23) >= 0)
      v12 = a1;
    else
      v12 = *a1;
    memmove(v11, v12, v10);
  }
  *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
  v13 = *(char *)(a2 + 23);
  if (v13 >= 0)
    v14 = (const std::string::value_type *)a2;
  else
    v14 = *(const std::string::value_type **)a2;
  if (v13 >= 0)
    v15 = *(unsigned __int8 *)(a2 + 23);
  else
    v15 = *(_QWORD *)(a2 + 8);
  v16 = std::string::append(&v37, v14, v15);
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = std::string::append(&v38, "_");
  v21 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v39.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v21;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (qword_1ECD8F8F8 != -1)
    dispatch_once(&qword_1ECD8F8F8, &unk_1E2990CD0);
  v22 = (void *)objc_msgSend_stringFromDate_((void *)qword_1ECD8F8F0, v19, a4, v20);
  v26 = (char *)objc_msgSend_UTF8String(v22, v23, v24, v25);
  sub_18F5D5990(__p, v26);
  if ((v36 & 0x80u) == 0)
    v27 = __p;
  else
    v27 = (void **)__p[0];
  if ((v36 & 0x80u) == 0)
    v28 = v36;
  else
    v28 = (std::string::size_type)__p[1];
  v29 = std::string::append(&v39, (const std::string::value_type *)v27, v28);
  v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v40.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  v31 = *(char *)(a3 + 23);
  if (v31 >= 0)
    v32 = (const std::string::value_type *)a3;
  else
    v32 = *(const std::string::value_type **)a3;
  if (v31 >= 0)
    v33 = *(unsigned __int8 *)(a3 + 23);
  else
    v33 = *(_QWORD *)(a3 + 8);
  v34 = std::string::append(&v40, v32, v33);
  *a5 = *v34;
  v34->__r_.__value_.__l.__size_ = 0;
  v34->__r_.__value_.__r.__words[2] = 0;
  v34->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v40.__r_.__value_.__l.__data_);
  if ((char)v36 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v39.__r_.__value_.__l.__data_);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v37.__r_.__value_.__l.__data_);
}

void sub_18F75BE98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 73) < 0)
    operator delete(*(void **)(v33 - 96));
  if (a14 < 0)
    operator delete(__p);
  if (a33 < 0)
    operator delete(a28);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void sub_18F75BF14(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9[2];
  char v10;
  void *__p[2];
  char v12;

  sub_18F75BAC0((uint64_t)v9);
  if (v10 >= 0)
    v4 = (char *)v9;
  else
    v4 = (char *)v9[0];
  sub_18F5D5990(__p, v4);
  v8 = objc_msgSend_date(MEMORY[0x1E0C99D68], v5, v6, v7);
  sub_18F75BC80((const void **)__p, a1 + 80, a1 + 104, v8, a2);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v10 < 0)
    operator delete(v9[0]);
}

void sub_18F75BFAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_18F75BFE0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_date(MEMORY[0x1E0C99D68], a2, a3, a4);
}

uint64_t sub_18F75BFEC(uint64_t a1, char **a2, char *a3)
{
  char *v3;
  char *v4;
  int v5;
  char *v6;
  int64_t v7;
  char *v8;
  char *v9;
  int v12;
  void *v13;
  char *v14;
  char *v15;

  v3 = (char *)*((unsigned __int8 *)a2 + 23);
  if ((char)v3 >= 0)
    v4 = (char *)a2;
  else
    v4 = *a2;
  v5 = a3[23];
  if (v5 >= 0)
    v6 = a3;
  else
    v6 = *(char **)a3;
  if (v5 >= 0)
    v7 = a3[23];
  else
    v7 = *((_QWORD *)a3 + 1);
  if (!v7)
    return 1;
  if ((char)v3 < 0)
    v3 = a2[1];
  v8 = &v3[(_QWORD)v4];
  if ((uint64_t)v3 >= v7)
  {
    v12 = *v6;
    v13 = v4;
    do
    {
      v14 = &v3[-v7];
      if (v14 == (char *)-1)
        break;
      v15 = (char *)memchr(v13, v12, (size_t)(v14 + 1));
      if (!v15)
        break;
      v9 = v15;
      if (!memcmp(v15, v6, v7))
        return v9 != v8 && v9 == v4;
      v13 = v9 + 1;
      v3 = (char *)(v8 - (v9 + 1));
    }
    while ((uint64_t)v3 >= v7);
  }
  v9 = v8;
  return v9 != v8 && v9 == v4;
}

unint64_t sub_18F75C0C0(uint64_t a1, void **a2, char *a3)
{
  unint64_t v3;
  char v4;
  int64_t v5;
  char *v6;
  char *v7;
  unint64_t result;
  char *v9;
  char *v10;
  int64_t v11;
  char *v12;
  int v14;
  int64_t v15;
  char *v16;

  v3 = *((unsigned __int8 *)a2 + 23);
  v4 = a3[23];
  if (v4 >= 0)
    v5 = a3[23];
  else
    v5 = *((_QWORD *)a3 + 1);
  if (v4 >= 0)
    v6 = a3;
  else
    v6 = *(char **)a3;
  if ((v3 & 0x80u) == 0)
  {
    v7 = (char *)a2;
  }
  else
  {
    v3 = (unint64_t)a2[1];
    v7 = (char *)*a2;
  }
  result = v3 == v5;
  if (v3 < result)
    return 1;
  if (v5)
  {
    v9 = &v7[result];
    v10 = &v7[v3];
    v11 = &v7[v3] - v9;
    if (v11 >= v5)
    {
      v14 = *v6;
      do
      {
        v15 = v11 - v5;
        if (v15 == -1)
          break;
        v16 = (char *)memchr(v9, v14, v15 + 1);
        if (!v16)
          break;
        v12 = v16;
        if (!memcmp(v16, v6, v5))
          return v12 != v7 || v12 == v10;
        v9 = v12 + 1;
        v11 = v10 - (v12 + 1);
      }
      while (v11 >= v5);
    }
    v12 = v10;
    return v12 != v7 || v12 == v10;
  }
  return result;
}

unint64_t *CLGenerateRoadSegmentId(unint64_t *result, uint64_t a2, unsigned int a3, unsigned int a4)
{
  *result = ((unint64_t)a3 << 12) | (a2 << 38) | a4;
  return result;
}

uint64_t sub_18F75E6DC(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *Object;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
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
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  NSObject *v43;
  char *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  _BYTE *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  std::string *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  std::string *p_str;
  int v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  int isFinalPart;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
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
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  double v173;
  double v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  double v195;
  int isSimulatedSparseProcessing;
  void **v197;
  void **v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  int v206;
  NSObject *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  int v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  int v215;
  char *v216;
  int v217;
  void *v218;
  NSObject *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  int v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  std::string *v227;
  int v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  int v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  int v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  double v263;
  double v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  int v268;
  char *v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  int v283;
  int v284;
  NSObject *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  void **v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  int v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  int v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  int v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  int v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  int v358;
  std::string *p_p;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  void **v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  int v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  int v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  int v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  int v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  int v432;
  std::string *v433;
  char *v434;
  id *v435;
  void *v436;
  id v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  char *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  unint64_t v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  void *v457;
  NSObject *v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  char *v462;
  uint64_t v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  unint64_t v471;
  id v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  const char *v477;
  id v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  void *v482;
  char v483;
  void *v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  unint64_t v492;
  id v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  const char *v498;
  id v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  void *v503;
  void *v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  void *v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  void *v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  void *v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  void *v524;
  const char *v525;
  uint64_t v526;
  void *v527;
  const char *v528;
  double v529;
  double v530;
  NSObject *v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  int v535;
  NSObject *v536;
  const char *v537;
  uint64_t v538;
  uint64_t v539;
  void *v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  double v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  void *v549;
  uint64_t v550;
  uint64_t v551;
  CLTripSegmentOutputData *v552;
  const char *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  const char *v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  const char *v565;
  id v566;
  const char *v567;
  uint64_t v568;
  uint64_t v569;
  void *v570;
  const char *v571;
  uint64_t v572;
  uint64_t v573;
  const char *v574;
  uint64_t v575;
  uint64_t v576;
  void *v577;
  const char *v578;
  uint64_t v579;
  void *v580;
  const char *v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  NSObject *v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  std::string *v589;
  int v590;
  const char *v591;
  uint64_t v592;
  uint64_t v593;
  int v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  const char *v599;
  uint64_t v600;
  uint64_t v601;
  int v602;
  const char *v603;
  uint64_t v604;
  uint64_t v605;
  void *v606;
  const char *v607;
  uint64_t v608;
  uint64_t v609;
  const char *v610;
  uint64_t v611;
  uint64_t v612;
  int v613;
  double v614;
  double v615;
  uint64_t v616;
  int v617;
  void **v618;
  void **v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  double v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  const char *v627;
  uint64_t v628;
  uint64_t v629;
  _BYTE *v630;
  uint64_t v631;
  NSObject *v632;
  void *v633;
  const char *v634;
  uint64_t v635;
  uint64_t v636;
  const char *v637;
  uint64_t v638;
  uint64_t v639;
  void *v640;
  const char *v641;
  uint64_t v642;
  uint64_t v643;
  void *v644;
  const char *v645;
  uint64_t v646;
  uint64_t v647;
  void *v648;
  const char *v649;
  uint64_t v650;
  uint64_t v651;
  double v652;
  double v653;
  int v654;
  void **v655;
  void **v656;
  char *v657;
  const char *v658;
  uint64_t v659;
  uint64_t v660;
  int v661;
  char *v662;
  const char *v663;
  uint64_t v664;
  uint64_t v665;
  void *v666;
  const char *v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  char *v671;
  char *v672;
  const char *v673;
  uint64_t v674;
  uint64_t v675;
  std::string *v676;
  int v677;
  const char *v678;
  uint64_t v679;
  uint64_t v680;
  int v681;
  const char *v682;
  uint64_t v683;
  uint64_t v684;
  void *v685;
  const char *v686;
  uint64_t v687;
  uint64_t v688;
  int v689;
  const char *v690;
  uint64_t v691;
  uint64_t v692;
  void *v693;
  const char *v694;
  uint64_t v695;
  uint64_t v696;
  const char *v697;
  uint64_t v698;
  uint64_t v699;
  int v700;
  double v701;
  double v702;
  uint64_t v703;
  int v704;
  void **v705;
  void **v706;
  char *v707;
  uint64_t v708;
  double v709;
  uint64_t v710;
  void *v711;
  uint64_t v712;
  id obj;
  uint64_t v714;
  uint64_t v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  void *v719;
  std::string __p;
  void *v721[2];
  char v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  void *v727[2];
  char v728;
  void *v729[2];
  char v730;
  std::string __str;
  uint64_t v732;
  _BYTE v733[128];
  int v734;
  _BYTE v735[10];
  _BYTE v736[12];
  _BYTE v737[30];
  _BYTE v738[30];
  uint64_t v739;
  __int16 v740;
  uint64_t v741;
  __int16 v742;
  uint64_t v743;
  __int16 v744;
  uint64_t v745;
  __int16 v746;
  int v747;
  __int16 v748;
  int v749;
  __int16 v750;
  int v751;
  __int16 v752;
  int v753;
  __int16 v754;
  int v755;
  __int16 v756;
  std::string *v757;
  uint8_t buf[4];
  _BYTE v759[10];
  _BYTE v760[12];
  _BYTE v761[30];
  _BYTE v762[30];
  uint64_t v763;
  __int16 v764;
  uint64_t v765;
  __int16 v766;
  uint64_t v767;
  __int16 v768;
  uint64_t v769;
  __int16 v770;
  int v771;
  __int16 v772;
  int v773;
  __int16 v774;
  int v775;
  __int16 v776;
  int v777;
  __int16 v778;
  int v779;
  __int16 v780;
  std::string *v781;
  uint64_t v782;

  v782 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v46 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v46, OS_LOG_TYPE_ERROR, "CLTSP,null tripData", buf, 2u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 == -1)
      goto LABEL_70;
    goto LABEL_229;
  }
  if (!objc_msgSend_tripLocations(a2, (const char *)a2, (uint64_t)a3, a4)
    || (v11 = (void *)objc_msgSend_tripLocations(a2, v8, v9, v10), !objc_msgSend_count(v11, v12, v13, v14)))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v45 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v45, OS_LOG_TYPE_ERROR, "CLTSP,zero tripLocations", buf, 2u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 == -1)
      goto LABEL_70;
LABEL_229:
    dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
LABEL_70:
    LOWORD(v734) = 0;
    v44 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLTripSegmentProcessor::processData(CLTripSegmentInputData * _Nonnull, CLTripSegmentProcessorOptions * _Nonnull, TripSegmentOutputDataHandler _Nonnull)", "CoreLocation: %s\n", v44);
    goto LABEL_71;
  }
  v712 = a1;
  v18 = (void *)objc_msgSend_tripLocations(a2, v15, v16, v17);
  Object = (void *)objc_msgSend_lastObject(v18, v19, v20, v21);
  v26 = (void *)objc_msgSend_timestamp(Object, v23, v24, v25);
  v30 = (void *)objc_msgSend_tripLocations(a2, v27, v28, v29);
  v34 = (void *)objc_msgSend_firstObject(v30, v31, v32, v33);
  v38 = objc_msgSend_timestamp(v34, v35, v36, v37);
  objc_msgSend_timeIntervalSinceDate_(v26, v39, v38, v40);
  v42 = fabs(v41);
  if (v42 > 3601.0)
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v43 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      *(double *)v759 = v42;
      _os_log_impl(&dword_18F5B3000, v43, OS_LOG_TYPE_ERROR, "CLTSP,too long trip segment,%{public}.lf,seconds", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v734 = 134349056;
    *(double *)v735 = v42;
    v44 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLTripSegmentProcessor::processData(CLTripSegmentInputData * _Nonnull, CLTripSegmentProcessorOptions * _Nonnull, TripSegmentOutputDataHandler _Nonnull)", "CoreLocation: %s\n", v44);
LABEL_71:
    if (v44 != (char *)buf)
      free(v44);
    return 0;
  }
  v49 = mach_continuous_time();
  v709 = sub_18F6BDF00(v49);
  *(_BYTE *)(v712 + 72) = objc_msgSend_shouldRecordDataInFileForReplay(a3, v50, v51, v52);
  *(_QWORD *)(v712 + 80) = objc_msgSend_tripSegmentRecorderLoggingDirectory(a3, v53, v54, v55);
  v59 = (void *)objc_msgSend_tripSegmentRecorderLoggingDirectory(a3, v56, v57, v58);
  if (objc_msgSend_containsString_(v59, v60, (uint64_t)CFSTR("routesmoother"), v61))
    *(_BYTE *)(v712 + 73) = 1;
  v65 = (void *)objc_msgSend_tripLocations(a2, v62, v63, v64);
  v68 = (void *)objc_msgSend_objectAtIndexedSubscript_(v65, v66, 0, v67);
  v72 = objc_msgSend_timestamp(v68, v69, v70, v71);
  sub_18F6B95BC(v712 + 72, (uint64_t)a2, v72, 0);
  v76 = (void *)objc_msgSend_tripSegmentID(a2, v73, v74, v75);
  v80 = (void *)objc_msgSend_UUIDString(v76, v77, v78, v79);
  v84 = (char *)objc_msgSend_UTF8String(v80, v81, v82, v83);
  sub_18F5D5990(&__str, v84);
  v711 = a3;
  v88 = (void *)objc_msgSend_tripLocations(a2, v85, v86, v87);
  v91 = (void *)objc_msgSend_objectAtIndexedSubscript_(v88, v89, 0, v90);
  v95 = objc_msgSend_timestamp(v91, v92, v93, v94);
  v96 = (void *)sub_18F6B9534(v95);
  v100 = (char *)objc_msgSend_UTF8String(v96, v97, v98, v99);
  sub_18F5D5990(v729, v100);
  v710 = a4;
  v104 = (void *)objc_msgSend_tripLocations(a2, v101, v102, v103);
  v107 = (void *)objc_msgSend_objectAtIndexedSubscript_(v104, v105, 0, v106);
  v111 = objc_msgSend_timestamp(v107, v108, v109, v110);
  v112 = (void *)sub_18F6B9578(v111);
  v116 = (char *)objc_msgSend_UTF8String(v112, v113, v114, v115);
  sub_18F5D5990(v727, v116);
  v117 = (_BYTE *)sub_18F747B94();
  *v117 = objc_msgSend_isSimulatedSparseProcessing(a3, v118, v119, v120) ^ 1;
  v121 = (std::string *)sub_18F747B94();
  sub_18F747C8C(v121, &__str);
  v125 = sub_18F747B94();
  if (*(_BYTE *)v125)
  {
    v126 = (void *)objc_msgSend_tripLocations(a2, v122, v123, v124);
    *(_DWORD *)(v125 + 32) += objc_msgSend_count(v126, v127, v128, v129);
    *(_QWORD *)(v125 + 48) = objc_msgSend_modeOfTransport(a2, v130, v131, v132);
  }
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
  v133 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
  {
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_str = &__str;
    else
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    v138 = objc_msgSend_modeOfTransport(a2, v134, v135, v136);
    isFinalPart = objc_msgSend_isFinalPart(a2, v139, v140, v141);
    v146 = (void *)objc_msgSend_tripLocations(a2, v143, v144, v145);
    v150 = objc_msgSend_count(v146, v147, v148, v149);
    v154 = (void *)objc_msgSend_tripLocations(a2, v151, v152, v153);
    if (objc_msgSend_count(v154, v155, v156, v157))
    {
      v161 = (void *)objc_msgSend_tripLocations(a2, v158, v159, v160);
      v165 = (void *)objc_msgSend_firstObject(v161, v162, v163, v164);
      v169 = (void *)objc_msgSend_timestamp(v165, v166, v167, v168);
      objc_msgSend_timeIntervalSinceReferenceDate(v169, v170, v171, v172);
      v174 = v173;
    }
    else
    {
      v174 = -1.0;
    }
    v175 = (void *)objc_msgSend_tripLocations(a2, v158, v159, v160);
    if (objc_msgSend_count(v175, v176, v177, v178))
    {
      v182 = (void *)objc_msgSend_tripLocations(a2, v179, v180, v181);
      v186 = (void *)objc_msgSend_lastObject(v182, v183, v184, v185);
      v190 = (void *)objc_msgSend_timestamp(v186, v187, v188, v189);
      objc_msgSend_timeIntervalSinceReferenceDate(v190, v191, v192, v193);
      v195 = v194;
    }
    else
    {
      v195 = -1.0;
    }
    isSimulatedSparseProcessing = objc_msgSend_isSimulatedSparseProcessing(v711, v179, v180, v181);
    v197 = v729;
    if (v730 < 0)
      v197 = (void **)v729[0];
    v198 = v727;
    if (v728 < 0)
      v198 = (void **)v727[0];
    *(_DWORD *)buf = 136448514;
    *(_QWORD *)v759 = p_str;
    *(_WORD *)&v759[8] = 1026;
    *(_DWORD *)v760 = v138;
    *(_WORD *)&v760[4] = 1026;
    *(_DWORD *)&v760[6] = isFinalPart;
    *(_WORD *)&v760[10] = 1026;
    *(_DWORD *)v761 = v150;
    *(_WORD *)&v761[4] = 2050;
    *(double *)&v761[6] = v174;
    *(_WORD *)&v761[14] = 2050;
    *(double *)&v761[16] = v195;
    *(_WORD *)&v761[24] = 1026;
    *(_DWORD *)&v761[26] = isSimulatedSparseProcessing;
    *(_WORD *)v762 = 2082;
    *(_QWORD *)&v762[2] = v197;
    *(_WORD *)&v762[10] = 2082;
    *(_QWORD *)&v762[12] = v198;
    *(_WORD *)&v762[20] = 2050;
    *(double *)&v762[22] = v42;
    _os_log_impl(&dword_18F5B3000, v133, OS_LOG_TYPE_DEFAULT, "CLTSP,processData,input,tripSegmentID,%{public}s,modeOfTransport,%{public}d,isFinalPart,%{public}d,sparseLocationsCount,%{public}d,startTime,%{public}.1lf,endTime,%{public}.1lf,simulated,%{public}d,date,%{public}s,time,%{public}s,crumbDuration,%{public}.lf", buf, 0x56u);
  }
  v719 = a2;
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v227 = &__str;
    else
      v227 = (std::string *)__str.__r_.__value_.__r.__words[0];
    v228 = objc_msgSend_modeOfTransport(a2, v224, v225, v226);
    v232 = objc_msgSend_isFinalPart(a2, v229, v230, v231);
    v236 = (void *)objc_msgSend_tripLocations(a2, v233, v234, v235);
    v240 = objc_msgSend_count(v236, v237, v238, v239);
    v244 = (void *)objc_msgSend_tripLocations(a2, v241, v242, v243);
    if (objc_msgSend_count(v244, v245, v246, v247))
    {
      v251 = (void *)objc_msgSend_tripLocations(a2, v248, v249, v250);
      v255 = (void *)objc_msgSend_firstObject(v251, v252, v253, v254);
      v259 = (void *)objc_msgSend_timestamp(v255, v256, v257, v258);
      objc_msgSend_timeIntervalSinceReferenceDate(v259, v260, v261, v262);
      v264 = v263;
    }
    else
    {
      v264 = -1.0;
    }
    v633 = (void *)objc_msgSend_tripLocations(a2, v248, v249, v250);
    if (objc_msgSend_count(v633, v634, v635, v636))
    {
      v640 = (void *)objc_msgSend_tripLocations(a2, v637, v638, v639);
      v644 = (void *)objc_msgSend_lastObject(v640, v641, v642, v643);
      v648 = (void *)objc_msgSend_timestamp(v644, v645, v646, v647);
      objc_msgSend_timeIntervalSinceReferenceDate(v648, v649, v650, v651);
      v653 = v652;
    }
    else
    {
      v653 = -1.0;
    }
    v654 = objc_msgSend_isSimulatedSparseProcessing(v711, v637, v638, v639);
    v655 = v729;
    if (v730 < 0)
      v655 = (void **)v729[0];
    v656 = v727;
    if (v728 < 0)
      v656 = (void **)v727[0];
    v734 = 136448514;
    *(_QWORD *)v735 = v227;
    *(_WORD *)&v735[8] = 1026;
    *(_DWORD *)v736 = v228;
    *(_WORD *)&v736[4] = 1026;
    *(_DWORD *)&v736[6] = v232;
    *(_WORD *)&v736[10] = 1026;
    *(_DWORD *)v737 = v240;
    *(_WORD *)&v737[4] = 2050;
    *(double *)&v737[6] = v264;
    *(_WORD *)&v737[14] = 2050;
    *(double *)&v737[16] = v653;
    *(_WORD *)&v737[24] = 1026;
    *(_DWORD *)&v737[26] = v654;
    *(_WORD *)v738 = 2082;
    *(_QWORD *)&v738[2] = v655;
    *(_WORD *)&v738[10] = 2082;
    *(_QWORD *)&v738[12] = v656;
    *(_WORD *)&v738[20] = 2050;
    *(double *)&v738[22] = v42;
    v657 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::processData(CLTripSegmentInputData * _Nonnull, CLTripSegmentProcessorOptions * _Nonnull, TripSegmentOutputDataHandler _Nonnull)", "CoreLocation: %s\n", v657);
    if (v657 != (char *)buf)
      free(v657);
  }
  v202 = (void *)objc_msgSend_tripLocations(a2, v199, v200, v201);
  v732 = 0;
  sub_18F763B7C(v202, (const char *)&v732 + 4, (const char *)&v732);
  v206 = v732;
  if ((int)v732 >= 1)
  {
    do
    {
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      v207 = qword_1EE172170;
      if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
      {
        v211 = objc_msgSend_count(v202, v208, v209, v210);
        *(_DWORD *)buf = 67240960;
        *(_DWORD *)v759 = v211;
        *(_WORD *)&v759[4] = 1026;
        *(_DWORD *)&v759[6] = HIDWORD(v732);
        *(_WORD *)v760 = 1026;
        *(_DWORD *)&v760[2] = v206;
        *(_WORD *)&v760[6] = 1026;
        *(_DWORD *)&v760[8] = 0;
        _os_log_impl(&dword_18F5B3000, v207, OS_LOG_TYPE_INFO, "CLTSP,china shift,second try,locCount,%{public}d,applied,%{public}d,failed,%{public}d,iteration,%{public}d,", buf, 0x1Au);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172168 != -1)
          dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
        v215 = objc_msgSend_count(v202, v212, v213, v214);
        v734 = 67240960;
        *(_DWORD *)v735 = v215;
        *(_WORD *)&v735[4] = 1026;
        *(_DWORD *)&v735[6] = HIDWORD(v732);
        *(_WORD *)v736 = 1026;
        *(_DWORD *)&v736[2] = v206;
        *(_WORD *)&v736[6] = 1026;
        *(_DWORD *)&v736[8] = 0;
        v216 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "static BOOL CLTripSegmentUtilities::applyChinaShiftIfRequired(NSArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v216);
        if (v216 != (char *)buf)
          free(v216);
      }
      sub_18F763B7C(v202, (const char *)&v732 + 4, (const char *)&v732);
      v206 = v732;
    }
    while ((int)v732 > 0);
  }
  v217 = HIDWORD(v732);
  v218 = a2;
  if (SHIDWORD(v732) >= 1)
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v219 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
    {
      v223 = objc_msgSend_count(v202, v220, v221, v222);
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v759 = v223;
      *(_WORD *)&v759[4] = 1026;
      *(_DWORD *)&v759[6] = v217;
      *(_WORD *)v760 = 1026;
      *(_DWORD *)&v760[2] = v206;
      _os_log_impl(&dword_18F5B3000, v219, OS_LOG_TYPE_INFO, "CLTSP,china shift,locCount,%{public}d,shiftCount,%{public}d,failed,%{public}d", buf, 0x14u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      v268 = objc_msgSend_count(v202, v265, v266, v267);
      v734 = 67240704;
      *(_DWORD *)v735 = v268;
      *(_WORD *)&v735[4] = 1026;
      *(_DWORD *)&v735[6] = v217;
      *(_WORD *)v736 = 1026;
      *(_DWORD *)&v736[2] = v206;
      v269 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "static BOOL CLTripSegmentUtilities::applyChinaShiftIfRequired(NSArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v269);
      if (v269 != (char *)buf)
        free(v269);
      v218 = a2;
      if (v206)
        goto LABEL_68;
LABEL_85:
      v725 = 0u;
      v726 = 0u;
      v723 = 0u;
      v724 = 0u;
      v270 = (void *)objc_msgSend_tripLocations(v218, v203, v204, v205);
      v272 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v271, (uint64_t)&v723, (uint64_t)v733, 16);
      if (v272)
      {
        v717 = *(_QWORD *)v724;
        obj = v270;
        do
        {
          v275 = 0;
          v718 = v272;
          do
          {
            if (*(_QWORD *)v724 != v717)
              objc_enumerationMutation(obj);
            v276 = *(void **)(*((_QWORD *)&v723 + 1) + 8 * v275);
            objc_msgSend_setLocationReconstructionType_(v276, v273, 1, v274);
            sub_18F5D5990(v721, "SparseInput");
            v283 = objc_msgSend_modeOfTransport(v719, v277, v278, v279);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              sub_18F5C6990(&__p, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
            else
              __p = __str;
            v284 = objc_msgSend_isFinalPart(v719, v280, v281, v282);
            if (qword_1EE172168 != -1)
              dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
            v285 = qword_1EE172170;
            if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEBUG))
            {
              if (v722 >= 0)
                v289 = v721;
              else
                v289 = (void **)v721[0];
              v290 = (void *)objc_msgSend_timestamp(v276, v286, v287, v288);
              objc_msgSend_timeIntervalSinceReferenceDate(v290, v291, v292, v293);
              v716 = v294;
              objc_msgSend_latitude(v276, v295, v296, v297);
              v714 = v298;
              objc_msgSend_longitude(v276, v299, v300, v301);
              v303 = v302;
              objc_msgSend_altitude(v276, v304, v305, v306);
              v308 = v307;
              objc_msgSend_speed(v276, v309, v310, v311);
              v313 = v312;
              objc_msgSend_course(v276, v314, v315, v316);
              v318 = v317;
              objc_msgSend_horizontalAccuracy(v276, v319, v320, v321);
              v323 = v322;
              objc_msgSend_altitudeAccuracy(v276, v324, v325, v326);
              v328 = v327;
              objc_msgSend_speedAccuracy(v276, v329, v330, v331);
              v333 = v332;
              objc_msgSend_courseAccuracy(v276, v334, v335, v336);
              v338 = v337;
              v342 = objc_msgSend_locType(v276, v339, v340, v341);
              v346 = objc_msgSend_locTypeStart(v276, v343, v344, v345);
              v350 = objc_msgSend_locTypeStop(v276, v347, v348, v349);
              v354 = objc_msgSend_reconstructionType(v276, v351, v352, v353);
              v358 = objc_msgSend_signalEnvironmentType(v276, v355, v356, v357);
              p_p = &__p;
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              *(_DWORD *)buf = 136319747;
              *(_QWORD *)v759 = v289;
              *(_WORD *)&v759[8] = 1026;
              *(_DWORD *)v760 = v283;
              *(_WORD *)&v760[4] = 1026;
              *(_DWORD *)&v760[6] = v284;
              *(_WORD *)&v760[10] = 2050;
              *(_QWORD *)v761 = v716;
              *(_WORD *)&v761[8] = 2049;
              *(_QWORD *)&v761[10] = v714;
              *(_WORD *)&v761[18] = 2049;
              *(_QWORD *)&v761[20] = v303;
              *(_WORD *)&v761[28] = 2050;
              *(_QWORD *)v762 = v308;
              *(_WORD *)&v762[8] = 2050;
              *(_QWORD *)&v762[10] = v313;
              *(_WORD *)&v762[18] = 2050;
              *(_QWORD *)&v762[20] = v318;
              *(_WORD *)&v762[28] = 2050;
              v763 = v323;
              v764 = 2050;
              v765 = v328;
              v766 = 2050;
              v767 = v333;
              v768 = 2050;
              v769 = v338;
              v770 = 1026;
              v771 = v342;
              v772 = 1026;
              v773 = v346;
              v774 = 1026;
              v775 = v350;
              v776 = 1026;
              v777 = v354;
              v778 = 1026;
              v779 = v358;
              v780 = 2082;
              v781 = p_p;
              _os_log_impl(&dword_18F5B3000, v285, OS_LOG_TYPE_DEBUG, "CLTSP,%s,mode,%{public}d,final,%{public}d,time,%{public}.3lf,LL,%{private}.7lf,%{private}.7lf,altitude,%{public}.2lf,speed,%{public}.2lf,course,%{public}.2lf,hunc,%{public}.2lf,vunc,%{public}.2lf,sunc,%{public}.7lf,cunc,%{public}.7lf,type,%{public}d,startLocType,%{public}d,endLocType,%{public}d,reconstructionType,%{public}d,sigEnv,%{public}d,id,%{public}s", buf, 0xA4u);
            }
            if (sub_18F5C4AE0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE172168 != -1)
                dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
              if (v722 >= 0)
                v363 = v721;
              else
                v363 = (void **)v721[0];
              v364 = (void *)objc_msgSend_timestamp(v276, v360, v361, v362);
              objc_msgSend_timeIntervalSinceReferenceDate(v364, v365, v366, v367);
              v715 = v368;
              objc_msgSend_latitude(v276, v369, v370, v371);
              v708 = v372;
              objc_msgSend_longitude(v276, v373, v374, v375);
              v377 = v376;
              objc_msgSend_altitude(v276, v378, v379, v380);
              v382 = v381;
              objc_msgSend_speed(v276, v383, v384, v385);
              v387 = v386;
              objc_msgSend_course(v276, v388, v389, v390);
              v392 = v391;
              objc_msgSend_horizontalAccuracy(v276, v393, v394, v395);
              v397 = v396;
              objc_msgSend_altitudeAccuracy(v276, v398, v399, v400);
              v402 = v401;
              objc_msgSend_speedAccuracy(v276, v403, v404, v405);
              v407 = v406;
              objc_msgSend_courseAccuracy(v276, v408, v409, v410);
              v412 = v411;
              v416 = objc_msgSend_locType(v276, v413, v414, v415);
              v420 = objc_msgSend_locTypeStart(v276, v417, v418, v419);
              v424 = objc_msgSend_locTypeStop(v276, v421, v422, v423);
              v428 = objc_msgSend_reconstructionType(v276, v425, v426, v427);
              v432 = objc_msgSend_signalEnvironmentType(v276, v429, v430, v431);
              v433 = &__p;
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v433 = (std::string *)__p.__r_.__value_.__r.__words[0];
              v734 = 136319747;
              *(_QWORD *)v735 = v363;
              *(_WORD *)&v735[8] = 1026;
              *(_DWORD *)v736 = v283;
              *(_WORD *)&v736[4] = 1026;
              *(_DWORD *)&v736[6] = v284;
              *(_WORD *)&v736[10] = 2050;
              *(_QWORD *)v737 = v715;
              *(_WORD *)&v737[8] = 2049;
              *(_QWORD *)&v737[10] = v708;
              *(_WORD *)&v737[18] = 2049;
              *(_QWORD *)&v737[20] = v377;
              *(_WORD *)&v737[28] = 2050;
              *(_QWORD *)v738 = v382;
              *(_WORD *)&v738[8] = 2050;
              *(_QWORD *)&v738[10] = v387;
              *(_WORD *)&v738[18] = 2050;
              *(_QWORD *)&v738[20] = v392;
              *(_WORD *)&v738[28] = 2050;
              v739 = v397;
              v740 = 2050;
              v741 = v402;
              v742 = 2050;
              v743 = v407;
              v744 = 2050;
              v745 = v412;
              v746 = 1026;
              v747 = v416;
              v748 = 1026;
              v749 = v420;
              v750 = 1026;
              v751 = v424;
              v752 = 1026;
              v753 = v428;
              v754 = 1026;
              v755 = v432;
              v756 = 2082;
              v757 = v433;
              v434 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 2, "static void CLTripSegmentUtilities::logCLTripSegmentLocation(std::string, CLTripSegmentLocation * _Nonnull, CLTripSegmentModeOfTransport, std::string, BOOL)", "CoreLocation: %s\n", v434);
              if (v434 != (char *)buf)
                free(v434);
            }
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            if (v722 < 0)
              operator delete(v721[0]);
            ++v275;
          }
          while (v718 != v275);
          v272 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v273, (uint64_t)&v723, (uint64_t)v733, 16);
        }
        while (v272);
      }
      v435 = (id *)(v712 + 40);
      sub_18F68E6F8(v712 + 40);
      v436 = v719;
      v437 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v441 = objc_msgSend_modeOfTransport(v719, v438, v439, v440);
      if (v441 == 1)
      {
        v484 = (void *)objc_msgSend_tripSegmentID(v719, v442, v443, v444);
        v488 = objc_msgSend_isFinalPart(v719, v485, v486, v487);
        v492 = objc_msgSend_modeOfTransport(v719, v489, v490, v491);
        v493 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v497 = objc_msgSend_tripLocations(v719, v494, v495, v496);
        v499 = (id)objc_msgSend_initWithArray_copyItems_(v493, v498, v497, 1);
        v503 = (void *)objc_msgSend_inertialData(v719, v500, v501, v502);
        v483 = sub_18F760758(v712, v711, v484, v488, v492, v499, v503, v437);
      }
      else
      {
        if (v441 != 2)
        {
          if (v441 == 3)
          {
            v445 = (char *)objc_msgSend_tripSegmentID(v719, v442, v443, v444);
            v449 = objc_msgSend_isFinalPart(v719, v446, v447, v448);
            v453 = objc_msgSend_modeOfTransport(v719, v450, v451, v452);
            v457 = (void *)objc_msgSend_tripLocations(v719, v454, v455, v456);
            if (sub_18F761EC8(v711, v445, v449, v453, v457, v437))
            {
              if (qword_1EE172168 != -1)
                dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
              v458 = qword_1EE172170;
              if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18F5B3000, v458, OS_LOG_TYPE_INFO, "CLTSP,processPedestrianOrCycling,success", buf, 2u);
              }
              if (sub_18F5C4AE0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1EE172168 != -1)
                  dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
                LOWORD(v734) = 0;
                v462 = (char *)_os_log_send_and_compose_impl();
                sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::processData(CLTripSegmentInputData * _Nonnull, CLTripSegmentProcessorOptions * _Nonnull, TripSegmentOutputDataHandler _Nonnull)", "CoreLocation: %s\n", v462);
                if (v462 != (char *)buf)
                  free(v462);
                v436 = v719;
              }
              goto LABEL_136;
            }
          }
          else
          {
            if (qword_1EE172168 != -1)
              dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
            v531 = qword_1EE172170;
            if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
            {
              v535 = objc_msgSend_modeOfTransport(v719, v532, v533, v534);
              *(_DWORD *)buf = 67240192;
              *(_DWORD *)v759 = v535;
              _os_log_impl(&dword_18F5B3000, v531, OS_LOG_TYPE_ERROR, "CLTSP,processData,unknown modeOfTransport,%{public}d", buf, 8u);
            }
            if (sub_18F5C4AE0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE172168 != -1)
                dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
              v661 = objc_msgSend_modeOfTransport(v719, v658, v659, v660);
              v734 = 67240192;
              *(_DWORD *)v735 = v661;
              v662 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLTripSegmentProcessor::processData(CLTripSegmentInputData * _Nonnull, CLTripSegmentProcessorOptions * _Nonnull, TripSegmentOutputDataHandler _Nonnull)", "CoreLocation: %s\n", v662);
              if (v662 != (char *)buf)
                free(v662);
            }
          }
          goto LABEL_145;
        }
        v463 = objc_msgSend_tripSegmentID(v719, v442, v443, v444);
        v467 = objc_msgSend_isFinalPart(v719, v464, v465, v466);
        v471 = objc_msgSend_modeOfTransport(v719, v468, v469, v470);
        v472 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v476 = objc_msgSend_tripLocations(v719, v473, v474, v475);
        v478 = (id)objc_msgSend_initWithArray_copyItems_(v472, v477, v476, 1);
        v482 = (void *)objc_msgSend_inertialOdometryData(v719, v479, v480, v481);
        v483 = sub_18F761384(v712, (char *)v711, v463, v467, v471, v478, v482, v437);
      }
      if ((v483 & 1) != 0)
      {
LABEL_136:
        if (!v710)
        {
LABEL_170:
          v623 = 0.0;
          if (v709 >= 0.0)
          {
            v624 = mach_continuous_time();
            v623 = vabdd_f64(sub_18F6BDF00(v624), v709) * 1000.0;
          }
          v625 = sub_18F747B94();
          *(double *)(v625 + 120) = v623 + *(double *)(v625 + 120);
          v626 = sub_18F747B94();
          sub_18F748B38(v626);
          if (objc_msgSend_isFinalPart(v436, v627, v628, v629))
          {
            v630 = (_BYTE *)sub_18F747B94();
            sub_18F747DC8(v630);
            v631 = sub_18F747B94();
            MEMORY[0x194002BEC](v631 + 8, "");
            *(_QWORD *)(v631 + 136) = 0;
            *(_QWORD *)(v631 + 144) = 0;
            *(_DWORD *)(v631 + 152) = 0;
            *(_QWORD *)(v631 + 168) = 0;
            *(_QWORD *)(v631 + 176) = 0;
            *(_QWORD *)(v631 + 160) = 0;
            *(_QWORD *)(v631 + 216) = 0;
            *(_QWORD *)(v631 + 224) = 0;
            *(_DWORD *)(v631 + 232) = 0;
            *(_QWORD *)(v631 + 248) = 0;
            *(_QWORD *)(v631 + 256) = 0;
            *(_QWORD *)(v631 + 240) = 0;
            *(_DWORD *)(v631 + 288) = 0;
            *(_OWORD *)(v631 + 32) = 0u;
            *(_OWORD *)(v631 + 48) = 0u;
            *(_OWORD *)(v631 + 64) = 0u;
            *(_OWORD *)(v631 + 80) = 0u;
            *(_OWORD *)(v631 + 96) = 0u;
            *(_OWORD *)(v631 + 112) = 0u;
          }
          if (!*v435)
          {
            v47 = 1;
            goto LABEL_177;
          }

          v47 = 1;
          goto LABEL_176;
        }
        v504 = (void *)objc_msgSend_tripLocations(v436, v459, v460, v461);
        v508 = (void *)objc_msgSend_firstObject(v504, v505, v506, v507);
        v512 = objc_msgSend_timestamp(v508, v509, v510, v511);
        v516 = (void *)objc_msgSend_tripLocations(v436, v513, v514, v515);
        v520 = (void *)objc_msgSend_lastObject(v516, v517, v518, v519);
        v524 = (void *)objc_msgSend_timestamp(v520, v521, v522, v523);
        v527 = v524;
        if (v512 && v524)
        {
          objc_msgSend_timeIntervalSinceDate_(v524, v525, v512, v526);
          v530 = v529;
        }
        else
        {
          if (qword_1EE172168 != -1)
            dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
          v536 = qword_1EE172170;
          if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
          {
            v540 = (void *)objc_msgSend_tripLocations(v436, v537, v538, v539);
            v544 = objc_msgSend_count(v540, v541, v542, v543);
            *(_DWORD *)buf = 67240704;
            *(_DWORD *)v759 = v512 == 0;
            *(_WORD *)&v759[4] = 1026;
            *(_DWORD *)&v759[6] = v527 == 0;
            *(_WORD *)v760 = 2050;
            *(_QWORD *)&v760[2] = v544;
            _os_log_impl(&dword_18F5B3000, v536, OS_LOG_TYPE_ERROR, "CLTSP,processData,CLTripSegmentOutputData,duration cannot be set,startDate is nil,%{public}d,endDate is nil,%{public}d,tripSegmentData.tripLocations,count,%{public}lu", buf, 0x18u);
          }
          v530 = -1.0;
          if (sub_18F5C4AE0(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE172168 != -1)
              dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
            v666 = (void *)objc_msgSend_tripLocations(v719, v663, v664, v665);
            v670 = objc_msgSend_count(v666, v667, v668, v669);
            v734 = 67240704;
            *(_DWORD *)v735 = v512 == 0;
            *(_WORD *)&v735[4] = 1026;
            *(_DWORD *)&v735[6] = v527 == 0;
            *(_WORD *)v736 = 2050;
            *(_QWORD *)&v736[2] = v670;
            v671 = (char *)_os_log_send_and_compose_impl();
            sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLTripSegmentProcessor::processData(CLTripSegmentInputData * _Nonnull, CLTripSegmentProcessorOptions * _Nonnull, TripSegmentOutputDataHandler _Nonnull)", "CoreLocation: %s\n", v671);
            if (v671 != (char *)buf)
              free(v671);
            v436 = v719;
          }
        }
        v545 = sub_18F762128(v437, v528);
        v549 = (void *)objc_msgSend_tripLocations(v436, v546, v547, v548);
        if ((sub_18F762290(v549, v437, v550, v551) & 1) != 0)
        {
          v552 = [CLTripSegmentOutputData alloc];
          v556 = objc_msgSend_tripSegmentID(v436, v553, v554, v555);
          v560 = objc_msgSend_isFinalPart(v436, v557, v558, v559);
          v564 = objc_msgSend_modeOfTransport(v436, v561, v562, v563);
          v566 = (id)objc_msgSend_initWithTripSegmentID_isFinalPart_startDate_endDate_duration_modeOfTransport_distance_distanceUnc_tripLocations_(v552, v565, v556, v560, v512, v527, v564, v437, v530, v545, v545 * 0.05);
          v570 = (void *)objc_msgSend_tripLocations(v436, v567, v568, v569);
          if (objc_msgSend_count(v570, v571, v572, v573))
          {
            v577 = (void *)objc_msgSend_tripLocations(v436, v574, v575, v576);
            v580 = (void *)objc_msgSend_objectAtIndexedSubscript_(v577, v578, 0, v579);
            v584 = objc_msgSend_timestamp(v580, v581, v582, v583);
            sub_18F6B95BC(v712 + 72, (uint64_t)v566, v584, 4);
          }
          if (qword_1EE172168 != -1)
            dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
          v585 = qword_1EE172170;
          if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
          {
            if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v589 = &__str;
            else
              v589 = (std::string *)__str.__r_.__value_.__r.__words[0];
            v590 = objc_msgSend_modeOfTransport(v566, v586, v587, v588);
            v594 = objc_msgSend_isFinalPart(v566, v591, v592, v593);
            v598 = (void *)objc_msgSend_tripLocations(v436, v595, v596, v597);
            v602 = objc_msgSend_count(v598, v599, v600, v601);
            v606 = (void *)objc_msgSend_tripLocations(v566, v603, v604, v605);
            v613 = objc_msgSend_count(v606, v607, v608, v609);
            v614 = 0.0;
            v615 = v709;
            if (v709 >= 0.0)
            {
              v616 = mach_continuous_time();
              v615 = vabdd_f64(sub_18F6BDF00(v616), v709);
              v614 = v615 * 1000.0;
            }
            v617 = objc_msgSend_isSimulatedSparseProcessing(v711, v610, v611, v612, v615);
            v618 = v729;
            if (v730 < 0)
              v618 = (void **)v729[0];
            v619 = v727;
            if (v728 < 0)
              v619 = (void **)v727[0];
            *(_DWORD *)buf = 136448514;
            *(_QWORD *)v759 = v589;
            *(_WORD *)&v759[8] = 1026;
            *(_DWORD *)v760 = v590;
            *(_WORD *)&v760[4] = 1026;
            *(_DWORD *)&v760[6] = v594;
            *(_WORD *)&v760[10] = 1026;
            *(_DWORD *)v761 = v602;
            *(_WORD *)&v761[4] = 1026;
            *(_DWORD *)&v761[6] = v613;
            *(_WORD *)&v761[10] = 2050;
            *(double *)&v761[12] = v545;
            *(_WORD *)&v761[20] = 2050;
            *(double *)&v761[22] = v614;
            *(_WORD *)v762 = 1026;
            *(_DWORD *)&v762[2] = v617;
            *(_WORD *)&v762[6] = 2082;
            *(_QWORD *)&v762[8] = v618;
            *(_WORD *)&v762[16] = 2082;
            *(_QWORD *)&v762[18] = v619;
            _os_log_impl(&dword_18F5B3000, v585, OS_LOG_TYPE_DEFAULT, "CLTSP,processData,output,tripSegmentID,%{public}s,modeOfTransport,%{public}d,isFinalPart,%{public}d,sparseLocationsCount,%{public}d,reconstructedLocCount,%{public}d,totalDistance,%{public}.2lf,processingTimeMSec,%{public}.1lf,simulated,%{public}d,date,%{public}s,time,%{public}s", buf, 0x52u);
          }
          if (sub_18F5C4AE0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE172168 != -1)
              dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
            if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v676 = &__str;
            else
              v676 = (std::string *)__str.__r_.__value_.__r.__words[0];
            v677 = objc_msgSend_modeOfTransport(v566, v673, v674, v675);
            v681 = objc_msgSend_isFinalPart(v566, v678, v679, v680);
            v685 = (void *)objc_msgSend_tripLocations(v719, v682, v683, v684);
            v689 = objc_msgSend_count(v685, v686, v687, v688);
            v693 = (void *)objc_msgSend_tripLocations(v566, v690, v691, v692);
            v700 = objc_msgSend_count(v693, v694, v695, v696);
            v701 = 0.0;
            v702 = v709;
            if (v709 >= 0.0)
            {
              v703 = mach_continuous_time();
              v702 = vabdd_f64(sub_18F6BDF00(v703), v709);
              v701 = v702 * 1000.0;
            }
            v704 = objc_msgSend_isSimulatedSparseProcessing(v711, v697, v698, v699, v702);
            v705 = v729;
            if (v730 < 0)
              v705 = (void **)v729[0];
            v706 = v727;
            if (v728 < 0)
              v706 = (void **)v727[0];
            v734 = 136448514;
            *(_QWORD *)v735 = v676;
            *(_WORD *)&v735[8] = 1026;
            *(_DWORD *)v736 = v677;
            *(_WORD *)&v736[4] = 1026;
            *(_DWORD *)&v736[6] = v681;
            *(_WORD *)&v736[10] = 1026;
            *(_DWORD *)v737 = v689;
            *(_WORD *)&v737[4] = 1026;
            *(_DWORD *)&v737[6] = v700;
            *(_WORD *)&v737[10] = 2050;
            *(double *)&v737[12] = v545;
            *(_WORD *)&v737[20] = 2050;
            *(double *)&v737[22] = v701;
            *(_WORD *)v738 = 1026;
            *(_DWORD *)&v738[2] = v704;
            *(_WORD *)&v738[6] = 2082;
            *(_QWORD *)&v738[8] = v705;
            *(_WORD *)&v738[16] = 2082;
            *(_QWORD *)&v738[18] = v706;
            v707 = (char *)_os_log_send_and_compose_impl();
            sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::processData(CLTripSegmentInputData * _Nonnull, CLTripSegmentProcessorOptions * _Nonnull, TripSegmentOutputDataHandler _Nonnull)", "CoreLocation: %s\n", v707);
            if (v707 != (char *)buf)
              free(v707);
            v436 = v719;
          }
          v620 = sub_18F747B94();
          sub_18F747F94(v620, v566, v621, v622);
          (*(void (**)(uint64_t, id))(v710 + 16))(v710, v566);
          goto LABEL_170;
        }
        if (qword_1EE172168 != -1)
          dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
        v632 = qword_1EE172170;
        if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F5B3000, v632, OS_LOG_TYPE_ERROR, "CLTSP,CLTripSegmentUtilities::getCorrectedCoordinates failed", buf, 2u);
        }
        if (sub_18F5C4AE0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE172168 != -1)
            dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
          LOWORD(v734) = 0;
          v672 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLTripSegmentProcessor::processData(CLTripSegmentInputData * _Nonnull, CLTripSegmentProcessorOptions * _Nonnull, TripSegmentOutputDataHandler _Nonnull)", "CoreLocation: %s\n", v672);
          if (v672 != (char *)buf)
            free(v672);
        }
        if (!*v435)
          goto LABEL_68;
LABEL_146:

        v47 = 0;
LABEL_176:
        *v435 = 0;
        goto LABEL_177;
      }
LABEL_145:
      if (!*v435)
        goto LABEL_68;
      goto LABEL_146;
    }
  }
  if (!v206)
    goto LABEL_85;
LABEL_68:
  v47 = 0;
LABEL_177:
  if (v728 < 0)
    operator delete(v727[0]);
  if (v730 < 0)
    operator delete(v729[0]);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  return v47;
}

void sub_18F760670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46,void *a47,uint64_t a48,int a49,__int16 a50,char a51,char a52,void *a53,uint64_t a54,int a55,__int16 a56,char a57,char a58)
{
  if (a46 < 0)
    operator delete(__p);
  if (a52 < 0)
    operator delete(a47);
  if (a58 < 0)
    operator delete(a53);
  _Unwind_Resume(a1);
}

uint64_t sub_18F760758(uint64_t a1, void *a2, void *a3, uint64_t a4, unint64_t a5, void *a6, void *a7, void *a8)
{
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *Object;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
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
  double v115;
  double v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t i;
  void *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  id v133;
  int v134;
  const char *v135;
  uint64_t v136;
  id v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  unsigned int v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t j;
  void *v152;
  NSObject *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  const char *v162;
  uint64_t v163;
  id v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  NSObject *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  int v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  int v182;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  int v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  int v195;
  char *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  int v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  int v204;
  char *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  int v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  int v219;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  _QWORD v226[2];
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  _BYTE v231[128];
  int v232;
  int v233;
  __int16 v234;
  int v235;
  uint8_t buf[4];
  __int128 v237;
  __int16 v238;
  int v239;
  __int16 v240;
  int v241;
  __int16 v242;
  int v243;
  __int16 v244;
  unsigned int v245;
  int v246;
  __int128 v247;
  __int16 v248;
  int v249;
  __int16 v250;
  int v251;
  __int16 v252;
  int v253;
  __int16 v254;
  unsigned int v255;
  uint64_t v256;

  v256 = *MEMORY[0x1E0C80C00];
  v226[0] = 0xBFF0000000000000;
  v226[1] = 0;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend_count(a6, v15, v16, v17))
  {
    v21 = 0;
    do
    {
      if (sub_18F6C6A64((uint64_t)v226, a6, v21, v20, 1.5, 45.0, 25.0))
      {
        v25 = objc_msgSend_objectAtIndexedSubscript_(a6, v22, v21, v24);
        objc_msgSend_addObject_(v14, v26, v25, v27);
      }
      ++v21;
    }
    while (objc_msgSend_count(a6, v22, v23, v24) > v21);
  }
  if (!objc_msgSend_count(v14, v18, v19, v20))
    return 0;
  v30 = (void *)objc_msgSend_objectAtIndexedSubscript_(v14, v28, 0, v29);
  v218 = objc_msgSend_timestamp(v30, v31, v32, v33);
  if (a8 && v14)
  {
    objc_msgSend_removeAllObjects(a8, v34, v35, v36);
    objc_msgSend_addObjectsFromArray_(a8, v37, (uint64_t)v14, v38);
  }
  if (!objc_msgSend_runInertialIntegrator(a2, v34, v35, v36))
    goto LABEL_33;
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!objc_msgSend_count(a7, v43, v44, v45))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v53 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEBUG))
    {
      v57 = (void *)objc_msgSend_UUIDString(a3, v54, v55, v56);
      v61 = objc_msgSend_UTF8String(v57, v58, v59, v60);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&v237 = v61;
      _os_log_impl(&dword_18F5B3000, v53, OS_LOG_TYPE_DEBUG, "CLTSP,II,inertial integrator failed as there is no inertial data available,%{public}s", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 2))
      goto LABEL_33;
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v65 = (void *)objc_msgSend_UUIDString(a3, v62, v63, v64);
    v69 = objc_msgSend_UTF8String(v65, v66, v67, v68);
    v246 = 136446210;
    *(_QWORD *)&v247 = v69;
    v70 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::runInertialIntegrator(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const BOOL, const CLTripSegmentModeOfTransport, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLTripSegmentInertialData *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v70);
    goto LABEL_101;
  }
  objc_msgSend_removeAllObjects(v42, v46, v47, v48);
  LOBYTE(v227) = 0;
  if (!sub_18F62F628(&v227, a3, a4, a5, v14, a7, v42))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v71 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEBUG))
    {
      v75 = objc_msgSend_count(v42, v72, v73, v74);
      v79 = (void *)objc_msgSend_UUIDString(a3, v76, v77, v78);
      v83 = objc_msgSend_UTF8String(v79, v80, v81, v82);
      *(_DWORD *)buf = 67240450;
      LODWORD(v237) = v75;
      WORD2(v237) = 2082;
      *(_QWORD *)((char *)&v237 + 6) = v83;
      _os_log_impl(&dword_18F5B3000, v71, OS_LOG_TYPE_DEBUG, "CLTSP,II,inertial integrator failed to compute locations,count,%{public}d,tripSegmentID,%{public}s,fallback to input location array", buf, 0x12u);
    }
    if (!sub_18F5C4AE0(115, 2))
      goto LABEL_33;
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v209 = objc_msgSend_count(v42, v206, v207, v208);
    v213 = (void *)objc_msgSend_UUIDString(a3, v210, v211, v212);
    v217 = objc_msgSend_UTF8String(v213, v214, v215, v216);
    v246 = 67240450;
    LODWORD(v247) = v209;
    WORD2(v247) = 2082;
    *(_QWORD *)((char *)&v247 + 6) = v217;
    v70 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::runInertialIntegrator(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const BOOL, const CLTripSegmentModeOfTransport, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLTripSegmentInertialData *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v70);
LABEL_101:
    if (v70 != (char *)buf)
      free(v70);
LABEL_33:
    v219 = 0;
    goto LABEL_34;
  }
  sub_18F6B95BC(a1 + 72, (uint64_t)v42, v218, 1);
  if (v42)
    v49 = a8 == 0;
  else
    v49 = 1;
  if (!v49)
  {
    objc_msgSend_removeAllObjects(a8, v39, v40, v41);
    objc_msgSend_addObjectsFromArray_(a8, v50, (uint64_t)v42, v51);
  }
  v219 = 1;
LABEL_34:
  if (objc_msgSend_runLinearInterpolator(a2, v39, v40, v41))
  {
    if (objc_msgSend_count(v14, v84, v85, v86))
    {
      v93 = v14;
      if (!objc_msgSend_count(a8, v87, v88, v89))
      {
LABEL_49:
        v133 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (sub_18F761EC8(a2, (char *)a3, a4, a5, v93, v133))
        {
          sub_18F6B95BC(a1 + 72, (uint64_t)v133, v218, 2);
          v134 = 1;
          if (v93 && v133)
          {
            objc_msgSend_removeAllObjects(v93, v84, v85, v86);
            objc_msgSend_addObjectsFromArray_(v93, v135, (uint64_t)v133, v136);
          }
        }
        else
        {
          v134 = 0;
        }
        a8 = v93;
        goto LABEL_56;
      }
      Object = (void *)objc_msgSend_firstObject(a8, v90, v91, v92);
      v98 = (void *)objc_msgSend_timestamp(Object, v95, v96, v97);
      objc_msgSend_timeIntervalSinceReferenceDate(v98, v99, v100, v101);
      v103 = v102;
      v107 = (void *)objc_msgSend_lastObject(a8, v104, v105, v106);
      v111 = (void *)objc_msgSend_timestamp(v107, v108, v109, v110);
      objc_msgSend_timeIntervalSinceReferenceDate(v111, v112, v113, v114);
      v116 = v115;
      v224 = 0u;
      v225 = 0u;
      v222 = 0u;
      v223 = 0u;
      v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v117, (uint64_t)&v222, (uint64_t)v231, 16);
      if (v121)
      {
        v122 = 0;
        v123 = v103 + -0.5;
        v124 = v116 + 0.5;
        v125 = *(_QWORD *)v223;
        do
        {
          for (i = 0; i != v121; ++i)
          {
            if (*(_QWORD *)v223 != v125)
              objc_enumerationMutation(v14);
            v127 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * i);
            v128 = (void *)objc_msgSend_timestamp(v127, v118, v119, v120);
            objc_msgSend_timeIntervalSinceReferenceDate(v128, v129, v130, v131);
            if (v132 >= v123)
            {
              if (v132 > v124)
                objc_msgSend_addObject_(a8, v118, (uint64_t)v127, v120);
            }
            else
            {
              objc_msgSend_insertObject_atIndex_(a8, v118, (uint64_t)v127, v122++);
            }
          }
          v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v118, (uint64_t)&v222, (uint64_t)v231, 16);
        }
        while (v121);
      }
    }
    v93 = a8;
    goto LABEL_49;
  }
  v134 = 0;
LABEL_56:
  if (objc_msgSend_runMapIntegrator(a2, v84, v85, v86))
  {
    v137 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v141 = sub_18F762A54(a1, (char *)a2, a3, a5, a4, v14, a8, v137);
    if (v141)
    {
      sub_18F6B95BC(a1 + 72, (uint64_t)v137, v218, 3);
      if (a8)
      {
        if (v137)
        {
          objc_msgSend_removeAllObjects(a8, v138, v139, v140);
          objc_msgSend_addObjectsFromArray_(a8, v142, (uint64_t)v137, v143);
        }
      }
    }
    v144 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v138, v139, v140);
    v229 = 0u;
    v230 = 0u;
    v227 = 0u;
    v228 = 0u;
    v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(a8, v145, (uint64_t)&v227, (uint64_t)&v246, 16);
    if (v149)
    {
      v150 = *(_QWORD *)v228;
      do
      {
        for (j = 0; j != v149; ++j)
        {
          if (*(_QWORD *)v228 != v150)
            objc_enumerationMutation(a8);
          v152 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * j);
          if (v152
            && objc_msgSend_isLinearInterpolated(*(void **)(*((_QWORD *)&v227 + 1) + 8 * j), v146, v147, v148)&& (objc_msgSend_isMapMatched(v152, v146, v147, v148) & 1) == 0&& (objc_msgSend_isOriginalLocationType(v152, v146, v147, v148) & 1) == 0)
          {
            objc_msgSend_addObject_(v144, v146, (uint64_t)v152, v148);
          }
        }
        v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(a8, v146, (uint64_t)&v227, (uint64_t)&v246, 16);
      }
      while (v149);
    }
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v153 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEBUG))
    {
      v157 = objc_msgSend_count(a8, v154, v155, v156);
      v161 = objc_msgSend_count(v144, v158, v159, v160);
      *(_DWORD *)buf = 67240448;
      LODWORD(v237) = v157;
      WORD2(v237) = 1026;
      *(_DWORD *)((char *)&v237 + 6) = v161;
      _os_log_impl(&dword_18F5B3000, v153, OS_LOG_TYPE_DEBUG, "CLTSP,removeLinearlyInterpolatedLocations,totalCount,%{public}d,removedCount,%{public}d", buf, 0xEu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      v200 = objc_msgSend_count(a8, v197, v198, v199);
      v204 = objc_msgSend_count(v144, v201, v202, v203);
      v232 = 67240448;
      v233 = v200;
      v234 = 1026;
      v235 = v204;
      v205 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "static void CLTripSegmentUtilities::removeLinearlyInterpolatedLocations(NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v205);
      if (v205 != (char *)buf)
        free(v205);
    }
    objc_msgSend_removeObjectsInArray_(a8, v162, (uint64_t)v144, v163);
    v164 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (sub_18F761EC8(a2, (char *)a3, a4, a5, a8, v164))
    {
      sub_18F6B95BC(a1 + 72, (uint64_t)v164, v218, 5);
      v134 = 1;
      if (a8 && v164)
      {
        objc_msgSend_removeAllObjects(a8, v165, v166, v167);
        objc_msgSend_addObjectsFromArray_(a8, v168, (uint64_t)v164, v169);
      }
    }
    else
    {
      v134 = 0;
    }
  }
  else
  {
    v141 = 0;
  }
  v52 = v219 | v134 | v141;
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
  v170 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
  {
    v174 = objc_msgSend_runLinearInterpolator(a2, v171, v172, v173);
    v178 = objc_msgSend_runInertialIntegrator(a2, v175, v176, v177);
    v182 = objc_msgSend_runMapIntegrator(a2, v179, v180, v181);
    *(_DWORD *)buf = 67241728;
    LODWORD(v237) = v219 | v134 | v141;
    WORD2(v237) = 1026;
    *(_DWORD *)((char *)&v237 + 6) = v174;
    WORD5(v237) = 1026;
    HIDWORD(v237) = v178;
    v238 = 1026;
    v239 = v182;
    v240 = 1026;
    v241 = v134;
    v242 = 1026;
    v243 = v219;
    v244 = 1026;
    v245 = v141;
    _os_log_impl(&dword_18F5B3000, v170, OS_LOG_TYPE_INFO, "CLTSP,processVehicularData,success,%{public}d,liEnabled,%{public}d,iiEnabled,%{public}d,miEnabled,%{public}d,liSuccess,%{public}d,iiSuccess,%{public}d,miSuccess,%{public}d", buf, 0x2Cu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v187 = objc_msgSend_runLinearInterpolator(a2, v184, v185, v186);
    v191 = objc_msgSend_runInertialIntegrator(a2, v188, v189, v190);
    v195 = objc_msgSend_runMapIntegrator(a2, v192, v193, v194);
    v246 = 67241728;
    LODWORD(v247) = v219 | v134 | v141;
    WORD2(v247) = 1026;
    *(_DWORD *)((char *)&v247 + 6) = v187;
    WORD5(v247) = 1026;
    HIDWORD(v247) = v191;
    v248 = 1026;
    v249 = v195;
    v250 = 1026;
    v251 = v134;
    v252 = 1026;
    v253 = v219;
    v254 = 1026;
    v255 = v141;
    v196 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::processVehicularData(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const BOOL, const CLTripSegmentModeOfTransport, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLTripSegmentInertialData *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v196);
    if (v196 != (char *)buf)
      free(v196);
  }
  return v52;
}

uint64_t sub_18F761384(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, unint64_t a5, void *a6, void *a7, void *a8)
{
  unsigned int v12;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  char *v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  BOOL v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  BOOL v74;
  const char *v75;
  uint64_t v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  NSObject *v116;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  char *v143;
  int v144;
  char *v145;
  unint64_t v146;
  unsigned int v147;
  double v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  int v153;
  int v154;
  __int16 v155;
  int v156;
  __int16 v157;
  int v158;
  __int16 v159;
  int v160;
  __int16 v161;
  int v162;
  __int16 v163;
  int v164;
  __int16 v165;
  int v166;
  uint8_t v167[128];
  uint8_t buf[4];
  int v169;
  _BYTE v170[24];
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t v178;
  int v179;
  char v180;
  void *v181;
  void *v182;
  uint64_t v183;
  char v184;
  char v185;
  char v186;
  char v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[64];
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  uint64_t v200;

  v12 = a4;
  v200 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_count(a6, a2, a3, a4))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v55 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v55, OS_LOG_TYPE_ERROR, "CLTSP,processPedestrianData,empty tripLocations", buf, 2u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    LOWORD(v153) = 0;
    v56 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLTripSegmentProcessor::processPedestrianData(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const BOOL, const CLTripSegmentModeOfTransport, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLBackgroundInertialOdometrySample *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v56);
    goto LABEL_102;
  }
  v145 = (char *)a3;
  v146 = a5;
  v147 = v12;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, v17, (uint64_t)&v149, (uint64_t)v167, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v150;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v150 != v22)
          objc_enumerationMutation(a6);
        v24 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
        if ((objc_msgSend_isGPSLocationType(v24, v18, v19, v20) & 1) != 0)
          objc_msgSend_addObject_(v16, v25, (uint64_t)v24, v27);
        else
          objc_msgSend_isWiFiLocationType(v24, v25, v26, v27);
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, v18, (uint64_t)&v149, (uint64_t)v167, 16);
    }
    while (v21);
  }
  if (!objc_msgSend_count(v16, v18, v19, v20))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v57 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v57, OS_LOG_TYPE_ERROR, "CLTSP,processPedestrianData,GPS crumbs not available", buf, 2u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    LOWORD(v153) = 0;
    v56 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLTripSegmentProcessor::processPedestrianData(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const BOOL, const CLTripSegmentModeOfTransport, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLBackgroundInertialOdometrySample *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v56);
    goto LABEL_102;
  }
  v30 = (void *)objc_msgSend_objectAtIndexedSubscript_(v16, v28, 0, v29);
  v34 = objc_msgSend_timestamp(v30, v31, v32, v33);
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v148 = -1.0;
  if (!objc_msgSend_runInertialIntegrator(a2, v36, v37, v38))
  {
    v42 = 0;
    v35 = v16;
    if (!a8)
      goto LABEL_47;
    goto LABEL_45;
  }
  *(_WORD *)buf = 0;
  buf[2] = 0;
  *(_QWORD *)&v170[16] = 0;
  v171 = 0;
  *(_OWORD *)v170 = xmmword_18F771F40;
  v173 = 0;
  v174 = 0;
  v172 = 0x3FF0000000000000;
  v175 = 0;
  v177 = 0;
  v178 = 0;
  v176 = 0xBFF0000000000000;
  v179 = 0;
  v180 = 0;
  v185 = 0;
  v186 = 0;
  v187 = 0;
  v191[32] = 0;
  v191[40] = 0;
  v191[48] = 0;
  v191[56] = 0;
  v181 = 0;
  v182 = 0;
  v184 = 0;
  v183 = 0;
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  memset(v191, 0, 26);
  v192 = 0x3FF0000000000000;
  v193 = 0;
  v195 = 0;
  v194 = 0;
  v196 = 0x10000000000000;
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v42 = sub_18F6EAEA4((uint64_t)buf, (char *)v16, a7, v35, &v148);
  if (v42)
  {
    sub_18F6B95BC(a1 + 72, (uint64_t)v35, v34, 1);
    if (objc_msgSend_count(v35, v43, v44, v45))
    {
      v46 = (void *)objc_msgSend_objectAtIndexedSubscript_(v35, v39, 0, v41);
      objc_msgSend_horizontalAccuracy(v46, v47, v48, v49);
      if (v50 == -1.0)
      {
        v51 = (void *)objc_msgSend_objectAtIndexedSubscript_(v35, v39, 0, v41);
        objc_msgSend_setHorizontalAccuracy_(v51, v52, v53, v54, 100.0);
      }
    }
  }
  if (*((_QWORD *)&v198 + 1))
  {
    *(_QWORD *)&v199 = *((_QWORD *)&v198 + 1);
    operator delete(*((void **)&v198 + 1));
  }
  if ((_QWORD)v197)
  {
    *((_QWORD *)&v197 + 1) = v197;
    operator delete((void *)v197);
  }
  if (v181)
  {
    v182 = v181;
    operator delete(v181);
  }
  if (!v42)
    v35 = v16;
  if (a8)
  {
LABEL_45:
    if (v35)
    {
      objc_msgSend_removeAllObjects(a8, v39, v40, v41);
      objc_msgSend_addObjectsFromArray_(a8, v58, (uint64_t)v35, v59);
    }
  }
LABEL_47:
  if (objc_msgSend_runLinearInterpolator(a2, v39, v40, v41)
    && (v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]), sub_18F761EC8(a2, v145, v147, v146, a8, v63)))
  {
    sub_18F6B95BC(a1 + 72, (uint64_t)v63, v34, 2);
    v64 = a8 == 0;
    if (!v63)
      v64 = 1;
    if (!v64)
    {
      objc_msgSend_removeAllObjects(a8, v60, v61, v62);
      objc_msgSend_addObjectsFromArray_(a8, v65, (uint64_t)v63, v66);
    }
    v144 = 1;
  }
  else
  {
    v144 = 0;
  }
  if (!objc_msgSend_count(a8, v60, v61, v62))
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v116 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      v169 = v144;
      *(_WORD *)v170 = 1026;
      *(_DWORD *)&v170[2] = v42;
      _os_log_impl(&dword_18F5B3000, v116, OS_LOG_TYPE_ERROR, "CLTSP,processPedestrianData,empty reconstructed locations,liSuccess,%{public}d,iiSuccess,%{public}d", buf, 0xEu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v153 = 67240448;
    v154 = v144;
    v155 = 1026;
    v156 = v42;
    v56 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "BOOL CLTripSegmentProcessor::processPedestrianData(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const BOOL, const CLTripSegmentModeOfTransport, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLBackgroundInertialOdometrySample *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v56);
LABEL_102:
    if (v56 != (char *)buf)
      free(v56);
    return 0;
  }
  if (objc_msgSend_runMapIntegrator(a2, v67, v68, v69)
    && (v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]),
        sub_18F762A54(a1, a2, v145, v146, v147, v16, a8, v73)))
  {
    sub_18F6B95BC(a1 + 72, (uint64_t)v73, v34, 3);
    v74 = a8 == 0;
    if (!v73)
      v74 = 1;
    if (!v74)
    {
      objc_msgSend_removeAllObjects(a8, v70, v71, v72);
      objc_msgSend_addObjectsFromArray_(a8, v75, (uint64_t)v73, v76);
    }
    v77 = 1;
  }
  else
  {
    v77 = 0;
  }
  if ((v42 | objc_msgSend_runInertialIntegrator(a2, v70, v71, v72) ^ 1) == 1
    && (v144 | objc_msgSend_runLinearInterpolator(a2, v78, v79, v80) ^ 1) == 1)
  {
    v84 = v77 | objc_msgSend_runMapIntegrator(a2, v81, v82, v83) ^ 1;
  }
  else
  {
    v84 = 0;
  }
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
  v85 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
  {
    v89 = objc_msgSend_runInertialIntegrator(a2, v86, v87, v88);
    v93 = objc_msgSend_runLinearInterpolator(a2, v90, v91, v92);
    v97 = objc_msgSend_runMapIntegrator(a2, v94, v95, v96);
    *(_DWORD *)buf = 67241728;
    v169 = v84;
    *(_WORD *)v170 = 1026;
    *(_DWORD *)&v170[2] = v89;
    *(_WORD *)&v170[6] = 1026;
    *(_DWORD *)&v170[8] = v93;
    *(_WORD *)&v170[12] = 1026;
    *(_DWORD *)&v170[14] = v97;
    *(_WORD *)&v170[18] = 1026;
    *(_DWORD *)&v170[20] = v144;
    LOWORD(v171) = 1026;
    *(_DWORD *)((char *)&v171 + 2) = v42;
    HIWORD(v171) = 1026;
    LODWORD(v172) = v77;
    _os_log_impl(&dword_18F5B3000, v85, OS_LOG_TYPE_INFO, "CLTSP,processPedestrianData,success,%{public}d,iiEnabled,%{public}d,liEnabled,%{public}d,miEnabled,%{public}d,liSuccess,%{public}d,iiSuccess,%{public}d,miSuccess,%{public}d", buf, 0x2Cu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v134 = objc_msgSend_runInertialIntegrator(a2, v131, v132, v133);
    v138 = objc_msgSend_runLinearInterpolator(a2, v135, v136, v137);
    v142 = objc_msgSend_runMapIntegrator(a2, v139, v140, v141);
    v153 = 67241728;
    v154 = v84;
    v155 = 1026;
    v156 = v134;
    v157 = 1026;
    v158 = v138;
    v159 = 1026;
    v160 = v142;
    v161 = 1026;
    v162 = v144;
    v163 = 1026;
    v164 = v42;
    v165 = 1026;
    v166 = v77;
    v143 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::processPedestrianData(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const BOOL, const CLTripSegmentModeOfTransport, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLBackgroundInertialOdometrySample *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v143);
    if (v143 != (char *)buf)
      free(v143);
  }
  if (objc_msgSend_count(a8, v98, v99, v100))
  {
    v103 = 0;
    while (1)
    {
      v104 = (void *)objc_msgSend_objectAtIndexedSubscript_(a8, v101, v103, v102);
      v108 = (void *)objc_msgSend_timestamp(v104, v105, v106, v107);
      objc_msgSend_timeIntervalSinceReferenceDate(v108, v109, v110, v111);
      if (v115 >= v148 + -0.5)
        break;
      if (++v103 >= (unint64_t)objc_msgSend_count(a8, v112, v113, v114))
        return v84;
    }
    if ((_DWORD)v103 - 1 < 0
      || objc_msgSend_count(a8, v112, v113, v114) - 1 < (unint64_t)(v103 - 1)
      || (v119 = (void *)objc_msgSend_objectAtIndexedSubscript_(a8, v112, (v103 - 1), v118),
          !objc_msgSend_isMapMatched(v119, v120, v121, v122)))
    {
LABEL_93:
      if (v103)
LABEL_94:
        objc_msgSend_removeObjectsInRange_(a8, v112, 0, v103);
    }
    else
    {
      v103 = (v103 - 1);
      while ((int)v103 > 0)
      {
        v126 = v103 - 1;
        if (objc_msgSend_count(a8, v112, v123, v124) - 1 < (unint64_t)(v103 - 1))
          goto LABEL_94;
        v127 = (void *)objc_msgSend_objectAtIndexedSubscript_(a8, v112, --v103, v125);
        if (!objc_msgSend_isMapMatched(v127, v128, v129, v130))
        {
          v103 = v126 + 1;
          goto LABEL_93;
        }
      }
    }
  }
  return v84;
}

void sub_18F761EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  sub_18F762A04(&a45);
  _Unwind_Resume(a1);
}

BOOL sub_18F761EC8(void *a1, char *a2, uint64_t a3, unint64_t a4, void *a5, void *a6)
{
  int v9;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  _BOOL8 v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v9 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend_removeAllObjects(a6, a2, a3, a4);
  v45 = 0;
  v46 = 0;
  v44 = xmmword_18F771F40;
  v47 = 0x3FF0000000000000;
  objc_msgSend_timeBetweenReconstructedPointsSeconds(a1, v12, v13, v14);
  v16 = sub_18F6F20F0(v15, (uint64_t)&v44, a2, v9, a4, a5, a6);
  if (!v16)
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v17 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend_count(a6, v18, v19, v20);
      v25 = (void *)objc_msgSend_UUIDString(a2, v22, v23, v24);
      v29 = objc_msgSend_UTF8String(v25, v26, v27, v28);
      *(_DWORD *)buf = 67240450;
      v53 = v21;
      v54 = 2082;
      v55 = v29;
      _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEBUG, "CLTSP,LI,linear interpolator failed to compute locations,count,%{public}d,tripSegmentID,%{public}s,fallback to location array before interpolation", buf, 0x12u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      v34 = objc_msgSend_count(a6, v31, v32, v33);
      v38 = (void *)objc_msgSend_UUIDString(a2, v35, v36, v37);
      v42 = objc_msgSend_UTF8String(v38, v39, v40, v41);
      v48 = 67240450;
      v49 = v34;
      v50 = 2082;
      v51 = v42;
      v43 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::runLinearInterpolator(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const BOOL, const CLTripSegmentModeOfTransport, NSArray<CLTripSegmentLocation *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v43);
      if (v43 != (char *)buf)
        free(v43);
    }
  }
  return v16;
}

double sub_18F762128(void *a1, const char *a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, a2, (uint64_t)&v29, (uint64_t)v33, 16);
  if (!v3)
    return 0.0;
  v7 = v3;
  v8 = 0;
  v9 = *(_QWORD *)v30;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      v12 = v8;
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(a1);
      v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (v12)
      {
        if (v8)
        {
          objc_msgSend_latitude(v12, v4, v5, v6);
          v28 = v13;
          objc_msgSend_longitude(v12, v14, v15, v16);
          v27 = v17;
          if (sub_18F636714((double *)&v28, (double *)&v27))
          {
            objc_msgSend_latitude(v8, v4, v5, v6);
            v26 = v18;
            objc_msgSend_longitude(v8, v19, v20, v21);
            v25 = v22;
            if (sub_18F636714((double *)&v26, (double *)&v25))
            {
              objc_msgSend_distanceFromLocation_(v8, v4, (uint64_t)v12, v6);
              v10 = v10 + v23;
            }
          }
        }
      }
    }
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, v4, (uint64_t)&v29, (uint64_t)v33, 16);
  }
  while (v7);
  return v10;
}

uint64_t sub_18F762290(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  unint64_t i;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  char v92;
  NSObject *v93;
  char v94;
  NSObject *v95;
  int v96;
  NSObject *v97;
  NSObject *v98;
  char *v100;
  char *v101;
  char *v102;
  double v103;
  double v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  double v114;
  uint8_t v115[128];
  uint8_t buf[4];
  double v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_count(a1, (const char *)a2, a3, a4))
  {
    v110 = 0;
    v111 = 0;
    v112 = 0x3FF0000000000000;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = xmmword_18F771F40;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(a2, v6, (uint64_t)&v105, (uint64_t)v115, 16);
    if (!v7)
      goto LABEL_23;
    v12 = v7;
    v13 = *(_QWORD *)v106;
    v14 = -1;
LABEL_4:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v106 != v13)
        objc_enumerationMutation(a2);
      v16 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v15);
      if (v16)
      {
        if (objc_msgSend_referenceFrame(*(void **)(*((_QWORD *)&v105 + 1) + 8 * v15), v8, v9, v10) != 1)
          break;
      }
LABEL_21:
      if (++v15 == v12)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a2, v8, (uint64_t)&v105, (uint64_t)v115, 16);
        if (!v12)
        {
LABEL_23:
          v92 = 1;
          goto LABEL_50;
        }
        goto LABEL_4;
      }
    }
    v17 = (void *)objc_msgSend_timestamp(v16, v8, v9, v10);
    objc_msgSend_timeIntervalSinceReferenceDate(v17, v18, v19, v20);
    v25 = v24;
    for (i = v14 & ~(v14 >> 31); objc_msgSend_count(a1, v21, v22, v23) > i; ++i)
    {
      if (objc_msgSend_objectAtIndexedSubscript_(a1, v21, i, v23))
      {
        if ((v14 & 0x80000000) == 0)
        {
          v27 = (void *)objc_msgSend_objectAtIndexedSubscript_(a1, v21, i, v23);
          v31 = (void *)objc_msgSend_timestamp(v27, v28, v29, v30);
          objc_msgSend_timeIntervalSinceReferenceDate(v31, v32, v33, v34);
          if (v35 > v25)
            goto LABEL_18;
        }
        v36 = (void *)objc_msgSend_objectAtIndexedSubscript_(a1, v21, i, v23);
        if (objc_msgSend_referenceFrame(v36, v37, v38, v39) == 1)
          v14 = i;
      }
    }
    if (v14 == -1)
    {
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      v98 = qword_1EE172170;
      if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v117 = v25;
        _os_log_impl(&dword_18F5B3000, v98, OS_LOG_TYPE_INFO, "CLTSP,getCorrectedCoordinates,raw coordinate not available,%{public}.1lf", buf, 0xCu);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172168 != -1)
          dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
        v113 = 134349056;
        v114 = v25;
        v102 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "static BOOL CLTripSegmentUtilities::getCorrectedCoordinates(NSArray<CLTripSegmentLocation *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v102);
        if (v102 != (char *)buf)
          free(v102);
      }
      v92 = 0;
      v11 = 1;
    }
    else
    {
LABEL_18:
      v40 = objc_msgSend_objectAtIndexedSubscript_(a1, v21, v14, v23);
      if (v40)
      {
        v44 = (void *)v40;
        v104 = 0.0;
        objc_msgSend_latitude(v16, v41, v42, v43);
        v104 = v45;
        v103 = 0.0;
        objc_msgSend_longitude(v16, v46, v47, v48);
        v103 = v49;
        objc_msgSend_rawLatitude(v44, v50, v51, v52);
        v54 = v53;
        objc_msgSend_rawLongitude(v44, v55, v56, v57);
        v59 = v58;
        objc_msgSend_latitude(v44, v60, v61, v62);
        v64 = v63;
        objc_msgSend_longitude(v44, v65, v66, v67);
        v69 = v68;
        objc_msgSend_latitude(v16, v70, v71, v72);
        v74 = v73;
        objc_msgSend_longitude(v16, v75, v76, v77);
        if (sub_18F67F4C0((double *)&v109, &v104, &v103, v54, v59, v64, v69, v74, v78))
        {
          v83 = v103;
          v82 = v104;
          objc_msgSend_horizontalAccuracy(v16, v79, v80, v81);
          v85 = v84;
          v89 = objc_msgSend_rawReferenceFrame(v44, v86, v87, v88);
          objc_msgSend_updateLatitude_longitude_horizontalAccuracy_referenceFrame_(v16, v90, v89, v91, v82, v83, v85);
          goto LABEL_21;
        }
        if (qword_1EE172168 != -1)
          dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
        v97 = qword_1EE172170;
        if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          v117 = v25;
          _os_log_impl(&dword_18F5B3000, v97, OS_LOG_TYPE_ERROR, "CLTSP,getCorrectedCoordinates,corrected computation failed for time,%{public}.1lf", buf, 0xCu);
        }
        if (!sub_18F5C4AE0(115, 0))
          goto LABEL_43;
        bzero(buf, 0x65CuLL);
        if (qword_1EE172168 != -1)
          dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
        v113 = 134349056;
        v114 = v25;
LABEL_59:
        v101 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "static BOOL CLTripSegmentUtilities::getCorrectedCoordinates(NSArray<CLTripSegmentLocation *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v101);
        if (v101 != (char *)buf)
          free(v101);
LABEL_43:
        v92 = 0;
        v11 = 0;
        goto LABEL_50;
      }
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      v95 = qword_1EE172170;
      if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v117 = v25;
        _os_log_impl(&dword_18F5B3000, v95, OS_LOG_TYPE_ERROR, "CLTSP,getCorrectedCoordinates,tripLoc is nil,%{public}.1lf", buf, 0xCu);
      }
      v96 = sub_18F5C4AE0(115, 0);
      v92 = 0;
      v11 = 0;
      if (v96)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172168 != -1)
          dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
        v113 = 134349056;
        v114 = v25;
        goto LABEL_59;
      }
    }
LABEL_50:
    v94 = v92 | v11;
  }
  else
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v93 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v93, OS_LOG_TYPE_INFO, "CLTSP,getCorrectedCoordinates,empty locations", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      LOWORD(v109) = 0;
      v100 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "static BOOL CLTripSegmentUtilities::getCorrectedCoordinates(NSArray<CLTripSegmentLocation *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v100);
      if (v100 != (char *)buf)
        free(v100);
    }
    v94 = 0;
  }
  return v94 & 1;
}

_QWORD *sub_18F762A04(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[54];
  if (v2)
  {
    a1[55] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[51];
  if (v3)
  {
    a1[52] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[17];
  if (v4)
  {
    a1[18] = v4;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_18F762A54(uint64_t a1, char *a2, void *a3, uint64_t a4, unsigned int a5, void *a6, void *a7, void *a8)
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  unsigned int v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  double v133;
  uint64_t v134;
  double v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t j;
  void *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  double v148;
  NSObject *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  NSObject *v179;
  void *p_p;
  std::__shared_weak_count *v181;
  unint64_t *v182;
  uint64_t *p_shared_weak_owners;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  std::__shared_weak_count *v187;
  unint64_t *v188;
  unint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  id v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *Object;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  id v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  NSObject *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  int v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  int v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  unint64_t v242;
  char *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  std::__shared_weak_count *v248;
  unint64_t *p_shared_owners;
  unint64_t v250;
  void *v251;
  char *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  int v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  int v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  int v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  char *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  int v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  int v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  char *v290;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  _BYTE v310[128];
  _BYTE v311[22];
  __int16 v312;
  uint64_t v313;
  __int16 v314;
  uint64_t v315;
  __int16 v316;
  uint64_t v317;
  __int16 v318;
  uint64_t v319;
  __int16 v320;
  double v321;
  _BYTE buf[34];
  uint64_t v323;
  _BYTE v324[20];
  __int16 v325;
  _BYTE v326[14];
  __int16 v327;
  uint64_t v328;
  int v329;
  _BYTE v330[10];
  _BYTE v331[14];
  __int16 v332;
  int v333;
  __int16 v334;
  int v335;
  __int16 v336;
  int v337;
  __int16 v338;
  uint64_t v339;
  __int16 v340;
  int v341;
  __int16 v342;
  int v343;
  __int16 v344;
  uint64_t v345;
  __int16 v346;
  uint64_t v347;
  void *__p;
  uint64_t v349;
  uint64_t v350;
  _DWORD v351[2];
  uint64_t v352;
  __int16 v353;
  __int128 v354;
  __int16 v355;
  __int128 v356;
  __int16 v357;
  int v358;
  uint64_t v359;

  v359 = *MEMORY[0x1E0C80C00];
  v306 = 0u;
  v307 = 0u;
  v308 = 0u;
  v309 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, a2, (uint64_t)&v306, (uint64_t)&__p, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v307;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v307 != v13)
          objc_enumerationMutation(a6);
        v15 = *(void **)(*((_QWORD *)&v306 + 1) + 8 * v14);
        if (objc_msgSend_isWiFiLocationType(v15, v9, v10, v11))
        {
          v304 = 0u;
          v305 = 0u;
          v302 = 0u;
          v303 = 0u;
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a7, v9, (uint64_t)&v302, (uint64_t)&v329, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v303;
            v18 = -1.0;
            v19 = -1.0;
            while (2)
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v303 != v17)
                  objc_enumerationMutation(a7);
                v21 = *(void **)(*((_QWORD *)&v302 + 1) + 8 * i);
                v22 = (void *)objc_msgSend_timestamp(v21, v9, v10, v11);
                v26 = objc_msgSend_timestamp(v15, v23, v24, v25);
                objc_msgSend_timeIntervalSinceDate_(v22, v27, v26, v28);
                v30 = fabs(v29);
                if (v19 < 0.0 || v30 < v19 && v18 >= 0.0)
                {
                  objc_msgSend_course(v21, v9, v10, v11);
                  v18 = v31;
                  objc_msgSend_courseAccuracy(v21, v32, v33, v34);
                  v19 = v30;
                }
                if (v19 == 0.0 || v19 > 0.0 && v30 > v19)
                {
                  if (v19 < 2.0 && v18 >= 0.0)
                  {
                    if (qword_1EE172168 != -1)
                      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
                    v35 = qword_1EE172170;
                    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEBUG))
                    {
                      v39 = (void *)objc_msgSend_timestamp(v21, v36, v37, v38);
                      objc_msgSend_timeIntervalSinceReferenceDate(v39, v40, v41, v42);
                      v44 = v43;
                      objc_msgSend_latitude(v21, v45, v46, v47);
                      v49 = v48;
                      objc_msgSend_longitude(v21, v50, v51, v52);
                      v54 = v53;
                      objc_msgSend_horizontalAccuracy(v21, v55, v56, v57);
                      v59 = v58;
                      objc_msgSend_speed(v21, v60, v61, v62);
                      v64 = v63;
                      objc_msgSend_course(v21, v65, v66, v67);
                      *(_DWORD *)buf = 134350593;
                      *(_QWORD *)&buf[4] = v44;
                      *(_WORD *)&buf[12] = 2049;
                      *(_QWORD *)&buf[14] = v49;
                      *(_WORD *)&buf[22] = 2049;
                      *(_QWORD *)&buf[24] = v54;
                      *(_WORD *)&buf[32] = 2050;
                      v323 = v59;
                      *(_WORD *)v324 = 2050;
                      *(_QWORD *)&v324[2] = v64;
                      *(_WORD *)&v324[10] = 2050;
                      *(_QWORD *)&v324[12] = v68;
                      v325 = 2050;
                      *(double *)v326 = v18;
                      _os_log_impl(&dword_18F5B3000, v35, OS_LOG_TYPE_DEBUG, "CLTSP,wifiCourseFromInertial,course updated using inertial,time,%{public}.2lf,LL,%{private}.7lf,%{private}.7lf,hunc,%{public}.3lf,speed,%{public}.3lf,prevCourse,%{public}.3lf,newCourse,%{public}.3lf", buf, 0x48u);
                    }
                    if (sub_18F5C4AE0(115, 2))
                    {
                      bzero(buf, 0x65CuLL);
                      if (qword_1EE172168 != -1)
                        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
                      v75 = (void *)objc_msgSend_timestamp(v21, v72, v73, v74);
                      objc_msgSend_timeIntervalSinceReferenceDate(v75, v76, v77, v78);
                      v80 = v79;
                      objc_msgSend_latitude(v21, v81, v82, v83);
                      v85 = v84;
                      objc_msgSend_longitude(v21, v86, v87, v88);
                      v90 = v89;
                      objc_msgSend_horizontalAccuracy(v21, v91, v92, v93);
                      v95 = v94;
                      objc_msgSend_speed(v21, v96, v97, v98);
                      v100 = v99;
                      objc_msgSend_course(v21, v101, v102, v103);
                      *(_DWORD *)v311 = 134350593;
                      *(_QWORD *)&v311[4] = v80;
                      *(_WORD *)&v311[12] = 2049;
                      *(_QWORD *)&v311[14] = v85;
                      v312 = 2049;
                      v313 = v90;
                      v314 = 2050;
                      v315 = v95;
                      v316 = 2050;
                      v317 = v100;
                      v318 = 2050;
                      v319 = v104;
                      v320 = 2050;
                      v321 = v18;
                      v105 = (char *)_os_log_send_and_compose_impl();
                      sub_18F5F2740("Generic", 1, 0, 2, "static void CLTripSegmentUtilities::setCourseForWiFiLocationsUsingInertialReconstructedLocations(NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v105);
                      if (v105 != buf)
                        free(v105);
                    }
                    objc_msgSend_updateCourse_andCourseAccuracy_(v15, v69, v70, v71, v18, 10.0);
                  }
                  goto LABEL_30;
                }
              }
              v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a7, v9, (uint64_t)&v302, (uint64_t)&v329, 16);
              if (v16)
                continue;
              break;
            }
          }
        }
LABEL_30:
        ++v14;
      }
      while (v14 != v12);
      v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, v9, (uint64_t)&v306, (uint64_t)&__p, 16);
      v12 = v106;
    }
    while (v106);
  }
  if (a4 == 1 && !*(_QWORD *)(a1 + 88))
  {
    v244 = (char *)operator new(0xA0uLL);
    *((_QWORD *)v244 + 1) = 0;
    *((_QWORD *)v244 + 2) = 0;
    *(_OWORD *)(v244 + 24) = 0u;
    *(_QWORD *)v244 = &off_1E298DEF0;
    *(_OWORD *)(v244 + 72) = 0u;
    *(_OWORD *)(v244 + 40) = 0u;
    *(_OWORD *)(v244 + 56) = 0u;
    *(_OWORD *)(v244 + 88) = 0u;
    *((_QWORD *)v244 + 15) = 0;
    *((_QWORD *)v244 + 16) = 0;
    *(_OWORD *)(v244 + 104) = xmmword_18F771F40;
    *((_QWORD *)v244 + 17) = 0x3FF0000000000000;
    *((_QWORD *)v244 + 18) = 0;
    v244[152] = 1;
    *((_QWORD *)v244 + 18) = (id)objc_msgSend_array(MEMORY[0x1E0C99DE8], v245, v246, v247);
    v248 = *(std::__shared_weak_count **)(a1 + 96);
    *(_QWORD *)(a1 + 88) = v244 + 24;
    *(_QWORD *)(a1 + 96) = v244;
    if (v248)
    {
      p_shared_owners = (unint64_t *)&v248->__shared_owners_;
      do
        v250 = __ldaxr(p_shared_owners);
      while (__stlxr(v250 - 1, p_shared_owners));
      if (!v250)
      {
        ((void (*)(std::__shared_weak_count *))v248->__on_zero_shared)(v248);
        std::__shared_weak_count::__release_weak(v248);
      }
    }
  }
  v108 = (uint64_t *)(a1 + 88);
  v107 = *(_QWORD *)(a1 + 88);
  if (v107)
  {
    v109 = (void *)objc_msgSend_UUIDString(a3, v9, v10, v11);
    v113 = (char *)objc_msgSend_UTF8String(v109, v110, v111, v112);
    sub_18F5D5990(buf, v113);
    sub_18F6C640C(v107, (const std::string *)buf);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
  }
  sub_18F5CC0B8();
  if (sub_18F672E30())
    v117 = sub_18F6C66F4((uint64_t)CFSTR("DeriveCrumbsFromUpsampledLocationsForCLTSP"), (const char *)1, v115, v116);
  else
    v117 = 1;
  v118 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v114, v115, v116);
  if (objc_msgSend_count(a7, v119, v120, v121))
  {
    v124 = (void *)objc_msgSend_objectAtIndexedSubscript_(a7, v122, 0, v123);
    v128 = (void *)objc_msgSend_timestamp(v124, v125, v126, v127);
    objc_msgSend_timeIntervalSinceReferenceDate(v128, v129, v130, v131);
    v134 = *v108;
    if (*v108)
    {
      v135 = v133;
      v300 = 0u;
      v301 = 0u;
      v298 = 0u;
      v299 = 0u;
      v136 = *(void **)(v134 + 120);
      v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v132, (uint64_t)&v298, (uint64_t)v310, 16);
      if (v140)
      {
        v141 = *(_QWORD *)v299;
        do
        {
          for (j = 0; j != v140; ++j)
          {
            if (*(_QWORD *)v299 != v141)
              objc_enumerationMutation(v136);
            v143 = *(void **)(*((_QWORD *)&v298 + 1) + 8 * j);
            v144 = (void *)objc_msgSend_timestamp(v143, v137, v138, v139);
            objc_msgSend_timeIntervalSinceReferenceDate(v144, v145, v146, v147);
            if (v148 < v135)
              objc_msgSend_addObject_(v118, v137, (uint64_t)v143, v139);
          }
          v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(v136, v137, (uint64_t)&v298, (uint64_t)v310, 16);
        }
        while (v140);
      }
    }
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v149 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEBUG))
    {
      v153 = objc_msgSend_count(v118, v150, v151, v152);
      v157 = objc_msgSend_count(v118, v154, v155, v156);
      v161 = objc_msgSend_count(a7, v158, v159, v160);
      v165 = (void *)objc_msgSend_UUIDString(a3, v162, v163, v164);
      v169 = objc_msgSend_UTF8String(v165, v166, v167, v168);
      *(_DWORD *)buf = 67240962;
      *(_DWORD *)&buf[4] = v153;
      *(_WORD *)&buf[8] = 1026;
      *(_DWORD *)&buf[10] = v161 + v157;
      *(_WORD *)&buf[14] = 2082;
      *(_QWORD *)&buf[16] = v169;
      *(_WORD *)&buf[24] = 1026;
      *(_DWORD *)&buf[26] = v117;
      _os_log_impl(&dword_18F5B3000, v149, OS_LOG_TYPE_DEBUG, "CLTSP,MI,upsampledLocationsSet created,prevLocation,%{public}d,newTotalLocation,%{public}d,tripSegmentID,%{public}s,deriveCrumbsFromUpsampledLocations,%{public}d", buf, 0x1Eu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      v256 = objc_msgSend_count(v118, v253, v254, v255);
      v260 = objc_msgSend_count(v118, v257, v258, v259);
      v264 = objc_msgSend_count(a7, v261, v262, v263);
      v268 = (void *)objc_msgSend_UUIDString(a3, v265, v266, v267);
      v272 = objc_msgSend_UTF8String(v268, v269, v270, v271);
      LODWORD(__p) = 67240962;
      HIDWORD(__p) = v256;
      LOWORD(v349) = 1026;
      *(_DWORD *)((char *)&v349 + 2) = v264 + v260;
      HIWORD(v349) = 2082;
      v350 = v272;
      LOWORD(v351[0]) = 1026;
      *(_DWORD *)((char *)v351 + 2) = v117;
      v273 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::runMapIntegrator(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const CLTripSegmentModeOfTransport, const BOOL, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLTripSegmentLocation *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v273);
      if (v273 != buf)
        free(v273);
    }
    objc_msgSend_addObjectsFromArray_(v118, v170, (uint64_t)a7, v171);
  }
  v349 = 0;
  __p = 0;
  v351[0] = 0;
  v350 = 0;
  v352 = 0x3FE0000000000000;
  v353 = 0;
  v354 = xmmword_18F772310;
  v355 = 1;
  v356 = xmmword_18F772320;
  v357 = 1;
  v358 = 0;
  MEMORY[0x194002BEC](&__p, "CLTripSegmentMapIntegratorSparse");
  if (a4 == 1)
    v175 = 1;
  else
    v175 = 2;
  v351[0] = v175;
  v352 = 0x3FE0000000000000;
  HIBYTE(v353) = objc_msgSend_useXPCServiceForMapQuery(a2, v172, v173, v174);
  LOBYTE(v355) = objc_msgSend_isNetworkAccessAllowed(a2, v176, v177, v178);
  LOBYTE(v353) = 1;
  *(_QWORD *)&v354 = 0x4072C00000000000;
  LOBYTE(v357) = 1;
  if (a4 != 1)
  {
    HIBYTE(v355) = 1;
    v356 = xmmword_18F7765B0;
  }
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
  v179 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_INFO))
  {
    p_p = &__p;
    if (v350 < 0)
      p_p = __p;
    *(_DWORD *)buf = 136317698;
    *(_QWORD *)&buf[4] = p_p;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v351[0];
    *(_WORD *)&buf[18] = 2050;
    *(_QWORD *)&buf[20] = v352;
    *(_WORD *)&buf[28] = 1026;
    *(_DWORD *)&buf[30] = HIBYTE(v353);
    LOWORD(v323) = 1026;
    *(_DWORD *)((char *)&v323 + 2) = v355;
    HIWORD(v323) = 1026;
    *(_DWORD *)v324 = v353;
    *(_WORD *)&v324[4] = 2050;
    *(_QWORD *)&v324[6] = v354;
    *(_WORD *)&v324[14] = 1026;
    *(_DWORD *)&v324[16] = v357;
    v325 = 1026;
    *(_DWORD *)v326 = HIBYTE(v355);
    *(_WORD *)&v326[4] = 2050;
    *(_QWORD *)&v326[6] = v356;
    v327 = 2050;
    v328 = *((_QWORD *)&v356 + 1);
    _os_log_impl(&dword_18F5B3000, v179, OS_LOG_TYPE_INFO, "CLTSP,getGeoMapGeometrySettingsForRouteReconstruction,fTypeName,%s,fGeometryType,%{public}d,fIntersectionRoadSearchDistance,%{public}.1lf,fUseXPCServiceForDataQuery,%{public}d,fAllowNetworkTileDownload,%{public}d,fStoringRoadConnectionEnabled,%{public}d,fMinimumRadiusForMapDataBuffer_m,%{public}.1lf,fWaitForMapDataQueryToComplete,%{public}d,fPreferCachedTiles,%{public}d,fMinSnapRadiusM,%{public}.1lf,fMaxSnapRadiusM,%{public}.1lf", buf, 0x58u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v251 = &__p;
    if (v350 < 0)
      v251 = __p;
    v329 = 136317698;
    *(_QWORD *)v330 = v251;
    *(_WORD *)&v330[8] = 1026;
    *(_DWORD *)v331 = v351[0];
    *(_WORD *)&v331[4] = 2050;
    *(_QWORD *)&v331[6] = v352;
    v332 = 1026;
    v333 = HIBYTE(v353);
    v334 = 1026;
    v335 = v355;
    v336 = 1026;
    v337 = v353;
    v338 = 2050;
    v339 = v354;
    v340 = 1026;
    v341 = v357;
    v342 = 1026;
    v343 = HIBYTE(v355);
    v344 = 2050;
    v345 = v356;
    v346 = 2050;
    v347 = *((_QWORD *)&v356 + 1);
    v252 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "void getGeoMapGeometrySettingsForRouteReconstruction(CLTripSegmentProcessorOptions * _Nonnull, CLGeoMapFeatureGeometrySettings &, const CLTripSegmentModeOfTransport)", "CoreLocation: %s\n", v252);
    if (v252 != buf)
      free(v252);
  }
  v181 = (std::__shared_weak_count *)operator new(0xF8uLL);
  v181->__shared_owners_ = 0;
  v182 = (unint64_t *)&v181->__shared_owners_;
  v181->__shared_weak_owners_ = 0;
  v181->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298DF28;
  v181[1].std::__shared_count = (std::__shared_count)xmmword_18F771F40;
  v181[1].__shared_weak_owners_ = 0;
  v181[2].__vftable = 0;
  v181[2].__shared_owners_ = 0x3FF0000000000000;
  *(_OWORD *)&v181[2].__shared_weak_owners_ = 0u;
  p_shared_weak_owners = &v181[2].__shared_weak_owners_;
  v181[4].__shared_weak_owners_ = 0;
  v181[5].__vftable = 0;
  *(_OWORD *)&v181[3].__shared_owners_ = 0u;
  v181[4].std::__shared_count = (std::__shared_count)xmmword_18F771F40;
  v181[5].__shared_owners_ = 0x3FF0000000000000;
  *(_OWORD *)&v181[5].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v181[6].__shared_owners_ = 0u;
  v181[7].__vftable = 0;
  v181[2].__shared_weak_owners_ = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sub_18F6F1EE4((const char *)&__p, buf);
  sub_18F62B3EC((uint64_t)&v181[6].__shared_weak_owners_, (__int128 *)buf);
  v187 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v188 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v189 = __ldaxr(v188);
    while (__stlxr(v189 - 1, v188));
    if (!v189)
    {
      ((void (*)(std::__shared_weak_count *))v187->__on_zero_shared)(v187);
      std::__shared_weak_count::__release_weak(v187);
    }
  }
  LOWORD(v181[7].__shared_owners_) = 257;
  v181[8].__shared_owners_ = 0;
  v181[8].__shared_weak_owners_ = 0;
  *(_OWORD *)&v181[7].__shared_weak_owners_ = xmmword_18F771F40;
  v181[9].__vftable = (std::__shared_weak_count_vtbl *)0x3FF0000000000000;
  v181[9].__shared_owners_ = 0;
  v181[9].__shared_weak_owners_ = 0;
  v181[10].__vftable = 0;
  *(_QWORD *)v311 = v181 + 1;
  *(_QWORD *)&v311[8] = v181;
  LOBYTE(v181[7].__shared_owners_) = objc_msgSend_useParticleMapMatcherForSnappingInMapIntegrator(a2, v184, v185, v186);
  BYTE1(v181[7].__shared_owners_) = v117;
  v193 = sub_18F6FD3C8((uint64_t)&v181[1], a3, a4, a5, v108, a6, v118);
  if ((v193 & 1) != 0)
  {
    if (a8)
    {
      v194 = *p_shared_weak_owners;
      if (*p_shared_weak_owners)
      {
        objc_msgSend_removeAllObjects(a8, v190, v191, v192);
        objc_msgSend_addObjectsFromArray_(a8, v195, v194, v196);
      }
    }
    if (*v108)
      sub_18F6C9830(*v108, (char *)a8, v191, v192);
    sub_18F5CC0B8();
    if (sub_18F672E30())
    {
      v197 = sub_18F763D9C((uint64_t ***)&v181[9].__shared_owners_);
      v201 = v197;
      if (v197 && objc_msgSend_count(v197, v198, v199, v200))
      {
        Object = (void *)objc_msgSend_firstObject(v201, v202, v203, v204);
        v209 = objc_msgSend_timestamp(Object, v206, v207, v208);
        sub_18F6B95BC(a1 + 72, (uint64_t)v201, v209, 7);
      }
      if (*v108)
      {
        v210 = sub_18F763D9C((uint64_t ***)(*v108 + 24));
        v214 = v210;
        if (v210)
        {
          if (objc_msgSend_count(v210, v211, v212, v213))
          {
            v218 = (void *)objc_msgSend_firstObject(v214, v215, v216, v217);
            v222 = objc_msgSend_timestamp(v218, v219, v220, v221);
            sub_18F6B95BC(a1 + 72, (uint64_t)v214, v222, 6);
          }
        }
      }
    }
  }
  else
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
    v223 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEBUG))
    {
      v227 = objc_msgSend_count(a6, v224, v225, v226);
      v231 = objc_msgSend_count(a7, v228, v229, v230);
      v235 = (void *)objc_msgSend_UUIDString(a3, v232, v233, v234);
      v239 = objc_msgSend_UTF8String(v235, v236, v237, v238);
      *(_DWORD *)buf = 67240706;
      *(_DWORD *)&buf[4] = v227;
      *(_WORD *)&buf[8] = 1026;
      *(_DWORD *)&buf[10] = v231;
      *(_WORD *)&buf[14] = 2082;
      *(_QWORD *)&buf[16] = v239;
      _os_log_impl(&dword_18F5B3000, v223, OS_LOG_TYPE_DEBUG, "CLTSP,MI,map integrator failed,tripLocations,%{public}d,inertialReconstructed,%{public}d,tripSegmentID,%{public}s", buf, 0x18u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2990CF0);
      v277 = objc_msgSend_count(a6, v274, v275, v276);
      v281 = objc_msgSend_count(a7, v278, v279, v280);
      v285 = (void *)objc_msgSend_UUIDString(a3, v282, v283, v284);
      v289 = objc_msgSend_UTF8String(v285, v286, v287, v288);
      v329 = 67240706;
      *(_DWORD *)v330 = v277;
      *(_WORD *)&v330[4] = 1026;
      *(_DWORD *)&v330[6] = v281;
      *(_WORD *)v331 = 2082;
      *(_QWORD *)&v331[2] = v289;
      v290 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "BOOL CLTripSegmentProcessor::runMapIntegrator(CLTripSegmentProcessorOptions * _Nonnull, NSUUID * _Nonnull, const CLTripSegmentModeOfTransport, const BOOL, NSArray<CLTripSegmentLocation *> * _Nonnull, NSArray<CLTripSegmentLocation *> * _Nonnull, NSMutableArray<CLTripSegmentLocation *> * _Nonnull)", "CoreLocation: %s\n", v290);
      if (v290 != buf)
        free(v290);
    }
    if (*v108)
      sub_18F6C9830(*v108, (char *)a7, v240, v241);
  }
  do
    v242 = __ldaxr(v182);
  while (__stlxr(v242 - 1, v182));
  if (!v242)
  {
    ((void (*)(std::__shared_weak_count *))v181->__on_zero_shared)(v181);
    std::__shared_weak_count::__release_weak(v181);
  }
  if (SHIBYTE(v350) < 0)
    operator delete(__p);
  return v193;
}

void sub_18F763A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  sub_18F5D6004((uint64_t)&a61);
  if (SLOBYTE(STACK[0x8E7]) < 0)
    operator delete((void *)STACK[0x8D0]);
  _Unwind_Resume(a1);
}

os_log_t sub_18F763B50()
{
  os_log_t result;

  result = os_log_create("com.apple.locationd.Position", "TripSegmentProcessor");
  qword_1EE172170 = (uint64_t)result;
  return result;
}

id *sub_18F763B7C(void *a1, const char *a2, const char *a3)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  const char *v42;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)a2 = 0;
  *(_DWORD *)a3 = 0;
  v51 = 0;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, a2, (uint64_t)&v47, (uint64_t)v52, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(a1);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (objc_msgSend_referenceFrame(v12, v6, v7, v8) == 2)
        {
          ++*(_DWORD *)a2;
          continue;
        }
        objc_msgSend_latitude(v12, v6, v7, v8);
        v14 = v13;
        objc_msgSend_longitude(v12, v15, v16, v17);
        v19 = v18;
        objc_msgSend_horizontalAccuracy(v12, v20, v21, v22);
        v24 = v23;
        v46 = 0.0;
        objc_msgSend_latitude(v12, v25, v26, v27);
        v46 = v28;
        v45 = 0.0;
        objc_msgSend_longitude(v12, v29, v30, v31);
        v45 = v32;
        v44 = 0.0;
        objc_msgSend_horizontalAccuracy(v12, v33, v34, v35);
        v44 = v36;
        v40 = objc_msgSend_referenceFrame(v12, v37, v38, v39);
        v41 = sub_18F67F3B8(&v51, v40, &v46, &v45, &v44, 5, v14, v19, v24);
        v42 = a3;
        if (v41 != 1)
        {
          if (v41 != 2)
            continue;
          objc_msgSend_updateLatitude_longitude_horizontalAccuracy_referenceFrame_(v12, v6, 2, v8, v46, v45, v44);
          v42 = a2;
        }
        ++*(_DWORD *)v42;
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, v6, (uint64_t)&v47, (uint64_t)v52, 16);
    }
    while (v9);
  }
  return sub_18F67F384(&v51);
}

void sub_18F763D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  sub_18F67F384((id *)va);
  _Unwind_Resume(a1);
}

id sub_18F763D9C(uint64_t ***a1)
{
  id v2;
  uint64_t **v3;
  uint64_t **v4;
  const char *v5;
  uint64_t v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  id v10;
  const char *v11;
  uint64_t v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = *v3;
    v9 = v3[1];
    while (v8 != v9)
    {
      if (*v8)
      {
        v10 = sub_18F67F160(*v8, 1);
        objc_msgSend_addObject_(v7, v11, (uint64_t)v10, v12);
      }
      v8 += 2;
    }
    objc_msgSend_addObjectsFromArray_(v2, v5, (uint64_t)v7, v6);
    v3 += 3;
  }
  return v2;
}

void sub_18F763E48(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298DEF0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_18F763E58(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298DEF0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x194002D30);
}

void sub_18F763E88(uint64_t a1)
{
  void **v2;

  v2 = (void **)(a1 + 72);
  sub_18F6C9FE8(&v2);
  v2 = (void **)(a1 + 48);
  sub_18F62C498(&v2);
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
}

void sub_18F763EEC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298DF28;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_18F763EFC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298DF28;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x194002D30);
}

void sub_18F763F2C(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void **v6;

  v6 = (void **)(a1 + 224);
  sub_18F62C498(&v6);
  v5 = *(void **)(a1 + 64);
  if (v5)
    objc_msgSend_dealloc(v5, v2, v3, v4);
  sub_18F5D6004(a1 + 160);
  v6 = (void **)(a1 + 136);
  sub_18F62AB98(&v6);
  v6 = (void **)(a1 + 72);
  sub_18F62AB98(&v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

void BZ2_bzWrite(int *bzerror, BZFILE *b, void *buf, int len)
{
  MEMORY[0x1E0DE4168](bzerror, b, buf, *(_QWORD *)&len);
}

void BZ2_bzWriteClose(int *bzerror, BZFILE *b, int abandon, unsigned int *nbytes_in, unsigned int *nbytes_out)
{
  MEMORY[0x1E0DE4170](bzerror, b, *(_QWORD *)&abandon, nbytes_in, nbytes_out);
}

BZFILE *__cdecl BZ2_bzWriteOpen(int *bzerror, FILE *f, int blockSize100k, int verbosity, int workFactor)
{
  return (BZFILE *)MEMORY[0x1E0DE4178](bzerror, f, *(_QWORD *)&blockSize100k, *(_QWORD *)&verbosity, *(_QWORD *)&workFactor);
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1E0C800D8]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1E0C800E0]();
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x1E0C80120]();
}

uint64_t CCKDFParametersCreateAnsiX963()
{
  return MEMORY[0x1E0C80220]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x1E0C80230]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

uint64_t CFCopyUserName()
{
  return MEMORY[0x1E0C98388]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

uint64_t CFGetUserName()
{
  return MEMORY[0x1E0C98740]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1E0C98F68](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99620](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x1E0D26458]();
}

uint64_t GEOClosestCoordinateOnLineSegmentFromCoordinate()
{
  return MEMORY[0x1E0D26470]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x1E0D26578]();
}

uint64_t GEOResetGeoCodecsAllocator()
{
  return MEMORY[0x1E0D26AE0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x1E0DE2B88]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1E0CD6318](key);
}

uint64_t SecKeyCreateDecryptedDataWithParameters()
{
  return MEMORY[0x1E0CD6348]();
}

uint64_t SecKeyCreateEncryptedDataWithParameters()
{
  return MEMORY[0x1E0CD6360]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

uint64_t SecTrustStoreContains()
{
  return MEMORY[0x1E0CD6768]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x1E0CD6778]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1E0C9A0C0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1E0C9A178]();
}

uint64_t _CFIsDeallocating()
{
  return MEMORY[0x1E0C9A1D8]();
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x1E0C809D8](buf, bufsize);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t CLConnection::sendMessage()
{
  return MEMORY[0x1E0D44550]();
}

uint64_t CLConnection::deferredDelete(CLConnection *this)
{
  return MEMORY[0x1E0D44558](this);
}

uint64_t CLConnection::setDefaultMessageHandler()
{
  return MEMORY[0x1E0D44560]();
}

uint64_t CLConnection::start(CLConnection *this)
{
  return MEMORY[0x1E0D44568](this);
}

uint64_t CLConnection::CLConnection()
{
  return MEMORY[0x1E0D44570]();
}

uint64_t CLConnectionClient::sendMessage()
{
  return MEMORY[0x1E0D44578]();
}

{
  return MEMORY[0x1E0D44580]();
}

uint64_t CLConnectionClient::sendMessageSync()
{
  return MEMORY[0x1E0D44588]();
}

uint64_t CLConnectionClient::setHandlerForMessage()
{
  return MEMORY[0x1E0D44590]();
}

uint64_t CLConnectionClient::setInterruptionHandler()
{
  return MEMORY[0x1E0D44598]();
}

uint64_t CLConnectionClient::setDefaultMessageHandler()
{
  return MEMORY[0x1E0D445A0]();
}

uint64_t CLConnectionClient::sendMessageWithCompletion()
{
  return MEMORY[0x1E0D445A8]();
}

uint64_t CLConnectionClient::start(CLConnectionClient *this)
{
  return MEMORY[0x1E0D445B0](this);
}

uint64_t CLConnectionClient::CLConnectionClient()
{
  return MEMORY[0x1E0D445B8]();
}

void CLConnectionClient::~CLConnectionClient(CLConnectionClient *this)
{
  MEMORY[0x1E0D445C0](this);
}

uint64_t CLConnectionMessage::CLConnectionMessage()
{
  return MEMORY[0x1E0D445D0]();
}

{
  return MEMORY[0x1E0D445D8]();
}

void CLConnectionMessage::~CLConnectionMessage(CLConnectionMessage *this)
{
  MEMORY[0x1E0D445E0](this);
}

uint64_t CLConnectionMessage::getDictionary(CLConnectionMessage *this)
{
  return MEMORY[0x1E0D445E8](this);
}

uint64_t CLConnectionMessage::getDictionaryOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  return MEMORY[0x1E0D44608](this, a2);
}

uint64_t CLConnectionMessage::name(CLConnectionMessage *this)
{
  return MEMORY[0x1E0D44610](this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1E0DE4598]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x1E0DE4B10]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E298D0E8();
}

void operator delete(void *__p)
{
  off_1E298D0F0(__p);
}

uint64_t operator delete()
{
  return off_1E298D0F8();
}

uint64_t operator new[]()
{
  return off_1E298D100();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E298D108(__sz);
}

uint64_t operator new()
{
  return off_1E298D110();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1E0C80E60](*(_QWORD *)&image_index);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1E0C80E68](*(_QWORD *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1E0C80EB8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sandbox_in_a_container()
{
  return MEMORY[0x1E0C81198]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1E0C816D8](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x1E0C82EE8](object, finalizer);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

uint64_t entr_act_begin()
{
  return MEMORY[0x1E0DE57F0]();
}

uint64_t entr_act_end()
{
  return MEMORY[0x1E0DE57F8]();
}

uint64_t entr_act_modify()
{
  return MEMORY[0x1E0DE5800]();
}

uint64_t entr_act_set()
{
  return MEMORY[0x1E0DE5808]();
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return (char *)MEMORY[0x1E0C83228](a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fgetpos(FILE *a1, fpos_t *a2)
{
  return MEMORY[0x1E0C83398](a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1E0C835C8](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C83B30](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C83B38](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
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

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1E0C85398](a1, a2, *(_QWORD *)&a3, a4);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

void srandom(unsigned int a1)
{
  MEMORY[0x1E0C85488](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1E0C85B88]();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x1E0DE8C78](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x1E0DE8C80]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x1E0DE8C88](buf);
}

int xmlBufferLength(const xmlBuffer *buf)
{
  return MEMORY[0x1E0DE8C90](buf);
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
  MEMORY[0x1E0DE8D60](writer);
}

xmlTextWriterPtr xmlNewTextWriterMemory(xmlBufferPtr buf, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x1E0DE8E48](buf, *(_QWORD *)&compression);
}

int xmlTextWriterFlush(xmlTextWriterPtr writer)
{
  return MEMORY[0x1E0DE90D8](writer);
}

int xmlTextWriterWriteBase64(xmlTextWriterPtr writer, const char *data, int start, int len)
{
  return MEMORY[0x1E0DE9110](writer, data, *(_QWORD *)&start, *(_QWORD *)&len);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

