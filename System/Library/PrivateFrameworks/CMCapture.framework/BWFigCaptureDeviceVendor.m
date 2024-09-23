@implementation BWFigCaptureDeviceVendor

- (int)createDeviceTime
{
  return self->_createDeviceTime;
}

- (int)registerClientWithPID:(int)a3 clientApplicationID:(id)a4 clientDescription:(id)a5 clientPriority:(int)a6 canStealFromClientsWithSamePriority:(BOOL)a7 deviceSharingWithOtherClientsAllowed:(BOOL)a8 deviceAvailabilityChangedHandler:(id)a9
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v11;
  _QWORD v13[9];
  int v14;
  int v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __209__BWFigCaptureDeviceVendor_registerClientWithPID_clientApplicationID_clientDescription_clientPriority_canStealFromClientsWithSamePriority_deviceSharingWithOtherClientsAllowed_deviceAvailabilityChangedHandler___block_invoke;
  v13[3] = &unk_1E4923618;
  v16 = a8;
  v13[7] = a9;
  v13[8] = &v18;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a5;
  v14 = a3;
  v15 = a6;
  v17 = a7;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v13);
  if (!self->_cameraCalibrationValid)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v11 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)_performBlockOnDeviceQueueSynchronously:(uint64_t)a1
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    if (a2)
    {
      v2 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__BWFigCaptureDeviceVendor__performBlockOnDeviceQueueSynchronously___block_invoke;
      block[3] = &unk_1E491ECB8;
      block[4] = a2;
      dispatch_sync(v2, block);
    }
  }
}

- (uint64_t)_createDevice:(uint64_t)a3 reason:(int)a4 clientPID:
{
  uint64_t v4;
  uint64_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFString *v9;
  uint64_t (*v10)(_QWORD, const __CFString *, CFTypeRef *);
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  BWFigCaptureDevice *v22;
  BWFigCaptureDevice *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  __CFString *v38;
  NSObject *v39;
  int v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  NSArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  BWFigVideoCaptureSynchronizedStreamsGroup *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  BWFigCaptureDeviceVendorDeviceState *v64;
  NSArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  BWFigCaptureDevice *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v77;
  unsigned int v78;
  unsigned int v79;
  NSObject *v80;
  unsigned int v81;
  unsigned int v82;
  NSObject *v83;
  unsigned int v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  int *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __CFString *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  BWFigCaptureDevice *v98;
  uint64_t v99;
  NSArray *obj;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  CFTypeRef cf;
  _QWORD handler[5];
  os_log_type_t type[16];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  int v121;
  const char *v122;
  __int16 v123;
  CFTypeRef v124;
  uint8_t buf[4];
  int v126;
  int v127;
  __int128 v128;
  _DWORD v129[7];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = a1;
  if (!_FigIsCurrentDispatchQueue())
  {
    v89 = v4;
    LODWORD(v86) = 0;
    FigDebugAssert3();
  }
  v93 = a2;
  if (-[__CFString isEqualToString:](a2, "isEqualToString:", v86, v89))
  {
    if (*(_QWORD *)(v7 + 88))
    {
      -[BWFigCaptureDeviceVendor _showISPLeftOnTapToRadarPromptIfNecessary:radarTitle:radarDescription:radarClassification:radarReproducibility:](v7, (uint64_t)CFSTR("ISP left powered on. Please file a radar."), (uint64_t)CFSTR("Stale BWFigCaptureDevice activity assertion found!"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Found stale assertion: %@"), objc_msgSend(*(id *)(v7 + 144), "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")), *(_QWORD *)(v7 + 88)), 3, 6);
      LODWORD(v115) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      *(_QWORD *)(v7 + 88) = 0;
    }
    if (a4 <= 0)
      getpid();
    *(_QWORD *)(v7 + 88) = FigOSTransactionCreate();
  }
  v9 = a2;
  if (-[__CFString isEqualToString:](a2, "isEqualToString:", 0x1E492D2B8, v87, v90))
  {
    v10 = *(uint64_t (**)(_QWORD, const __CFString *, CFTypeRef *))(v7 + 8);
    if (*(_QWORD *)(v7 + 64))
    {
      LODWORD(v115) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      dispatch_source_cancel(*(dispatch_source_t *)(v7 + 64));
      dispatch_release(*(dispatch_object_t *)(v7 + 64));
      *(_QWORD *)(v7 + 64) = 0;
    }
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v7 + 56));
    v13 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v12, v13, 0x6FC23AC00uLL, 0x29A2241AF62C0000uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __59__BWFigCaptureDeviceVendor__createDevice_reason_clientPID___block_invoke;
    handler[3] = &unk_1E491E720;
    handler[4] = v7;
    dispatch_source_set_event_handler(v12, handler);
    *(_QWORD *)(v7 + 64) = v12;
    dispatch_activate(v12);
    v9 = CFSTR("com.apple.CMCapture");
  }
  else
  {
    v10 = *(uint64_t (**)(_QWORD, const __CFString *, CFTypeRef *))(v7 + 16);
  }
  if (!v10)
  {
    LODWORD(v115) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v77 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v78 = v115;
    if (os_log_type_enabled(v77, type[0]))
      v79 = v78;
    else
      v79 = v78 & 0xFFFFFFFE;
    if (!v79)
      goto LABEL_134;
    v121 = 136315138;
    v122 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
    LODWORD(v91) = 12;
    v88 = &v121;
    goto LABEL_133;
  }
  v92 = v7;
  if (-[__CFString isEqualToString:](a2, "isEqualToString:", 0x1E492D2B8))
  {
    mach_absolute_time();
    if (*MEMORY[0x1E0CA1FC0])
    {
      v14 = fig_log_handle();
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A2C80000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ISPCreateDuration", (const char *)&unk_1A332D80B, buf, 2u);
      }
    }
  }
  if (dword_1ECFE98D0)
  {
    LODWORD(v115) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v16 = v115;
    if (os_log_type_enabled(v15, type[0]))
      v17 = v16;
    else
      v17 = v16 & 0xFFFFFFFE;
    if (v17)
    {
      v121 = 136315138;
      v122 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
      LODWORD(v91) = 12;
      v88 = &v121;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  cf = 0;
  v18 = v10(*MEMORY[0x1E0C9AE00], v9, &cf);
  if (dword_1ECFE98D0)
  {
    LODWORD(v115) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v20 = v115;
    if (os_log_type_enabled(v19, type[0]))
      v21 = v20;
    else
      v21 = v20 & 0xFFFFFFFE;
    if (v21)
    {
      v121 = 136315394;
      v122 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
      v123 = 2048;
      v124 = cf;
      LODWORD(v91) = 22;
      v88 = &v121;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)v18)
  {
    LODWORD(v115) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v80 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v81 = v115;
    if (os_log_type_enabled(v80, type[0]))
      v82 = v81;
    else
      v82 = v81 & 0xFFFFFFFE;
    if (v82)
    {
      v121 = 136315394;
      v122 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
      v123 = 1024;
      LODWORD(v124) = v18;
      LODWORD(v91) = 18;
      v88 = &v121;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_136;
  }
  v22 = [BWFigCaptureDevice alloc];
  v23 = -[BWFigCaptureDevice initWithFigCaptureDevice:deviceID:](v22, "initWithFigCaptureDevice:deviceID:", cf, v93);
  if (cf)
    CFRelease(cf);
  if (v23)
  {
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v24, "setObject:forKeyedSubscript:", -[BWFigCaptureDevice description](v23, "description"), CFSTR("Description"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", -[BWFigCaptureDevice deviceID](v23, "deviceID"), CFSTR("DeviceID"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v7 + 144), "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")), CFSTR("CreationDate"));
    v25 = -[__CFString isEqualToString:](v93, "isEqualToString:", 0x1E492D2B8);
    v26 = 136;
    if (v25)
      v26 = 128;
    v27 = *(void **)(v7 + v26);
    v98 = v23;
    if ((unint64_t)objc_msgSend(v27, "count", v88, v91) >= 0xA)
    {
      if (v25)
      {
        v28 = (void *)objc_msgSend(v27, "firstObject");
        if (!objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ReleaseDate")))
          -[BWFigCaptureDeviceVendor _showISPLeftOnTapToRadarPromptIfNecessary:radarTitle:radarDescription:radarClassification:radarReproducibility:](v7, (uint64_t)CFSTR("ISP left powered on. Please file a radar."), (uint64_t)CFSTR("BWFigCaptureDevice was never released!"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Found stale BWFigCaptureDevice: %@"), objc_msgSend(*(id *)(v7 + 144), "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")), v28), 3, 6);
        objc_msgSend(v27, "removeObjectAtIndex:", 0);
      }
      else
      {
        v29 = objc_msgSend(v27, "count");
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v31 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
        if (v31)
        {
          v32 = v31;
          v33 = 0;
          v34 = *(_QWORD *)v106;
          v35 = v29 - 10;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v106 != v34)
                objc_enumerationMutation(v27);
              v37 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
              if (objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ReleaseDate")))
              {
                objc_msgSend(v30, "addObject:", v37);
                if (v33 == v35)
                  goto LABEL_55;
                ++v33;
              }
            }
            v32 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
          }
          while (v32);
        }
LABEL_55:
        if (objc_msgSend(v30, "count"))
          objc_msgSend(v27, "removeObjectsInArray:", v30);

        v7 = v92;
        v23 = v98;
      }
    }
    objc_msgSend(v27, "addObject:", v24);
    v38 = v93;
    if (-[__CFString isEqualToString:](v93, "isEqualToString:", 0x1E492D2B8))
    {
      mach_absolute_time();
      *(_DWORD *)(v7 + 108) = ((int)FigHostTimeToNanoseconds() / 1000 + 999) / 1000;
      if (*MEMORY[0x1E0CA1FC0])
      {
        v39 = fig_log_handle();
        if (os_signpost_enabled(v39))
        {
          v40 = *(_DWORD *)(v7 + 108);
          *(_DWORD *)buf = 67240192;
          v126 = v40;
          _os_signpost_emit_with_name_impl(&dword_1A2C80000, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISPCreateDuration", " enableTelemetry=YES N1=%{public,signpost.telemetry:number1}d", buf, 8u);
        }
      }
      -[BWAggdDataReporter reportISPCreateDuration:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportISPCreateDuration:", *(unsigned int *)(v7 + 108));
      -[BWFigCaptureDeviceVendor _logISPStartupTimeToCoreAnalytics](v7);
    }
    -[BWFigCaptureDevice registerForNotification:listener:callback:](v23, "registerForNotification:listener:callback:", CFSTR("UnrecoverableError"), v7, fcdv_handleDeviceUnrecoverableError);
    -[BWFigCaptureDevice registerForNotification:listener:callback:](v23, "registerForNotification:listener:callback:", CFSTR("DeviceNoLongerAvailable"), v7, fcdv_handleDeviceNoLongerAvailable);
    if (-[__CFString isEqualToString:](v93, "isEqualToString:", 0x1E492D2B8))
    {
      v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      memset(v129, 0, sizeof(v129));
      v128 = 0u;
      v127 = 1065353216;
      v129[0] = 1065353216;
      v129[5] = 1065353216;
      v42 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v127, 48);
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      obj = -[BWFigCaptureDevice streams](v23, "streams");
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
      if (!v43)
        goto LABEL_96;
      v44 = v43;
      v45 = *(_QWORD *)v116;
      v46 = *MEMORY[0x1E0D073F8];
      v96 = *MEMORY[0x1E0D05A18];
      v95 = *MEMORY[0x1E0D05A38];
      v94 = *MEMORY[0x1E0D05A50];
      v97 = *(_QWORD *)v116;
      while (1)
      {
        v47 = 0;
        v99 = v44;
        do
        {
          if (*(_QWORD *)v116 != v45)
            objc_enumerationMutation(obj);
          v48 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v47);
          if (!objc_msgSend((id)objc_msgSend(v48, "supportedProperties"), "objectForKeyedSubscript:", v46))
          {
            v51 = v42;
            v52 = v41;
            v113 = 0u;
            v114 = 0u;
            *(_OWORD *)type = 0u;
            v112 = 0u;
            v53 = -[BWFigCaptureDevice synchronizedStreamsGroups](v23, "synchronizedStreamsGroups");
            v54 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", type, &v121, 16);
            if (v54)
            {
              v55 = v54;
              v56 = *(_QWORD *)v112;
LABEL_75:
              v57 = 0;
              while (1)
              {
                if (*(_QWORD *)v112 != v56)
                  objc_enumerationMutation(v53);
                v58 = *(void **)(*(_QWORD *)&type[8] + 8 * v57);
                if ((objc_msgSend((id)objc_msgSend(v58, "streams"), "containsObject:", v48) & 1) != 0)
                  break;
                if (v55 == ++v57)
                {
                  v55 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", type, &v121, 16);
                  if (v55)
                    goto LABEL_75;
                  goto LABEL_84;
                }
              }
              v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v48, 0);
              v60 = -[BWFigVideoCaptureSynchronizedStreamsGroup initWithSynchronizedStreamsGroup:activeStreams:readOnly:baseZoomFactorOverrides:clientBaseZoomFactorsByPortType:error:]([BWFigVideoCaptureSynchronizedStreamsGroup alloc], "initWithSynchronizedStreamsGroup:activeStreams:readOnly:baseZoomFactorOverrides:clientBaseZoomFactorsByPortType:error:", v58, v59, 1, 0, 0, 0);

              if (!v60)
                goto LABEL_84;
              v61 = -[BWFigVideoCaptureSynchronizedStreamsGroup cameraPoseMatrixForPortType:](v60, "cameraPoseMatrixForPortType:", objc_msgSend(v48, "portType"));
              v23 = v98;
              v41 = v52;
              v42 = v51;
LABEL_88:
              v45 = v97;
              v44 = v99;
              goto LABEL_89;
            }
LABEL_84:
            if ((objc_msgSend((id)objc_msgSend(v48, "portType"), "isEqualToString:", v96) & 1) != 0)
            {
              v60 = 0;
              v42 = v51;
              v61 = v51;
              v23 = v98;
              v41 = v52;
              goto LABEL_88;
            }
            v23 = v98;
            v41 = v52;
            v42 = v51;
            if ((objc_msgSend((id)objc_msgSend(v48, "portType"), "isEqualToString:", v95) & 1) != 0)
            {
              v60 = 0;
              v61 = v51;
              goto LABEL_88;
            }
            v60 = 0;
            v61 = v51;
            v45 = v97;
            v44 = v99;
            if (objc_msgSend((id)objc_msgSend(v48, "portType"), "isEqualToString:", v94))
LABEL_89:
              objc_msgSend(v41, "setObject:forKeyedSubscript:", v61, objc_msgSend(v48, "portType"));

            goto LABEL_91;
          }
          v49 = (void *)objc_msgSend(v48, "getProperty:error:", v46, 0);
          v50 = (void *)v42;
          if (v49)
            v50 = BWInvertRowMajorViewMatrixData(v49);
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v50, objc_msgSend(v48, "portType"));
LABEL_91:
          ++v47;
        }
        while (v47 != v44);
        v62 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
        v44 = v62;
        if (!v62)
        {
LABEL_96:
          v63 = (void *)objc_msgSend(v41, "copy");

          v7 = v92;
          v38 = v93;
          objc_msgSend(*(id *)(v92 + 96), "setObject:forKeyedSubscript:", v63, v93);

          break;
        }
      }
    }
    v64 = -[BWFigCaptureDeviceVendorDeviceState initWithDevice:]([BWFigCaptureDeviceVendorDeviceState alloc], "initWithDevice:", v23);
    objc_msgSend(*(id *)(v7 + 24), "setObject:forKeyedSubscript:", v64, v38);
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v65 = -[BWFigCaptureDevice streams](v23, "streams");
    v66 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v102;
      v69 = *MEMORY[0x1E0D07828];
      v70 = *MEMORY[0x1E0D07398];
      do
      {
        for (j = 0; j != v67; ++j)
        {
          if (*(_QWORD *)v102 != v68)
            objc_enumerationMutation(v65);
          v72 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
          if (objc_msgSend((id)objc_msgSend(v72, "supportedProperties"), "objectForKeyedSubscript:", v69))
            -[NSMutableSet addObject:](-[BWFigCaptureDeviceVendorDeviceState portTypesToCheckForToFAFEstimator](v64, "portTypesToCheckForToFAFEstimator"), "addObject:", objc_msgSend(v72, "portType"));
          if (objc_msgSend((id)objc_msgSend(v72, "supportedProperties"), "objectForKeyedSubscript:", v70))
            -[NSMutableSet addObject:](-[BWFigCaptureDeviceVendorDeviceState portTypesToCheckForAFDriverShortStatistics](v64, "portTypesToCheckForAFDriverShortStatistics"), "addObject:", objc_msgSend(v72, "portType"));
        }
        v67 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
      }
      while (v67);
    }
    v18 = 0;
    v73 = v98;
    if (v64)
      goto LABEL_116;
    goto LABEL_109;
  }
  LODWORD(v115) = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  v83 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  v84 = v115;
  if (os_log_type_enabled(v83, type[0]))
    v85 = v84;
  else
    v85 = v84 & 0xFFFFFFFE;
  if (v85)
  {
    v121 = 136315138;
    v122 = "-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:]";
    LODWORD(v91) = 12;
    v88 = &v121;
LABEL_133:
    _os_log_send_and_compose_impl();
  }
LABEL_134:
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  v18 = 0;
LABEL_136:
  v73 = 0;
  if (!-[__CFString isEqualToString:](v93, "isEqualToString:", 0x1E492D2B8, v88, v91))
    goto LABEL_115;
LABEL_109:
  if (*MEMORY[0x1E0CA1FC0])
  {
    v74 = fig_log_handle();
    if (os_signpost_enabled(v74))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2C80000, v74, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISPCreateDuration", (const char *)&unk_1A332D80B, buf, 2u);
    }
  }

  *(_QWORD *)(v7 + 88) = 0;
  v75 = *(NSObject **)(v7 + 64);
  if (v75)
  {
    dispatch_source_cancel(v75);
    dispatch_release(*(dispatch_object_t *)(v7 + 64));
    v64 = 0;
    *(_QWORD *)(v7 + 64) = 0;
  }
  else
  {
LABEL_115:
    v64 = 0;
  }
LABEL_116:

  return v18;
}

- (uint64_t)_logISPStartupTimeToCoreAnalytics
{
  uint64_t v1;
  BWISPStartupAnalyticsPayload *v2;

  if (result)
  {
    v1 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    v2 = objc_alloc_init(BWISPStartupAnalyticsPayload);
    -[BWISPStartupAnalyticsPayload setIspStartupTime:](v2, "setIspStartupTime:", *(unsigned int *)(v1 + 108));
    return -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v2);
  }
  return result;
}

- (void)prewarmDefaultVideoDeviceForPID:(int)a3 completionHandler:(id)a4
{
  _QWORD v4[6];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__BWFigCaptureDeviceVendor_prewarmDefaultVideoDeviceForPID_completionHandler___block_invoke;
  v4[3] = &unk_1E49235F0;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueue:]((uint64_t)self, (uint64_t)v4);
}

- (void)_performBlockOnDeviceQueue:(uint64_t)a1
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    if (a2)
    {
      v2 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
      block[3] = &unk_1E491ECB8;
      block[4] = a2;
      dispatch_async(v2, block);
    }
  }
}

void __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A858DD40]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __78__BWFigCaptureDeviceVendor_prewarmDefaultVideoDeviceForPID_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t result;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", 0x1E492D2B8, v8, v9);
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(v4 + 24), "objectForKeyedSubscript:", 0x1E492D2B8);
    if (dword_1ECFE98D0)
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWFigCaptureDeviceVendor _resetDeviceCloseTimerForDevice:](*(_QWORD *)(a1 + 32), 0x1E492D2B8);
  }
  else
  {
    -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](v4, CFSTR("Default"), (uint64_t)"Pre-warm power on", *(_DWORD *)(a1 + 48));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", 0x1E492D2B8))
    {
      -[BWFigCaptureDeviceVendor _setupDeviceCloseTimerForDevice:](*(_QWORD *)(a1 + 32), 0x1E492D2B8);
    }
    else
    {
      v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 48));
  return result;
}

- (void)_setupDeviceCloseTimerForDevice:(uint64_t)a1
{
  uint64_t v2;
  void *v5;
  NSObject *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD handler[8];
  os_log_type_t type;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1 && (FigCaptureIsDebuggerOrSlowAllocationPathEnabled() & 1) == 0)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v11 = v2;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    v5 = (void *)objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2, v10, v11);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "device"), "deviceID"), "isEqualToString:", 0x1E492D2B8))
    {
      if (objc_msgSend(v5, "deviceCloseTimer")
        && !dispatch_source_testcancel((dispatch_source_t)objc_msgSend(v5, "deviceCloseTimer")))
      {
        if (dword_1ECFE98D0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        if (dword_1ECFE98D0)
        {
          v15 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 56));
        objc_msgSend(v5, "setDeviceCloseTimer:", v8);
        -[BWFigCaptureDeviceVendor _resetDeviceCloseTimerForDevice:](a1, a2);
        v9 = MEMORY[0x1E0C809B0];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __60__BWFigCaptureDeviceVendor__setupDeviceCloseTimerForDevice___block_invoke;
        handler[3] = &unk_1E491EC90;
        handler[4] = v5;
        handler[5] = a1;
        handler[6] = a2;
        handler[7] = v8;
        dispatch_source_set_event_handler(v8, handler);
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __60__BWFigCaptureDeviceVendor__setupDeviceCloseTimerForDevice___block_invoke_211;
        v12[3] = &unk_1E491E748;
        v12[4] = v5;
        v12[5] = v8;
        dispatch_source_set_cancel_handler(v8, v12);
        dispatch_resume(v8);
        dispatch_release(v8);
      }
    }
  }
}

- (void)_resetDeviceCloseTimerForDevice:(uint64_t)a1
{
  uint64_t v2;
  void *v5;
  int64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v11 = v2;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    if ((FigCaptureIsDebuggerOrSlowAllocationPathEnabled() & 1) == 0)
    {
      v5 = (void *)objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2);
      if (objc_msgSend(v5, "deviceCloseTimer"))
      {
        v6 = (unint64_t)(*(double *)(a1 + 72) * 1000000000.0);
        if (dword_1ECFE98D0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v8 = objc_msgSend(v5, "deviceCloseTimer", v10, v11);
        v9 = dispatch_time(0, v6);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
    }
  }
}

uint64_t __98__BWFigCaptureDeviceVendor_copyDeviceWithID_forClient_informClientWhenDeviceAvailableAgain_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *source;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  os_log_type_t type;
  int v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(v2, "device");
  v4 = objc_msgSend(v2, "deviceUsageCount");
  v5 = objc_msgSend(v2, "deviceCloseTimer");
  v6 = -[BWFigCaptureDeviceVendor _registeredDeviceClientWithID:](*(_QWORD **)(a1 + 32), *(_DWORD *)(a1 + 80));
  if (v6)
  {
    v7 = v6;
    source = v5;
    v38 = v4;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v9 = objc_msgSend(v8, "isEqual:", v6);
    v10 = objc_msgSend(v7, "canStealFromClientsWithSamePriority");
    v11 = objc_msgSend(v7, "clientPriority");
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "clientPriority");
    if (v10)
      v13 = v11 >= v12;
    else
      v13 = v11 > v12;
    if (v8 && (v9 & 1) == 0 && !v13)
    {
      if (*(_BYTE *)(a1 + 84))
      {
        if (dword_1ECFE98D0)
        {
          v44 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -12681;
        -[BWFigCaptureDeviceVendor _removeDeviceClient:moveToVictimizedList:](*(_QWORD *)(a1 + 32), v7, 1);
      }
      else
      {
        if (dword_1ECFE98D0)
        {
          v44 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", v7, v34, v35);
      }
      goto LABEL_29;
    }
    if (!v2)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](*(_QWORD *)(a1 + 32), *(__CFString **)(a1 + 40), 0, objc_msgSend(v7, "pid"));
      v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      if (!v2)
      {
LABEL_29:
        v4 = v38;
        goto LABEL_50;
      }
    }
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (v15)
    {
      if (objc_msgSend(v15, "isEqual:", v7))
      {
        v4 = v38;
        if (dword_1ECFE98D0)
        {
          v44 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        goto LABEL_46;
      }
      if (!v13)
      {
        v4 = v38;
LABEL_46:
        -[BWFigCaptureDeviceVendor _relinquishControlOfStreamsForDevice:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = (id)objc_msgSend(v2, "device");
        objc_msgSend(v2, "setDeviceUsageCount:", objc_msgSend(v2, "deviceUsageCount") + 1);
        v28 = (void *)objc_msgSend((id)objc_msgSend(v2, "device"), "supportedProperties");
        v29 = *MEMORY[0x1E0D059B8];
        if (objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D059B8]))
        {
          v30 = (void *)objc_msgSend(v2, "device");
          objc_msgSend(v30, "setProperty:value:", v29, MEMORY[0x1E0C9AAB0]);
        }
        if (source)
          dispatch_source_cancel(source);
        goto LABEL_50;
      }
      if (dword_1ECFE98D0)
      {
        v44 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v36 = v3;
      v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v34, v35);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeys");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v40 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v27 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v26);
            if ((int)objc_msgSend(v27, "deviceUsageCount") >= 1
              && (objc_msgSend(v27, "inUseForPublishing") & 1) == 0
              && (objc_msgSend(v27, "deviceUsageCount") != 1
               || (objc_msgSend(v27, "inUseForVibeMitigation") & 1) == 0))
            {
              -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(_QWORD *)(a1 + 32), v26);
              objc_msgSend(v20, "addObject:", v26);
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v23);
      }
      v4 = v38;
      if (objc_msgSend(v20, "containsObject:", *(_QWORD *)(a1 + 40)))
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](*(_QWORD *)(a1 + 32), *(__CFString **)(a1 + 40), 0, objc_msgSend(v7, "pid"));
      v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 40);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
      -[BWFigCaptureDeviceVendor _removeDeviceClient:moveToVictimizedList:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 1);
      v3 = v36;
      if (!v2)
      {
        FigDebugAssert3();
        goto LABEL_50;
      }
    }
    else
    {
      v4 = v38;
      if (dword_1ECFE98D0)
      {
        v44 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v7;
    goto LABEL_46;
  }
  if (*(_DWORD *)(a1 + 80) < sNextClientID)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -12785;
LABEL_50:
  -[BWFigCaptureDeviceVendor _dumpInventory](*(_QWORD *)(a1 + 32));
  v31 = objc_msgSend(v2, "device");
  result = objc_msgSend(v2, "deviceUsageCount");
  if (v4 != (_DWORD)result || v3 != v31)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  return result;
}

- (uint64_t)_dumpInventory
{
  if (result)
  {
    result = _FigIsCurrentDispatchQueue();
    if (!(_DWORD)result)
      return FigDebugAssert3();
  }
  return result;
}

+ (id)sharedCaptureDeviceVendor
{
  return (id)objc_msgSend(a1, "sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction:", FigCaptureGetCaptureDeviceCreateFunction());
}

- (BOOL)cameraCalibrationValid
{
  return self->_cameraCalibrationValid;
}

- (BWFigCaptureDeviceVendor)initWithDefaultDeviceCreateFunction:(void *)a3 cmioExtensionDeviceCreateFunction:(void *)a4 cmioDiscoverySession:(id)a5
{
  BWFigCaptureDeviceVendor *v5;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSDateFormatter *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  _QWORD v18[5];
  _QWORD v19[5];
  objc_super v20;
  os_log_type_t type;
  unsigned int v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v5 = self;
  v25 = *MEMORY[0x1E0C80C00];
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    goto LABEL_16;
  }
  v20.receiver = self;
  v20.super_class = (Class)BWFigCaptureDeviceVendor;
  v5 = -[BWFigCaptureDeviceVendor init](&v20, sel_init);
  if (v5)
  {
    v5->_devicesStatesByDeviceID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_deviceCloseTimeoutSeconds = 5.0;
    v5->_registeredDeviceClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_victimizedDeviceClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v5->_deviceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.devicevendor", v9);
    v5->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.devicevendor.notification", 0);
    v5->_cameraPoseMatricesByPortTypeByDeviceID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_cameraCalibrationValid = -[BWFigCaptureDeviceVendor _isCameraCalibrationValid]((uint64_t)v5);
    if ((FigCaptureIsRunningInVirtualization() & 1) == 0 && !a3)
    {
      FigDebugAssert3();
      goto LABEL_17;
    }
    v5->_defaultDeviceCreateFunction = a3;
    v10 = MEMORY[0x1E0C809B0];
    if (!a4)
    {
LABEL_8:
      v5->_osStateHandle = -[FigCaptureOSStateHandle initWithTitle:queue:dataProvider:]([FigCaptureOSStateHandle alloc], "initWithTitle:queue:dataProvider:", CFSTR("BWFigCaptureDeviceVendor"), v5->_deviceQueue, v5);
      v5->_defaultDeviceCreationHistory = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
      v5->_cmioDeviceCreationHistory = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
      v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
      v5->_deviceDateFormatter = v12;
      -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ssZ"));
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_2;
      v18[3] = &unk_1E491E720;
      v18[4] = v5;
      v5->_gameModeMonitor = -[FigCaptureGameModeMonitor initWithStateChangeHandler:]([FigCaptureGameModeMonitor alloc], "initWithStateChangeHandler:", v18);
      return v5;
    }
    if (a5)
    {
      v5->_cmioDiscoverySession = (CMIOExtensionDiscoverySession *)a5;
      v5->_cmioExtensionDeviceCreateFunction = a4;
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel__handleCMIOExtensionDevicesChangedNotification_, *MEMORY[0x1E0CA54F0], 0);
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke;
      v19[3] = &unk_1E491E720;
      v19[4] = v5;
      -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)v5, (uint64_t)v19);
      goto LABEL_8;
    }
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v16 = v22;
    if (os_log_type_enabled(v15, type))
      v17 = v16;
    else
      v17 = v16 & 0xFFFFFFFE;
    if (v17)
    {
      v23 = 136315138;
      v24 = "-[BWFigCaptureDeviceVendor initWithDefaultDeviceCreateFunction:cmioExtensionDeviceCreateFunction:cmioDiscoverySession:]";
      _os_log_send_and_compose_impl();
    }
LABEL_16:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_17:

    return 0;
  }
  return v5;
}

- (uint64_t)_isCameraCalibrationValid
{
  uint64_t CameraDriverService;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!a1)
    return 0;
  if ((int)FigCapturePlatformIdentifier() < 7 || !BWDeviceIsiPhone() || (MGGetBoolAnswer() & 1) != 0)
    goto LABEL_15;
  CameraDriverService = FigCaptureGetCameraDriverService();
  if ((_DWORD)CameraDriverService)
  {
    v2 = CameraDriverService;
    v3 = (void *)IORegistryEntrySearchCFProperty(CameraDriverService, "IODeviceTree", CFSTR("CmClValidationStatus"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fail")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v3, "isEqualToString:", CFSTR("Override"));
      v4 = 1;
    }

    goto LABEL_11;
  }
  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    v4 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v2 = 0;
  }
  else
  {
LABEL_15:
    v2 = 0;
    v4 = 1;
  }
LABEL_11:
  FigCaptureReleaseCameraDriverService(v2);
  return v4;
}

void __68__BWFigCaptureDeviceVendor__performBlockOnDeviceQueueSynchronously___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A858DD40]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __209__BWFigCaptureDeviceVendor_registerClientWithPID_clientApplicationID_clientDescription_clientPriority_canStealFromClientsWithSamePriority_deviceSharingWithOtherClientsAllowed_deviceAvailabilityChangedHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BWFigCaptureDeviceClient *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 80))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 40))
    {
      objc_msgSend(v2, "addObject:");
      v4 = *(_QWORD *)(a1 + 32);
    }
    if (objc_msgSend(*(id *)(v4 + 32), "count"))
      objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastObject"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v9, "canShareRegistrationWithClientPID:deviceAvailabilityChangedHandler:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 56)))
          {
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v9, "clientID");
            if (!objc_msgSend(v9, "deviceAvailabilityChangedHandler"))
              objc_msgSend(v9, "setDeviceAvailabilityChangedHandler:", *(_QWORD *)(a1 + 56));
            goto LABEL_17;
          }
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v10 = -[BWFigCaptureDeviceClient initWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceAvailabilityChangedHandler:]([BWFigCaptureDeviceClient alloc], "initWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceAvailabilityChangedHandler:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 76), *(unsigned __int8 *)(a1 + 81), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[BWFigCaptureDeviceClient clientID](v10, "clientID");
    if (dword_1ECFE98D0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v10, v12, v13);

  }
}

- (_QWORD)_registeredDeviceClientWithID:(_QWORD *)result
{
  uint64_t v2;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v11 = v2;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)v4[4];
    result = (_QWORD *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, v11);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
          if (objc_msgSend(v9, "clientID") == a2)
            return v9;
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        result = (_QWORD *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v6 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_relinquishControlOfStreamsForDevice:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v17 = v2;
      LODWORD(v16) = 0;
      FigDebugAssert3();
    }
    v5 = (void *)objc_msgSend(*(id *)(v4 + 24), "objectForKeyedSubscript:", a2, v16, v17);
    if (objc_msgSend((id)objc_msgSend(v5, "controlledStreams"), "count")
      || (result = objc_msgSend((id)objc_msgSend(v5, "streamsControlledByOtherClients"), "count")) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v6 = (void *)objc_msgSend(v5, "controlledStreams");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v23;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v6);
            -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](v4);
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v8);
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = (void *)objc_msgSend(v5, "streamsControlledByOtherClients");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](v4);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v13);
      }
      objc_msgSend((id)objc_msgSend(v5, "device"), "relinquishControlOfStreams:", objc_msgSend(v5, "controlledStreams"));
      objc_msgSend((id)objc_msgSend(v5, "controlledStreams"), "removeAllObjects");
      objc_msgSend((id)objc_msgSend(v5, "streamsControlledByOtherClients"), "removeAllObjects");
      objc_msgSend((id)objc_msgSend(v5, "streamsToKeepControlled"), "removeAllObjects");
      return objc_msgSend((id)objc_msgSend(v5, "streamsInUse"), "removeAllObjects");
    }
  }
  return result;
}

- (uint64_t)_registerForStreamNotifications:(uint64_t)result
{
  if (result)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterAddListener();
  }
  return result;
}

- (id)copyDeviceWithID:(id)a3 forClient:(int)a4 informClientWhenDeviceAvailableAgain:(BOOL)a5 error:(int *)a6
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v9;
  _QWORD v11[10];
  int v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__25;
  v28 = __Block_byref_object_dispose__25;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__25;
  v18 = __Block_byref_object_dispose__25;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__BWFigCaptureDeviceVendor_copyDeviceWithID_forClient_informClientWhenDeviceAvailableAgain_error___block_invoke;
  v11[3] = &unk_1E4923668;
  v11[4] = self;
  v11[5] = a3;
  v12 = a4;
  v13 = a5;
  v11[6] = &v30;
  v11[7] = &v14;
  v11[8] = &v24;
  v11[9] = &v20;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v11);
  -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:]((uint64_t)self, v15[5], 0, *((_BYTE *)v21 + 24), 0);

  if (!v25[5] && !*((_DWORD *)v31 + 6))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    *((_DWORD *)v31 + 6) = -12786;
  }
  if (a6)
    *a6 = *((_DWORD *)v31 + 6);
  v9 = (void *)v25[5];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  return v9;
}

- (void)_deviceAvailabilityChangedForClient:(char)a3 available:(char)a4 postNotification:(int)a5 reason:
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;
  char v8;
  char v9;

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 80);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __98__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason___block_invoke;
    v6[3] = &unk_1E4923778;
    v8 = a4;
    v9 = a3;
    v7 = a5;
    v6[4] = a2;
    dispatch_async(v5, v6);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

void __98__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const __CFDictionary *v4;
  __CFNotificationCenter *LocalCenter;
  uint64_t v6;
  __CFNotificationCenter *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A858DD40]();
  if (*(_BYTE *)(a1 + 44))
  {
    v8[0] = CFSTR("DeviceAvailable");
    v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 45));
    v8[1] = CFSTR("DeviceAvailabilityChangedReason");
    v9[0] = v3;
    v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v4 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    if (*(_BYTE *)(a1 + 44) && !*(_BYTE *)(a1 + 45))
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, CFSTR("DeviceAvailabilityChanged"), 0, v4, 1u);
    }
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "deviceAvailabilityChangedHandler"))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "deviceAvailabilityChangedHandler");
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, objc_msgSend(*(id *)(a1 + 32), "clientID"), *(unsigned __int8 *)(a1 + 45), *(unsigned int *)(a1 + 40));
  }
  if (*(_BYTE *)(a1 + 44) && *(_BYTE *)(a1 + 45))
  {
    v7 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v7, CFSTR("DeviceAvailabilityChanged"), 0, v4, 1u);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __54__BWFigCaptureDeviceVendor_activeDefaultDeviceEquals___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;
  BOOL v5;
  char v6;

  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", 0x1E492D2B8);
  v3 = a1[5];
  if (v3)
  {
    result = objc_msgSend(v2, "device");
    v5 = v3 == result;
  }
  else
  {
    result = objc_msgSend(v2, "deviceUsageCount");
    if ((_DWORD)result)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v5 = *(_QWORD *)(a1[4] + 40) == 0;
  }
  v6 = v5;
LABEL_8:
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
  return result;
}

id __37__BWFigCaptureDeviceVendor_deviceIDs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id result;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeys"));
  v3 = v2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) && (objc_msgSend(v2, "containsObject:", 0x1E492D2B8) & 1) == 0)
    objc_msgSend(v3, "insertObject:atIndex:", 0x1E492D2B8, 0);
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke(uint64_t a1)
{
  -[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices](*(_QWORD *)(a1 + 32));
}

- (NSArray)deviceIDs
{
  NSArray *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__BWFigCaptureDeviceVendor_deviceIDs__block_invoke;
  v4[3] = &unk_1E491F1A0;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  v2 = (NSArray *)(id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)activeDefaultDeviceEquals:(id)a3
{
  char v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__BWFigCaptureDeviceVendor_activeDefaultDeviceEquals___block_invoke;
  v5[3] = &unk_1E491F368;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = &v6;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateCMIOExtensionDevices
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  pid_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  uint64_t m;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t n;
  void *v33;
  int v34;
  id v35;
  NSObject *v36;
  unsigned int v37;
  unsigned int v38;
  NSObject *v39;
  NSObject *v40;
  unsigned int v41;
  unsigned int v42;
  NSObject *v43;
  unsigned int v44;
  unsigned int v45;
  NSObject *v46;
  unsigned int v47;
  unsigned int v48;
  NSObject *v49;
  unsigned int v50;
  unsigned int v51;
  NSObject *v52;
  unsigned int v53;
  unsigned int v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  char v62;
  char v63;
  void *v64;
  void *obj;
  id v66;
  void *v67;
  _QWORD v68[5];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  os_log_type_t type;
  unsigned int v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  int v91;
  const char *v92;
  __int16 v93;
  id v94;
  __int16 v95;
  id v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _QWORD block[5];
  int v100;
  __int16 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v59 = v1;
      LODWORD(v56) = 0;
      FigDebugAssert3();
    }
    v66 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v56, v59);
    v67 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v64 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v3 = *(void **)(a1 + 24);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v88 != v6)
            objc_enumerationMutation(v3);
          v8 = (void *)objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "device"), "deviceID"), "isEqualToString:", 0x1E492D2B8) & 1) == 0)objc_msgSend(v66, "addObject:", objc_msgSend((id)objc_msgSend(v8, "device"), "deviceID"));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
      }
      while (v5);
    }
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = (void *)objc_msgSend(*(id *)(a1 + 112), "devices");
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
    if (v9)
    {
      v10 = v9;
      v62 = 0;
      v11 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v84 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          v14 = (__CFString *)objc_msgSend((id)objc_msgSend(v13, "deviceID", v57, v60), "UUIDString");
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v15 = (void *)objc_msgSend(v13, "streams");
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v102, 16);
          if (!v16)
            goto LABEL_26;
          v17 = v16;
          v18 = *(_QWORD *)v80;
          while (2)
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v80 != v18)
                objc_enumerationMutation(v15);
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * k), "direction"))
              {
                if (!objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v14))
                {
                  v21 = getpid();
                  if (-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](a1, v14, 0, v21))
                    goto LABEL_27;
                  objc_msgSend(v61, "addObject:", v14);
                  v62 = 1;
                }
                objc_msgSend(v67, "addObject:", v14);
                goto LABEL_32;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v102, 16);
            if (v17)
              continue;
            break;
          }
LABEL_26:
          if (dword_1ECFE98D0)
          {
LABEL_27:
            v78 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
LABEL_32:
          ;
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
      }
      while (v10);
    }
    else
    {
      v62 = 0;
    }
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v22 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v73, v98, 16, v57);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v74;
      v25 = v64;
      v26 = v62;
      do
      {
        for (m = 0; m != v23; ++m)
        {
          if (*(_QWORD *)v74 != v24)
            objc_enumerationMutation(v66);
          v28 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * m);
          if ((objc_msgSend(v67, "containsObject:", v28) & 1) == 0)
          {
            objc_msgSend(v64, "addObject:", v28);
            v26 = 1;
          }
        }
        v23 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
      }
      while (v23);
    }
    else
    {
      v25 = v64;
      v26 = v62;
    }
    v63 = v26;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v29 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v97, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v70;
      do
      {
        for (n = 0; n != v30; ++n)
        {
          if (*(_QWORD *)v70 != v31)
            objc_enumerationMutation(v25);
          v33 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * n);
          v34 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v33, v58, v60), "deviceUsageCount");
          -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](a1, v33);
          if (v34 >= 1)
          {
            v35 = *(id *)(a1 + 40);

            *(_QWORD *)(a1 + 40) = 0;
            if (dword_1ECFE98D0)
            {
              v78 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v37 = v78;
              if (os_log_type_enabled(v36, type))
                v38 = v37;
              else
                v38 = v37 & 0xFFFFFFFE;
              if (v38)
              {
                v91 = 136315650;
                v92 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
                v93 = 2112;
                v94 = v33;
                v95 = 2112;
                v96 = v35;
                LODWORD(v60) = 32;
                v58 = &v91;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v25 = v64;
            }
            v39 = *(NSObject **)(a1 + 80);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __98__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason___block_invoke;
            block[3] = &unk_1E4923778;
            v101 = 1;
            v100 = 3;
            block[4] = v35;
            dispatch_async(v39, block);
          }
        }
        v30 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v97, 16);
      }
      while (v30);
    }
    if (dword_1ECFE98D0)
    {
      v78 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v41 = v78;
      if (os_log_type_enabled(v40, type))
        v42 = v41;
      else
        v42 = v41 & 0xFFFFFFFE;
      if (v42)
      {
        v91 = 136315394;
        v92 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
        v93 = 2112;
        v94 = v66;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1ECFE98D0)
      {
        v78 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v44 = v78;
        if (os_log_type_enabled(v43, type))
          v45 = v44;
        else
          v45 = v44 & 0xFFFFFFFE;
        if (v45)
        {
          v91 = 136315394;
          v92 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
          v93 = 2112;
          v94 = v67;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1ECFE98D0)
        {
          v78 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v47 = v78;
          if (os_log_type_enabled(v46, type))
            v48 = v47;
          else
            v48 = v47 & 0xFFFFFFFE;
          if (v48)
          {
            v91 = 136315394;
            v92 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
            v93 = 2112;
            v94 = v61;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          if (dword_1ECFE98D0)
          {
            v78 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v50 = v78;
            if (os_log_type_enabled(v49, type))
              v51 = v50;
            else
              v51 = v50 & 0xFFFFFFFE;
            if (v51)
            {
              v91 = 136315394;
              v92 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
              v93 = 2112;
              v94 = v64;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
    }
    if ((v63 & 1) != 0)
    {
      if (dword_1ECFE98D0)
      {
        v78 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v53 = v78;
        if (os_log_type_enabled(v52, type))
          v54 = v53;
        else
          v54 = v53 & 0xFFFFFFFE;
        if (v54)
        {
          v91 = 136315138;
          v92 = "-[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices]";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v55 = *(NSObject **)(a1 + 80);
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __55__BWFigCaptureDeviceVendor__updateCMIOExtensionDevices__block_invoke;
      v68[3] = &unk_1E491E720;
      v68[4] = a1;
      dispatch_async(v55, v68);
    }
  }
}

+ (BOOL)videoCaptureDeviceFirmwareIsLoaded
{
  uint64_t CameraDriverService;
  uint64_t v3;
  CFTypeRef CFProperty;
  const void *v5;
  BOOL v6;

  CameraDriverService = FigCaptureGetCameraDriverService();
  if (!(_DWORD)CameraDriverService)
    return 0;
  v3 = CameraDriverService;
  CFProperty = IORegistryEntryCreateCFProperty(CameraDriverService, CFSTR("FirmwareLoaded"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  FigCaptureReleaseCameraDriverService(v3);
  return v6;
}

+ (id)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction:(void *)a3
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, void *, CFTypeRef *);

  if (sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLockOnce != -1)
    dispatch_once(&sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLockOnce, &__block_literal_global_67);
  pthread_mutex_lock((pthread_mutex_t *)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLock);
  if (!sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendor)
  {
    if (objc_opt_class())
    {
      v4 = objc_msgSend(MEMORY[0x1E0CA5548], "sharedInstance");
      v5 = CMIOExtensionFigCaptureDeviceCreate;
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }
    sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendor = -[BWFigCaptureDeviceVendor initWithDefaultDeviceCreateFunction:cmioExtensionDeviceCreateFunction:cmioDiscoverySession:]([BWFigCaptureDeviceVendor alloc], "initWithDefaultDeviceCreateFunction:cmioExtensionDeviceCreateFunction:cmioDiscoverySession:", a3, v5, v4);
  }
  pthread_mutex_unlock((pthread_mutex_t *)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLock);
  return (id)sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendor;
}

uint64_t __85__BWFigCaptureDeviceVendor_sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction___block_invoke()
{
  uint64_t result;

  result = FigSimpleMutexCreate();
  sharedCaptureDeviceVendorWithDefaultDeviceCreateFunction__sharedDeviceVendorLock = result;
  return result;
}

- (BWFigCaptureDeviceVendor)initWithDefaultDeviceCreateFunction:(void *)a3
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, void *, CFTypeRef *);

  if (objc_opt_class())
  {
    v5 = objc_msgSend(MEMORY[0x1E0CA5548], "sharedInstance");
    v6 = CMIOExtensionFigCaptureDeviceCreate;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  return -[BWFigCaptureDeviceVendor initWithDefaultDeviceCreateFunction:cmioExtensionDeviceCreateFunction:cmioDiscoverySession:](self, "initWithDefaultDeviceCreateFunction:cmioExtensionDeviceCreateFunction:cmioDiscoverySession:", a3, v6, v5);
}

void __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_3;
  v2[3] = &unk_1E491E720;
  v2[4] = v1;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:](v1, (uint64_t)v2);
}

void __119__BWFigCaptureDeviceVendor_initWithDefaultDeviceCreateFunction_cmioExtensionDeviceCreateFunction_cmioDiscoverySession___block_invoke_3(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", 0x1E492D2B8))
  {
    if (-[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](*(_QWORD *)(a1 + 32), CFSTR("Default"), (uint64_t)"game mode update", 0))
    {
      FigDebugAssert3();
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(_QWORD *)(a1 + 32), CFSTR("Default"));
    }
  }
}

- (void)_invalidateAndReleaseDevice:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  os_log_type_t type;
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v21 = v2;
      LODWORD(v19) = 0;
      FigDebugAssert3();
    }
    v5 = objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2, v19, v21);
    if (v5)
    {
      v6 = (void *)v5;
      if (dword_1ECFE98D0)
      {
        v29 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v23 = a2;
      v8 = objc_msgSend(a2, "isEqualToString:", v20, v22);
      v9 = 136;
      if (v8)
        v9 = 128;
      v10 = a1;
      v11 = *(void **)(a1 + v9);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Description")), "isEqualToString:", objc_msgSend((id)objc_msgSend(v6, "device"), "description")))objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v10 + 144), "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")), CFSTR("ReleaseDate"));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        }
        while (v13);
      }
      v17 = (void *)objc_msgSend(v6, "device");
      objc_msgSend(v17, "unregisterForNotification:listener:", CFSTR("UnrecoverableError"), v10);
      objc_msgSend(v17, "unregisterForNotification:listener:", CFSTR("DeviceNoLongerAvailable"), v10);
      -[BWFigCaptureDeviceVendor _relinquishControlOfStreamsForDevice:](v10, objc_msgSend((id)objc_msgSend(v6, "device"), "deviceID"));
      -[BWFigCaptureDeviceVendor _setLowMemoryModeEnabledOnDevice:](v10, (void *)objc_msgSend(v6, "device"));
      objc_msgSend((id)objc_msgSend(v6, "device"), "invalidate");
      if (objc_msgSend(v6, "deviceCloseTimer"))
        dispatch_source_cancel((dispatch_source_t)objc_msgSend(v6, "deviceCloseTimer"));
      objc_msgSend(*(id *)(v10 + 24), "setObject:forKeyedSubscript:", 0, v23);
      if (objc_msgSend(v23, "isEqualToString:", 0x1E492D2B8))
      {

        *(_QWORD *)(v10 + 88) = 0;
      }
      if (objc_msgSend(v23, "isEqualToString:", 0x1E492D2B8))
      {
        v18 = *(NSObject **)(v10 + 64);
        if (v18)
        {
          dispatch_source_cancel(v18);
          dispatch_release(*(dispatch_object_t *)(v10 + 64));
          *(_QWORD *)(v10 + 64) = 0;
        }
      }
    }
    else
    {
      FigDebugAssert3();
    }
  }
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSMutableDictionary allValues](self->_devicesStatesByDeviceID, "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[BWFigCaptureDeviceVendor invalidateVideoDevice:forPID:](self, "invalidateVideoDevice:forPID:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "device"), 0xFFFFFFFFLL);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BWFigCaptureDeviceVendor;
  -[BWFigCaptureDeviceVendor dealloc](&v8, sel_dealloc);
}

- (int)registerClientWithPID:(int)a3 clientDescription:(id)a4 clientPriority:(int)a5 canStealFromClientsWithSamePriority:(BOOL)a6 deviceSharingWithOtherClientsAllowed:(BOOL)a7 deviceAvailabilityChangedHandler:(id)a8
{
  return -[BWFigCaptureDeviceVendor registerClientWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceAvailabilityChangedHandler:](self, "registerClientWithPID:clientApplicationID:clientDescription:clientPriority:canStealFromClientsWithSamePriority:deviceSharingWithOtherClientsAllowed:deviceAvailabilityChangedHandler:", *(_QWORD *)&a3, CFSTR("internal"), a4, *(_QWORD *)&a5, a6, a7, a8);
}

- (int)unregisterClient:(int)a3
{
  int v3;
  _QWORD v5[6];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__BWFigCaptureDeviceVendor_unregisterClient___block_invoke;
  v5[3] = &unk_1E4923640;
  v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __45__BWFigCaptureDeviceVendor_unregisterClient___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v3;
  int v4;
  NSObject *v6;

  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(int *)(a1 + 48) <= 0
    || (v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "clientID"), v4 = *(_DWORD *)(a1 + 48), v3 == v4))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -12780;
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    -[BWFigCaptureDeviceVendor _removeRegisteredDeviceClientWithClientID:](*(_QWORD *)(a1 + 32), v4);
    return -[BWFigCaptureDeviceVendor _removeVictimizedDeviceClientWithClientID:](*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48));
  }
}

- (uint64_t)_removeRegisteredDeviceClientWithClientID:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  int v9;

  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    v5 = *(void **)(v4 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__BWFigCaptureDeviceVendor__removeRegisteredDeviceClientWithClientID___block_invoke;
    v8[3] = &__block_descriptor_36_e41_B32__0__BWFigCaptureDeviceClient_8Q16_B24l;
    v9 = a2;
    result = objc_msgSend(v5, "indexOfObjectPassingTest:", v8, v6, v7);
    if (result != 0x7FFFFFFFFFFFFFFFLL)
      return objc_msgSend(*(id *)(v4 + 32), "removeObjectAtIndex:", result);
  }
  return result;
}

- (uint64_t)_removeVictimizedDeviceClientWithClientID:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  int v9;

  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    v5 = *(void **)(v4 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__BWFigCaptureDeviceVendor__removeVictimizedDeviceClientWithClientID___block_invoke;
    v8[3] = &__block_descriptor_36_e41_B32__0__BWFigCaptureDeviceClient_8Q16_B24l;
    v9 = a2;
    result = objc_msgSend(v5, "indexOfObjectPassingTest:", v8, v6, v7);
    if (result != 0x7FFFFFFFFFFFFFFFLL)
      return objc_msgSend(*(id *)(v4 + 48), "removeObjectAtIndex:", result);
  }
  return result;
}

- (id)copyDeviceForClient:(int)a3 informClientWhenDeviceAvailableAgain:(BOOL)a4 error:(int *)a5
{
  return -[BWFigCaptureDeviceVendor copyDeviceWithID:forClient:informClientWhenDeviceAvailableAgain:error:](self, "copyDeviceWithID:forClient:informClientWhenDeviceAvailableAgain:error:", 0x1E492D2B8, *(_QWORD *)&a3, a4, a5);
}

- (uint64_t)_removeDeviceClient:(int)a3 moveToVictimizedList:
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v6 = result;
    result = _FigIsCurrentDispatchQueue();
    if ((_DWORD)result)
    {
      if (!a2)
        return result;
    }
    else
    {
      v8 = v3;
      LODWORD(v7) = 0;
      result = FigDebugAssert3();
      if (!a2)
        return result;
    }
    result = objc_msgSend(*(id *)(v6 + 32), "removeObject:", a2, v7, v8);
    if (a3)
    {
      result = objc_msgSend(a2, "deviceAvailabilityChangedHandler");
      if (result)
        return objc_msgSend(*(id *)(v6 + 48), "addObject:", a2);
    }
  }
  return result;
}

- (id)copyDeviceForPublishingWithID:(id)a3 error:(int *)a4
{
  void *v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__25;
  v12 = __Block_byref_object_dispose__25;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__BWFigCaptureDeviceVendor_copyDeviceForPublishingWithID_error___block_invoke;
  v7[3] = &unk_1E49217E8;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = &v14;
  v7[7] = &v8;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v7);
  if (a4)
    *a4 = *((_DWORD *)v15 + 6);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __64__BWFigCaptureDeviceVendor_copyDeviceForPublishingWithID_error___block_invoke(_QWORD *a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  pid_t v7;
  NSObject *v8;
  uint64_t result;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = objc_msgSend(*(id *)(a1[5] + 24), "objectForKeyedSubscript:", a1[4], v12, v14);
  if (v3)
  {
    v4 = (void *)v3;
    if (!dword_1ECFE98D0)
      goto LABEL_8;
  }
  else
  {
    v6 = (__CFString *)a1[4];
    v5 = a1[5];
    v7 = getpid();
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](v5, v6, 0, v7);
    v4 = (void *)objc_msgSend(*(id *)(a1[5] + 24), "objectForKeyedSubscript:", a1[4]);
    if (!dword_1ECFE98D0)
      goto LABEL_8;
  }
  v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_8:
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = (id)objc_msgSend(v4, "device", v13, v15);
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    objc_msgSend(v4, "setDeviceUsageCount:", objc_msgSend(v4, "deviceUsageCount") + 1);
    result = objc_msgSend(v4, "setInUseForPublishing:", 1);
  }
  else
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v10 = *(_QWORD *)(a1[6] + 8);
    if (!*(_DWORD *)(v10 + 24))
      *(_DWORD *)(v10 + 24) = -12786;
  }
  return result;
}

- (id)copyDefaultDeviceForVibeMitigation:(int *)a3
{
  void *v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__BWFigCaptureDeviceVendor_copyDefaultDeviceForVibeMitigation___block_invoke;
  v6[3] = &unk_1E491F8B0;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v6);
  if (a3)
    *a3 = *((_DWORD *)v14 + 6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
  return v4;
}

uint64_t __63__BWFigCaptureDeviceVendor_copyDefaultDeviceForVibeMitigation___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  pid_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", 0x1E492D2B8);
  if (v2)
  {
    v3 = (void *)v2;
    if (!dword_1ECFE98D0)
      goto LABEL_6;
  }
  else
  {
    v4 = a1[4];
    v5 = getpid();
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](v4, CFSTR("Default"), 0, v5);
    v3 = (void *)objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", 0x1E492D2B8);
    if (!dword_1ECFE98D0)
      goto LABEL_6;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_6:
  v7 = a1[4];
  objc_msgSend(v3, "device", v12, v13);
  result = -[BWFigCaptureDeviceVendor _getGameModeEnabledOnDevice:](v7);
  if ((_DWORD)result)
  {
    if (dword_1ECFE98D0)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -12782;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = (id)objc_msgSend(v3, "device");
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      objc_msgSend(v3, "setDeviceUsageCount:", objc_msgSend(v3, "deviceUsageCount") + 1);
      result = objc_msgSend(v3, "setInUseForVibeMitigation:", 1);
    }
    else
    {
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v9 = *(_QWORD *)(a1[5] + 8);
    if (!*(_DWORD *)(v9 + 24))
      *(_DWORD *)(v9 + 24) = -12786;
  }
  return result;
}

- (uint64_t)_getGameModeEnabledOnDevice:(uint64_t)a1
{
  void *v2;

  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  v2 = *(void **)(a1 + 152);
  if (v2)
    return objc_msgSend(v2, "isGameModeEnabled");
  else
    return 0;
}

- (id)copyStreamFromDevice:(id)a3 position:(int)a4 deviceType:(int)a5 deviceClientPriority:(int)a6 allowsStreamControlLoss:(BOOL)a7 error:(int *)a8
{
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v18;
  _QWORD v19[2];

  v9 = a7;
  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v19[1] = *MEMORY[0x1E0C80C00];
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4);
  v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v15 = -[BWFigCaptureDeviceVendor copyStreamsFromDevice:positions:deviceTypes:deviceClientPriority:allowsStreamControlLoss:error:](self, "copyStreamsFromDevice:positions:deviceTypes:deviceClientPriority:allowsStreamControlLoss:error:", a3, v14, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1), v10, v9, a8);
  v16 = (id)objc_msgSend(v15, "firstObject");

  return v16;
}

- (id)copyStreamsFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 deviceClientPriority:(int)a6 allowsStreamControlLoss:(BOOL)a7 error:(int *)a8
{
  void *v8;
  _QWORD v10[10];
  int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__25;
  v17 = __Block_byref_object_dispose__25;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __123__BWFigCaptureDeviceVendor_copyStreamsFromDevice_positions_deviceTypes_deviceClientPriority_allowsStreamControlLoss_error___block_invoke;
  v10[3] = &unk_1E4923690;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  v11 = a6;
  v12 = a7;
  v10[8] = &v13;
  v10[9] = a8;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v10);
  v8 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __123__BWFigCaptureDeviceVendor_copyStreamsFromDevice_positions_deviceTypes_deviceClientPriority_allowsStreamControlLoss_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyStreamsFromDevice:positions:deviceTypes:requestControl:deviceClientPriority:allowsStreamControlLoss:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1, *(unsigned int *)(a1 + 80), *(unsigned __int8 *)(a1 + 84), *(_QWORD *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  return result;
}

- (id)copyStreamWithoutControlFromDevice:(id)a3 position:(int)a4 deviceType:(int)a5 error:(int *)a6
{
  uint64_t v7;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v14;
  _QWORD v15[2];

  v7 = *(_QWORD *)&a5;
  v15[1] = *MEMORY[0x1E0C80C00];
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4);
  v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v11 = -[BWFigCaptureDeviceVendor copyStreamsWithoutControlFromDevice:positions:deviceTypes:error:](self, "copyStreamsWithoutControlFromDevice:positions:deviceTypes:error:", a3, v10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1), a6);
  v12 = (id)objc_msgSend(v11, "firstObject");

  return v12;
}

- (id)copyStreamsWithoutControlFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 error:(int *)a6
{
  void *v6;
  _QWORD v8[10];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__25;
  v13 = __Block_byref_object_dispose__25;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__BWFigCaptureDeviceVendor_copyStreamsWithoutControlFromDevice_positions_deviceTypes_error___block_invoke;
  v8[3] = &unk_1E49236B8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a5;
  v8[8] = &v9;
  v8[9] = a6;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __92__BWFigCaptureDeviceVendor_copyStreamsWithoutControlFromDevice_positions_deviceTypes_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyStreamsFromDevice:positions:deviceTypes:requestControl:deviceClientPriority:allowsStreamControlLoss:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 1, 0, *(_QWORD *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  return result;
}

- (id)_copyStreamsFromDevice:(id)a3 positions:(id)a4 deviceTypes:(id)a5 requestControl:(BOOL)a6 deviceClientPriority:(int)a7 allowsStreamControlLoss:(BOOL)a8 error:(int *)a9
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v29;
  uint64_t v30;

  v10 = a8;
  v11 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v26 = v27;
    LODWORD(v25) = 0;
    FigDebugAssert3();
  }
  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3)
  {
    v16 = objc_msgSend(a4, "count");
    if (v16 == objc_msgSend(a5, "count"))
    {
      os_log_and_send_and_compose_flags_and_os_log_type = -[NSMutableDictionary objectForKeyedSubscript:](self->_devicesStatesByDeviceID, "objectForKeyedSubscript:", objc_msgSend(a3, "deviceID"));
      if (objc_msgSend(a4, "count") != 1
        || objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", 0), "intValue")
        || objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", 0), "intValue"))
      {
        v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a4, "count", v25, v26));
        if (objc_msgSend(a4, "count"))
        {
          v18 = 0;
          while (1)
          {
            v19 = BWCaptureDevicePositionAndDeviceTypeToPortType(objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v18), "intValue"), objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v18), "intValue"));
            if (!v19)
              break;
            objc_msgSend(v17, "addObject:", v19);
            if (objc_msgSend(a4, "count") <= (unint64_t)++v18)
              goto LABEL_14;
          }
          v20 = 0;
          v21 = 0;
          v29 = -12780;
          goto LABEL_25;
        }
LABEL_14:
        v20 = (void *)objc_msgSend(a3, "copyStreamsWithPortTypes:error:", v17, &v29);
        if (v29)
        {
          v26 = v27;
          LODWORD(v25) = v29;
          FigDebugAssert3();
          v21 = 0;
          goto LABEL_29;
        }
        if (v10)
        {
          v21 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v17);
          goto LABEL_19;
        }
      }
      else
      {
        v20 = (void *)objc_msgSend((id)objc_msgSend(a3, "streams"), "copy");
      }
      v21 = 0;
LABEL_19:
      if (objc_msgSend(v21, "count", v25))
        objc_msgSend((id)-[NSObject portTypesAllowingStreamControlLoss](os_log_and_send_and_compose_flags_and_os_log_type, "portTypesAllowingStreamControlLoss"), "addObjectsFromArray:", v21);
      if (v11)
      {
        v22 = -[BWFigCaptureDeviceVendor _requestControlOfStreams:device:deviceClientPriority:]((uint64_t)self, v20, a3, a7);
        v29 = v22;
        if (!v22)
        {
          v23 = a9;
          goto LABEL_34;
        }
        v26 = v27;
        LODWORD(v25) = v22;
        FigDebugAssert3();
      }
LABEL_29:
      v23 = a9;
      if (!v29)
        goto LABEL_34;
      goto LABEL_30;
    }
  }
  v20 = 0;
  v21 = 0;
  v29 = -12780;
LABEL_25:
  v23 = a9;
LABEL_30:
  if (objc_msgSend(v21, "count", v25, v26) && v29 != -12681)
    objc_msgSend((id)-[NSObject portTypesAllowingStreamControlLoss](os_log_and_send_and_compose_flags_and_os_log_type, "portTypesAllowingStreamControlLoss"), "removeObjectsInArray:", v21);

  v20 = 0;
LABEL_34:
  if (v23)
    *v23 = v29;
  return v20;
}

- (uint64_t)_requestControlOfStreams:(void *)a3 device:(uint64_t)a4 deviceClientPriority:
{
  uint64_t v4;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  os_log_type_t type;
  unsigned int v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  int v65;
  const char *v66;
  __int16 v67;
  void *v68;
  _QWORD block[5];
  int v70;
  __int16 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v40 = v4;
      LODWORD(v37) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend(a3, "invalidated", v37, v40) & 1) != 0)
    {
      return 4294954511;
    }
    else
    {
      if (dword_1ECFE98D0)
      {
        v60 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v10 = (void *)objc_msgSend(*(id *)(v8 + 24), "objectForKeyedSubscript:", objc_msgSend(a3, "deviceID", v38, v41));
      if (objc_msgSend(v10, "device") && (void *)objc_msgSend(v10, "device") != a3)
      {
        return 4294954516;
      }
      else
      {
        v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v56 != v14)
                objc_enumerationMutation(a2);
              v16 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
              v17 = objc_msgSend((id)objc_msgSend(v10, "controlledStreams"), "containsObject:", v16);
              v18 = v11;
              if (v17)
              {
                objc_msgSend((id)objc_msgSend(v10, "streamsToKeepControlled"), "removeObject:", v16);
                v18 = (void *)objc_msgSend(v10, "streamsInUse");
              }
              objc_msgSend(v18, "addObject:", v16);
            }
            v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v13);
        }
        result = objc_msgSend(v11, "count");
        if (result)
        {
          result = objc_msgSend(a3, "requestControlOfStreams:clientPriority:", v11, a4);
          if ((_DWORD)result == -12681)
          {
            v60 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v24 = v60;
            if (os_log_type_enabled(v23, type))
              v25 = v24;
            else
              v25 = v24 & 0xFFFFFFFE;
            if (v25)
            {
              v65 = 136315394;
              v66 = "-[BWFigCaptureDeviceVendor _requestControlOfStreams:device:deviceClientPriority:]";
              v67 = 2112;
              v68 = v11;
              LODWORD(v42) = 22;
              v39 = &v65;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v48;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v48 != v28)
                    objc_enumerationMutation(v11);
                  v30 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
                  if ((objc_msgSend((id)objc_msgSend(v10, "streamsControlledByOtherClients", v39, v42), "containsObject:", v30) & 1) == 0)
                  {
                    objc_msgSend((id)objc_msgSend(v10, "streamsControlledByOtherClients"), "addObject:", v30);
                    -[BWFigCaptureDeviceVendor _registerForStreamNotifications:](v8);
                  }
                }
                v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
              }
              while (v27);
            }
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v31 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v61, 16, v39);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v44;
              while (2)
              {
                for (k = 0; k != v32; ++k)
                {
                  if (*(_QWORD *)v44 != v33)
                    objc_enumerationMutation(v11);
                  if (!objc_msgSend((id)objc_msgSend(v10, "portTypesAllowingStreamControlLoss"), "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "portType")))
                  {
                    v35 = -[BWFigCaptureDeviceVendor _removeActiveDeviceClientAndMoveToVictimizedList:](v8, 1);
                    v36 = *(NSObject **)(v8 + 80);
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __98__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason___block_invoke;
                    block[3] = &unk_1E4923778;
                    v71 = 1;
                    v70 = 0;
                    block[4] = v35;
                    dispatch_async(v36, block);
                    return 4294954615;
                  }
                }
                v32 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
                result = 4294954615;
                if (v32)
                  continue;
                break;
              }
            }
            else
            {
              return 4294954615;
            }
          }
          else if (!(_DWORD)result)
          {
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
            if (result)
            {
              v19 = result;
              v20 = *(_QWORD *)v52;
              do
              {
                v21 = 0;
                do
                {
                  if (*(_QWORD *)v52 != v20)
                    objc_enumerationMutation(v11);
                  v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v21);
                  objc_msgSend(v22, "flushPropertyCache");
                  objc_msgSend((id)objc_msgSend(v10, "streamsInUse"), "addObject:", v22);
                  if ((objc_msgSend((id)objc_msgSend(v10, "controlledStreams"), "containsObject:", v22) & 1) == 0)
                  {
                    objc_msgSend((id)objc_msgSend(v10, "controlledStreams"), "addObject:", v22);
                    -[BWFigCaptureDeviceVendor _registerForStreamNotifications:](v8);
                  }
                  ++v21;
                }
                while (v19 != v21);
                result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
                v19 = result;
              }
              while (result);
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)copyStreamsWithUniqueIDs:(id)a3 forDevice:(id)a4 deviceClientPriority:(int)a5 error:(int *)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  int v22;
  BWFigCaptureDeviceVendor *v24;
  unsigned int v25;
  int *v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (!a4)
  {
    v22 = -12780;
    goto LABEL_25;
  }
  v24 = self;
  v25 = a5;
  v26 = a6;
  obj = a3;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v16 = (void *)objc_msgSend(a4, "streams");
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v21, "uniqueID"), "isEqualToString:", v15))
              {
                objc_msgSend(v28, "addObject:", v21);
                goto LABEL_17;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v18)
              continue;
            break;
          }
        }
LABEL_17:
        ;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }
  v22 = -[BWFigCaptureDeviceVendor requestControlOfStreams:device:deviceClientPriority:](v24, "requestControlOfStreams:device:deviceClientPriority:", v28, a4, v25);
  if (v22)
  {
    FigDebugAssert3();
    a6 = v26;
LABEL_25:

    v28 = 0;
    if (!a6)
      return v28;
    goto LABEL_21;
  }
  a6 = v26;
  if (v26)
LABEL_21:
    *a6 = v22;
  return v28;
}

- (void)takeBackDevice:(id)a3 forClient:(int)a4 informClientWhenDeviceAvailableAgain:(BOOL)a5 prefersDeviceInvalidatedImmediately:(BOOL)a6
{
  uint64_t *v7;
  uint64_t v8;
  int v9;
  _QWORD v10[9];
  int v11;
  BOOL v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  if (a3)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3052000000;
    v21 = __Block_byref_object_copy__25;
    v22 = __Block_byref_object_dispose__25;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __126__BWFigCaptureDeviceVendor_takeBackDevice_forClient_informClientWhenDeviceAvailableAgain_prefersDeviceInvalidatedImmediately___block_invoke;
    v10[3] = &unk_1E49236E0;
    v11 = a4;
    v10[4] = a3;
    v10[5] = self;
    v12 = a6;
    v10[6] = &v14;
    v10[7] = &v18;
    v13 = a5;
    v10[8] = &v24;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v10);
    v7 = v19;
    if (!v15[3])
    {
      v8 = v19[5];
      v9 = *((unsigned __int8 *)v25 + 24);
      if (v8)
      {
LABEL_6:
        -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:]((uint64_t)self, v8, 1, v9 != 0, 0);
        v7 = v19;
        goto LABEL_7;
      }
      if (*((_BYTE *)v25 + 24))
      {
        v9 = 1;
        goto LABEL_6;
      }
    }
LABEL_7:

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
}

void __126__BWFigCaptureDeviceVendor_takeBackDevice_forClient_informClientWhenDeviceAvailableAgain_prefersDeviceInvalidatedImmediately___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  os_log_type_t type;
  unsigned int v41;
  _BYTE v42[128];
  int v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98D0)
  {
    v41 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 32), "deviceID", v30, v33));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 != objc_msgSend(v3, "device"))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    return;
  }
  v5 = (-[BWFigCaptureDeviceVendor _setLowMemoryModeEnabledOnDevice:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32)) & 1) != 0
    || *(_BYTE *)(a1 + 76) != 0;
  objc_msgSend(v3, "setDeviceUsageCount:", objc_msgSend(v3, "deviceUsageCount") - 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (int)objc_msgSend(v3, "deviceUsageCount");
  if (dword_1ECFE98D0)
  {
    v41 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7)
  {
    if (v7 >= 1 && dword_1ECFE98D0 != 0)
      goto LABEL_35;
    return;
  }
  v9 = objc_msgSend(v3, "inUseForPublishing");
  if (v9 && dword_1ECFE98D0)
  {
    v41 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v11 = objc_msgSend(v3, "inUseForVibeMitigation", v31, v34);
  if (v11 && dword_1ECFE98D0)
  {
    v41 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v3, "setInUseForPublishing:", 0, v32, v35);
  objc_msgSend(v3, "setInUseForVibeMitigation:", 0);
  v13 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v13 + 40))
    v14 = v11;
  else
    v14 = 1;
  if (((v9 | v14) & 1) != 0)
  {
    if (v5 && (v15 = objc_msgSend(*(id *)(v13 + 48), "count"), v13 = *(_QWORD *)(a1 + 40), !v15))
      -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](v13, (void *)objc_msgSend(*(id *)(a1 + 32), "deviceID"));
    else
      -[BWFigCaptureDeviceVendor _setupDeviceCloseTimerForDevice:](v13, objc_msgSend(*(id *)(a1 + 32), "deviceID"));
    return;
  }
  v16 = (void *)objc_msgSend((id)objc_msgSend(v3, "device"), "supportedProperties");
  v17 = *MEMORY[0x1E0D059B8];
  if (objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D059B8]))
  {
    v18 = (void *)objc_msgSend(v3, "device");
    objc_msgSend(v18, "setProperty:value:", v17, MEMORY[0x1E0C9AAA0]);
  }
  if (!objc_msgSend((id)objc_msgSend(v3, "streamsRequiringControlControlledByOtherClients"), "count"))
  {
    -[BWFigCaptureDeviceVendor _relinquishControlOfStreamsForDevice:](*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "deviceID"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v20);
          v23 |= (int)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i)), "deviceUsageCount") > 0;
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v22);
    }
    else
    {
      v23 = 0;
    }
    if (v5 && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "count"))
    {
      -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(_QWORD *)(a1 + 40), (void *)objc_msgSend(*(id *)(a1 + 32), "deviceID"));
      if ((v23 & 1) != 0)
      {
LABEL_49:
        if (dword_1ECFE98D0)
        {
          v41 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v27 = v41;
          if (os_log_type_enabled(v26, type))
            v28 = v27;
          else
            v28 = v27 & 0xFFFFFFFE;
          if (v28)
          {
            v29 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "clientID");
            v43 = 136315394;
            v44 = "-[BWFigCaptureDeviceVendor takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDevice"
                  "InvalidatedImmediately:]_block_invoke";
            v45 = 1024;
            v46 = v29;
            _os_log_send_and_compose_impl();
          }
          goto LABEL_20;
        }
        return;
      }
    }
    else
    {
      -[BWFigCaptureDeviceVendor _setupDeviceCloseTimerForDevice:](*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "deviceID"));
      if ((v23 & 1) != 0)
        goto LABEL_49;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](*(_QWORD *)(a1 + 40));
    -[BWFigCaptureDeviceVendor _removeActiveDeviceClientAndMoveToVictimizedList:](*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 77));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    return;
  }
  if (dword_1ECFE98D0)
  {
LABEL_35:
    v41 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
LABEL_20:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (uint64_t)_setLowMemoryModeEnabledOnDevice:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v9 = v2;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    v5 = *(void **)(v3 + 152);
    if (v5)
    {
      v3 = objc_msgSend(v5, "isGameModeEnabled");
      if (dword_1ECFE98D0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(a2, "setPropertyIfSupported:value:", *MEMORY[0x1E0D059C0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, v8, v9));
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (id)_popLatestVictimizedDeviceClient
{
  uint64_t v1;
  id v3;
  uint64_t v5;
  uint64_t v6;

  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v6 = v1;
    LODWORD(v5) = 0;
    FigDebugAssert3();
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "count", v5, v6))
    return 0;
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "lastObject");
  objc_msgSend(*(id *)(a1 + 48), "removeLastObject");
  return v3;
}

- (id)_removeActiveDeviceClientAndMoveToVictimizedList:(uint64_t)a1
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  id v6;

  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (a2)
    {
      if (dword_1ECFE98D0)
      {
        v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  v6 = *(id *)(a1 + 40);

  *(_QWORD *)(a1 + 40) = 0;
  -[BWFigCaptureDeviceVendor _removeDeviceClient:moveToVictimizedList:](a1, v6, a2);
  return v6;
}

- (BOOL)streamsInUseForDevice:(id)a3
{
  BOOL v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__BWFigCaptureDeviceVendor_streamsInUseForDevice___block_invoke;
    v5[3] = &unk_1E491F368;
    v5[4] = self;
    v5[5] = a3;
    v5[6] = &v6;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__50__BWFigCaptureDeviceVendor_streamsInUseForDevice___block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  void *v4;

  result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID"));
  if (result)
  {
    v3 = result;
    v4 = *(void **)(a1 + 40);
    result = (void *)objc_msgSend(result, "device");
    if (v4 == result)
    {
      result = (void *)objc_msgSend((id)objc_msgSend(v3, "streamsInUse"), "count");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result != 0;
    }
  }
  return result;
}

- (void)invalidateVideoDevice:(id)a3 forPID:(int)a4
{
  _QWORD v5[8];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (a3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v7 = 0;
    v8 = &v7;
    v9 = 0x3052000000;
    v10 = __Block_byref_object_copy__25;
    v11 = __Block_byref_object_dispose__25;
    v12 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__BWFigCaptureDeviceVendor_invalidateVideoDevice_forPID___block_invoke;
    v5[3] = &unk_1E4923708;
    v6 = a4;
    v5[4] = a3;
    v5[5] = self;
    v5[6] = &v7;
    v5[7] = &v13;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
    -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:]((uint64_t)self, v8[5], 1, *((_BYTE *)v14 + 24), 0);

    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __57__BWFigCaptureDeviceVendor_invalidateVideoDevice_forPID___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 32), "deviceID", v6, v7));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 == objc_msgSend(v3, "device"))
  {
    objc_msgSend(v3, "setDeviceUsageCount:", objc_msgSend(v3, "deviceUsageCount") - 1);
    objc_msgSend(v3, "deviceUsageCount");
    -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(_QWORD *)(a1 + 40), (void *)objc_msgSend(*(id *)(a1 + 32), "deviceID"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](*(_QWORD *)(a1 + 40));
    -[BWFigCaptureDeviceVendor _removeActiveDeviceClientAndMoveToVictimizedList:](*(_QWORD *)(a1 + 40), 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  return -[BWFigCaptureDeviceVendor _dumpInventory](*(_QWORD *)(a1 + 40));
}

- (int)keepControlOfStreamsWithPositions:(id)a3 deviceTypes:(id)a4 forDevice:(id)a5
{
  int v5;
  _QWORD v7[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__BWFigCaptureDeviceVendor_keepControlOfStreamsWithPositions_deviceTypes_forDevice___block_invoke;
  v7[3] = &unk_1E4920590;
  v7[4] = self;
  v7[5] = a5;
  v7[6] = a3;
  v7[7] = a4;
  v7[8] = &v8;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v7);
  v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __84__BWFigCaptureDeviceVendor_keepControlOfStreamsWithPositions_deviceTypes_forDevice___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  os_log_type_t type;
  int v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID"));
  if (dword_1ECFE98D0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(_QWORD *)(a1 + 40)
    && (v4 = objc_msgSend(*(id *)(a1 + 48), "count"), v4 == objc_msgSend(*(id *)(a1 + 56), "count")))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5 == objc_msgSend(v2, "device"))
    {
      v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyStreamsFromDevice:positions:deviceTypes:requestControl:deviceClientPriority:allowsStreamControlLoss:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 1, 0, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        FigDebugAssert3();
      }
      else
      {
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v7 = (void *)objc_msgSend(v2, "controlledStreams");
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v14;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v14 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
              if (objc_msgSend(v6, "containsObject:", v12)
                && (objc_msgSend((id)objc_msgSend(v2, "streamsToKeepControlled"), "containsObject:", v12) & 1) == 0)
              {
                objc_msgSend((id)objc_msgSend(v2, "streamsToKeepControlled"), "addObject:", v12);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
          }
          while (v9);
        }
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -12780;
  }

}

- (void)takeBackStreams:(id)a3 device:(id)a4 totalStreamingDuration:(unsigned int)a5
{
  _QWORD v5[7];
  unsigned int v6;

  if (a4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__BWFigCaptureDeviceVendor_takeBackStreams_device_totalStreamingDuration___block_invoke;
    v5[3] = &unk_1E4923730;
    v5[4] = a3;
    v5[5] = a4;
    v5[6] = self;
    v6 = a5;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  }
}

uint64_t __74__BWFigCaptureDeviceVendor_takeBackStreams_device_totalStreamingDuration___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  os_log_type_t type;
  int v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98D0)
  {
    v19 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID", v12, v13));
  result = objc_msgSend(v3, "device");
  if (result == *(_QWORD *)(a1 + 40))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend((id)objc_msgSend(v3, "streamsInUse"), "removeObject:", v11);
          if (objc_msgSend((id)objc_msgSend(v3, "portTypesToCheckForToFAFEstimator"), "containsObject:", objc_msgSend(v11, "portType")))-[BWFigCaptureDeviceVendor _updateTofAFEstimatorResultsForStream:totalStreamingDuration:](*(_QWORD *)(a1 + 48), v11, *(unsigned int *)(a1 + 56));
          if (objc_msgSend((id)objc_msgSend(v3, "portTypesToCheckForAFDriverShortStatistics"), "containsObject:", objc_msgSend(v11, "portType")))-[BWFigCaptureDeviceVendor _updateAFDriverShortStatisticsForStream:](*(_QWORD *)(a1 + 48), v11);
          if (objc_msgSend((id)objc_msgSend(v3, "portTypesAllowingStreamControlLoss"), "containsObject:", objc_msgSend(v11, "portType")))
          {
            -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](*(_QWORD *)(a1 + 48));
            objc_msgSend((id)objc_msgSend(v3, "portTypesAllowingStreamControlLoss"), "removeObject:", objc_msgSend(v11, "portType"));
            if (objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients"), "containsObject:", v11))objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients"), "removeObject:", v11);
          }
          if (objc_msgSend((id)objc_msgSend(v3, "controlledStreams"), "containsObject:", v11)
            && (objc_msgSend((id)objc_msgSend(v3, "streamsToKeepControlled"), "containsObject:", v11) & 1) == 0)
          {
            -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](*(_QWORD *)(a1 + 48));
            objc_msgSend((id)objc_msgSend(v3, "controlledStreams"), "removeObject:", v11);
            objc_msgSend(v5, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v8);
    }
    result = objc_msgSend(v5, "count");
    if (result)
      return objc_msgSend(*(id *)(a1 + 40), "relinquishControlOfStreams:", v5);
  }
  return result;
}

- (uint64_t)_updateTofAFEstimatorResultsForStream:(uint64_t)a3 totalStreamingDuration:
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (result)
  {
    v5 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    v6 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](v5, (uint64_t)a2);
    if (v6)
    {
      v7 = v6;
      result = objc_msgSend(a2, "getProperty:error:", *MEMORY[0x1E0D07828], 0);
      if (result)
      {
        objc_msgSend((id)objc_msgSend(v7, "tofAFEstimatorResultsByPortType"), "setObject:forKeyedSubscript:", result, objc_msgSend(a2, "portType"));
        objc_msgSend((id)objc_msgSend(v7, "tofAFEstimatorResultsStreamingTimeByPortType"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3), objc_msgSend(a2, "portType"));
        return objc_msgSend((id)objc_msgSend(v7, "tofAFEstimatorClientApplicationIDByPortType"), "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v5 + 40), "applicationID"), objc_msgSend(a2, "portType"));
      }
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_updateAFDriverShortStatisticsForStream:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (result)
  {
    v3 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    v4 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](v3, (uint64_t)a2);
    if (v4)
    {
      v5 = v4;
      result = objc_msgSend(a2, "getProperty:error:", *MEMORY[0x1E0D07398], 0);
      if (result)
        return objc_msgSend((id)objc_msgSend(v5, "afDriverShortStatisticsByPortType"), "setObject:forKeyedSubscript:", result, objc_msgSend(a2, "portType"));
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_unregisterFromStreamNotifications:(uint64_t)result
{
  if (result)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    return CMNotificationCenterRemoveListener();
  }
  return result;
}

- (void)shutDownSystemPressuredDevice:(id)a3
{
  _QWORD v3[6];

  if (a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __58__BWFigCaptureDeviceVendor_shutDownSystemPressuredDevice___block_invoke;
    v3[3] = &unk_1E491E748;
    v3[4] = self;
    v3[5] = a3;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v3);
  }
}

uint64_t __58__BWFigCaptureDeviceVendor_shutDownSystemPressuredDevice___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "deviceID"));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == objc_msgSend(v2, "device"))
  {
    objc_msgSend(v2, "setShutDownDueToSystemPressure:", 1);
    -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0, 1, 1);
  }
  return -[BWFigCaptureDeviceVendor _dumpInventory](*(_QWORD *)(a1 + 32));
}

- (void)resumeSystemPressuredDevice
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__BWFigCaptureDeviceVendor_resumeSystemPressuredDevice__block_invoke;
  v2[3] = &unk_1E491E720;
  v2[4] = self;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v2);
}

uint64_t __55__BWFigCaptureDeviceVendor_resumeSystemPressuredDevice__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "shutDownDueToSystemPressure"))
        {
          objc_msgSend(v7, "setShutDownDueToSystemPressure:", 0);
          v8 = *(_QWORD *)(a1 + 32);
          if (!*(_QWORD *)(v8 + 40))
          {
            v9 = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](v8);
            -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:](*(_QWORD *)(a1 + 32), (uint64_t)v9, 1, 1, 1);
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  return -[BWFigCaptureDeviceVendor _dumpInventory](*(_QWORD *)(a1 + 32));
}

- (float)structuredLightProjectorStandbyTemperatureWithError:(int *)a3
{
  float v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  float *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = (float *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__BWFigCaptureDeviceVendor_structuredLightProjectorStandbyTemperatureWithError___block_invoke;
  v6[3] = &unk_1E491F8B0;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v11;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v6);
  if (a3)
    *a3 = *((_DWORD *)v8 + 6);
  v4 = v12[6];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

void __80__BWFigCaptureDeviceVendor_structuredLightProjectorStandbyTemperatureWithError___block_invoke(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", 0x1E492D2B8);
  if (!v2)
  {
    -[BWFigCaptureDeviceVendor _createDevice:reason:clientPID:](a1[4], CFSTR("Default"), 0, 0);
    v2 = (void *)objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", 0x1E492D2B8);
  }
  v3 = (void *)objc_msgSend(v2, "device");
  v4 = (void *)objc_msgSend(v3, "copyStreamWithPortType:error:", *MEMORY[0x1E0D05A40], *(_QWORD *)(a1[5] + 8) + 24);
  v7 = v4;
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "getProperty:error:", *MEMORY[0x1E0D077B8], *(_QWORD *)(a1[5] + 8) + 24);
    if (!*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      objc_msgSend(v5, "floatValue");
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
    }
    -[BWFigCaptureDeviceVendor _resetDeviceCloseTimerForDevice:](a1[4], 0x1E492D2B8);
  }
  else
  {
    FigDebugAssert3();
  }

}

- (int)activeClientPriority
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__BWFigCaptureDeviceVendor_activeClientPriority__block_invoke;
  v4[3] = &unk_1E491F1A0;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void *__48__BWFigCaptureDeviceVendor_activeClientPriority__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
  {
    result = (void *)objc_msgSend(result, "clientPriority");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result;
  }
  return result;
}

- (id)cameraPoseMatrixForStreamWithPosition:(int)a3 deviceType:(int)a4 deviceID:(id)a5
{
  uint64_t v7;
  void *v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__25;
  v15 = __Block_byref_object_dispose__25;
  v16 = 0;
  v7 = BWCaptureDevicePositionAndDeviceTypeToPortType(a3, a4);
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__BWFigCaptureDeviceVendor_cameraPoseMatrixForStreamWithPosition_deviceType_deviceID___block_invoke;
    v10[3] = &unk_1E49233C0;
    v10[4] = self;
    v10[5] = a5;
    v10[6] = v7;
    v10[7] = &v11;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v10);
  }
  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __86__BWFigCaptureDeviceVendor_cameraPoseMatrixForStreamWithPosition_deviceType_deviceID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 96), "objectForKeyedSubscript:", a1[5]), "objectForKeyedSubscript:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  return result;
}

void __60__BWFigCaptureDeviceVendor__setupDeviceCloseTimerForDevice___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tofAFEstimatorResultsByPortType", v5, v6), "count"))
    -[BWFigCaptureDeviceVendor _logToFAFEstimatorResultsToCoreAnalyticsForDevice:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "afDriverShortStatisticsByPortType"), "count"))
    -[BWFigCaptureDeviceVendor _logAFDriverShortStatisticsToCoreAnalyticsForDevice:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v3 + 40))
  {
    v4 = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](v3);
    -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:](*(_QWORD *)(a1 + 40), (uint64_t)v4, 1, 0, 0);
  }
}

- (uint64_t)_logToFAFEstimatorResultsToCoreAnalyticsForDevice:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  BWTOFAssistedAutoFocusEstimatorAnalyticsPayload *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v15 = v2;
      LODWORD(v14) = 0;
      FigDebugAssert3();
    }
    v5 = (void *)objc_msgSend(*(id *)(v4 + 24), "objectForKeyedSubscript:", a2, v14, v15);
    if (v5)
    {
      v6 = v5;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = (void *)objc_msgSend(v5, "tofAFEstimatorResultsByPortType");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            v13 = objc_alloc_init(BWTOFAssistedAutoFocusEstimatorAnalyticsPayload);
            -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload setPortType:](v13, "setPortType:", v12);
            -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload setClientApplicationID:](v13, "setClientApplicationID:", objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorClientApplicationIDByPortType"), "objectForKeyedSubscript:", v12));
            -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload setEstimatorResults:](v13, "setEstimatorResults:", objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorResultsByPortType"), "objectForKeyedSubscript:", v12));
            -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload setStreamingTime:](v13, "setStreamingTime:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorResultsStreamingTimeByPortType"), "objectForKeyedSubscript:", v12), "intValue"));
            -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v13);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }
      objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorResultsByPortType"), "removeAllObjects");
      objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorResultsStreamingTimeByPortType"), "removeAllObjects");
      return objc_msgSend((id)objc_msgSend(v6, "tofAFEstimatorClientApplicationIDByPortType"), "removeAllObjects");
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_logAFDriverShortStatisticsToCoreAnalyticsForDevice:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  BWAutoFocusDriverShortStatisticsAnalyticsPayload *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v15 = v2;
      LODWORD(v14) = 0;
      FigDebugAssert3();
    }
    v5 = (void *)objc_msgSend(*(id *)(v4 + 24), "objectForKeyedSubscript:", a2, v14, v15);
    if (v5)
    {
      v6 = v5;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = (void *)objc_msgSend(v5, "afDriverShortStatisticsByPortType");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            v13 = objc_alloc_init(BWAutoFocusDriverShortStatisticsAnalyticsPayload);
            -[BWAutoFocusDriverShortStatisticsAnalyticsPayload setPortType:](v13, "setPortType:", v12);
            -[BWAutoFocusDriverShortStatisticsAnalyticsPayload setAfDriverShortStatistics:](v13, "setAfDriverShortStatistics:", objc_msgSend((id)objc_msgSend(v6, "afDriverShortStatisticsByPortType"), "objectForKeyedSubscript:", v12));
            -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v13);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }
      return objc_msgSend((id)objc_msgSend(v6, "afDriverShortStatisticsByPortType"), "removeAllObjects");
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

uint64_t __60__BWFigCaptureDeviceVendor__setupDeviceCloseTimerForDevice___block_invoke_211(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t result;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "deviceCloseTimer", v6, v7);
  if (v3 == result)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return objc_msgSend(*(id *)(a1 + 32), "setDeviceCloseTimer:", 0);
  }
  return result;
}

- (void)_deviceStateForDeviceWithStream:(uint64_t)a1
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v13 = v2;
    LODWORD(v12) = 0;
    FigDebugAssert3();
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_msgSend(*(id *)(a1 + 24), "allValues", v12, v13, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v15;
LABEL_6:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "device"), "streams"), "containsObject:", a2) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        goto LABEL_6;
      return 0;
    }
  }
}

BOOL __70__BWFigCaptureDeviceVendor__removeRegisteredDeviceClientWithClientID___block_invoke(uint64_t a1, void *a2)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 32);
  return v2 == objc_msgSend(a2, "clientID");
}

BOOL __70__BWFigCaptureDeviceVendor__removeVictimizedDeviceClientWithClientID___block_invoke(uint64_t a1, void *a2)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 32);
  return v2 == objc_msgSend(a2, "clientID");
}

- (void)_handleStreamControlTakenByAnotherClientNotification:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];
  _QWORD block[5];

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __81__BWFigCaptureDeviceVendor__handleStreamControlTakenByAnotherClientNotification___block_invoke;
    v3[3] = &unk_1E491E748;
    v3[4] = a1;
    v3[5] = a2;
    v2 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v3;
    dispatch_async(v2, block);
  }
}

void __81__BWFigCaptureDeviceVendor__handleStreamControlTakenByAnotherClientNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[5];
  os_log_type_t type;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(v2, "controlledStreams"), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if (dword_1ECFE98D0)
    {
      v12 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ((objc_msgSend((id)objc_msgSend(v2, "streamsControlledByOtherClients", v8, v9), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)objc_msgSend((id)objc_msgSend(v2, "streamsControlledByOtherClients"), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(v2, "controlledStreams"), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(v2, "streamsToKeepControlled"), "removeObject:", *(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__BWFigCaptureDeviceVendor__handleStreamControlTakenByAnotherClientNotification___block_invoke_215;
    block[3] = &unk_1E491E720;
    block[4] = v5;
    dispatch_async(v6, block);
    if (objc_msgSend((id)objc_msgSend(v2, "streamsRequiringControlControlledByOtherClients"), "count") == 1)
    {
      v7 = -[BWFigCaptureDeviceVendor _removeActiveDeviceClientAndMoveToVictimizedList:](*(_QWORD *)(a1 + 32), 1);
      -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:](*(_QWORD *)(a1 + 32), (uint64_t)v7, 0, 1, 0);
    }
  }
  else if (dword_1ECFE98D0)
  {
    v12 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __81__BWFigCaptureDeviceVendor__handleStreamControlTakenByAnotherClientNotification___block_invoke_215()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (void)_handleStreamRelinquishedByAnotherClientNotification:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];
  _QWORD block[5];

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __81__BWFigCaptureDeviceVendor__handleStreamRelinquishedByAnotherClientNotification___block_invoke;
    v3[3] = &unk_1E491E748;
    v3[4] = a2;
    v3[5] = a1;
    v2 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v3;
    dispatch_async(v2, block);
  }
}

void __81__BWFigCaptureDeviceVendor__handleStreamRelinquishedByAnotherClientNotification___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[5];
  os_log_type_t type;
  int v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE98D0)
  {
    v21 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients"), "containsObject:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__BWFigCaptureDeviceVendor__handleStreamRelinquishedByAnotherClientNotification___block_invoke_217;
  block[3] = &unk_1E491E720;
  block[4] = v5;
  dispatch_async(v6, block);
  if (objc_msgSend((id)objc_msgSend(v3, "portTypesAllowingStreamControlLoss"), "containsObject:", objc_msgSend(*(id *)(a1 + 32), "portType")))
  {
    -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](*(_QWORD *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients"), "removeObject:", *(_QWORD *)(a1 + 32));
  }
  else if (v4
         && !objc_msgSend((id)objc_msgSend(v3, "device"), "requestControlOfStreams:clientPriority:", objc_msgSend(v3, "streamsControlledByOtherClients"), 1))
  {
    v7 = -[BWFigCaptureDeviceVendor _popLatestVictimizedDeviceClient](*(_QWORD *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(v3, "device"), "relinquishControlOfStreams:", objc_msgSend(v3, "streamsControlledByOtherClients"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = (void *)objc_msgSend(v3, "streamsControlledByOtherClients");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[BWFigCaptureDeviceVendor _unregisterFromStreamNotifications:](*(_QWORD *)(a1 + 40));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      }
      while (v10);
    }
    objc_msgSend((id)objc_msgSend(v3, "streamsControlledByOtherClients", v13, v14), "removeAllObjects");
    -[BWFigCaptureDeviceVendor _deviceAvailabilityChangedForClient:available:postNotification:reason:](*(_QWORD *)(a1 + 40), (uint64_t)v7, 1, 1, 0);
    -[BWFigCaptureDeviceVendor _setupDeviceCloseTimerForDevice:](*(_QWORD *)(a1 + 40), objc_msgSend((id)objc_msgSend(v3, "device"), "deviceID"));
  }
}

uint64_t __81__BWFigCaptureDeviceVendor__handleStreamRelinquishedByAnotherClientNotification___block_invoke_217()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (void)_handleStreamFrameReceiveTimeoutNotification:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];
  _QWORD block[5];

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __73__BWFigCaptureDeviceVendor__handleStreamFrameReceiveTimeoutNotification___block_invoke;
    v3[3] = &unk_1E491E748;
    v3[4] = a1;
    v3[5] = a2;
    v2 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v3;
    dispatch_async(v2, block);
  }
}

void __73__BWFigCaptureDeviceVendor__handleStreamFrameReceiveTimeoutNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = -[BWFigCaptureDeviceVendor _deviceStateForDeviceWithStream:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v2, "device"))
    v3 = (void *)objc_msgSend((id)objc_msgSend(v2, "device"), "copyProperty:error:", CFSTR("StreamArray"), 0);
  else
    v3 = 0;
  if (objc_msgSend(v3, "containsObject:", objc_msgSend(*(id *)(a1 + 40), "figCaptureStream")))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    -[BWFigCaptureDeviceVendor _handleErrorForDevice:](*(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(v2, "device"), "deviceID"));
  }

}

- (void)_handleErrorForDevice:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t block;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  int v18;
  __int16 v19;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v12 = v2;
      LODWORD(v11) = 0;
      FigDebugAssert3();
    }
    v5 = objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", a2, v11, v12);
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[BWFigCaptureDeviceVendor _removeActiveDeviceClientAndMoveToVictimizedList:](a1, 0);
      -[BWFigCaptureDeviceVendor _invalidateAndReleaseDevice:](a1, (void *)objc_msgSend((id)objc_msgSend(v6, "device"), "deviceID"));
      v8 = *(NSObject **)(a1 + 80);
      v9 = MEMORY[0x1E0C809B0];
      block = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __98__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason___block_invoke;
      v16 = &unk_1E4923778;
      v19 = 1;
      v18 = 2;
      v17 = v7;
      dispatch_async(v8, &block);
      v10 = *(NSObject **)(a1 + 80);
      block = v9;
      v14 = 3221225472;
      v15 = __98__BWFigCaptureDeviceVendor__deviceAvailabilityChangedForClient_available_postNotification_reason___block_invoke;
      v16 = &unk_1E4923778;
      v19 = 257;
      v18 = 2;
      v17 = v7;
      dispatch_async(v10, &block);
    }
  }
}

- (void)_handleDeviceUnrecoverableError:(uint64_t)a3 fromDevice:
{
  NSObject *v3;
  _QWORD v4[6];
  int v5;
  _QWORD block[5];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__BWFigCaptureDeviceVendor__handleDeviceUnrecoverableError_fromDevice___block_invoke;
    v4[3] = &unk_1E49237A0;
    v4[4] = a1;
    v4[5] = a3;
    v5 = a2;
    v3 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v4;
    dispatch_async(v3, block);
  }
}

void __71__BWFigCaptureDeviceVendor__handleDeviceUnrecoverableError_fromDevice___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v7, "device"), "figCaptureDevice") == *(_QWORD *)(a1 + 40))
        {
          if (v7)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            -[BWFigCaptureDeviceVendor _handleErrorForDevice:](*(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(v7, "device"), "deviceID"));
          }
          return;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
}

- (void)_handleDeviceNoLongerAvailable:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];
  _QWORD block[5];

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__BWFigCaptureDeviceVendor__handleDeviceNoLongerAvailable___block_invoke;
    v3[3] = &unk_1E491F158;
    v3[4] = a1;
    v3[5] = a2;
    v2 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__BWFigCaptureDeviceVendor__performBlockOnDeviceQueue___block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v3;
    dispatch_async(v2, block);
  }
}

void __59__BWFigCaptureDeviceVendor__handleDeviceNoLongerAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
      if (objc_msgSend((id)objc_msgSend(v7, "device"), "figCaptureDevice") == *(_QWORD *)(a1 + 40))
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(v7, "device"), "figCaptureDevice") == *(_QWORD *)(a1 + 40))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    -[BWFigCaptureDeviceVendor _handleErrorForDevice:](*(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(v7, "device"), "deviceID"));
  }
}

- (int)requestControlOfStreams:(id)a3 device:(id)a4 deviceClientPriority:(int)a5
{
  int v5;
  _QWORD v7[8];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__BWFigCaptureDeviceVendor_requestControlOfStreams_device_deviceClientPriority___block_invoke;
  v7[3] = &unk_1E49237C8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = &v9;
  v8 = a5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v7);
  v5 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __80__BWFigCaptureDeviceVendor_requestControlOfStreams_device_deviceClientPriority___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[BWFigCaptureDeviceVendor _requestControlOfStreams:device:deviceClientPriority:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned int *)(a1 + 64));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)deviceWithID:(id)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__BWFigCaptureDeviceVendor_deviceWithID___block_invoke;
  v5[3] = &unk_1E4921488;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __41__BWFigCaptureDeviceVendor_deviceWithID___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_deviceWithID:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)_deviceWithID:(id)a3
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  if (!_FigIsCurrentDispatchQueue())
  {
    v8 = v3;
    LODWORD(v7) = 0;
    FigDebugAssert3();
  }
  return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_devicesStatesByDeviceID, "objectForKeyedSubscript:", a3, v7, v8), "device");
}

- (int)usageCountForDevice:(id)a3
{
  int v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__BWFigCaptureDeviceVendor_usageCountForDevice___block_invoke;
  v5[3] = &unk_1E4921488;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__BWFigCaptureDeviceVendor_usageCountForDevice___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]), "deviceUsageCount");
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)registeredDeviceClients
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__BWFigCaptureDeviceVendor_registeredDeviceClients__block_invoke;
  v4[3] = &unk_1E491E9A8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__BWFigCaptureDeviceVendor_registeredDeviceClients__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)registeredDeviceClientWithID:(int)a3
{
  id v3;
  _QWORD v5[6];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__BWFigCaptureDeviceVendor_registeredDeviceClientWithID___block_invoke;
  v5[3] = &unk_1E4923640;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

_QWORD *__57__BWFigCaptureDeviceVendor_registeredDeviceClientWithID___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = -[BWFigCaptureDeviceVendor _registeredDeviceClientWithID:](*(_QWORD **)(a1 + 32), *(_DWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)activeDeviceClient
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__BWFigCaptureDeviceVendor_activeDeviceClient__block_invoke;
  v4[3] = &unk_1E491E9A8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __46__BWFigCaptureDeviceVendor_activeDeviceClient__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)victimizedDeviceClients
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__BWFigCaptureDeviceVendor_victimizedDeviceClients__block_invoke;
  v4[3] = &unk_1E491E9A8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __51__BWFigCaptureDeviceVendor_victimizedDeviceClients__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)hasActiveForClientAssertion
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__BWFigCaptureDeviceVendor_hasActiveForClientAssertion__block_invoke;
  v4[3] = &unk_1E491E9A8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __55__BWFigCaptureDeviceVendor_hasActiveForClientAssertion__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 88) != 0;
  return result;
}

- (id)defaultDeviceCreationHistory
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__BWFigCaptureDeviceVendor_defaultDeviceCreationHistory__block_invoke;
  v4[3] = &unk_1E491E9A8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __56__BWFigCaptureDeviceVendor_defaultDeviceCreationHistory__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)cmioDeviceCreationHistory
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__25;
  v9 = __Block_byref_object_dispose__25;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__BWFigCaptureDeviceVendor_cmioDeviceCreationHistory__block_invoke;
  v4[3] = &unk_1E491E9A8;
  v4[4] = self;
  v4[5] = &v5;
  -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueueSynchronously:]((uint64_t)self, (uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __53__BWFigCaptureDeviceVendor_cmioDeviceCreationHistory__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_showISPLeftOnTapToRadarPromptIfNecessary:(uint64_t)a3 radarTitle:(uint64_t)a4 radarDescription:(uint64_t)a5 radarClassification:(uint64_t)a6 radarReproducibility:
{
  const __CFString *v11;
  const __CFString *v12;
  CFPropertyListRef v13;
  const void *v14;
  void *v15;
  id v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v18;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (FigCaptureOSVariantHasInternalUI())
    {
      v11 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v12 = (const __CFString *)*MEMORY[0x1E0C9B230];
      v13 = (id)CFPreferencesCopyValue(CFSTR("LastShownISPLeftOnTTRPromptDate"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      v14 = (const void *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "isDate:inSameDayAsDate:", v13, v14)|| (v18 = a6, v15 = (id)CFPreferencesCopyValue(CFSTR("LastShownISPLeftOnTTRPromptBuildVersion"), CFSTR("com.apple.cameracapture.volatile"), v11, v12), v16 = (id)MGCopyAnswer(), objc_msgSend(v15, "isEqualToString:", v16)))
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        FigCapturePromptOpenTapToRadar(a2, a3, a4, 1, a5, v18, 0.0);
        CFPreferencesSetValue(CFSTR("LastShownISPLeftOnTTRPromptDate"), v14, CFSTR("com.apple.cameracapture.volatile"), v11, v12);
        CFPreferencesSetValue(CFSTR("LastShownISPLeftOnTTRPromptBuildVersion"), v16, CFSTR("com.apple.cameracapture.volatile"), v11, v12);
      }
    }
  }
}

uint64_t __59__BWFigCaptureDeviceVendor__createDevice_reason_clientPID___block_invoke(uint64_t a1)
{
  return -[BWFigCaptureDeviceVendor _logActiveDefaultDeviceClientAndDevice](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_logActiveDefaultDeviceClientAndDevice
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;

  if (result)
  {
    v1 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!(_DWORD)result)
      result = FigDebugAssert3();
    if (*(_QWORD *)(v1 + 40))
    {
      if (!dword_1ECFE98D0)
        return result;
    }
    else if (!dword_1ECFE98D0)
    {
      return result;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFE98D0)
    {
      v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (id)osStatePropertyList
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v6 = v2;
    LODWORD(v5) = 0;
    FigDebugAssert3();
  }
  v7[0] = CFSTR("Default Device Creation History");
  v7[1] = CFSTR("CMIO Device Creation History");
  v8 = *(_OWORD *)&self->_defaultDeviceCreationHistory;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, v7, 2, v5, v6);
}

void __55__BWFigCaptureDeviceVendor__updateCMIOExtensionDevices__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("DevicesChanged"), *(const void **)(a1 + 32), 0, 1u);
}

- (void)_handleCMIOExtensionDevicesChangedNotification:(id)a3
{
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v6[5];
  os_log_type_t type;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "name");
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA54F0]) & 1) != 0)
  {
    if (dword_1ECFE98D0)
    {
      v8 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__BWFigCaptureDeviceVendor__handleCMIOExtensionDevicesChangedNotification___block_invoke;
    v6[3] = &unk_1E491E720;
    v6[4] = self;
    -[BWFigCaptureDeviceVendor _performBlockOnDeviceQueue:]((uint64_t)self, (uint64_t)v6);
  }
  else
  {
    FigDebugAssert3();
  }
}

void __75__BWFigCaptureDeviceVendor__handleCMIOExtensionDevicesChangedNotification___block_invoke(uint64_t a1)
{
  -[BWFigCaptureDeviceVendor _updateCMIOExtensionDevices](*(_QWORD *)(a1 + 32));
}

@end
