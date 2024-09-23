@implementation CMContinuityCaptureAVCaptureVideoSession

- (CMContinuityCaptureAVCaptureVideoSession)initWithQueue:(id)a3 requiresMulticamSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  Class *v7;
  id v8;
  NSObject *v9;
  NSMutableArray *v10;
  NSMutableArray *connections;
  NSMutableArray *v12;
  NSMutableArray *connectionEntities;
  CMContinuityCaptureAVCaptureVideoSession *v14;
  objc_super v16;
  uint8_t buf[4];
  CMContinuityCaptureAVCaptureVideoSession *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (Class *)0x24BDB24A8;
  if (!v4)
    v7 = (Class *)0x24BDB24D0;
  v8 = objc_alloc_init(*v7);
  if (v8
    && (v16.receiver = self,
        v16.super_class = (Class)CMContinuityCaptureAVCaptureVideoSession,
        (self = -[CMContinuityCaptureAVCaptureBaseSession initWithCaptureSession:queue:](&v16, sel_initWithCaptureSession_queue_, v8, v6)) != 0))
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%@ created capture session %@", buf, 0x16u);
    }

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    connections = self->_connections;
    self->_connections = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    connectionEntities = self->_connectionEntities;
    self->_connectionEntities = v12;

    self = self;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (-[NSMutableArray count](self->_connections, "count"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ ContinuityCapture error : capture session has unremoved video connections %@"), self, self->_connections);
  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureAVCaptureVideoSession;
  -[CMContinuityCaptureAVCaptureBaseSession dealloc](&v3, sel_dealloc);
}

- (void)setVideoPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_videoPreviewLayer, a3);
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return self->_videoPreviewLayer;
}

- (BOOL)isMulticamSession
{
  void *v2;
  char isKindOfClass;

  -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)addConnections:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  NSMutableArray *connections;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  CMContinuityCaptureAVCaptureVideoSession *v60;
  __int16 v61;
  _BYTE v62[18];
  __int16 v63;
  const char *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CMContinuityCaptureAVCaptureBaseSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[CMContinuityCaptureAVCaptureBaseSession state](self, "state") == 1)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v44 = v4;
    obj = v4;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    if (!v47)
      goto LABEL_38;
    v46 = *(_QWORD *)v56;
    v50 = *MEMORY[0x24BDB1A68];
    while (1)
    {
      for (i = 0; i != v47; i = v34 + 1)
      {
        if (*(_QWORD *)v56 != v46)
          objc_enumerationMutation(obj);
        v48 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v49 = i;
        objc_msgSend(v48, "inputPorts");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v52 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "input");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "canAddInput:", v14);

              if (v15)
              {
                objc_msgSend(v12, "input");
                v16 = objc_claimAutoreleasedReturnValue();
                -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "addInputWithNoConnections:", v16);

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[NSObject device](v16, "device");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "deviceType");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v19, "isEqualToString:", v50);

                  if ((v20 & 1) == 0)
                  {
                    objc_storeStrong((id *)&self->_videoCameraInput, v16);
                    v24 = &unk_24F07FBB8;
LABEL_21:
                    -[NSMutableArray addObject:](self->_connectionEntities, "addObject:", v24);
                    goto LABEL_22;
                  }
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[NSObject device](v16, "device");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "deviceType");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqualToString:", v50);

                  v24 = &unk_24F07FBD0;
                  if (v23)
                    goto LABEL_21;
                }
              }
              else
              {
                CMContinuityCaptureLog(2);
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "input");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v60 = self;
                  v61 = 2112;
                  *(_QWORD *)v62 = v25;
                  *(_WORD *)&v62[8] = 2080;
                  *(_QWORD *)&v62[10] = "-[CMContinuityCaptureAVCaptureVideoSession addConnections:]";
                  _os_log_impl(&dword_227C5D000, v16, OS_LOG_TYPE_DEFAULT, "%@ can't add input %@ %s", buf, 0x20u);

                }
              }
LABEL_22:

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
          }
          while (v9);
        }
        -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "output");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "canAddOutput:", v27);

        if (v28)
        {
          -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "output");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addOutputWithNoConnections:](v29, "addOutputWithNoConnections:", v30);
        }
        else
        {
          CMContinuityCaptureLog(2);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            goto LABEL_29;
          objc_msgSend(v48, "output");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "inputPorts");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v60 = self;
          v61 = 2112;
          *(_QWORD *)v62 = v30;
          *(_WORD *)&v62[8] = 2112;
          *(_QWORD *)&v62[10] = v31;
          v63 = 2080;
          v64 = "-[CMContinuityCaptureAVCaptureVideoSession addConnections:]";
          _os_log_impl(&dword_227C5D000, v29, OS_LOG_TYPE_DEFAULT, "%@ can't add output %@ for input %@ %s", buf, 0x2Au);

        }
LABEL_29:

        -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "connections");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "containsObject:", v48))
        {

          v34 = v49;
        }
        else
        {
          -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "canAddConnection:", v48);

          v34 = v49;
          if (v36)
          {
            -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addConnection:", v48);

            -[NSMutableArray addObject:](self->_connections, "addObject:", v48);
            goto LABEL_36;
          }
        }
        CMContinuityCaptureLog(2);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "connections");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "containsObject:", v48);
          *(_DWORD *)buf = 138412802;
          v60 = self;
          v61 = 2112;
          *(_QWORD *)v62 = v48;
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = v41;
          _os_log_impl(&dword_227C5D000, v38, OS_LOG_TYPE_DEFAULT, "%@ can't add connection New %@ %d", buf, 0x1Cu);

        }
LABEL_36:

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
      if (!v47)
      {
LABEL_38:

        CMContinuityCaptureLog(2);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          connections = self->_connections;
          *(_DWORD *)buf = 138412290;
          v60 = (CMContinuityCaptureAVCaptureVideoSession *)connections;
          _os_log_impl(&dword_227C5D000, v42, OS_LOG_TYPE_DEFAULT, "addConnections done. Current connections: %@", buf, 0xCu);
        }
        v4 = v44;
        goto LABEL_43;
      }
    }
  }
  CMContinuityCaptureLog(2);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v60 = self;
    v61 = 1024;
    *(_DWORD *)v62 = -[CMContinuityCaptureAVCaptureBaseSession state](self, "state");
    *(_WORD *)&v62[4] = 2080;
    *(_QWORD *)&v62[6] = "-[CMContinuityCaptureAVCaptureVideoSession addConnections:]";
    _os_log_impl(&dword_227C5D000, v42, OS_LOG_TYPE_DEFAULT, "%@ Invalid state %d for %s", buf, 0x1Cu);
  }
LABEL_43:

}

- (void)removeConnections:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  id *p_isa;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  void *videoCameraInput;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  void *v68;
  int v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t n;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t ii;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t jj;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t kk;
  uint64_t v100;
  NSObject *v101;
  void *v102;
  NSObject *v103;
  NSMutableArray *connections;
  id v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  id obj;
  id obja;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  CMContinuityCaptureAVCaptureVideoSession *v114;
  char *v115;
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint8_t v172[128];
  uint8_t buf[4];
  _BYTE v174[14];
  uint64_t v175;

  v175 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CMContinuityCaptureAVCaptureBaseSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[CMContinuityCaptureAVCaptureBaseSession state](self, "state") == 1)
  {
    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    v105 = v4;
    obj = v4;
    v114 = self;
    v113 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v172, 16);
    if (v113)
    {
      v111 = *(_QWORD *)v159;
      v6 = *MEMORY[0x24BDB1A68];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v159 != v111)
            objc_enumerationMutation(obj);
          v115 = v7;
          v8 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * (_QWORD)v7);
          -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession", v105);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "connections");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "containsObject:", v8);

          if (v11)
          {
            CMContinuityCaptureLog(2);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v174 = v8;
              _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "Removing connection: %@", buf, 0xCu);
            }

            -[CMContinuityCaptureAVCaptureBaseSession captureSession](v114, "captureSession");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeConnection:", v8);

            -[NSMutableArray removeObject:](v114->_connections, "removeObject:", v8);
          }
          objc_msgSend(v8, "inputPorts");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = 0u;
          v155 = 0u;
          v156 = 0u;
          v157 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v154, v171, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v155;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v155 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * i), "input");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v19, "device");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "deviceType");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v21, "isEqualToString:", v6);

                  v23 = &unk_24F07FBB8;
                  if (!v22)
                    goto LABEL_20;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v19, "device");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "deviceType");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "isEqualToString:", v6);

                  v23 = &unk_24F07FBD0;
                  if (v26)
LABEL_20:
                    -[NSMutableArray removeObject:](v114->_connectionEntities, "removeObject:", v23);
                }

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v154, v171, 16);
            }
            while (v16);
          }

          self = v114;
          v7 = v115 + 1;
        }
        while (v115 + 1 != (char *)v113);
        v113 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v172, 16);
      }
      while (v113);
    }

    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    v107 = obj;
    obja = (id)objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v150, v170, 16);
    if (obja)
    {
      v108 = *(_QWORD *)v151;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v151 != v108)
            objc_enumerationMutation(v107);
          v112 = v27;
          v28 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * v27);
          v146 = 0u;
          v147 = 0u;
          v148 = 0u;
          v149 = 0u;
          -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession", v105);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "connections");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v146, v169, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v147;
            while (2)
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v147 != v33)
                  objc_enumerationMutation(v30);
                objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * j), "output");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "output");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v35, "isEqual:", v36);

                if ((v37 & 1) != 0)
                {
                  p_isa = (id *)&v114->super.super.isa;
                  goto LABEL_42;
                }
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v146, v169, 16);
              if (v32)
                continue;
              break;
            }
          }

          CMContinuityCaptureLog(2);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v28, "output");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v174 = v39;
            _os_log_impl(&dword_227C5D000, v38, OS_LOG_TYPE_DEFAULT, "Removing output: %@", buf, 0xCu);

          }
          p_isa = (id *)&v114->super.super.isa;
          -[CMContinuityCaptureAVCaptureBaseSession captureSession](v114, "captureSession");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "output");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "removeOutput:", v41);

LABEL_42:
          objc_msgSend(p_isa, "captureSession");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "connections");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(p_isa[6], "connection");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v43, "containsObject:", v44);

          if (v45)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = 0u;
            v143 = 0u;
            v144 = 0u;
            v145 = 0u;
            -[AVCaptureVideoPreviewLayer connection](v114->_videoPreviewLayer, "connection");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "inputPorts");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v142, v168, 16);
            if (v49)
            {
              v50 = v49;
              v51 = *(_QWORD *)v143;
              do
              {
                for (k = 0; k != v50; ++k)
                {
                  if (*(_QWORD *)v143 != v51)
                    objc_enumerationMutation(v48);
                  objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * k), "input");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "addObject:", v53);

                }
                v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v142, v168, 16);
              }
              while (v50);
            }

            v140 = 0u;
            v141 = 0u;
            v138 = 0u;
            v139 = 0u;
            -[CMContinuityCaptureAVCaptureBaseSession captureSession](v114, "captureSession");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "connections");
            videoCameraInput = (void *)objc_claimAutoreleasedReturnValue();

            v56 = objc_msgSend(videoCameraInput, "countByEnumeratingWithState:objects:count:", &v138, v167, 16);
            if (v56)
            {
              v57 = v56;
              v58 = *(_QWORD *)v139;
              v106 = *(_QWORD *)v139;
              do
              {
                v59 = 0;
                v116 = (id)v57;
                do
                {
                  if (*(_QWORD *)v139 != v58)
                    objc_enumerationMutation(videoCameraInput);
                  v60 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v59);
                  -[AVCaptureVideoPreviewLayer connection](v114->_videoPreviewLayer, "connection");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = objc_msgSend(v60, "isEqual:", v61);

                  if ((v62 & 1) == 0)
                  {
                    v136 = 0u;
                    v137 = 0u;
                    v134 = 0u;
                    v135 = 0u;
                    objc_msgSend(v60, "inputPorts");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v134, v166, 16);
                    if (v64)
                    {
                      v65 = v64;
                      v66 = *(_QWORD *)v135;
                      while (2)
                      {
                        for (m = 0; m != v65; ++m)
                        {
                          if (*(_QWORD *)v135 != v66)
                            objc_enumerationMutation(v63);
                          objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * m), "input");
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          v69 = objc_msgSend(v46, "containsObject:", v68);

                          if (v69)
                          {

                            goto LABEL_71;
                          }
                        }
                        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v134, v166, 16);
                        if (v65)
                          continue;
                        break;
                      }
                    }

                    v58 = v106;
                    v57 = (uint64_t)v116;
                  }
                  ++v59;
                }
                while (v59 != v57);
                v57 = objc_msgSend(videoCameraInput, "countByEnumeratingWithState:objects:count:", &v138, v167, 16);
              }
              while (v57);
            }

            CMContinuityCaptureLog(2);
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              -[AVCaptureVideoPreviewLayer connection](v114->_videoPreviewLayer, "connection");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v174 = v71;
              _os_log_impl(&dword_227C5D000, v70, OS_LOG_TYPE_DEFAULT, "Removing preivew layer connection: %@", buf, 0xCu);

            }
            -[CMContinuityCaptureAVCaptureBaseSession captureSession](v114, "captureSession");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVCaptureVideoPreviewLayer connection](v114->_videoPreviewLayer, "connection");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "removeConnection:", v73);

            videoCameraInput = v114->_videoCameraInput;
            v114->_videoCameraInput = 0;
LABEL_71:

          }
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = 0u;
          v131 = 0u;
          v132 = 0u;
          v133 = 0u;
          objc_msgSend(v28, "inputPorts");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v130, v165, 16);
          if (v76)
          {
            v77 = v76;
            v78 = *(_QWORD *)v131;
            do
            {
              for (n = 0; n != v77; ++n)
              {
                if (*(_QWORD *)v131 != v78)
                  objc_enumerationMutation(v75);
                objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * n), "input");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "addObject:", v80);

              }
              v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v130, v165, 16);
            }
            while (v77);
          }

          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = 0u;
          v127 = 0u;
          v128 = 0u;
          v129 = 0u;
          -[CMContinuityCaptureAVCaptureBaseSession captureSession](v114, "captureSession");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "connections");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          v117 = v83;
          v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v126, v164, 16);
          if (v84)
          {
            v85 = v84;
            v86 = *(_QWORD *)v127;
            do
            {
              for (ii = 0; ii != v85; ++ii)
              {
                if (*(_QWORD *)v127 != v86)
                  objc_enumerationMutation(v117);
                v88 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * ii);
                v122 = 0u;
                v123 = 0u;
                v124 = 0u;
                v125 = 0u;
                objc_msgSend(v88, "inputPorts");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v122, v163, 16);
                if (v90)
                {
                  v91 = v90;
                  v92 = *(_QWORD *)v123;
                  do
                  {
                    for (jj = 0; jj != v91; ++jj)
                    {
                      if (*(_QWORD *)v123 != v92)
                        objc_enumerationMutation(v89);
                      objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * jj), "input");
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "addObject:", v94);

                    }
                    v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v122, v163, 16);
                  }
                  while (v91);
                }

              }
              v85 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v126, v164, 16);
            }
            while (v85);
          }

          v120 = 0u;
          v121 = 0u;
          v118 = 0u;
          v119 = 0u;
          v95 = v74;
          v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v118, v162, 16);
          self = v114;
          if (v96)
          {
            v97 = v96;
            v98 = *(_QWORD *)v119;
            do
            {
              for (kk = 0; kk != v97; ++kk)
              {
                if (*(_QWORD *)v119 != v98)
                  objc_enumerationMutation(v95);
                v100 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * kk);
                if ((objc_msgSend(v81, "containsObject:", v100) & 1) == 0)
                {
                  CMContinuityCaptureLog(2);
                  v101 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v174 = v100;
                    _os_log_impl(&dword_227C5D000, v101, OS_LOG_TYPE_DEFAULT, "Removing input: %@", buf, 0xCu);
                  }

                  -[CMContinuityCaptureAVCaptureBaseSession captureSession](v114, "captureSession");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "removeInput:", v100);

                }
              }
              v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v118, v162, 16);
            }
            while (v97);
          }

          v27 = v112 + 1;
        }
        while ((id)(v112 + 1) != obja);
        obja = (id)objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v150, v170, 16);
      }
      while (obja);
    }

    CMContinuityCaptureLog(2);
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      connections = self->_connections;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v174 = connections;
      _os_log_impl(&dword_227C5D000, v103, OS_LOG_TYPE_DEFAULT, "State After removal %@", buf, 0xCu);
    }
    v4 = v105;
  }
  else
  {
    CMContinuityCaptureLog(2);
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v174 = -[CMContinuityCaptureAVCaptureBaseSession state](self, "state");
      *(_WORD *)&v174[4] = 2080;
      *(_QWORD *)&v174[6] = "-[CMContinuityCaptureAVCaptureVideoSession removeConnections:]";
      _os_log_impl(&dword_227C5D000, v103, OS_LOG_TYPE_DEFAULT, "Invalid state %d for %s", buf, 0x12u);
    }
  }

}

- (BOOL)hasConnectionsForEntity:(int64_t)a3
{
  NSMutableArray *connectionEntities;
  void *v4;

  connectionEntities = self->_connectionEntities;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(connectionEntities) = -[NSMutableArray containsObject:](connectionEntities, "containsObject:", v4);

  return (char)connectionEntities;
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  objc_super v14;
  _QWORD block[4];
  id v16;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureAVCaptureVideoSession *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureAVCaptureBaseSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CMContinuityCaptureAVCaptureBaseSession state](self, "state");
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 1024;
    v21 = v5;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%@  start in state %d", buf, 0x12u);
  }

  if (-[CMContinuityCaptureAVCaptureBaseSession state](self, "state"))
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_12;
    }
    v7 = -[CMContinuityCaptureAVCaptureBaseSession state](self, "state");
    *(_DWORD *)buf = 138412802;
    v19 = self;
    v20 = 1024;
    v21 = v7;
    v22 = 2080;
    v23 = "-[CMContinuityCaptureAVCaptureVideoSession start]";
    v8 = "%@ Invalid state %d for %s";
    v9 = v6;
    v10 = 28;
LABEL_6:
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_7;
  }
  -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 0;

  if (v13)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v8 = "There are no active connections for start session";
    v9 = v6;
    v10 = 2;
    goto LABEL_6;
  }
  if (self->_videoPreviewLayer)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__CMContinuityCaptureAVCaptureVideoSession_start__block_invoke;
    block[3] = &unk_24F06AE60;
    objc_copyWeak(&v16, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v16);
  }
  v14.receiver = self;
  v14.super_class = (Class)CMContinuityCaptureAVCaptureVideoSession;
  -[CMContinuityCaptureAVCaptureBaseSession start](&v14, sel_start);
LABEL_12:
  objc_destroyWeak(&location);
}

void __49__CMContinuityCaptureAVCaptureVideoSession_start__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[6], "connection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setVideoOrientation:", 3);

    WeakRetained = v3;
  }

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  _DWORD v12[7];

  *(_QWORD *)&v12[5] = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureAVCaptureBaseSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[CMContinuityCaptureAVCaptureBaseSession state](self, "state") == 2)
  {
    -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v10.receiver = self;
      v10.super_class = (Class)CMContinuityCaptureAVCaptureVideoSession;
      -[CMContinuityCaptureAVCaptureBaseSession stop](&v10, sel_stop);
      -[AVCaptureVideoPreviewLayer setSession:](self->_videoPreviewLayer, "setSession:", 0);
      return;
    }
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "connections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v12 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "There are still %lu connections remaining. Not stopping the session.", buf, 0xCu);

    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v12[0] = -[CMContinuityCaptureAVCaptureBaseSession state](self, "state");
      LOWORD(v12[1]) = 2080;
      *(_QWORD *)((char *)&v12[1] + 2) = "-[CMContinuityCaptureAVCaptureVideoSession stop]";
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "Invalid state %d for %s", buf, 0x12u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEntities, 0);
  objc_storeStrong((id *)&self->_videoCameraInput, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_videoPreviewLayer, 0);
}

@end
