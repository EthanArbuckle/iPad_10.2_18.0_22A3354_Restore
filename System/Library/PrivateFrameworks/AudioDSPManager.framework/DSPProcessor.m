@implementation DSPProcessor

- (DSPProcessor)initWithHostDescription:(id)a3 hostCallback:(id)a4 systemConfiguration:(SystemConfiguration *)a5
{
  adm::utility *v9;
  id v10;
  DSPProcessor *v11;
  DSPProcessor *v12;
  DSPProcessor *v13;
  int v14;
  int var0;
  adm::graph::NodeManager *v16;
  uint64_t *value;
  uint64_t v18;
  HostDescription *v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  NSDictionary *p_hostDescription;
  NSObject *v24;
  adm::graph::GraphBuilder *v25;
  void **v26;
  id to;
  id location;
  objc_super v30;
  id from;
  uint8_t buf[8];
  id v33;
  uint8_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = (adm::utility *)a3;
  v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)DSPProcessor;
  v11 = -[DSPProcessor init](&v30, sel_init);
  v12 = v11;
  v13 = v11;
  if (!v11)
    goto LABEL_20;
  objc_storeStrong((id *)&v11->_hostCallback, a4);
  v13->_systemConfiguration.mContext.mOS = a5->mContext.mOS;
  std::string::operator=((std::string *)&v13->_systemConfiguration.mContext.mResourcePath, (const std::string *)&a5->mContext.mResourcePath);
  std::string::operator=((std::string *)&v12->_systemConfiguration.mContext.mResourcePath.__pn_.__r_.var0, (const std::string *)&a5->mContext.mResourcePath.__pn_.__r_.var0);
  v14 = *(_DWORD *)a5[1].mContext.mResourcePath.__pn_.__r_.__value_.var0.var0.__data_;
  v13->_anon_70[12] = a5[1].mContext.mResourcePath.__pn_.__r_.__value_.var0.var0.__data_[4];
  *(_DWORD *)&v13->_anon_70[8] = v14;
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::string,false> const&>((std::string *)&v12->_anon_70[16], (const std::string *)&a5[1].mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__size_);
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::string,false> const&>((std::string *)&v12->_anon_70[48], (const std::string *)&a5[2]);
  var0 = a5[2].mContext.mResourcePath.__pn_.__r_.var0;
  v13->_anon_70[84] = a5[2].mContext.mResourcePath.__pn_.__r_.var1;
  *(_DWORD *)&v13->_anon_70[80] = var0;
  std::string::operator=((std::string *)&v12->_anon_70[88], (const std::string *)&a5[2].mContext.mResourcePath.__pn_.var0);
  std::string::operator=((std::string *)&v12->_anon_70[112], (const std::string *)&a5[3].mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__size_);
  if (&v13->_systemConfiguration != a5)
  {
    *(_DWORD *)&v13->_anon_70[168] = *((_DWORD *)&a5[4].mContext.mResourcePath.__pn_.__r_.__value_.var0.var1 + 4);
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>,void *> *>>(&v12->_anon_70[136], (uint64_t *)a5[4].mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__data_);
  }
  v16 = (adm::graph::NodeManager *)operator new();
  adm::graph::NodeManager::NodeManager(v16, &v13->_systemConfiguration);
  value = (uint64_t *)v13->_nodeManager.__ptr_.__value_;
  v13->_nodeManager.__ptr_.__value_ = (NodeManager *)v16;
  if (value)
    std::default_delete<adm::graph::NodeManager>::operator()[abi:ne180100](value);
  objc_initWeak(&location, v13);
  objc_copyWeak(&to, &location);
  v18 = operator new();
  objc_moveWeak(&from, &to);
  v34 = 0;
  *(_QWORD *)buf = &off_25083E980;
  objc_moveWeak(&v33, &from);
  v34 = buf;
  objc_destroyWeak(&from);
  adm::CustomPropertyManager::CustomPropertyManager(v18, (uint64_t)buf);
  v20 = v34;
  if (v34 == buf)
  {
    v21 = 4;
    v20 = buf;
    goto LABEL_10;
  }
  if (v34)
  {
    v21 = 5;
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
  }
  v22 = (uint64_t)v13->_customPropertyManager.__ptr_.__value_;
  v13->_customPropertyManager.__ptr_.__value_ = (CustomPropertyManager *)v18;
  if (v22)
    std::default_delete<adm::CustomPropertyManager>::operator()[abi:ne180100](v22);
  p_hostDescription = (NSDictionary *)&v12->_hostDescription;
  if ((adm::utility::convertFromDictionary(v9, p_hostDescription, v19) & 1) == 0)
  {
    get_adm_log_object();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_236C84000, v24, OS_LOG_TYPE_ERROR, "Failed to convert the host description dictionary. Proceeding without it", buf, 2u);
    }

  }
  v25 = (adm::graph::GraphBuilder *)operator new();
  adm::graph::GraphBuilder::GraphBuilder(v25, &v13->_systemConfiguration, (const HostDescription *)p_hostDescription);
  v26 = (void **)v13->_graphBuilder.__ptr_.__value_;
  v13->_graphBuilder.__ptr_.__value_ = (GraphBuilder *)v25;
  if (v26)
    std::default_delete<adm::graph::GraphBuilder>::operator()[abi:ne180100](v26);
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
LABEL_20:
  v13->_hasRegisteredUIOrientation = 0;
  -[DSPProcessor dumpDiagnosticsWithNSObject:name:](v13, "dumpDiagnosticsWithNSObject:name:", v9, CFSTR("HostDescription"));

  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  -[DSPProcessor unregisterExternalNotification](self, "unregisterExternalNotification");
  get_adm_log_object();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236C84000, v3, OS_LOG_TYPE_DEFAULT, "DSPProcessor destroyed", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)DSPProcessor;
  -[DSPProcessor dealloc](&v4, sel_dealloc);
}

- (id)simulateConfigurationChange:(id)a3 error:(id *)a4
{
  -[DSPProcessor doNegotiateConfigurationChange:simulate:error:](self, "doNegotiateConfigurationChange:simulate:error:", a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4
{
  -[DSPProcessor doNegotiateConfigurationChange:simulate:error:](self, "doNegotiateConfigurationChange:simulate:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)doNegotiateConfigurationChange:(id)a3 simulate:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  adm::utility *v8;
  NSObject *v9;
  _BOOL4 v10;
  std::string *p_value;
  const __CFString *v12;
  std::string *v13;
  adm::ConfigurationChangeRequest *v14;
  int v15;
  uint64_t *v16;
  uint64_t *i;
  NSObject *v18;
  uint64_t *v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  optional<std::vector<adm::DeviceConfiguration>> *p_pendingDeviceConfigChanges;
  uint64_t v32;
  unint64_t v33;
  DeviceConfiguration *begin;
  unint64_t v35;
  unint64_t v36;
  std::string *v37;
  __int128 v38;
  DeviceConfiguration *end;
  __int128 *v40;
  __compressed_pair<adm::DeviceConfiguration *, std::allocator<adm::DeviceConfiguration>> *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  const adm::NegotiateResponse *v46;
  NSObject *v47;
  std::string *v48;
  const char *v49;
  std::string *v50;
  int v51;
  __compressed_pair<adm::DeviceConfiguration *, std::allocator<adm::DeviceConfiguration>> *p_end_cap;
  __int128 *v53;
  const void *v54;
  uint64_t v55;
  const void *v56;
  uint64_t v57;
  unsigned __int8 v58;
  __int128 v59;
  uint64_t v60;
  char v61;
  std::string value;
  void **v63;
  uint8_t v64[24];
  void *v65;
  void *v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  const __CFString *v73;
  ConfigurationChangeRequest buf;
  uint64_t v75;

  v6 = a4;
  v75 = *MEMORY[0x24BDAC8D0];
  v8 = (adm::utility *)a3;
  if (*((char *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&value, self->_hostDescription.mBundleID.__r_.__value_.var0.var1.__data_, self->_hostDescription.mBundleID.__r_.__value_.var0.var1.__size_);
  else
    value = (std::string)self->_hostDescription.mBundleID.__r_.__value_;
  get_adm_log_object();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      p_value = &value;
      if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_value = (std::string *)value.__r_.__value_.__r.__words[0];
      *(_DWORD *)&buf.mIsActivation = 136315138;
      *(_QWORD *)(&buf.mIsActivation + 4) = p_value;
      _os_log_impl(&dword_236C84000, v9, OS_LOG_TYPE_DEFAULT, ">>> SIMULATE [%s]", (uint8_t *)&buf, 0xCu);
    }
    v12 = CFSTR("SimulateConfigChange");
  }
  else
  {
    if (v10)
    {
      v13 = &value;
      if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v13 = (std::string *)value.__r_.__value_.__r.__words[0];
      *(_DWORD *)&buf.mIsActivation = 136315138;
      *(_QWORD *)(&buf.mIsActivation + 4) = v13;
      _os_log_impl(&dword_236C84000, v9, OS_LOG_TYPE_DEFAULT, ">>> NEGOTIATE [%s]", (uint8_t *)&buf, 0xCu);
    }
    v12 = CFSTR("NegotiateConfigChange");
  }

  -[DSPProcessor dumpDiagnosticsWithNSObject:name:](self, "dumpDiagnosticsWithNSObject:name:", v8, v12);
  buf.mIsActivation = 0;
  memset(&buf.mIOContextDescription.mSemantics.__tree_.__pair1_, 0, 17);
  buf.mIOContextDescription.mSemantics.__tree_.__begin_node_ = &buf.mIOContextDescription.mSemantics.__tree_.__pair1_;
  buf.mIOContextDescription.mRequestedInputFormat.__engaged_ = 0;
  buf.mIOContextDescription.mRequestedOutputFormat.var0.__null_state_ = 0;
  buf.mIOContextDescription.mRequestedOutputFormat.__engaged_ = 0;
  buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__null_state_ = 0;
  buf.mIOContextDescription.mRequestedOutputChannelLayout.__engaged_ = 0;
  buf.mIOContextDescription.mRequestedBufferFrameSize.var0.__null_state_ = 0;
  buf.mIOContextDescription.mRequestedBufferFrameSize.__engaged_ = 0;
  memset(&buf.mIOContextDescription.mStreamIDs, 0, 48);
  if (!adm::utility::convertFromDictionary(v8, (NSDictionary *)&buf, v14))
  {
    get_adm_log_object();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v64 = 0;
      _os_log_error_impl(&dword_236C84000, v21, OS_LOG_TYPE_ERROR, "Failed to convert the config change request dictionary", v64, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioDSPManagerErrorDomain"), 1969448551, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  logConfigChangeRequestBasicInfo((const adm::ConfigurationChangeRequest *)&buf);
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioDSPManagerErrorDomain"), 1969448551, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
    v23 = 0;
    *a5 = v22;
    goto LABEL_35;
  }
  adm::config_policy::getDeviceConfigurations((uint64_t)&v59, (adm::ConfigurationChangeRequest *)&buf, (uint64_t)&self->_activeDeviceConfigChanges);
  if (v61)
  {
    adm::config_policy::getIOContextConfiguration((uint64_t)&v54, (const adm::ConfigurationChangeRequest *)&buf);
    v15 = v58;
    if (v58)
    {
      if (v6)
        goto LABEL_75;
      v16 = (uint64_t *)*((_QWORD *)&v59 + 1);
      for (i = (uint64_t *)v59; i != v16; i += 9)
      {
        if (*((_BYTE *)i + 41))
        {
          get_adm_log_object();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v19 = i;
            if (*((char *)i + 23) < 0)
              v19 = (uint64_t *)*i;
            if (!*((_BYTE *)i + 41))
              std::__throw_bad_optional_access[abi:ne180100]();
            v20 = *((unsigned __int8 *)i + 40);
            *(_DWORD *)v64 = 136315394;
            *(_QWORD *)&v64[4] = v19;
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = v20;
            _os_log_debug_impl(&dword_236C84000, v18, OS_LOG_TYPE_DEBUG, "- ref request for device %s => %d", v64, 0x12u);
          }

        }
      }
      if (buf.mIsActivation)
      {
        p_pendingDeviceConfigChanges = &self->_pendingDeviceConfigChanges;
        if (!self->_pendingDeviceConfigChanges.__engaged_)
        {
          p_pendingDeviceConfigChanges->var0.__val_.__begin_ = 0;
          self->_pendingDeviceConfigChanges.var0.__val_.__end_ = 0;
          self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_.__value_ = 0;
          v38 = v59;
          *(_QWORD *)v64 = &self->_pendingDeviceConfigChanges;
          v64[8] = 0;
          if (*((_QWORD *)&v59 + 1) != (_QWORD)v59)
          {
            std::vector<adm::DeviceConfiguration>::__vallocate[abi:ne180100](&self->_pendingDeviceConfigChanges.var0.__val_.__begin_, 0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)&v59 + 1) - v59) >> 3));
            self->_pendingDeviceConfigChanges.var0.__val_.__end_ = (DeviceConfiguration *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<adm::DeviceConfiguration>,adm::DeviceConfiguration*,adm::DeviceConfiguration*,adm::DeviceConfiguration*>((uint64_t)&self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_, (__int128 *)v38, *((__int128 **)&v38 + 1), (std::string *)self->_pendingDeviceConfigChanges.var0.__val_.__end_);
          }
          self->_pendingDeviceConfigChanges.__engaged_ = 1;
          goto LABEL_74;
        }
        if (p_pendingDeviceConfigChanges != (optional<std::vector<adm::DeviceConfiguration>> *)&v59)
        {
          v53 = (__int128 *)*((_QWORD *)&v59 + 1);
          v32 = v59;
          v33 = 0x8E38E38E38E38E39 * ((uint64_t)(*((_QWORD *)&v59 + 1) - v59) >> 3);
          p_end_cap = &self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_;
          begin = self->_pendingDeviceConfigChanges.var0.__val_.__begin_;
          if (0x8E38E38E38E38E39 * ((self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_.__value_ - begin) >> 3) >= v33)
          {
            v51 = v15;
            end = self->_pendingDeviceConfigChanges.var0.__val_.__end_;
            if (0x8E38E38E38E38E39 * ((end - begin) >> 3) >= v33)
            {
              if ((_QWORD)v59 != *((_QWORD *)&v59 + 1))
              {
                do
                {
                  std::string::operator=((std::string *)begin, (const std::string *)v32);
                  v44 = *(_OWORD *)(v32 + 24);
                  v45 = *(_OWORD *)(v32 + 40);
                  *(_OWORD *)((char *)begin + 53) = *(_OWORD *)(v32 + 53);
                  *(_OWORD *)((char *)begin + 40) = v45;
                  *(_OWORD *)((char *)begin + 24) = v44;
                  begin = (DeviceConfiguration *)((char *)begin + 72);
                  v32 += 72;
                }
                while ((__int128 *)v32 != v53);
                end = self->_pendingDeviceConfigChanges.var0.__val_.__end_;
              }
              while (end != begin)
              {
                if (*((char *)end - 49) < 0)
                  operator delete(*((void **)end - 9));
                end = (DeviceConfiguration *)((char *)end - 72);
              }
              self->_pendingDeviceConfigChanges.var0.__val_.__end_ = begin;
              v15 = v51;
              goto LABEL_74;
            }
            v40 = (__int128 *)(v59 + 8 * ((end - begin) >> 3));
            if (end == begin)
            {
              v15 = v51;
              v41 = &self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_;
            }
            else
            {
              v15 = v51;
              v41 = &self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_;
              do
              {
                std::string::operator=((std::string *)begin, (const std::string *)v32);
                v42 = *(_OWORD *)(v32 + 24);
                v43 = *(_OWORD *)(v32 + 40);
                *(_OWORD *)((char *)begin + 53) = *(_OWORD *)(v32 + 53);
                *(_OWORD *)((char *)begin + 40) = v43;
                *(_OWORD *)((char *)begin + 24) = v42;
                v32 += 72;
                begin = (DeviceConfiguration *)((char *)begin + 72);
              }
              while ((__int128 *)v32 != v40);
              begin = self->_pendingDeviceConfigChanges.var0.__val_.__end_;
            }
            v37 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<adm::DeviceConfiguration>,adm::DeviceConfiguration*,adm::DeviceConfiguration*,adm::DeviceConfiguration*>((uint64_t)v41, v40, v53, (std::string *)begin);
          }
          else
          {
            std::vector<adm::DeviceConfiguration>::__vdeallocate((uint64_t *)&self->_pendingDeviceConfigChanges.var0.__val_);
            if (v33 > 0x38E38E38E38E38ELL)
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            v35 = 0x1C71C71C71C71C72
                * ((p_end_cap->__value_ - p_pendingDeviceConfigChanges->var0.__val_.__begin_) >> 3);
            if (v35 <= v33)
              v35 = v33;
            if (0x8E38E38E38E38E39
               * ((p_end_cap->__value_ - p_pendingDeviceConfigChanges->var0.__val_.__begin_) >> 3) >= 0x1C71C71C71C71C7)
              v36 = 0x38E38E38E38E38ELL;
            else
              v36 = v35;
            std::vector<adm::DeviceConfiguration>::__vallocate[abi:ne180100](&self->_pendingDeviceConfigChanges.var0.__val_.__begin_, v36);
            v37 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<adm::DeviceConfiguration>,adm::DeviceConfiguration*,adm::DeviceConfiguration*,adm::DeviceConfiguration*>((uint64_t)p_end_cap, (__int128 *)v32, v53, (std::string *)self->_pendingDeviceConfigChanges.var0.__val_.__end_);
          }
          self->_pendingDeviceConfigChanges.var0.__val_.__end_ = (DeviceConfiguration *)v37;
        }
      }
LABEL_74:
      std::optional<adm::ConfigurationChangeRequest>::operator=[abi:ne180100]<adm::ConfigurationChangeRequest,void>((uint64_t)&self->_pendingChangeRequest, (uint64_t)&buf);
LABEL_75:
      memset(v64, 0, sizeof(v64));
      std::vector<CA::StreamDescription>::__init_with_size[abi:ne180100]<CA::StreamDescription*,CA::StreamDescription*>(v64, v54, v55, 0xCCCCCCCCCCCCCCCDLL * ((v55 - (uint64_t)v54) >> 3));
      v65 = 0;
      v66 = 0;
      v67 = 0;
      std::vector<CA::StreamDescription>::__init_with_size[abi:ne180100]<CA::StreamDescription*,CA::StreamDescription*>(&v65, v56, v57, 0xCCCCCCCCCCCCCCCDLL * ((v57 - (uint64_t)v56) >> 3));
      v68 = v59;
      v69 = v60;
      v60 = 0;
      v59 = 0uLL;
      adm::utility::convertToDictionary((adm::utility *)v64, v46);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void **)&v68;
      std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100](&v63);
      if (v65)
      {
        v66 = v65;
        operator delete(v65);
      }
      if (*(_QWORD *)v64)
      {
        *(_QWORD *)&v64[8] = *(_QWORD *)v64;
        operator delete(*(void **)v64);
      }
      if (v6)
      {
        -[DSPProcessor dumpDiagnosticsWithNSObject:name:](self, "dumpDiagnosticsWithNSObject:name:", v23, CFSTR("SimulateResponse"));
        get_adm_log_object();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          goto LABEL_89;
        v48 = &value;
        if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v48 = (std::string *)value.__r_.__value_.__r.__words[0];
        *(_DWORD *)v64 = 136315138;
        *(_QWORD *)&v64[4] = v48;
        v49 = "<<< SIMULATE [%s]";
      }
      else
      {
        -[DSPProcessor dumpDiagnosticsWithNSObject:name:](self, "dumpDiagnosticsWithNSObject:name:", v23, CFSTR("NegotiateResponse"));
        get_adm_log_object();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          goto LABEL_89;
        v50 = &value;
        if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v50 = (std::string *)value.__r_.__value_.__r.__words[0];
        *(_DWORD *)v64 = 136315138;
        *(_QWORD *)&v64[4] = v50;
        v49 = "<<< NEGOTIATE [%s]";
      }
      _os_log_impl(&dword_236C84000, v47, OS_LOG_TYPE_DEFAULT, v49, v64, 0xCu);
LABEL_89:

      if (v15)
        caulk::__expected_detail::destroy<adm::IOContextConfiguration,(void *)0>((uint64_t)&v54);
      goto LABEL_91;
    }
    v28 = (void *)MEMORY[0x24BDD1540];
    v29 = (int)v54;
    v70 = *MEMORY[0x24BDD0FC8];
    v71 = CFSTR("ADM failed to determine IOContext configuration");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("AudioDSPManagerErrorDomain"), v29, v30);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = (int)v59;
    v72 = *MEMORY[0x24BDD0FC8];
    v73 = CFSTR("ADM failed to determine device configuration");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("AudioDSPManagerErrorDomain"), v26, v27);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = 0;
LABEL_91:
  if (v61)
  {
    *(_QWORD *)v64 = &v59;
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)v64);
  }
LABEL_35:
  *(_QWORD *)v64 = &buf.mDeviceDescriptions;
  std::vector<adm::DeviceDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)v64);
  *(_QWORD *)v64 = &buf.mIOContextDescription.mStreamIDs;
  std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)v64);
  if (buf.mIOContextDescription.mRequestedOutputChannelLayout.__engaged_
    && buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__val_.mStorage.__begin_)
  {
    buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__val_.mStorage.__end_ = buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__val_.mStorage.__begin_;
    operator delete(buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__val_.mStorage.__begin_);
  }
  std::__tree<std::string>::destroy((char *)buf.mIOContextDescription.mSemantics.__tree_.__pair1_.__value_.__left_);
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0)
    operator delete(value.__r_.__value_.__l.__data_);

  return v23;
}

- (BOOL)validateAdaptConfigurationChangeRequest:(const void *)a3
{
  _BOOL4 engaged;
  BOOL v6;
  BOOL v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v9;
  unsigned __int8 *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *end;
  unsigned __int8 *begin;
  unsigned __int8 *v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *p_pair1;
  unsigned __int8 *v20;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  NSObject *v26;
  const char *v27;
  uint8_t *v28;
  NSObject *v29;
  __int16 v30;
  uint8_t buf[16];
  __int16 v32;

  engaged = self->_pendingChangeRequest.__engaged_;
  if (*(_BYTE *)a3)
    v6 = !engaged;
  else
    v6 = 1;
  if (!v6)
  {
    if (self->_pendingChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair3_.__value_ != *((_QWORD *)a3 + 3))
      goto LABEL_48;
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)self->_pendingChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__begin_node_;
    p_pair1 = &self->_pendingChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair1_;
    if (begin_node != &self->_pendingChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair1_)
    {
      v20 = (unsigned __int8 *)*((_QWORD *)a3 + 1);
      while (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)&begin_node[4], v20 + 32))
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)begin_node[1].__value_.__left_;
        v22 = begin_node;
        if (left)
        {
          do
          {
            begin_node = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v22[2].__value_.__left_;
            v6 = begin_node->__value_.__left_ == v22;
            v22 = begin_node;
          }
          while (!v6);
        }
        v23 = (unsigned __int8 *)*((_QWORD *)v20 + 1);
        if (v23)
        {
          do
          {
            v24 = v23;
            v23 = *(unsigned __int8 **)v23;
          }
          while (v23);
        }
        else
        {
          do
          {
            v24 = (unsigned __int8 *)*((_QWORD *)v20 + 2);
            v6 = *(_QWORD *)v24 == (_QWORD)v20;
            v20 = v24;
          }
          while (!v6);
        }
        v20 = v24;
        if (begin_node == p_pair1)
      }
LABEL_48:
      get_adm_log_object();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v32 = 0;
        v27 = "Adapt semantics don't match Negotiated semantics";
        v28 = (uint8_t *)&v32;
LABEL_53:
        _os_log_error_impl(&dword_236C84000, v26, OS_LOG_TYPE_ERROR, v27, v28, 2u);
        goto LABEL_51;
      }
      goto LABEL_51;
    }
  }
  if (*(_BYTE *)a3)
    v7 = 1;
  else
    v7 = !engaged;
  if (!v7)
  if (self->_activeChangeRequest.__engaged_
    && self->_activeChangeRequest.var0.__null_state_ == *(unsigned __int8 *)a3
    && self->_activeChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair3_.__value_ == *((_QWORD *)a3 + 3))
  {
    v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)self->_activeChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__begin_node_;
    v9 = &self->_activeChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair1_;
    if (v8 == &self->_activeChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair1_)
    {
LABEL_28:
      end = (unsigned __int8 *)self->_activeChangeRequest.var0.__val_.mIOContextDescription.mStreamIDs.__end_;
      begin = (unsigned __int8 *)self->_activeChangeRequest.var0.__val_.mIOContextDescription.mStreamIDs.__begin_;
      v17 = (unsigned __int8 *)*((_QWORD *)a3 + 21);
      if (end - begin == *((_QWORD *)a3 + 22) - (_QWORD)v17)
      {
        while (begin != end)
        {
          if (!std::equal_to<std::string>::operator()[abi:ne180100](begin, v17))
            goto LABEL_50;
          begin += 24;
          v17 += 24;
        }
        get_adm_log_object();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_236C84000, v29, OS_LOG_TYPE_INFO, "warning: Adapt called without a Negotiate, but request is duplicate so allow for now", buf, 2u);
        }

      }
    }
    else
    {
      v10 = (unsigned __int8 *)*((_QWORD *)a3 + 1);
      while (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)&v8[4], v10 + 32))
      {
        v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v8[1].__value_.__left_;
        v12 = v8;
        if (v11)
        {
          do
          {
            v8 = v11;
            v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v11->__value_.__left_;
          }
          while (v11);
        }
        else
        {
          do
          {
            v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v12[2].__value_.__left_;
            v6 = v8->__value_.__left_ == v12;
            v12 = v8;
          }
          while (!v6);
        }
        v13 = (unsigned __int8 *)*((_QWORD *)v10 + 1);
        if (v13)
        {
          do
          {
            v14 = v13;
            v13 = *(unsigned __int8 **)v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            v14 = (unsigned __int8 *)*((_QWORD *)v10 + 2);
            v6 = *(_QWORD *)v14 == (_QWORD)v10;
            v10 = v14;
          }
          while (!v6);
        }
        v10 = v14;
        if (v8 == v9)
          goto LABEL_28;
      }
    }
  }
LABEL_50:
  get_adm_log_object();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v30 = 0;
    v27 = "Adapt called without a Negotiate";
    v28 = (uint8_t *)&v30;
    goto LABEL_53;
  }
LABEL_51:

  return 0;
}

- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5
{
  adm::utility *v8;
  NSObject *v9;
  std::string *p_value;
  adm::ConfigurationChangeRequest *v11;
  _QWORD *v12;
  uint64_t **v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  optional<adm::ConfigurationChangeRequest> *p_activeChangeRequest;
  DSPProcessor *v33;
  optional<std::vector<adm::DeviceConfiguration>> *p_pendingDeviceConfigChanges;
  DSPProcessor *v35;
  NSObject *v36;
  std::string *v37;
  adm::graph::DSPNode *v38;
  std::__shared_weak_count *v39;
  NSDictionary v40;
  char **v41;
  char *v42[2];
  char v43;
  char v44;
  char v45;
  char v46;
  void *__p;
  void *v48;
  char v49;
  char v50;
  char v51;
  _OWORD v52[3];
  uint64_t v53;
  char v54;
  std::string value;
  DSPProcessor *v56;
  uint8_t *v57;
  uint64_t v58;
  const __CFString *v59;
  uint8_t v60[8];
  _BYTE *v61;
  adm::graph::DSPNode **v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const __CFString *v69;
  _BYTE buf[72];
  uint64_t v71;
  int v72;
  char v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v56 = self;
  v8 = (adm::utility *)a3;
  if (*((char *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&value, self->_hostDescription.mBundleID.__r_.__value_.var0.var1.__data_, self->_hostDescription.mBundleID.__r_.__value_.var0.var1.__size_);
  else
    value = (std::string)self->_hostDescription.mBundleID.__r_.__value_;
  get_adm_log_object();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    p_value = &value;
    if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      p_value = (std::string *)value.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = p_value;
    _os_log_impl(&dword_236C84000, v9, OS_LOG_TYPE_DEFAULT, ">>> ADAPT [%s]", buf, 0xCu);
  }

  LOBYTE(v53) = 0;
  v54 = 0;
  -[DSPProcessor dumpDiagnosticsWithNSObject:name:](v56, "dumpDiagnosticsWithNSObject:name:", v8, CFSTR("AdaptConfigChange"));
  LOBYTE(v40.super.isa) = 0;
  v42[0] = 0;
  v42[1] = 0;
  v41 = v42;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  LOBYTE(__p) = 0;
  v49 = 0;
  v50 = 0;
  v51 = 0;
  memset(v52, 0, sizeof(v52));
  if (!adm::utility::convertFromDictionary(v8, &v40, v11))
  {
    get_adm_log_object();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_236C84000, v15, OS_LOG_TYPE_ERROR, "Failed to convert the config change request dictionary", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioDSPManagerErrorDomain"), 1969448551, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  logConfigChangeRequestBasicInfo((const adm::ConfigurationChangeRequest *)&v40);
  if (!-[DSPProcessor validateAdaptConfigurationChangeRequest:](v56, "validateAdaptConfigurationChangeRequest:", &v40))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioDSPManagerErrorDomain"), 1969448551, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v17 = 0;
    *a5 = v16;
    goto LABEL_22;
  }
  if (!LOBYTE(v40.super.isa))
  {
    get_adm_log_object();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236C84000, v19, OS_LOG_TYPE_DEFAULT, "Adapt to de-activation config change request", buf, 2u);
    }

    -[DSPProcessor unregisterExternalNotification](v56, "unregisterExternalNotification");
    goto LABEL_56;
  }
  adm::graph::GraphBuilder::buildGraph((adm::graph::GraphBuilder *)buf, (const adm::ConfigurationChangeRequest *)v56->_graphBuilder.__ptr_.__value_, (uint64_t)&v40);
  if (v73)
  {
    v38 = 0;
    v39 = 0;
    *(_QWORD *)v60 = &v56;
    v61 = buf;
    v62 = &v38;
    if (v72 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v57 = v60;
    ((void (*)(uint8_t **, uint64_t *))off_25083E958[v72])(&v57, &v71);
    if (!v38)
    {
      get_adm_log_object();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v60 = 0;
        _os_log_error_impl(&dword_236C84000, v25, OS_LOG_TYPE_ERROR, "DSP node is null", v60, 2u);
      }

      v26 = (void *)MEMORY[0x24BDD1540];
      v58 = *MEMORY[0x24BDD0FC8];
      v59 = CFSTR("ADM failed to create DSP node");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("AudioDSPManagerErrorDomain"), 1970170734, v27);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v24 = 1;
      goto LABEL_47;
    }
    adm::CustomPropertyManager::attachToNode((uint64_t)v56->_customPropertyManager.__ptr_.__value_, &v38, (uint64_t)&v41);
    adm::graph::Node::createHandlers((adm::graph::Node *)v60, (uint64_t)v38);
    std::__function::__value_func<void ()>::operator=[abi:ne180100]((_QWORD *)a4 + 12, (uint64_t)&v63);
    v13 = (uint64_t **)((char *)a4 + 56);
    v12 = (_QWORD *)*((_QWORD *)a4 + 7);
    *((_QWORD *)a4 + 7) = 0;
    if (v12 == (_QWORD *)((char *)a4 + 32))
    {
      v14 = 4;
      v12 = (char *)a4 + 32;
    }
    else
    {
      if (!v12)
        goto LABEL_39;
      v14 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v14))();
LABEL_39:
    if (v65)
    {
      if (v65 == &v64)
      {
        *v13 = (uint64_t *)((char *)a4 + 32);
        (*(void (**)(void))(v64 + 24))();
        goto LABEL_44;
      }
      *v13 = v65;
      v13 = &v65;
    }
    *v13 = 0;
LABEL_44:
    std::__function::__value_func<void ()>::operator=[abi:ne180100]((_QWORD *)a4 + 16, (uint64_t)&v66);
    if (v67)
    {
      v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v67 + 48))(v67);
      v54 = 1;
      v53 = v28;
    }
    adm::graph::NodeHandlers::~NodeHandlers((adm::graph::NodeHandlers *)v60);
    -[DSPProcessor registerExternalNotification:](v56, "registerExternalNotification:", &v40);
    v24 = 0;
LABEL_47:
    v29 = v39;
    if (v39)
    {
      p_shared_owners = (unint64_t *)&v39->__shared_owners_;
      do
        v31 = __ldaxr(p_shared_owners);
      while (__stlxr(v31 - 1, p_shared_owners));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    goto LABEL_52;
  }
  v20 = (void *)MEMORY[0x24BDD1540];
  v21 = *(int *)buf;
  v68 = *MEMORY[0x24BDD0FC8];
  v69 = CFSTR("ADM failed to build graph");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("AudioDSPManagerErrorDomain"), v21, v22);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  get_adm_log_object();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v60 = 0;
    _os_log_error_impl(&dword_236C84000, v23, OS_LOG_TYPE_ERROR, "ADM failed to build graph", v60, 2u);
  }

  v24 = 1;
LABEL_52:
  if (v73)
    caulk::__expected_detail::destroy<adm::graph::GraphDescription,(void *)0>((uint64_t)buf);
  if (v24)
  {
    v17 = 0;
    goto LABEL_22;
  }
LABEL_56:
  p_activeChangeRequest = &v56->_activeChangeRequest;
  if (LOBYTE(v40.super.isa))
  {
    std::optional<adm::ConfigurationChangeRequest>::operator=[abi:ne180100]<adm::ConfigurationChangeRequest,void>((uint64_t)p_activeChangeRequest, (uint64_t)&v40);
    v33 = v56;
    p_pendingDeviceConfigChanges = &v56->_pendingDeviceConfigChanges;
    if (v56->_activeDeviceConfigChanges.__engaged_ == v56->_pendingDeviceConfigChanges.__engaged_)
    {
      if (v56->_activeDeviceConfigChanges.__engaged_)
      {
        std::vector<adm::DeviceConfiguration>::__vdeallocate((uint64_t *)&v56->_activeDeviceConfigChanges.var0.__val_);
        *(_OWORD *)&p_pendingDeviceConfigChanges[1].var0.__null_state_ = *(_OWORD *)&p_pendingDeviceConfigChanges->var0.__null_state_;
        v33->_activeDeviceConfigChanges.var0.__val_.__end_cap_.__value_ = v33->_pendingDeviceConfigChanges.var0.__val_.__end_cap_.__value_;
        p_pendingDeviceConfigChanges->var0.__val_.__end_ = 0;
        p_pendingDeviceConfigChanges->var0.__val_.__end_cap_.__value_ = 0;
        p_pendingDeviceConfigChanges->var0.__val_.__begin_ = 0;
      }
      goto LABEL_66;
    }
    if (!v56->_activeDeviceConfigChanges.__engaged_)
    {
      *(_OWORD *)&v56->_activeDeviceConfigChanges.var0.__null_state_ = *(_OWORD *)&v56->_pendingDeviceConfigChanges.var0.__null_state_;
      v33->_activeDeviceConfigChanges.var0.__val_.__end_cap_.__value_ = v33->_pendingDeviceConfigChanges.var0.__val_.__end_cap_.__value_;
      p_pendingDeviceConfigChanges->var0.__val_.__end_ = 0;
      p_pendingDeviceConfigChanges->var0.__val_.__end_cap_.__value_ = 0;
      p_pendingDeviceConfigChanges->var0.__val_.__begin_ = 0;
      v33->_activeDeviceConfigChanges.__engaged_ = 1;
      goto LABEL_66;
    }
    *(_QWORD *)buf = &v56->_activeDeviceConfigChanges;
    goto LABEL_64;
  }
  std::__optional_destruct_base<adm::ConfigurationChangeRequest,false>::reset[abi:ne180100]((uint64_t)p_activeChangeRequest);
  v33 = v56;
  if (v56->_activeDeviceConfigChanges.__engaged_)
  {
    *(_QWORD *)buf = &v56->_activeDeviceConfigChanges;
LABEL_64:
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    v33->_activeDeviceConfigChanges.__engaged_ = 0;
  }
LABEL_66:
  std::__optional_destruct_base<adm::ConfigurationChangeRequest,false>::reset[abi:ne180100]((uint64_t)&v56->_pendingChangeRequest);
  v35 = v56;
  if (v56->_pendingDeviceConfigChanges.__engaged_)
  {
    *(_QWORD *)buf = &v56->_pendingDeviceConfigChanges;
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    v35->_pendingDeviceConfigChanges.__engaged_ = 0;
  }
  adm::utility::convertToDictionary((uint64_t)&v53);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPProcessor dumpDiagnosticsWithNSObject:name:](v56, "dumpDiagnosticsWithNSObject:name:", v17, CFSTR("AdaptResponse"));
  get_adm_log_object();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = &value;
    if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v37 = (std::string *)value.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v37;
    _os_log_impl(&dword_236C84000, v36, OS_LOG_TYPE_DEFAULT, "<<< ADAPT [%s]", buf, 0xCu);
  }

LABEL_22:
  *(_QWORD *)buf = (char *)&v52[1] + 8;
  std::vector<adm::DeviceDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = v52;
  std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  if (v49 && __p)
  {
    v48 = __p;
    operator delete(__p);
  }
  std::__tree<std::string>::destroy(v42[0]);
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0)
    operator delete(value.__r_.__value_.__l.__data_);

  return v17;
}

- (id)getHostedDSPPropertyInfoArray
{
  id v2;
  void *v3;
  id v5;

  adm::CustomPropertyManager::getCustomPropertyList((adm::CustomPropertyManager *)&v5);
  v2 = v5;
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3;
}

- (BOOL)hasHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3
{
  uint64_t v3;
  BOOL result;
  int v5;
  BOOL v6;
  char *v7;
  int v8;
  BOOL v9;
  int v10;

  v3 = 0;
  result = 1;
  while (1)
  {
    if (a3.mSelector == 707406378
        ? (v6 = v5 == a3.mSelector)
        : (v6 = 1),
          v6))
    {
      if (a3.mScope == 707406378
        || ((v8 = *((_DWORD *)v7 + 1), v8 != 707406378) ? (v9 = v8 == a3.mScope) : (v9 = 1), v9))
      {
        if (a3.mElement == -1)
          break;
        v10 = *((_DWORD *)v7 + 2);
        if (v10 == -1 || v10 == a3.mElement)
          break;
      }
    }
    v3 += 56;
    if (v3 == 168)
      return 0;
  }
  return result;
}

- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 error:(id *)a5
{
  return -[DSPProcessor setHostedDSPPropertyAtAddress:withData:withQualifier:error:](self, "setHostedDSPPropertyAtAddress:withData:withQualifier:error:", *(_QWORD *)&a3.mSelector, a3.mElement, a4, 0, a5);
}

- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 withQualifier:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  CustomPropertyManager *value;
  id v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  CFTypeRef cf;
  CFTypeRef v18;
  AudioObjectPropertyAddress v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  value = self->_customPropertyManager.__ptr_.__value_;
  v11 = v8;
  v12 = v11;
  if (v11)
    CFRetain(v11);
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&v18, v12);

  v13 = v9;
  v14 = v13;
  if (v13)
    CFRetain(v13);
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&cf, v14);

  v15 = adm::CustomPropertyManager::setCustomProperty((uint64_t)value, &v19, (CFDataRef *)&v18, cf);
  if (cf)
    CFRelease(cf);
  if (v18)
    CFRelease(v18);

  return v15;
}

- (id)getHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withQualifierData:(id)a4
{
  id v5;
  CustomPropertyManager *value;
  id v7;
  void *v8;
  id v9;
  void *v10;
  CFTypeRef cf;
  id v13;
  AudioObjectPropertyAddress v14;

  v14 = a3;
  v5 = a4;
  value = self->_customPropertyManager.__ptr_.__value_;
  v7 = v5;
  v8 = v7;
  if (v7)
    CFRetain(v7);
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&cf, v8);

  adm::CustomPropertyManager::getCustomProperty((applesauce::CF::DataRef *)&v13, (uint64_t)value, &v14, cf);
  v9 = v13;
  v10 = v9;
  if (v9)
    CFRelease(v9);
  if (cf)
    CFRelease(cf);

  return v10;
}

- (void)registerExternalNotification:(const void *)a3
{
  char *v5;
  char *v6;
  int v7;
  NSObject *v8;
  id v9;
  void *__p[2];
  char v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(__p, "isolated audio muted talker detection");
  v5 = (char *)std::__tree<std::string>::find<std::string>((uint64_t)a3 + 8, __p);
  v6 = (char *)a3 + 16;
  if (v11 < 0)
    operator delete(__p[0]);
  if (v6 != v5)
  {
    objc_initWeak(__p, self);
    objc_copyWeak(&v9, __p);
    v7 = CARegisterUIOrientation();
    if (v7)
    {
      get_adm_log_object();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v13 = v7;
        _os_log_error_impl(&dword_236C84000, v8, OS_LOG_TYPE_ERROR, "Failed to register UIOrientation with error %d", buf, 8u);
      }
    }
    else
    {
      self->_hasRegisteredUIOrientation = 1;
      get_adm_log_object();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236C84000, v8, OS_LOG_TYPE_DEFAULT, "Succeeded in registering UIOrientation notification", buf, 2u);
      }
    }

    objc_destroyWeak(&v9);
    objc_destroyWeak(__p);
  }
}

- (void)unregisterExternalNotification
{
  int v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_hasRegisteredUIOrientation)
  {
    v3 = CAUnregisterUIOrientation();
    if (v3)
    {
      v4 = v3;
      get_adm_log_object();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_error_impl(&dword_236C84000, v5, OS_LOG_TYPE_ERROR, "Failed to unregister UIOrientation with error %d", (uint8_t *)v6, 8u);
      }
    }
    else
    {
      self->_hasRegisteredUIOrientation = 0;
      get_adm_log_object();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v6[0]) = 0;
        _os_log_impl(&dword_236C84000, v5, OS_LOG_TYPE_DEFAULT, "Succeeded in unregistering UIOrientation notification", (uint8_t *)v6, 2u);
      }
    }

  }
}

- (void)dumpDiagnosticsWithNSObject:(id)a3 name:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  HostDescription *p_hostDescription;
  void *v10;
  int *p_var0;
  void *v12;
  objc_object *v13;
  NSString *v14;
  adm::utility *v15;
  adm::utility *v16;

  v16 = (adm::utility *)a3;
  v6 = a4;
  if ((v7 & 1) == 0)
  {
    if ((_DWORD)v15)
    {
      -[DSPProcessor dumpDiagnosticsWithNSObject:name:]::isDebugDumpEnabled = adm::utility::readDefaultsDebugDumpEnablement(v15);
    }
  }
  if (-[DSPProcessor dumpDiagnosticsWithNSObject:name:]::isDebugDumpEnabled)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    p_hostDescription = &self->_hostDescription;
    if (*((char *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 23) < 0)
      p_hostDescription = (HostDescription *)p_hostDescription->mBundleID.__r_.__value_.var0.var1.__data_;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_hostDescription);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    p_var0 = &self->_hostDescription.mBundleID.__r_.var0;
    if ((char)self->_anon_30[7] < 0)
      p_var0 = *(int **)p_var0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_var0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@(%@_%@)"), v6, v10, v12);
    v13 = (objc_object *)objc_claimAutoreleasedReturnValue();

    adm::utility::writeNSObjectToDisk(v16, v13, v14);
  }

}

- (void).cxx_destruct
{
  CustomPropertyManager *value;
  uint64_t *v4;
  void **v5;
  optional<std::vector<adm::DeviceConfiguration>> *p_activeDeviceConfigChanges;

  std::__optional_destruct_base<adm::ConfigurationChangeRequest,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_activeChangeRequest);
  std::__optional_destruct_base<adm::ConfigurationChangeRequest,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_pendingChangeRequest);
  if (self->_activeDeviceConfigChanges.__engaged_)
  {
    p_activeDeviceConfigChanges = &self->_activeDeviceConfigChanges;
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_activeDeviceConfigChanges);
  }
  if (self->_pendingDeviceConfigChanges.__engaged_)
  {
    p_activeDeviceConfigChanges = &self->_pendingDeviceConfigChanges;
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_activeDeviceConfigChanges);
  }
  value = self->_customPropertyManager.__ptr_.__value_;
  self->_customPropertyManager.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<adm::CustomPropertyManager>::operator()[abi:ne180100]((uint64_t)value);
  v4 = (uint64_t *)self->_nodeManager.__ptr_.__value_;
  self->_nodeManager.__ptr_.__value_ = 0;
  if (v4)
    std::default_delete<adm::graph::NodeManager>::operator()[abi:ne180100](v4);
  v5 = (void **)self->_graphBuilder.__ptr_.__value_;
  self->_graphBuilder.__ptr_.__value_ = 0;
  if (v5)
    std::default_delete<adm::graph::GraphBuilder>::operator()[abi:ne180100](v5);
  adm::SystemConfiguration::~SystemConfiguration((void **)&self->_systemConfiguration);
  objc_storeStrong((id *)&self->_hostCallback, 0);
  if ((char)self->_anon_30[7] < 0)
    operator delete(*(void **)&self->_hostDescription.mBundleID.__r_.var0);
  if (*((char *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_hostDescription.mBundleID.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  self->_systemConfiguration.mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__data_ = 0;
  *((_OWORD *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 1) = 0u;
  *(_OWORD *)&self->_hostDescription.mBundleID.var0 = 0u;
  *(_OWORD *)self->_hostDescription.mBundleID.__r_.__value_.var0.var0.__data_ = 0u;
  self->_systemConfiguration.mContext.mOS = 0;
  *(_OWORD *)&self->_systemConfiguration.mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__size_ = 0uLL;
  std::__fs::filesystem::path::path[abi:ne180100]<char [24],void>((std::string *)&self->_systemConfiguration.mContext.mResourcePath.__pn_.__r_.var0, (std::string *)"/Library/Audio/Tunings/");
  self->_anon_70[8] = 0;
  self->_anon_70[12] = 0;
  self->_anon_70[16] = 0;
  self->_anon_70[40] = 0;
  self->_anon_70[48] = 0;
  self->_anon_70[72] = 0;
  self->_anon_70[80] = 0;
  self->_anon_70[84] = 0;
  *(_OWORD *)&self->_anon_70[104] = 0u;
  *(_OWORD *)&self->_anon_70[120] = 0u;
  *(_OWORD *)&self->_anon_70[136] = 0u;
  *(_OWORD *)&self->_anon_70[88] = 0u;
  *(_OWORD *)&self->_anon_70[152] = 0u;
  *(_DWORD *)&self->_anon_70[168] = 1065353216;
  self->_pendingDeviceConfigChanges.__engaged_ = 0;
  self->_activeDeviceConfigChanges.var0.__null_state_ = 0;
  self->_activeDeviceConfigChanges.__engaged_ = 0;
  self->_pendingChangeRequest.var0.__null_state_ = 0;
  self->_pendingChangeRequest.__engaged_ = 0;
  self->_activeChangeRequest.var0.__null_state_ = 0;
  self->_activeChangeRequest.__engaged_ = 0;
  self->_graphBuilder.__ptr_.__value_ = 0;
  self->_nodeManager.__ptr_.__value_ = 0;
  self->_pendingDeviceConfigChanges.var0.__null_state_ = 0;
  self->_customPropertyManager.__ptr_.__value_ = 0;
  return self;
}

void __45__DSPProcessor_registerExternalNotification___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    get_adm_log_object();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v9 = a2;
      _os_log_debug_impl(&dword_236C84000, v4, OS_LOG_TYPE_DEBUG, "UIOrientation notification received, orientation = %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v7, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    objc_msgSend(WeakRetained, "setHostedDSPPropertyAtAddress:withData:withQualifier:error:", 0x676C6F6255494F52, 0, v5, 0, &v6);

  }
}

- (uint64_t)initWithHostDescription:hostCallback:systemConfiguration:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z73-[DSPProcessor initWithHostDescription:hostCallback:systemConfiguration:]E3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)initWithHostDescription:hostCallback:systemConfiguration:
{
}

- (id)initWithHostDescription:hostCallback:systemConfiguration:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_25083E980;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
