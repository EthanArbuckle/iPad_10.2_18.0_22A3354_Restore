@implementation IDSAWDLogging

- (id)_metricContainerForMetricType:(unsigned int)a3
{
  double v3;

  return (id)objc_msgSend_newMetricContainerWithIdentifier_(self->_AWDServerConnection, a2, *(uint64_t *)&a3, v3);
}

- (void)_submitAWDMetric:(id)a3 withContainer:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  int v18;
  const __CFString *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (v6 && v7)
  {
    objc_msgSend_setMetric_(v7, v8, (uint64_t)v6, v9);
    v13 = objc_msgSend_submitMetric_(self->_AWDServerConnection, v11, (uint64_t)v10, v12);
    OSLogHandleForIDSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_msgSend_metricId(v10, v15, v16, v17);
      v19 = CFSTR("NO");
      if (v13)
        v19 = CFSTR("YES");
      *(_DWORD *)buf = 67109378;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEBUG, "Submitted metric: 0x%x succeeded? %@", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_metricId(v10, v20, v21, v22);
      _IDSLogV(1, CFSTR("IDSFoundation"), CFSTR("IDSAWDLogging"), CFSTR("Submitted metric: 0x%x succeeded? %@"));
    }
  }

}

- (BOOL)_shouldSubmit
{
  return 1;
}

+ (id)sharedInstance
{
  if (qword_1ECDD47C0 != -1)
    dispatch_once(&qword_1ECDD47C0, &unk_1E3C1B7F0);
  return (id)qword_1ECDD4810;
}

- (IDSAWDLogging)init
{
  IDSAWDLogging *v2;
  id v3;
  const char *v4;
  double v5;
  uint64_t v6;
  AWDServerConnection *AWDServerConnection;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IDSAWDLogging;
  v2 = -[IDSAWDLogging init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc((Class)CUTWeakLinkClass());
    v6 = objc_msgSend_initWithComponentId_andBlockOnConfiguration_(v3, v4, 39, v5, 1);
    AWDServerConnection = v2->_AWDServerConnection;
    v2->_AWDServerConnection = (AWDServerConnection *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(-32768, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2("com.apple.IDS.AWDLogging", v8, v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (void)submitMetric:(id)a3 withIdentifier:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  OS_dispatch_queue *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v9 = (void *)objc_msgSend_newMetricContainerWithIdentifier_(self->_AWDServerConnection, v7, v4, v8);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19BA2EE5C;
  v13[3] = &unk_1E3C1FE50;
  v13[4] = self;
  v14 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v6;
  IDSAWDSubmitBlockAsync(queue, v13);

}

- (AWDServerConnection)AWDServerConnection
{
  return (AWDServerConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AWDServerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)IDSQuickRelayEventType:(id)a3 eventSubType:(id)a4 duration:(id)a5 resultCode:(id)a6 providerType:(id)a7 transportType:(id)a8 interfaceType:(id)a9 skeEnabled:(id)a10 isInitiator:(id)a11 protocolVersion:(id)a12 retryCount:(id)a13 serviceName:(id)a14 subServiceName:(id)a15 participantCount:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  char isInternalInstall;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  int v40;
  const char *v41;
  uint64_t v42;
  double v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  const char *v54;
  double v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  OS_dispatch_queue *queue;
  id v68;
  id v69;
  id v70;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  char v93;

  v78 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v77 = a7;
  v76 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v75 = a13;
  v74 = a14;
  v73 = a15;
  v72 = a16;
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalInstall = objc_msgSend_isInternalInstall(v31, v32, v33, v34);

  v39 = v26;
  if (!v26
    || (isInternalInstall & 1) != 0
    || (v40 = objc_msgSend_BOOLValue(v26, v36, v37, v38),
        IDSAWDLogShouldSubmitHotShipQuickRelayMetric(v40, v41, v42, v43)))
  {
    queue = self->_queue;
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = sub_19BABA1C0;
    v79[3] = &unk_1E3C21FD0;
    v79[4] = self;
    v66 = v78;
    v80 = v66;
    v65 = v21;
    v81 = v65;
    v64 = v22;
    v82 = v64;
    v93 = isInternalInstall;
    v63 = v23;
    v83 = v63;
    v62 = v77;
    v84 = v62;
    v69 = v23;
    v61 = v76;
    v85 = v61;
    v70 = v22;
    v60 = v24;
    v86 = v60;
    v44 = v25;
    v87 = v44;
    v68 = v21;
    v45 = v39;
    v88 = v45;
    v46 = v27;
    v89 = v46;
    v47 = v39;
    v48 = v25;
    v49 = v75;
    v90 = v49;
    v50 = v24;
    v51 = v74;
    v91 = v51;
    v52 = v27;
    v53 = v73;
    v92 = v53;
    IDSAWDSubmitBlockAsync(queue, v79);
    v59 = v53;
    v27 = v52;
    v57 = v49;
    v58 = v51;
    v24 = v50;
    v25 = v48;
    v39 = v47;
    v56 = v45;
    v21 = v68;
    v23 = v69;
    v22 = v70;
    objc_msgSend_IDSCoreAnalyticsQuickRelayEventType_eventSubType_duration_resultCode_providerType_transportType_interfaceType_skeEnabled_isInitiator_protocolVersion_retryCount_serviceName_subServiceName_participantCount_(self, v54, (uint64_t)v66, v55, v65, v64, v63, v62, v61, v60, v44, v56, v46, v57, v58, v59, v72);

  }
}

@end
