@implementation AUPasscodeDecoder

+ (AudioComponentDescription)getAUDesc
{
  *(_OWORD *)&retstr->componentType = xmmword_2295A2BF0;
  retstr->componentFlagsMask = 0;
  return result;
}

+ (void)registerAU
{
  if (+[AUPasscodeDecoder registerAU]::gOnce != -1)
    dispatch_once(&+[AUPasscodeDecoder registerAU]::gOnce, &__block_literal_global_1);
}

uint64_t __31__AUPasscodeDecoder_registerAU__block_invoke()
{
  void *v0;
  uint64_t v1;
  _BYTE v3[20];

  v0 = (void *)MEMORY[0x24BE0A830];
  v1 = objc_opt_class();
  +[AUPasscodeDecoder getAUDesc](AUPasscodeDecoder, "getAUDesc");
  return objc_msgSend(v0, "registerSubclass:asComponentDescription:name:version:", v1, v3, CFSTR("AUPasscodeDecoder"), 1);
}

+ (id)supportedDecoders
{
  return +[APCCodecInfo supportedDecoders](APCCodecInfo, "supportedDecoders");
}

- (AUPasscodeDecoder)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
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
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  DecodedDataMessage *v21;
  uint64_t v22;
  unsigned int *v23;
  double v24;
  double v25;
  uint64_t **v26;
  void (**v27)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v28)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  AVAudioChannelCount v29;
  uint64_t **v30;
  void (**v31)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v32)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  BOOL v33;
  uint64_t **v34;
  void (**v35)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v36)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  id v37;
  void *v38;
  char *v39;
  unsigned int v41;
  objc_super v42;
  AudioComponentDescription v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(int);
  uint64_t v47;
  unsigned int *v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v43 = *a3;
  v42.receiver = self;
  v42.super_class = (Class)AUPasscodeDecoder;
  v5 = -[AUAudioUnit initWithComponentDescription:options:error:](&v42, sel_initWithComponentDescription_options_error_, &v43, *(_QWORD *)&a4, a5);
  if (v5)
  {
    v6 = (AVAudioFormat *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initStandardFormatWithSampleRate:channels:", 1, 48000.0);
    BufferedAudioBus::init((BufferedAudioBus *)(v5 + 592), v6, 8);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE0A838]), "initWithFormat:error:", v6, 0);
    v8 = (void *)*((_QWORD *)v5 + 79);
    *((_QWORD *)v5 + 79) = v7;

    v9 = objc_alloc(MEMORY[0x24BE0A840]);
    v45 = *((_QWORD *)v5 + 74);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithAudioUnit:busType:busses:", v5, 1, v10);
    v12 = (void *)*((_QWORD *)v5 + 80);
    *((_QWORD *)v5 + 80) = v11;

    v13 = objc_alloc(MEMORY[0x24BE0A840]);
    v44 = *((_QWORD *)v5 + 79);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithAudioUnit:busType:busses:", v5, 2, v14);
    v16 = (void *)*((_QWORD *)v5 + 81);
    *((_QWORD *)v5 + 81) = v15;

    v17 = *((_QWORD *)v5 + 82);
    v18 = *((_QWORD *)v5 + 83) - v17;
    if (v18 > 0x107)
    {
      if (v18 != 264)
        *((_QWORD *)v5 + 83) = v17 + 264;
    }
    else
    {
      std::vector<signed char>::__append((unint64_t *)v5 + 82, 264 - v18);
    }
    v19 = 0;
    v20 = v5 + 680;
    do
    {
      v21 = (DecodedDataMessage *)operator new();
      DecodedDataMessage::DecodedDataMessage(v21, (AUPasscodeDecoder *)v5);
      v48 = 0;
      v22 = *(_QWORD *)&v20[v19];
      *(_QWORD *)&v20[v19] = v21;
      if (v22)
      {
        std::default_delete<DecodedDataMessage>::operator()[abi:ne180100]((uint64_t)&v20[v19], v22);
        v23 = v48;
        v48 = 0;
        if (v23)
          std::default_delete<DecodedDataMessage>::operator()[abi:ne180100]((uint64_t)&v48, (uint64_t)v23);
      }
      v19 += 8;
    }
    while (v19 != 80);
    -[AVAudioFormat sampleRate](v6, "sampleRate");
    v25 = v24;
    v41 = 0;
    v48 = &v41;
    v26 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 95, &v41, (uint64_t)&std::piecewise_construct, &v48);
    v27 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v26 + 5);
    v46 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    HIDWORD(v47) = 0;
    LODWORD(v47) = (v25 + 0.5);
    if (&v46 != (void (**)(int))(v26 + 5))
    {
      v28 = *v27;
      if (*v27)
      {
        v48 = 0;
        v49 = 0;
        v28(2, v27, &v48, 0, 0);
        ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v46)(2, &v46, v27, 0, 0);
        ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v48)(2, &v48, &v46, 0, 0);
        std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v48);
      }
      else
      {
        *((_DWORD *)v26 + 12) = (v25 + 0.5);
        v26[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
        v46 = 0;
      }
    }
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v46);
    v29 = -[AVAudioFormat channelCount](v6, "channelCount");
    v41 = 1;
    v48 = &v41;
    v30 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 95, &v41, (uint64_t)&std::piecewise_construct, &v48);
    v31 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v30 + 5);
    v46 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v47 = v29;
    if (&v46 != (void (**)(int))(v30 + 5))
    {
      v32 = *v31;
      if (*v31)
      {
        v48 = 0;
        v49 = 0;
        v32(2, v31, &v48, 0, 0);
        ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v46)(2, &v46, v31, 0, 0);
        ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v48)(2, &v48, &v46, 0, 0);
        std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v48);
      }
      else
      {
        *((_DWORD *)v30 + 12) = v29;
        v30[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
        v46 = 0;
      }
    }
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v46);
    v33 = -[AVAudioFormat isInterleaved](v6, "isInterleaved");
    v41 = 2;
    v48 = &v41;
    v34 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 95, &v41, (uint64_t)&std::piecewise_construct, &v48);
    v35 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v34 + 5);
    v46 = std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
    v47 = v33;
    if (&v46 != (void (**)(int))(v34 + 5))
    {
      v36 = *v35;
      if (*v35)
      {
        v48 = 0;
        v49 = 0;
        v36(2, v35, &v48, 0, 0);
        ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v46)(2, &v46, v35, 0, 0);
        ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v48)(2, &v48, &v46, 0, 0);
        std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v48);
      }
      else
      {
        *((_BYTE *)v34 + 48) = v33;
        v34[5] = (uint64_t *)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
        v46 = 0;
      }
    }
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v46);
    v37 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v38 = (void *)*((_QWORD *)v5 + 99);
    *((_QWORD *)v5 + 99) = v37;

    v5[800] = 0;
    v39 = v5;

  }
  return (AUPasscodeDecoder *)v5;
}

- (id)inputBusses
{
  return *((id *)self + 80);
}

- (id)outputBusses
{
  return *((id *)self + 81);
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  void *v3;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t **v27;
  void (**v28)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  void (*v29)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  uint64_t **v30;
  unsigned int v31;
  void (**v32)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  void (*v33)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  void *v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t **v37;
  void (**v38)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  void (*v39)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD);
  void *v40;
  std::string::size_type v41;
  uint64_t v42;
  std::string::size_type v43;
  caulk::concurrent::messenger *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v52;
  unsigned int v53;
  std::string v54;
  char v55;
  __int128 v56;
  int v57;
  char v58;
  char v59;
  char v60;
  std::string __p;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  -[AUPasscodeDecoder codecConfig](self, "codecConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_40;
  -[AUPasscodeDecoder codecConfig](self, "codecConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numChannels");

  if (v8 > 1)
    goto LABEL_40;
  objc_msgSend(*((id *)self + 79), "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)self + 74), "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:", v10))
    goto LABEL_7;
  objc_msgSend(*((id *)self + 79), "format");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isInterleaved");
  if (v12)
  {
    objc_msgSend(*((id *)self + 79), "format");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "channelCount") > 1)
    {

LABEL_7:
      goto LABEL_14;
    }
  }
  objc_msgSend(*((id *)self + 79), "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isStandard");

  if (v12)
  if ((v14 & 1) == 0)
  {
LABEL_14:
    if (a3)
    {
LABEL_15:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -10875, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = 0;
      *a3 = v19;
      return v20;
    }
LABEL_40:
    LOBYTE(v20) = 0;
    return v20;
  }
  objc_msgSend(*((id *)self + 74), "format");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "channelCount");
  -[AUPasscodeDecoder codecConfig](self, "codecConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "numChannels");

  if (v18 > v16)
  {
    if (a3)
      goto LABEL_15;
    goto LABEL_40;
  }
  BufferedAudioBus::allocateRenderResources((BufferedAudioBus *)((char *)self + 592), -[AUAudioUnit maximumFramesToRender](self, "maximumFramesToRender"));
  *((_DWORD *)self + 196) = objc_msgSend(*((id *)self + 112), "numChannels");
  objc_msgSend(*((id *)self + 80), "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "format");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)self + 197) = objc_msgSend(v22, "channelCount");

  objc_msgSend(*((id *)self + 80), "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "format");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sampleRate");
  v26 = v25;
  v53 = 0;
  v54.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
  v27 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)self + 95, &v53, (uint64_t)&std::piecewise_construct, &v54);
  v28 = (void (**)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD))(v27 + 5);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  HIDWORD(__p.__r_.__value_.__r.__words[1]) = 0;
  LODWORD(__p.__r_.__value_.__r.__words[1]) = (v26 + 0.5);
  if (&__p != (std::string *)(v27 + 5))
  {
    v29 = *v28;
    if (*v28)
    {
      *(_OWORD *)&v54.__r_.__value_.__l.__data_ = 0uLL;
      v29(2, v28, &v54, 0, 0);
      ((void (*)(uint64_t, std::string *, _QWORD, _QWORD, _QWORD))__p.__r_.__value_.__l.__data_)(2, &__p, v28, 0, 0);
      ((void (*)(uint64_t, std::string *, std::string *, _QWORD, _QWORD))v54.__r_.__value_.__l.__data_)(2, &v54, &__p, 0, 0);
      std::any::reset[abi:ne180100](&v54);
    }
    else
    {
      *((_DWORD *)v27 + 12) = (v26 + 0.5);
      v27[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      __p.__r_.__value_.__r.__words[0] = 0;
    }
  }
  std::any::reset[abi:ne180100](&__p);

  v53 = 1;
  v54.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
  v30 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)self + 95, &v53, (uint64_t)&std::piecewise_construct, &v54);
  v31 = *((_DWORD *)self + 196);
  v32 = (void (**)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD))(v30 + 5);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  __p.__r_.__value_.__l.__size_ = v31;
  if (&__p != (std::string *)(v30 + 5))
  {
    v33 = *v32;
    if (*v32)
    {
      *(_OWORD *)&v54.__r_.__value_.__l.__data_ = 0uLL;
      v33(2, v32, &v54, 0, 0);
      ((void (*)(uint64_t, std::string *, _QWORD, _QWORD, _QWORD))__p.__r_.__value_.__l.__data_)(2, &__p, v32, 0, 0);
      ((void (*)(uint64_t, std::string *, std::string *, _QWORD, _QWORD))v54.__r_.__value_.__l.__data_)(2, &v54, &__p, 0, 0);
      std::any::reset[abi:ne180100](&v54);
    }
    else
    {
      *((_DWORD *)v30 + 12) = v31;
      v30[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      __p.__r_.__value_.__r.__words[0] = 0;
    }
  }
  std::any::reset[abi:ne180100](&__p);
  objc_msgSend(*((id *)self + 80), "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "format");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isInterleaved");
  v53 = 2;
  v54.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
  v37 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)self + 95, &v53, (uint64_t)&std::piecewise_construct, &v54);
  v38 = (void (**)(uint64_t, _QWORD, std::string *, _QWORD, _QWORD))(v37 + 5);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
  __p.__r_.__value_.__l.__size_ = v36;
  if (&__p != (std::string *)(v37 + 5))
  {
    v39 = *v38;
    if (*v38)
    {
      *(_OWORD *)&v54.__r_.__value_.__l.__data_ = 0uLL;
      v39(2, v38, &v54, 0, 0);
      ((void (*)(uint64_t, std::string *, _QWORD, _QWORD, _QWORD))__p.__r_.__value_.__l.__data_)(2, &__p, v38, 0, 0);
      ((void (*)(uint64_t, std::string *, std::string *, _QWORD, _QWORD))v54.__r_.__value_.__l.__data_)(2, &v54, &__p, 0, 0);
      std::any::reset[abi:ne180100](&v54);
    }
    else
    {
      *((_BYTE *)v37 + 48) = v36;
      v37[5] = (uint64_t *)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
      __p.__r_.__value_.__r.__words[0] = 0;
    }
  }
  std::any::reset[abi:ne180100](&__p);

  -[AUPasscodeDecoder codecConfig](self, "codecConfig");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[APCCodecFactory createDecoderWithConfig:apcConfig:error:](APCCodecFactory, "createDecoderWithConfig:apcConfig:error:", v40, (char *)self + 760, a3);
  v41 = v54.__r_.__value_.__r.__words[0];
  v54.__r_.__value_.__r.__words[0] = 0;
  v42 = *((_QWORD *)self + 73);
  *((_QWORD *)self + 73) = v41;
  if (v42)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v42 + 8))(v42);
    v43 = v54.__r_.__value_.__r.__words[0];
    v54.__r_.__value_.__r.__words[0] = 0;
    if (v43)
      (*(void (**)(std::string::size_type))(*(_QWORD *)v43 + 8))(v43);
  }

  if (!*((_QWORD *)self + 73))
  {
    if (a3 && objc_msgSend(*a3, "code") == -7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -10868, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[AUAudioUnit setRenderResourcesAllocated:](self, "setRenderResourcesAllocated:", 0);
    goto LABEL_40;
  }
  v52.receiver = self;
  v52.super_class = (Class)AUPasscodeDecoder;
  v20 = -[AUAudioUnit allocateRenderResourcesAndReturnError:](&v52, sel_allocateRenderResourcesAndReturnError_, a3);
  if (v20)
  {
    v44 = (caulk::concurrent::messenger *)std::string::basic_string[abi:ne180100]<0>(&__p, "AUPasscodeDecoder messenger");
    v45 = caulk::concurrent::messenger::shared_logging_priority(v44);
    if (!*(_BYTE *)(v45 + 52))
      std::__throw_bad_optional_access[abi:ne180100]();
    v46 = v45 + 32;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v54, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      v55 = 1;
      v48 = *(_DWORD *)(v46 + 16);
      v56 = *(_OWORD *)v46;
      v57 = v48;
      v58 = 1;
      v59 = 0;
      v60 = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      v54 = __p;
      v55 = 1;
      v47 = *(_DWORD *)(v45 + 48);
      v56 = *(_OWORD *)v46;
      v57 = v47;
      v58 = 1;
      v59 = 0;
      v60 = 0;
    }
    v53 = 1;
    std::make_unique[abi:ne180100]<caulk::concurrent::messenger,caulk::concurrent::messenger::thread_strategy,caulk::thread::attributes const&>(&v53, (uint64_t)&v54, (uint64_t *)&__p);
    v49 = __p.__r_.__value_.__r.__words[0];
    __p.__r_.__value_.__r.__words[0] = 0;
    std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100]((uint64_t *)self + 72, v49);
    std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100]((uint64_t *)&__p, 0);
    v50 = *((_QWORD *)self + 101);
    *((_QWORD *)self + 101) = 0;
    if (v50)
      (*(void (**)(uint64_t))(*(_QWORD *)v50 + 8))(v50);
    if (v55 && SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v54.__r_.__value_.__l.__data_);
    LOBYTE(v20) = 1;
  }
  return v20;
}

- (void)setRenderingOffline:(BOOL)a3
{
  objc_super v3;

  *((_BYTE *)self + 800) = a3;
  v3.receiver = self;
  v3.super_class = (Class)AUPasscodeDecoder;
  -[AUAudioUnit setRenderingOffline:](&v3, sel_setRenderingOffline_);
}

- (void)deallocateRenderResources
{
  char *v3;
  void *v4;
  objc_super v5;

  v3 = (char *)self + 592;
  v4 = (void *)*((_QWORD *)self + 76);
  *((_QWORD *)self + 76) = 0;

  *((_QWORD *)v3 + 3) = 0;
  *((_QWORD *)v3 + 4) = 0;
  v5.receiver = self;
  v5.super_class = (Class)AUPasscodeDecoder;
  -[AUAudioUnit deallocateRenderResources](&v5, sel_deallocateRenderResources);
}

- (id)internalRenderBlock
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  _QWORD v13[14];

  v3 = (char *)self + 584;
  v4 = (char *)self + 592;
  v5 = (char *)self + 800;
  v6 = (char *)self + 808;
  v7 = (char *)self + 656;
  v8 = (char *)self + 680;
  v9 = (char *)self + 576;
  -[AUPasscodeDecoder dataHandler](self, "dataHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__AUPasscodeDecoder_internalRenderBlock__block_invoke;
  v13[3] = &unk_24F24BA80;
  v13[6] = v6;
  v13[7] = v3;
  v13[8] = v7;
  v13[9] = v5;
  v13[10] = v8;
  v13[11] = v9;
  v13[4] = v10;
  v13[5] = v4;
  v13[12] = (char *)self + 904;
  v13[13] = (char *)self + 816;
  v11 = (void *)MEMORY[0x22E2CB86C](v13);

  return v11;
}

uint64_t __40__AUPasscodeDecoder_internalRenderBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void *a8)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::mutex *v24;
  int v25;
  int v26;

  v26 = 0;
  result = BufferedInputBus::pullInput(*(BufferedInputBus **)(a1 + 40), (uint64_t)&v26, a3, a4, 0, a8);
  if (!(_DWORD)result)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
    if (!*((_QWORD *)a6 + 2))
    {
      v13 = *a6;
      if ((_DWORD)v13)
      {
        v14 = (uint64_t *)(v12 + 16);
        v15 = a6 + 4;
        do
        {
          v16 = *v14;
          v14 += 2;
          *v15 = v16;
          v15 += 2;
          --v13;
        }
        while (v13);
      }
    }
    v17 = *(_QWORD *)(v12 + 16);
    v25 = 256;
    v18 = **(_QWORD **)(a1 + 48);
    if (v18)
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v18 + 16))(v18, v17);
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, int *))(***(_QWORD ***)(a1 + 56) + 16))(**(_QWORD **)(a1 + 56), v17, a4, **(_QWORD **)(a1 + 64), &v25);
    v19 = v25;
    if (v25)
    {
      if (**(_BYTE **)(a1 + 72))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", **(_QWORD **)(a1 + 64), v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 32);
        if (v21)
          (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v20);

      }
      else
      {
        v22 = 0;
        do
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + v22);
          v22 += 8;
        }
        while (*(_BYTE *)(v23 + 60));
        memcpy(*(void **)(v23 + 32), **(const void ***)(a1 + 64), v25);
        *(_DWORD *)(v23 + 56) = v19;
        *(_BYTE *)(v23 + 60) = 1;
        caulk::concurrent::messenger::enqueue(**(caulk::concurrent::messenger ***)(a1 + 88), (caulk::concurrent::message *)v23);
      }
      if (**(_QWORD **)(a1 + 96))
      {
        v24 = *(std::mutex **)(a1 + 104);
        std::mutex::lock(v24);
        objc_msgSend(**(id **)(a1 + 96), "setCompletionTime:", *(_QWORD *)(**(_QWORD **)(a1 + 64) + v25));
        std::mutex::unlock(v24);
      }
    }
    return 0;
  }
  return result;
}

- (void)handleDecodedData:(void *)a3 ofLength:(int)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[6];

  objc_msgSend(*((id *)self + 99), "appendBytes:length:", a3, a4);
  v5 = objc_msgSend(*((id *)self + 99), "length");
  if (v5 >= objc_msgSend(*((id *)self + 112), "payloadLengthBytes"))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", *((_QWORD *)self + 99));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)self + 99), "setLength:", 0);
    -[AUPasscodeDecoder dataHandler](self, "dataHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AUPasscodeDecoder dispatchQueue](self, "dispatchQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
      {
        v9 = MEMORY[0x24BDAC9B8];
        v10 = MEMORY[0x24BDAC9B8];
      }
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __48__AUPasscodeDecoder_handleDecodedData_ofLength___block_invoke;
      v11[3] = &unk_24F24BAA8;
      v11[4] = self;
      v11[5] = v6;
      dispatch_async(v9, v11);
      if (!v8)

    }
  }
}

void __48__AUPasscodeDecoder_handleDecodedData_ofLength___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "dataHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)startAudioLogCapture
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = 0;
  objc_msgSend(*((id *)self + 80), "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampleRate");
  v8 = v5;
  v9 = xmmword_2295A2C00;
  v10 = 0x100000004;
  LODWORD(v11) = 32;

  if (NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::once != -1)
    dispatch_once(&NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::once, &__block_literal_global_101);
  v6 = NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction;
  if (NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction)
    v6 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction(69906, "/tmp/APCCaptures", "apc_capture", 1667327590, 0, &v8);
  v7 = *((_QWORD *)self + 101);
  *((_QWORD *)self + 101) = v6;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
}

- (void)stopAudioLogCapture
{
  uint64_t v3;

  v3 = *((_QWORD *)self + 101);
  *((_QWORD *)self + 101) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)*((_QWORD *)self + 110);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)self + 110, a3);
}

- (id)dataHandler
{
  return (id)*((_QWORD *)self + 111);
}

- (void)setDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 888);
}

- (AUPasscodeCodecConfiguration)codecConfig
{
  return (AUPasscodeCodecConfiguration *)*((_QWORD *)self + 112);
}

- (void)setCodecConfig:(id)a3
{
  objc_storeStrong((id *)self + 112, a3);
}

- (APCListenerResultData)resultData
{
  return (APCListenerResultData *)*((_QWORD *)self + 113);
}

- (void)setResultData:(id)a3
{
  objc_storeStrong((id *)self + 113, a3);
}

- (void).cxx_destruct
{
  uint64_t v3;
  char *v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_storeStrong((id *)self + 113, 0);
  objc_storeStrong((id *)self + 112, 0);
  objc_storeStrong((id *)self + 111, 0);
  objc_storeStrong((id *)self + 110, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 816));
  v3 = *((_QWORD *)self + 101);
  *((_QWORD *)self + 101) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  objc_storeStrong((id *)self + 99, 0);
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)self + 760, *((_QWORD **)self + 96));
  v4 = (char *)self + 680;
  for (i = 72; i != -8; i -= 8)
  {
    v6 = *(_QWORD *)&v4[i];
    *(_QWORD *)&v4[i] = 0;
    if (v6)
      std::default_delete<DecodedDataMessage>::operator()[abi:ne180100]((uint64_t)&v4[i], v6);
  }
  v7 = (void *)*((_QWORD *)self + 82);
  if (v7)
  {
    *((_QWORD *)self + 83) = v7;
    operator delete(v7);
  }
  objc_storeStrong((id *)self + 81, 0);
  objc_storeStrong((id *)self + 80, 0);
  objc_storeStrong((id *)self + 79, 0);

  v8 = *((_QWORD *)self + 73);
  *((_QWORD *)self + 73) = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100]((uint64_t *)self + 72, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 72) = 0;
  *((_QWORD *)self + 73) = 0;
  *((_QWORD *)self + 74) = 0;
  *((_DWORD *)self + 150) = 0;
  *((_QWORD *)self + 77) = 0;
  *((_QWORD *)self + 78) = 0;
  *((_QWORD *)self + 76) = 0;
  *((_QWORD *)self + 83) = 0;
  *((_QWORD *)self + 84) = 0;
  *((_QWORD *)self + 82) = 0;
  *(_OWORD *)((char *)self + 680) = 0u;
  *(_OWORD *)((char *)self + 696) = 0u;
  *(_OWORD *)((char *)self + 712) = 0u;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *((_QWORD *)self + 97) = 0;
  *((_QWORD *)self + 96) = 0;
  *((_QWORD *)self + 95) = (char *)self + 768;
  *((_QWORD *)self + 101) = 0;
  *((_QWORD *)self + 102) = 850045863;
  *(_OWORD *)((char *)self + 824) = 0u;
  *(_OWORD *)((char *)self + 840) = 0u;
  *(_OWORD *)((char *)self + 856) = 0u;
  *((_QWORD *)self + 109) = 0;
  return self;
}

@end
