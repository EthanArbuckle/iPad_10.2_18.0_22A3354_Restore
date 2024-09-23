@implementation CLLocationSmoother

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationSmoother;
  -[CLLocationSmoother dealloc](&v3, sel_dealloc);
}

- (_CLLocationSmootherProxy)locationManagerSmootherProxy
{
  _CLLocationSmootherProxy *result;
  _CLLocationSmootherProxy *v4;
  const char *v5;
  uint64_t v6;

  result = self->_locationManagerSmootherProxy;
  if (!result)
  {
    v4 = [_CLLocationSmootherProxy alloc];
    result = (_CLLocationSmootherProxy *)objc_msgSend_initWithCLLocationSmoother_(v4, v5, (uint64_t)self, v6);
    self->_locationManagerSmootherProxy = result;
  }
  return result;
}

- (void)smoothLocations:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  _QWORD v7[6];

  v6 = *(NSObject **)(objc_msgSend_locationManagerSmootherProxy(self, a2, (uint64_t)a3, v3) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18F6110BC;
  v7[3] = &unk_1E2991118;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

- (void)smoothLocations:(id)a3 handler:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_smoothLocations_workoutActivityType_handler_, a3, 3000);
}

- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 handler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_smoothLocations_workoutActivityType_shouldReconstructRoute_handler_, a3, a4);
}

- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 shouldReconstructRoute:(BOOL)a5 handler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_smoothLocations_workoutActivityType_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_, a3, a4);
}

- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 shouldReconstructRoute:(BOOL)a5 timeIntervalsThatNeedPopulated:(id)a6 handler:(id)a7
{
  uint64_t v9;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *started;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  void **p_cache;
  unsigned int v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *global_queue;
  id v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  NSObject *v125;
  NSObject *v126;
  NSObject *v127;
  char *v128;
  char *v129;
  id v130;
  unsigned int v131;
  int64_t v132;
  id v133;
  id obj;
  _QWORD v135[5];
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD block[5];
  int v141;
  uint64_t v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  uint64_t v146;
  uint8_t buf[4];
  _BYTE v148[34];
  _BYTE v149[128];
  uint64_t v150;

  v9 = a5;
  v150 = *MEMORY[0x1E0C80C00];
  if ((sub_18F672128() & 1) == 0)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F611BFC;
    block[3] = &unk_1E2990E30;
    block[4] = a7;
    dispatch_async(global_queue, block);
    return;
  }
  v15 = (void **)&v141;
  v132 = a4;
  v133 = a3;
  if (!a6)
  {
    obj = 0;
    goto LABEL_35;
  }
  obj = a6;
  if (!objc_msgSend_count(a6, v12, v13, v14))
    goto LABEL_35;
  v131 = v9;
  v130 = a7;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, v16, (uint64_t)&v136, (uint64_t)v149, 16);
  if (v17)
  {
    v20 = v17;
    v21 = 0;
    v22 = *(_QWORD *)v137;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v137 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v23);
        if (qword_1EE172148 != -1)
          dispatch_once(&qword_1EE172148, &unk_1E2990290);
        v25 = qword_1EE172150;
        if (os_log_type_enabled((os_log_t)qword_1EE172150, OS_LOG_TYPE_DEFAULT))
        {
          started = (void *)objc_msgSend_startDate(v24, v26, v27, v28);
          objc_msgSend_timeIntervalSinceReferenceDate(started, v30, v31, v32);
          v34 = v33;
          v38 = (void *)objc_msgSend_endDate(v24, v35, v36, v37);
          objc_msgSend_timeIntervalSinceReferenceDate(v38, v39, v40, v41);
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)v148 = v21 + v23;
          *(_WORD *)&v148[8] = 2048;
          v15 = (void **)&v141;
          *(_QWORD *)&v148[10] = v34;
          *(_WORD *)&v148[18] = 2048;
          *(_QWORD *)&v148[20] = v42;
          _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_DEFAULT, "CLRS,timeIntervalsThatNeedPopulated,index,%zu,start,%.lf,stop,%.1lf", buf, 0x20u);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE172148 != -1)
            dispatch_once(&qword_1EE172148, &unk_1E2990290);
          v47 = (void *)objc_msgSend_startDate(v24, v44, v45, v46);
          objc_msgSend_timeIntervalSinceReferenceDate(v47, v48, v49, v50);
          v52 = v51;
          v56 = (void *)objc_msgSend_endDate(v24, v53, v54, v55);
          objc_msgSend_timeIntervalSinceReferenceDate(v56, v57, v58, v59);
          v141 = 134218496;
          v142 = v21 + v23;
          v143 = 2048;
          v15 = (void **)&v141;
          v144 = v52;
          v145 = 2048;
          v146 = v60;
          v61 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationSmoother smoothLocations:workoutActivityType:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:]", "CoreLocation: %s\n", v61);
          if (v61 != (char *)buf)
            free(v61);
        }
        ++v23;
      }
      while (v20 != v23);
      v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v136, (uint64_t)v149, 16);
      v20 = v62;
      v21 += v23;
    }
    while (v62);
  }
  LODWORD(p_cache) = objc_msgSend_authorizationStatusForBundlePath_(CLLocationManager, v18, (uint64_t)CFSTR("/System/Library/LocationBundles/AppleWatchWorkout.bundle"), v19);
  if (qword_1EE172148 != -1)
    goto LABEL_68;
  while (1)
  {
    v64 = (_DWORD)p_cache - 3;
    v65 = qword_1EE172150;
    a7 = v130;
    v9 = v131;
    if (os_log_type_enabled((os_log_t)qword_1EE172150, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)v148 = v64 < 2;
      *(_WORD *)&v148[4] = 1026;
      *(_DWORD *)((char *)v15 + 42) = (_DWORD)p_cache;
      _os_log_impl(&dword_18F5B3000, v65, OS_LOG_TYPE_DEFAULT, "CLRS,workoutAppIsAuthorizedForLocations,%{public}d,workoutAppAuthorizationStatus,%{public}d", buf, 0xEu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172148 != -1)
        dispatch_once(&qword_1EE172148, &unk_1E2990290);
      v141 = 67240448;
      LODWORD(v142) = v64 < 2;
      WORD2(v142) = 1026;
      *(_DWORD *)((char *)v15 + 10) = (_DWORD)p_cache;
      v128 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationSmoother smoothLocations:workoutActivityType:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:]", "CoreLocation: %s\n", v128);
      if (v128 != (char *)buf)
        free(v128);
      a7 = v130;
      v9 = v131;
    }
    if (v64 >= 2)
    {
      if (qword_1EE172148 != -1)
        dispatch_once(&qword_1EE172148, &unk_1E2990290);
      v66 = qword_1EE172150;
      if (os_log_type_enabled((os_log_t)qword_1EE172150, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v148 = (_DWORD)p_cache;
        _os_log_impl(&dword_18F5B3000, v66, OS_LOG_TYPE_ERROR, "CLRS,workout app is not authorized for locations,clearing time intervals that need populated,status,%{public}d", buf, 8u);
      }
      if (sub_18F5C4AE0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172148 != -1)
          dispatch_once(&qword_1EE172148, &unk_1E2990290);
        v141 = 67240192;
        LODWORD(v142) = (_DWORD)p_cache;
        v129 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationSmoother smoothLocations:workoutActivityType:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:]", "CoreLocation: %s\n", v129);
        if (v129 != (char *)buf)
          free(v129);
        obj = 0;
        a7 = v130;
      }
      else
      {
        obj = 0;
      }
      v9 = v131;
    }
LABEL_35:
    v68 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v70 = objc_msgSend_initWithMachServiceName_options_(v68, v69, (uint64_t)CFSTR("com.apple.locationd.smoother"), 4096);
    if (v70)
      break;
    p_cache = &OBJC_METACLASS___CLAssertion.cache;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2991690);
    v15 = &OBJC_METACLASS___CLAssertion.cache;
    v125 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v148 = 0;
      *(_WORD *)&v148[4] = 2082;
      *(_QWORD *)&v148[6] = "";
      *(_WORD *)&v148[14] = 2082;
      *(_QWORD *)&v148[16] = "assert";
      *(_WORD *)&v148[24] = 2081;
      *(_QWORD *)&v148[26] = "connection";
      _os_log_impl(&dword_18F5B3000, v125, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"-initWithMachServiceName:options: is declared to return nonnull but failed to return an object\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991690);
    }
    v126 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v148 = 0;
      *(_WORD *)&v148[4] = 2082;
      *(_QWORD *)&v148[6] = "";
      *(_WORD *)&v148[14] = 2082;
      *(_QWORD *)&v148[16] = "assert";
      *(_WORD *)&v148[24] = 2081;
      *(_QWORD *)&v148[26] = "connection";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v126, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "-initWithMachServiceName:options: is declared to return nonnull but failed to return an object", "{\"msg%{public}.0s\":\"-initWithMachServiceName:options: is declared to return nonnull but failed to return an object\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2991690);
    }
    v127 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v148 = 0;
      *(_WORD *)&v148[4] = 2082;
      *(_QWORD *)&v148[6] = "";
      *(_WORD *)&v148[14] = 2082;
      *(_QWORD *)&v148[16] = "assert";
      *(_WORD *)&v148[24] = 2081;
      *(_QWORD *)&v148[26] = "connection";
      _os_log_impl(&dword_18F5B3000, v127, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"-initWithMachServiceName:options: is declared to return nonnull but failed to return an object\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_68:
    dispatch_once(&qword_1EE172148, &unk_1E2990290);
  }
  v73 = (void *)v70;
  v74 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v71, (uint64_t)&unk_1EE179C68, v72);
  objc_msgSend_setExportedInterface_(v73, v75, v74, v76);
  v79 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v77, (uint64_t)&unk_1EE18FF48, v78);
  objc_msgSend_setRemoteObjectInterface_(v73, v80, v79, v81);
  v85 = (void *)objc_msgSend_remoteObjectInterface(v73, v82, v83, v84);
  v86 = (void *)MEMORY[0x1E0C99E60];
  v87 = objc_opt_class();
  v88 = objc_opt_class();
  v91 = objc_msgSend_setWithObjects_(v86, v89, v87, v90, v88, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v85, v92, v91, (uint64_t)sel_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_, 0, 0);
  v96 = (void *)objc_msgSend_remoteObjectInterface(v73, v93, v94, v95);
  v97 = (void *)MEMORY[0x1E0C99E60];
  v98 = objc_opt_class();
  v99 = objc_opt_class();
  v102 = objc_msgSend_setWithObjects_(v97, v100, v98, v101, v99, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v96, v103, v102, (uint64_t)sel_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_, 3, 0);
  v107 = (void *)objc_msgSend_remoteObjectInterface(v73, v104, v105, v106);
  v108 = (void *)MEMORY[0x1E0C99E60];
  v109 = objc_opt_class();
  v110 = objc_opt_class();
  v113 = objc_msgSend_setWithObjects_(v108, v111, v109, v112, v110, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v107, v114, v113, (uint64_t)sel_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_, 0, 1);
  objc_msgSend_resume(v73, v115, v116, v117);
  v135[0] = MEMORY[0x1E0C809B0];
  v135[1] = 3221225472;
  v135[2] = sub_18F611C54;
  v135[3] = &unk_1E2991670;
  v135[4] = a7;
  v120 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v73, v118, (uint64_t)v135, v119);
  v122 = 4;
  if (v132 > 51)
  {
    v123 = (uint64_t)v133;
    v124 = obj;
    if (v132 > 69)
    {
      if ((unint64_t)(v132 - 70) < 2)
      {
        objc_msgSend_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v120, v121, (uint64_t)v133, 90603, v9, obj, a7);
        return;
      }
LABEL_55:
      v122 = 62;
      goto LABEL_56;
    }
    if (v132 != 52)
    {
      if (v132 == 61)
      {
        objc_msgSend_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v120, v121, (uint64_t)v133, 19150, v9, obj, a7);
        return;
      }
      if (v132 == 67)
      {
        objc_msgSend_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v120, v121, (uint64_t)v133, 519150, v9, obj, a7);
        return;
      }
      goto LABEL_55;
    }
  }
  else
  {
    v123 = (uint64_t)v133;
    v124 = obj;
    if (v132 <= 23)
    {
      if (v132 == 13)
      {
        objc_msgSend_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v120, v121, (uint64_t)v133, 6, v9, obj, a7);
        return;
      }
      if (v132 == 21)
      {
        objc_msgSend_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v120, v121, (uint64_t)v133, 15255, v9, obj, a7);
        return;
      }
      goto LABEL_55;
    }
    if (v132 != 24)
    {
      if (v132 == 37)
      {
        objc_msgSend_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v120, v121, (uint64_t)v133, 8, v9, obj, a7);
        return;
      }
      if (v132 == 46)
      {
        objc_msgSend_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v120, v121, (uint64_t)v133, 18240, v9, obj, a7);
        return;
      }
      goto LABEL_55;
    }
  }
LABEL_56:
  objc_msgSend_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_(v120, v121, v123, v122, v9, v124, a7);
}

- (void)setDelegate:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  _QWORD v7[6];

  v6 = *(NSObject **)(objc_msgSend_locationManagerSmootherProxy(self, a2, (uint64_t)a3, v3) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18F611D84;
  v7[3] = &unk_1E2991118;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

- (CLLocationManagerDelegateInternal)delegate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_locationManagerSmootherProxy(self, a2, v2, v3);
  return (CLLocationManagerDelegateInternal *)objc_msgSend_delegate(v4, v5, v6, v7);
}

@end
