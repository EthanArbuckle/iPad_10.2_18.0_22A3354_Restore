@implementation ESDConnection

- (void)_tearDownInFlightObjects
{
  NSObject *muckingWithInFlightCollections;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[6];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[6];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[6];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[6];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[6];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[6];
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  _QWORD block[6];
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v118 = 0;
  v119 = &v118;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy_;
  v122 = __Block_byref_object_dispose_;
  v123 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke;
  block[3] = &unk_24ECAB040;
  block[5] = &v118;
  block[4] = self;
  dispatch_sync(muckingWithInFlightCollections, block);
  v4 = (void *)v119[5];
  v5 = *MEMORY[0x24BE2AC98];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_sendFinishedToConsumerWithError_, v6);

  v111 = 0;
  v112 = &v111;
  v113 = 0x3032000000;
  v114 = __Block_byref_object_copy_;
  v115 = __Block_byref_object_dispose_;
  v116 = 0;
  v7 = self->_muckingWithInFlightCollections;
  v110[0] = MEMORY[0x24BDAC760];
  v110[1] = 3221225472;
  v110[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_92;
  v110[3] = &unk_24ECAB040;
  v110[5] = &v111;
  v110[4] = self;
  dispatch_sync(v7, v110);
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v8 = (id)v112[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v106, v129, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v107 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v12, "consumer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, 0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "folderChange:finishedWithStatus:error:", v12, 0, v14);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v106, v129, 16);
    }
    while (v9);
  }

  v100 = 0;
  v101 = &v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy_;
  v104 = __Block_byref_object_dispose_;
  v105 = 0;
  v15 = self->_muckingWithInFlightCollections;
  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_93;
  v99[3] = &unk_24ECAB040;
  v99[5] = &v100;
  v99[4] = self;
  dispatch_sync(v15, v99);
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v16 = (id)v101[5];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v95, v128, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v96;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v96 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, 0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "finishedWithError:", v21);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v95, v128, 16);
    }
    while (v17);
  }

  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy_;
  v93 = __Block_byref_object_dispose_;
  v94 = 0;
  v22 = self->_muckingWithInFlightCollections;
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_94;
  v88[3] = &unk_24ECAB040;
  v88[5] = &v89;
  v88[4] = self;
  dispatch_sync(v22, v88);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v23 = (id)v90[5];
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v84, v127, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v85;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v85 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, -1, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "finishedWithError:", v28);

      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v84, v127, 16);
    }
    while (v24);
  }

  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy_;
  v82 = __Block_byref_object_dispose_;
  v83 = 0;
  v29 = self->_muckingWithInFlightCollections;
  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_95;
  v77[3] = &unk_24ECAB040;
  v77[4] = self;
  v77[5] = &v78;
  dispatch_sync(v29, v77);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v30 = (id)v79[5];
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v73, v126, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v74;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v74 != v32)
          objc_enumerationMutation(v30);
        v34 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, -1, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "finishedWithError:exceededResultLimit:", v35, 0);

      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v73, v126, 16);
    }
    while (v31);
  }

  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy_;
  v71 = __Block_byref_object_dispose_;
  v72 = 0;
  v36 = self->_muckingWithInFlightCollections;
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_96;
  v66[3] = &unk_24ECAB040;
  v66[4] = self;
  v66[5] = &v67;
  dispatch_sync(v36, v66);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v37 = (id)v68[5];
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v125, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v63;
    do
    {
      for (n = 0; n != v38; ++n)
      {
        if (*(_QWORD *)v63 != v39)
          objc_enumerationMutation(v37);
        v41 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * n);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, -1, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "finishedWithError:", v42);

      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v125, 16);
    }
    while (v38);
  }

  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  v61 = 0;
  v43 = self->_muckingWithInFlightCollections;
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __41__ESDConnection__tearDownInFlightObjects__block_invoke_97;
  v55[3] = &unk_24ECAB040;
  v55[4] = self;
  v55[5] = &v56;
  dispatch_sync(v43, v55);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v44 = (id)v57[5];
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v124, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v52;
    do
    {
      for (ii = 0; ii != v45; ++ii)
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(v44);
        v48 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * ii);
        objc_msgSend(v48, "consumer", (_QWORD)v51);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, -1, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "oofRequestInfo:finishedWithResult:error:", v48, 0, v50);

      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v124, 16);
    }
    while (v45);
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v111, 8);

  _Block_object_dispose(&v118, 8);
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing ALL search queries", v8, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_92(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_224A56000, v5, v6, "Failing all folder changes", v8, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_93(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing all attachment downloads", v8, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing all calendar availability lookups", v8, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_95(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing all calendar search requests", v8, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_96(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing all share requests", v8, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
}

uint64_t __41__ESDConnection__tearDownInFlightObjects__block_invoke_97(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t v8[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing all settings requests", v8, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
}

- (void)_serverDiedWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[2];

  v4 = a3;
  v5 = v4;
  if (v4 == (id)MEMORY[0x24BDACF30])
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      v8 = "Daemon died, cleaning up.";
      v9 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v4 == (id)MEMORY[0x24BDACF38])
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      LOWORD(v11) = 0;
      v8 = "LOOK AT ME!!!! dataaccessd couldn't be started.  We won't try again.  If you're seeing this, get ready for some pain";
      v9 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl(&dword_224A56000, v6, v7, v8, v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  -[ESDConnection _tearDownInFlightObjects](self, "_tearDownInFlightObjects", v11);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("DataAccessMonitoringConnectionFailed"), 0);

  -[ESDConnection setRegistered:](self, "setRegistered:", 0);
}

- (void)_exchangeServerDiedWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[2];

  v4 = a3;
  v5 = v4;
  if (v4 == (id)MEMORY[0x24BDACF30])
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      v8 = "Exchange daemon died, cleaning up.";
      v9 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v4 == (id)MEMORY[0x24BDACF38])
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      LOWORD(v11) = 0;
      v8 = "LOOK AT ME!!!! exchangesyncd couldn't be started.  We won't try again.  If you're seeing this, get ready for some pain";
      v9 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl(&dword_224A56000, v6, v7, v8, v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  -[ESDConnection _tearDownInFlightObjects](self, "_tearDownInFlightObjects", v11);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("DataAccessMonitoringConnectionFailed"), 0);

  -[ESDConnection setRegistered:](self, "setRegistered:", 0);
}

- (id)_connectionForExchange
{
  NSObject *muckingWithConn;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  muckingWithConn = self->_muckingWithConn;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__ESDConnection__connectionForExchange__block_invoke;
  v5[3] = &unk_24ECAB068;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(muckingWithConn, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__ESDConnection__connectionForExchange__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_initializeExchangeConnection");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (BOOL)_hasConnectionForExchange
{
  NSObject *muckingWithConn;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  muckingWithConn = self->_muckingWithConn;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__ESDConnection__hasConnectionForExchange__block_invoke;
  v5[3] = &unk_24ECAB040;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(muckingWithConn, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__ESDConnection__hasConnectionForExchange__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) != 0;
  return result;
}

- (void)_initializeExchangeConnection
{
  const char *v3;
  NSObject *v4;
  OS_xpc_object *mach_service;
  OS_xpc_object *connExchange;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.exchangesyncd"), "UTF8String");
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service(v3, v4, 0);
  connExchange = self->_connExchange;
  self->_connExchange = mach_service;

  if (self->_connExchange)
  {
    -[ESDConnection _initializeXPCConnectionForExchange:](self, "_initializeXPCConnectionForExchange:");
  }
  else
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v7, v8))
    {
      v9 = 138412290;
      v10 = CFSTR("com.apple.exchangesyncd");
      _os_log_impl(&dword_224A56000, v7, v8, "Couldn't create a connection to [%@]", (uint8_t *)&v9, 0xCu);
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ESDConnection__initializeConnectionWithXPCEndpoint___block_invoke;
  block[3] = &unk_24ECAAFF0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(muckingWithConn, block);

}

void __54__ESDConnection__initializeConnectionWithXPCEndpoint___block_invoke(uint64_t a1)
{
  xpc_connection_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_224A56000, v6, v7, "Couldn't create a connection to endpoint: [%@]", (uint8_t *)&v9, 0xCu);
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__ESDConnection__initializeXPCConnection___block_invoke;
  v5[3] = &unk_24ECAB090;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  xpc_connection_resume(v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __42__ESDConnection__initializeXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x227689088]();
  if (v3 == MEMORY[0x24BDACFB8])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_serverDiedWithReason:", v5);
    goto LABEL_5;
  }
  if (v3 == MEMORY[0x24BDACFA0])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_dispatchMessage:", v5);
LABEL_5:

  }
}

- (void)_initializeXPCConnectionForExchange:(id)a3
{
  _xpc_connection_s *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__ESDConnection__initializeXPCConnectionForExchange___block_invoke;
  v5[3] = &unk_24ECAB090;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  xpc_connection_resume(v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __53__ESDConnection__initializeXPCConnectionForExchange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x227689088]();
  if (v3 == MEMORY[0x24BDACFB8])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_exchangeServerDiedWithReason:", v5);
    goto LABEL_5;
  }
  if (v3 == MEMORY[0x24BDACFA0])
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

  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __54__ESDConnection__createReplyToRequest_withProperties___block_invoke;
  applier[3] = &unk_24ECAB0B8;
  v8 = reply;
  v11 = v8;
  xpc_dictionary_apply(v7, applier);

  return v8;
}

uint64_t __54__ESDConnection__createReplyToRequest_withProperties___block_invoke(uint64_t a1, const char *a2, void *a3)
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
  os_log_type_t v7;
  void *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v11 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v3, &v11);
    v5 = v11;
    if (!v4)
    {
      DALoggingwithCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v5;
        _os_log_impl(&dword_224A56000, v6, v7, "Unable to read data to decode error: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("root"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_policyKeyChanged:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ESDConnection__policyKeyChanged___block_invoke;
  block[3] = &unk_24ECAB018;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __35__ESDConnection__policyKeyChanged___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void **v8;
  uint64_t *v9;
  uint64_t v10;
  os_log_type_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BE2AF98]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BE2AF88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BE2AD50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BE2AC68];
    if (v2)
    {
      v6 = *MEMORY[0x24BE2AC50];
      v13 = *MEMORY[0x24BE2AC60];
      v14 = v6;
      v15 = v1;
      v16 = v2;
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = &v15;
      v9 = &v13;
      v10 = 2;
    }
    else
    {
      v17 = *MEMORY[0x24BE2AC60];
      v18 = v1;
      v7 = (void *)MEMORY[0x24BDBCE70];
      v8 = &v18;
      v9 = &v17;
      v10 = 1;
    }
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10, v13, v14, v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:userInfo:](v4, "postNotificationName:object:userInfo:", v5, v3, v12);

  }
  else
  {
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v11 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v4, v11))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v0;
      _os_log_impl(&dword_224A56000, v4, v11, "Malformed callback message from dataaccess daemon: bad account id (%@)", buf, 0xCu);
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ESDConnection__foldersUpdated___block_invoke;
  block[3] = &unk_24ECAB018;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __33__ESDConnection__foldersUpdated___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  os_log_type_t v7;
  const char *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE98]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BE2AD50]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (!v1)
  {
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (!os_log_type_enabled(v4, v7))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v12 = v0;
    v8 = "Malformed callback message from dataaccess daemon: no folders (%@)";
LABEL_8:
    _os_log_impl(&dword_224A56000, v4, v7, v8, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v2)
  {
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (!os_log_type_enabled(v4, v7))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v12 = v0;
    v8 = "Malformed callback message from dataaccess daemon: bad account id (%@)";
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE2AC80];
  v9[0] = *MEMORY[0x24BE2AC88];
  v9[1] = v5;
  v10[0] = v1;
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject postNotificationName:object:userInfo:](v4, "postNotificationName:object:userInfo:", CFSTR("DataAccessMonitoredFolderUpdated"), 0, v6);

LABEL_9:
}

- (void)_logDataAccessStatus:(id)a3
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global);
}

void __38__ESDConnection__logDataAccessStatus___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x24BE2AC48], 0);

}

- (void)_serverContactsSearchQueryFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  os_log_type_t v10;
  NSObject *muckingWithInFlightCollections;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  os_log_type_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  _QWORD block[5];
  id v31;
  __int128 *p_buf;
  uint8_t v33[4];
  NSObject *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2B020]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2B070]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BE2AD38];
  v10 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v8, v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_224A56000, v8, v10, "doServerContactsSearchQueryFinishedWithStatus called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ESDConnection__serverContactsSearchQueryFinished___block_invoke;
  block[3] = &unk_24ECAB120;
  p_buf = &buf;
  block[4] = self;
  v12 = v6;
  v31 = v12;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2B030]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v29 = 0;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v13, &v29);
      v15 = v29;
      if (!v14)
      {
        DALoggingwithCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)v33 = 138412290;
          v34 = v15;
          _os_log_impl(&dword_224A56000, v16, v17, "Unable to read data to decode search results: %@", v33, 0xCu);
        }

      }
      v18 = (void *)MEMORY[0x24BDBCF20];
      v19 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "decodeObjectOfClasses:forKey:", v20, CFSTR("root"));
      v21 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      DALoggingwithCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      v23 = *(_BYTE *)(v9 + 6);
      if (os_log_type_enabled(v15, v23))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_224A56000, v15, v23, "Could not deserialize search results from the xpc message", v33, 2u);
      }
      v21 = 0;
    }

    DALoggingwithCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, v10))
    {
      *(_DWORD *)v33 = 138412290;
      v34 = v21;
      _os_log_impl(&dword_224A56000, v24, v10, "Search results: %@", v33, 0xCu);
    }

    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "sendResultsToConsumer:", v21);
    v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = objc_msgSend(v7, "intValue");
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sendFinishedToConsumerWithError:", v28);

  }
  else
  {
    DALoggingwithCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_BYTE *)(v9 + 3);
    if (os_log_type_enabled(v21, v22))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_224A56000, v21, v22, "received results for an unknown search query", v33, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __52__ESDConnection__serverContactsSearchQueryFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = a1[5];
    v8 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing query %@ for key %@", (uint8_t *)&v10, 0x16u);
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
  uint64_t v12;
  os_log_type_t v13;
  NSObject *muckingWithInFlightCollections;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  uint8_t v21[8];
  _QWORD block[5];
  id v23;
  _BYTE *v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2B098]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2B070]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2AEA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDConnection decodedErrorFromData:](self, "decodedErrorFromData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BE2AD38];
  v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v11, v13))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_224A56000, v11, v13, "folderChange finished with status %@, error %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ESDConnection__folderChangeFinished___block_invoke;
  block[3] = &unk_24ECAB120;
  v24 = buf;
  block[4] = self;
  v15 = v5;
  v23 = v15;
  dispatch_sync(muckingWithInFlightCollections, block);
  v16 = *(_QWORD *)&buf[8];
  v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v17)
  {
    if (v7)
    {
      objc_msgSend(v17, "setFolderId:", v7);
      v16 = *(_QWORD *)&buf[8];
    }
    if (v8)
    {
      objc_msgSend(*(id *)(v16 + 40), "setDisplayName:", v8);
      v16 = *(_QWORD *)&buf[8];
    }
    objc_msgSend(*(id *)(v16 + 40), "consumer");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject folderChange:finishedWithStatus:error:](v18, "folderChange:finishedWithStatus:error:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), (int)objc_msgSend(v6, "intValue"), v10);
  }
  else
  {
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_BYTE *)(v12 + 3);
    if (os_log_type_enabled(v18, v19))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_224A56000, v18, v19, "received results for an unknown folderChange", v21, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __39__ESDConnection__folderChangeFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = a1[5];
    v8 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing folder change %@ for key %@", (uint8_t *)&v10, 0x16u);
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__ESDConnection__getStatusReportsFromClient___block_invoke;
  v7[3] = &unk_24ECAAFF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__ESDConnection__getStatusReportsFromClient___block_invoke(uint64_t a1)
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
  uint64_t v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
  v19 = *MEMORY[0x24BE2B078];
  v20 = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, (_QWORD)v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "_createReplyToRequest:withProperties:", *(_QWORD *)(a1 + 40), v11);
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 40));
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_connectionForExchange");
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v14 == v13)
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

  v30 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE2ADB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE2B0A0]);
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
    v11 = MEMORY[0x24BDAC760];
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
        block[2] = __35__ESDConnection__downloadProgress___block_invoke;
        block[3] = &unk_24ECAB120;
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

void __35__ESDConnection__downloadProgress___block_invoke(_QWORD *a1)
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

  v28 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE2ADB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDConnection decodedErrorFromData:](self, "decodedErrorFromData:", v5);
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
    v9 = MEMORY[0x24BDAC760];
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
        block[2] = __35__ESDConnection__downloadFinished___block_invoke;
        block[3] = &unk_24ECAB120;
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

uint64_t __35__ESDConnection__downloadFinished___block_invoke(_QWORD *a1)
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
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2B048]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ESDConnection__shareResponseFinished___block_invoke;
  block[3] = &unk_24ECAB120;
  v13 = &v14;
  block[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v15[5], "finishedWithError:", v8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __40__ESDConnection__shareResponseFinished___block_invoke(_QWORD *a1)
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
  uint64_t v9;
  os_log_type_t v10;
  NSObject *muckingWithInFlightCollections;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  _QWORD block[5];
  id v32;
  __int128 *p_buf;
  uint8_t v34[4];
  void *v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AF48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2B070]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BE2AD38];
  v10 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v8, v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_224A56000, v8, v10, "_oofSettingsRequestsFinished called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ESDConnection__oofSettingsRequestsFinished___block_invoke;
  block[3] = &unk_24ECAB120;
  p_buf = &buf;
  block[4] = self;
  v12 = v6;
  v32 = v12;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (v7)
    {
      if (objc_msgSend(v7, "intValue") == 2)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AF40]);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 && -[NSObject BOOLValue](v13, "BOOLValue"))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "oofRequestInfo:finishedWithResult:error:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0, 0);
        }
        else
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AF68]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2AD18]), "initWithDictionary:", v15);
            DALoggingwithCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, v10))
            {
              *(_DWORD *)v34 = 138412290;
              v35 = v25;
              _os_log_impl(&dword_224A56000, v26, v10, "Oof settings request results: %@", v34, 0xCu);
            }

            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "oofRequestInfo:finishedWithResult:error:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v25, 0);
          }
          else
          {
            DALoggingwithCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = *(_BYTE *)(v9 + 6);
            if (os_log_type_enabled(v28, v29))
            {
              *(_WORD *)v34 = 0;
              _os_log_impl(&dword_224A56000, v28, v29, "Could not deserialize search results from the xpc message", v34, 2u);
            }

            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 62, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "oofRequestInfo:finishedWithResult:error:", v30, 0, v27);
          }

        }
      }
      else
      {
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
        v14 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        v22 = (void *)MEMORY[0x24BDD1540];
        v23 = objc_msgSend(v7, "intValue");
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject oofRequestInfo:finishedWithResult:error:](v14, "oofRequestInfo:finishedWithResult:error:", v21, 0, v24);

      }
    }
    else
    {
      DALoggingwithCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_BYTE *)(v9 + 6);
      if (os_log_type_enabled(v17, v18))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_224A56000, v17, v18, "Status missing from the xpc message", v34, 2u);
      }

      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
      v14 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 62, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject oofRequestInfo:finishedWithResult:error:](v14, "oofRequestInfo:finishedWithResult:error:", v19, 0, v20);

    }
  }
  else
  {
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(v9 + 3);
    if (os_log_type_enabled(v14, v16))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_224A56000, v14, v16, "received results for an unknown oof settings request", v34, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __46__ESDConnection__oofSettingsRequestsFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = a1[5];
    v8 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_224A56000, v5, v6, "Removing from inflight dictionary: oof settings request %@ for key %@", (uint8_t *)&v10, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[4] + 104), "removeObjectForKey:", a1[5]);
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_109);
  objc_msgSend((id)sharedConnection_gESDConnection, "reallyRegisterForInterrogation");
  return (id)sharedConnection_gESDConnection;
}

void __33__ESDConnection_sharedConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ESDConnection _init]([ESDConnection alloc], "_init");
  v1 = (void *)sharedConnection_gESDConnection;
  sharedConnection_gESDConnection = (uint64_t)v0;

}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  return -[ESDConnection watchFoldersWithKeys:forAccountID:persistent:](self, "watchFoldersWithKeys:forAccountID:persistent:", a3, a4, 0);
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  _xpc_connection_s *v19;
  xpc_object_t v20;
  BOOL v21;
  int v23;
  const char *v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v5 = a5;
  v26[4] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v8, 127, 0);
  v10 = *MEMORY[0x24BE2ADC8];
  v11 = *MEMORY[0x24BE2AD50];
  v25[0] = *MEMORY[0x24BE2AF20];
  v25[1] = v11;
  v26[0] = v10;
  v26[1] = v8;
  v12 = *MEMORY[0x24BE2AE98];
  v26[2] = v9;
  v13 = *MEMORY[0x24BE2AF80];
  v25[2] = v12;
  v25[3] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v16, v17))
  {
    v23 = 136315138;
    v24 = "-[ESDConnection watchFoldersWithKeys:forAccountID:persistent:]";
    _os_log_impl(&dword_224A56000, v16, v17, "XPC call performed in: %s", (uint8_t *)&v23, 0xCu);
  }

  v18 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v19 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v20 = xpc_connection_send_message_with_reply_sync(v19, v18);

  v21 = -[ESDConnection _validateXPCReply:](self, "_validateXPCReply:", v20);
  return v21;
}

- (BOOL)resumeWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  BOOL v16;
  os_log_type_t v17;
  int v19;
  const char *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[ESDConnection _hasConnectionForExchange](self, "_hasConnectionForExchange"))
  {
    -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v7, 127, 0);
    v8 = *MEMORY[0x24BE2B018];
    v9 = *MEMORY[0x24BE2AD50];
    v21[0] = *MEMORY[0x24BE2AF20];
    v21[1] = v9;
    v22[0] = v8;
    v22[1] = v7;
    v21[2] = *MEMORY[0x24BE2AE98];
    v22[2] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v10 = objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
    if (os_log_type_enabled(v11, v12))
    {
      v19 = 136315138;
      v20 = "-[ESDConnection resumeWatchingFoldersWithKeys:forAccountID:]";
      _os_log_impl(&dword_224A56000, v11, v12, "XPC call performed in: %s", (uint8_t *)&v19, 0xCu);
    }

    v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v15 = xpc_connection_send_message_with_reply_sync(v14, v13);

    v16 = -[ESDConnection _validateXPCReply:](self, "_validateXPCReply:", v15);
  }
  else
  {
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v10, v17))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_224A56000, v10, v17, "[ESDConnection resumeWatchingFoldersWithKeys:forAccountID] called without a connection. Will not resume.", (uint8_t *)&v19, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (BOOL)suspendWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  _xpc_connection_s *v15;
  xpc_object_t v16;
  BOOL v17;
  int v19;
  const char *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BE2B090];
  v7 = *MEMORY[0x24BE2AD50];
  v21[0] = *MEMORY[0x24BE2AF20];
  v21[1] = v7;
  v22[0] = v6;
  v22[1] = a4;
  v21[2] = *MEMORY[0x24BE2AE98];
  v22[2] = a3;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v12, v13))
  {
    v19 = 136315138;
    v20 = "-[ESDConnection suspendWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_224A56000, v12, v13, "XPC call performed in: %s", (uint8_t *)&v19, 0xCu);
  }

  v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v16 = xpc_connection_send_message_with_reply_sync(v15, v14);

  v17 = -[ESDConnection _validateXPCReply:](self, "_validateXPCReply:", v16);
  return v17;
}

- (BOOL)stopWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  _xpc_connection_s *v15;
  xpc_object_t v16;
  BOOL v17;
  int v19;
  const char *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BE2B088];
  v7 = *MEMORY[0x24BE2AD50];
  v21[0] = *MEMORY[0x24BE2AF20];
  v21[1] = v7;
  v22[0] = v6;
  v22[1] = a4;
  v21[2] = *MEMORY[0x24BE2AE98];
  v22[2] = a3;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v12, v13))
  {
    v19 = 136315138;
    v20 = "-[ESDConnection stopWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_224A56000, v12, v13, "XPC call performed in: %s", (uint8_t *)&v19, 0xCu);
  }

  v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v16 = xpc_connection_send_message_with_reply_sync(v15, v14);

  v17 = -[ESDConnection _validateXPCReply:](self, "_validateXPCReply:", v16);
  return v17;
}

- (BOOL)_validateXPCReply:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  void *v9;
  int v10;
  NSObject *v11;
  os_log_type_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = MEMORY[0x227689088]();
  if (v4 == MEMORY[0x24BDACFA0])
  {
    v6 = _CFXPCCreateCFObjectFromXPCObject();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x24BE2B070]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");
    v8 = v10 == 2;
    if (v10 != 2)
    {
      DALoggingwithCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v11, v12))
      {
        v14 = 138412290;
        v15 = (uint64_t)v9;
        _os_log_impl(&dword_224A56000, v11, v12, "XPC Reply Failure. Status Code: %@", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else
  {
    v5 = v4;
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_224A56000, v6, v7, "Unsupported XPC reply type. Reply Type: %@", (uint8_t *)&v14, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)requestPolicyUpdateForAccountID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _xpc_connection_s *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v4, 127, 0);
  v5 = *MEMORY[0x24BE2AFF0];
  v6 = *MEMORY[0x24BE2AD50];
  v11[0] = *MEMORY[0x24BE2AF20];
  v11[1] = v6;
  v12[0] = v5;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v9, v8);

  return 1;
}

- (id)currentPolicyKeyForAccountID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD handler[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v5 = *MEMORY[0x24BE2AD50];
  v23[0] = *MEMORY[0x24BE2AF20];
  v23[1] = v5;
  v22 = 0;
  v24[0] = *MEMORY[0x24BE2AEC0];
  v24[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v8 = dispatch_semaphore_create(0);
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __46__ESDConnection_currentPolicyKeyForAccountID___block_invoke;
  handler[3] = &unk_24ECAB168;
  v16 = &v17;
  v11 = v8;
  v15 = v11;
  xpc_connection_send_message_with_reply(v9, v7, v10, handler);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __46__ESDConnection_currentPolicyKeyForAccountID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (MEMORY[0x227689088]() == MEMORY[0x24BDACFA0])
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2AF98]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2B070]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || objc_msgSend(v8, "intValue") != 2)
    {
      DALoggingwithCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v10, v11))
      {
        v12 = 136315394;
        v13 = "-[ESDConnection currentPolicyKeyForAccountID:]_block_invoke";
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_224A56000, v10, v11, "Server error in %s communicating with daemon: %@", (uint8_t *)&v12, 0x16u);
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (unint64_t)_nextStopMonitoringStatusToken
{
  unint64_t v2;

  os_unfair_lock_lock(&_nextStopMonitoringStatusToken_nextTokenLock);
  v2 = ++_nextStopMonitoringStatusToken_nextToken;
  os_unfair_lock_unlock(&_nextStopMonitoringStatusToken_nextTokenLock);
  return v2;
}

- (void)_requestDaemonChangeAgentMonitoringStatus:(BOOL)a3 withToken:(unint64_t)a4 waitForReply:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v7;
  NSObject *v9;
  uint64_t v10;
  os_log_type_t v11;
  const __CFString *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  _xpc_connection_s *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v5 = a5;
  v7 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BE2AD38];
  v11 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v9, v11))
  {
    v12 = CFSTR("stop");
    if (v7)
      v12 = CFSTR("start");
    v24 = 138412290;
    v25 = (const char *)v12;
    _os_log_impl(&dword_224A56000, v9, v11, "Requesting that DataAccess %@ monitoring agents.", (uint8_t *)&v24, 0xCu);
  }

  v13 = (_QWORD *)MEMORY[0x24BE2B080];
  if (v7)
    v13 = (_QWORD *)MEMORY[0x24BE2B068];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", *v13, *MEMORY[0x24BE2AF20]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE2AD88]);

  if (v5)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2AD80]);
    v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v18 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v17, v16);

    if (MEMORY[0x227689088](v18) == MEMORY[0x24BDACFA0])
    {
      v19 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE2B070]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v20 || objc_msgSend(v20, "intValue") != 2)
      {
        DALoggingwithCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_BYTE *)(v10 + 3);
        if (os_log_type_enabled(v22, v23))
        {
          v24 = 136315394;
          v25 = "-[ESDConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:]";
          v26 = 2112;
          v27 = v21;
          _os_log_impl(&dword_224A56000, v22, v23, "Server error in %s communicating with daemon: %@", (uint8_t *)&v24, 0x16u);
        }

      }
    }
  }
  else
  {
    v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v18, v16);
  }

}

- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3
{
  -[ESDConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 1, a3, 0);
}

- (unint64_t)requestDaemonStopMonitoringAgents
{
  unint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_nextStopMonitoringStatusToken");
  -[ESDConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 0, v3, 0);
  return v3;
}

- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3
{
  -[ESDConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 1, a3, 1);
}

- (unint64_t)requestDaemonStopMonitoringAgentsSync
{
  unint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_nextStopMonitoringStatusToken");
  -[ESDConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 0, v3, 1);
  return v3;
}

- (void)requestDaemonShutdown
{
  notify_post("com.apple.exchangesyncd.shutdown");
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 requireChangedFolders:(BOOL)a5 isUserRequested:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _xpc_connection_s *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v6 = a6;
  v7 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 138413058;
    v25 = v10;
    v26 = 2048;
    v27 = a4;
    v28 = 1024;
    v29 = v7;
    v30 = 1024;
    v31 = v6;
    _os_log_impl(&dword_224A56000, v11, v12, "updateFolderListForAccountID %@, dataclasses %lx, requireChangedFolders %d, isUserRequested %d", buf, 0x22u);
  }

  -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v10, a4, v6);
  -[ESDConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v10);
  v13 = *MEMORY[0x24BE2AFE8];
  v14 = *MEMORY[0x24BE2AD50];
  v22[0] = *MEMORY[0x24BE2AF20];
  v23[0] = v13;
  v23[1] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4, v22[0], v14, *MEMORY[0x24BE2AE58]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = *MEMORY[0x24BE2AFF8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  v22[4] = *MEMORY[0x24BE2AEF8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v20, v19);

  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  return -[ESDConnection updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:](self, "updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:", a3, a4, 0, a5);
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclasses:(int64_t)a5 isUserRequested:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _xpc_connection_s *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v12, v13))
  {
    *(_DWORD *)buf = 138413058;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2048;
    v29 = a5;
    v30 = 1024;
    v31 = v6;
    _os_log_impl(&dword_224A56000, v12, v13, "updateContentsOfFoldersWithKeys %@ for account id %@, dataclasses 0x%lx isUserRequested %d", buf, 0x26u);
  }

  -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v11, a5, v6);
  -[ESDConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v11);
  v14 = *MEMORY[0x24BE2AFE0];
  v15 = *MEMORY[0x24BE2AD50];
  v22[0] = *MEMORY[0x24BE2AF20];
  v23[0] = v14;
  v23[1] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5, v22[0], v15, *MEMORY[0x24BE2AE58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v16;
  v22[3] = *MEMORY[0x24BE2AEF8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = *MEMORY[0x24BE2AE98];
  v23[3] = v17;
  v23[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v20, v19);

  return 1;
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  _QWORD v19[4];
  _QWORD v20[4];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v8;
    v23 = 2048;
    v24 = a4;
    v25 = 1024;
    v26 = v5;
    _os_log_impl(&dword_224A56000, v9, v10, "updateContentsOfAllFoldersForAccountID %@, dataclasses 0x%lxx isUserRequested %d", buf, 0x1Cu);
  }

  -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v8, a4, v5);
  -[ESDConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v8);
  v11 = *MEMORY[0x24BE2AFD0];
  v12 = *MEMORY[0x24BE2AD50];
  v19[0] = *MEMORY[0x24BE2AF20];
  v20[0] = v11;
  v20[1] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4, v19[0], v12, *MEMORY[0x24BE2AE58]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v13;
  v19[3] = *MEMORY[0x24BE2AEF8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v17, v16);

  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4
{
  return -[ESDConnection updateFolderListForAccountID:andDataclasses:isUserRequested:](self, "updateFolderListForAccountID:andDataclasses:isUserRequested:", a3, a4, 0);
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclass:(int64_t)a5
{
  return -[ESDConnection updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:](self, "updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:", a3, a4, a5, 0);
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclass:(int64_t)a4
{
  return -[ESDConnection updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:](self, "updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:", a3, a4, 0);
}

- (BOOL)performServerContactsSearch:(id)a3 forAccountWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  dispatch_semaphore_t v15;
  _xpc_connection_s *v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  os_log_type_t v20;
  const char *v21;
  _QWORD v23[4];
  id v24;
  ESDConnection *v25;
  NSObject *v26;
  uint64_t *v27;
  uint8_t buf[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v7, 8, 0);
  if (!v7)
  {
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v20 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v13, v20))
    {
      *(_WORD *)buf = 0;
      v21 = "nil accountID passed to performServerContactsSearch. Refusing to attempt search";
LABEL_8:
      _os_log_impl(&dword_224A56000, v13, v20, v21, buf, 2u);
    }
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v20 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v13, v20))
    {
      *(_WORD *)buf = 0;
      v21 = "nil search string passed to performServerContactsSearch. Refusing to attempt search";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10 = *MEMORY[0x24BE2AF70];
  v11 = *MEMORY[0x24BE2AD50];
  v33[0] = *MEMORY[0x24BE2AF20];
  v33[1] = v11;
  v34[0] = v10;
  v34[1] = v7;
  v33[2] = *MEMORY[0x24BE2B028];
  objc_msgSend(v6, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v15 = dispatch_semaphore_create(0);
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __62__ESDConnection_performServerContactsSearch_forAccountWithID___block_invoke;
  v23[3] = &unk_24ECAB1B8;
  v24 = v6;
  v25 = self;
  v27 = &v29;
  v18 = v15;
  v26 = v18;
  xpc_connection_send_message_with_reply(v16, v14, v17, v23);

  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  v19 = *((_BYTE *)v30 + 24) != 0;

LABEL_10:
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __62__ESDConnection_performServerContactsSearch_forAccountWithID___block_invoke(uint64_t a1, void *a2)
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
  if (MEMORY[0x227689088]() == MEMORY[0x24BDACFA0])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE2B020]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSearchID:", v4);
    v5 = *(void **)(a1 + 32);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ESDConnection_performServerContactsSearch_forAccountWithID___block_invoke_2;
    block[3] = &unk_24ECAB190;
    v10 = v5;
    v11 = v4;
    v12 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    dispatch_sync(v6, block);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t __62__ESDConnection_performServerContactsSearch_forAccountWithID___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = a1[4];
    v5 = a1[5];
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_224A56000, v2, v3, "Setting search query %@ for key %@", (uint8_t *)&v7, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[6] + 56), "setObject:forKeyedSubscript:", a1[4], a1[5]);
}

- (void)cancelServerContactsSearch:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  NSObject *muckingWithInFlightCollections;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  ESDConnection *v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "searchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "setState:", 2);
    objc_msgSend(v4, "setConsumer:", 0);
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v4;
      _os_log_impl(&dword_224A56000, v7, v8, "Cancelling search task %p", buf, 0xCu);
    }

    objc_msgSend(v4, "searchID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE2AE50];
    v11 = *MEMORY[0x24BE2B020];
    v24[0] = *MEMORY[0x24BE2AF20];
    v24[1] = v11;
    v25[0] = v10;
    v25[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v14, v13);

    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, v8))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_impl(&dword_224A56000, v15, v8, "Removing search query for key %@", buf, 0xCu);
    }

    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __44__ESDConnection_cancelServerContactsSearch___block_invoke;
    v21 = &unk_24ECAAFF0;
    v22 = self;
    v23 = v9;
    v17 = v9;
    dispatch_sync(muckingWithInFlightCollections, &v18);
    objc_msgSend(v4, "setSearchID:", &stru_24ECAB5C0, v18, v19, v20, v21, v22);

  }
}

uint64_t __44__ESDConnection_cancelServerContactsSearch___block_invoke(uint64_t a1)
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
  os_log_type_t v19;
  void *v20;
  _xpc_connection_s *v21;
  xpc_object_t v22;
  BOOL v23;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a6;
  -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v15, 5, 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BE2AFA8], *MEMORY[0x24BE2AF20], v15, *MEMORY[0x24BE2AD50], v16, *MEMORY[0x24BE2AE90], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE2AF08]);
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE2AF10]);
  if (v14)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE2AF18]);
  DALoggingwithCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v18, v19))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ESDConnection processMeetingRequests:deliveryIdsToClear:deliveryIdsToSoftClear:inFolderWithId:forAccountWithId:]";
    _os_log_impl(&dword_224A56000, v18, v19, "XPC call performed in: %s", buf, 0xCu);
  }

  v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v22 = xpc_connection_send_message_with_reply_sync(v21, v20);

  v23 = -[ESDConnection _validateXPCReply:](self, "_validateXPCReply:", v22);
  return v23;
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
  -[ESDConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v14, 5, 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BE2AD90], *MEMORY[0x24BE2AF20], v14, *MEMORY[0x24BE2AD50], v15, *MEMORY[0x24BE2AE90], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE2AF08]);
  if (v12)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE2AF10]);
  if (v13)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE2AF18]);
  v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
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
  id v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  _xpc_connection_s *v20;
  xpc_object_t v21;
  BOOL v22;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x24BDBCED8];
  v14 = a6;
  v15 = [v13 alloc];
  v16 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", *MEMORY[0x24BE2B040], *MEMORY[0x24BE2AF20], v14, *MEMORY[0x24BE2AD50], 0);

  if (v10)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE2AF28]);
  if (v11)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE2AF30]);
  if (v12)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE2AF38]);
  DALoggingwithCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v17, v18))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ESDConnection setFolderIdsThatExternalClientsCareAboutAdded:deleted:foldersTag:forAccountID:]";
    _os_log_impl(&dword_224A56000, v17, v18, "XPC call performed in: %s", buf, 0xCu);
  }

  v19 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v21 = xpc_connection_send_message_with_reply_sync(v20, v19);

  v22 = -[ESDConnection _validateXPCReply:](self, "_validateXPCReply:", v21);
  return v22;
}

- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _xpc_connection_s *v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v9 = *MEMORY[0x24BE2AF20];
    v23[0] = *MEMORY[0x24BE2AFB8];
    v10 = *MEMORY[0x24BE2B070];
    v22[0] = v9;
    v22[1] = v10;
    v11 = (void *)MEMORY[0x24BDD16E0];
    if (a3)
      v12 = 2;
    else
      v12 = 10;
    v13 = a6;
    v14 = a4;
    objc_msgSend(v11, "numberWithInteger:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BE2AE90];
    v23[1] = v15;
    v23[2] = v14;
    v17 = *MEMORY[0x24BE2AEA8];
    v22[2] = v16;
    v22[3] = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = *MEMORY[0x24BE2AD50];
    v23[3] = v18;
    v23[4] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v21, v20);

  }
}

- (void)handleURL:(id)a3
{
  __CFString *v4;
  CFStringRef v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _xpc_connection_s *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "absoluteString");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, 0, CFSTR("&="), 0x8000100u);
  v6 = *MEMORY[0x24BE2AED8];
  v7 = *MEMORY[0x24BE2B0A8];
  v11[0] = *MEMORY[0x24BE2AF20];
  v11[1] = v7;
  v12[0] = v6;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v10, v9);

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

  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__ESDConnection__sendSynchronousXPCMessageWithParameters_handlerBlock___block_invoke;
  v14[3] = &unk_24ECAB1E0;
  v15 = v8;
  v16 = v6;
  v12 = v8;
  v13 = v6;
  xpc_connection_send_message_with_reply(v10, v9, v11, v14);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __71__ESDConnection__sendSynchronousXPCMessageWithParameters_handlerBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (*(_QWORD *)(a1 + 40) && MEMORY[0x227689088](v4) == MEMORY[0x24BDACFA0])
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
  os_log_type_t v18;
  ESDownloadContext *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  ESDownloadContext *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  ESDConnection *v31;
  ESDownloadContext *v32;
  _BYTE *v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  DALoggingwithCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v17, v18))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_224A56000, v17, v18, "Requesting download of attachment UUID %@ for accountID %@", buf, 0x16u);
  }

  v19 = -[ESDownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]([ESDownloadContext alloc], "initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:", v12, v13, v14, v15, v16);
  v20 = *MEMORY[0x24BE2ADC0];
  v21 = *MEMORY[0x24BE2ADB8];
  v38[0] = *MEMORY[0x24BE2AF20];
  v38[1] = v21;
  v39[0] = v20;
  v39[1] = v12;
  v38[2] = *MEMORY[0x24BE2AD50];
  v39[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __98__ESDConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke;
  v28[3] = &unk_24ECAB230;
  v33 = buf;
  v23 = v12;
  v29 = v23;
  v24 = v13;
  v30 = v24;
  v31 = self;
  v25 = v19;
  v32 = v25;
  -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v22, v28);
  v26 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v26;
}

void __98__ESDConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  _QWORD block[5];
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE2ADA0]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_224A56000, v6, v7, "Download context %@ set up for downloading attachment UUID %@ on accountID %@", buf, 0x20u);
  }

  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(NSObject **)(v11 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__ESDConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_121;
  block[3] = &unk_24ECAB208;
  block[4] = v11;
  v14 = *(_OWORD *)(a1 + 56);
  v13 = (id)v14;
  v16 = v14;
  dispatch_sync(v12, block);

}

uint64_t __98__ESDConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_121(_QWORD *a1)
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

  v27 = *MEMORY[0x24BDAC8D0];
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
    v10 = MEMORY[0x24BDAC760];
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
        block[2] = __47__ESDConnection__cancelDownloadsWithIDs_error___block_invoke;
        block[3] = &unk_24ECAB120;
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

uint64_t __47__ESDConnection__cancelDownloadsWithIDs_error___block_invoke(_QWORD *a1)
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
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE2AF20];
  v20[0] = *MEMORY[0x24BE2AE48];
  v8 = *MEMORY[0x24BE2AE70];
  v19[0] = v7;
  v19[1] = v8;
  v9 = (void *)MEMORY[0x24BDD1618];
  v10 = a4;
  objc_msgSend(v9, "archivedDataWithRootObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = *MEMORY[0x24BE2ADA0];
  v20[1] = v11;
  v20[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_224A56000, v13, v14, "Cancelling Download of attachment with downloadID %@", buf, 0xCu);
  }

  -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v12, 0);
  v16 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDConnection _cancelDownloadsWithIDs:error:](self, "_cancelDownloadsWithIDs:error:", v15, v10);

}

- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  ESSharedCalendarContext *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  ESSharedCalendarContext *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  ESDConnection *v28;
  ESSharedCalendarContext *v29;
  _QWORD v30[4];
  _QWORD v31[4];
  uint8_t buf[4];
  int64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  DALoggingwithCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)buf = 134218498;
    v33 = a3;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    _os_log_impl(&dword_224A56000, v16, v17, "Requesting share response %ld for calendar %@ for accountID %@", buf, 0x20u);
  }

  v18 = -[ESSharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]([ESSharedCalendarContext alloc], "initWithCalendarID:accountID:queue:completionBlock:", v12, v13, v15, v14);
  -[ESSharedCalendarContext setShouldSyncCalendar:](v18, "setShouldSyncCalendar:", a3 == 1);
  v19 = *MEMORY[0x24BE2AD50];
  v30[0] = *MEMORY[0x24BE2AF20];
  v30[1] = v19;
  v31[0] = *MEMORY[0x24BE2B010];
  v31[1] = v13;
  v30[2] = *MEMORY[0x24BE2B050];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = *MEMORY[0x24BE2B058];
  v31[2] = v20;
  v31[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __97__ESDConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke;
  v25[3] = &unk_24ECAB258;
  v26 = v12;
  v27 = v13;
  v28 = self;
  v29 = v18;
  v22 = v18;
  v23 = v13;
  v24 = v12;
  -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v21, v25);

}

void __97__ESDConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE2B048]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = a1[4];
    v7 = a1[5];
    *(_DWORD *)buf = 138412802;
    v16 = v3;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_224A56000, v4, v5, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
  }

  v8 = a1[6];
  v9 = (void *)a1[7];
  v10 = *(NSObject **)(v8 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__ESDConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_125;
  block[3] = &unk_24ECAB190;
  block[4] = v8;
  v13 = v3;
  v14 = v9;
  v11 = v3;
  dispatch_sync(v10, block);

}

uint64_t __97__ESDConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_125(_QWORD *a1)
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
  os_log_type_t v15;
  ESSharedCalendarContext *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  ESSharedCalendarContext *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  ESDConnection *v26;
  ESSharedCalendarContext *v27;
  _QWORD v28[3];
  _QWORD v29[3];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  DALoggingwithCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_224A56000, v14, v15, "Reporting calendar %@ for accountID %@ as junk", buf, 0x16u);
  }

  v16 = -[ESSharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]([ESSharedCalendarContext alloc], "initWithCalendarID:accountID:queue:completionBlock:", v10, v11, v13, v12);
  -[ESSharedCalendarContext setShouldSyncCalendar:](v16, "setShouldSyncCalendar:", 0);
  v17 = *MEMORY[0x24BE2AFC0];
  v18 = *MEMORY[0x24BE2AD50];
  v28[0] = *MEMORY[0x24BE2AF20];
  v28[1] = v18;
  v29[0] = v17;
  v29[1] = v11;
  v28[2] = *MEMORY[0x24BE2B058];
  v29[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __99__ESDConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke;
  v23[3] = &unk_24ECAB258;
  v24 = v10;
  v25 = v11;
  v26 = self;
  v27 = v16;
  v20 = v16;
  v21 = v11;
  v22 = v10;
  -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v19, v23);

}

void __99__ESDConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE2B048]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = a1[4];
    v7 = a1[5];
    *(_DWORD *)buf = 138412802;
    v16 = v3;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_224A56000, v4, v5, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
  }

  v8 = a1[6];
  v9 = (void *)a1[7];
  v10 = *(NSObject **)(v8 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__ESDConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_126;
  block[3] = &unk_24ECAB190;
  block[4] = v8;
  v13 = v3;
  v14 = v9;
  v11 = v3;
  dispatch_sync(v10, block);

}

uint64_t __99__ESDConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_126(_QWORD *a1)
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
  os_log_type_t v12;
  void *v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *muckingWithInFlightCollections;
  _QWORD block[4];
  id v22;
  ESDConnection *v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD1618];
  v8 = a4;
  objc_msgSend(v7, "archivedDataWithRootObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BE2AFA0], *MEMORY[0x24BE2AF20], v8, *MEMORY[0x24BE2AD50], v9, *MEMORY[0x24BE2AE80], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[ESDConnection processFolderChange:forAccountWithID:]";
    _os_log_impl(&dword_224A56000, v11, v12, "XPC call performed in: %s", buf, 0xCu);
  }

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v15 = xpc_connection_send_message_with_reply_sync(v14, v13);

  if (MEMORY[0x227689088](v15) == MEMORY[0x24BDACFA0])
  {
    v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE2B098]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__ESDConnection_processFolderChange_forAccountWithID___block_invoke;
    block[3] = &unk_24ECAB280;
    v23 = self;
    v24 = v18;
    v22 = v6;
    dispatch_sync(muckingWithInFlightCollections, block);

  }
  return 1;
}

void __54__ESDConnection_processFolderChange_forAccountWithID___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = a1[4];
    v5 = a1[6];
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_224A56000, v2, v3, "Setting folder change %@ for key %lu", (uint8_t *)&v9, 0x16u);
  }

  v6 = a1[4];
  v7 = *(void **)(a1[5] + 64);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

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
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v21 = *MEMORY[0x24BE2AF20];
  v22[0] = *MEMORY[0x24BE2AEC8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v5 = dispatch_semaphore_create(0);
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __30__ESDConnection_statusReports__block_invoke;
  handler[3] = &unk_24ECAB168;
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

void __30__ESDConnection_statusReports__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (MEMORY[0x227689088]() == MEMORY[0x24BDACFA0])
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2B078]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2B070]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || objc_msgSend(v8, "intValue") != 2)
    {
      DALoggingwithCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v10, v11))
      {
        v12 = 136315394;
        v13 = "-[ESDConnection statusReports]_block_invoke";
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_224A56000, v10, v11, "Server error in %s communicating with daemon: %@", (uint8_t *)&v12, 0x16u);
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)reallyRegisterForInterrogation
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (self->_statusReportBlock && !-[ESDConnection registered](self, "registered"))
  {
    -[ESDConnection setRegistered:](self, "setRegistered:", 1);
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_224A56000, v3, v4, "Sending message: kDAERegisterForInterrogation", v8, 2u);
    }

    v9 = *MEMORY[0x24BE2AF20];
    v10[0] = *MEMORY[0x24BE2AFB0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v7, v6);

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
    v7 = (void *)MEMORY[0x227688EF0](v6);
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
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BE2AF20];
  v12[0] = *MEMORY[0x24BE2AE78];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v5 = dispatch_semaphore_create(0);
  -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__ESDConnection_fillOutCurrentEASTimeZoneInfo__block_invoke;
  v9[3] = &unk_24ECAB2A8;
  v10 = v5;
  v8 = v5;
  xpc_connection_send_message_with_reply(v6, v4, v7, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __46__ESDConnection_fillOutCurrentEASTimeZoneInfo__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)activeSyncDeviceIdentifier
{
  void *v3;
  os_log_type_t v4;
  int v5;
  void *v6;
  dispatch_semaphore_t v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t v14[8];
  _QWORD handler[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v24 = *MEMORY[0x24BE2AF20];
  v25[0] = *MEMORY[0x24BE2AEB8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  v5 = 3;
  while (1)
  {
    v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v7 = dispatch_semaphore_create(0);
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __43__ESDConnection_activeSyncDeviceIdentifier__block_invoke;
    handler[3] = &unk_24ECAB168;
    v17 = &v18;
    v10 = v7;
    v16 = v10;
    xpc_connection_send_message_with_reply(v8, v6, v9, handler);

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (v19[5])
      break;
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, v4))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_224A56000, v11, v4, "Error getting activesync device identifier, will try again", v14, 2u);
    }

    if (!--v5)
      goto LABEL_8;
  }

LABEL_8:
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __43__ESDConnection_activeSyncDeviceIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (MEMORY[0x227689088]() == MEMORY[0x24BDACFA0])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE2AD70]);
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
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  dispatch_semaphore_t v17;
  _xpc_connection_s *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  os_log_type_t v22;
  _QWORD handler[4];
  id v25;
  ESDConnection *v26;
  NSObject *v27;
  uint64_t *v28;
  BOOL v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v5 = a5;
  v36[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCED8]);
    v11 = *MEMORY[0x24BE2AD50];
    v35[0] = *MEMORY[0x24BE2AF20];
    v35[1] = v11;
    v36[0] = *MEMORY[0x24BE2AF50];
    v36[1] = v9;
    v35[2] = *MEMORY[0x24BE2AF40];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "initWithDictionary:", v13);

    if (v5)
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE2AF60]);

    }
    v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v17 = dispatch_semaphore_create(0);
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __71__ESDConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke;
    handler[3] = &unk_24ECAB2F8;
    v25 = v8;
    v26 = self;
    v29 = v5;
    v28 = &v31;
    v20 = v17;
    v27 = v20;
    xpc_connection_send_message_with_reply(v18, v16, v19, handler);

    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    v21 = *((_BYTE *)v32 + 24) != 0;

  }
  else
  {
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v22 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v14, v22))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224A56000, v14, v22, "nil accountID passed to performASSettingsRequest. Cannot continue.", buf, 2u);
    }
    v21 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v21;
}

void __71__ESDConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke(uint64_t a1, void *a2)
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
  if (MEMORY[0x227689088]() == MEMORY[0x24BDACFA0])
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE2AF48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRequestID:", v4);
    v5 = *(void **)(a1 + 32);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__ESDConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke_2;
    block[3] = &unk_24ECAB2D0;
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

uint64_t __71__ESDConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v2, v3))
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = CFSTR("update");
    else
      v4 = CFSTR("retrieve");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_224A56000, v2, v3, "Adding to inflight dictionary: oof %@ request %@ for key %@", (uint8_t *)&v8, 0x20u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)retrieveOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  return -[ESDConnection _performOofSettingsRequest:forAccountWithID:forUpdate:](self, "_performOofSettingsRequest:forAccountWithID:forUpdate:", a3, a4, 0);
}

- (BOOL)updateOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  return -[ESDConnection _performOofSettingsRequest:forAccountWithID:forUpdate:](self, "_performOofSettingsRequest:forAccountWithID:forUpdate:", a3, a4, 1);
}

- (void)isOofSettingsSupportedForAccountWithID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  _QWORD handler[4];
  id v17;
  uint8_t buf[8];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = *MEMORY[0x24BE2AEE8];
    v9 = *MEMORY[0x24BE2AD50];
    v19[0] = *MEMORY[0x24BE2AF20];
    v19[1] = v9;
    v20[0] = v8;
    v20[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](self, "_connectionForExchange");
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __72__ESDConnection_isOofSettingsSupportedForAccountWithID_completionBlock___block_invoke;
    handler[3] = &unk_24ECAB320;
    v17 = v7;
    xpc_connection_send_message_with_reply(v12, v11, v13, handler);

  }
  else
  {
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224A56000, v14, v15, "nil accountID passed to isOofSettingsSupportedForAccountWithID. Cannot continue.", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __72__ESDConnection_isOofSettingsSupportedForAccountWithID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t v9[16];

  v3 = a2;
  if (MEMORY[0x227689088]() == MEMORY[0x24BDACFA0])
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2AEF0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "BOOLValue");
    }
    else
    {
      DALoggingwithCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_224A56000, v7, v8, "Error getting activesync device identifier", v9, 2u);
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
  os_log_type_t v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  id *v36;
  id v37;
  id *v38;
  id v39;
  NSObject *v41;
  os_log_type_t v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  NSObject *v49;
  ESDConnection *v50;
  id v51;
  _QWORD v52[2];
  _QWORD block[4];
  id v54;
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  v61 = 0;
  v47 = v15;
  if (!v15)
  {
    DALoggingwithCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    v28 = *(unsigned __int8 *)(MEMORY[0x24BE2AD38] + 4);
    if (os_log_type_enabled(v22, *(os_log_type_t *)(MEMORY[0x24BE2AD38] + 4)))
    {
      *(_DWORD *)buf = 138412290;
      v63 = 0;
      v24 = "Invalid 'accountID' provided: [%@].";
      v25 = v22;
      v26 = v28;
      v27 = 12;
      goto LABEL_9;
    }
LABEL_10:

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 93, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v16 || !v17 || objc_msgSend(v16, "compare:", v17) == 1)
  {
    DALoggingwithCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)buf = 138412546;
      v63 = v16;
      v64 = 2112;
      v65 = v17;
      v24 = "Invalid 'startDate' [%@] and/or 'endDate' [%@] provided.";
      v25 = v22;
      v26 = v23;
      v27 = 22;
LABEL_9:
      _os_log_impl(&dword_224A56000, v25, v26, v24, buf, v27);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v19 && objc_msgSend(v19, "count"))
  {
    DALoggingwithCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v41, v42))
    {
      *(_DWORD *)buf = 138413314;
      v63 = v47;
      v64 = 2112;
      v65 = v16;
      v66 = 2112;
      v67 = v17;
      v68 = 2112;
      v69 = v18;
      v70 = 2112;
      v71 = v19;
      _os_log_impl(&dword_224A56000, v41, v42, "Preparing calendar availability request.  accountID: [%@] startDate: [%@] endDate: [%@] ignoredEventID: [%@] addresses: [%@]", buf, 0x34u);
    }

    v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v43, "setObject:forKey:", *MEMORY[0x24BE2AFD8], *MEMORY[0x24BE2AF20]);
    objc_msgSend(v43, "setObject:forKey:", v47, *MEMORY[0x24BE2AD50]);
    objc_msgSend(v43, "setObject:forKey:", v16, *MEMORY[0x24BE2B060]);
    objc_msgSend(v43, "setObject:forKey:", v17, *MEMORY[0x24BE2AE68]);
    objc_msgSend(v43, "setObject:forKey:", v19, *MEMORY[0x24BE2AD78]);
    if (v18)
      objc_msgSend(v43, "setObject:forKey:", v18, *MEMORY[0x24BE2AEE0]);
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_131;
    v48[3] = &unk_24ECAB370;
    v52[1] = &v56;
    v51 = v20;
    v52[0] = v21;
    v35 = v43;
    v49 = v35;
    v50 = self;
    -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v35, v48);

    v37 = v21;
    v46 = v16;
    v32 = v19;
    v33 = v20;
    v34 = v18;
    v29 = 0;
    v36 = &v51;
    v38 = (id *)v52;
    goto LABEL_15;
  }
  DALoggingwithCategory();
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v44, v45))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224A56000, v44, v45, "No 'addresses' provided.", buf, 2u);
  }

  v29 = 0;
LABEL_11:
  DALoggingwithCategory();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
  if (os_log_type_enabled(v30, v31))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224A56000, v30, v31, "Will not issue calendar availability request.", buf, 2u);
  }

  if (v21)
  {
    v46 = v16;
    v32 = v19;
    v33 = v20;
    v34 = v18;
    dispatch_get_global_queue(0, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_24ECAB348;
    v36 = &v55;
    v37 = v21;
    v55 = v21;
    v38 = &v54;
    v29 = v29;
    v54 = v29;
    dispatch_async(v35, block);
LABEL_15:

    v18 = v34;
    v20 = v33;
    v19 = v32;
    v16 = v46;
    v21 = v37;

  }
  v39 = (id)v57[5];

  _Block_object_dispose(&v56, 8);
  return v39;
}

uint64_t __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_131(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  ESECalendarAvailabilityContext *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  ESECalendarAvailabilityContext *v14;
  _QWORD block[5];
  ESECalendarAvailabilityContext *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  ESECalendarAvailabilityContext *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE2ADD8]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = -[ESECalendarAvailabilityContext initWithResultsBlock:completionBlock:]([ESECalendarAvailabilityContext alloc], "initWithResultsBlock:completionBlock:", a1[6], a1[7]);
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    v10 = a1[4];
    *(_DWORD *)buf = 138412802;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_224A56000, v7, v8, "Received request ID [%@] for request with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
  }

  v11 = a1[5];
  v12 = *(NSObject **)(v11 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_133;
  block[3] = &unk_24ECAB208;
  v13 = a1[8];
  v16 = v6;
  v17 = v13;
  block[4] = v11;
  v14 = v6;
  dispatch_sync(v12, block);

}

uint64_t __130__ESDConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_133(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *muckingWithInFlightCollections;
  void *v10;
  os_log_type_t v11;
  _QWORD block[5];
  id v13;
  uint8_t *v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = *MEMORY[0x24BE2AE38];
    v7 = *MEMORY[0x24BE2ADD8];
    v21[0] = *MEMORY[0x24BE2AF20];
    v21[1] = v7;
    v22[0] = v6;
    v22[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v8, 0);
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__ESDConnection_cancelCalendarAvailabilityRequestWithID___block_invoke;
    block[3] = &unk_24ECAB120;
    v14 = buf;
    block[4] = self;
    v13 = v5;
    dispatch_sync(muckingWithInFlightCollections, block);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v16 + 5), "finishedWithError:", v10);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v8, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224A56000, v8, v11, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }

}

uint64_t __57__ESDConnection_cancelCalendarAvailabilityRequestWithID___block_invoke(_QWORD *a1)
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
  os_log_type_t v17;
  NSObject *muckingWithInFlightCollections;
  id v19;
  _QWORD block[5];
  id v21;
  __int128 *p_buf;
  id v23;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2ADD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2ADE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1620];
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v13, v7, &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v23;

  if (!v14)
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
    if (os_log_type_enabled(v16, v17))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_224A56000, v16, v17, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ESDConnection__calendarAvailabilityRequestReturnedResults___block_invoke;
  block[3] = &unk_24ECAB120;
  p_buf = &buf;
  block[4] = self;
  v19 = v6;
  v21 = v19;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "resultsReturned:", v14);

  _Block_object_dispose(&buf, 8);
}

void __61__ESDConnection__calendarAvailabilityRequestReturnedResults___block_invoke(_QWORD *a1)
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
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2ADD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ESDConnection__calendarAvailabilityRequestFinished___block_invoke;
  block[3] = &unk_24ECAB120;
  v13 = &v14;
  block[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v15[5], "finishedWithError:", v8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __54__ESDConnection__calendarAvailabilityRequestFinished___block_invoke(_QWORD *a1)
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
  os_log_type_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id *v27;
  id *v28;
  NSObject *v29;
  os_log_type_t v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  os_log_type_t v35;
  id v36;
  _QWORD v38[4];
  NSObject *v39;
  ESDConnection *v40;
  id v41;
  _QWORD v42[2];
  _QWORD block[4];
  id v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  v51 = 0;
  if (v14)
  {
    if (v15 && objc_msgSend(v15, "count"))
    {
      if (v16 && objc_msgSend(v16, "count"))
      {
        DALoggingwithCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)buf = 138413058;
          v53 = v14;
          v54 = 2112;
          v55 = v16;
          v56 = 2048;
          v57 = a6;
          v58 = 2112;
          v59 = v15;
          _os_log_impl(&dword_224A56000, v19, v20, "Preparing calendar directory search.  accountID: [%@] recordTypes:[%@] resultLimit: [%lu] terms: [%@]", buf, 0x2Au);
        }

        v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v21, "setObject:forKey:", *MEMORY[0x24BE2AF78], *MEMORY[0x24BE2AF20]);
        objc_msgSend(v21, "setObject:forKey:", v14, *MEMORY[0x24BE2AD50]);
        objc_msgSend(v15, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v22, *MEMORY[0x24BE2AE28]);

        objc_msgSend(v16, "allObjects");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v23, *MEMORY[0x24BE2AE08]);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v24, *MEMORY[0x24BE2AE10]);

        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_135;
        v38[3] = &unk_24ECAB370;
        v42[1] = &v46;
        v41 = v17;
        v42[0] = v18;
        v25 = v21;
        v39 = v25;
        v40 = self;
        -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v25, v38);

        v26 = 0;
        v27 = &v41;
        v28 = (id *)v42;
        goto LABEL_22;
      }
      DALoggingwithCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
      if (!os_log_type_enabled(v29, v30))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v31 = "No 'recordTypes' provided.";
    }
    else
    {
      DALoggingwithCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
      if (!os_log_type_enabled(v29, v30))
      {
LABEL_17:

        v26 = 0;
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v31 = "No 'terms' provided.";
    }
    _os_log_impl(&dword_224A56000, v29, v30, v31, buf, 2u);
    goto LABEL_17;
  }
  DALoggingwithCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
  if (os_log_type_enabled(v32, v33))
  {
    *(_DWORD *)buf = 138412290;
    v53 = 0;
    _os_log_impl(&dword_224A56000, v32, v33, "Invalid 'accountID' provided: [%@].", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 93, 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  DALoggingwithCategory();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
  if (os_log_type_enabled(v34, v35))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224A56000, v34, v35, "Will not issue calendar directory search.", buf, 2u);
  }

  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_24ECAB348;
    v27 = &v45;
    v45 = v18;
    v28 = &v44;
    v26 = v26;
    v44 = v26;
    dispatch_async(v25, block);
LABEL_22:

  }
  v36 = (id)v47[5];

  _Block_object_dispose(&v46, 8);
  return v36;
}

uint64_t __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_135(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  ESECalendarDirectorySearchContext *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  ESECalendarDirectorySearchContext *v14;
  _QWORD block[5];
  ESECalendarDirectorySearchContext *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  ESECalendarDirectorySearchContext *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE00]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = -[ESECalendarDirectorySearchContext initWithResultsBlock:completionBlock:]([ESECalendarDirectorySearchContext alloc], "initWithResultsBlock:completionBlock:", a1[6], a1[7]);
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    v10 = a1[4];
    *(_DWORD *)buf = 138412802;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_224A56000, v7, v8, "Received search ID [%@] for search with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
  }

  v11 = a1[5];
  v12 = *(NSObject **)(v11 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_137;
  block[3] = &unk_24ECAB208;
  v13 = a1[8];
  v16 = v6;
  v17 = v13;
  block[4] = v11;
  v14 = v6;
  dispatch_sync(v12, block);

}

uint64_t __120__ESDConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_137(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 88), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  os_log_type_t v14;
  _QWORD block[5];
  id v16;
  uint8_t *v17;
  uint8_t v18[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = *MEMORY[0x24BE2AE40];
    v7 = *MEMORY[0x24BE2AE00];
    v26[0] = *MEMORY[0x24BE2AF20];
    v26[1] = v7;
    v27[0] = v6;
    v27[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v8, 0);
    *(_QWORD *)v18 = 0;
    v19 = v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__ESDConnection_cancelCalendarDirectorySearchWithID___block_invoke;
    block[3] = &unk_24ECAB120;
    v17 = v18;
    block[4] = self;
    v10 = v5;
    v16 = v10;
    dispatch_sync(muckingWithInFlightCollections, block);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v19 + 5), "finishedWithError:exceededResultLimit:", v11, 0);
    DALoggingwithCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_224A56000, v12, v13, "Cancelled calendar directory search with ID: [%@].", buf, 0xCu);
    }

    _Block_object_dispose(v18, 8);
  }
  else
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v8, v14))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_224A56000, v8, v14, "nil 'searchID' provided.  Will not cancel any calendar directory searches.", v18, 2u);
    }
  }

}

uint64_t __53__ESDConnection_cancelCalendarDirectorySearchWithID___block_invoke(_QWORD *a1)
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
  os_log_type_t v17;
  NSObject *muckingWithInFlightCollections;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD block[5];
  id v26;
  __int128 *p_buf;
  id v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1620];
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v13, v7, &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;

  if (!v14)
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
    if (os_log_type_enabled(v16, v17))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_224A56000, v16, v17, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  v19 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ESDConnection__calendarDirectorySearchReturnedResults___block_invoke;
  block[3] = &unk_24ECAB120;
  p_buf = &buf;
  block[4] = self;
  v20 = v6;
  v26 = v20;
  dispatch_sync(muckingWithInFlightCollections, block);
  v21 = objc_msgSend(v14, "count");
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __57__ESDConnection__calendarDirectorySearchReturnedResults___block_invoke_2;
  v23[3] = &unk_24ECAB398;
  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v21);
  v24 = v22;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v23);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "resultsReturned:", v22);

  _Block_object_dispose(&buf, 8);
}

void __57__ESDConnection__calendarDirectorySearchReturnedResults___block_invoke(_QWORD *a1)
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

void __57__ESDConnection__calendarDirectorySearchReturnedResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BDBCF20];
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
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AE70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ESDConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2ADF0]);
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ESDConnection__calendarDirectorySearchFinished___block_invoke;
  block[3] = &unk_24ECAB120;
  v16 = &v17;
  block[4] = self;
  v13 = v6;
  v15 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v18[5], "finishedWithError:exceededResultLimit:", v8, v11);

  _Block_object_dispose(&v17, 8);
}

uint64_t __50__ESDConnection__calendarDirectorySearchFinished___block_invoke(_QWORD *a1)
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
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD v16[8];
  uint8_t buf[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = -1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  if (v7)
  {
    if (v6)
    {
      v8 = *MEMORY[0x24BE2AFC8];
      v9 = *MEMORY[0x24BE2AD50];
      v40[0] = *MEMORY[0x24BE2AF20];
      v40[1] = v9;
      v41[0] = v8;
      v41[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __65__ESDConnection_externalIdentificationForAccountID_resultsBlock___block_invoke;
      v16[3] = &unk_24ECAB3C0;
      v16[4] = &v34;
      v16[5] = &v28;
      v16[6] = &v24;
      v16[7] = &v18;
      -[ESDConnection _sendSynchronousXPCMessageWithParameters:handlerBlock:](self, "_sendSynchronousXPCMessageWithParameters:handlerBlock:", v10, v16);
    }
    else
    {
      DALoggingwithCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224A56000, v13, v14, "No accountID provided.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 93, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v35[5];
      v35[5] = v15;
    }

    v7[2](v7, v35[5], v29[5], v25[3], v19[5]);
  }
  else
  {
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224A56000, v11, v12, "No results block provided.", buf, 2u);
    }

  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void __65__ESDConnection_externalIdentificationForAccountID_resultsBlock___block_invoke(_QWORD *a1, void *a2)
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
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE2AD60]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE2AD68]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v6, "integerValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE2AD58]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = a1[7];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 28, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
  }
  v9 = *(_QWORD *)(v8 + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

}

- (ESDConnection)init
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Should never call -init on DADConnection.  Use +sharedConnection... instead."), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

  return 0;
}

- (id)_init
{
  ESDConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *muckingWithConn;
  dispatch_queue_t v5;
  OS_dispatch_queue *muckingWithInFlightCollections;
  uint64_t v7;
  NSMutableSet *accountIdsWithAlreadyResetCerts;
  uint64_t v9;
  NSMutableSet *accountIdsWithAlreadyResetThrottleTimers;
  uint64_t v11;
  NSMutableDictionary *inFlightSearchQueries;
  uint64_t v13;
  NSMutableDictionary *inFlightFolderChanges;
  uint64_t v15;
  NSMutableDictionary *inFlightAttachmentDownloads;
  uint64_t v17;
  NSMutableDictionary *inFlightCalendarAvailabilityRequests;
  uint64_t v19;
  NSMutableDictionary *inFlightCalendarDirectorySearches;
  uint64_t v21;
  NSMutableDictionary *inFlightShareRequests;
  uint64_t v23;
  NSMutableDictionary *inFlightOofSettingsRequests;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)ESDConnection;
  v2 = -[ESDConnection init](&v26, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.dataaccess.muckingWithConn", 0);
    muckingWithConn = v2->_muckingWithConn;
    v2->_muckingWithConn = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.dataaccess.muckingWithInFlightCollections", 0);
    muckingWithInFlightCollections = v2->_muckingWithInFlightCollections;
    v2->_muckingWithInFlightCollections = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    accountIdsWithAlreadyResetCerts = v2->_accountIdsWithAlreadyResetCerts;
    v2->_accountIdsWithAlreadyResetCerts = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    accountIdsWithAlreadyResetThrottleTimers = v2->_accountIdsWithAlreadyResetThrottleTimers;
    v2->_accountIdsWithAlreadyResetThrottleTimers = (NSMutableSet *)v9;

    v11 = objc_opt_new();
    inFlightSearchQueries = v2->_inFlightSearchQueries;
    v2->_inFlightSearchQueries = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    inFlightFolderChanges = v2->_inFlightFolderChanges;
    v2->_inFlightFolderChanges = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    inFlightAttachmentDownloads = v2->_inFlightAttachmentDownloads;
    v2->_inFlightAttachmentDownloads = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    inFlightCalendarAvailabilityRequests = v2->_inFlightCalendarAvailabilityRequests;
    v2->_inFlightCalendarAvailabilityRequests = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    inFlightCalendarDirectorySearches = v2->_inFlightCalendarDirectorySearches;
    v2->_inFlightCalendarDirectorySearches = (NSMutableDictionary *)v19;

    v21 = objc_opt_new();
    inFlightShareRequests = v2->_inFlightShareRequests;
    v2->_inFlightShareRequests = (NSMutableDictionary *)v21;

    v23 = objc_opt_new();
    inFlightOofSettingsRequests = v2->_inFlightOofSettingsRequests;
    v2->_inFlightOofSettingsRequests = (NSMutableDictionary *)v23;

    -[ESDConnection _registerForAppResumedNotification](v2, "_registerForAppResumedNotification");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ESDConnection _tearDownInFlightObjects](self, "_tearDownInFlightObjects");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ESDConnection;
  -[ESDConnection dealloc](&v4, sel_dealloc);
}

- (void)_resetCertWarningsForAccountId:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  NSMutableSet *accountIdsWithAlreadyResetCerts;
  ESDConnection *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  id *v18;
  uint64_t v19;
  _QWORD v20[3];
  uint8_t buf[4];
  NSMutableSet *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v9, v10))
  {
    accountIdsWithAlreadyResetCerts = self->_accountIdsWithAlreadyResetCerts;
    *(_DWORD *)buf = 138412290;
    v22 = accountIdsWithAlreadyResetCerts;
    _os_log_impl(&dword_224A56000, v9, v10, "in _resetCertWarningsForAccount, _accountIdsWithAlreadyResetCerts is %@", buf, 0xCu);
  }

  v12 = self;
  objc_sync_enter(v12);
  if (v8)
    v13 = -[NSMutableSet containsObject:](v12->_accountIdsWithAlreadyResetCerts, "containsObject:", v8) ^ 1;
  else
    v13 = 0;
  objc_sync_exit(v12);

  if (((v8 != 0) & (v13 | v5)) == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4, *MEMORY[0x24BE2AF20], *MEMORY[0x24BE2AD50], *MEMORY[0x24BE2AE58], *MEMORY[0x24BE2B000], v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](v12, "_connectionForExchange");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v17, v16);

    v18 = v12;
    objc_sync_enter(v18);
    objc_msgSend(v18[4], "addObject:", v8);
    objc_sync_exit(v18);

  }
}

- (void)_resetThrottleTimersForAccountId:(id)a3
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *Name;
  NSMutableSet *accountIdsWithAlreadyResetThrottleTimers;
  ESDConnection *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _xpc_connection_s *v16;
  ESDConnection *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSMutableSet *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v6, v7))
  {
    Name = sel_getName(a2);
    accountIdsWithAlreadyResetThrottleTimers = self->_accountIdsWithAlreadyResetThrottleTimers;
    *(_DWORD *)buf = 136315394;
    v21 = Name;
    v22 = 2112;
    v23 = accountIdsWithAlreadyResetThrottleTimers;
    _os_log_impl(&dword_224A56000, v6, v7, "in %s, _accountIdsWithAlreadyResetThrottleTimers is %@", buf, 0x16u);
  }

  v10 = self;
  objc_sync_enter(v10);
  if (!v5)
  {
    objc_sync_exit(v10);
    v14 = v10;
    goto LABEL_7;
  }
  v11 = -[NSMutableSet containsObject:](v10->_accountIdsWithAlreadyResetThrottleTimers, "containsObject:", v5);
  objc_sync_exit(v10);

  if ((v11 & 1) == 0)
  {
    v12 = *MEMORY[0x24BE2B008];
    v13 = *MEMORY[0x24BE2AD50];
    v18[0] = *MEMORY[0x24BE2AF20];
    v18[1] = v13;
    v19[0] = v12;
    v19[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[ESDConnection _connectionForExchange](v10, "_connectionForExchange");
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v16, v15);

    v17 = v10;
    objc_sync_enter(v17);
    -[NSMutableSet addObject:](v10->_accountIdsWithAlreadyResetThrottleTimers, "addObject:", v5);
    objc_sync_exit(v17);

LABEL_7:
  }

}

- (void)resetTimersAndWarnings
{
  NSObject *v3;
  os_log_type_t v4;
  ESDConnection *v5;
  uint8_t v6[16];

  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_224A56000, v3, v4, "Resetting shouldResetCertWarnings and throttle timers", v6, 2u);
  }

  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableSet removeAllObjects](v5->_accountIdsWithAlreadyResetCerts, "removeAllObjects");
  -[NSMutableSet removeAllObjects](v5->_accountIdsWithAlreadyResetThrottleTimers, "removeAllObjects");
  objc_sync_exit(v5);

}

- (void)_registerForAppResumedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_resetTimersAndWarnings, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

}

- (void)_dispatchMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2AF20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AEB0]))
  {
    -[ESDConnection _foldersUpdated:](self, "_foldersUpdated:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AF90]))
  {
    -[ESDConnection _policyKeyChanged:](self, "_policyKeyChanged:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AF00]))
  {
    -[ESDConnection _logDataAccessStatus:](self, "_logDataAccessStatus:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2B038]))
  {
    -[ESDConnection _serverContactsSearchQueryFinished:](self, "_serverContactsSearchQueryFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AE88]))
  {
    -[ESDConnection _folderChangeFinished:](self, "_folderChangeFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AED0]))
  {
    -[ESDConnection _getStatusReportsFromClient:](self, "_getStatusReportsFromClient:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2ADA8]))
  {
    -[ESDConnection _downloadProgress:](self, "_downloadProgress:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AD98]))
  {
    -[ESDConnection _downloadFinished:](self, "_downloadFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AE30]))
  {
    -[ESDConnection _shareResponseFinished:](self, "_shareResponseFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AF58]))
  {
    -[ESDConnection _oofSettingsRequestsFinished:](self, "_oofSettingsRequestsFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2ADE0]))
  {
    -[ESDConnection _calendarAvailabilityRequestReturnedResults:](self, "_calendarAvailabilityRequestReturnedResults:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2ADD0]))
  {
    -[ESDConnection _calendarAvailabilityRequestFinished:](self, "_calendarAvailabilityRequestFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2AE20]))
  {
    -[ESDConnection _calendarDirectorySearchReturnedResults:](self, "_calendarDirectorySearchReturnedResults:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2ADF8]))
  {
    -[ESDConnection _calendarDirectorySearchFinished:](self, "_calendarDirectorySearchFinished:", v4);
  }
  else
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_224A56000, v7, v8, "unknown request sent to connection.", (uint8_t *)&v10, 2u);
    }

    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_224A56000, v9, v8, "request: %@", (uint8_t *)&v10, 0xCu);
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
  objc_storeStrong((id *)&self->_connExchange, 0);
}

@end
