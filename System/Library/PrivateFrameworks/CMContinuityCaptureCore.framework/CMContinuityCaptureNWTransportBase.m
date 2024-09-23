@implementation CMContinuityCaptureNWTransportBase

- (CMContinuityCaptureNWTransportBase)initWithDevice:(id)a3
{
  id v5;
  CMContinuityCaptureNWTransportBase *v6;
  CMContinuityCaptureNWTransportBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMContinuityCaptureNWTransportBase;
  v6 = -[CMContinuityCaptureNWTransportBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (ContinuityCaptureTaskDelegate)taskDelegate
{
  return (ContinuityCaptureTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setTaskDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)createTimeSyncClock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BEB70C0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke;
  v7[3] = &unk_24F06B548;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "notifyWhenClockManagerIsAvailable:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = WeakRetained;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ TSClockManager is Available", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BEB70C0], "sharedClockManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addClient:", WeakRetained);

    objc_msgSend(MEMORY[0x24BEB70C0], "sharedClockManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v6, "addgPTPServicesWithError:", &v15);
    v7 = v15;

    if (v7)
    {
      CMContinuityCaptureLog(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke_cold_1((uint64_t)WeakRetained, v7, v8);

      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870212, 0);
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
    else
    {
      v11 = (void *)MEMORY[0x24BEB70D0];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke_9;
      v12[3] = &unk_24F06B548;
      objc_copyWeak(&v14, v2);
      v13 = *(id *)(a1 + 32);
      objc_msgSend(v11, "notifyWhengPTPManagerIsAvailable:", v12);

      objc_destroyWeak(&v14);
    }

  }
}

void __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  void *v5;
  uint64_t v6;
  CMContinuityCaptureTimeSyncClock *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = 138543362;
    v9 = WeakRetained;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ gPTPManager is Available", (uint8_t *)&v8, 0xCu);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB70D0], "sharedgPTPManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "systemDomainClockIdentifier");

    v7 = -[CMContinuityCaptureTimeSyncClock initWithClockIdentifier:]([CMContinuityCaptureTimeSyncClock alloc], "initWithClockIdentifier:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)enqueueResponse:(id)a3 identifier:(id)a4
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
  unsigned int v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  char v61;
  void *v62;
  char v63;
  void *v64;
  unsigned int v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  char v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned int v76;
  NSObject *v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  char v83;
  NSObject *v84;
  void *v85;
  int v86;
  void *v87;
  int v88;
  void *v89;
  unsigned int v90;
  void *v91;
  unsigned int v92;
  void *v93;
  char v94;
  void *v95;
  char v96;
  void *v97;
  void *v98;
  unsigned int v99;
  NSObject *v100;
  void *v101;
  char v102;
  void *v103;
  char v104;
  NSObject *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  unsigned int v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  void *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  id v119;
  id v120;
  _QWORD v121[4];
  id v122;
  id v123;
  _QWORD v124[4];
  id v125;
  id v126;
  id v127;
  _QWORD v128[4];
  id v129;
  id v130[2];
  id v131;
  id location;
  const __CFString *v133;
  void *v134;
  uint8_t buf[4];
  CMContinuityCaptureNWTransportBase *v136;
  __int16 v137;
  _BYTE v138[10];
  unint64_t v139;
  __int16 v140;
  void *v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureArgs"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (v11)
        goto LABEL_20;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_20;
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureGID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v136 = self;
        v137 = 2114;
        *(_QWORD *)v138 = v7;
        *(_WORD *)&v138[8] = 2114;
        v139 = (unint64_t)v15;
        v140 = 2114;
        v141 = v16;
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
                goto LABEL_21;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v26 = objc_opt_isKindOfClass();

              if ((v26 & 1) == 0)
                goto LABEL_21;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v28 = objc_opt_isKindOfClass();

              if ((v28 & 1) == 0)
                goto LABEL_21;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v30 = objc_opt_isKindOfClass();

              if ((v30 & 1) == 0 || -[CMContinuityCaptureTransportNWDevice remote](self->_device, "remote"))
                goto LABEL_21;
              v31 = (void *)MEMORY[0x24BDD1620];
              v32 = objc_opt_class();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v127 = 0;
              objc_msgSend(v31, "unarchivedObjectOfClass:fromData:error:", v32, v33, &v127);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v127;

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
                  v136 = self;
                  v137 = 2114;
                  *(_QWORD *)v138 = v34;
                  *(_WORD *)&v138[8] = 1024;
                  LODWORD(v139) = v37;
                  _os_log_impl(&dword_227C5D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Configuration %{public}@ option %u", buf, 0x1Cu);

                }
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "unsignedIntValue");
                v124[0] = MEMORY[0x24BDAC760];
                v124[1] = 3221225472;
                v124[2] = __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke_21;
                v124[3] = &unk_24F06B500;
                objc_copyWeak(&v126, &location);
                v40 = v34;
                v125 = v40;
                objc_msgSend(WeakRetained, "startStream:option:completion:", v40, v39, v124);

                objc_destroyWeak(&v126);
              }
              else
              {
                CMContinuityCaptureLog(2);
                v118 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                  -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.2();

              }
              goto LABEL_59;
            case 1:
              if (objc_msgSend(v19, "count") == 3)
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v79 = objc_opt_isKindOfClass();

                if ((v79 & 1) != 0)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v81 = objc_opt_isKindOfClass();

                  if ((v81 & 1) != 0)
                  {
                    objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v83 = objc_opt_isKindOfClass();

                    if ((v83 & 1) != 0 && !-[CMContinuityCaptureTransportNWDevice remote](self->_device, "remote"))
                    {
                      CMContinuityCaptureLog(2);
                      v84 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        v86 = objc_msgSend(v85, "unsignedIntValue");
                        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        v88 = objc_msgSend(v87, "unsignedIntValue");
                        *(_DWORD *)buf = 138543874;
                        v136 = self;
                        v137 = 1024;
                        *(_DWORD *)v138 = v86;
                        *(_WORD *)&v138[4] = 1024;
                        *(_DWORD *)&v138[6] = v88;
                        _os_log_impl(&dword_227C5D000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream entity %u option %u", buf, 0x18u);

                      }
                      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      v90 = objc_msgSend(v89, "unsignedIntValue");
                      objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      v92 = objc_msgSend(v91, "unsignedIntValue");
                      v121[0] = MEMORY[0x24BDAC760];
                      v121[1] = 3221225472;
                      v121[2] = __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke_22;
                      v121[3] = &unk_24F06B500;
                      objc_copyWeak(&v123, &location);
                      v19 = v19;
                      v122 = v19;
                      objc_msgSend(WeakRetained, "stopStream:option:completion:", v90, v92, v121);

                      objc_destroyWeak(&v123);
                    }
                  }
                }
              }
              goto LABEL_21;
            case 2:
              if (!v19)
                goto LABEL_21;
              if (objc_msgSend(v19, "count") != 2)
                goto LABEL_21;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v102 = objc_opt_isKindOfClass();

              if ((v102 & 1) == 0)
                goto LABEL_21;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v104 = objc_opt_isKindOfClass();

              if ((v104 & 1) == 0)
                goto LABEL_21;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v9, "isEqualToString:", CFSTR("kCMContinuityCaptureEventConnectionDisconnect")))
              {
                CMContinuityCaptureLog(2);
                v105 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v136 = self;
                  v137 = 2114;
                  *(_QWORD *)v138 = WeakRetained;
                  _os_log_impl(&dword_227C5D000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@ Session Interrupted for %{public}@", buf, 0x16u);
                }

              }
              else
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v109 = objc_msgSend(v108, "unsignedIntValue");
                v133 = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v134 = v110;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "postEvent:entity:data:", v9, v109, v111);

              }
              goto LABEL_22;
            case 3:
              if (objc_msgSend(v19, "count"))
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v106 = 0;
              }
              if ((unint64_t)objc_msgSend(v19, "count") < 2)
              {
                v112 = 0;
              }
              else
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
              }
              if ((unint64_t)objc_msgSend(v19, "count") < 3)
              {
                v113 = 0;
              }
              else
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
              }
              CMContinuityCaptureLog(2);
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v113, "unsignedLongLongValue"));
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v136 = self;
                v137 = 2112;
                *(_QWORD *)v138 = v106;
                *(_WORD *)&v138[8] = 2112;
                v139 = (unint64_t)v112;
                v140 = 2112;
                v141 = v115;
                _os_log_impl(&dword_227C5D000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@ Received synchronize audio clock with sampleTime %@ networkTime %@ grandmaster %@", buf, 0x2Au);

              }
              objc_msgSend(WeakRetained, "synchronizeAudioClockWithSampleTime:networkTime:clockGrandMasterIdentifier:", objc_msgSend(v106, "unsignedLongLongValue"), objc_msgSend(v112, "unsignedLongLongValue"), objc_msgSend(v113, "unsignedLongLongValue"));

              goto LABEL_21;
            case 4:
              CMContinuityCaptureLog(2);
              v107 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v136 = self;
                _os_log_impl(&dword_227C5D000, v107, OS_LOG_TYPE_DEFAULT, "%{public}@ SynchronizeAudioClockComplete", buf, 0xCu);
              }

              objc_msgSend(WeakRetained, "handleSynchronizeAudioClockCompletion");
              goto LABEL_21;
            case 5:
              if (!v19)
                goto LABEL_21;
              if (objc_msgSend(v19, "count") != 2)
                goto LABEL_21;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v68 = objc_opt_isKindOfClass();

              if ((v68 & 1) == 0)
                goto LABEL_21;
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v70 = objc_opt_isKindOfClass();

              if ((v70 & 1) == 0)
                goto LABEL_21;
              v71 = (void *)MEMORY[0x24BDD1620];
              v72 = objc_opt_class();
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v131 = 0;
              objc_msgSend(v71, "unarchivedObjectOfClass:fromData:error:", v72, v73, &v131);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v131;

              if (v74)
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = objc_msgSend(v75, "unsignedIntValue");

                CMContinuityCaptureLog(2);
                v77 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  v136 = self;
                  v137 = 2112;
                  *(_QWORD *)v138 = v74;
                  *(_WORD *)&v138[8] = 2048;
                  v139 = v76;
                  _os_log_impl(&dword_227C5D000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ CaptureStillImage %@ entity %ld", buf, 0x20u);
                }

                v128[0] = MEMORY[0x24BDAC760];
                v128[1] = 3221225472;
                v128[2] = __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke;
                v128[3] = &unk_24F06BB60;
                objc_copyWeak(v130, &location);
                v129 = v74;
                v130[1] = (id)v76;
                objc_msgSend(WeakRetained, "captureStillImage:entity:completion:", v129, v76, v128);

                objc_destroyWeak(v130);
              }
              else
              {
                CMContinuityCaptureLog(2);
                v117 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
                  -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.1();

              }
              goto LABEL_59;
            case 6:
            case 7:
              goto LABEL_24;
            case 8:
              if (v19)
              {
                if (objc_msgSend(v19, "count") == 2)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v94 = objc_opt_isKindOfClass();

                  if ((v94 & 1) != 0)
                  {
                    objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v96 = objc_opt_isKindOfClass();

                    if ((v96 & 1) != 0)
                    {
                      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      v99 = objc_msgSend(v98, "unsignedIntValue");

                      CMContinuityCaptureLog(2);
                      v100 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543874;
                        v136 = self;
                        v137 = 2112;
                        *(_QWORD *)v138 = v97;
                        *(_WORD *)&v138[8] = 2048;
                        v139 = v99;
                        _os_log_impl(&dword_227C5D000, v100, OS_LOG_TYPE_DEFAULT, "%{public}@ EnqueueReactionEffect %@ entity %ld", buf, 0x20u);
                      }

                      objc_msgSend(WeakRetained, "enqueueReactionEffect:entity:", v97, v99);
                    }
                  }
                }
              }
              goto LABEL_21;
            default:
              goto LABEL_45;
          }
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("ContinuityCaptureControl")))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "unsignedIntegerValue");

          if (v42 == 2)
          {
            if (objc_msgSend(v19, "count") == 2)
            {
              objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v61 = objc_opt_isKindOfClass();

              if ((v61 & 1) != 0)
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v63 = objc_opt_isKindOfClass();

                if ((v63 & 1) != 0)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  v65 = objc_msgSend(v64, "unsignedIntValue");
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(WeakRetained, "handleAVCNegotiation:data:", v65, v66);

                }
              }
            }
          }
          else if (v42 == 1)
          {
            if (v19)
            {
              if (objc_msgSend(v19, "count") == 1)
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v44 = objc_opt_isKindOfClass();

                if ((v44 & 1) != 0)
                {
                  v45 = (void *)MEMORY[0x24BDD1620];
                  v46 = objc_opt_class();
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v120 = 0;
                  objc_msgSend(v45, "unarchivedObjectOfClass:fromData:error:", v46, v47, &v120);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = v120;

                  if (v24)
                  {
                    CMContinuityCaptureLog(2);
                    v48 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v136 = self;
                      v137 = 2114;
                      *(_QWORD *)v138 = v24;
                      _os_log_impl(&dword_227C5D000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@", buf, 0x16u);
                    }

                    objc_msgSend(WeakRetained, "setValueForControl:completion:", v24, &__block_literal_global_23);
                    v9 = 0;
                    goto LABEL_24;
                  }
                  CMContinuityCaptureLog(2);
                  v116 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                    -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.2();

                  goto LABEL_59;
                }
              }
            }
          }
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ContinuityCaptureData")))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "unsignedIntegerValue");

          v9 = 0;
          if (v50 || !v19)
          {
LABEL_45:
            v23 = 0;
            v24 = 0;
            goto LABEL_24;
          }
          if (objc_msgSend(v19, "count") == 2)
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v52 = objc_opt_isKindOfClass();

            if ((v52 & 1) != 0)
            {
              objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v54 = objc_opt_isKindOfClass();

              if ((v54 & 1) != 0)
              {
                v55 = (void *)MEMORY[0x24BDD1620];
                v56 = objc_opt_class();
                objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v119 = 0;
                objc_msgSend(v55, "unarchivedObjectOfClass:fromData:error:", v56, v57, &v119);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v119;

                if (v58)
                {
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v59 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(WeakRetained, "didCaptureStillImage:entity:", v58, -[NSObject unsignedIntValue](v59, "unsignedIntValue"));
                }
                else
                {
                  CMContinuityCaptureLog(2);
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                    -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.4();
                }

LABEL_59:
                v9 = 0;
                goto LABEL_23;
              }
            }
          }
        }
      }
      else
      {
LABEL_20:
        v19 = 0;
      }
LABEL_21:
      v9 = 0;
    }
    else
    {
      v19 = 0;
    }
LABEL_22:
    v23 = 0;
LABEL_23:
    v24 = 0;
LABEL_24:
    objc_destroyWeak(&location);

    goto LABEL_25;
  }
  v19 = 0;
  v9 = 0;
  v23 = 0;
LABEL_25:

}

void __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
    objc_msgSend(v5[2], "didCaptureStillImage:entity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    WeakRetained = v5;
  }

}

void __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke_21(uint64_t a1, uint64_t a2)
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

void __65__CMContinuityCaptureNWTransportBase_enqueueResponse_identifier___block_invoke_22(uint64_t a1, uint64_t a2)
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

- (void)scheduleReadForConnection:(id)a3 dataTillNow:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  v8 = objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__CMContinuityCaptureNWTransportBase_scheduleReadForConnection_dataTillNow___block_invoke;
  v10[3] = &unk_24F06D238;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  CMContinuityCaptureReceiveDataFromNWConnection(v9, v7, self, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __76__CMContinuityCaptureNWTransportBase_scheduleReadForConnection_dataTillNow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_loadWeakRetained((id *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ NW Connect Recieved Data %@", buf, 0x16u);

    }
    if (v3 && (unint64_t)objc_msgSend(v3, "length") >= 8)
    {
      if (objc_msgSend(v3, "length"))
      {
        v8 = 0;
        while (1)
        {
          v9 = objc_msgSend(v3, "length") - v8;
          if (v9 < 1)
          {
LABEL_17:
            v7 = 0;
            goto LABEL_21;
          }
          if ((unint64_t)v9 <= 7)
            break;
          v10 = objc_retainAutorelease(v3);
          v11 = *(_QWORD *)(objc_msgSend(v10, "bytes") + v8);
          v12 = objc_alloc(MEMORY[0x24BDBCE50]);
          v13 = objc_retainAutorelease(v10);
          v14 = objc_msgSend(v13, "bytes") + v8;
          v15 = v12;
          if (v9 < v11)
            goto LABEL_20;
          v16 = (void *)objc_msgSend(v12, "initWithBytes:length:", v14, v11);
          if (v16)
          {
            CMContinuityCaptureLog(0);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = objc_loadWeakRetained((id *)(a1 + 40));
              *(_DWORD *)buf = 138412546;
              v21 = v18;
              v22 = 2112;
              v23 = v16;
              _os_log_impl(&dword_227C5D000, v17, OS_LOG_TYPE_DEFAULT, "%@ NW Connect Recieved Packet %@", buf, 0x16u);

            }
            objc_msgSend(WeakRetained, "handleRequest:", v16);
          }
          v8 += v11;

          if (v8 >= objc_msgSend(v13, "length"))
            goto LABEL_17;
        }
        v19 = objc_alloc(MEMORY[0x24BDBCE50]);
        v14 = objc_msgSend(objc_retainAutorelease(v3), "bytes") + v8;
        v15 = v19;
LABEL_20:
        v7 = (id)objc_msgSend(v15, "initWithBytes:length:", v14, v9);
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = v3;
    }
LABEL_21:
    objc_msgSend(WeakRetained, "scheduleReadForConnection:dataTillNow:", *(_QWORD *)(a1 + 32), v7);

  }
}

- (void)handleRequest:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  CMContinuityCaptureNWTransportBase *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)objc_msgSend(objc_retainAutorelease(a3), "bytes");
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4 + 1, *v4 - 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1620];
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v13, v5, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;

  CMContinuityCaptureLog(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_227C5D000, v16, OS_LOG_TYPE_DEFAULT, "%@ NW response %@", buf, 0x16u);
  }

  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      -[CMContinuityCaptureNWTransportBase enqueueResponse:identifier:](self, "enqueueResponse:identifier:", v14, v17);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__CMContinuityCaptureNWTransportBase_createTimeSyncClock___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_227C5D000, a3, OS_LOG_TYPE_ERROR, "%{public}@ TimeSync addgPTPServices Error %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
