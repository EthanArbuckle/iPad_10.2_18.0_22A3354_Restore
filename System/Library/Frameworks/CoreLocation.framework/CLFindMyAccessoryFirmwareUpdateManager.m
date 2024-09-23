@implementation CLFindMyAccessoryFirmwareUpdateManager

- (CLFindMyAccessoryFirmwareUpdateManager)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return 0;
}

- (CLFindMyAccessoryFirmwareUpdateManager)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  CLFindMyAccessoryFirmwareUpdateManager *v6;
  CLFindMyAccessoryFirmwareUpdateManager *v7;
  uint64_t v8;
  id v10[5];
  id v11;
  objc_super v12;
  id location[2];
  char v14;

  v12.receiver = self;
  v12.super_class = (Class)CLFindMyAccessoryFirmwareUpdateManager;
  v6 = -[CLFindMyAccessoryFirmwareUpdateManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, a3);
    if (a4)
    {
      v7->_delegateQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
    else
    {
      v7->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.FindMyAccessoryFirmwareUpdateManager.privateQueue", 0);
    }
    v8 = operator new();
    sub_18F5D5990(location, "com.apple.locationd.registration");
    MEMORY[0x194002B20](v8, location, v7->_delegateQueue);
    if (v14 < 0)
      operator delete(location[0]);
    sub_18F61BBC8((uint64_t *)&v7->_connection, v8);
    objc_initWeak(location, v7);
    v10[1] = (id)MEMORY[0x1E0C809B0];
    v10[2] = (id)3221225472;
    v10[3] = sub_18F7020E4;
    v10[4] = &unk_1E2991720;
    objc_copyWeak(&v11, location);
    CLConnectionClient::setDefaultMessageHandler();
    objc_copyWeak(v10, location);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(v7->_connection.__ptr_.__value_);
    objc_destroyWeak(v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  return v7;
}

- (void)handleInterruption
{
  NSObject *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  char *v11;
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[1640];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990B10);
  v3 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_ERROR, "Connection to locationd interrupted!!", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLFindMyAccessoryFirmwareUpdateManager handleInterruption]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = CFSTR("Connection to locationd interrupted!");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)&v13, (uint64_t)&v12, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 8, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryFirmwareUpdateManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSSet *v15;
  void *DictionaryOfClasses;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const std::string *v23;
  const char *v24;
  uint64_t v25;
  const std::string *v26;
  const std::string *v27;
  const char *v28;
  uint64_t v29;
  const std::string *v30;
  const char *v31;
  uint64_t v32;
  const std::string *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  id Weak;
  const char *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  id v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  id v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  id v93;
  const char *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  const char *v117;
  char *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint8_t buf[4];
  uint64_t v157;
  __int16 v158;
  uint64_t v159;
  __int16 v160;
  uint64_t v161;
  uint64_t v162;

  var0 = (CLConnectionMessage **)a3.var0;
  v162 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990B10);
  v5 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CLConnectionMessage::name(*var0);
    if (*(char *)(v6 + 23) >= 0)
      v7 = v6;
    else
      v7 = *(_QWORD *)v6;
    *(_DWORD *)buf = 136315138;
    v157 = v7;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "Got Reply: message: %s", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    CLConnectionMessage::name(*var0);
    v118 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v118);
    if (v118 != (char *)buf)
      free(v118);
  }
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v15 = (NSSet *)objc_msgSend_setWithObjects_(v8, v13, v9, v14, v10, v11, v12, 0);
  DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v15);
  v19 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v17, 0x1E2998148, v18);
  v22 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v20, 0x1E29981A8, v21);
  v23 = (const std::string *)CLConnectionMessage::name(*var0);
  if (!std::string::compare(v23, "DurianManagement/DidFetchPersonalizationInformation"))
  {
    v38 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v24, 0x1E29982C8, v25);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    v39 = qword_1EE172120;
    if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (void *)objc_msgSend_UUIDString(v19, v40, v41, v42);
      v47 = objc_msgSend_UTF8String(v43, v44, v45, v46);
      v48 = "Failed";
      *(_DWORD *)buf = 136315650;
      v157 = v47;
      if (!v22)
        v48 = "Success";
      v158 = 2080;
      v159 = (uint64_t)v48;
      v160 = 2112;
      v161 = v38;
      _os_log_impl(&dword_18F5B3000, v39, OS_LOG_TYPE_DEFAULT, "informing client -- did retreive personalization info for device: %s - %s with info: %@", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172118 != -1)
        dispatch_once(&qword_1EE172118, &unk_1E2990B10);
      v122 = (void *)objc_msgSend_UUIDString(v19, v119, v120, v121);
      objc_msgSend_UTF8String(v122, v123, v124, v125);
      v126 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v126);
      if (v126 != (char *)buf)
        free(v126);
    }
    Weak = objc_loadWeak((id *)&self->_delegate);
    objc_msgSend_findMyAccessoryFirmwareUpdateManager_personalizationRequestForDevice_completedWithInfo_andError_(Weak, v50, (uint64_t)self, (uint64_t)v19, v38, v22);
  }
  else
  {
    v26 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v26, "DurianManagement/DidUpdateFirmware"))
    {
      if (qword_1EE172118 != -1)
        dispatch_once(&qword_1EE172118, &unk_1E2990B10);
      v51 = qword_1EE172120;
      if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
      {
        v55 = (void *)objc_msgSend_UUIDString(v19, v52, v53, v54);
        v59 = objc_msgSend_UTF8String(v55, v56, v57, v58);
        v60 = "Failed";
        if (!v22)
          v60 = "Succeeded";
        *(_DWORD *)buf = 136315394;
        v157 = v59;
        v158 = 2080;
        v159 = (uint64_t)v60;
        _os_log_impl(&dword_18F5B3000, v51, OS_LOG_TYPE_DEFAULT, "informing client -- firmware update for device: %s - %s", buf, 0x16u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172118 != -1)
          dispatch_once(&qword_1EE172118, &unk_1E2990B10);
        v130 = (void *)objc_msgSend_UUIDString(v19, v127, v128, v129);
        objc_msgSend_UTF8String(v130, v131, v132, v133);
        v134 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v134);
        if (v134 != (char *)buf)
          free(v134);
      }
      v61 = objc_loadWeak((id *)&self->_delegate);
      objc_msgSend_findMyAccessoryFirmwareUpdateManager_firmwareUpdateRequestForDevice_completedWithError_(v61, v62, (uint64_t)self, (uint64_t)v19, v22);
    }
    else
    {
      v27 = (const std::string *)CLConnectionMessage::name(*var0);
      if (!std::string::compare(v27, "DurianManagement/DidUseLocalAssetRequest"))
      {
        v63 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v28, 0x1E2998868, v29);
        v66 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v64, 0x1E2998888, v65);
        if (qword_1EE172118 != -1)
          dispatch_once(&qword_1EE172118, &unk_1E2990B10);
        v67 = qword_1EE172120;
        if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
        {
          v71 = objc_msgSend_UTF8String(v63, v68, v69, v70);
          v75 = objc_msgSend_UTF8String(v66, v72, v73, v74);
          v76 = "Failed";
          *(_DWORD *)buf = 136315650;
          v157 = v71;
          v158 = 2080;
          if (!v22)
            v76 = "Succeeded";
          v159 = v75;
          v160 = 2080;
          v161 = (uint64_t)v76;
          _os_log_impl(&dword_18F5B3000, v67, OS_LOG_TYPE_DEFAULT, "informing client -- use local asset request for product group: %s, product number: %s - %s", buf, 0x20u);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE172118 != -1)
            dispatch_once(&qword_1EE172118, &unk_1E2990B10);
          objc_msgSend_UTF8String(v63, v135, v136, v137);
          objc_msgSend_UTF8String(v66, v138, v139, v140);
          v141 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v141);
          if (v141 != (char *)buf)
            free(v141);
        }
        v77 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryFirmwareUpdateManager_useLocalAssetRequestForProductGroup_andProductNumber_completedWithError_(v77, v78, (uint64_t)self, (uint64_t)v63, v66, v22);
      }
      else
      {
        v30 = (const std::string *)CLConnectionMessage::name(*var0);
        if (!std::string::compare(v30, "DurianManagement/DidUseDefaultAssetRequest"))
        {
          v79 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v31, 0x1E2998868, v32);
          v82 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v80, 0x1E2998888, v81);
          if (qword_1EE172118 != -1)
            dispatch_once(&qword_1EE172118, &unk_1E2990B10);
          v83 = qword_1EE172120;
          if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
          {
            v87 = objc_msgSend_UTF8String(v79, v84, v85, v86);
            v91 = objc_msgSend_UTF8String(v82, v88, v89, v90);
            v92 = "Failed";
            *(_DWORD *)buf = 136315650;
            v157 = v87;
            v158 = 2080;
            if (!v22)
              v92 = "Succeeded";
            v159 = v91;
            v160 = 2080;
            v161 = (uint64_t)v92;
            _os_log_impl(&dword_18F5B3000, v83, OS_LOG_TYPE_DEFAULT, "informing client -- use default asset request for product group: %s, product number: %s - %s", buf, 0x20u);
          }
          if (sub_18F5C4AE0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EE172118 != -1)
              dispatch_once(&qword_1EE172118, &unk_1E2990B10);
            objc_msgSend_UTF8String(v79, v142, v143, v144);
            objc_msgSend_UTF8String(v82, v145, v146, v147);
            v148 = (char *)_os_log_send_and_compose_impl();
            sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v148);
            if (v148 != (char *)buf)
              free(v148);
          }
          v93 = objc_loadWeak((id *)&self->_delegate);
          objc_msgSend_findMyAccessoryFirmwareUpdateManager_useDefaultAssetRequestForProductGroup_andProductNumber_completedWithError_(v93, v94, (uint64_t)self, (uint64_t)v79, v82, v22);
        }
        else
        {
          v33 = (const std::string *)CLConnectionMessage::name(*var0);
          if (!std::string::compare(v33, "DurianManagement/DidFetchWhetherLocalFirmwareAssetIsInUse"))
          {
            v95 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v34, 0x1E2998868, v35);
            v98 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v96, 0x1E2998888, v97);
            v101 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v99, 0x1E29988C8, v100);
            v105 = objc_msgSend_BOOLValue(v101, v102, v103, v104);
            if (qword_1EE172118 != -1)
              dispatch_once(&qword_1EE172118, &unk_1E2990B10);
            v106 = qword_1EE172120;
            if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
            {
              if ((_DWORD)v105)
                v110 = "IN USE";
              else
                v110 = "NOT IN USE";
              v111 = objc_msgSend_UTF8String(v95, v107, v108, v109);
              v115 = objc_msgSend_UTF8String(v98, v112, v113, v114);
              *(_DWORD *)buf = 136315650;
              v157 = (uint64_t)v110;
              v158 = 2080;
              v159 = v111;
              v160 = 2080;
              v161 = v115;
              _os_log_impl(&dword_18F5B3000, v106, OS_LOG_TYPE_DEFAULT, "informing client -- local firmware asset is %s for product group: %s, product number: %s", buf, 0x20u);
            }
            if (sub_18F5C4AE0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE172118 != -1)
                dispatch_once(&qword_1EE172118, &unk_1E2990B10);
              objc_msgSend_UTF8String(v95, v149, v150, v151);
              objc_msgSend_UTF8String(v98, v152, v153, v154);
              v155 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v155);
              if (v155 != (char *)buf)
                free(v155);
            }
            v116 = objc_loadWeak((id *)&self->_delegate);
            objc_msgSend_findMyAccessoryFirmwareUpdateManager_didFetchWhetherLocalFirmwareAssetIsInUseForProductGroup_andProductNumber_withResult_(v116, v117, (uint64_t)self, (uint64_t)v95, v98, v105);
          }
          else
          {
            if (qword_1EE172118 != -1)
              dispatch_once(&qword_1EE172118, &unk_1E2990B10);
            v36 = qword_1EE172120;
            if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_ERROR, "CLFindMyAccessoryFirmwareUpdateManager - Unknown Message - ignoring", buf, 2u);
            }
            if (sub_18F5C4AE0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EE172118 != -1)
                dispatch_once(&qword_1EE172118, &unk_1E2990B10);
              v37 = (char *)_os_log_send_and_compose_impl();
              sub_18F5F2740("Generic", 1, 0, 0, "-[CLFindMyAccessoryFirmwareUpdateManager handleMessage:]", "CoreLocation: %s\n", v37);
              if (v37 != (char *)buf)
                free(v37);
            }
          }
        }
      }
    }
  }
}

- (void)getPersonalizationInfoForDevice:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2992C00, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990B10);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "getPersonalizationInfoForDevice: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager getPersonalizationInfoForDevice:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)updateFirmwareForDevice:(id)a3 withAssetURL:(id)a4
{
  NSObject *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  void *v16;
  const char *v17;
  char *v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetURL"));
  }
  v31[0] = 0x1E2998148;
  v31[1] = 0x1E29982E8;
  v32[0] = a3;
  v32[1] = a4;
  v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v32, (uint64_t)v31, 2);
  sub_18F5D5ED4(off_1E2992C08, &v22, &v20);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990B10);
  v7 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = a3;
    v29 = 2112;
    v30 = a4;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "updateFirmwareForDevice for device: %@ with assetURL: %@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    v23 = 138412546;
    v24 = a3;
    v25 = 2112;
    v26 = a4;
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager updateFirmwareForDevice:withAssetURL:]", "CoreLocation: %s\n", v18);
    if (v18 != (char *)buf)
      free(v18);
  }
  v19 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v19)
  {
    v10 = (unint64_t *)&v19->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v12 = v21;
  if (v21)
  {
    v13 = (unint64_t *)&v21->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (void)abortFirmwareUpdateForDevice:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2992C10, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990B10);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "abortFirmwareUpdateForDevice: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager abortFirmwareUpdateForDevice:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)useLocalFirmwareAssetFromURL:(id)a3 forProductGroup:(id)a4 forProductNumber:(id)a5 withSandboxExtension:(id)a6
{
  NSObject *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  char *v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  int v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  _QWORD v49[4];
  _QWORD v50[5];

  v50[4] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v20 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firmwareUpdateAssetURL"));
    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
LABEL_26:
      v24 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("productNumber"));
      if (a6)
        goto LABEL_5;
      goto LABEL_27;
    }
  }
  v22 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("productGroup"));
  if (!a5)
    goto LABEL_26;
LABEL_4:
  if (a6)
    goto LABEL_5;
LABEL_27:
  v26 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extension"));
LABEL_5:
  v49[0] = 0x1E2998848;
  v49[1] = 0x1E2998868;
  v50[0] = a3;
  v50[1] = a4;
  v49[2] = 0x1E2998888;
  v49[3] = 0x1E29988A8;
  v50[2] = a5;
  v50[3] = a6;
  v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v50, (uint64_t)v49, 4);
  sub_18F5D5ED4(off_1E2992C18, &v32, &v30);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990B10);
  v12 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v42 = a3;
    v43 = 2112;
    v44 = a4;
    v45 = 2112;
    v46 = a5;
    v47 = 2112;
    v48 = a6;
    _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_DEFAULT, "useLocalFirmwareAssetFromURL: %@ forProductGroup: %@ forPorductNumber: %@ withSandboxExtension: %@", buf, 0x2Au);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    v33 = 138413058;
    v34 = a3;
    v35 = 2112;
    v36 = a4;
    v37 = 2112;
    v38 = a5;
    v39 = 2112;
    v40 = a6;
    v28 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager useLocalFirmwareAssetFromURL:forProductGroup:forProductNumber:withSandboxExtension:]", "CoreLocation: %s\n", v28);
    if (v28 != (char *)buf)
      free(v28);
  }
  v29 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v29)
  {
    v15 = (unint64_t *)&v29->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v17 = v31;
  if (v31)
  {
    v18 = (unint64_t *)&v31->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

- (void)useDefaultFirmwareAssetSourceForProductGroup:(id)a3 andProductNumber:(id)a4
{
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  char *v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("productGroup"));
    if (a4)
      goto LABEL_3;
  }
  v18 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("productNumber"));
LABEL_3:
  v33[0] = 0x1E2998868;
  v33[1] = 0x1E2998888;
  v34[0] = a3;
  v34[1] = a4;
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v34, (uint64_t)v33, 2);
  sub_18F5D5ED4(off_1E2992C20, &v24, &v22);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990B10);
  v8 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = a3;
    v31 = 2112;
    v32 = a4;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "useDefaultFirmwareAssetSourceForProductGroup: %@ forPorductNumber: %@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    v25 = 138412546;
    v26 = a3;
    v27 = 2112;
    v28 = a4;
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager useDefaultFirmwareAssetSourceForProductGroup:andProductNumber:]", "CoreLocation: %s\n", v20);
    if (v20 != (char *)buf)
      free(v20);
  }
  v21 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v21)
  {
    v11 = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v13 = v23;
  if (v23)
  {
    v14 = (unint64_t *)&v23->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

- (void)fetchWhetherLocalFirmwareAssetIsInUseForProductGroup:(id)a3 andProductNumber:(id)a4
{
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  char *v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("productGroup"));
    if (a4)
      goto LABEL_3;
  }
  v18 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryFirmwareUpdateManager.mm"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("productNumber"));
LABEL_3:
  v33[0] = 0x1E2998868;
  v33[1] = 0x1E2998888;
  v34[0] = a3;
  v34[1] = a4;
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v34, (uint64_t)v33, 2);
  sub_18F5D5ED4(&off_1E2992C28, &v24, &v22);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990B10);
  v8 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = a3;
    v31 = 2112;
    v32 = a4;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "fetchWhetherLocalFirmwareAssetIsInUseForProductGroup: %@ forPorductNumber: %@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990B10);
    v25 = 138412546;
    v26 = a3;
    v27 = 2112;
    v28 = a4;
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryFirmwareUpdateManager fetchWhetherLocalFirmwareAssetIsInUseForProductGroup:andProductNumber:]", "CoreLocation: %s\n", v20);
    if (v20 != (char *)buf)
      free(v20);
  }
  v21 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v21)
  {
    v11 = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v13 = v23;
  if (v23)
  {
    v14 = (unint64_t *)&v23->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

- (CLFindMyAccessoryFirmwareUpdateDelegate)delegate
{
  return (CLFindMyAccessoryFirmwareUpdateDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  sub_18F61BBC8((uint64_t *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
