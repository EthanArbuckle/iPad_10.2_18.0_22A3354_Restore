@implementation AudioDSPUplinkSpeechMixer

- (AudioStreamBasicDescription)sampleRate
{
  __int128 v3;

  v3 = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[1].mSampleRate;
  return self;
}

- (unsigned)maximumFramesPerSlice
{
  return self->_settings.maximumFramesPerSlice;
}

- (AudioDSPUplinkSpeechMixer)initWithSettings:(AudioDSPUplinkSpeechMixerSettings *)a3
{
  AudioDSPUplinkSpeechMixer *v3;
  double mSampleRate;
  AudioDSPUplinkSpeechMixer *v6;
  __int128 v7;
  std::string *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  AudioDSPUplinkSpeechMixer *v12;
  uint64_t i;
  void **v14;
  std::__fs::filesystem::path *v15;
  std::__fs::filesystem::path *v16;
  __int128 v17;
  __int128 v18;
  uint64_t p_graphAUPB;
  void *v20;
  shared_ptr<caulk::deferred_logger> v21;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD v29[3];
  std::string v30;
  std::string v31;
  CFTypeRef cf[5];
  void *__p[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  std::string *v47;
  std::__fs::filesystem::path v48;
  std::string *v49;
  std::string v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v55;
  void **v56;
  std::__fs::filesystem::path v57;
  std::string v58;
  _QWORD v59[3];
  std::string v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[5];

  v3 = self;
  v64[4] = *MEMORY[0x1E0C80C00];
  mSampleRate = a3->streamDescription.mSampleRate;
  if (a3->streamDescription.mSampleRate <= 0.0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_24:
      v12 = 0;
      goto LABEL_90;
    }
    LOWORD(__p[0]) = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "uplink speech mixer sample rate must be greater than zero";
LABEL_92:
    _os_log_error_impl(&dword_1B5ED0000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)__p, 2u);
    goto LABEL_24;
  }
  if (!a3->maximumFramesPerSlice)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    LOWORD(__p[0]) = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "uplink speech mixer maximum number of frames per slice must be greater than zero";
    goto LABEL_92;
  }
  v55.receiver = self;
  v55.super_class = (Class)AudioDSPUplinkSpeechMixer;
  v6 = -[AudioDSPUplinkSpeechMixer init](&v55, sel_init, mSampleRate);

  if (v6)
  {
    MEMORY[0x1BCC95170](&v61);
    v7 = *(_OWORD *)&a3->streamDescription.mBytesPerPacket;
    v51 = *(_OWORD *)&a3->streamDescription.mSampleRate;
    v52 = v7;
    v53 = *(_QWORD *)&a3->streamDescription.mBitsPerChannel;
    v54 = 1;
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v50, &gResourcesBasePath);
    v49 = 0;
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v34 = 0;
    std::string::append[abi:ne180100]<char const*,0>((std::string *)__p, "uplink_speech_mixer.dspg", ");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)__p, (uint64_t)&v50, &v48);
    if (SBYTE7(v34) < 0)
      operator delete(__p[0]);
    std::__fs::filesystem::__status(&v48, 0);
    if (LOBYTE(__p[0]) && LOBYTE(__p[0]) != 255)
    {
      v46 = 0;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      *(_OWORD *)__p = 0u;
      DSPGraph::Interpreter::Interpreter((DSPGraph::Interpreter *)__p);
      std::to_string(&v31, a3->streamDescription.mSampleRate);
      std::string::basic_string[abi:ne180100]<0>(&v57, "IO_SAMPLE_RATE");
      v58 = v31;
      memset(&v31, 0, sizeof(v31));
      std::to_string(&v30, a3->streamDescription.mChannelsPerFrame);
      std::string::basic_string[abi:ne180100]<0>(v59, "IO_CHANNEL_COUNT");
      v60 = v30;
      memset(&v30, 0, sizeof(v30));
      std::unordered_map<std::string,std::string>::unordered_map((uint64_t)cf, (unsigned __int8 *)&v57, 2);
      memset(v29, 0, sizeof(v29));
      DSPGraph::Interpreter::compileFile();
      v8 = v47;
      v47 = 0;
      v49 = v8;
      v56 = (void **)v29;
      std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100](&v56);
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)cf);
      for (i = 0; i != -12; i -= 6)
      {
        v14 = (void **)((char *)&v57.__pn_.__r_.__value_.__l.__data_ + i * 8);
        if (SHIBYTE(v60.__r_.__value_.__r.__words[i + 2]) < 0)
          operator delete(v14[9]);
        if (*((char *)v14 + 71) < 0)
          operator delete(v14[6]);
      }
      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v30.__r_.__value_.__l.__data_);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v31.__r_.__value_.__l.__data_);
      MEMORY[0x1BCC95158](__p);
    }
    else
    {
      v8 = (std::string *)operator new();
      MEMORY[0x1BCC95308]();
      v49 = v8;
      std::string::basic_string[abi:ne180100]<0>(__p, "HumanSpeechInput");
      DSPGraph::Graph::addInput();
      if (SBYTE7(v34) < 0)
        operator delete(__p[0]);
      std::string::basic_string[abi:ne180100]<0>(__p, "SynthesizedSpeechInput");
      DSPGraph::Graph::addInput();
      if (SBYTE7(v34) < 0)
        operator delete(__p[0]);
      std::string::basic_string[abi:ne180100]<0>(__p, "sum");
      DSPGraph::NewBoxRegistry::newBox();
      std::string::basic_string[abi:ne180100]<0>(&v57, "InputSum");
      DSPGraph::Graph::add();
      if (SHIBYTE(v57.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v57.__pn_.__r_.__value_.__l.__data_);
      if (SBYTE7(v34) < 0)
        operator delete(__p[0]);
      *(_OWORD *)&v57.__pn_.__r_.__value_.__l.__data_ = xmmword_1B66A2480;
      LODWORD(v57.__pn_.__r_.__value_.__r.__words[2]) = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, "OutputSoftClip");
      DSPGraph::Graph::add();
      if (SBYTE7(v34) < 0)
        operator delete(__p[0]);
      std::string::basic_string[abi:ne180100]<0>(__p, "MixedOutput");
      DSPGraph::Graph::addOutput();
      if (SBYTE7(v34) < 0)
        operator delete(__p[0]);
      DSPGraph::Graph::connect();
      DSPGraph::Graph::connect();
      DSPGraph::Graph::connect();
      DSPGraph::Graph::connect();
      -[AudioDSPUplinkSpeechMixer description](v6, "description");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::__assign_external(v8 + 17, (const std::string::value_type *)objc_msgSend(v9, "UTF8String"));

    }
    if (SHIBYTE(v48.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v48.__pn_.__r_.__value_.__l.__data_);
    DSPGraph::Graph::setSliceDuration();
    DSPGraph::Graph::configure((DSPGraph::Graph *)v8);
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v34 = 0;
    std::string::append[abi:ne180100]<char const*,0>((std::string *)__p, "uplink_speech_mixer.propstrip", ");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)__p, (uint64_t)&v50, &v57);
    if (SBYTE7(v34) < 0)
      operator delete(__p[0]);
    std::__fs::filesystem::__status(&v57, 0);
    if (LOBYTE(__p[0]) && LOBYTE(__p[0]) != 255)
    {
      if ((v57.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &v57;
      else
        v15 = (std::__fs::filesystem::path *)v57.__pn_.__r_.__value_.__r.__words[0];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)v15);
      applesauce::CF::make_DataRef((const char *)__p, (CFDataRef *)cf);
      if (SBYTE7(v34) < 0)
        operator delete(__p[0]);
      if (cf[0])
      {
        applesauce::CF::make_DictionaryRef((CFDataRef *)cf, (applesauce::CF::DictionaryRef *)__p);
        if (__p[0])
        {
          DSPGraph::Graph::setPropertyStrip((DSPGraph::Graph *)v8, (const __CFDictionary *)__p[0]);
          if (__p[0])
            CFRelease(__p[0]);
        }
        if (cf[0])
          CFRelease(cf[0]);
      }
    }
    if (SHIBYTE(v57.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v57.__pn_.__r_.__value_.__l.__data_);
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v34 = 0;
    std::string::append[abi:ne180100]<char const*,0>((std::string *)__p, "uplink_speech_mixer.austrip", ");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)__p, (uint64_t)&v50, &v57);
    if (SBYTE7(v34) < 0)
      operator delete(__p[0]);
    std::__fs::filesystem::__status(&v57, 0);
    if (LOBYTE(__p[0]) && LOBYTE(__p[0]) != 255)
    {
      if ((v57.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = &v57;
      else
        v16 = (std::__fs::filesystem::path *)v57.__pn_.__r_.__value_.__r.__words[0];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)v16);
      applesauce::CF::make_DataRef((const char *)__p, (CFDataRef *)cf);
      if (SBYTE7(v34) < 0)
        operator delete(__p[0]);
      if (cf[0])
      {
        applesauce::CF::make_DictionaryRef((CFDataRef *)cf, (applesauce::CF::DictionaryRef *)__p);
        if (__p[0])
        {
          DSPGraph::Graph::setAUStrip((DSPGraph::Graph *)v8, (const __CFDictionary *)__p[0]);
          if (__p[0])
            CFRelease(__p[0]);
        }
        if (cf[0])
          CFRelease(cf[0]);
      }
    }
    if (SHIBYTE(v57.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v57.__pn_.__r_.__value_.__l.__data_);
    DSPGraph::Graph::initialize((DSPGraph::Graph *)v8);
    v17 = *(_OWORD *)&a3->streamDescription.mSampleRate;
    v18 = *(_OWORD *)&a3->streamDescription.mBytesPerPacket;
    *(_OWORD *)&v6->_settings.streamDescription.mBitsPerChannel = *(_OWORD *)&a3->streamDescription.mBitsPerChannel;
    *(_OWORD *)&v6->_settings.streamDescription.mBytesPerPacket = v18;
    *(_OWORD *)&v6->_settings.streamDescription.mSampleRate = v17;
    std::shared_ptr<DSPGraph::Graph>::operator=[abi:ne180100]<DSPGraph::Graph,std::default_delete<DSPGraph::Graph>,void>(&v6->_graph.__ptr_, (uint64_t *)&v49);
    p_graphAUPB = (uint64_t)&v6->_graphAUPB;
    if (v6->_graphAUPB.__engaged_)
    {
      p_graphAUPB = MEMORY[0x1BCC94BDC](p_graphAUPB);
      v6->_graphAUPB.__engaged_ = 0;
    }
    MEMORY[0x1BCC94BD0](p_graphAUPB, &v6->_graph);
    v6->_graphAUPB.__engaged_ = 1;
    caulk::deferred_logger::create_v(MEMORY[0x1E0C81028], v20);
    v21 = *(shared_ptr<caulk::deferred_logger> *)__p;
    __p[0] = 0;
    __p[1] = 0;
    cntrl = (std::__shared_weak_count *)v6->_graphErrorLogger.__cntrl_;
    v6->_graphErrorLogger = v21;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v24 = __ldaxr(p_shared_owners);
      while (__stlxr(v24 - 1, p_shared_owners));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v25 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v26 = (unint64_t *)((char *)__p[1] + 8);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v6->_graphInputSampleTime = 0.0;
    if (v49)
      (*(void (**)(std::string *))(v49->__r_.__value_.__r.__words[0] + 8))(v49);
    if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v50.__r_.__value_.__l.__data_);
    v61 = MEMORY[0x1E0CFFC40] + 16;
    __p[0] = v64;
    std::vector<std::pair<std::string,AudioComponentDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    std::__hash_table<std::__hash_value_type<AudioComponentDescription,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<AudioComponentDescription>,DSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,true>,std::__unordered_map_equal<AudioComponentDescription,std::__hash_value_type<AudioComponentDescription,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,DSPGraph::NewBoxRegistry::AudioComponentDescriptionEquality,std::hash<AudioComponentDescription>,true>,std::allocator<std::__hash_value_type<AudioComponentDescription,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)&v63);
    std::__hash_table<std::__hash_value_type<std::string,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::function<DSPGraph::Box * ()(unsigned int,unsigned int)>>>>::~__hash_table((uint64_t)&v62);
  }
  v3 = v6;
  v12 = v3;
LABEL_90:

  return v12;
}

- (id)processBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__AudioDSPUplinkSpeechMixer_processBlock__block_invoke;
  aBlock[3] = &unk_1E69DBD90;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (void).cxx_destruct
{
  std::shared_ptr<vp::services::Telephony_Utility>::~shared_ptr[abi:ne180100]((uint64_t)&self->_graphErrorLogger);
  if (self->_graphAUPB.__engaged_)
    MEMORY[0x1BCC94BDC](&self->_graphAUPB);
  std::shared_ptr<vp::services::Telephony_Utility>::~shared_ptr[abi:ne180100]((uint64_t)&self->_graph);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 144) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_BYTE *)self + 72) = 0;
  return self;
}

double __41__AudioDSPUplinkSpeechMixer_processBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v7;
  double result;

  DSPGraph::Graph::preflight();
  DSPGraph::Graph::processMultiple();
  v7 = *(_QWORD *)(a1 + 32);
  result = *(double *)(v7 + 168) + (double)a5;
  *(double *)(v7 + 168) = result;
  return result;
}

@end
