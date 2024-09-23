@implementation CMContinuityCaptureRapportTransportBase

- (CMContinuityCaptureRapportTransportBase)initWithRapportDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CMContinuityCaptureRapportTransportBase *v12;
  CMContinuityCaptureRapportTransportBase *v13;
  CMContinuityCaptureRapportTransportBase *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCaptureRapportTransportBase;
  v12 = -[CMContinuityCaptureRapportTransportBase init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v13->_device, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_clockIdentifier = *MEMORY[0x24BEB70E0];
    v14 = v13;
  }

  return v13;
}

- (void)setIncomingStreamRequestHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id incomingStreamRequestHandler;
  CMContinuityCaptureRapportTransportBase *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  v5 = MEMORY[0x22E2A7CB0](v4);

  incomingStreamRequestHandler = obj->_incomingStreamRequestHandler;
  obj->_incomingStreamRequestHandler = (id)v5;

  objc_sync_exit(obj);
}

- (id)incomingStreamRequestHandler
{
  CMContinuityCaptureRapportTransportBase *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x22E2A7CB0](v2->_incomingStreamRequestHandler);
  objc_sync_exit(v2);

  v4 = (void *)MEMORY[0x22E2A7CB0](v3);
  return v4;
}

- (void)resetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void)setTaskDelegate:(id)a3
{
  id obj;

  obj = a3;
  if (-[CMContinuityCaptureTransportRapportDevice remote](self->_device, "remote"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ ContinuityCapture error : can't update task delegate for client"), self);
  objc_storeWeak((id *)&self->_delegate, obj);

}

- (void)enqueueResponse:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__CMContinuityCaptureRapportTransportBase_enqueueResponse_identifier___block_invoke;
  v11[3] = &unk_24F06AF00;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureRapportTransportBase_enqueueResponse_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_enqueueResponse:identifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_enqueueResponse:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  char isKindOfClass;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  void *v40;
  unsigned int v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  char v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  char v63;
  void *v64;
  char v65;
  void *v66;
  unsigned int v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  char v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned int v78;
  NSObject *v79;
  void *v80;
  char v81;
  void *v82;
  char v83;
  void *v84;
  char v85;
  NSObject *v86;
  void *v87;
  int v88;
  void *v89;
  int v90;
  void *v91;
  void (**v92)(_QWORD, _QWORD);
  void *v93;
  unsigned int v94;
  void *v95;
  unsigned int v96;
  void *v97;
  char v98;
  void *v99;
  char v100;
  void *v101;
  void *v102;
  unsigned int v103;
  NSObject *v104;
  void *v105;
  char v106;
  void *v107;
  char v108;
  NSObject *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  unsigned int v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  void *v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  id v124;
  id v125;
  _QWORD v126[4];
  id v127;
  id v128;
  _QWORD v129[4];
  id v130;
  id v131;
  id v132;
  _QWORD v133[4];
  id v134;
  id v135[2];
  id v136;
  id location;
  const __CFString *v138;
  void *v139;
  uint8_t buf[4];
  CMContinuityCaptureRapportTransportBase *v141;
  __int16 v142;
  _BYTE v143[10];
  unint64_t v144;
  __int16 v145;
  void *v146;
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureArgs"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (v11)
        goto LABEL_22;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_22;
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureGID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v141 = self;
        v142 = 2114;
        *(_QWORD *)v143 = v7;
        *(_WORD *)&v143[8] = 2114;
        v144 = (unint64_t)v15;
        v145 = 2114;
        v146 = v16;
        _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueResponse identifier:%{public}@ selector %{public}@ gid %{public}@", buf, 0x2Au);

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureArgs"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureArgs"));
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("ContinuityCaptureCommand")))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "unsignedIntegerValue");

          v9 = 0;
          v22 = v21 - 1;
          v23 = 0;
          v24 = 0;
          switch(v22)
          {
            case 0:
              if (objc_msgSend(v19, "count") != 3)
                goto LABEL_23;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v26 = objc_opt_isKindOfClass();

              if ((v26 & 1) == 0)
                goto LABEL_23;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v28 = objc_opt_isKindOfClass();

              if ((v28 & 1) == 0)
                goto LABEL_23;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v30 = objc_opt_isKindOfClass();

              if ((v30 & 1) == 0 || -[CMContinuityCaptureTransportRapportDevice remote](self->_device, "remote"))
                goto LABEL_23;
              v31 = (void *)MEMORY[0x24BDD1620];
              v32 = objc_opt_class();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v132 = 0;
              objc_msgSend(v31, "unarchivedObjectOfClass:fromData:error:", v32, v33, &v132);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v132;

              if (v34)
              {
                CMContinuityCaptureLog(2);
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "unsignedIntValue");
                  *(_DWORD *)buf = 138543874;
                  v141 = self;
                  v142 = 2114;
                  *(_QWORD *)v143 = v34;
                  *(_WORD *)&v143[8] = 1024;
                  LODWORD(v144) = v37;
                  _os_log_impl(&dword_227C5D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Configuration %{public}@ option %u", buf, 0x1Cu);

                }
                -[CMContinuityCaptureRapportTransportBase incomingStreamRequestHandler](self, "incomingStreamRequestHandler");
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (v38)
                {
                  -[CMContinuityCaptureRapportTransportBase incomingStreamRequestHandler](self, "incomingStreamRequestHandler");
                  v39 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  v39[2](v39, 1);

                }
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "unsignedIntValue");
                v129[0] = MEMORY[0x24BDAC760];
                v129[1] = 3221225472;
                v129[2] = __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke_347;
                v129[3] = &unk_24F06B500;
                objc_copyWeak(&v131, &location);
                v42 = v34;
                v130 = v42;
                objc_msgSend(WeakRetained, "startStream:option:completion:", v42, v41, v129);

                objc_destroyWeak(&v131);
              }
              else
              {
                CMContinuityCaptureLog(2);
                v123 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
                  -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.2();

              }
              goto LABEL_61;
            case 1:
              if (objc_msgSend(v19, "count") == 3)
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v81 = objc_opt_isKindOfClass();

                if ((v81 & 1) != 0)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v83 = objc_opt_isKindOfClass();

                  if ((v83 & 1) != 0)
                  {
                    objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v85 = objc_opt_isKindOfClass();

                    if ((v85 & 1) != 0 && !-[CMContinuityCaptureTransportRapportDevice remote](self->_device, "remote"))
                    {
                      CMContinuityCaptureLog(2);
                      v86 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        v88 = objc_msgSend(v87, "unsignedIntValue");
                        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                        v89 = (void *)objc_claimAutoreleasedReturnValue();
                        v90 = objc_msgSend(v89, "unsignedIntValue");
                        *(_DWORD *)buf = 138543874;
                        v141 = self;
                        v142 = 1024;
                        *(_DWORD *)v143 = v88;
                        *(_WORD *)&v143[4] = 1024;
                        *(_DWORD *)&v143[6] = v90;
                        _os_log_impl(&dword_227C5D000, v86, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream entity %u option %u", buf, 0x18u);

                      }
                      -[CMContinuityCaptureRapportTransportBase incomingStreamRequestHandler](self, "incomingStreamRequestHandler");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v91)
                      {
                        -[CMContinuityCaptureRapportTransportBase incomingStreamRequestHandler](self, "incomingStreamRequestHandler");
                        v92 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                        v92[2](v92, 0);

                      }
                      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      v94 = objc_msgSend(v93, "unsignedIntValue");
                      objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      v96 = objc_msgSend(v95, "unsignedIntValue");
                      v126[0] = MEMORY[0x24BDAC760];
                      v126[1] = 3221225472;
                      v126[2] = __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke_348;
                      v126[3] = &unk_24F06B500;
                      objc_copyWeak(&v128, &location);
                      v19 = v19;
                      v127 = v19;
                      objc_msgSend(WeakRetained, "stopStream:option:completion:", v94, v96, v126);

                      objc_destroyWeak(&v128);
                    }
                  }
                }
              }
              goto LABEL_23;
            case 2:
              if (!v19)
                goto LABEL_23;
              if (objc_msgSend(v19, "count") != 2)
                goto LABEL_23;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v106 = objc_opt_isKindOfClass();

              if ((v106 & 1) == 0)
                goto LABEL_23;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v108 = objc_opt_isKindOfClass();

              if ((v108 & 1) == 0)
                goto LABEL_23;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v9, "isEqualToString:", CFSTR("kCMContinuityCaptureEventConnectionDisconnect")))
              {
                CMContinuityCaptureLog(2);
                v109 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v141 = self;
                  v142 = 2114;
                  *(_QWORD *)v143 = WeakRetained;
                  _os_log_impl(&dword_227C5D000, v109, OS_LOG_TYPE_DEFAULT, "%{public}@ Session Interrupted for %{public}@", buf, 0x16u);
                }

                v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1009, 0);
                objc_msgSend(WeakRetained, "connectionInterrupted:forDevice:", v110, self->_device);

              }
              else
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                v114 = objc_msgSend(v113, "unsignedIntValue");
                v138 = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                v139 = v115;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "postEvent:entity:data:", v9, v114, v116);

              }
              goto LABEL_24;
            case 3:
              if (objc_msgSend(v19, "count"))
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v111 = 0;
              }
              if ((unint64_t)objc_msgSend(v19, "count") < 2)
              {
                v117 = 0;
              }
              else
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
              }
              if ((unint64_t)objc_msgSend(v19, "count") < 3)
              {
                v118 = 0;
              }
              else
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
                v118 = (void *)objc_claimAutoreleasedReturnValue();
              }
              CMContinuityCaptureLog(2);
              v119 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v118, "unsignedLongLongValue"));
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v141 = self;
                v142 = 2112;
                *(_QWORD *)v143 = v111;
                *(_WORD *)&v143[8] = 2112;
                v144 = (unint64_t)v117;
                v145 = 2112;
                v146 = v120;
                _os_log_impl(&dword_227C5D000, v119, OS_LOG_TYPE_DEFAULT, "%{public}@ Received synchronize audio clock with sampleTime %@ networkTime %@ grandmaster %@", buf, 0x2Au);

              }
              objc_msgSend(WeakRetained, "synchronizeAudioClockWithSampleTime:networkTime:clockGrandMasterIdentifier:", objc_msgSend(v111, "unsignedLongLongValue"), objc_msgSend(v117, "unsignedLongLongValue"), objc_msgSend(v118, "unsignedLongLongValue"));

              goto LABEL_23;
            case 4:
              CMContinuityCaptureLog(2);
              v112 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v141 = self;
                _os_log_impl(&dword_227C5D000, v112, OS_LOG_TYPE_DEFAULT, "%{public}@ SynchronizeAudioClockComplete", buf, 0xCu);
              }

              objc_msgSend(WeakRetained, "handleSynchronizeAudioClockCompletion");
              goto LABEL_23;
            case 5:
              if (!v19)
                goto LABEL_23;
              if (objc_msgSend(v19, "count") != 2)
                goto LABEL_23;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v70 = objc_opt_isKindOfClass();

              if ((v70 & 1) == 0)
                goto LABEL_23;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v72 = objc_opt_isKindOfClass();

              if ((v72 & 1) == 0)
                goto LABEL_23;
              v73 = (void *)MEMORY[0x24BDD1620];
              v74 = objc_opt_class();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v136 = 0;
              objc_msgSend(v73, "unarchivedObjectOfClass:fromData:error:", v74, v75, &v136);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v136;

              if (v76)
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v77, "unsignedIntValue");

                CMContinuityCaptureLog(2);
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  v141 = self;
                  v142 = 2112;
                  *(_QWORD *)v143 = v76;
                  *(_WORD *)&v143[8] = 2048;
                  v144 = v78;
                  _os_log_impl(&dword_227C5D000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@ CaptureStillImage %@ entity %ld", buf, 0x20u);
                }

                v133[0] = MEMORY[0x24BDAC760];
                v133[1] = 3221225472;
                v133[2] = __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke;
                v133[3] = &unk_24F06BB60;
                objc_copyWeak(v135, &location);
                v134 = v76;
                v135[1] = (id)v78;
                objc_msgSend(WeakRetained, "captureStillImage:entity:completion:", v134, v78, v133);

                objc_destroyWeak(v135);
              }
              else
              {
                CMContinuityCaptureLog(2);
                v122 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                  -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.1();

              }
              goto LABEL_61;
            case 6:
            case 7:
              goto LABEL_26;
            case 8:
              if (v19)
              {
                if (objc_msgSend(v19, "count") == 2)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v98 = objc_opt_isKindOfClass();

                  if ((v98 & 1) != 0)
                  {
                    objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v100 = objc_opt_isKindOfClass();

                    if ((v100 & 1) != 0)
                    {
                      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      v103 = objc_msgSend(v102, "unsignedIntValue");

                      CMContinuityCaptureLog(2);
                      v104 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543874;
                        v141 = self;
                        v142 = 2112;
                        *(_QWORD *)v143 = v101;
                        *(_WORD *)&v143[8] = 2048;
                        v144 = v103;
                        _os_log_impl(&dword_227C5D000, v104, OS_LOG_TYPE_DEFAULT, "%{public}@ EnqueueReactionEffect %@ entity %ld", buf, 0x20u);
                      }

                      objc_msgSend(WeakRetained, "enqueueReactionEffect:entity:", v101, v103);
                    }
                  }
                }
              }
              goto LABEL_23;
            default:
              goto LABEL_47;
          }
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("ContinuityCaptureControl")))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "unsignedIntegerValue");

          if (v44 == 2)
          {
            if (objc_msgSend(v19, "count") == 2)
            {
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v63 = objc_opt_isKindOfClass();

              if ((v63 & 1) != 0)
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v65 = objc_opt_isKindOfClass();

                if ((v65 & 1) != 0)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = objc_msgSend(v66, "unsignedIntValue");
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(WeakRetained, "handleAVCNegotiation:data:", v67, v68);

                }
              }
            }
          }
          else if (v44 == 1)
          {
            if (v19)
            {
              if (objc_msgSend(v19, "count") == 1)
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v46 = objc_opt_isKindOfClass();

                if ((v46 & 1) != 0)
                {
                  v47 = (void *)MEMORY[0x24BDD1620];
                  v48 = objc_opt_class();
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v125 = 0;
                  objc_msgSend(v47, "unarchivedObjectOfClass:fromData:error:", v48, v49, &v125);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = v125;

                  if (v24)
                  {
                    CMContinuityCaptureLog(2);
                    v50 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v141 = self;
                      v142 = 2114;
                      *(_QWORD *)v143 = v24;
                      _os_log_impl(&dword_227C5D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@", buf, 0x16u);
                    }

                    objc_msgSend(WeakRetained, "setValueForControl:completion:", v24, &__block_literal_global_351);
                    v9 = 0;
                    goto LABEL_26;
                  }
                  CMContinuityCaptureLog(2);
                  v121 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
                    -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.2();

                  goto LABEL_61;
                }
              }
            }
          }
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ContinuityCaptureData")))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "unsignedIntegerValue");

          v9 = 0;
          if (v52 || !v19)
          {
LABEL_47:
            v23 = 0;
            v24 = 0;
            goto LABEL_26;
          }
          if (objc_msgSend(v19, "count") == 2)
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v54 = objc_opt_isKindOfClass();

            if ((v54 & 1) != 0)
            {
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v56 = objc_opt_isKindOfClass();

              if ((v56 & 1) != 0)
              {
                v57 = (void *)MEMORY[0x24BDD1620];
                v58 = objc_opt_class();
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = 0;
                objc_msgSend(v57, "unarchivedObjectOfClass:fromData:error:", v58, v59, &v124);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v124;

                if (v60)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v61 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(WeakRetained, "didCaptureStillImage:entity:", v60, -[NSObject unsignedIntValue](v61, "unsignedIntValue"));
                }
                else
                {
                  CMContinuityCaptureLog(2);
                  v61 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                    -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.4();
                }

LABEL_61:
                v9 = 0;
                goto LABEL_25;
              }
            }
          }
        }
      }
      else
      {
LABEL_22:
        v19 = 0;
      }
LABEL_23:
      v9 = 0;
    }
    else
    {
      v19 = 0;
    }
LABEL_24:
    v23 = 0;
LABEL_25:
    v24 = 0;
LABEL_26:
    objc_destroyWeak(&location);

    goto LABEL_27;
  }
  v19 = 0;
  v9 = 0;
  v23 = 0;
LABEL_27:

}

void __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
    objc_msgSend(v5[3], "didCaptureStillImage:entity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    WeakRetained = v5;
  }

}

void __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke_347(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543874;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream %@ Error %@", (uint8_t *)&v7, 0x20u);

  }
}

void __71__CMContinuityCaptureRapportTransportBase__enqueueResponse_identifier___block_invoke_348(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream for Identifier %@ Error %@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)createTimeSyncClockWithPeerAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BOOL v18;
  _BYTE buf[12];
  __int16 v20;
  id v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[CMContinuityCaptureTransportRapportDevice deviceModelType](self->_device, "deviceModelType");
  CMContinuityCaptureLog(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543875;
    *(_QWORD *)&buf[4] = self;
    v20 = 2113;
    v21 = v6;
    v22 = 2048;
    v23 = v8;
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ create timesync for %{private}@ remoteType %ld", buf, 0x20u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v10 = FigGetCFPreferenceBooleanWithDefault() != 0;
  v11 = (void *)MEMORY[0x24BEB70C0];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke;
  v14[3] = &unk_24F06D0D0;
  objc_copyWeak(&v17, (id *)buf);
  v12 = v7;
  v16 = v12;
  v18 = v10;
  v13 = v6;
  v15 = v13;
  objc_msgSend(v11, "notifyWhenClockManagerIsAvailable:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = WeakRetained;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ TSClockManager is Available", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BEB70C0], "sharedClockManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addClient:", WeakRetained);

    objc_msgSend(MEMORY[0x24BEB70C0], "sharedClockManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "addgPTPServicesWithError:", &v18);
    v7 = v18;

    if (v7)
    {
      CMContinuityCaptureLog(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_cold_1((uint64_t)WeakRetained, v7, v8);

      v9 = WeakRetained[1];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_357;
      block[3] = &unk_24F06CA08;
      v17 = *(id *)(a1 + 40);
      dispatch_async(v9, block);

    }
    else
    {
      v10 = (void *)MEMORY[0x24BEB70D0];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2;
      v11[3] = &unk_24F06D0D0;
      objc_copyWeak(&v14, v2);
      v15 = *(_BYTE *)(a1 + 56);
      v13 = *(id *)(a1 + 40);
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v10, "notifyWhengPTPManagerIsAvailable:", v11);

      objc_destroyWeak(&v14);
    }

  }
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_357(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870212, 0);
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD *v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    *(_DWORD *)buf = 138543362;
    v25 = WeakRetained;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ gPTPManager is Available", buf, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v4)
  {
    v23 = *MEMORY[0x24BEB70E0];
    v5 = *(_BYTE *)(a1 + 56) == 0;
    objc_msgSend(MEMORY[0x24BEB70D0], "sharedgPTPManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v5)
    {
      v8 = objc_msgSend(v6, "systemDomainClockIdentifier");
      v23 = v8;

      CMContinuityCaptureLog(2);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_loadWeakRetained((id *)(a1 + 48));
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Using system domain clock", buf, 0xCu);

      }
LABEL_8:
      v11 = *(_QWORD *)(a1 + 32);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_360;
      v17[3] = &unk_24F06D0A8;
      objc_copyWeak(&v19, (id *)(a1 + 48));
      v18 = *(id *)(a1 + 40);
      objc_msgSend(v4, "_bindClock:peerAddress:retries:completion:", v8, v11, 10, v17);

      objc_destroyWeak(&v19);
      goto LABEL_13;
    }
    v22 = 0;
    objc_msgSend(v6, "addPTPInstance:error:", &v23, &v22);
    v12 = v22;

    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_loadWeakRetained((id *)(a1 + 48));
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        v26 = 2048;
        v27 = v23;
        _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Allocated clock %llu", buf, 0x16u);

      }
      v8 = v23;
      v4[4] = v23;
      goto LABEL_8;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_cold_1((id *)(a1 + 48), v12, v14);

    v15 = v4[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_359;
    block[3] = &unk_24F06CA08;
    v21 = *(id *)(a1 + 40);
    dispatch_async(v15, block);

  }
LABEL_13:

}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_359(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870212, 0);
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_360(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_361;
    block[3] = &unk_24F06D080;
    v8 = v3;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
  }

}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_361(uint64_t a1)
{
  CMContinuityCaptureTimeSyncClock *v2;
  CMContinuityCaptureTimeSyncClock *v3;
  NSObject *v4;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32)
    && (v2 = -[CMContinuityCaptureTimeSyncClock initWithClock:]([CMContinuityCaptureTimeSyncClock alloc], "initWithClock:", *(_QWORD *)(a1 + 32))) != 0)
  {
    v3 = v2;
    -[CMContinuityCaptureTimeSyncClock startEmittingHeartBeatSignposts](v2, "startEmittingHeartBeatSignposts");
    (*(void (**)(_QWORD, CMContinuityCaptureTimeSyncClock *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, 0);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_361_cold_1(a1, v4);

    v5 = *(_QWORD *)(a1 + 40);
    v3 = (CMContinuityCaptureTimeSyncClock *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870212, 0);
    (*(void (**)(uint64_t, _QWORD, CMContinuityCaptureTimeSyncClock *))(v5 + 16))(v5, 0, v3);
  }

}

- (void)disposeTimeSyncClock
{
  NSObject *v3;
  unint64_t clockIdentifier;
  void *v5;
  _QWORD v6[4];
  id v7;
  _BYTE buf[12];
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_clockIdentifier != *MEMORY[0x24BEB70E0])
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      clockIdentifier = self->_clockIdentifier;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      v9 = 2048;
      v10 = clockIdentifier;
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ disposing timesync for %lld", buf, 0x16u);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v5 = (void *)MEMORY[0x24BEB70C0];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __63__CMContinuityCaptureRapportTransportBase_disposeTimeSyncClock__block_invoke;
    v6[3] = &unk_24F06AE60;
    objc_copyWeak(&v7, (id *)buf);
    objc_msgSend(v5, "notifyWhenClockManagerIsAvailable:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __63__CMContinuityCaptureRapportTransportBase_disposeTimeSyncClock__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEB70D0];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __63__CMContinuityCaptureRapportTransportBase_disposeTimeSyncClock__block_invoke_2;
  v2[3] = &unk_24F06AE60;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_msgSend(v1, "notifyWhengPTPManagerIsAvailable:", v2);
  objc_destroyWeak(&v3);
}

void __63__CMContinuityCaptureRapportTransportBase_disposeTimeSyncClock__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  _QWORD *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *MEMORY[0x24BEB70E0];
    if (WeakRetained[4] != *MEMORY[0x24BEB70E0])
    {
      objc_msgSend(MEMORY[0x24BEB70D0], "sharedgPTPManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v2[4];
      v10 = 0;
      objc_msgSend(v4, "removePTPInstanceWithIdentifier:error:", v5, &v10);
      v6 = v10;

      if (v6)
      {
        CMContinuityCaptureLog(2);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = v2[4];
          objc_msgSend(v6, "localizedDescription");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v12 = v2;
          v13 = 2048;
          v14 = v8;
          v15 = 2114;
          v16 = v9;
          _os_log_error_impl(&dword_227C5D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed deallocate clock %lld with error %{public}@", buf, 0x20u);

        }
      }
      v2[4] = v3;

    }
  }

}

- (void)_bindClock:(unint64_t)a3 peerAddress:(id)a4 retries:(int64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  int v12;
  NSObject *v13;
  const char *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  char v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  __int16 v33;
  _QWORD block[4];
  id v35;
  void (**v36)(id, _QWORD);
  id v37[4];
  id v38[3];
  id location;
  char v40[16];
  uint8_t buf[4];
  CMContinuityCaptureRapportTransportBase *v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  uint64_t v46;
  _OWORD v47[4];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a6;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  memset(v47, 0, sizeof(v47));
  memset(v38, 170, 20);
  v37[3] = (id)0xAAAAAAAAAAAAAAAALL;
  if ((objc_msgSend(v10, "getCString:maxLength:encoding:", v47, 64, 4) & 1) == 0)
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRapportTransportBase _bindClock:peerAddress:retries:completion:].cold.3((uint64_t)self);
    goto LABEL_10;
  }
  v12 = StringToSockAddr();
  if (v12)
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543875;
      v42 = self;
      v43 = 2113;
      v44 = (unint64_t)v10;
      v45 = 1024;
      LODWORD(v46) = v12;
      v14 = "%{public}@ Failed to parse peer address %{private}@. Error: %{errno}d";
LABEL_39:
      _os_log_error_impl(&dword_227C5D000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x1Cu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v15 = SockAddrConvertToIPv6();
  if (v15)
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543875;
      v42 = self;
      v43 = 2113;
      v44 = (unint64_t)v10;
      v45 = 1024;
      LODWORD(v46) = v15;
      v14 = "%{public}@ Failed to convert peer address %{private}@ to IPv6. Error: %{errno}d";
      goto LABEL_39;
    }
LABEL_10:

    v11[2](v11, 0);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BEB70C0], "sharedClockManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clockWithClockIdentifier:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    CMContinuityCaptureLog(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v17, "grandmasterIdentity");
      *(_DWORD *)buf = 138543874;
      v42 = self;
      v43 = 2048;
      v44 = a3;
      v45 = 2048;
      v46 = v19;
      _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Clock %llu available, grandmaster %llu", buf, 0x20u);
    }

    v33 = 0;
    memset(v40, 170, sizeof(v40));
    if (if_indextoname(v38[2], v40)
      && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v40, 4),
          (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      CMContinuityCaptureLog(2);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v42 = self;
        v43 = 2114;
        v44 = (unint64_t)v20;
        _os_log_impl(&dword_227C5D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Binding clock to %{public}@", buf, 0x16u);
      }

      v32 = 0;
      v22 = objc_msgSend(v17, "addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", v20, v38, &v33, &v32);
      v23 = v32;
      if ((v22 & 1) != 0)
      {
        CMContinuityCaptureLog(2);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v42 = self;
          _os_log_impl(&dword_227C5D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Clock binding completed.", buf, 0xCu);
        }

        ((void (**)(id, void *))v11)[2](v11, v17);
      }
      else
      {
        CMContinuityCaptureLog(2);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v23, "localizedDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v42 = self;
          v43 = 2113;
          v44 = (unint64_t)v10;
          v45 = 2114;
          v46 = (uint64_t)v31;
          _os_log_error_impl(&dword_227C5D000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to add UDPv6 peer address %{private}@. Error: %{public}@", buf, 0x20u);

        }
        v11[2](v11, 0);
      }
    }
    else
    {
      CMContinuityCaptureLog(2);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureRapportTransportBase _bindClock:peerAddress:retries:completion:].cold.2((uint64_t)self);

      v11[2](v11, 0);
      v20 = 0;
      v23 = 0;
    }

  }
  else if (a5)
  {
    CMContinuityCaptureLog(2);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = self;
      v43 = 2048;
      v44 = a3;
      _os_log_impl(&dword_227C5D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Clock %llu not available, retry with delay", buf, 0x16u);
    }

    v27 = dispatch_time(0, 100000000);
    dispatch_get_global_queue(2, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__CMContinuityCaptureRapportTransportBase__bindClock_peerAddress_retries_completion___block_invoke;
    block[3] = &unk_24F06D0F8;
    objc_copyWeak(v37, &location);
    v37[1] = (id)a3;
    v35 = v10;
    v37[2] = (id)a5;
    v36 = v11;
    dispatch_after(v27, v28, block);

    objc_destroyWeak(v37);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureRapportTransportBase _bindClock:peerAddress:retries:completion:].cold.1();

    v11[2](v11, 0);
  }

LABEL_11:
  objc_destroyWeak(&location);

}

void __85__CMContinuityCaptureRapportTransportBase__bindClock_peerAddress_retries_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_bindClock:peerAddress:retries:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64) - 1, *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_incomingStreamRequestHandler, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_2_2(&dword_227C5D000, a3, v6, "%{public}@ TimeSync addgPTPServices Error %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_13_0();
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_cold_1(id *a1, void *a2, NSObject *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = WeakRetained;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_2_2(&dword_227C5D000, a3, v7, "%{public}@ Failed allocate clock with error %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_13_0();
}

void __89__CMContinuityCaptureRapportTransportBase_createTimeSyncClockWithPeerAddress_completion___block_invoke_2_361_cold_1(uint64_t a1, NSObject *a2)
{
  id WeakRetained;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_227C5D000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create time sync clock, Stream setup requires valid time sync clock.", v4, 0xCu);

  OUTLINED_FUNCTION_8();
}

- (void)_bindClock:peerAddress:retries:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ Exhausted all retries to acquire clock %llu");
  OUTLINED_FUNCTION_1_0();
}

- (void)_bindClock:(uint64_t)a1 peerAddress:retries:completion:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543619;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v1, v2, "%{public}@ Failed to derive ifname from cifname for peer address %{private}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_bindClock:(uint64_t)a1 peerAddress:retries:completion:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543619;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v1, v2, "%{public}@ Failed to get peer address %{private}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

@end
