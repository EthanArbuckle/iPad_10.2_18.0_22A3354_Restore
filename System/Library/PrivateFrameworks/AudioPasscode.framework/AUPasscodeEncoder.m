@implementation AUPasscodeEncoder

+ (id)supportedEncoders
{
  return +[APCCodecInfo supportedEncoders](APCCodecInfo, "supportedEncoders");
}

+ (AudioComponentDescription)getAUDesc
{
  *(_OWORD *)&retstr->componentType = xmmword_2295A2C60;
  retstr->componentFlagsMask = 0;
  return result;
}

+ (void)registerAU
{
  if (+[AUPasscodeEncoder registerAU]::gOnce != -1)
    dispatch_once(&+[AUPasscodeEncoder registerAU]::gOnce, &__block_literal_global_2);
}

uint64_t __31__AUPasscodeEncoder_registerAU__block_invoke()
{
  void *v0;
  uint64_t v1;
  _BYTE v3[20];

  v0 = (void *)MEMORY[0x24BE0A830];
  v1 = objc_opt_class();
  +[AUPasscodeEncoder getAUDesc](AUPasscodeEncoder, "getAUDesc");
  return objc_msgSend(v0, "registerSubclass:asComponentDescription:name:version:", v1, v3, CFSTR("AUPasscodeEncoder"), 1);
}

- (AUPasscodeEncoder)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  char *v5;
  AVAudioFormat *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  uint64_t **v19;
  void (**v20)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  void (*v21)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  AVAudioChannelCount v22;
  uint64_t **v23;
  void (**v24)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  void (*v25)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  BOOL v26;
  uint64_t **v27;
  void (**v28)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  void (*v29)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  caulk::concurrent::messenger *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id *v38;
  char *v39;
  unsigned int v41;
  objc_super v42;
  AudioComponentDescription v43;
  std::string v44;
  char v45;
  __int128 v46;
  int v47;
  char v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  std::string v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v43 = *a3;
  v42.receiver = self;
  v42.super_class = (Class)AUPasscodeEncoder;
  v5 = -[AUAudioUnit initWithComponentDescription:options:error:](&v42, sel_initWithComponentDescription_options_error_, &v43, *(_QWORD *)&a4, a5);
  if (v5)
  {
    v6 = (AVAudioFormat *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initStandardFormatWithSampleRate:channels:", 1, 44100.0);
    BufferedAudioBus::init((BufferedAudioBus *)(v5 + 584), v6, 8);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE0A838]), "initWithFormat:error:", v6, 0);
    v8 = (void *)*((_QWORD *)v5 + 78);
    *((_QWORD *)v5 + 78) = v7;

    v9 = objc_alloc(MEMORY[0x24BE0A840]);
    v52 = *((_QWORD *)v5 + 73);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithAudioUnit:busType:busses:", v5, 1, v10);
    v12 = (void *)*((_QWORD *)v5 + 79);
    *((_QWORD *)v5 + 79) = v11;

    v13 = objc_alloc(MEMORY[0x24BE0A840]);
    v51 = *((_QWORD *)v5 + 78);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithAudioUnit:busType:busses:", v5, 2, v14);
    v16 = (void *)*((_QWORD *)v5 + 80);
    *((_QWORD *)v5 + 80) = v15;

    -[AVAudioFormat sampleRate](v6, "sampleRate");
    v18 = v17;
    v41 = 0;
    v44.__r_.__value_.__r.__words[0] = (std::string::size_type)&v41;
    v19 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 81, &v41, (uint64_t)&std::piecewise_construct, &v44);
    v20 = (void (**)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD))(v19 + 5);
    v53.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    HIDWORD(v53.__r_.__value_.__r.__words[1]) = 0;
    LODWORD(v53.__r_.__value_.__r.__words[1]) = (v18 + 0.5);
    if (&v53 != (std::string *)(v19 + 5))
    {
      v21 = *v20;
      if (*v20)
      {
        *(_OWORD *)&v44.__r_.__value_.__l.__data_ = 0uLL;
        v21(2, v20, &v44, 0, 0);
        ((void (*)(uint64_t, std::string *, _QWORD, _QWORD, _QWORD))v53.__r_.__value_.__l.__data_)(2, &v53, v20, 0, 0);
        ((void (*)(uint64_t, std::string *, std::string *, _QWORD, _QWORD))v44.__r_.__value_.__l.__data_)(2, &v44, &v53, 0, 0);
        std::any::reset[abi:ne180100](&v44);
      }
      else
      {
        *((_DWORD *)v19 + 12) = (v18 + 0.5);
        v19[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
        v53.__r_.__value_.__r.__words[0] = 0;
      }
    }
    std::any::reset[abi:ne180100](&v53);
    v22 = -[AVAudioFormat channelCount](v6, "channelCount");
    v41 = 1;
    v44.__r_.__value_.__r.__words[0] = (std::string::size_type)&v41;
    v23 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 81, &v41, (uint64_t)&std::piecewise_construct, &v44);
    v24 = (void (**)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD))(v23 + 5);
    v53.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v53.__r_.__value_.__l.__size_ = v22;
    if (&v53 != (std::string *)(v23 + 5))
    {
      v25 = *v24;
      if (*v24)
      {
        *(_OWORD *)&v44.__r_.__value_.__l.__data_ = 0uLL;
        v25(2, v24, &v44, 0, 0);
        ((void (*)(uint64_t, std::string *, _QWORD, _QWORD, _QWORD))v53.__r_.__value_.__l.__data_)(2, &v53, v24, 0, 0);
        ((void (*)(uint64_t, std::string *, std::string *, _QWORD, _QWORD))v44.__r_.__value_.__l.__data_)(2, &v44, &v53, 0, 0);
        std::any::reset[abi:ne180100](&v44);
      }
      else
      {
        *((_DWORD *)v23 + 12) = v22;
        v23[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
        v53.__r_.__value_.__r.__words[0] = 0;
      }
    }
    std::any::reset[abi:ne180100](&v53);
    v26 = -[AVAudioFormat isInterleaved](v6, "isInterleaved");
    v41 = 2;
    v44.__r_.__value_.__r.__words[0] = (std::string::size_type)&v41;
    v27 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 81, &v41, (uint64_t)&std::piecewise_construct, &v44);
    v28 = (void (**)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD))(v27 + 5);
    v53.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
    v53.__r_.__value_.__l.__size_ = v26;
    if (&v53 != (std::string *)(v27 + 5))
    {
      v29 = *v28;
      if (*v28)
      {
        *(_OWORD *)&v44.__r_.__value_.__l.__data_ = 0uLL;
        v29(2, v28, &v44, 0, 0);
        ((void (*)(uint64_t, std::string *, _QWORD, _QWORD, _QWORD))v53.__r_.__value_.__l.__data_)(2, &v53, v28, 0, 0);
        ((void (*)(uint64_t, std::string *, std::string *, _QWORD, _QWORD))v44.__r_.__value_.__l.__data_)(2, &v44, &v53, 0, 0);
        std::any::reset[abi:ne180100](&v44);
      }
      else
      {
        *((_BYTE *)v27 + 48) = v26;
        v27[5] = (uint64_t *)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
        v53.__r_.__value_.__r.__words[0] = 0;
      }
    }
    std::any::reset[abi:ne180100](&v53);
    *((_QWORD *)v5 + 94) = 0;
    v5[728] = 0;
    *((_DWORD *)v5 + 183) = 1050253722;
    v5[729] = 0;
    v5[680] = 0;
    *((_DWORD *)v5 + 176) = 0;
    *((_DWORD *)v5 + 177) = 0;
    v5[730] = 1;
    *((_QWORD *)v5 + 95) = 0;
    *((_QWORD *)v5 + 89) = 0;
    *((_QWORD *)v5 + 90) = 0;
    v30 = (caulk::concurrent::messenger *)std::string::basic_string[abi:ne180100]<0>(&v53, "AUPasscodeEncoder messenger");
    v31 = caulk::concurrent::messenger::shared_logging_priority(v30);
    if (!*(_BYTE *)(v31 + 52))
      std::__throw_bad_optional_access[abi:ne180100]();
    v32 = v31 + 32;
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v44, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
      v45 = 1;
      v34 = *(_DWORD *)(v32 + 16);
      v46 = *(_OWORD *)v32;
      v47 = v34;
      v48 = 1;
      v49 = 0;
      v50 = 0;
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v53.__r_.__value_.__l.__data_);
    }
    else
    {
      v44 = v53;
      v45 = 1;
      v33 = *(_DWORD *)(v31 + 48);
      v46 = *(_OWORD *)v32;
      v47 = v33;
      v48 = 1;
      v49 = 0;
      v50 = 0;
    }
    v35 = operator new();
    MEMORY[0x22E2CB4AC](v35, 1, &v44);
    std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100]((uint64_t *)v5 + 87, v35);
    v36 = operator new();
    v37 = v5;
    *(_DWORD *)(v36 + 16) = 0;
    *(_QWORD *)v36 = &off_24F24BC10;
    *(_QWORD *)(v36 + 8) = 0;
    *(_QWORD *)(v36 + 24) = v37;
    v38 = (id *)*((_QWORD *)v37 + 86);
    *((_QWORD *)v37 + 86) = v36;
    if (v38)
      std::default_delete<EOFReachedMessage>::operator()[abi:ne180100]((uint64_t)(v37 + 688), v38);
    v39 = v37;
    if (v45 && SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v44.__r_.__value_.__l.__data_);

  }
  return (AUPasscodeEncoder *)v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUPasscodeEncoder;
  -[AUAudioUnit dealloc](&v2, sel_dealloc);
}

- (void)handleEOFReachedForAsset
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  if (self->_assetEndedAndSilencedHandler)
  {
    -[AUPasscodeEncoder dispatchQueue](self, "dispatchQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[AUPasscodeEncoder dispatchQueue](self, "dispatchQueue");
    else
      dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__AUPasscodeEncoder_handleEOFReachedForAsset__block_invoke;
    block[3] = &unk_24F24B4F8;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

uint64_t __45__AUPasscodeEncoder_handleEOFReachedForAsset__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 776) + 16))();
}

- (id)inputBusses
{
  return self->_inputBusArray;
}

- (id)outputBusses
{
  return self->_outputBusArray;
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  BufferedInputBus *p_inputBus;
  void *v10;
  int v11;
  AUPasscodeEncoder *v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  char v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  uint64_t **v30;
  void (**v31)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v32)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  uint64_t **v37;
  void (**v38)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v39)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  uint64_t **v44;
  void (**v45)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v46)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  AUPasscodeEncoder *v47;
  NSMutableDictionary *passcodeEmbedInfo;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  unsigned int v54;
  uint64_t **v55;
  void (**v56)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v57)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void *v58;
  void *v59;
  APCEncoderBase *v60;
  APCEncoderBase *value;
  unsigned int *v62;
  id obj;
  id obja;
  void *v66;
  uint64_t **p_apcEncoderConfig;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  unsigned int v73;
  objc_super v74;
  _BYTE v75[128];
  void (*v76)(int);
  uint64_t v77;
  unsigned int *v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  -[AUPasscodeEncoder codecConfig](self, "codecConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_12;
  -[AUPasscodeEncoder payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_12;
  }
  v6 = -[AUPasscodeEncoder assetLength](self, "assetLength");

  if (!v6)
    goto LABEL_12;
  -[AUPasscodeEncoder codecConfig](self, "codecConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numChannels");

  if (v8 > 1)
    goto LABEL_12;
  p_inputBus = &self->_inputBus;
  -[AUAudioUnitBus format](self->_inputBus.bus, "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isInterleaved");
  if (v11)
  {
    -[AUAudioUnitBus format](p_inputBus->bus, "format");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "channelCount") > 1)
      goto LABEL_15;
  }
  -[AUAudioUnitBus format](p_inputBus->bus, "format");
  v12 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isStandard"))
  {

    if (!v11)
    {
LABEL_16:

      goto LABEL_22;
    }
LABEL_15:

    goto LABEL_16;
  }
  -[AUAudioUnitBus format](self->_outputBus, "format");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isInterleaved");
  v16 = v15;
  if (v15)
  {
    -[AUAudioUnitBus format](self->_outputBus, "format");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(obj, "channelCount") > 1)
    {
      v17 = 1;
      goto LABEL_19;
    }
  }
  -[AUAudioUnitBus format](self->_outputBus, "format");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v19, "isStandard") ^ 1;

  if ((v16 & 1) != 0)
  {
    v12 = self;
LABEL_19:

    if ((v11 & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }

  v12 = self;
  if ((v11 & 1) != 0)
LABEL_20:

LABEL_21:
  if ((v17 & 1) == 0)
  {
    -[AUAudioUnitBus format](v12->_outputBus, "format");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "channelCount");
    -[AUPasscodeEncoder codecConfig](self, "codecConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "numChannels");

    if (v24 <= v22)
    {
      v74.receiver = self;
      v74.super_class = (Class)AUPasscodeEncoder;
      v18 = -[AUAudioUnit allocateRenderResourcesAndReturnError:](&v74, sel_allocateRenderResourcesAndReturnError_, a3);
      if (!v18)
        return v18;
      BufferedAudioBus::allocateRenderResources((BufferedAudioBus *)p_inputBus, -[AUAudioUnit maximumFramesToRender](self, "maximumFramesToRender"));
      -[AUPasscodeEncoder inputBusses](self, "inputBusses");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "format");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sampleRate");
      v29 = v28;
      v73 = 0;
      v78 = &v73;
      p_apcEncoderConfig = (uint64_t **)&self->_apcEncoderConfig;
      v30 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->_apcEncoderConfig, &v73, (uint64_t)&std::piecewise_construct, &v78);
      v31 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v30 + 5);
      v76 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      HIDWORD(v77) = 0;
      LODWORD(v77) = (v29 + 0.5);
      if (&v76 != (void (**)(int))(v30 + 5))
      {
        v32 = *v31;
        if (*v31)
        {
          v78 = 0;
          v79 = 0;
          v32(2, v31, &v78, 0, 0);
          ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v76)(2, &v76, v31, 0, 0);
          ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v78)(2, &v78, &v76, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v78);
        }
        else
        {
          *((_DWORD *)v30 + 12) = (v29 + 0.5);
          v30[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
          v76 = 0;
        }
      }
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v76);

      -[AUPasscodeEncoder inputBusses](self, "inputBusses");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "format");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "channelCount");
      v73 = 1;
      v78 = &v73;
      v37 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_apcEncoderConfig, &v73, (uint64_t)&std::piecewise_construct, &v78);
      v38 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v37 + 5);
      v77 = v36;
      v76 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      if (&v76 != (void (**)(int))(v37 + 5))
      {
        v39 = *v38;
        if (*v38)
        {
          v78 = 0;
          v79 = 0;
          v39(2, v38, &v78, 0, 0);
          v76(2);
          ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v78)(2, &v78, &v76, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v78);
        }
        else
        {
          *((_DWORD *)v37 + 12) = v36;
          v37[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
          v76 = 0;
        }
      }
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v76);

      -[AUPasscodeEncoder inputBusses](self, "inputBusses");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "format");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isInterleaved");
      v73 = 2;
      v78 = &v73;
      v44 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_apcEncoderConfig, &v73, (uint64_t)&std::piecewise_construct, &v78);
      v45 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v44 + 5);
      v76 = std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
      v77 = v43;
      if (&v76 != (void (**)(int))(v44 + 5))
      {
        v46 = *v45;
        if (*v45)
        {
          v78 = 0;
          v79 = 0;
          v46(2, v45, &v78, 0, 0);
          ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v76)(2, &v76, v45, 0, 0);
          ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v78)(2, &v78, &v76, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v78);
        }
        else
        {
          *((_BYTE *)v44 + 48) = v43;
          v44[5] = (uint64_t *)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
          v76 = 0;
        }
      }
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v76);

      v47 = self;
      passcodeEmbedInfo = self->_passcodeEmbedInfo;
      if (passcodeEmbedInfo)
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        -[NSMutableDictionary allKeys](passcodeEmbedInfo, "allKeys");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
        if (v49)
        {
          v50 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v70 != v50)
                objc_enumerationMutation(obja);
              v52 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_passcodeEmbedInfo, "objectForKeyedSubscript:", v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "unsignedLongValue");
              v73 = objc_msgSend(v52, "integerValue");
              v78 = &v73;
              v55 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_apcEncoderConfig, &v73, (uint64_t)&std::piecewise_construct, &v78);
              v56 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v55 + 5);
              v77 = v54;
              v76 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
              if (&v76 != (void (**)(int))(v55 + 5))
              {
                v57 = *v56;
                if (*v56)
                {
                  v78 = 0;
                  v79 = 0;
                  v57(2, v56, &v78, 0, 0);
                  v76(2);
                  ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v78)(2, &v78, &v76, 0, 0);
                  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v78);
                }
                else
                {
                  *((_DWORD *)v55 + 12) = v54;
                  v55[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
                  v76 = 0;
                }
              }
              std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v76);

            }
            v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
          }
          while (v49);
        }

        v47 = self;
      }
      -[AUPasscodeEncoder codecConfig](v47, "codecConfig");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[AUPasscodeEncoder payload](self, "payload");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      +[APCCodecFactory createEncoderWithConfig:apcConfig:payloadData:](APCCodecFactory, "createEncoderWithConfig:apcConfig:payloadData:", v58, p_apcEncoderConfig, v59);
      v60 = (APCEncoderBase *)v78;
      v78 = 0;
      value = self->_kernel.__ptr_.__value_;
      self->_kernel.__ptr_.__value_ = v60;
      if (value)
      {
        (*(void (**)(APCEncoderBase *))(*(_QWORD *)value + 8))(value);
        v62 = v78;
        v78 = 0;
        if (v62)
          (*(void (**)(unsigned int *))(*(_QWORD *)v62 + 8))(v62);
      }

      if (self->_kernel.__ptr_.__value_)
      {
        self->_assetSampleCount = 0;
        self->_silenceOutputOnNextAssetEnding = 0;
        self->_fadeOutNumSamples = 0;
        self->_triggerFadeOut = 0;
        LOBYTE(v18) = 1;
        self->_embedPasscode = 1;
        self->_loopNumber = 1;
        self->_beginningTime = 0;
        return v18;
      }
      -[AUAudioUnit setRenderResourcesAllocated:](self, "setRenderResourcesAllocated:", 0);
    }
    else if (a3)
    {
      goto LABEL_23;
    }
LABEL_12:
    LOBYTE(v18) = 0;
    return v18;
  }
LABEL_22:
  if (!a3)
    goto LABEL_12;
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -10875, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = 0;
  *a3 = v20;
  return v18;
}

- (void)deallocateRenderResources
{
  BufferedInputBus *p_inputBus;
  AVAudioPCMBuffer *pcmBuffer;
  objc_super v5;

  p_inputBus = &self->_inputBus;
  pcmBuffer = self->_inputBus.pcmBuffer;
  self->_inputBus.pcmBuffer = 0;

  p_inputBus->originalAudioBufferList = 0;
  p_inputBus->mutableAudioBufferList = 0;
  v5.receiver = self;
  v5.super_class = (Class)AUPasscodeEncoder;
  -[AUAudioUnit deallocateRenderResources](&v5, sel_deallocateRenderResources);
}

- (void)reset
{
  objc_super v2;

  self->_outputIsSilenced = 0;
  self->_silenceOutputOnNextAssetEnding = 0;
  self->_assetSampleCount = 0;
  self->_fadeOutNumSamples = 0;
  self->_triggerFadeOut = 0;
  self->_embedPasscode = 1;
  self->_loopNumber = 1;
  self->_beginningTime = 0;
  v2.receiver = self;
  v2.super_class = (Class)AUPasscodeEncoder;
  -[AUAudioUnit reset](&v2, sel_reset);
}

- (id)internalRenderBlock
{
  BufferedInputBus *p_inputBus;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[22];
  _QWORD v10[4];

  p_inputBus = &self->_inputBus;
  -[AUAudioUnitBus format](self->_inputBus.bus, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampleRate");
  v6 = v5;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = &self->_passcodeEmbedInfo;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__AUPasscodeEncoder_internalRenderBlock__block_invoke;
  v9[3] = &unk_24F24BBE0;
  v9[6] = &self->_assetSampleCount;
  v9[7] = &self->_beginningTime;
  v9[8] = &self->_assetLength;
  v9[9] = &self->_outputIsSilenced;
  v9[10] = &self->_embedPasscode;
  v9[11] = &self->_kernel;
  v9[4] = v10;
  v9[5] = p_inputBus;
  v9[12] = &self->_triggerFadeOut;
  v9[13] = &self->_fadeOutNumSamples;
  v9[14] = &self->_fadeOutTimeSeconds;
  v9[15] = v6;
  v9[16] = &self->_fadeOutSampleIndex;
  v9[17] = &self->_numLoopsToStopAfter;
  v9[18] = &self->_loopNumber;
  v9[19] = &self->_silenceOutputOnNextAssetEnding;
  v9[20] = &self->_rtMessenger;
  v9[21] = &self->_eofMessage;
  v7 = (void *)MEMORY[0x22E2CB86C](v9);
  _Block_object_dispose(v10, 8);
  return v7;
}

uint64_t __40__AUPasscodeEncoder_internalRenderBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void *a8)
{
  unsigned int v9;
  uint64_t result;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  unsigned int v21;
  uint64_t v22;
  float *v23;
  const void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BYTE *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  float v37;
  float v38;
  _QWORD *v39;
  uint64_t v40;
  size_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned int *v46;
  uint64_t v47;
  int v48;

  v9 = a4;
  v48 = 0;
  result = BufferedInputBus::pullInput(*(BufferedInputBus **)(a1 + 40), (uint64_t)&v48, a3, a4, 0, a8);
  if (!(_DWORD)result)
  {
    v47 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
    if (!*((_QWORD *)a6 + 2))
    {
      v12 = *a6;
      if ((_DWORD)v12)
      {
        v13 = (uint64_t *)(v47 + 16);
        v14 = a6 + 4;
        do
        {
          v15 = *v13;
          v13 += 2;
          *v14 = v15;
          v14 += 2;
          --v12;
        }
        while (v12);
      }
    }
    if (v9)
    {
      v16 = 0;
      v17 = v9;
      v44 = v9;
      v45 = v9;
      v46 = a6;
      do
      {
        v18 = **(_QWORD **)(a1 + 48);
        if (!v18)
        {
          v19 = mach_absolute_time();
          v20 = *(uint64_t **)(a1 + 48);
          **(_QWORD **)(a1 + 56) = v19;
          v18 = *v20;
        }
        v21 = **(_DWORD **)(a1 + 64) - v18;
        if (v17 >= v21)
          v22 = v21;
        else
          v22 = v17;
        v23 = (float *)(*((_QWORD *)a6 + 2) + 4 * v16);
        if (**(_BYTE **)(a1 + 72))
        {
          LODWORD(v22) = v9 - v16;
          vDSP_vclr((float *)(*((_QWORD *)a6 + 2) + 4 * v16), 1, v9 - v16);
        }
        else
        {
          v24 = (const void *)(*(_QWORD *)(v47 + 16) + 4 * v16);
          if (**(_BYTE **)(a1 + 80))
          {
            (*(void (**)(_QWORD, const void *, uint64_t, uint64_t))(***(_QWORD ***)(a1 + 88) + 16))(**(_QWORD **)(a1 + 88), v24, *((_QWORD *)a6 + 2) + 4 * v16, v22);
            if (!(*(unsigned int (**)(_QWORD))(***(_QWORD ***)(a1 + 88) + 32))(**(_QWORD **)(a1 + 88))
              && **(_QWORD **)(a1 + 56))
            {
              v25 = mach_absolute_time();
              v26 = **(void ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25 - **(_QWORD **)(a1 + 56));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1001);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v27, v28);

              **(_QWORD **)(a1 + 56) = 0;
            }
          }
          else if ((_DWORD)v22)
          {
            memmove((void *)(*((_QWORD *)a6 + 2) + 4 * v16), v24, 4 * v22);
          }
          v29 = *(_BYTE **)(a1 + 96);
          if (*v29)
          {
            v30 = llround(*(double *)(a1 + 120) * **(float **)(a1 + 112));
            if (v30 <= 1)
              LODWORD(v30) = 1;
            **(_DWORD **)(a1 + 104) = v30;
            **(_DWORD **)(a1 + 128) = 0;
            *v29 = 0;
          }
          v31 = **(_QWORD **)(a1 + 136);
          if (v31 && v31 <= **(_QWORD **)(a1 + 144))
            **(_BYTE **)(a1 + 152) = 1;
          if (**(_DWORD **)(a1 + 104) && (_DWORD)v22)
          {
            v32 = v22;
            do
            {
              v33 = *(_BYTE **)(a1 + 72);
              if (*v33)
              {
                *v23 = 0.0;
              }
              else
              {
                v34 = *(unsigned int **)(a1 + 128);
                v35 = *v34;
                v36 = *(unsigned int **)(a1 + 104);
                v37 = (float)*v34 / (float)*v36;
                v38 = *v23;
                *v23 = (float)(1.0 - v37) * (float)(v38 * expf(v37 * -2.0));
                *v34 = v35 + 1;
                if (v35 + 1 >= *v36)
                {
                  *v33 = 1;
                  caulk::concurrent::messenger::enqueue(**(caulk::concurrent::messenger ***)(a1 + 160), **(caulk::concurrent::message ***)(a1 + 168));
                }
              }
              ++v23;
              --v32;
            }
            while (v32);
          }
          if (**(_QWORD **)(a1 + 64) - **(_QWORD **)(a1 + 48) <= v44)
          {
            (*(void (**)(_QWORD))(***(_QWORD ***)(a1 + 88) + 24))(**(_QWORD **)(a1 + 88));
            v9 = v45;
            a6 = v46;
            if (**(_BYTE **)(a1 + 152))
            {
              **(_BYTE **)(a1 + 72) = 1;
              caulk::concurrent::messenger::enqueue(**(caulk::concurrent::messenger ***)(a1 + 160), **(caulk::concurrent::message ***)(a1 + 168));
            }
            ++**(_QWORD **)(a1 + 144);
          }
          else
          {
            v9 = v45;
            a6 = v46;
          }
        }
        v16 += v22;
        v17 -= v22;
        v39 = *(_QWORD **)(a1 + 48);
        v40 = *v39 + v22;
        *v39 = v40;
        if (v40 >= **(_QWORD **)(a1 + 64))
          v40 = 0;
        *v39 = v40;
      }
      while (v16 < v9);
    }
    if (*a6 >= 2)
    {
      v41 = 4 * v9;
      v42 = 1;
      v43 = 8;
      do
      {
        memcpy(*(void **)&a6[v43], *((const void **)a6 + 2), v41);
        ++v42;
        v43 += 4;
      }
      while (v42 < *a6);
    }
    return 0;
  }
  return result;
}

- (BOOL)canProcessInPlace
{
  return 1;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 736);
}

- (AUPasscodeCodecConfiguration)codecConfig
{
  return self->_codecConfig;
}

- (void)setCodecConfig:(id)a3
{
  objc_storeStrong((id *)&self->_codecConfig, a3);
}

- (int64_t)assetLength
{
  return self->_assetLength;
}

- (void)setAssetLength:(int64_t)a3
{
  self->_assetLength = a3;
}

- (BOOL)silenceOutputOnNextAssetEnding
{
  return self->_silenceOutputOnNextAssetEnding;
}

- (void)setSilenceOutputOnNextAssetEnding:(BOOL)a3
{
  self->_silenceOutputOnNextAssetEnding = a3;
}

- (unint64_t)numLoopsToStopAfter
{
  return self->_numLoopsToStopAfter;
}

- (void)setNumLoopsToStopAfter:(unint64_t)a3
{
  self->_numLoopsToStopAfter = a3;
}

- (float)fadeOutTimeSeconds
{
  return self->_fadeOutTimeSeconds;
}

- (void)setFadeOutTimeSeconds:(float)a3
{
  self->_fadeOutTimeSeconds = a3;
}

- (BOOL)triggerFadeOut
{
  return self->_triggerFadeOut;
}

- (void)setTriggerFadeOut:(BOOL)a3
{
  self->_triggerFadeOut = a3;
}

- (BOOL)embedPasscode
{
  return self->_embedPasscode;
}

- (void)setEmbedPasscode:(BOOL)a3
{
  self->_embedPasscode = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)assetEndedAndSilencedHandler
{
  return self->_assetEndedAndSilencedHandler;
}

- (void)setAssetEndedAndSilencedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (NSMutableDictionary)passcodeEmbedInfo
{
  return self->_passcodeEmbedInfo;
}

- (void)setPasscodeEmbedInfo:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeEmbedInfo, a3);
}

- (void).cxx_destruct
{
  id *value;
  APCEncoderBase *v4;

  objc_storeStrong((id *)&self->_passcodeEmbedInfo, 0);
  objc_storeStrong(&self->_assetEndedAndSilencedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_codecConfig, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100]((uint64_t *)&self->_rtMessenger, 0);
  value = (id *)self->_eofMessage.__ptr_.__value_;
  self->_eofMessage.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<EOFReachedMessage>::operator()[abi:ne180100]((uint64_t)&self->_eofMessage, value);
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)&self->_apcEncoderConfig, (_QWORD *)self->_apcEncoderConfig.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_outputBusArray, 0);
  objc_storeStrong((id *)&self->_inputBusArray, 0);
  objc_storeStrong((id *)&self->_outputBus, 0);

  v4 = self->_kernel.__ptr_.__value_;
  self->_kernel.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(APCEncoderBase *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 72) = 0;
  *((_QWORD *)self + 73) = 0;
  *((_DWORD *)self + 148) = 0;
  *((_QWORD *)self + 76) = 0;
  *((_QWORD *)self + 77) = 0;
  *((_QWORD *)self + 75) = 0;
  *((_QWORD *)self + 82) = 0;
  *((_QWORD *)self + 83) = 0;
  *((_QWORD *)self + 81) = (char *)self + 656;
  *((_QWORD *)self + 86) = 0;
  *((_QWORD *)self + 87) = 0;
  return self;
}

@end
