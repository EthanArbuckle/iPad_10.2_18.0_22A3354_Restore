uint64_t LBAttendingStatesServiceGetXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6A6A8);
}

uint64_t LBAttendingStatesServiceDelegateGetXPCInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6A590);
}

void sub_2141ADC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2141B02C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2141B11E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSXPCClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreSpeechLibraryCore_frameworkLibrary)
    CoreSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreSpeechLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreSpeechLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("LBAudioCapture.m"), 22, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CSXPCClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCSXPCClientClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("LBAudioCapture.m"), 23, CFSTR("Unable to find class %s"), "CSXPCClient");

LABEL_8:
    __break(1u);
  }
  getCSXPCClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id LBLocalSpeechServiceGetXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6D840);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  v27[4] = objc_opt_class();
  v27[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startSpeechRecognitionResultsWithSettings_, 0, 0);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v26 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_stopSpeechRecognitionWithReason_requestId_, 1, 0);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v25 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_disableLocalSpeechRecognitionForRequestId_, 0, 0);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_sendSpeechCorrectionInfo_interactionIdentifier_, 0, 0);

  v13 = (void *)MEMORY[0x24BDBCF20];
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_sendSpeechCorrectionInfo_interactionIdentifier_, 1, 0);

  v16 = (void *)MEMORY[0x24BDBCF20];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17, v20, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_updateTCUState_, 0, 0);

  return v0;
}

id LBLocalSpeechServiceDelegateGetXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(uint64_t);
  void *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD v117[3];
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[2];
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD v140[2];
  uint64_t v141;
  uint64_t v142;
  _QWORD v143[2];
  uint64_t v144;
  _QWORD v145[2];
  _QWORD v146[3];

  v146[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D69C08);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v146[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v146, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_, 0, 0);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v145[0] = objc_opt_class();
  v145[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v145, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_, 2, 0);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v144 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v144, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_metadata_, 0, 0);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v143[0] = objc_opt_class();
  v143[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v143, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_metadata_, 2, 0);

  v13 = (void *)MEMORY[0x24BDBCF20];
  v142 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v142, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_tokens_metadata_, 3, 0);

  v16 = (void *)MEMORY[0x24BDBCF20];
  v141 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v141, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_speechPackage_metadata_, 0, 0);

  v19 = (void *)MEMORY[0x24BDBCF20];
  v140[0] = objc_opt_class();
  v140[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v140, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_speechPackage_metadata_, 2, 0);

  v22 = (void *)MEMORY[0x24BDBCF20];
  v139 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v139, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_localSpeechServiceDidReceivedPartialResultWithRequestId_language_speechPackage_metadata_, 3, 0);

  v25 = (void *)MEMORY[0x24BDBCF20];
  v138 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v138, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_, 0, 0);

  v28 = (void *)MEMORY[0x24BDBCF20];
  v137 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v137, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_, 1, 0);

  v31 = (void *)MEMORY[0x24BDBCF20];
  v136 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v136, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_metadata_, 0, 0);

  v34 = (void *)MEMORY[0x24BDBCF20];
  v135 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v135, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_metadata_, 1, 0);

  v37 = (void *)MEMORY[0x24BDBCF20];
  v134 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v134, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWithArray:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_localSpeechServiceDidReceivedFinalResultWithRequestId_speechPackage_metadata_, 2, 0);

  v40 = (void *)MEMORY[0x24BDBCF20];
  v133 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v133, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_localSpeechServiceDidCompletionRecognitionWithStatistics_requestId_endpointMode_error_, 1, 0);

  v43 = (void *)MEMORY[0x24BDBCF20];
  v132 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v132, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWithArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_, 0, 0);

  v46 = (void *)MEMORY[0x24BDBCF20];
  v131 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v131, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setWithArray:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_, 2, 0);

  v49 = (void *)MEMORY[0x24BDBCF20];
  v130 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v130, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setWithArray:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_metadata_, 0, 0);

  v52 = (void *)MEMORY[0x24BDBCF20];
  v129 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v129, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setWithArray:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_metadata_, 2, 0);

  v55 = (void *)MEMORY[0x24BDBCF20];
  v128 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v128, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setWithArray:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId_rcId_speechPackage_duration_metadata_, 4, 0);

  v58 = (void *)MEMORY[0x24BDBCF20];
  v127 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v127, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setWithArray:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_localSpeechServiceDidReceivedEagerResultWithRequestId_rcId_shouldAccept_mitigationSignal_featuresToLog_, 0, 0);

  v61 = (void *)MEMORY[0x24BDBCF20];
  v126 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setWithArray:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_localSpeechServiceDidReceivedEagerResultWithRequestId_rcId_shouldAccept_mitigationSignal_featuresToLog_, 1, 0);

  v64 = (void *)MEMORY[0x24BDBCF20];
  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setWithArray:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_localSpeechServiceDidReceivedEagerResultWithRequestId_rcId_shouldAccept_mitigationSignal_featuresToLog_, 4, 0);

  v67 = (void *)MEMORY[0x24BDBCF20];
  v124 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v124, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setWithArray:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_localSpeechServiceDidReceivedVoiceIdScoreCard_, 0, 0);

  v70 = (void *)MEMORY[0x24BDBCF20];
  v123 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v123, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setWithArray:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_localSpeechServiceDidReceivedFinalResultCandidateWithRequestId_speechPackage_, 1, 0);

  v73 = (void *)MEMORY[0x24BDBCF20];
  v122 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v122, 1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setWithArray:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v75, sel_localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId_speechPackage_metadata_, 0, 0);

  v76 = (void *)MEMORY[0x24BDBCF20];
  v121 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v121, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setWithArray:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId_speechPackage_metadata_, 1, 0);

  v79 = (void *)MEMORY[0x24BDBCF20];
  v120 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setWithArray:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId_speechPackage_metadata_, 2, 0);

  v82 = (void *)MEMORY[0x24BDBCF20];
  v111 = 0;
  v112 = &v111;
  v113 = 0x2050000000;
  v83 = (void *)getSMTTRPCandidateClass_softClass;
  v114 = getSMTTRPCandidateClass_softClass;
  if (!getSMTTRPCandidateClass_softClass)
  {
    v106 = MEMORY[0x24BDAC760];
    v107 = 3221225472;
    v108 = __getSMTTRPCandidateClass_block_invoke;
    v109 = &unk_24D170928;
    v110 = &v111;
    __getSMTTRPCandidateClass_block_invoke((uint64_t)&v106);
    v83 = (void *)v112[3];
  }
  v84 = objc_retainAutorelease(v83);
  _Block_object_dispose(&v111, 8);
  v119 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v119, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setWithArray:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v86, sel_localSpeechServiceDidReceiveTRPCandidatePackage_, 0, 0);

  v87 = (void *)MEMORY[0x24BDBCF20];
  v111 = 0;
  v112 = &v111;
  v113 = 0x2050000000;
  v88 = (void *)getSMTContinuityEndClass_softClass;
  v114 = getSMTContinuityEndClass_softClass;
  if (!getSMTContinuityEndClass_softClass)
  {
    v106 = MEMORY[0x24BDAC760];
    v107 = 3221225472;
    v108 = __getSMTContinuityEndClass_block_invoke;
    v109 = &unk_24D170928;
    v110 = &v111;
    __getSMTContinuityEndClass_block_invoke((uint64_t)&v106);
    v88 = (void *)v112[3];
  }
  v89 = objc_retainAutorelease(v88);
  _Block_object_dispose(&v111, 8);
  v118 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v118, 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setWithArray:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v91, sel_localSpeechServiceDidReceiveContinuityEndDetected_, 0, 0);

  v92 = (void *)MEMORY[0x24BDBCF20];
  v117[0] = objc_opt_class();
  v117[1] = objc_opt_class();
  v117[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 3);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setWithArray:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v94, sel_localSpeechServiceDidReceiveTCUStateUpdate_, 0, 0);

  v95 = (void *)MEMORY[0x24BDBCF20];
  v111 = 0;
  v112 = &v111;
  v113 = 0x2050000000;
  v96 = (void *)getSMTTRPDetectedClass_softClass;
  v114 = getSMTTRPDetectedClass_softClass;
  if (!getSMTTRPDetectedClass_softClass)
  {
    v106 = MEMORY[0x24BDAC760];
    v107 = 3221225472;
    v108 = __getSMTTRPDetectedClass_block_invoke;
    v109 = &unk_24D170928;
    v110 = &v111;
    __getSMTTRPDetectedClass_block_invoke((uint64_t)&v106);
    v96 = (void *)v112[3];
  }
  v97 = objc_retainAutorelease(v96);
  _Block_object_dispose(&v111, 8);
  v116 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v116, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setWithArray:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v99, sel_localSpeechServiceDidReceiveTRPDetected_, 0, 0);

  v100 = (void *)MEMORY[0x24BDBCF20];
  v111 = 0;
  v112 = &v111;
  v113 = 0x2050000000;
  v101 = (void *)getSMTMultiUserTRPCandidateClass_softClass;
  v114 = getSMTMultiUserTRPCandidateClass_softClass;
  if (!getSMTMultiUserTRPCandidateClass_softClass)
  {
    v106 = MEMORY[0x24BDAC760];
    v107 = 3221225472;
    v108 = __getSMTMultiUserTRPCandidateClass_block_invoke;
    v109 = &unk_24D170928;
    v110 = &v111;
    __getSMTMultiUserTRPCandidateClass_block_invoke((uint64_t)&v106);
    v101 = (void *)v112[3];
  }
  v102 = objc_retainAutorelease(v101);
  _Block_object_dispose(&v111, 8);
  v115 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v115, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setWithArray:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v104, sel_localSpeechServiceDidReceiveMultiUserTRPCandidatePackage_, 0, 0);

  return v0;
}

void sub_2141B4DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSMTTRPCandidateClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SiriMessageTypesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SMTTRPCandidate");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSMTTRPCandidateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSMTTRPCandidateClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("LBLocalSpeechService.m"), 29, CFSTR("Unable to find class %s"), "SMTTRPCandidate");

    __break(1u);
  }
}

void __getSMTContinuityEndClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SiriMessageTypesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SMTContinuityEnd");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSMTContinuityEndClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSMTContinuityEndClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("LBLocalSpeechService.m"), 30, CFSTR("Unable to find class %s"), "SMTContinuityEnd");

    __break(1u);
  }
}

void __getSMTTRPDetectedClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SiriMessageTypesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SMTTRPDetected");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSMTTRPDetectedClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSMTTRPDetectedClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("LBLocalSpeechService.m"), 31, CFSTR("Unable to find class %s"), "SMTTRPDetected");

    __break(1u);
  }
}

void __getSMTMultiUserTRPCandidateClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SiriMessageTypesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SMTMultiUserTRPCandidate");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSMTMultiUserTRPCandidateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSMTMultiUserTRPCandidateClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("LBLocalSpeechService.m"), 32, CFSTR("Unable to find class %s"), "SMTMultiUserTRPCandidate");

    __break(1u);
  }
}

void SiriMessageTypesLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!SiriMessageTypesLibraryCore_frameworkLibrary)
    SiriMessageTypesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SiriMessageTypesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SiriMessageTypesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("LBLocalSpeechService.m"), 28, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void LBLogInitIfNeeded()
{
  if (LBLogInitIfNeeded_once != -1)
    dispatch_once(&LBLogInitIfNeeded_once, &__block_literal_global);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

