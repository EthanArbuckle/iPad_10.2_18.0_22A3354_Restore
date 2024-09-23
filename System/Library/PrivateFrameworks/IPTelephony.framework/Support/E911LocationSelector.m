@implementation E911LocationSelector

- (E911LocationSelector)initWithDelegate:(ImsLocationSelectorDelegate *)a3 sipStack:(shared_ptr<SipStack>)a4 updateMode:(int)a5 dispatchQueue:(dispatch_queue_s *)a6
{
  uint64_t v6;
  int var1;
  SipStack *var0;
  E911LocationSelector *v10;
  E911LocationSelector *v11;
  ImsPrefs *v12;
  void **PIDFConfidenceKey;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSBundle *bundle;
  uint64_t v18;
  CLEmergencyLocationSelectorConfig *config;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  unsigned int v23;
  ImsPrefs *v24;
  void **FastEmergencyLocationEnabledKey;
  void *v26;
  double v27;
  double v28;
  unint64_t *v29;
  unint64_t v30;
  ImsPrefs *v31;
  void **EmergencyLocationUpdateTimeSecondsKey;
  void **v33;
  void *v34;
  int v35;
  ImsPrefs *v36;
  void *EmergencyLocationUpdateTimeMinSecondsKey;
  void *v38;
  int v39;
  uint64_t v40;
  CLEmergencyLocationSelector *location;
  SipStack *v43;
  std::__shared_weak_count *v44;
  objc_super v45;

  v6 = *(_QWORD *)&a5;
  var1 = (int)a4.var1;
  var0 = a4.var0;
  v45.receiver = self;
  v45.super_class = (Class)E911LocationSelector;
  v10 = -[E911LocationSelector init](&v45, sel_init, a3, a4.var0, a4.var1, *(_QWORD *)&a5, a6);
  v11 = v10;
  if (!v10)
    return v11;
  v10->_delegate = a3;
  v12 = (ImsPrefs *)SipStack::prefs(*(SipStack **)var0);
  PIDFConfidenceKey = (void **)ImsPrefs::getPIDFConfidenceKey(v12);
  v14 = ImsPrefs::prefWithKey(v12, PIDFConfidenceKey);
  if (v14)
    v15 = (*(uint64_t (**)(void *))(*(_QWORD *)v14 + 56))(v14);
  else
    v15 = *((_DWORD *)PIDFConfidenceKey + 15);
  v11->_confidence = v15;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/IPTelephonyEmergency.bundle"));
  v16 = objc_claimAutoreleasedReturnValue();
  bundle = v11->_bundle;
  v11->_bundle = (NSBundle *)v16;

  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E380]), "initForFeature:withUpdatesEnabled:", 0, var1 != 0);
  config = v11->_config;
  v11->_config = (CLEmergencyLocationSelectorConfig *)v18;

  -[CLEmergencyLocationSelectorConfig setFirstLocationEarlyReturnEnabled:](v11->_config, "setFirstLocationEarlyReturnEnabled:", 1);
  v20 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v43 = *(SipStack **)var0;
  v44 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldxr(p_shared_owners);
    while (__stxr(v22 + 1, p_shared_owners));
  }
  v23 = BambiEmergencyCallHandler::preferredLocationTimeout(&v43);
  v24 = (ImsPrefs *)SipStack::prefs(*(SipStack **)var0);
  FastEmergencyLocationEnabledKey = (void **)ImsPrefs::getFastEmergencyLocationEnabledKey(v24);
  v26 = ImsPrefs::prefWithKey(v24, FastEmergencyLocationEnabledKey);
  if (v26)
  {
    if (!(*(unsigned int (**)(void *))(*(_QWORD *)v26 + 40))(v26))
    {
LABEL_10:
      v27 = 0.95;
      if (var1)
        v27 = 0.5;
      v28 = v27 * (double)(v23 - 1);
      goto LABEL_15;
    }
  }
  else if (!*((_BYTE *)FastEmergencyLocationEnabledKey + 57))
  {
    goto LABEL_10;
  }
  v28 = (double)v23;
LABEL_15:
  -[CLEmergencyLocationSelectorConfig setFirstLocationTimeout:](v11->_config, "setFirstLocationTimeout:", v28, v43, v44);
  if (v20)
  {
    v29 = (unint64_t *)&v20->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v31 = (ImsPrefs *)SipStack::prefs(*(SipStack **)var0);
  if (var1 == 1)
    EmergencyLocationUpdateTimeSecondsKey = (void **)ImsPrefs::getEmergencyLocationUpdateTimeSecondsKey(v31);
  else
    EmergencyLocationUpdateTimeSecondsKey = (void **)ImsPrefs::getEmergencyLocationUpdateTimeSMSFixedKey(v31);
  v33 = EmergencyLocationUpdateTimeSecondsKey;
  v34 = ImsPrefs::prefWithKey(v31, EmergencyLocationUpdateTimeSecondsKey);
  if (v34)
    v35 = (*(uint64_t (**)(void *))(*(_QWORD *)v34 + 56))(v34);
  else
    v35 = *((_DWORD *)v33 + 15);
  -[CLEmergencyLocationSelectorConfig setLocationUpdateTimeout:](v11->_config, "setLocationUpdateTimeout:", (double)v35);
  if (var1 == 1)
  {
    v36 = (ImsPrefs *)SipStack::prefs(*(SipStack **)var0);
    EmergencyLocationUpdateTimeMinSecondsKey = ImsPrefs::getEmergencyLocationUpdateTimeMinSecondsKey(v36);
    v38 = ImsPrefs::prefWithKey(v36, (void **)EmergencyLocationUpdateTimeMinSecondsKey);
    if (v38)
      v39 = (*(uint64_t (**)(void *))(*(_QWORD *)v38 + 56))(v38);
    else
      v39 = *((_DWORD *)EmergencyLocationUpdateTimeMinSecondsKey + 15);
  }
  else
  {
    v39 = 0;
  }
  -[CLEmergencyLocationSelectorConfig setLocationUpdateMinDelay:](v11->_config, "setLocationUpdateMinDelay:", (double)v39);
  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E378]), "initWithConfig:bundle:delegate:queue:", v11->_config, v11->_bundle, v11, v6);
  location = v11->_location;
  v11->_location = (CLEmergencyLocationSelector *)v40;

  return v11;
}

- (void)dealloc
{
  NSBundle *bundle;
  CLEmergencyLocationSelectorConfig *config;
  CLEmergencyLocationSelector *location;
  CLEmergencyLocationSelector *v6;
  objc_super v7;

  bundle = self->_bundle;
  if (bundle)
  {
    self->_bundle = 0;

  }
  config = self->_config;
  if (config)
  {
    self->_config = 0;

  }
  self->_delegate = 0;
  location = self->_location;
  if (location)
  {
    -[CLEmergencyLocationSelector stopSession](location, "stopSession");
    v6 = self->_location;
    self->_location = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)E911LocationSelector;
  -[E911LocationSelector dealloc](&v7, sel_dealloc);
}

- (void)locationSelectorDidSelectLocation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  ImsLocationSelectorDelegate *delegate;
  _BYTE v24[48];
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  std::string v33;
  std::string v34;
  void *v35[2];
  char v36;
  double v37;
  uint64_t v38;
  void *__p[2];
  char v40;
  std::string v41;
  __int128 v42;
  __int128 v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v4 = a3;
  v42 = 0u;
  v43 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v44 = 3000.0;
  v51 = 0;
  std::string::basic_string[abi:ne180100]<0>(&v41, "ims.location");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v5 = ImsLogger::debug(ims::_logger, (uint64_t)&v41, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v5 + 8), (uint64_t)"updated location available", 26);
  *(_BYTE *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v5 + 17) = 0;
  if (v40 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if (!v4)
      goto LABEL_38;
  }
  else if (!v4)
  {
    goto LABEL_38;
  }
  objc_msgSend(v4, "coordinate");
  *(_QWORD *)&v42 = v6;
  objc_msgSend(v4, "coordinate");
  *((_QWORD *)&v42 + 1) = v7;
  objc_msgSend(v4, "horizontalAccuracy");
  *(_QWORD *)&v43 = v8;
  objc_msgSend(v4, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  *(_QWORD *)&v45 = v10;

  objc_msgSend(v4, "ellipsoidalAltitude");
  v12 = v11;
  v38 = v11;
  objc_msgSend(v4, "verticalAccuracy");
  v14 = v13;
  v37 = v13;
  memset(&v41, 0, sizeof(v41));
  std::string::basic_string[abi:ne180100]<0>(&v41, "invalid");
  std::string::basic_string[abi:ne180100]<0>(__p, "ims.location");
  std::string::basic_string[abi:ne180100]<0>(v35, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v15 = ImsLogger::debug(ims::_logger, (uint64_t)__p, (uint64_t)v35);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v15 + 8), (uint64_t)"selected valid location ", 24);
  *(_BYTE *)(v15 + 17) = 0;
  std::ostream::operator<<();
  *(_BYTE *)(v15 + 17) = 0;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v15 + 8), (uint64_t)", ", 2);
  *(_BYTE *)(v15 + 17) = 0;
  std::ostream::operator<<();
  *(_BYTE *)(v15 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v15 + 64))(v15, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v15 + 17) = 0;
  if (v36 < 0)
    operator delete(v35[0]);
  if (v40 < 0)
    operator delete(__p[0]);
  if (v14 <= 0.0)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "ims.location");
    std::string::basic_string[abi:ne180100]<0>(v35, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v16 = ImsLogger::warn(ims::_logger, (uint64_t)__p, (uint64_t)v35);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)"altitude is ", 12);
    *(_BYTE *)(v16 + 17) = 0;
    ims::detail::to_string_impl<double,std::integral_constant<BOOL,false>>::operator()(&v34);
    (*(void (**)(uint64_t, std::string *))(*(_QWORD *)v16 + 32))(v16, &v34);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v16 + 8), (uint64_t)"; altitude uncertainty is ",
      26);
    *(_BYTE *)(v16 + 17) = 0;
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v33, v41.__r_.__value_.__l.__data_, v41.__r_.__value_.__l.__size_);
    else
      v33 = v41;
    (*(void (**)(uint64_t, std::string *))(*(_QWORD *)v16 + 32))(v16, &v33);
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v16 + 64))(v16, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v16 + 17) = 0;
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v33.__r_.__value_.__l.__data_);
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__r_.__value_.__l.__data_);
    if (v36 < 0)
      operator delete(v35[0]);
    if (v40 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *((_QWORD *)&v43 + 1) = v12;
    v44 = v14;
  }
  v34.__r_.__value_.__r.__words[0] = 0x3FF0000000000000;
  v33.__r_.__value_.__r.__words[0] = 0x3FF0000000000000;
  if (CLGetUncertaintyScaleFactors())
  {
    *(double *)&v43 = *(double *)&v34.__r_.__value_.__l.__data_ * *(double *)&v43;
    v44 = *(double *)&v33.__r_.__value_.__l.__data_ * v44;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "ims.location");
  std::string::basic_string[abi:ne180100]<0>(v35, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v17 = ImsLogger::debug(ims::_logger, (uint64_t)__p, (uint64_t)v35);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v17 + 8), (uint64_t)"timestamp is : ", 15);
  *(_BYTE *)(v17 + 17) = 0;
  std::ostream::operator<<();
  *(_BYTE *)(v17 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v17 + 64))(v17, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v17 + 17) = 0;
  if (v36 < 0)
    operator delete(v35[0]);
  if (v40 < 0)
    operator delete(__p[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "ims.location");
  std::string::basic_string[abi:ne180100]<0>(v35, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v18 = ImsLogger::debug(ims::_logger, (uint64_t)__p, (uint64_t)v35);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v18 + 8), (uint64_t)"absolute timestamp is : ", 24);
  *(_BYTE *)(v18 + 17) = 0;
  objc_msgSend(v4, "trustedTimestamp");
  std::ostream::operator<<();
  *(_BYTE *)(v18 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v18 + 64))(v18, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v18 + 17) = 0;
  if (v36 < 0)
    operator delete(v35[0]);
  if (v40 < 0)
    operator delete(__p[0]);
  objc_msgSend(v4, "trustedTimestamp");
  if (v19 > 0.0)
  {
    v20 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "trustedTimestamp");
    objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSince1970");
    *(_QWORD *)&v45 = v22;

  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v41.__r_.__value_.__l.__data_);
LABEL_38:
  delegate = self->_delegate;
  if (delegate)
  {
    ims::LocationInfo::LocationInfo((ims::LocationInfo *)v24, (const ims::LocationInfo *)&v42);
    (*((void (**)(ImsLocationSelectorDelegate *, _BYTE *))delegate->var0 + 2))(delegate, v24);
    if (v32 < 0)
      operator delete(v31);
    if (v30 < 0)
      operator delete(v29);
    if (v28 < 0)
      operator delete(v27);
    if (v26 < 0)
      operator delete(v25);
  }
  if (SHIBYTE(v51) < 0)
    operator delete((void *)v50);
  if (SHIBYTE(v49) < 0)
    operator delete(*((void **)&v48 + 1));
  if (SBYTE7(v48) < 0)
    operator delete((void *)v47);
  if (SHIBYTE(v46) < 0)
    operator delete(*((void **)&v45 + 1));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
