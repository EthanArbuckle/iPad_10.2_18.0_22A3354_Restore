@implementation IMRemoteURLConnection

- (IMRemoteURLConnection)initWithURLRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  IMRemoteURLConnection *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1906AB7B0;
  v11[3] = &unk_1E2C45DB0;
  v12 = v6;
  v7 = v6;
  v9 = (IMRemoteURLConnection *)objc_msgSend_initWithURLRequest_completionBlockWithTimingData_(self, v8, (uint64_t)a3, (uint64_t)v11);

  return v9;
}

- (IMRemoteURLConnection)initWithURLRequest:(id)a3 completionBlockWithTimingData:(id)a4
{
  id v7;
  id v8;
  IMRemoteURLConnection *v9;
  IMRemoteURLConnection *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id block;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  IMRemoteURLConnection *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IMRemoteURLConnection;
  v9 = -[IMRemoteURLConnection init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_msgSend_URLLoading(IMIDSLog, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v7;
      v24 = 2048;
      v25 = v10;
      _os_log_impl(&dword_19066D000, v14, OS_LOG_TYPE_DEFAULT, "Init with URL request: %@  (%p)", buf, 0x16u);
    }

    v18 = objc_msgSend_copy(v8, v15, v16, v17);
    block = v10->_block;
    v10->_block = (id)v18;

  }
  return v10;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  NSURLRequest *request;
  objc_super v7;
  uint8_t buf[4];
  NSURLRequest *v9;
  __int16 v10;
  IMRemoteURLConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend_URLLoading(IMIDSLog, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412546;
    v9 = request;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "Released URL request: %@  (%p)", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)IMRemoteURLConnection;
  -[IMRemoteURLConnection dealloc](&v7, sel_dealloc);
}

- (void)load
{
  if (!self->_loading)
  {
    self->_cancelled = 0;
    ((void (*)(IMRemoteURLConnection *, char *))MEMORY[0x1E0DE7D20])(self, sel__direct_load);
  }
}

- (void)cancel
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  NSURLRequest *request;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id block;
  int v11;
  NSURLRequest *v12;
  __int16 v13;
  IMRemoteURLConnection *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend_URLLoading(IMIDSLog, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    v11 = 138412546;
    v12 = request;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling URL request: %@  (%p)", (uint8_t *)&v11, 0x16u);
  }

  self->_cancelled = 1;
  block = self->_block;
  if (block)
  {
    self->_block = 0;

  }
  objc_msgSend__direct_cancel(self, v7, v8, v9);
}

- (BOOL)requireIDSHost
{
  return self->_requireIDSHost;
}

- (void)setRequireIDSHost:(BOOL)a3
{
  self->_requireIDSHost = a3;
}

- (BOOL)forceCellularIfPossible
{
  return self->_forceCellularIfPossible;
}

- (void)setForceCellularIfPossible:(BOOL)a3
{
  self->_forceCellularIfPossible = a3;
}

- (NSString)bundleIdentifierForDataUsage
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleIdentifierForDataUsage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)shouldUsePipelining
{
  return self->_shouldUsePipelining;
}

- (void)setShouldUsePipelining:(BOOL)a3
{
  self->_shouldUsePipelining = a3;
}

- (int)concurrentConnections
{
  return self->_concurrentConnections;
}

- (void)setConcurrentConnections:(int)a3
{
  self->_concurrentConnections = a3;
}

- (BOOL)disableKeepAlive
{
  return self->_disableKeepAlive;
}

- (void)setDisableKeepAlive:(BOOL)a3
{
  self->_disableKeepAlive = a3;
}

- (int)keepAliveWifi
{
  return self->_keepAliveWifi;
}

- (void)setKeepAliveWifi:(int)a3
{
  self->_keepAliveWifi = a3;
}

- (int)keepAliveCell
{
  return self->_keepAliveCell;
}

- (void)setKeepAliveCell:(int)a3
{
  self->_keepAliveCell = a3;
}

- (BOOL)shouldReturnTimingData
{
  return self->_shouldReturnTimingData;
}

- (void)setShouldReturnTimingData:(BOOL)a3
{
  self->_shouldReturnTimingData = a3;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)block
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (IMURLRequestSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_URLSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDataUsage, 0);
}

- (void)_direct_cancel
{
  IMURLRequestSession *URLSession;

  URLSession = self->_URLSession;
  self->_URLSession = 0;

}

- (void)_direct_load
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int isDataConnectionActive;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t shouldUsePipelining;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  NSURLRequest *request;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const __CFString *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const __CFString *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const __CFString *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const __CFString *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  int shouldReturnTimingData;
  const __CFString *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  IMURLRequestSession *v157;
  IMURLRequestSession *URLSession;
  IMURLRequestSession *v159;
  NSURLRequest *v160;
  const char *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  _QWORD v165[5];
  uint8_t buf[4];
  void *v167;
  uint64_t v168;

  v168 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_mutableCopy(self->_request, a2, v2, v3);
  if (objc_msgSend_forceCellularIfPossible(self, v6, v7, v8)
    && (objc_msgSend_sharedInstance(IMMobileNetworkManager, v9, v10, v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        isDataConnectionActive = objc_msgSend_isDataConnectionActive(v12, v13, v14, v15),
        v12,
        isDataConnectionActive))
  {
    IMPCInterfaceName();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_length(v17, v18, v19, v20);
  }
  else
  {
    v17 = 0;
    v21 = objc_msgSend_length(0, v9, v10, v11);
  }
  if (v21)
    objc_msgSend_setBoundInterfaceIdentifier_(v5, v22, (uint64_t)v17, v24);
  if (objc_msgSend_disableKeepAlive(self, v22, v23, v24))
    objc_msgSend_addValue_forHTTPHeaderField_(v5, v25, (uint64_t)CFSTR("close"), (uint64_t)CFSTR("Connection"));
  shouldUsePipelining = objc_msgSend_shouldUsePipelining(self, v25, v26, v27);
  objc_msgSend_setHTTPShouldUsePipelining_(v5, v29, shouldUsePipelining, v30);
  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x1E0CB39F8], v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifierForDataUsage(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend_bundleIdentifierForDataUsage(self, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_sourceApplicationBundleIdentifier_(v34, v43, (uint64_t)v42, v44);

  }
  if ((int)objc_msgSend_concurrentConnections(self, v39, v40, v41) >= 1
    && (int)objc_msgSend_concurrentConnections(self, v45, v46, v47) <= 49)
  {
    v48 = objc_msgSend_concurrentConnections(self, v45, v46, v47);
    objc_msgSend_setHTTPMaximumConnectionsPerHost_(v34, v49, v48, v50);
  }
  if ((int)objc_msgSend_keepAliveWifi(self, v45, v46, v47) >= 1
    && (int)objc_msgSend_keepAliveWifi(self, v51, v52, v53) < 600000)
  {
    v54 = objc_msgSend_keepAliveWifi(self, v51, v52, v53);
    objc_msgSend_set_connectionCachePurgeTimeout_(v34, v55, v56, v57, (double)v54);
  }
  if ((int)objc_msgSend_keepAliveCell(self, v51, v52, v53) >= 1
    && (int)objc_msgSend_keepAliveCell(self, v58, v59, v60) < 600000)
  {
    v61 = objc_msgSend_keepAliveCell(self, v58, v59, v60);
    objc_msgSend_set_connectionCacheCellPurgeTimeout_(v34, v62, v63, v64, (double)v61);
  }
  if (objc_msgSend_shouldReturnTimingData(self, v58, v59, v60))
    objc_msgSend_set_timingDataOptions_(v34, v65, 132, v67);
  objc_msgSend_URLLoading(IMIDSLog, v65, v66, v67);
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    request = self->_request;
    *(_DWORD *)buf = 138412290;
    v167 = request;
    _os_log_impl(&dword_19066D000, v68, OS_LOG_TYPE_DEFAULT, "Beginning direct load of URL request: %@", buf, 0xCu);
  }

  objc_msgSend_URLLoading(IMIDSLog, v70, v71, v72);
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_forceCellularIfPossible(self, v74, v75, v76))
      v77 = CFSTR("YES");
    else
      v77 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v167 = (void *)v77;
    _os_log_impl(&dword_19066D000, v73, OS_LOG_TYPE_DEFAULT, " Try force cell: %@", buf, 0xCu);
  }

  objc_msgSend_URLLoading(IMIDSLog, v78, v79, v80);
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_bundleIdentifierForDataUsage(self, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v167 = v85;
    _os_log_impl(&dword_19066D000, v81, OS_LOG_TYPE_DEFAULT, " data usage identifier: %@", buf, 0xCu);

  }
  objc_msgSend_URLLoading(IMIDSLog, v86, v87, v88);
  v89 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_requireIDSHost(self, v90, v91, v92))
      v93 = CFSTR("YES");
    else
      v93 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v167 = (void *)v93;
    _os_log_impl(&dword_19066D000, v89, OS_LOG_TYPE_DEFAULT, " requireIDSHost: %@", buf, 0xCu);
  }

  objc_msgSend_URLLoading(IMIDSLog, v94, v95, v96);
  v97 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_shouldUsePipelining(self, v98, v99, v100))
      v101 = CFSTR("YES");
    else
      v101 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v167 = (void *)v101;
    _os_log_impl(&dword_19066D000, v97, OS_LOG_TYPE_DEFAULT, " shouldUsePipelining: %@", buf, 0xCu);
  }

  objc_msgSend_URLLoading(IMIDSLog, v102, v103, v104);
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    v109 = objc_msgSend_concurrentConnections(self, v106, v107, v108);
    *(_DWORD *)buf = 67109120;
    LODWORD(v167) = v109;
    _os_log_impl(&dword_19066D000, v105, OS_LOG_TYPE_DEFAULT, " concurreentConnection: %d", buf, 8u);
  }

  objc_msgSend_URLLoading(IMIDSLog, v110, v111, v112);
  v113 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_disableKeepAlive(self, v114, v115, v116))
      v117 = CFSTR("YES");
    else
      v117 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v167 = (void *)v117;
    _os_log_impl(&dword_19066D000, v113, OS_LOG_TYPE_DEFAULT, " disableKeepAlive: %@", buf, 0xCu);
  }

  objc_msgSend_URLLoading(IMIDSLog, v118, v119, v120);
  v121 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    v125 = (void *)MEMORY[0x1E0CB37E8];
    v126 = objc_msgSend_keepAliveWifi(self, v122, v123, v124);
    objc_msgSend_numberWithInt_(v125, v127, v126, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v167 = v129;
    _os_log_impl(&dword_19066D000, v121, OS_LOG_TYPE_DEFAULT, " keepAliveWifi: %@", buf, 0xCu);

  }
  objc_msgSend_URLLoading(IMIDSLog, v130, v131, v132);
  v133 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
  {
    v137 = (void *)MEMORY[0x1E0CB37E8];
    v138 = objc_msgSend_keepAliveCell(self, v134, v135, v136);
    objc_msgSend_numberWithInt_(v137, v139, v138, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v167 = v141;
    _os_log_impl(&dword_19066D000, v133, OS_LOG_TYPE_DEFAULT, " keepAliveCell: %@", buf, 0xCu);

  }
  objc_msgSend_URLLoading(IMIDSLog, v142, v143, v144);
  v145 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
  {
    shouldReturnTimingData = objc_msgSend_shouldReturnTimingData(self, v146, v147, v148);
    v150 = CFSTR("YES");
    if (!shouldReturnTimingData)
      v150 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v167 = (void *)v150;
    _os_log_impl(&dword_19066D000, v145, OS_LOG_TYPE_DEFAULT, " shouldReturnTimingData: %@", buf, 0xCu);
  }

  im_primary_queue();
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = objc_msgSend_requireIDSHost(self, v152, v153, v154);
  objc_msgSend_sessionWithConfiguration_queue_requiresIDSHost_(IMURLRequestSession, v156, (uint64_t)v34, (uint64_t)v151, v155);
  v157 = (IMURLRequestSession *)objc_claimAutoreleasedReturnValue();
  URLSession = self->_URLSession;
  self->_URLSession = v157;

  v159 = self->_URLSession;
  v160 = self->_request;
  v165[0] = MEMORY[0x1E0C809B0];
  v165[1] = 3221225472;
  v165[2] = sub_1906AC2AC;
  v165[3] = &unk_1E2C46448;
  v165[4] = self;
  objc_msgSend_performRequest_completionBlockWithTimingData_(v159, v161, (uint64_t)v160, (uint64_t)v165);
  objc_msgSend_finishTasksAndInvalidate(self->_URLSession, v162, v163, v164);

}

@end
