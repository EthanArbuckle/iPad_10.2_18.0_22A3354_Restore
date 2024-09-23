@implementation CDDADConnection

- (void)_tearDownInFlightObjects
{
  NSObject *muckingWithInFlightCollections;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ii;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[6];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[6];
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[6];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[6];
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[6];
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  _QWORD block[6];
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v117 = 0;
  v118 = &v117;
  v119 = 0x3032000000;
  v120 = __Block_byref_object_copy_;
  v121 = __Block_byref_object_dispose_;
  v122 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke;
  block[3] = &unk_1E7B9C930;
  block[5] = &v117;
  block[4] = self;
  dispatch_sync(muckingWithInFlightCollections, block);
  v4 = (void *)v118[5];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_sendFinishedToConsumerWithError_, v5);

  v110 = 0;
  v111 = &v110;
  v112 = 0x3032000000;
  v113 = __Block_byref_object_copy_;
  v114 = __Block_byref_object_dispose_;
  v115 = 0;
  v6 = self->_muckingWithInFlightCollections;
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_92;
  v109[3] = &unk_1E7B9C930;
  v109[5] = &v110;
  v109[4] = self;
  dispatch_sync(v6, v109);
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v7 = (id)v111[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v106 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        objc_msgSend(v11, "consumer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "folderChange:finishedWithStatus:error:", v11, 0, v13);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
    }
    while (v8);
  }

  v99 = 0;
  v100 = &v99;
  v101 = 0x3032000000;
  v102 = __Block_byref_object_copy_;
  v103 = __Block_byref_object_dispose_;
  v104 = 0;
  v14 = self->_muckingWithInFlightCollections;
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_93;
  v98[3] = &unk_1E7B9C930;
  v98[5] = &v99;
  v98[4] = self;
  dispatch_sync(v14, v98);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v15 = (id)v100[5];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v94, v127, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v95 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "finishedWithError:", v20);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v94, v127, 16);
    }
    while (v16);
  }

  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy_;
  v92 = __Block_byref_object_dispose_;
  v93 = 0;
  v21 = self->_muckingWithInFlightCollections;
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_94;
  v87[3] = &unk_1E7B9C930;
  v87[5] = &v88;
  v87[4] = self;
  dispatch_sync(v21, v87);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v22 = (id)v89[5];
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v83, v126, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v84;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v84 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "finishedWithError:", v27);

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v83, v126, 16);
    }
    while (v23);
  }

  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy_;
  v81 = __Block_byref_object_dispose_;
  v82 = 0;
  v28 = self->_muckingWithInFlightCollections;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_95;
  v76[3] = &unk_1E7B9C930;
  v76[4] = self;
  v76[5] = &v77;
  dispatch_sync(v28, v76);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v29 = (id)v78[5];
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v125, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v73;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v73 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "finishedWithError:exceededResultLimit:", v34, 0);

      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v125, 16);
    }
    while (v30);
  }

  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy_;
  v70 = __Block_byref_object_dispose_;
  v71 = 0;
  v35 = self->_muckingWithInFlightCollections;
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_96;
  v65[3] = &unk_1E7B9C930;
  v65[4] = self;
  v65[5] = &v66;
  dispatch_sync(v35, v65);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v36 = (id)v67[5];
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v124, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v62;
    do
    {
      for (n = 0; n != v37; ++n)
      {
        if (*(_QWORD *)v62 != v38)
          objc_enumerationMutation(v36);
        v40 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * n);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "finishedWithError:", v41);

      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v124, 16);
    }
    while (v37);
  }

  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy_;
  v59 = __Block_byref_object_dispose_;
  v60 = 0;
  v42 = self->_muckingWithInFlightCollections;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __43__CDDADConnection__tearDownInFlightObjects__block_invoke_97;
  v54[3] = &unk_1E7B9C930;
  v54[4] = self;
  v54[5] = &v55;
  dispatch_sync(v42, v54);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v43 = (id)v56[5];
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v123, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v51;
    do
    {
      for (ii = 0; ii != v44; ++ii)
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(v43);
        v47 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * ii);
        objc_msgSend(v47, "consumer", (_QWORD)v50);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "oofRequestInfo:finishedWithResult:error:", v47, 0, v49);

      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v123, 16);
    }
    while (v44);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v110, 8);

  _Block_object_dispose(&v117, 8);
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing ALL search queries", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_92(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Failing all folder changes", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_93(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing all attachment downloads", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing all calendar availability lookups", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_95(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing all calendar search requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_96(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing all share requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
}

uint64_t __43__CDDADConnection__tearDownInFlightObjects__block_invoke_97(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing all settings requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
}

- (void)_serverDiedWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[2];

  v4 = a3;
  v5 = v4;
  if (v4 == (id)MEMORY[0x1E0C81258])
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v7 = "Daemon died, cleaning up.";
      v8 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v4 == (id)MEMORY[0x1E0C81260])
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      v7 = "LOOK AT ME!!!! dataaccessd couldn't be started.  We won't try again.  If you're seeing this, get ready for some pain";
      v8 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  -[CDDADConnection _tearDownInFlightObjects](self, "_tearDownInFlightObjects", v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("DataAccessMonitoringConnectionFailed"), 0);

  -[CDDADConnection setRegistered:](self, "setRegistered:", 0);
}

- (id)_connection
{
  OS_xpc_object *conn;

  conn = self->_conn;
  if (!conn)
  {
    -[CDDADConnection _initializeConnection](self, "_initializeConnection");
    conn = self->_conn;
  }
  return conn;
}

- (void)_initializeConnection
{
  NSObject *muckingWithConn;
  _QWORD block[5];

  muckingWithConn = self->_muckingWithConn;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CDDADConnection__initializeConnection__block_invoke;
  block[3] = &unk_1E7B9C908;
  block[4] = self;
  dispatch_sync(muckingWithConn, block);
}

void __40__CDDADConnection__initializeConnection__block_invoke(uint64_t a1)
{
  const char *v2;
  NSObject *v3;
  xpc_connection_t mach_service;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (const char *)objc_msgSend(CFSTR("com.apple.remindd.dataaccess"), "UTF8String");
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service(v2, v3, 0);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = mach_service;

  v7 = *(_QWORD **)(a1 + 32);
  if (v7[1])
  {
    objc_msgSend(v7, "_initializeXPCConnection:");
  }
  else
  {
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = CFSTR("com.apple.remindd.dataaccess");
      _os_log_impl(&dword_1C1D11000, v8, OS_LOG_TYPE_ERROR, "Couldn't create a connection to [%@]", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)_initializeConnectionWithXPCEndpoint:(id)a3
{
  id v4;
  NSObject *muckingWithConn;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  muckingWithConn = self->_muckingWithConn;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CDDADConnection__initializeConnectionWithXPCEndpoint___block_invoke;
  block[3] = &unk_1E7B9C8E0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(muckingWithConn, block);

}

void __56__CDDADConnection__initializeConnectionWithXPCEndpoint___block_invoke(uint64_t a1)
{
  xpc_connection_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  if (v5[1])
  {
    objc_msgSend(v5, "_initializeXPCConnection:");
  }
  else
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_ERROR, "Couldn't create a connection to endpoint: [%@]", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_initializeXPCConnection:(id)a3
{
  _xpc_connection_s *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CDDADConnection__initializeXPCConnection___block_invoke;
  v5[3] = &unk_1E7B9C958;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  xpc_connection_resume(v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __44__CDDADConnection__initializeXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x1C3BB5E44]();
  if (v3 == MEMORY[0x1E0C81310])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_serverDiedWithReason:", v5);
    goto LABEL_5;
  }
  if (v3 == MEMORY[0x1E0C812F8])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_dispatchMessage:", v5);
LABEL_5:

  }
}

- (id)_createReplyToRequest:(id)a3 withProperties:(id)a4
{
  id v5;
  xpc_object_t reply;
  void *v7;
  id v8;
  _QWORD applier[4];
  id v11;

  v5 = a4;
  reply = xpc_dictionary_create_reply(a3);
  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __56__CDDADConnection__createReplyToRequest_withProperties___block_invoke;
  applier[3] = &unk_1E7B9C980;
  v8 = reply;
  v11 = v8;
  xpc_dictionary_apply(v7, applier);

  return v8;
}

uint64_t __56__CDDADConnection__createReplyToRequest_withProperties___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

- (id)decodedErrorFromData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v10 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v10);
    v5 = v10;
    if (!v4)
    {
      DALoggingwithCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_DEFAULT, "Unable to read data to decode error: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("root"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_policyKeyChanged:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CDDADConnection__policyKeyChanged___block_invoke;
  block[3] = &unk_1E7B9C908;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __37__CDDADConnection__policyKeyChanged___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void **v6;
  const __CFString **v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEPolicyKeyKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEPolicyErrorCodeKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEAccountIdKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v10 = CFSTR("ASPolicyKey");
      v11 = CFSTR("ASPolicyErrorCodeKey");
      v12 = v1;
      v13 = v2;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = &v12;
      v7 = &v10;
      v8 = 2;
    }
    else
    {
      v14 = CFSTR("ASPolicyKey");
      v15 = v1;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = &v15;
      v7 = &v14;
      v8 = 1;
    }
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, v8, v10, v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:userInfo:](v4, "postNotificationName:object:userInfo:", CFSTR("ASPolicyKeyChangedNotification"), v3, v9);

  }
  else
  {
    DALoggingwithCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v0;
      _os_log_impl(&dword_1C1D11000, v4, OS_LOG_TYPE_ERROR, "Malformed callback message from dataaccess daemon: bad account id (%@)", buf, 0xCu);
    }
  }

}

- (void)_foldersUpdated:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CDDADConnection__foldersUpdated___block_invoke;
  block[3] = &unk_1E7B9C908;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __35__CDDADConnection__foldersUpdated___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  _QWORD v7[2];
  _QWORD v8[2];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEFolderIDsKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEAccountIdKey"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (!v1)
  {
    DALoggingwithCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v10 = v0;
    v6 = "Malformed callback message from dataaccess daemon: no folders (%@)";
LABEL_8:
    _os_log_impl(&dword_1C1D11000, v4, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v2)
  {
    DALoggingwithCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v10 = v0;
    v6 = "Malformed callback message from dataaccess daemon: bad account id (%@)";
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("DAChangedFolders");
  v7[1] = CFSTR("DAChangedAccountID");
  v8[0] = v1;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject postNotificationName:object:userInfo:](v4, "postNotificationName:object:userInfo:", CFSTR("DataAccessMonitoredFolderUpdated"), 0, v5);

LABEL_9:
}

- (void)_logDataAccessStatus:(id)a3
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global);
}

void __40__CDDADConnection__logDataAccessStatus___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("ASClientAccountDumpStatusNotification"), 0);

}

- (void)_serverContactsSearchQueryFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  id v24;
  __int128 *p_buf;
  uint8_t v26[4];
  NSObject *v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESearchIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C1D11000, v8, OS_LOG_TYPE_DEBUG, "doServerContactsSearchQueryFinishedWithStatus called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CDDADConnection__serverContactsSearchQueryFinished___block_invoke;
  block[3] = &unk_1E7B9C9E8;
  p_buf = &buf;
  block[4] = self;
  v10 = v6;
  v24 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESearchResultsKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v22 = 0;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v11, &v22);
      v13 = v22;
      if (!v12)
      {
        DALoggingwithCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v26 = 138412290;
          v27 = v13;
          _os_log_impl(&dword_1C1D11000, v14, OS_LOG_TYPE_DEFAULT, "Unable to read data to decode search results: %@", v26, 0xCu);
        }

      }
      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v17, CFSTR("root"));
      v18 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      DALoggingwithCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1C1D11000, v13, OS_LOG_TYPE_INFO, "Could not deserialize search results from the xpc message", v26, 2u);
      }
      v18 = 0;
    }

    DALoggingwithCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v26 = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1C1D11000, v19, OS_LOG_TYPE_DEBUG, "Search results: %@", v26, 0xCu);
    }

    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "sendResultsToConsumer:", v18);
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), (int)objc_msgSend(v7, "intValue"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendFinishedToConsumerWithError:", v21);

  }
  else
  {
    DALoggingwithCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1C1D11000, v18, OS_LOG_TYPE_ERROR, "received results for an unknown search query", v26, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __54__CDDADConnection__serverContactsSearchQueryFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[5];
    v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing query %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[5]);
}

- (void)_folderChangeFinished:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *muckingWithInFlightCollections;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t v18[8];
  _QWORD block[5];
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAETaskIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEFolderIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEFolderNameKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDDADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1C1D11000, v11, OS_LOG_TYPE_DEBUG, "folderChange finished with status %@, error %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CDDADConnection__folderChangeFinished___block_invoke;
  block[3] = &unk_1E7B9C9E8;
  v21 = buf;
  block[4] = self;
  v13 = v5;
  v20 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  v14 = *(_QWORD *)&buf[8];
  v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v15)
  {
    if (v7)
    {
      objc_msgSend(v15, "setFolderId:", v7);
      v14 = *(_QWORD *)&buf[8];
    }
    if (v8)
    {
      objc_msgSend(*(id *)(v14 + 40), "setDisplayName:", v8);
      v14 = *(_QWORD *)&buf[8];
    }
    objc_msgSend(*(id *)(v14 + 40), "consumer");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject folderChange:finishedWithStatus:error:](v16, "folderChange:finishedWithStatus:error:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), (int)objc_msgSend(v6, "intValue"), v10);
  }
  else
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1C1D11000, v16, OS_LOG_TYPE_ERROR, "received results for an unknown folderChange", v18, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __41__CDDADConnection__folderChangeFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[5];
    v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing folder change %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[4] + 64), "removeObjectForKey:", a1[5]);
}

- (void)_getStatusReportsFromClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CDDADConnection__getStatusReportsFromClient___block_invoke;
  v7[3] = &unk_1E7B9C8E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__CDDADConnection__getStatusReportsFromClient___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _xpc_connection_s *v13;
  _xpc_connection_s *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v15);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v10);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        }
        while (v7);
      }

    }
  }
  v19 = CFSTR("kDAEStatusReportsKey");
  v20 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, (_QWORD)v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "_createReplyToRequest:withProperties:", *(_QWORD *)(a1 + 40), v11);
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 40));
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (*(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 8) == v13)
    xpc_connection_send_message(v13, v12);

}

- (void)_downloadProgress:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *muckingWithInFlightCollections;
  id v15;
  void *v16;
  id obj;
  _QWORD block[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEAttachmentIdsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEDownloadedBytesKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAETotalBytesKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy_;
        v23 = __Block_byref_object_dispose_;
        v24 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __37__CDDADConnection__downloadProgress___block_invoke;
        block[3] = &unk_1E7B9C9E8;
        block[5] = v13;
        block[6] = &v19;
        block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        objc_msgSend((id)v20[5], "updateProgressDownloadedByteCount:totalByteCount:", v6, v8, v15);
        _Block_object_dispose(&v19, 8);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

}

void __37__CDDADConnection__downloadProgress___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_downloadFinished:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *muckingWithInFlightCollections;
  id v13;
  void *v14;
  id obj;
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kDAEAttachmentIdsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDDADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v17 = 0;
        v18 = &v17;
        v19 = 0x3032000000;
        v20 = __Block_byref_object_copy_;
        v21 = __Block_byref_object_dispose_;
        v22 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __37__CDDADConnection__downloadFinished___block_invoke;
        block[3] = &unk_1E7B9C9E8;
        block[5] = v11;
        block[6] = &v17;
        block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        objc_msgSend((id)v18[5], "finishedWithError:", v6, v13);
        _Block_object_dispose(&v17, 8);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

}

uint64_t __37__CDDADConnection__downloadFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 72), "removeObjectForKey:", a1[5]);
}

- (void)_shareResponseFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESharedCalendarActionIdKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDDADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CDDADConnection__shareResponseFinished___block_invoke;
  block[3] = &unk_1E7B9C9E8;
  v13 = &v14;
  block[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v15[5], "finishedWithError:", v8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __42__CDDADConnection__shareResponseFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 96), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 96), "removeObjectForKey:", a1[5]);
}

- (void)_oofSettingsRequestsFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  DAOofParams *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  __int128 *p_buf;
  uint8_t v27[4];
  DAOofParams *v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEOofRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1C1D11000, v8, OS_LOG_TYPE_DEBUG, "_oofSettingsRequestsFinished called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CDDADConnection__oofSettingsRequestsFinished___block_invoke;
  block[3] = &unk_1E7B9C9E8;
  p_buf = &buf;
  block[4] = self;
  v10 = v6;
  v25 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (v7)
    {
      if (objc_msgSend(v7, "intValue") == 2)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEOofIsUpdateKey"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && -[NSObject BOOLValue](v11, "BOOLValue"))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "oofRequestInfo:finishedWithResult:error:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0, 0);
        }
        else
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEOofSettingsResultKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v19 = -[DAOofParams initWithDictionary:]([DAOofParams alloc], "initWithDictionary:", v13);
            DALoggingwithCategory(0);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v27 = 138412290;
              v28 = v19;
              _os_log_impl(&dword_1C1D11000, v20, OS_LOG_TYPE_DEBUG, "Oof settings request results: %@", v27, 0xCu);
            }

            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "oofRequestInfo:finishedWithResult:error:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v19, 0);
          }
          else
          {
            DALoggingwithCategory(0);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v27 = 0;
              _os_log_impl(&dword_1C1D11000, v22, OS_LOG_TYPE_INFO, "Could not deserialize search results from the xpc message", v27, 2u);
            }

            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
            v19 = (DAOofParams *)objc_claimAutoreleasedReturnValue();
            v23 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 62, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[DAOofParams oofRequestInfo:finishedWithResult:error:](v19, "oofRequestInfo:finishedWithResult:error:", v23, 0, v21);
          }

        }
      }
      else
      {
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
        v12 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), (int)objc_msgSend(v7, "intValue"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject oofRequestInfo:finishedWithResult:error:](v12, "oofRequestInfo:finishedWithResult:error:", v17, 0, v18);

      }
    }
    else
    {
      DALoggingwithCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1C1D11000, v14, OS_LOG_TYPE_INFO, "Status missing from the xpc message", v27, 2u);
      }

      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
      v12 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 62, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject oofRequestInfo:finishedWithResult:error:](v12, "oofRequestInfo:finishedWithResult:error:", v15, 0, v16);

    }
  }
  else
  {
    DALoggingwithCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1C1D11000, v12, OS_LOG_TYPE_ERROR, "received results for an unknown oof settings request", v27, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __48__CDDADConnection__oofSettingsRequestsFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[5];
    v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_DEBUG, "Removing from inflight dictionary: oof settings request %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[4] + 104), "removeObjectForKey:", a1[5]);
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_109);
  objc_msgSend((id)sharedConnection_gDADConnection, "reallyRegisterForInterrogation");
  return (id)sharedConnection_gDADConnection;
}

void __35__CDDADConnection_sharedConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CDDADConnection _init]([CDDADConnection alloc], "_init");
  v1 = (void *)sharedConnection_gDADConnection;
  sharedConnection_gDADConnection = (uint64_t)v0;

}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  return -[CDDADConnection watchFoldersWithKeys:forAccountID:persistent:](self, "watchFoldersWithKeys:forAccountID:persistent:", a3, a4, 0);
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v19 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v16, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v17 = -[CDDADConnection watchFoldersWithSyncKeyMap:forAccountID:persistent:](self, "watchFoldersWithSyncKeyMap:forAccountID:persistent:", v9, v8, v19);
  return v17;
}

- (BOOL)watchFoldersWithSyncKeyMap:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  BOOL v16;
  int v18;
  const char *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v5 = a5;
  v21[4] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v8, 127, 0);
  v20[0] = CFSTR("kDAEMessageNameKey");
  v20[1] = CFSTR("kDAEAccountIdKey");
  v21[0] = CFSTR("kDAEBeginMonitoringFolders");
  v21[1] = v8;
  v21[2] = v9;
  v20[2] = CFSTR("kDAESyncKeyMapKey");
  v20[3] = CFSTR("kDAEPersistentMonitoringKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v18 = 136315138;
    v19 = "-[CDDADConnection watchFoldersWithSyncKeyMap:forAccountID:persistent:]";
    _os_log_impl(&dword_1C1D11000, v12, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v18, 0xCu);
  }

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v15 = xpc_connection_send_message_with_reply_sync(v14, v13);

  v16 = -[CDDADConnection _validateXPCReply:](self, "_validateXPCReply:", v15);
  return v16;
}

- (BOOL)resumeWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v15, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = -[CDDADConnection resumeWatchingFoldersWithSyncKeyMap:forAccountID:](self, "resumeWatchingFoldersWithSyncKeyMap:forAccountID:", v8, v7);
  return v16;
}

- (BOOL)resumeWatchingFoldersWithSyncKeyMap:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _xpc_connection_s *v11;
  xpc_object_t v12;
  BOOL v13;
  int v15;
  const char *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_conn)
  {
    -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v7, 127, 0);
    v17[0] = CFSTR("kDAEMessageNameKey");
    v17[1] = CFSTR("kDAEAccountIdKey");
    v18[0] = CFSTR("kDAEResumeMonitoringFolders");
    v18[1] = v7;
    v17[2] = CFSTR("kDAESyncKeyMapKey");
    v18[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "-[CDDADConnection resumeWatchingFoldersWithSyncKeyMap:forAccountID:]";
      _os_log_impl(&dword_1C1D11000, v9, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v15, 0xCu);
    }

    v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](self, "_connection");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v12 = xpc_connection_send_message_with_reply_sync(v11, v10);

    v13 = -[CDDADConnection _validateXPCReply:](self, "_validateXPCReply:", v12);
  }
  else
  {
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1C1D11000, v8, OS_LOG_TYPE_INFO, "[DADConnection resumeWatchingFoldersWithKeys:forAccountID] called without a connection. Will not resume.", (uint8_t *)&v15, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)suspendWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  BOOL v14;
  int v16;
  const char *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("kDAEMessageNameKey");
  v18[1] = CFSTR("kDAEAccountIdKey");
  v19[0] = CFSTR("kDAESuspendMonitoringFolders");
  v19[1] = a4;
  v18[2] = CFSTR("kDAEFolderIDsKey");
  v19[2] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "-[CDDADConnection suspendWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v16, 0xCu);
  }

  v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v13 = xpc_connection_send_message_with_reply_sync(v12, v11);

  v14 = -[CDDADConnection _validateXPCReply:](self, "_validateXPCReply:", v13);
  return v14;
}

- (BOOL)stopWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  BOOL v14;
  int v16;
  const char *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("kDAEMessageNameKey");
  v18[1] = CFSTR("kDAEAccountIdKey");
  v19[0] = CFSTR("kDAEStopMonitoringFolders");
  v19[1] = a4;
  v18[2] = CFSTR("kDAEFolderIDsKey");
  v19[2] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "-[CDDADConnection stopWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_INFO, "XPC call performed in: %s", (uint8_t *)&v16, 0xCu);
  }

  v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v13 = xpc_connection_send_message_with_reply_sync(v12, v11);

  v14 = -[CDDADConnection _validateXPCReply:](self, "_validateXPCReply:", v13);
  return v14;
}

- (BOOL)_validateXPCReply:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MEMORY[0x1C3BB5E44]();
  if (v4 == MEMORY[0x1E0C812F8])
  {
    v6 = _CFXPCCreateCFObjectFromXPCObject();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");
    v7 = v9 == 2;
    if (v9 != 2)
    {
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = (uint64_t)v8;
        _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_ERROR, "XPC Reply Failure. Status Code: %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  else
  {
    v5 = v4;
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_ERROR, "Unsupported XPC reply type. Reply Type: %@", (uint8_t *)&v12, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)requestPolicyUpdateForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v4, 127, 0);
  v9[0] = CFSTR("kDAEMessageNameKey");
  v9[1] = CFSTR("kDAEAccountIdKey");
  v10[0] = CFSTR("kDAERequestPolicyUpdate");
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v7, v6);

  return 1;
}

- (id)currentPolicyKeyForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD handler[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v22[0] = CFSTR("kDAEMessageNameKey");
  v22[1] = CFSTR("kDAEAccountIdKey");
  v21 = 0;
  v23[0] = CFSTR("kDAEGetCurrentPolicyKey");
  v23[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v7 = dispatch_semaphore_create(0);
  -[CDDADConnection _connection](self, "_connection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __48__CDDADConnection_currentPolicyKeyForAccountID___block_invoke;
  handler[3] = &unk_1E7B9CA30;
  v15 = &v16;
  v10 = v7;
  v14 = v10;
  xpc_connection_send_message_with_reply(v8, v6, v9, handler);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __48__CDDADConnection_currentPolicyKeyForAccountID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1C3BB5E44]() == MEMORY[0x1E0C812F8])
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEPolicyKeyKey"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || objc_msgSend(v8, "intValue") != 2)
    {
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315394;
        v12 = "-[CDDADConnection currentPolicyKeyForAccountID:]_block_invoke";
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (unint64_t)_nextStopMonitoringStatusToken
{
  unint64_t v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_nextStopMonitoringStatusToken_nextTokenLock);
  v2 = ++_nextStopMonitoringStatusToken_nextToken;
  os_unfair_lock_unlock((os_unfair_lock_t)&_nextStopMonitoringStatusToken_nextTokenLock);
  return v2;
}

- (void)_requestDaemonChangeAgentMonitoringStatus:(BOOL)a3 withToken:(unint64_t)a4 waitForReply:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v7;
  NSObject *v9;
  const __CFString *v10;
  __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
  _xpc_connection_s *v15;
  _xpc_connection_s *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v5 = a5;
  v7 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("stop");
    if (v7)
      v10 = CFSTR("start");
    v21 = 138412290;
    v22 = (const char *)v10;
    _os_log_impl(&dword_1C1D11000, v9, OS_LOG_TYPE_INFO, "Requesting that DataAccess %@ monitoring agents.", (uint8_t *)&v21, 0xCu);
  }

  v11 = kDAEStopMonitoringAgents;
  if (v7)
    v11 = kDAEStartMonitoringAgents;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", *v11, CFSTR("kDAEMessageNameKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("kDAEAgentMonitoringToken"));

  if (v5)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kDAEAgentMonitoringNeedsReply"));
    v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](self, "_connection");
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v16 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v15, v14);

    if (MEMORY[0x1C3BB5E44](v16) == MEMORY[0x1E0C812F8])
    {
      v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18 || objc_msgSend(v18, "intValue") != 2)
      {
        DALoggingwithCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315394;
          v22 = "-[CDDADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:]";
          v23 = 2112;
          v24 = v19;
          _os_log_impl(&dword_1C1D11000, v20, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v21, 0x16u);
        }

      }
    }
  }
  else
  {
    v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](self, "_connection");
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v16, v14);
  }

}

- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3
{
  -[CDDADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 1, a3, 0);
}

- (unint64_t)requestDaemonStopMonitoringAgents
{
  unint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_nextStopMonitoringStatusToken");
  -[CDDADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 0, v3, 0);
  return v3;
}

- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3
{
  -[CDDADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 1, a3, 1);
}

- (unint64_t)requestDaemonStopMonitoringAgentsSync
{
  unint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_nextStopMonitoringStatusToken");
  -[CDDADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 0, v3, 1);
  return v3;
}

- (void)removeStoresForAccountWithID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _xpc_connection_s *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("kDAEMessageNameKey");
  v9[1] = CFSTR("kDAEAccountIdKey");
  v10[0] = CFSTR("kDAERemoveStoresForAccountWithID");
  v10[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, v7);

}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 requireChangedFolders:(BOOL)a5 isUserRequested:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v6 = a6;
  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v22 = v10;
    v23 = 2048;
    v24 = a4;
    v25 = 1024;
    v26 = v7;
    v27 = 1024;
    v28 = v6;
    _os_log_impl(&dword_1C1D11000, v11, OS_LOG_TYPE_DEBUG, "updateFolderListForAccountID %@, dataclasses %lx, requireChangedFolders %d, isUserRequested %d", buf, 0x22u);
  }

  -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v10, a4, v6);
  -[CDDADConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v10);
  v20[0] = CFSTR("kDAERequestFolderListUpdate");
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEDataclassesBitmaskKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v12;
  v19[3] = CFSTR("kDAERequireChangedFoldersKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  v19[4] = CFSTR("kDAEIsUserRequestedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v17, v16);

  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  return -[CDDADConnection updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:](self, "updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:", a3, a4, 0, a5);
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclasses:(int64_t)a5 isUserRequested:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  DALoggingwithCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2048;
    v26 = a5;
    v27 = 1024;
    v28 = v6;
    _os_log_impl(&dword_1C1D11000, v12, OS_LOG_TYPE_DEBUG, "updateContentsOfFoldersWithKeys %@ for account id %@, dataclasses 0x%lx isUserRequested %d", buf, 0x26u);
  }

  -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v11, a5, v6);
  -[CDDADConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v11);
  v20[0] = CFSTR("kDAERequestFolderContentsUpdate");
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEDataclassesBitmaskKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v13;
  v19[3] = CFSTR("kDAEIsUserRequestedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = CFSTR("kDAEFolderIDsKey");
  v20[3] = v14;
  v20[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v17, v16);

  return 1;
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _xpc_connection_s *v14;
  _QWORD v16[4];
  _QWORD v17[4];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  DALoggingwithCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v8;
    v20 = 2048;
    v21 = a4;
    v22 = 1024;
    v23 = v5;
    _os_log_impl(&dword_1C1D11000, v9, OS_LOG_TYPE_DEBUG, "updateContentsOfAllFoldersForAccountID %@, dataclasses 0x%lxx isUserRequested %d", buf, 0x1Cu);
  }

  -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v8, a4, v5);
  -[CDDADConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v8);
  v17[0] = CFSTR("kDAERequestAllFolderContentsUpdate");
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEDataclassesBitmaskKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  v16[3] = CFSTR("kDAEIsUserRequestedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v14, v13);

  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4
{
  return -[CDDADConnection updateFolderListForAccountID:andDataclasses:isUserRequested:](self, "updateFolderListForAccountID:andDataclasses:isUserRequested:", a3, a4, 0);
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclass:(int64_t)a5
{
  return -[CDDADConnection updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:](self, "updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:", a3, a4, a5, 0);
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclass:(int64_t)a4
{
  return -[CDDADConnection updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:](self, "updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:", a3, a4, 0);
}

- (BOOL)performServerContactsSearch:(id)a3 forAccountWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  dispatch_semaphore_t v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  const char *v18;
  _QWORD v20[4];
  id v21;
  CDDADConnection *v22;
  NSObject *v23;
  uint64_t *v24;
  uint8_t buf[8];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v7, 8, 0);
  if (!v7)
  {
    DALoggingwithCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "nil accountID passed to performServerContactsSearch. Refusing to attempt search";
LABEL_8:
      _os_log_impl(&dword_1C1D11000, v11, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    }
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    DALoggingwithCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "nil search string passed to performServerContactsSearch. Refusing to attempt search";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v30[0] = CFSTR("kDAEMessageNameKey");
  v30[1] = CFSTR("kDAEAccountIdKey");
  v31[0] = CFSTR("kDAEOpenServerContactsSearch");
  v31[1] = v7;
  v30[2] = CFSTR("kDAESearchQueryKey");
  objc_msgSend(v6, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v13 = dispatch_semaphore_create(0);
  -[CDDADConnection _connection](self, "_connection");
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__CDDADConnection_performServerContactsSearch_forAccountWithID___block_invoke;
  v20[3] = &unk_1E7B9CA80;
  v21 = v6;
  v22 = self;
  v24 = &v26;
  v16 = v13;
  v23 = v16;
  xpc_connection_send_message_with_reply(v14, v12, v15, v20);

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  v17 = *((_BYTE *)v27 + 24) != 0;

LABEL_10:
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __64__CDDADConnection_performServerContactsSearch_forAccountWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v8 = a2;
  if (MEMORY[0x1C3BB5E44]() == MEMORY[0x1E0C812F8])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAESearchIDKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSearchID:", v4);
    v5 = *(void **)(a1 + 32);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CDDADConnection_performServerContactsSearch_forAccountWithID___block_invoke_2;
    block[3] = &unk_1E7B9CA58;
    v10 = v5;
    v11 = v4;
    v12 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    dispatch_sync(v6, block);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t __64__CDDADConnection_performServerContactsSearch_forAccountWithID___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1C1D11000, v2, OS_LOG_TYPE_DEBUG, "Setting search query %@ for key %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[6] + 56), "setObject:forKeyedSubscript:", a1[4], a1[5]);
}

- (void)cancelServerContactsSearch:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  NSObject *muckingWithInFlightCollections;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CDDADConnection *v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "searchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "setState:", 2);
    objc_msgSend(v4, "setConsumer:", 0);
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v4;
      _os_log_impl(&dword_1C1D11000, v7, OS_LOG_TYPE_DEBUG, "Cancelling search task %p", buf, 0xCu);
    }

    objc_msgSend(v4, "searchID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("kDAEMessageNameKey");
    v21[1] = CFSTR("kDAESearchIDKey");
    v22[0] = CFSTR("kDAECancelServerContactsSearch");
    v22[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](self, "_connection");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v11, v10);

    DALoggingwithCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_1C1D11000, v12, OS_LOG_TYPE_DEBUG, "Removing search query for key %@", buf, 0xCu);
    }

    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __46__CDDADConnection_cancelServerContactsSearch___block_invoke;
    v18 = &unk_1E7B9C8E0;
    v19 = self;
    v20 = v8;
    v14 = v8;
    dispatch_sync(muckingWithInFlightCollections, &v15);
    objc_msgSend(v4, "setSearchID:", &stru_1E7B9D9F8, v15, v16, v17, v18, v19);

  }
}

uint64_t __46__CDDADConnection_cancelServerContactsSearch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (BOOL)processMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _xpc_connection_s *v20;
  xpc_object_t v21;
  BOOL v22;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a6;
  -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v15, 5, 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("kDAEProcessMeetingRequests"), CFSTR("kDAEMessageNameKey"), v15, CFSTR("kDAEAccountIdKey"), v16, CFSTR("kDAEFolderIDKey"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("kDAEMeetingRequestDatasKey"));
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("kDAEMeetingRequestIdsToClearKey"));
  if (v14)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("kDAEMeetingRequestIdsToSoftClearKey"));
  DALoggingwithCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CDDADConnection processMeetingRequests:deliveryIdsToClear:deliveryIdsToSoftClear:inFolderWithId:forAccountWithId:]";
    _os_log_impl(&dword_1C1D11000, v18, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v21 = xpc_connection_send_message_with_reply_sync(v20, v19);

  v22 = -[CDDADConnection _validateXPCReply:](self, "_validateXPCReply:", v21);
  return v22;
}

- (void)asyncProcessMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _xpc_connection_s *v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  -[CDDADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v14, 5, 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("kDAEAsyncProcessMeetingRequests"), CFSTR("kDAEMessageNameKey"), v14, CFSTR("kDAEAccountIdKey"), v15, CFSTR("kDAEFolderIDKey"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("kDAEMeetingRequestDatasKey"));
  if (v12)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("kDAEMeetingRequestIdsToClearKey"));
  if (v13)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("kDAEMeetingRequestIdsToSoftClearKey"));
  v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v18, v17);

}

- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5 forAccountID:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _xpc_connection_s *v18;
  xpc_object_t v19;
  BOOL v20;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E0C99E08];
  v14 = a6;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithObjectsAndKeys:", CFSTR("kDAESetFolderIdsThatExternalClientsCareAbout"), CFSTR("kDAEMessageNameKey"), v14, CFSTR("kDAEAccountIdKey"), 0);

  if (v10)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("kDAEMonitoredFolderIdsAddedKey"));
  if (v11)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("kDAEMonitoredFolderIdsDeletedKey"));
  if (v12)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("kDAEMonitoredFolderIdsTagKey"));
  DALoggingwithCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[CDDADConnection setFolderIdsThatExternalClientsCareAboutAdded:deleted:foldersTag:forAccountID:]";
    _os_log_impl(&dword_1C1D11000, v16, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v19 = xpc_connection_send_message_with_reply_sync(v18, v17);

  v20 = -[CDDADConnection _validateXPCReply:](self, "_validateXPCReply:", v19);
  return v20;
}

- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v19[0] = CFSTR("kDAEReportFolderItemsSyncResult");
    v18[0] = CFSTR("kDAEMessageNameKey");
    v18[1] = CFSTR("kDAEStatusKey");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    if (a3)
      v10 = 2;
    else
      v10 = 10;
    v11 = a6;
    v12 = a4;
    objc_msgSend(v9, "numberWithInteger:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v13;
    v19[2] = v12;
    v18[2] = CFSTR("kDAEFolderIDKey");
    v18[3] = CFSTR("kDAEFolderSyncItemsCountKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[4] = CFSTR("kDAEAccountIdKey");
    v19[3] = v14;
    v19[4] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](self, "_connection");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v17, v16);

  }
}

- (void)handleURL:(id)a3
{
  __CFString *v4;
  CFStringRef v5;
  void *v6;
  void *v7;
  _xpc_connection_s *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "absoluteString");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0, CFSTR("&="), 0x8000100u);
  v9[0] = CFSTR("kDAEMessageNameKey");
  v9[1] = CFSTR("kDAEURLStringKey");
  v10[0] = CFSTR("kDAEHandleURL");
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, v7);

  if (v5)
    CFRelease(v5);

}

- (void)_sendSynchronousXPCMessageWithParameters:(id)a3 handlerBlock:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  void *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  dispatch_semaphore_t v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  -[CDDADConnection _connection](self, "_connection");
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__CDDADConnection__sendSynchronousXPCMessageWithParameters_handlerBlock___block_invoke;
  v14[3] = &unk_1E7B9CAA8;
  v15 = v8;
  v16 = v6;
  v12 = v8;
  v13 = v6;
  xpc_connection_send_message_with_reply(v10, v9, v11, v14);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __73__CDDADConnection__sendSynchronousXPCMessageWithParameters_handlerBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (*(_QWORD *)(a1 + 40) && MEMORY[0x1C3BB5E44](v4) == MEMORY[0x1E0C812F8])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)beginDownloadingAttachmentWithUUID:(id)a3 accountID:(id)a4 queue:(id)a5 progressBlock:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  DADownloadContext *v18;
  void *v19;
  id v20;
  id v21;
  DADownloadContext *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  CDDADConnection *v28;
  DADownloadContext *v29;
  _BYTE *v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  DALoggingwithCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1C1D11000, v17, OS_LOG_TYPE_INFO, "Requesting download of attachment UUID %@ for accountID %@", buf, 0x16u);
  }

  v18 = -[DADownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]([DADownloadContext alloc], "initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:", v12, v13, v14, v15, v16);
  v35[0] = CFSTR("kDAEMessageNameKey");
  v35[1] = CFSTR("kDAEAttachmentUUIDKey");
  v36[0] = CFSTR("kDAEBeginDownloadingAttachment");
  v36[1] = v12;
  v35[2] = CFSTR("kDAEAccountIdKey");
  v36[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __100__CDDADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke;
  v25[3] = &unk_1E7B9CAF8;
  v30 = buf;
  v20 = v12;
  v26 = v20;
  v21 = v13;
  v27 = v21;
  v28 = self;
  v22 = v18;
  v29 = v22;
  -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v19, v25);
  v23 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v23;
}

void __100__CDDADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kDAEAttachmentDownloadIdKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  DALoggingwithCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_INFO, "Download context %@ set up for downloading attachment UUID %@ on accountID %@", buf, 0x20u);
  }

  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__CDDADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_122;
  block[3] = &unk_1E7B9CAD0;
  block[4] = v10;
  v13 = *(_OWORD *)(a1 + 56);
  v12 = (id)v13;
  v15 = v13;
  dispatch_sync(v11, block);

}

uint64_t __100__CDDADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_122(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_cancelDownloadsWithIDs:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *muckingWithInFlightCollections;
  id obj;
  _QWORD block[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v16 = 0;
        v17 = &v16;
        v18 = 0x3032000000;
        v19 = __Block_byref_object_copy_;
        v20 = __Block_byref_object_dispose_;
        v21 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __49__CDDADConnection__cancelDownloadsWithIDs_error___block_invoke;
        block[3] = &unk_1E7B9C9E8;
        block[5] = v12;
        block[6] = &v16;
        block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        objc_msgSend((id)v17[5], "finishedWithError:", v7);
        _Block_object_dispose(&v16, 8);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

}

uint64_t __49__CDDADConnection__cancelDownloadsWithIDs_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 72), "removeObjectForKey:", a1[5]);
}

- (void)cancelDownloadingAttachmentWithDownloadID:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17[0] = CFSTR("kDAECancelDownloadingAttachment");
  v16[0] = CFSTR("kDAEMessageNameKey");
  v16[1] = CFSTR("kDAEErrorDataKey");
  v7 = (void *)MEMORY[0x1E0CB36F8];
  v8 = a4;
  objc_msgSend(v7, "archivedDataWithRootObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = CFSTR("kDAEAttachmentDownloadIdKey");
  v17[1] = v9;
  v17[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1C1D11000, v11, OS_LOG_TYPE_INFO, "Cancelling Download of attachment with downloadID %@", buf, 0xCu);
  }

  -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v10, 0);
  v13 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDDADConnection _cancelDownloadsWithIDs:error:](self, "_cancelDownloadsWithIDs:error:", v12, v8);

}

- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  DASharedCalendarContext *v17;
  void *v18;
  void *v19;
  DASharedCalendarContext *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CDDADConnection *v26;
  DASharedCalendarContext *v27;
  _QWORD v28[4];
  _QWORD v29[4];
  uint8_t buf[4];
  int64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  DALoggingwithCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v31 = a3;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_1C1D11000, v16, OS_LOG_TYPE_DEBUG, "Requesting share response %ld for calendar %@ for accountID %@", buf, 0x20u);
  }

  v17 = -[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]([DASharedCalendarContext alloc], "initWithCalendarID:accountID:queue:completionBlock:", v12, v13, v15, v14);
  -[DASharedCalendarContext setShouldSyncCalendar:](v17, "setShouldSyncCalendar:", a3 == 1);
  v28[0] = CFSTR("kDAEMessageNameKey");
  v28[1] = CFSTR("kDAEAccountIdKey");
  v29[0] = CFSTR("kDAERespondToSharedCalendar");
  v29[1] = v13;
  v28[2] = CFSTR("kDAESharedCalendarReponseTypeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = CFSTR("kDAESharedCalendarResponseCalendarIDKey");
  v29[2] = v18;
  v29[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__CDDADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke;
  v23[3] = &unk_1E7B9CB20;
  v24 = v12;
  v25 = v13;
  v26 = self;
  v27 = v17;
  v20 = v17;
  v21 = v13;
  v22 = v12;
  -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v19, v23);

}

void __99__CDDADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kDAESharedCalendarActionIdKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = a1[4];
    v6 = a1[5];
    *(_DWORD *)buf = 138412802;
    v15 = v3;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1C1D11000, v4, OS_LOG_TYPE_DEBUG, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
  }

  v7 = a1[6];
  v8 = (void *)a1[7];
  v9 = *(NSObject **)(v7 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__CDDADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_126;
  block[3] = &unk_1E7B9CA58;
  block[4] = v7;
  v12 = v3;
  v13 = v8;
  v10 = v3;
  dispatch_sync(v9, block);

}

uint64_t __99__CDDADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_126(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 96), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  DASharedCalendarContext *v15;
  void *v16;
  DASharedCalendarContext *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  CDDADConnection *v23;
  DASharedCalendarContext *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  DALoggingwithCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1C1D11000, v14, OS_LOG_TYPE_DEBUG, "Reporting calendar %@ for accountID %@ as junk", buf, 0x16u);
  }

  v15 = -[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]([DASharedCalendarContext alloc], "initWithCalendarID:accountID:queue:completionBlock:", v10, v11, v13, v12);
  -[DASharedCalendarContext setShouldSyncCalendar:](v15, "setShouldSyncCalendar:", 0);
  v25[0] = CFSTR("kDAEMessageNameKey");
  v25[1] = CFSTR("kDAEAccountIdKey");
  v26[0] = CFSTR("kDAEReportSharedCalendarAsJunk");
  v26[1] = v11;
  v25[2] = CFSTR("kDAESharedCalendarResponseCalendarIDKey");
  v26[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__CDDADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke;
  v20[3] = &unk_1E7B9CB20;
  v21 = v10;
  v22 = v11;
  v23 = self;
  v24 = v15;
  v17 = v15;
  v18 = v11;
  v19 = v10;
  -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v16, v20);

}

void __101__CDDADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kDAESharedCalendarActionIdKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = a1[4];
    v6 = a1[5];
    *(_DWORD *)buf = 138412802;
    v15 = v3;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1C1D11000, v4, OS_LOG_TYPE_DEBUG, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
  }

  v7 = a1[6];
  v8 = (void *)a1[7];
  v9 = *(NSObject **)(v7 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__CDDADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_127;
  block[3] = &unk_1E7B9CA58;
  block[4] = v7;
  v12 = v3;
  v13 = v8;
  v10 = v3;
  dispatch_sync(v9, block);

}

uint64_t __101__CDDADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_127(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 96), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (BOOL)processFolderChange:(id)a3 forAccountWithID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _xpc_connection_s *v13;
  xpc_object_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *muckingWithInFlightCollections;
  _QWORD block[4];
  id v21;
  CDDADConnection *v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB36F8];
  v8 = a4;
  objc_msgSend(v7, "archivedDataWithRootObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("kDAEProcessFolderChange"), CFSTR("kDAEMessageNameKey"), v8, CFSTR("kDAEAccountIdKey"), v9, CFSTR("kDAEFolderChangeDataKey"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CDDADConnection processFolderChange:forAccountWithID:]";
    _os_log_impl(&dword_1C1D11000, v11, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[CDDADConnection _connection](self, "_connection");
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v14 = xpc_connection_send_message_with_reply_sync(v13, v12);

  if (MEMORY[0x1C3BB5E44](v14) == MEMORY[0x1E0C812F8])
  {
    v15 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kDAETaskIDKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__CDDADConnection_processFolderChange_forAccountWithID___block_invoke;
    block[3] = &unk_1E7B9CB48;
    v22 = self;
    v23 = v17;
    v21 = v6;
    dispatch_sync(muckingWithInFlightCollections, block);

  }
  return 1;
}

void __56__CDDADConnection_processFolderChange_forAccountWithID___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    v4 = a1[6];
    v8 = 138412546;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1C1D11000, v2, OS_LOG_TYPE_DEBUG, "Setting folder change %@ for key %lu", (uint8_t *)&v8, 0x16u);
  }

  v5 = a1[4];
  v6 = *(void **)(a1[5] + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

- (id)statusReports
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD handler[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v21 = CFSTR("kDAEMessageNameKey");
  v22[0] = CFSTR("kDAEGetStatusReports");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v5 = dispatch_semaphore_create(0);
  -[CDDADConnection _connection](self, "_connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __32__CDDADConnection_statusReports__block_invoke;
  handler[3] = &unk_1E7B9CA30;
  v14 = &v15;
  v8 = v5;
  v13 = v8;
  xpc_connection_send_message_with_reply(v6, v4, v7, handler);

  v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __32__CDDADConnection_statusReports__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1C3BB5E44]() == MEMORY[0x1E0C812F8])
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEStatusReportsKey"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || objc_msgSend(v8, "intValue") != 2)
    {
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315394;
        v12 = "-[CDDADConnection statusReports]_block_invoke";
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)reallyRegisterForInterrogation
{
  NSObject *v3;
  void *v4;
  void *v5;
  _xpc_connection_s *v6;
  uint8_t v7[8];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_statusReportBlock && !-[CDDADConnection registered](self, "registered"))
  {
    -[CDDADConnection setRegistered:](self, "setRegistered:", 1);
    DALoggingwithCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C1D11000, v3, OS_LOG_TYPE_INFO, "Sending message: kDAERegisterForInterrogation", v7, 2u);
    }

    v8 = CFSTR("kDAEMessageNameKey");
    v9[0] = CFSTR("kDAERegisterForInterrogation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](self, "_connection");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v6, v5);

  }
}

- (BOOL)registerForInterrogationWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id statusReportBlock;

  v4 = a3;
  v5 = v4;
  if (self->_statusReportBlock != v4)
  {
    if (v4)
      v6 = (void *)objc_msgSend(v4, "copy");
    else
      v6 = 0;
    v7 = _Block_copy(v6);
    statusReportBlock = self->_statusReportBlock;
    self->_statusReportBlock = v7;

  }
  return 1;
}

- (void)fillOutCurrentEASTimeZoneInfo
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  dispatch_semaphore_t v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("kDAEMessageNameKey");
  v12[0] = CFSTR("kDAEFillOutEASTimeZoneInfo");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v5 = dispatch_semaphore_create(0);
  -[CDDADConnection _connection](self, "_connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__CDDADConnection_fillOutCurrentEASTimeZoneInfo__block_invoke;
  v9[3] = &unk_1E7B9CB70;
  v10 = v5;
  v8 = v5;
  xpc_connection_send_message_with_reply(v6, v4, v7, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__CDDADConnection_fillOutCurrentEASTimeZoneInfo__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)activeSyncDeviceIdentifier
{
  void *v3;
  int v4;
  void *v5;
  dispatch_semaphore_t v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t v13[8];
  _QWORD handler[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v23 = CFSTR("kDAEMessageNameKey");
  v24[0] = CFSTR("kDAEGetActiveSyncDeviceIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 3;
  while (1)
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v6 = dispatch_semaphore_create(0);
    -[CDDADConnection _connection](self, "_connection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __45__CDDADConnection_activeSyncDeviceIdentifier__block_invoke;
    handler[3] = &unk_1E7B9CA30;
    v16 = &v17;
    v9 = v6;
    v15 = v9;
    xpc_connection_send_message_with_reply(v7, v5, v8, handler);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (v18[5])
      break;
    DALoggingwithCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_ERROR, "Error getting activesync device identifier, will try again", v13, 2u);
    }

    if (!--v4)
      goto LABEL_8;
  }

LABEL_8:
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __45__CDDADConnection_activeSyncDeviceIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (MEMORY[0x1C3BB5E44]() == MEMORY[0x1E0C812F8])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEActiveSyncDeviceIdentifierKey"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_performOofSettingsRequest:(id)a3 forAccountWithID:(id)a4 forUpdate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  dispatch_semaphore_t v16;
  _xpc_connection_s *v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  _QWORD handler[4];
  id v23;
  CDDADConnection *v24;
  NSObject *v25;
  uint64_t *v26;
  BOOL v27;
  uint8_t buf[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v5 = a5;
  v34[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v33[0] = CFSTR("kDAEMessageNameKey");
    v33[1] = CFSTR("kDAEAccountIdKey");
    v34[0] = CFSTR("kDAEOofSettings");
    v34[1] = v9;
    v33[2] = CFSTR("kDAEOofIsUpdateKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithDictionary:", v12);

    if (v5)
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, CFSTR("kDAEOofSettingsRequestKey"));

    }
    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v16 = dispatch_semaphore_create(0);
    -[CDDADConnection _connection](self, "_connection");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __73__CDDADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke;
    handler[3] = &unk_1E7B9CBC0;
    v23 = v8;
    v24 = self;
    v27 = v5;
    v26 = &v29;
    v19 = v16;
    v25 = v19;
    xpc_connection_send_message_with_reply(v17, v15, v18, handler);

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    v20 = *((_BYTE *)v30 + 24) != 0;

  }
  else
  {
    DALoggingwithCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1D11000, v13, OS_LOG_TYPE_ERROR, "nil accountID passed to performASSettingsRequest. Cannot continue.", buf, 2u);
    }
    v20 = 0;
  }

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __73__CDDADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v8 = a2;
  if (MEMORY[0x1C3BB5E44]() == MEMORY[0x1E0C812F8])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEOofRequestIDKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRequestID:", v4);
    v5 = *(void **)(a1 + 32);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__CDDADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke_2;
    block[3] = &unk_1E7B9CB98;
    v13 = *(_BYTE *)(a1 + 64);
    v10 = v5;
    v11 = v4;
    v12 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    dispatch_sync(v6, block);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t __73__CDDADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(a1 + 56))
      v3 = CFSTR("update");
    else
      v3 = CFSTR("retrieve");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C1D11000, v2, OS_LOG_TYPE_DEBUG, "Adding to inflight dictionary: oof %@ request %@ for key %@", (uint8_t *)&v7, 0x20u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)retrieveOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  return -[CDDADConnection _performOofSettingsRequest:forAccountWithID:forUpdate:](self, "_performOofSettingsRequest:forAccountWithID:forUpdate:", a3, a4, 0);
}

- (BOOL)updateOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  return -[CDDADConnection _performOofSettingsRequest:forAccountWithID:forUpdate:](self, "_performOofSettingsRequest:forAccountWithID:forUpdate:", a3, a4, 1);
}

- (void)isOofSettingsSupportedForAccountWithID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[8];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v15[0] = CFSTR("kDAEMessageNameKey");
    v15[1] = CFSTR("kDAEAccountIdKey");
    v16[0] = CFSTR("kDAEIsOofSettingsSupported");
    v16[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](self, "_connection");
    v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __74__CDDADConnection_isOofSettingsSupportedForAccountWithID_completionBlock___block_invoke;
    handler[3] = &unk_1E7B9CBE8;
    v13 = v7;
    xpc_connection_send_message_with_reply(v10, v9, v11, handler);

  }
  else
  {
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1D11000, v8, OS_LOG_TYPE_ERROR, "nil accountID passed to isOofSettingsSupportedForAccountWithID. Cannot continue.", buf, 2u);
    }
  }

}

void __74__CDDADConnection_isOofSettingsSupportedForAccountWithID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  if (MEMORY[0x1C3BB5E44]() == MEMORY[0x1E0C812F8])
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEIsOofSupportedKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "BOOLValue");
    }
    else
    {
      DALoggingwithCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1C1D11000, v7, OS_LOG_TYPE_ERROR, "Error getting activesync device identifier", v8, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (id)requestCalendarAvailabilityWithAccountID:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8 completionBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  id *v32;
  id v33;
  id *v34;
  id v35;
  NSObject *v37;
  id v38;
  NSObject *v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  NSObject *v43;
  CDDADConnection *v44;
  id v45;
  _QWORD v46[2];
  _QWORD block[4];
  id v48;
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  v55 = 0;
  v41 = v15;
  if (!v15)
  {
    DALoggingwithCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = 0;
      v23 = "Invalid 'accountID' provided: [%@].";
      v24 = v22;
      v25 = 12;
      goto LABEL_9;
    }
LABEL_10:

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 86, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v16 || !v17 || objc_msgSend(v16, "compare:", v17) == 1)
  {
    DALoggingwithCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v16;
      v58 = 2112;
      v59 = v17;
      v23 = "Invalid 'startDate' [%@] and/or 'endDate' [%@] provided.";
      v24 = v22;
      v25 = 22;
LABEL_9:
      _os_log_impl(&dword_1C1D11000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v19 && objc_msgSend(v19, "count"))
  {
    DALoggingwithCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      v57 = v41;
      v58 = 2112;
      v59 = v16;
      v60 = 2112;
      v61 = v17;
      v62 = 2112;
      v63 = v18;
      v64 = 2112;
      v65 = v19;
      _os_log_impl(&dword_1C1D11000, v37, OS_LOG_TYPE_DEBUG, "Preparing calendar availability request.  accountID: [%@] startDate: [%@] endDate: [%@] ignoredEventID: [%@] addresses: [%@]", buf, 0x34u);
    }

    v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v38, "setObject:forKey:", CFSTR("kDAERequestCalendarAvailability"), CFSTR("kDAEMessageNameKey"));
    objc_msgSend(v38, "setObject:forKey:", v41, CFSTR("kDAEAccountIdKey"));
    objc_msgSend(v38, "setObject:forKey:", v16, CFSTR("kDAEStartDateKey"));
    objc_msgSend(v38, "setObject:forKey:", v17, CFSTR("kDAEEndDateKey"));
    objc_msgSend(v38, "setObject:forKey:", v19, CFSTR("kDAEAddressesKey"));
    if (v18)
      objc_msgSend(v38, "setObject:forKey:", v18, CFSTR("kDAEIgnoredEventIDKey"));
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_132;
    v42[3] = &unk_1E7B9CC38;
    v46[1] = &v50;
    v45 = v20;
    v46[0] = v21;
    v31 = v38;
    v43 = v31;
    v44 = self;
    -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v31, v42);

    v33 = v21;
    v40 = v16;
    v28 = v19;
    v29 = v20;
    v30 = v18;
    v26 = 0;
    v32 = &v45;
    v34 = (id *)v46;
    goto LABEL_15;
  }
  DALoggingwithCategory(0);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1D11000, v39, OS_LOG_TYPE_DEBUG, "No 'addresses' provided.", buf, 2u);
  }

  v26 = 0;
LABEL_11:
  DALoggingwithCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1D11000, v27, OS_LOG_TYPE_DEFAULT, "Will not issue calendar availability request.", buf, 2u);
  }

  if (v21)
  {
    v40 = v16;
    v28 = v19;
    v29 = v20;
    v30 = v18;
    dispatch_get_global_queue(0, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E7B9CC10;
    v32 = &v49;
    v33 = v21;
    v49 = v21;
    v34 = &v48;
    v26 = v26;
    v48 = v26;
    dispatch_async(v31, block);
LABEL_15:

    v18 = v30;
    v20 = v29;
    v19 = v28;
    v16 = v40;
    v21 = v33;

  }
  v35 = (id)v51[5];

  _Block_object_dispose(&v50, 8);
  return v35;
}

uint64_t __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_132(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  DAECalendarAvailabilityContext *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  DAECalendarAvailabilityContext *v13;
  _QWORD block[5];
  DAECalendarAvailabilityContext *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  DAECalendarAvailabilityContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kDAECalendarAvailabilityRequestIDKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = -[DAECalendarAvailabilityContext initWithResultsBlock:completionBlock:]([DAECalendarAvailabilityContext alloc], "initWithResultsBlock:completionBlock:", a1[6], a1[7]);
  DALoggingwithCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    v9 = a1[4];
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1C1D11000, v7, OS_LOG_TYPE_DEBUG, "Received request ID [%@] for request with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
  }

  v10 = a1[5];
  v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_134;
  block[3] = &unk_1E7B9CAD0;
  v12 = a1[8];
  v15 = v6;
  v16 = v12;
  block[4] = v10;
  v13 = v6;
  dispatch_sync(v11, block);

}

uint64_t __132__CDDADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_134(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *muckingWithInFlightCollections;
  void *v8;
  _QWORD block[5];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v18[0] = CFSTR("kDAEMessageNameKey");
    v18[1] = CFSTR("kDAECalendarAvailabilityRequestIDKey");
    v19[0] = CFSTR("kDAECancelCalendarAvailabilityRequest");
    v19[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v6, 0);
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__CDDADConnection_cancelCalendarAvailabilityRequestWithID___block_invoke;
    block[3] = &unk_1E7B9C9E8;
    v11 = buf;
    block[4] = self;
    v10 = v5;
    dispatch_sync(muckingWithInFlightCollections, block);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v13 + 5), "finishedWithError:", v8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_DEBUG, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }

}

uint64_t __59__CDDADConnection_cancelCalendarAvailabilityRequestWithID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 80), "removeObjectForKey:", a1[5]);
}

- (void)_calendarAvailabilityRequestReturnedResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *muckingWithInFlightCollections;
  id v18;
  _QWORD block[5];
  id v20;
  __int128 *p_buf;
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarAvailabilityRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarAvailabilityResultsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v13, v7, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  if (!v14)
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1C1D11000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CDDADConnection__calendarAvailabilityRequestReturnedResults___block_invoke;
  block[3] = &unk_1E7B9C9E8;
  p_buf = &buf;
  block[4] = self;
  v18 = v6;
  v20 = v18;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "resultsReturned:", v14);

  _Block_object_dispose(&buf, 8);
}

void __63__CDDADConnection__calendarAvailabilityRequestReturnedResults___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_calendarAvailabilityRequestFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarAvailabilityRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDDADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CDDADConnection__calendarAvailabilityRequestFinished___block_invoke;
  block[3] = &unk_1E7B9C9E8;
  v13 = &v14;
  block[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v15[5], "finishedWithError:", v8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __56__CDDADConnection__calendarAvailabilityRequestFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 80), "removeObjectForKey:", a1[5]);
}

- (id)performCalendarDirectorySearchWithAccountID:(id)a3 terms:(id)a4 recordTypes:(id)a5 resultLimit:(unint64_t)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id *v26;
  id *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  _QWORD v34[4];
  NSObject *v35;
  CDDADConnection *v36;
  id v37;
  _QWORD v38[2];
  _QWORD block[4];
  id v40;
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  v47 = 0;
  if (v14)
  {
    if (v15 && objc_msgSend(v15, "count"))
    {
      if (v16 && objc_msgSend(v16, "count"))
      {
        DALoggingwithCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v49 = v14;
          v50 = 2112;
          v51 = v16;
          v52 = 2048;
          v53 = a6;
          v54 = 2112;
          v55 = v15;
          _os_log_impl(&dword_1C1D11000, v19, OS_LOG_TYPE_DEBUG, "Preparing calendar directory search.  accountID: [%@] recordTypes:[%@] resultLimit: [%lu] terms: [%@]", buf, 0x2Au);
        }

        v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v20, "setObject:forKey:", CFSTR("kDAEPerformCalendarDirectorySearch"), CFSTR("kDAEMessageNameKey"));
        objc_msgSend(v20, "setObject:forKey:", v14, CFSTR("kDAEAccountIdKey"));
        objc_msgSend(v15, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("kDAECalendarDirectorySearchTermsKey"));

        objc_msgSend(v16, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("kDAECalendarDirectorySearchRecordTypesKey"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("kDAECalendarDirectorySearchResultLimitKey"));

        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_136;
        v34[3] = &unk_1E7B9CC38;
        v38[1] = &v42;
        v37 = v17;
        v38[0] = v18;
        v24 = v20;
        v35 = v24;
        v36 = self;
        -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v24, v34);

        v25 = 0;
        v26 = &v37;
        v27 = (id *)v38;
        goto LABEL_22;
      }
      DALoggingwithCategory(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v29 = "No 'recordTypes' provided.";
    }
    else
    {
      DALoggingwithCategory(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
LABEL_17:

        v25 = 0;
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v29 = "No 'terms' provided.";
    }
    _os_log_impl(&dword_1C1D11000, v28, OS_LOG_TYPE_DEBUG, v29, buf, 2u);
    goto LABEL_17;
  }
  DALoggingwithCategory(0);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = 0;
    _os_log_impl(&dword_1C1D11000, v30, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%@].", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 86, 0);
  v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  DALoggingwithCategory(0);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1D11000, v31, OS_LOG_TYPE_DEFAULT, "Will not issue calendar directory search.", buf, 2u);
  }

  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E7B9CC10;
    v26 = &v41;
    v41 = v18;
    v27 = &v40;
    v25 = v25;
    v40 = v25;
    dispatch_async(v24, block);
LABEL_22:

  }
  v32 = (id)v43[5];

  _Block_object_dispose(&v42, 8);
  return v32;
}

uint64_t __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_136(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  DAECalendarDirectorySearchContext *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  DAECalendarDirectorySearchContext *v13;
  _QWORD block[5];
  DAECalendarDirectorySearchContext *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  DAECalendarDirectorySearchContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchIDKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = -[DAECalendarDirectorySearchContext initWithResultsBlock:completionBlock:]([DAECalendarDirectorySearchContext alloc], "initWithResultsBlock:completionBlock:", a1[6], a1[7]);
  DALoggingwithCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    v9 = a1[4];
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1C1D11000, v7, OS_LOG_TYPE_DEBUG, "Received search ID [%@] for search with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
  }

  v10 = a1[5];
  v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_138;
  block[3] = &unk_1E7B9CAD0;
  v12 = a1[8];
  v15 = v6;
  v16 = v12;
  block[4] = v10;
  v13 = v6;
  dispatch_sync(v11, block);

}

uint64_t __122__CDDADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_138(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 88), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *muckingWithInFlightCollections;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint8_t *v13;
  uint8_t v14[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v22[0] = CFSTR("kDAEMessageNameKey");
    v22[1] = CFSTR("kDAECalendarDirectorySearchIDKey");
    v23[0] = CFSTR("kDAECancelCalendarDirectorySearch");
    v23[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v6, 0);
    *(_QWORD *)v14 = 0;
    v15 = v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__CDDADConnection_cancelCalendarDirectorySearchWithID___block_invoke;
    block[3] = &unk_1E7B9C9E8;
    v13 = v14;
    block[4] = self;
    v8 = v5;
    v12 = v8;
    dispatch_sync(muckingWithInFlightCollections, block);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v15 + 5), "finishedWithError:exceededResultLimit:", v9, 0);
    DALoggingwithCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_DEBUG, "Cancelled calendar directory search with ID: [%@].", buf, 0xCu);
    }

    _Block_object_dispose(v14, 8);
  }
  else
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_DEBUG, "nil 'searchID' provided.  Will not cancel any calendar directory searches.", v14, 2u);
    }
  }

}

uint64_t __55__CDDADConnection_cancelCalendarDirectorySearchWithID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 88), "removeObjectForKey:", a1[5]);
}

- (void)_calendarDirectorySearchReturnedResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *muckingWithInFlightCollections;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[5];
  id v25;
  __int128 *p_buf;
  id v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchResultsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v13, v7, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;

  if (!v14)
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1C1D11000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CDDADConnection__calendarDirectorySearchReturnedResults___block_invoke;
  block[3] = &unk_1E7B9C9E8;
  p_buf = &buf;
  block[4] = self;
  v19 = v6;
  v25 = v19;
  dispatch_sync(muckingWithInFlightCollections, block);
  v20 = objc_msgSend(v14, "count");
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __59__CDDADConnection__calendarDirectorySearchReturnedResults___block_invoke_2;
  v22[3] = &unk_1E7B9CC60;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v20);
  v23 = v21;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v22);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "resultsReturned:", v21);

  _Block_object_dispose(&buf, 8);
}

void __59__CDDADConnection__calendarDirectorySearchReturnedResults___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __59__CDDADConnection__calendarDirectorySearchReturnedResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v7);
}

- (void)_calendarDirectorySearchFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *muckingWithInFlightCollections;
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDDADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchExceededResultLimitKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "BOOLValue");
  else
    v11 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CDDADConnection__calendarDirectorySearchFinished___block_invoke;
  block[3] = &unk_1E7B9C9E8;
  v16 = &v17;
  block[4] = self;
  v13 = v6;
  v15 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v18[5], "finishedWithError:exceededResultLimit:", v8, v11);

  _Block_object_dispose(&v17, 8);
}

uint64_t __52__CDDADConnection__calendarDirectorySearchFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 88), "removeObjectForKey:", a1[5]);
}

- (void)externalIdentificationForAccountID:(id)a3 resultsBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[8];
  uint8_t buf[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = -1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  if (v7)
  {
    if (v6)
    {
      v36[0] = CFSTR("kDAEMessageNameKey");
      v36[1] = CFSTR("kDAEAccountIdKey");
      v37[0] = CFSTR("kDAERequestCalendarExternalIdentification");
      v37[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __67__CDDADConnection_externalIdentificationForAccountID_resultsBlock___block_invoke;
      v12[3] = &unk_1E7B9CC88;
      v12[4] = &v30;
      v12[5] = &v24;
      v12[6] = &v20;
      v12[7] = &v14;
      -[CDDADConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v8, v12);
    }
    else
    {
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_DEFAULT, "No accountID provided.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 86, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v31[5];
      v31[5] = v11;
    }

    v7[2](v7, v31[5], v25[5], v21[3], v15[5]);
  }
  else
  {
    DALoggingwithCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1D11000, v9, OS_LOG_TYPE_DEFAULT, "No results block provided.", buf, 2u);
    }

  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __67__CDDADConnection_externalIdentificationForAccountID_resultsBlock___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kDAEAccountServerHostKey"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kDAEAccountServerPortKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v6, "integerValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kDAEAccountOwnerAddressesKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = a1[7];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 28, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
  }
  v9 = *(_QWORD *)(v8 + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

}

- (CDDADConnection)init
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Should never call -init on DADConnection.  Use +sharedConnection... instead."), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

  return 0;
}

- (id)_init
{
  CDDADConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *muckingWithConn;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *muckingWithInFlightCollections;
  uint64_t v9;
  NSMutableSet *accountIdsWithAlreadyResetCerts;
  uint64_t v11;
  NSMutableSet *accountIdsWithAlreadyResetThrottleTimers;
  uint64_t v13;
  NSMutableDictionary *inFlightSearchQueries;
  uint64_t v15;
  NSMutableDictionary *inFlightFolderChanges;
  uint64_t v17;
  NSMutableDictionary *inFlightAttachmentDownloads;
  uint64_t v19;
  NSMutableDictionary *inFlightCalendarAvailabilityRequests;
  uint64_t v21;
  NSMutableDictionary *inFlightCalendarDirectorySearches;
  uint64_t v23;
  NSMutableDictionary *inFlightShareRequests;
  uint64_t v25;
  NSMutableDictionary *inFlightOofSettingsRequests;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CDDADConnection;
  v2 = -[CDDADConnection init](&v28, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.dataaccess.muckingWithConn", v3);
    muckingWithConn = v2->_muckingWithConn;
    v2->_muckingWithConn = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.dataaccess.muckingWithInFlightCollections", v6);
    muckingWithInFlightCollections = v2->_muckingWithInFlightCollections;
    v2->_muckingWithInFlightCollections = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new();
    accountIdsWithAlreadyResetCerts = v2->_accountIdsWithAlreadyResetCerts;
    v2->_accountIdsWithAlreadyResetCerts = (NSMutableSet *)v9;

    v11 = objc_opt_new();
    accountIdsWithAlreadyResetThrottleTimers = v2->_accountIdsWithAlreadyResetThrottleTimers;
    v2->_accountIdsWithAlreadyResetThrottleTimers = (NSMutableSet *)v11;

    v13 = objc_opt_new();
    inFlightSearchQueries = v2->_inFlightSearchQueries;
    v2->_inFlightSearchQueries = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    inFlightFolderChanges = v2->_inFlightFolderChanges;
    v2->_inFlightFolderChanges = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    inFlightAttachmentDownloads = v2->_inFlightAttachmentDownloads;
    v2->_inFlightAttachmentDownloads = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    inFlightCalendarAvailabilityRequests = v2->_inFlightCalendarAvailabilityRequests;
    v2->_inFlightCalendarAvailabilityRequests = (NSMutableDictionary *)v19;

    v21 = objc_opt_new();
    inFlightCalendarDirectorySearches = v2->_inFlightCalendarDirectorySearches;
    v2->_inFlightCalendarDirectorySearches = (NSMutableDictionary *)v21;

    v23 = objc_opt_new();
    inFlightShareRequests = v2->_inFlightShareRequests;
    v2->_inFlightShareRequests = (NSMutableDictionary *)v23;

    v25 = objc_opt_new();
    inFlightOofSettingsRequests = v2->_inFlightOofSettingsRequests;
    v2->_inFlightOofSettingsRequests = (NSMutableDictionary *)v25;

    -[CDDADConnection _registerForAppResumedNotification](v2, "_registerForAppResumedNotification");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CDDADConnection _tearDownInFlightObjects](self, "_tearDownInFlightObjects");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CDDADConnection;
  -[CDDADConnection dealloc](&v4, sel_dealloc);
}

- (void)_resetCertWarningsForAccountId:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  NSMutableSet *accountIdsWithAlreadyResetCerts;
  CDDADConnection *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  _xpc_connection_s *v16;
  id *v17;
  uint64_t v18;
  _QWORD v19[3];
  uint8_t buf[4];
  NSMutableSet *v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  DALoggingwithCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    accountIdsWithAlreadyResetCerts = self->_accountIdsWithAlreadyResetCerts;
    *(_DWORD *)buf = 138412290;
    v21 = accountIdsWithAlreadyResetCerts;
    _os_log_impl(&dword_1C1D11000, v9, OS_LOG_TYPE_DEBUG, "in _resetCertWarningsForAccount, _accountIdsWithAlreadyResetCerts is %@", buf, 0xCu);
  }

  v11 = self;
  objc_sync_enter(v11);
  if (v8)
    v12 = -[NSMutableSet containsObject:](v11->_accountIdsWithAlreadyResetCerts, "containsObject:", v8) ^ 1;
  else
    v12 = 0;
  objc_sync_exit(v11);

  if (((v8 != 0) & (v12 | v5)) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEDataclassesBitmaskKey"), CFSTR("kDAEResetCertWarnings"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](v11, "_connection");
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v16, v15);

    v17 = v11;
    objc_sync_enter(v17);
    objc_msgSend(v17[4], "addObject:", v8);
    objc_sync_exit(v17);

  }
}

- (void)_resetThrottleTimersForAccountId:(id)a3
{
  id v5;
  NSObject *v6;
  const char *Name;
  NSMutableSet *accountIdsWithAlreadyResetThrottleTimers;
  CDDADConnection *v9;
  char v10;
  void *v11;
  void *v12;
  _xpc_connection_s *v13;
  CDDADConnection *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSMutableSet *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DALoggingwithCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    Name = sel_getName(a2);
    accountIdsWithAlreadyResetThrottleTimers = self->_accountIdsWithAlreadyResetThrottleTimers;
    *(_DWORD *)buf = 136315394;
    v18 = Name;
    v19 = 2112;
    v20 = accountIdsWithAlreadyResetThrottleTimers;
    _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_DEBUG, "in %s, _accountIdsWithAlreadyResetThrottleTimers is %@", buf, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  if (!v5)
  {
    objc_sync_exit(v9);
    v11 = v9;
    goto LABEL_7;
  }
  v10 = -[NSMutableSet containsObject:](v9->_accountIdsWithAlreadyResetThrottleTimers, "containsObject:", v5);
  objc_sync_exit(v9);

  if ((v10 & 1) == 0)
  {
    v15[0] = CFSTR("kDAEMessageNameKey");
    v15[1] = CFSTR("kDAEAccountIdKey");
    v16[0] = CFSTR("kDAEResetThrottleTimers");
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[CDDADConnection _connection](v9, "_connection");
    v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v13, v12);

    v14 = v9;
    objc_sync_enter(v14);
    -[NSMutableSet addObject:](v9->_accountIdsWithAlreadyResetThrottleTimers, "addObject:", v5);
    objc_sync_exit(v14);

LABEL_7:
  }

}

- (void)resetTimersAndWarnings
{
  NSObject *v3;
  CDDADConnection *v4;
  uint8_t v5[16];

  DALoggingwithCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C1D11000, v3, OS_LOG_TYPE_DEBUG, "Resetting shouldResetCertWarnings and throttle timers", v5, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeAllObjects](v4->_accountIdsWithAlreadyResetCerts, "removeAllObjects");
  -[NSMutableSet removeAllObjects](v4->_accountIdsWithAlreadyResetThrottleTimers, "removeAllObjects");
  objc_sync_exit(v4);

}

- (void)_registerForAppResumedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_resetTimersAndWarnings, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

}

- (void)_dispatchMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEMessageNameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEFoldersUpdated")))
  {
    -[CDDADConnection _foldersUpdated:](self, "_foldersUpdated:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEPolicyKeyChanged")))
  {
    -[CDDADConnection _policyKeyChanged:](self, "_policyKeyChanged:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAELogDataAccessStatus")))
  {
    -[CDDADConnection _logDataAccessStatus:](self, "_logDataAccessStatus:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEServerContactsSearchQueryFinished")))
  {
    -[CDDADConnection _serverContactsSearchQueryFinished:](self, "_serverContactsSearchQueryFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEFolderChangeFinished")))
  {
    -[CDDADConnection _folderChangeFinished:](self, "_folderChangeFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEGetStatusReportsFromClient")))
  {
    -[CDDADConnection _getStatusReportsFromClient:](self, "_getStatusReportsFromClient:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEAttachmentDownloadProgress")))
  {
    -[CDDADConnection _downloadProgress:](self, "_downloadProgress:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEAttachmentDownloadFinished")))
  {
    -[CDDADConnection _downloadFinished:](self, "_downloadFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarShareResponseFinished")))
  {
    -[CDDADConnection _shareResponseFinished:](self, "_shareResponseFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEOofSettingsFinished")))
  {
    -[CDDADConnection _oofSettingsRequestsFinished:](self, "_oofSettingsRequestsFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarAvailabilityRequestReturnedResults")))
  {
    -[CDDADConnection _calendarAvailabilityRequestReturnedResults:](self, "_calendarAvailabilityRequestReturnedResults:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarAvailabilityRequestFinished")))
  {
    -[CDDADConnection _calendarAvailabilityRequestFinished:](self, "_calendarAvailabilityRequestFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarDirectorySearchReturnedResults")))
  {
    -[CDDADConnection _calendarDirectorySearchReturnedResults:](self, "_calendarDirectorySearchReturnedResults:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarDirectorySearchFinished")))
  {
    -[CDDADConnection _calendarDirectorySearchFinished:](self, "_calendarDirectorySearchFinished:", v4);
  }
  else
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1C1D11000, v7, OS_LOG_TYPE_ERROR, "unknown request sent to connection.", (uint8_t *)&v9, 2u);
    }

    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1C1D11000, v8, OS_LOG_TYPE_ERROR, "request: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightOofSettingsRequests, 0);
  objc_storeStrong((id *)&self->_inFlightShareRequests, 0);
  objc_storeStrong((id *)&self->_inFlightCalendarDirectorySearches, 0);
  objc_storeStrong((id *)&self->_inFlightCalendarAvailabilityRequests, 0);
  objc_storeStrong((id *)&self->_inFlightAttachmentDownloads, 0);
  objc_storeStrong((id *)&self->_inFlightFolderChanges, 0);
  objc_storeStrong((id *)&self->_inFlightSearchQueries, 0);
  objc_storeStrong(&self->_statusReportBlock, 0);
  objc_storeStrong((id *)&self->_accountIdsWithAlreadyResetThrottleTimers, 0);
  objc_storeStrong((id *)&self->_accountIdsWithAlreadyResetCerts, 0);
  objc_storeStrong((id *)&self->_muckingWithInFlightCollections, 0);
  objc_storeStrong((id *)&self->_muckingWithConn, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end
