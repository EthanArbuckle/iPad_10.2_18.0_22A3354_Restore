@implementation APCCodecFactory

+ (unique_ptr<APCDecoderBase,)createDecoderWithConfig:(id)a3 apcConfig:(void *)a4 error:(id *)a5
{
  APCNullDecoder **v5;
  APCNullDecoder **v8;
  NullCodecConfiguration *v9;
  EchoCodeDecoder *v10;
  NullCodecConfiguration *v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t **v24;
  void (**v25)(uint64_t, _QWORD, _DWORD **, _QWORD, _QWORD);
  void (*v26)(uint64_t, _QWORD, _DWORD **, _QWORD, _QWORD);
  APCNullDecoder *v27;
  unique_ptr<APCDecoderBase, std::default_delete<APCDecoderBase>> v28;
  EchoCodeDecoder **v29;
  uint64_t **v30;
  id *v31;
  NullCodecConfiguration *v32;
  unsigned int v33;
  EchoCodeDecoder *v34;
  void (*v35[4])(uint64_t);
  void (*v36[4])(uint64_t);
  void (*v37[4])(uint64_t);
  void (*v38[4])(uint64_t);
  void (*v39)(int);
  int v40;
  int v41;
  void (*v42)(int);
  int v43;
  int v44;
  void (*v45)(int);
  int v46;
  int v47;
  _DWORD *v48[6];

  v8 = v5;
  v48[4] = *(_DWORD **)MEMORY[0x24BDAC8D0];
  v9 = (NullCodecConfiguration *)a3;
  *v8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v8;
    v10 = (EchoCodeDecoder *)operator new();
    EchoCodeDecoder::EchoCodeDecoder(v10);
    v34 = v10;
    v11 = v9;
    v32 = v9;
    v42 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v44 = 0;
    v43 = -[NullCodecConfiguration frameSize](v11, "frameSize");
    v12 = EchoCodeDecoder::setParams((uint64_t)v10, 0x64u, (void (**)(uint64_t))&v42);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v42);
    v39 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v41 = 0;
    v40 = -[NullCodecConfiguration numFrameRepeat](v11, "numFrameRepeat");
    v13 = EchoCodeDecoder::setParams((uint64_t)v10, 0x65u, (void (**)(uint64_t))&v39);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v39);
    -[NullCodecConfiguration delayForBit0](v11, "delayForBit0");
    v38[0] = (void (*)(uint64_t))std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
    v38[1] = (void (*)(uint64_t))v14;
    v15 = EchoCodeDecoder::setParams((uint64_t)v10, 0x69u, v38);
    v16 = v12;
    v30 = (uint64_t **)a4;
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v38);
    -[NullCodecConfiguration delayForBit1](v11, "delayForBit1");
    v37[0] = (void (*)(uint64_t))std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
    v37[1] = (void (*)(uint64_t))v17;
    v18 = EchoCodeDecoder::setParams((uint64_t)v10, 0x6Au, v37);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v37);
    -[NullCodecConfiguration hpfCutOffFreq](v11, "hpfCutOffFreq");
    v36[0] = (void (*)(uint64_t))std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
    v36[1] = (void (*)(uint64_t))v19;
    v20 = EchoCodeDecoder::setParams((uint64_t)v10, 0x6Fu, v36);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v36);
    v31 = a5;
    v35[1] = (void (*)(uint64_t))-[NullCodecConfiguration algorithmVersionNumber](v11, "algorithmVersionNumber");
    v35[0] = (void (*)(uint64_t))std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v21 = EchoCodeDecoder::setParams((uint64_t)v10, 0x71u, v35);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v35);
    v22 = -[AUPasscodeCodecConfiguration payloadLengthBytes](v11, "payloadLengthBytes");
    v23 = v13 | v16 | v15 | v18 | v20 | v21;
    if (!v23 && v22 >= 1)
    {
      v33 = 3;
      v48[0] = &v33;
      v24 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v30, &v33, (uint64_t)&std::piecewise_construct, v48);
      v25 = (void (**)(uint64_t, _QWORD, _DWORD **, _QWORD, _QWORD))(v24 + 5);
      v47 = 0;
      v46 = v22;
      v45 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      if (&v45 != (void (**)(int))(v24 + 5))
      {
        v26 = *v25;
        if (*v25)
        {
          v48[0] = 0;
          v48[1] = 0;
          v26(2, v25, v48, 0, 0);
          ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v45)(2, &v45, v25, 0, 0);
          ((void (*)(uint64_t, _DWORD **, void (**)(int), _QWORD, _QWORD))v48[0])(2, v48, &v45, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v48);
        }
        else
        {
          *((_DWORD *)v24 + 12) = v22;
          v24[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
          v45 = 0;
        }
      }
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v45);
      v23 = EchoCodeDecoder::initialize((uint64_t)v10, (uint64_t)v30);
    }
    if (v23)
    {
      v9 = v32;
      if (v31)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v23, 0);
        v9 = v32;
        *v31 = (id)objc_claimAutoreleasedReturnValue();
      }

      EchoCodeDecoder::~EchoCodeDecoder(v10);
      MEMORY[0x22E2CB548]();
    }
    else
    {
      *v29 = v10;

      v9 = v32;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = (APCNullDecoder *)operator new();
        APCNullDecoder::APCNullDecoder(v27, v9);
        *v8 = v27;
      }
    }
  }

  return v28;
}

+ (unique_ptr<APCEncoderBase,)createEncoderWithConfig:(id)a3 apcConfig:(void *)a4 payloadData:(id)a5
{
  APCNullEncoder **v5;
  APCNullEncoder **v8;
  NullCodecConfiguration *v9;
  id v10;
  NullCodecConfiguration *v11;
  EchoCodeEncoder *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  float v19;
  float v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t **v31;
  void (**v32)(uint64_t, _QWORD, _DWORD **, _QWORD, _QWORD);
  void (*v33)(uint64_t, _QWORD, _DWORD **, _QWORD, _QWORD);
  APCNullEncoder *v34;
  EchoCodeEncoder *v35;
  EchoCodeEncoder *v36;
  unique_ptr<APCEncoderBase, std::default_delete<APCEncoderBase>> v37;
  EchoCodeEncoder **v38;
  uint64_t **v39;
  int v40;
  int v41;
  int v42;
  void *v43;
  NullCodecConfiguration *v44;
  unsigned int v45;
  void *__p;
  void *v47;
  uint64_t v48;
  EchoCodeEncoder *v49;
  void (*v50[4])(uint64_t);
  void (*v51[4])(uint64_t);
  void (*v52[4])(uint64_t);
  void (*v53)(int);
  float v54;
  int v55;
  void (*v56)(int);
  float v57;
  int v58;
  void (*v59)(int);
  int v60;
  int v61;
  void (*v62)(int);
  int v63;
  int v64;
  void (*v65)(int);
  int v66;
  int v67;
  void (*v68)(int);
  int v69;
  int v70;
  void (*v71)(int);
  int v72;
  int v73;
  void (*v74)(int);
  int v75;
  int v76;
  _DWORD *v77[6];

  v8 = v5;
  v77[4] = *(_DWORD **)MEMORY[0x24BDAC8D0];
  v9 = (NullCodecConfiguration *)a3;
  v10 = a5;
  *v8 = 0;
  v44 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v8;
    v11 = v9;
    v43 = v10;
    v12 = (EchoCodeEncoder *)operator new();
    EchoCodeEncoder::EchoCodeEncoder(v12);
    v49 = v12;
    v71 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v73 = 0;
    v72 = -[NullCodecConfiguration frameSize](v11, "frameSize");
    v13 = EchoCodeEncoder::setParams((uint64_t)v12, 0x64u, (void (**)(uint64_t))&v71);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v71);
    v68 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v70 = 0;
    v69 = -[NullCodecConfiguration numFrameRepeat](v11, "numFrameRepeat");
    v14 = EchoCodeEncoder::setParams((uint64_t)v12, 0x65u, (void (**)(uint64_t))&v68);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v68);
    -[NullCodecConfiguration delayForBit0](v11, "delayForBit0");
    v65 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
    v67 = 0;
    v66 = v15;
    v16 = EchoCodeEncoder::setParams((uint64_t)v12, 0x69u, (void (**)(uint64_t))&v65);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v65);
    -[NullCodecConfiguration delayForBit1](v11, "delayForBit1");
    v62 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
    v64 = 0;
    v63 = v17;
    v42 = EchoCodeEncoder::setParams((uint64_t)v12, 0x6Au, (void (**)(uint64_t))&v62);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v62);
    v59 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v61 = 0;
    v60 = -[NullCodecConfiguration randomSeed](v11, "randomSeed");
    v18 = EchoCodeEncoder::setParams((uint64_t)v12, 0x6Eu, (void (**)(uint64_t))&v59);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v59);
    -[NullCodecConfiguration echoGainDB](v11, "echoGainDB");
    v56 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
    v58 = 0;
    v57 = __exp10f(v19 * 0.05);
    v41 = EchoCodeEncoder::setParams((uint64_t)v12, 0x66u, (void (**)(uint64_t))&v56);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v56);
    -[NullCodecConfiguration noiseGainDB](v11, "noiseGainDB");
    v40 = v18;
    v21 = v16;
    v22 = v14;
    v23 = v13;
    v53 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
    v55 = 0;
    v54 = __exp10f(v20 * 0.05);
    v24 = EchoCodeEncoder::setParams((uint64_t)v12, 0x67u, (void (**)(uint64_t))&v53);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v53);
    -[NullCodecConfiguration hpfCutOffFreq](v11, "hpfCutOffFreq");
    v52[0] = (void (*)(uint64_t))std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
    v52[1] = (void (*)(uint64_t))v25;
    v26 = EchoCodeEncoder::setParams((uint64_t)v12, 0x6Fu, v52);
    v39 = (uint64_t **)a4;
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v52);
    v51[0] = (void (*)(uint64_t))std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
    v51[1] = (void (*)(uint64_t))-[NullCodecConfiguration hfNoiseFillingFlag](v11, "hfNoiseFillingFlag");
    v27 = EchoCodeEncoder::setParams((uint64_t)v12, 0x70u, v51);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v51);
    v50[1] = (void (*)(uint64_t))-[NullCodecConfiguration algorithmVersionNumber](v11, "algorithmVersionNumber");
    v50[0] = (void (*)(uint64_t))std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    v28 = EchoCodeEncoder::setParams((uint64_t)v12, 0x71u, v50);
    std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v50);
    v29 = -[AUPasscodeCodecConfiguration payloadLengthBytes](v11, "payloadLengthBytes");
    __p = 0;
    v47 = 0;
    v30 = v22 | v23 | v21 | v42 | v40 | v41 | v24 | v26 | v27 | v28;
    v48 = 0;
    LOBYTE(v77[0]) = 0;
    if (v29)
    {
      v10 = v43;
      std::vector<unsigned char>::__append(&__p, v29, v77);
      if (__p != v47)
      {
        objc_msgSend(v43, "getBytes:length:", __p, v29);
        v45 = 3;
        v77[0] = &v45;
        v31 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v39, &v45, (uint64_t)&std::piecewise_construct, v77);
        v32 = (void (**)(uint64_t, _QWORD, _DWORD **, _QWORD, _QWORD))(v31 + 5);
        v76 = 0;
        v75 = v29;
        v74 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
        if (&v74 != (void (**)(int))(v31 + 5))
        {
          v33 = *v32;
          if (*v32)
          {
            v77[0] = 0;
            v77[1] = 0;
            v33(2, v32, v77, 0, 0);
            ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v74)(2, &v74, v32, 0, 0);
            ((void (*)(uint64_t, _DWORD **, void (**)(int), _QWORD, _QWORD))v77[0])(2, v77, &v74, 0, 0);
            std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v77);
          }
          else
          {
            *((_DWORD *)v31 + 12) = v29;
            v31[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
            v74 = 0;
          }
        }
        std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v74);
        v30 = EchoCodeEncoder::initialize((uint64_t)v49, (uint64_t)v39);
        EchoCodeEncoder::setPasscode(v49, (const unsigned __int8 *)__p, v29);
      }
    }
    else
    {
      v10 = v43;
    }
    if (!v30)
    {
      v35 = v49;
      v49 = 0;
      *v38 = v35;
    }
    if (__p)
    {
      v47 = __p;
      operator delete(__p);
    }
    v36 = v49;
    v49 = 0;
    if (v36)
      std::default_delete<EchoCodeEncoder>::operator()[abi:ne180100]((uint64_t)&v49, (uint64_t)v36);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = (APCNullEncoder *)operator new();
        APCNullEncoder::APCNullEncoder(v34, v9);
        *v8 = v34;
      }
    }
  }

  return v37;
}

+ (float)evaluateCarrierWithConfig:(id)a3 carrier:(id)a4 embeddingResult:(id *)a5
{
  id v7;
  id v8;
  float v9;
  id v10;
  EchoCodeEncoder *v11;
  unsigned int v12;
  uint64_t **v13;
  void (**v14)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v15)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  unsigned int v16;
  uint64_t **v17;
  void (**v18)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v19)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  unsigned int v20;
  uint64_t **v21;
  void (**v22)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v23)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  unsigned int v24;
  uint64_t **v25;
  void (**v26)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v27)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  float v28;
  float v29;
  uint64_t **v30;
  void (**v31)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v32)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  float v33;
  float v34;
  uint64_t **v35;
  void (**v36)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v37)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  unsigned int v38;
  unsigned int v39;
  uint64_t **v40;
  void (**v41)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v42)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  unsigned int v43;
  unsigned int v44;
  uint64_t **v45;
  void (**v46)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v47)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  unsigned __int8 v48;
  uint64_t **v49;
  void (**v50)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v51)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  unsigned int v52;
  uint64_t **v53;
  void (**v54)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v55)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  unsigned int v56;
  uint64_t **v57;
  void (**v58)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  void (*v59)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD);
  _QWORD *v60;
  _QWORD **v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD **v64;
  unsigned int v65;
  unsigned int *v66;
  unsigned int v67;
  _QWORD **v68;
  _QWORD *v69;
  _QWORD **v70;
  unsigned int v71;
  _QWORD *v72;
  _QWORD *v73;
  unsigned int *v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  uint64_t v82;
  unsigned int v84;
  uint64_t *v85;
  _QWORD *v86[2];
  EchoCodeEncoder *v87;
  void (*v88)(int);
  uint64_t v89;
  unsigned int *v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  v9 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_78;
  v10 = v7;
  v11 = (EchoCodeEncoder *)operator new();
  EchoCodeEncoder::EchoCodeEncoder(v11);
  v86[1] = 0;
  v87 = v11;
  v85 = (uint64_t *)v86;
  v86[0] = 0;
  v12 = objc_msgSend(v10, "sampleRate");
  v84 = 0;
  v90 = &v84;
  v13 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v14 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v13 + 5);
  v88 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  v89 = v12;
  if (&v88 != (void (**)(int))(v13 + 5))
  {
    v15 = *v14;
    if (*v14)
    {
      v90 = 0;
      v91 = 0;
      v15(2, v14, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v14, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_DWORD *)v13 + 12) = v12;
      v13[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  v16 = objc_msgSend(v10, "payloadLengthBytes");
  v84 = 3;
  v90 = &v84;
  v17 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v18 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v17 + 5);
  v88 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  v89 = v16;
  if (&v88 != (void (**)(int))(v17 + 5))
  {
    v19 = *v18;
    if (*v18)
    {
      v90 = 0;
      v91 = 0;
      v19(2, v18, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v18, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_DWORD *)v17 + 12) = v16;
      v17[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  v20 = objc_msgSend(v10, "frameSize");
  v84 = 100;
  v90 = &v84;
  v21 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v22 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v21 + 5);
  v88 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  v89 = v20;
  if (&v88 != (void (**)(int))(v21 + 5))
  {
    v23 = *v22;
    if (*v22)
    {
      v90 = 0;
      v91 = 0;
      v23(2, v22, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v22, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_DWORD *)v21 + 12) = v20;
      v21[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  v24 = objc_msgSend(v10, "numFrameRepeat");
  v84 = 101;
  v90 = &v84;
  v25 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v26 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v25 + 5);
  v88 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  v89 = v24;
  if (&v88 != (void (**)(int))(v25 + 5))
  {
    v27 = *v26;
    if (*v26)
    {
      v90 = 0;
      v91 = 0;
      v27(2, v26, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v26, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_DWORD *)v25 + 12) = v24;
      v25[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  objc_msgSend(v10, "echoGainDB");
  v29 = __exp10f(v28 * 0.05);
  v84 = 102;
  v90 = &v84;
  v30 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v31 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v30 + 5);
  v88 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
  v89 = LODWORD(v29);
  if (&v88 != (void (**)(int))(v30 + 5))
  {
    v32 = *v31;
    if (*v31)
    {
      v90 = 0;
      v91 = 0;
      v32(2, v31, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v31, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((float *)v30 + 12) = v29;
      v30[5] = (uint64_t *)std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  objc_msgSend(v10, "noiseGainDB");
  v34 = __exp10f(v33 * 0.05);
  v84 = 103;
  v90 = &v84;
  v35 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v36 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v35 + 5);
  v88 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
  v89 = LODWORD(v34);
  if (&v88 != (void (**)(int))(v35 + 5))
  {
    v37 = *v36;
    if (*v36)
    {
      v90 = 0;
      v91 = 0;
      v37(2, v36, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v36, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((float *)v35 + 12) = v34;
      v35[5] = (uint64_t *)std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  objc_msgSend(v10, "syncDetectThreshold");
  v39 = v38;
  v84 = 109;
  v90 = &v84;
  v40 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v41 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v40 + 5);
  v88 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
  v89 = v39;
  if (&v88 != (void (**)(int))(v40 + 5))
  {
    v42 = *v41;
    if (*v41)
    {
      v90 = 0;
      v91 = 0;
      v42(2, v41, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v41, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_DWORD *)v40 + 12) = v39;
      v40[5] = (uint64_t *)std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  objc_msgSend(v10, "hpfCutOffFreq");
  v44 = v43;
  v84 = 111;
  v90 = &v84;
  v45 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v46 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v45 + 5);
  v88 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
  v89 = v44;
  if (&v88 != (void (**)(int))(v45 + 5))
  {
    v47 = *v46;
    if (*v46)
    {
      v90 = 0;
      v91 = 0;
      v47(2, v46, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v46, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_DWORD *)v45 + 12) = v44;
      v45[5] = (uint64_t *)std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  v48 = objc_msgSend(v10, "hfNoiseFillingFlag");
  v84 = 112;
  v90 = &v84;
  v49 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v50 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v49 + 5);
  v88 = std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
  v89 = v48;
  if (&v88 != (void (**)(int))(v49 + 5))
  {
    v51 = *v50;
    if (*v50)
    {
      v90 = 0;
      v91 = 0;
      v51(2, v50, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v50, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_BYTE *)v49 + 48) = v48;
      v49[5] = (uint64_t *)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  v52 = objc_msgSend(v10, "randomSeed");
  v84 = 110;
  v90 = &v84;
  v53 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v54 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v53 + 5);
  v88 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  v89 = v52;
  if (&v88 != (void (**)(int))(v53 + 5))
  {
    v55 = *v54;
    if (*v54)
    {
      v90 = 0;
      v91 = 0;
      v55(2, v54, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v54, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_DWORD *)v53 + 12) = v52;
      v53[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  v56 = objc_msgSend(v10, "algorithmVersionNumber");
  v84 = 113;
  v90 = &v84;
  v57 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v85, &v84, (uint64_t)&std::piecewise_construct, &v90);
  v58 = (void (**)(uint64_t, _QWORD, unsigned int **, _QWORD, _QWORD))(v57 + 5);
  v88 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  v89 = v56;
  if (&v88 != (void (**)(int))(v57 + 5))
  {
    v59 = *v58;
    if (*v58)
    {
      v90 = 0;
      v91 = 0;
      v59(2, v58, &v90, 0, 0);
      ((void (*)(uint64_t, void (**)(int), _QWORD, _QWORD, _QWORD))v88)(2, &v88, v58, 0, 0);
      ((void (*)(uint64_t, unsigned int **, void (**)(int), _QWORD, _QWORD))v90)(2, &v90, &v88, 0, 0);
      std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v90);
    }
    else
    {
      *((_DWORD *)v57 + 12) = v56;
      v57[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      v88 = 0;
    }
  }
  std::any::reset[abi:ne180100]((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&v88);
  v9 = EchoCodeEncoder::evaluateCarrier((uint64_t)v87, *(const float **)objc_msgSend(v8, "floatChannelData"), objc_msgSend(v8, "frameLength"), &v85);
  if (a5)
  {
    v60 = v86[0];
    if (v86[0])
    {
      v61 = v86;
      v62 = v86[0];
      do
      {
        v63 = v62;
        v64 = v61;
        v65 = *((_DWORD *)v62 + 8);
        if (v65 >= 0x6C)
          v61 = (_QWORD **)v62;
        else
          ++v62;
        v62 = (_QWORD *)*v62;
      }
      while (v62);
      if (v61 == v86)
        goto LABEL_60;
      if (v65 < 0x6C)
        v63 = v64;
      if (*((_DWORD *)v63 + 8) > 0x6Cu)
      {
LABEL_60:
        v67 = 0;
      }
      else
      {
        v66 = (unsigned int *)std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))v61 + 5);
        if (!v66)
          std::__throw_bad_any_cast[abi:ne180100]();
        v67 = *v66;
        v60 = v86[0];
        if (!v86[0])
          goto LABEL_73;
      }
      v68 = v86;
      do
      {
        v69 = v60;
        v70 = v68;
        v71 = *((_DWORD *)v60 + 8);
        v72 = v60 + 1;
        if (v71 >= 0x3E8)
        {
          v72 = v69;
          v68 = (_QWORD **)v69;
        }
        v60 = (_QWORD *)*v72;
      }
      while (v60);
      if (v68 != v86)
      {
        v73 = v71 >= 0x3E8 ? v69 : v70;
        if (*((_DWORD *)v73 + 8) <= 0x3E8u)
        {
          v74 = (unsigned int *)std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))v68 + 5);
          if (!v74)
            std::__throw_bad_any_cast[abi:ne180100]();
          v75 = *v74;
          goto LABEL_74;
        }
      }
    }
    else
    {
      v67 = 0;
    }
LABEL_73:
    v75 = 0;
LABEL_74:
    v76 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    *a5 = v76;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v67);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 108);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKey:", v77, v78);

    v79 = *a5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v75);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1000);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setObject:forKey:", v80, v81);

  }
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)&v85, v86[0]);
  v82 = (uint64_t)v87;
  v87 = 0;
  if (v82)
    std::default_delete<EchoCodeEncoder>::operator()[abi:ne180100]((uint64_t)&v87, v82);

LABEL_78:
  return v9;
}

+ (id)createBestConfigForCapability:(id)a3
{
  id v3;
  NSObject *v4;
  EchoCodecConfiguration *v5;
  NSObject *v6;
  unint64_t v7;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    APCLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_229580000, v4, OS_LOG_TYPE_INFO, "Find an EchoCodec Capabiltity data", (uint8_t *)&v9, 2u);
    }

    v5 = -[EchoCodecConfiguration initWithCapabilityData:]([EchoCodecConfiguration alloc], "initWithCapabilityData:", v3);
    APCLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = -[EchoCodecConfiguration algorithmVersionNumber](v5, "algorithmVersionNumber");
      v9 = 134217984;
      v10 = (float)((float)v7 / 100.0);
      _os_log_impl(&dword_229580000, v6, OS_LOG_TYPE_INFO, "EchoCodec algorithm version: %3.2f", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
