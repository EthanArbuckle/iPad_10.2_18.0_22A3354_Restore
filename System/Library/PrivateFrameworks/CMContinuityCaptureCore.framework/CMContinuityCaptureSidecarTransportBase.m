@implementation CMContinuityCaptureSidecarTransportBase

- (CMContinuityCaptureSidecarTransportBase)initWithDevice:(id)a3 queue:(id)a4 taskDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CMContinuityCaptureSidecarTransportBase *v12;
  CMContinuityCaptureSidecarTransportBase *v13;
  uint64_t v14;
  NSArray *sidebandIdentfiers;
  void *v16;
  uint64_t v17;
  NSArray *mediaIdentfiers;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CMContinuityCaptureSidecarTransportBase *v24;
  NSObject *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  CMContinuityCaptureSidecarTransportBase *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CMContinuityCaptureSidecarTransportBase;
  v12 = -[CMContinuityCaptureSidecarTransportBase init](&v28, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_10;
  objc_storeWeak((id *)&v12->_delegate, v11);
  objc_storeStrong((id *)&v13->_device, a3);
  objc_storeStrong((id *)&v13->_queue, a4);
  CMContinuityCaptureGetListOfSupportedSidebandIdentifiers();
  v14 = objc_claimAutoreleasedReturnValue();
  sidebandIdentfiers = v13->_sidebandIdentfiers;
  v13->_sidebandIdentfiers = (NSArray *)v14;

  objc_msgSend(v9, "capabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureMediaIdentfiersForCapabilities(v16);
  v17 = objc_claimAutoreleasedReturnValue();
  mediaIdentfiers = v13->_mediaIdentfiers;
  v13->_mediaIdentfiers = (NSArray *)v17;

  objc_storeStrong((id *)&v13->_device, a3);
  objc_msgSend(v9, "capabilities");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_7;
  v20 = (void *)v19;
  objc_msgSend(v9, "capabilities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "devicesCapabilities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (!v23)
  {
LABEL_7:
    CMContinuityCaptureLog(2);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "capabilities");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2048;
      v32 = v26;
      _os_log_impl(&dword_227C5D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid capabilities %p", buf, 0x16u);

    }
    goto LABEL_10;
  }
  if (!v13->_queue || !v13->_device)
  {
LABEL_10:
    v24 = 0;
    goto LABEL_11;
  }
  v24 = v13;
LABEL_11:

  return v24;
}

- (void)resetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void)setTaskDelegate:(id)a3
{
  id obj;

  obj = a3;
  if (-[CMContinuityCaptureTransportSidecarDevice remote](self->_device, "remote"))
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
  v11[2] = __70__CMContinuityCaptureSidecarTransportBase_enqueueResponse_identifier___block_invoke;
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

void __70__CMContinuityCaptureSidecarTransportBase_enqueueResponse_identifier___block_invoke(uint64_t a1)
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
  char v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  int v39;
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
  void *v86;
  char v87;
  NSObject *v88;
  void *v89;
  int v90;
  void *v91;
  int v92;
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
  void *v109;
  unsigned int v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  NSObject *v117;
  void *v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  id v122;
  id v123;
  _QWORD v124[4];
  id v125;
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  id v130;
  _QWORD v131[4];
  id v132;
  id v133[2];
  id v134;
  id location;
  const __CFString *v136;
  void *v137;
  uint8_t buf[4];
  CMContinuityCaptureSidecarTransportBase *v139;
  __int16 v140;
  _BYTE v141[10];
  unint64_t v142;
  __int16 v143;
  void *v144;
  uint64_t v145;

  v145 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!WeakRetained)
    goto LABEL_19;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v19 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureArgs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
    goto LABEL_19;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_19;
  CMContinuityCaptureLog(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureGID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v139 = self;
    v140 = 2114;
    *(_QWORD *)v141 = v7;
    *(_WORD *)&v141[8] = 2114;
    v142 = (unint64_t)v15;
    v143 = 2114;
    v144 = v16;
    _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueResponse identifier:%{public}@ selector %{public}@ gid %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureArgs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
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
          goto LABEL_20;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v26 = objc_opt_isKindOfClass();

        if ((v26 & 1) == 0)
          goto LABEL_20;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v28 = objc_opt_isKindOfClass();

        if ((v28 & 1) == 0)
          goto LABEL_20;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v30 = objc_opt_isKindOfClass();

        if ((v30 & 1) == 0)
          goto LABEL_20;
        -[CMContinuityCaptureSidecarTransportBase device](self, "device");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "remote");

        if ((v32 & 1) != 0)
          goto LABEL_20;
        v33 = (void *)MEMORY[0x24BDD1620];
        v34 = objc_opt_class();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = 0;
        objc_msgSend(v33, "unarchivedObjectOfClass:fromData:error:", v34, v35, &v130);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v130;

        if (v36)
        {
          CMContinuityCaptureLog(2);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "unsignedIntValue");
            *(_DWORD *)buf = 138543874;
            v139 = self;
            v140 = 2114;
            *(_QWORD *)v141 = v36;
            *(_WORD *)&v141[8] = 1024;
            LODWORD(v142) = v39;
            _os_log_impl(&dword_227C5D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream Configuration %{public}@ option %u", buf, 0x1Cu);

          }
          objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "unsignedIntValue");
          v127[0] = MEMORY[0x24BDAC760];
          v127[1] = 3221225472;
          v127[2] = __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke_291;
          v127[3] = &unk_24F06B500;
          objc_copyWeak(&v129, &location);
          v42 = v36;
          v128 = v42;
          objc_msgSend(WeakRetained, "startStream:option:completion:", v42, v41, v127);

          objc_destroyWeak(&v129);
        }
        else
        {
          CMContinuityCaptureLog(2);
          v121 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.2();

        }
        goto LABEL_57;
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

              if ((v85 & 1) != 0)
              {
                -[CMContinuityCaptureSidecarTransportBase device](self, "device");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = objc_msgSend(v86, "remote");

                if ((v87 & 1) == 0)
                {
                  CMContinuityCaptureLog(2);
                  v88 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    v90 = objc_msgSend(v89, "unsignedIntValue");
                    objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    v92 = objc_msgSend(v91, "unsignedIntValue");
                    *(_DWORD *)buf = 138543874;
                    v139 = self;
                    v140 = 1024;
                    *(_DWORD *)v141 = v90;
                    *(_WORD *)&v141[4] = 1024;
                    *(_DWORD *)&v141[6] = v92;
                    _os_log_impl(&dword_227C5D000, v88, OS_LOG_TYPE_DEFAULT, "%{public}@ StopStream entity %u option %u", buf, 0x18u);

                  }
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = objc_msgSend(v93, "unsignedIntValue");
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v96 = objc_msgSend(v95, "unsignedIntValue");
                  v124[0] = MEMORY[0x24BDAC760];
                  v124[1] = 3221225472;
                  v124[2] = __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke_292;
                  v124[3] = &unk_24F06B500;
                  objc_copyWeak(&v126, &location);
                  v19 = v19;
                  v125 = v19;
                  objc_msgSend(WeakRetained, "stopStream:option:completion:", v94, v96, v124);

                  objc_destroyWeak(&v126);
                }
              }
            }
          }
        }
        goto LABEL_20;
      case 2:
        if (!v19)
          goto LABEL_20;
        if (objc_msgSend(v19, "count") != 2)
          goto LABEL_20;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v106 = objc_opt_isKindOfClass();

        if ((v106 & 1) == 0)
          goto LABEL_20;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v108 = objc_opt_isKindOfClass();

        if ((v108 & 1) == 0)
          goto LABEL_20;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend(v109, "unsignedIntValue");
        v136 = CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_continuous_time());
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = v111;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "postEvent:entity:data:", v9, v110, v112);

        goto LABEL_21;
      case 3:
        if (objc_msgSend(v19, "count"))
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v113 = 0;
        }
        if ((unint64_t)objc_msgSend(v19, "count") < 2)
        {
          v115 = 0;
        }
        else
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((unint64_t)objc_msgSend(v19, "count") < 3)
        {
          v116 = 0;
        }
        else
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
        }
        CMContinuityCaptureLog(2);
        v117 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v116, "unsignedLongLongValue"));
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v139 = self;
          v140 = 2112;
          *(_QWORD *)v141 = v113;
          *(_WORD *)&v141[8] = 2112;
          v142 = (unint64_t)v115;
          v143 = 2112;
          v144 = v118;
          _os_log_impl(&dword_227C5D000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@ Received synchronize audio clock with sampleTime %@ networkTime %@ grandmaster %@", buf, 0x2Au);

        }
        objc_msgSend(WeakRetained, "synchronizeAudioClockWithSampleTime:networkTime:clockGrandMasterIdentifier:", objc_msgSend(v113, "unsignedLongLongValue"), objc_msgSend(v115, "unsignedLongLongValue"), objc_msgSend(v116, "unsignedLongLongValue"));

        goto LABEL_20;
      case 4:
        CMContinuityCaptureLog(2);
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v139 = self;
          _os_log_impl(&dword_227C5D000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@ SynchronizeAudioClockComplete", buf, 0xCu);
        }

        objc_msgSend(WeakRetained, "handleSynchronizeAudioClockCompletion");
        goto LABEL_20;
      case 5:
        if (!v19)
          goto LABEL_20;
        if (objc_msgSend(v19, "count") != 2)
          goto LABEL_20;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v70 = objc_opt_isKindOfClass();

        if ((v70 & 1) == 0)
          goto LABEL_20;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v72 = objc_opt_isKindOfClass();

        if ((v72 & 1) == 0)
          goto LABEL_20;
        v73 = (void *)MEMORY[0x24BDD1620];
        v74 = objc_opt_class();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = 0;
        objc_msgSend(v73, "unarchivedObjectOfClass:fromData:error:", v74, v75, &v134);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v134;

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
            v139 = self;
            v140 = 2112;
            *(_QWORD *)v141 = v76;
            *(_WORD *)&v141[8] = 2048;
            v142 = v78;
            _os_log_impl(&dword_227C5D000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@ CaptureStillImage %@ entity %ld", buf, 0x20u);
          }

          v131[0] = MEMORY[0x24BDAC760];
          v131[1] = 3221225472;
          v131[2] = __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke;
          v131[3] = &unk_24F06BB60;
          objc_copyWeak(v133, &location);
          v132 = v76;
          v133[1] = (id)v78;
          objc_msgSend(WeakRetained, "captureStillImage:entity:completion:", v132, v78, v131);

          objc_destroyWeak(v133);
        }
        else
        {
          CMContinuityCaptureLog(2);
          v120 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
            -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.1();

        }
        goto LABEL_57;
      case 6:
      case 7:
        goto LABEL_23;
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
                  v139 = self;
                  v140 = 2112;
                  *(_QWORD *)v141 = v101;
                  *(_WORD *)&v141[8] = 2048;
                  v142 = v103;
                  _os_log_impl(&dword_227C5D000, v104, OS_LOG_TYPE_DEFAULT, "%{public}@ EnqueueReactionEffect %@ entity %ld", buf, 0x20u);
                }

                objc_msgSend(WeakRetained, "enqueueReactionEffect:entity:", v101, v103);
              }
            }
          }
        }
        goto LABEL_20;
      default:
        goto LABEL_43;
    }
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("ContinuityCaptureControl")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("ContinuityCaptureData")))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "unsignedIntegerValue");

      v9 = 0;
      if (v52 || !v19)
      {
LABEL_43:
        v23 = 0;
        v24 = 0;
        goto LABEL_23;
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
            v122 = 0;
            objc_msgSend(v57, "unarchivedObjectOfClass:fromData:error:", v58, v59, &v122);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v122;

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

            goto LABEL_57;
          }
        }
      }
    }
    goto LABEL_20;
  }
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
    goto LABEL_20;
  }
  if (v44 != 1
    || !v19
    || objc_msgSend(v19, "count") != 1
    || (objc_msgSend(v19, "objectAtIndexedSubscript:", 0),
        v45 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v46 = objc_opt_isKindOfClass(),
        v45,
        (v46 & 1) == 0))
  {
LABEL_20:
    v9 = 0;
LABEL_21:
    v23 = 0;
LABEL_22:
    v24 = 0;
    goto LABEL_23;
  }
  v47 = (void *)MEMORY[0x24BDD1620];
  v48 = objc_opt_class();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0;
  objc_msgSend(v47, "unarchivedObjectOfClass:fromData:error:", v48, v49, &v123);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v123;

  if (!v24)
  {
    CMContinuityCaptureLog(2);
    v119 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureSidecarTransportBase _enqueueResponse:identifier:].cold.2();

LABEL_57:
    v9 = 0;
    goto LABEL_22;
  }
  CMContinuityCaptureLog(2);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v139 = self;
    v140 = 2114;
    *(_QWORD *)v141 = v24;
    _os_log_impl(&dword_227C5D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatch update for %{public}@", buf, 0x16u);
  }

  objc_msgSend(WeakRetained, "setValueForControl:completion:", v24, &__block_literal_global_295);
  v9 = 0;
LABEL_23:
  objc_destroyWeak(&location);

}

void __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
    objc_msgSend(v6, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didCaptureStillImage:entity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    WeakRetained = v6;
  }

}

void __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke_291(uint64_t a1, uint64_t a2)
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

void __71__CMContinuityCaptureSidecarTransportBase__enqueueResponse_identifier___block_invoke_292(uint64_t a1, uint64_t a2)
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

- (void)teardownSidecarStreams
{
  NSObject *v3;
  int v4;
  CMContinuityCaptureSidecarTransportBase *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412546;
    v5 = self;
    v6 = 2080;
    v7 = "-[CMContinuityCaptureSidecarTransportBase teardownSidecarStreams]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v4, 0x16u);
  }

  -[CMContinuityCaptureTransportSidecarDevice teardownStreams](self->_device, "teardownStreams");
  self->_pendingTimeSyncCallback = 0;
}

- (void)setupSidecarStreams
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  CMContinuityCaptureSidecarTransportBase *v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v42 = self;
    v43 = 2080;
    v44 = "-[CMContinuityCaptureSidecarTransportBase setupSidecarStreams]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("MediaStreamTypeForAudio"), CFSTR("com.apple.coremedia"));
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v5) = objc_msgSend(v4, "unsignedIntValue");
    CMContinuityCaptureLog(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = self;
      v43 = 1024;
      LODWORD(v44) = v5;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ MediaStreamTypeForAudio (SidecarStream setup) %u", buf, 0x12u);
    }

    v5 = v5;
  }
  else
  {
    v5 = 3;
  }
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("MediaStreamTypeForVideo"), CFSTR("com.apple.coremedia"));

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v8) = objc_msgSend(v7, "unsignedIntValue");
    CMContinuityCaptureLog(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = self;
      v43 = 1024;
      LODWORD(v44) = v8;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%@ MediaStreamTypeForVideo (SidecarStream setup) %u", buf, 0x12u);
    }

    v8 = v8;
  }
  else
  {
    v8 = 3;
  }
  v10 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke;
  v36[3] = &unk_24F06C690;
  objc_copyWeak(&v37, &location);
  v11 = (void *)MEMORY[0x22E2A7CB0](v36);
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke_304;
  v33[3] = &unk_24F06C6E0;
  objc_copyWeak(&v35, &location);
  v24 = v11;
  v34 = v24;
  v12 = (void *)MEMORY[0x22E2A7CB0](v33);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = self->_sidebandIdentfiers;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v13);
        -[CMContinuityCaptureSidecarTransportBase setupSidebandSidecarStreamForIdentifier:type:completion:](self, "setupSidebandSidecarStreamForIdentifier:type:completion:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), 2, v12);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v14);
  }

  v23 = v7;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = self->_mediaIdentfiers;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        if (objc_msgSend(v21, "isEqualToString:", CFSTR("ContinuityCaptureMediaMicrophone"), v23))
          v22 = v5;
        else
          v22 = v8;
        -[CMContinuityCaptureSidecarTransportBase setupMediaSidecarStreamForIdentifier:type:completion:](self, "setupMediaSidecarStreamForIdentifier:type:completion:", v21, v22, v12);
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    }
    while (v18);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  id *v9;
  NSObject *v10;
  id v11;
  void *v12;
  CMContinuityCaptureTransportDeviceSidecarStream *v13;
  void *v14;
  CMContinuityCaptureTransportDeviceSidecarStream *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = (id *)WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 2));
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_loadWeakRetained(v7);
      if (v5)
      {
        objc_msgSend(v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      v16 = 138543874;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ setupStream completion for %@ error %@", (uint8_t *)&v16, 0x20u);
      if (v5)

    }
    v13 = [CMContinuityCaptureTransportDeviceSidecarStream alloc];
    objc_msgSend(v5, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CMContinuityCaptureTransportDeviceSidecarStream initWithSidecarStream:entity:messageDelegate:](v13, "initWithSidecarStream:entity:messageDelegate:", v5, CMContinuityCaptureEntityTypeFromMediaIdentifer(v14), v9);

    objc_msgSend(v9[1], "activateStream:", v15);
  }

}

void __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke_304(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke_2;
    block[3] = &unk_24F06C6B8;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __62__CMContinuityCaptureSidecarTransportBase_setupSidecarStreams__block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)createTimeSyncClockForSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureSidecarTransportBase *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6 && !self->_pendingTimeSyncCallback)
  {
    self->_pendingTimeSyncCallback = 1;
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v15 = self;
      v16 = 2080;
      v17 = "-[CMContinuityCaptureSidecarTransportBase createTimeSyncClockForSession:completion:]";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s for session %@", buf, 0x20u);
    }

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke;
    v9[3] = &unk_24F06C730;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    objc_msgSend(v10, "timeSyncWithCompletion:", v9);

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);

}

void __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id *v10;
  _QWORD v11[4];
  _QWORD *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  _QWORD *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained(a1 + 6);
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2048;
      v21 = a2;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Got time sync clockIdentifier %llu from sidecar session. Error: %@", buf, 0x20u);

    }
    v9 = WeakRetained[2];
    if (v5)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_305;
      block[3] = &unk_24F06AEB0;
      v10 = (id *)&v17;
      v17 = WeakRetained;
      dispatch_async(v9, block);
    }
    else
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_2;
      v11[3] = &unk_24F06C708;
      v10 = (id *)&v12;
      v12 = WeakRetained;
      v15 = a2;
      v13 = a1[4];
      v14 = a1[5];
      dispatch_async(v9, v11);

    }
  }

}

uint64_t __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_305(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  return result;
}

void __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  CMContinuityCaptureTimeSyncClock *v3;
  CMContinuityCaptureTimeSyncClock *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v2 = a1 + 4;
  *(_BYTE *)(a1[4] + 32) = 0;
  v3 = -[CMContinuityCaptureTimeSyncClock initWithClockIdentifier:]([CMContinuityCaptureTimeSyncClock alloc], "initWithClockIdentifier:", a1[7]);
  v4 = v3;
  if (v3)
  {
    -[CMContinuityCaptureTimeSyncClock startEmittingHeartBeatSignposts](v3, "startEmittingHeartBeatSignposts");
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    CMContinuityCaptureLog(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_2_cold_1(v2, (uint64_t)a1, v5);

    v6 = a1[6];
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -536870212, 0);
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (id)debugInfo
{
  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureSidecarTransportBase device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CMContinuityCaptureTransportSidecarDevice)device
{
  return (CMContinuityCaptureTransportSidecarDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentfiers, 0);
  objc_storeStrong((id *)&self->_sidebandIdentfiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_enqueueResponse:identifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%@ error unarchivedObjectOfClass CMContinuityCaptureStillImageRequest %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_enqueueResponse:identifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ error unarchivedObjectOfClass %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_enqueueResponse:identifier:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ error unarchivedObjectOfClass CMContinuityCaptureStillImageRequest %@");
  OUTLINED_FUNCTION_1_0();
}

void __84__CMContinuityCaptureSidecarTransportBase_createTimeSyncClockForSession_completion___block_invoke_2_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a2 + 40);
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, a2, a3, "%{public}@ Failed to create time sync clock from session %@, Stream setup requires valid time sync clock.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

@end
