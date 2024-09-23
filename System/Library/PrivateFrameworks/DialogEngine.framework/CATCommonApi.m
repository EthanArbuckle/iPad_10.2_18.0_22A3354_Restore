@implementation CATCommonApi

+ (id)NSErrorFromString:(id)a3 errorCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("success")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", &stru_1E793AF80) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v16[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v5, &stru_1E793AF80, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v16[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E793AF80, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.DialogEngine"), 0, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (void)ConfigureDEExecutor:(id)a3 parameters:(id)a4 globalParameters:(id)a5 catId:(id)a6 callback:(id)a7 options:(int)a8
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void **v33;
  void *v34;
  void *v35;
  std::string *v36;
  __int128 v37;
  std::string *v38;
  __int128 v39;
  uint64_t v40;
  id v41;
  void **v42;
  void *v43;
  void *v44;
  uint64_t v45;
  std::string *v46;
  __int128 v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  void *v51[2];
  char v52;
  std::string v53;
  void *__p[2];
  std::string::size_type v55;

  v8 = *(_QWORD *)&a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(v15, "objectForKey:", CFSTR("locale"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCatId:", v16);
  objc_msgSend(v13, "setParameters:", v14);
  objc_msgSend(v15, "objectForKey:", CFSTR("globalParameters"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setGlobalParameters:", v18);

  objc_msgSend(v13, "setLocale:", v48);
  objc_msgSend(v15, "objectForKey:", CFSTR("customPronunciations"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCustomPronunciations:", v19);

  objc_msgSend(v15, "objectForKey:", CFSTR("userSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserSettings:", v20);

  objc_msgSend(v13, "setDebug:", (CATDebugMode & v8) != 0);
  objc_msgSend(v13, "setTest:", (CATTestMode & v8) != 0);
  objc_msgSend(v13, "setResetState:", (CATResetState & v8) != 0);
  objc_msgSend(v13, "setEnableUpdates:", +[CATCommonApi UpdatesEnabled:](CATCommonApi, "UpdatesEnabled:", v8));
  objc_msgSend(v13, "setCreateTrace:", (CATCreateTrace & v8) != 0);
  objc_msgSend(v13, "setVisual:", (CATVisualMode & v8) != 0);
  objc_msgSend(v13, "setDeterministic:", (CATDeterministic & v8) != 0);
  objc_msgSend(v13, "setIsSpotlight:", (CATIsSpotlight & v8) != 0);
  objc_msgSend(v13, "setIsLabelMode:", (CATLabelMode & v8) != 0);
  objc_msgSend(v13, "setSwitchFallthrough:", (CATSwitchFallthrough & v8) != 0);
  objc_msgSend(v13, "setIncludeKeywords:", (CATIncludeKeywords & v8) != 0);
  objc_msgSend(v15, "objectForKey:", CFSTR("multiuser"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    v23 = objc_msgSend(v21, "BOOLValue");
  else
    v23 = 0;
  objc_msgSend(v13, "setMultiuser:", v23);
  objc_msgSend(v15, "objectForKey:", CFSTR("grounding"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    v26 = objc_msgSend(v24, "BOOLValue");
  else
    v26 = 0;
  objc_msgSend(v13, "setGrounding:", v26);
  objc_msgSend(v15, "objectForKey:", CFSTR("gender"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVoiceGender:", v27);

  objc_msgSend(v15, "objectForKey:", CFSTR("dialogMetadata"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDialogMetadata:", v28);

  objc_msgSend(v15, "objectForKey:", CFSTR("interactionId"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInteractionId:", v29);

  objc_msgSend(v15, "objectForKey:", CFSTR("executionRequestId"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExecutionRequestId:", v30);

  objc_msgSend(v15, "objectForKey:", CFSTR("responseMode"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setResponseMode:", v31);

  std::string::basic_string[abi:ne180100]<0>(v51, "randomSeed");
  v32 = v15;
  if (v52 >= 0)
    v33 = v51;
  else
    v33 = (void **)v51[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
LABEL_19:
    v40 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    std::operator+<char>();
    v38 = std::string::append(&v53, "' because it is not a number");
    v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    v55 = v38->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 1u);
    goto LABEL_15;
  }
  if ((unint64_t)objc_msgSend(v35, "integerValue") >> 32)
  {
    std::operator+<char>();
    v36 = std::string::append(&v53, "' because it is out of range");
    v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
    v55 = v36->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v37;
    v36->__r_.__value_.__l.__size_ = 0;
    v36->__r_.__value_.__r.__words[2] = 0;
    v36->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 1u);
LABEL_15:
    if (SHIBYTE(v55) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v53.__r_.__value_.__l.__data_);
    goto LABEL_19;
  }
  v40 = objc_msgSend(v35, "unsignedIntValue");
LABEL_20:

  objc_msgSend(v13, "setRandomSeed:", v40);
  if (v52 < 0)
    operator delete(v51[0]);
  std::string::basic_string[abi:ne180100]<0>(v51, "currentTime");
  v41 = v32;
  if (v52 >= 0)
    v42 = v51;
  else
    v42 = (void **)v51[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = objc_msgSend(v44, "longValue");
      goto LABEL_33;
    }
    std::operator+<char>();
    v46 = std::string::append(&v53, "' because it is not a number");
    v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
    v55 = v46->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v47;
    v46->__r_.__value_.__l.__size_ = 0;
    v46->__r_.__value_.__r.__words[2] = 0;
    v46->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 1u);
    if (SHIBYTE(v55) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v53.__r_.__value_.__l.__data_);
  }
  v45 = 0;
LABEL_33:

  objc_msgSend(v13, "setCurrentTime:", v45);
  if ((v52 & 0x80000000) == 0)
  {
    if (!v17)
      goto LABEL_38;
    goto LABEL_37;
  }
  operator delete(v51[0]);
  if (v17)
  {
LABEL_37:
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __87__CATCommonApi_ConfigureDEExecutor_parameters_globalParameters_catId_callback_options___block_invoke;
    v49[3] = &unk_1E792A290;
    v50 = v17;
    objc_msgSend(v13, "setCallback:", v49);

  }
LABEL_38:

}

+ (BOOL)UpdatesEnabled:(int)a3
{
  return (CATDisableUpdates & a3) == 0;
}

+ (id)DEResultToCATResult:(id)a3 catId:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id obj;
  __CFString *v75;
  __CFString *v76;
  id v77;
  __CFString *v78;
  __CFString *v79;
  uint64_t v80;
  uint64_t v81;
  __CFString *v82;
  uint64_t v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v57 = a4;
  v73 = (id)objc_opt_new();
  v71 = (void *)objc_opt_new();
  v72 = (void *)objc_opt_new();
  v70 = (void *)objc_opt_new();
  v68 = (void *)objc_opt_new();
  v69 = (void *)objc_opt_new();
  v67 = (void *)objc_opt_new();
  v66 = (void *)objc_opt_new();
  v64 = (void *)objc_opt_new();
  v62 = (void *)objc_opt_new();
  if (v59 && (objc_msgSend(v59, "meta"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v59, "meta");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v56 = (void *)objc_opt_new();
  }
  v53 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  v55 = (void *)objc_opt_new();
  v58 = (void *)objc_opt_new();
  v60 = (void *)objc_opt_new();
  v63 = (void *)objc_opt_new();
  v61 = (void *)objc_opt_new();
  v65 = (void *)objc_opt_new();
  objc_msgSend(v73, "setCatId:", v57);
  objc_msgSend(v73, "setSpeak:", v71);
  objc_msgSend(v73, "setPrint:", v72);
  objc_msgSend(v73, "setDialogId:", v70);
  objc_msgSend(v73, "setMeta:", v56);
  objc_msgSend(v73, "setCaptionSpeak:", v68);
  objc_msgSend(v73, "setCaptionPrint:", v69);
  objc_msgSend(v73, "setPrintOnly:", v67);
  objc_msgSend(v73, "setSpokenOnly:", v66);
  objc_msgSend(v73, "setSpokenOnlyDefined:", v64);
  objc_msgSend(v73, "setIsApprovedForGrading:", v62);
  objc_msgSend(v73, "setVisualId:", 0);
  objc_msgSend(v73, "setVisualParameters:", 0);
  objc_msgSend(v73, "setVisualResponse:", 0);
  objc_msgSend(v73, "setUnfilteredPrint:", v54);
  objc_msgSend(v73, "setUnfilteredSpeak:", v53);
  objc_msgSend(v73, "setUnfilteredCaptionPrint:", v55);
  objc_msgSend(v73, "setUnfilteredCaptionSpeak:", v58);
  objc_msgSend(v73, "setRedactedSpeak:", v60);
  objc_msgSend(v73, "setRedactedPrint:", v63);
  objc_msgSend(v73, "setRedactedCaptionSpeak:", v65);
  objc_msgSend(v73, "setRedactedCaptionPrint:", v61);
  if (!v59)
    goto LABEL_76;
  objc_msgSend(v59, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_61;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend(v59, "response");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  if (!v8)
    goto LABEL_60;
  v80 = *(_QWORD *)v90;
  do
  {
    v81 = v8;
    for (i = 0; i != v81; ++i)
    {
      if (*(_QWORD *)v90 != v80)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
      objc_msgSend(v10, "objectForKey:", CFSTR("type"), v53);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v84, "isEqualToString:", CFSTR("visual")))
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("data"));
        v83 = objc_claimAutoreleasedReturnValue();
        if (!v83)
        {
          siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Can't get base64 data from visual response", v11);
LABEL_19:
          v21 = 0;
          goto LABEL_58;
        }
        v82 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v83, 0);
        objc_msgSend(v73, "setVisualResponse:");
        siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Added visual data to response", v12);
      }
      else
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("content"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13)
          goto LABEL_19;
        v83 = (uint64_t)v13;
        objc_msgSend(v13, "objectForKey:", CFSTR("print"));
        v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("speak"));
        v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("redactedPrint"));
        v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("redactedSpeak"));
        v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("id"));
        v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("caption"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("print"));
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("speak"));
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("redactedPrint"));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("redactedSpeak"));
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = &stru_1E793AF80;
          v18 = &stru_1E793AF80;
          v19 = &stru_1E793AF80;
          v20 = &stru_1E793AF80;
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("printOnly"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("spokenOnly"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0C9AAB0];
        if (!v23)
          v24 = (void *)MEMORY[0x1E0C9AAA0];
        v77 = v24;
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("isApprovedForGrading"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v82)
          v26 = v82;
        else
          v26 = &stru_1E793AF80;
        objc_msgSend(v72, "addObject:", v26);
        if (v79)
          v27 = v79;
        else
          v27 = &stru_1E793AF80;
        objc_msgSend(v71, "addObject:", v27);
        if (v78)
          v28 = v78;
        else
          v28 = &stru_1E793AF80;
        objc_msgSend(v70, "addObject:", v28);
        if (v17)
          v29 = v17;
        else
          v29 = &stru_1E793AF80;
        objc_msgSend(v69, "addObject:", v29);
        if (v18)
          v30 = v18;
        else
          v30 = &stru_1E793AF80;
        objc_msgSend(v68, "addObject:", v30);
        objc_msgSend(v67, "addObject:", v22);
        objc_msgSend(v66, "addObject:", v23);
        objc_msgSend(v64, "addObject:", v77);
        objc_msgSend(v62, "addObject:", v25);
        if (v76)
          v31 = v76;
        else
          v31 = &stru_1E793AF80;
        objc_msgSend(v63, "addObject:", v31);
        if (v75)
          v32 = v75;
        else
          v32 = &stru_1E793AF80;
        objc_msgSend(v60, "addObject:", v32);
        if (v19)
          v33 = v19;
        else
          v33 = &stru_1E793AF80;
        objc_msgSend(v61, "addObject:", v33);
        if (v20)
          v34 = v20;
        else
          v34 = &stru_1E793AF80;
        objc_msgSend(v65, "addObject:", v34);

      }
      v21 = (void *)v83;
LABEL_58:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  }
  while (v8);
LABEL_60:

LABEL_61:
  objc_msgSend(v59, "visualRefs", v53);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 == 0;

  if (!v36)
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(v59, "visualRefs");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v86;
      while (2)
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v86 != v39)
            objc_enumerationMutation(v37);
          v41 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
          objc_msgSend(v41, "objectForKey:", CFSTR("id"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v41, "objectForKey:", CFSTR("parameters"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              objc_msgSend(v73, "setVisualId:", v42);
              objc_msgSend(v73, "setVisualParameters:", v43);

              goto LABEL_74;
            }

          }
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
        if (v38)
          continue;
        break;
      }
    }
LABEL_74:

  }
  objc_msgSend(v73, "print");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "mutableCopy");
  objc_msgSend(v73, "setUnfilteredPrint:", v45);

  objc_msgSend(v73, "speak");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "mutableCopy");
  objc_msgSend(v73, "setUnfilteredSpeak:", v47);

  objc_msgSend(v73, "captionPrint");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v48, "mutableCopy");
  objc_msgSend(v73, "setUnfilteredCaptionPrint:", v49);

  objc_msgSend(v73, "captionSpeak");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v50, "mutableCopy");
  objc_msgSend(v73, "setUnfilteredCaptionSpeak:", v51);

LABEL_76:
  return v73;
}

+ (id)DEResultToDialogExecutionResult:(id)a3 catId:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v36 = a4;
  v38 = (id)objc_opt_new();
  v40 = (void *)objc_opt_new();
  if (v39 && (objc_msgSend(v39, "meta"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v39, "meta");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v37 = (void *)objc_opt_new();
  }
  objc_msgSend(v38, "setCatId:", v36);
  objc_msgSend(v38, "setDialog:", v40);
  objc_msgSend(v38, "setMeta:", v37);
  if (v39)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v39, "response");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v7)
    {
      v54 = *(_QWORD *)v59;
      do
      {
        v55 = v7;
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v59 != v54)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", CFSTR("type"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v57, "isEqualToString:", CFSTR("dialog")))
          {
            v10 = (void *)objc_opt_new();
            objc_msgSend(v9, "objectForKey:", CFSTR("id"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setId:", v11);

            objc_msgSend(v9, "objectForKey:", CFSTR("content"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12)
            {
              v46 = v12;
              objc_msgSend(v12, "objectForKey:", CFSTR("print"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKey:", CFSTR("speak"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKey:", CFSTR("redactedPrint"));
              v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKey:", CFSTR("redactedSpeak"));
              v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectForKey:", CFSTR("id"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setFullPrint:", v53);
              objc_msgSend(v10, "setFullSpeak:", v51);
              if (v50)
                v14 = v50;
              else
                v14 = &stru_1E793AF80;
              objc_msgSend(v10, "setRedactedFullPrint:", v14);
              if (v49)
                v15 = v49;
              else
                v15 = &stru_1E793AF80;
              objc_msgSend(v10, "setRedactedFullSpeak:", v15);
              objc_msgSend(v10, "setId:", v52);
              objc_msgSend(v9, "objectForKey:", CFSTR("caption"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v16;
              if (v16)
              {
                objc_msgSend(v16, "objectForKey:", CFSTR("print"));
                v17 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "objectForKey:", CFSTR("speak"));
                v18 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "objectForKey:", CFSTR("redactedPrint"));
                v19 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "objectForKey:", CFSTR("redactedSpeak"));
                v20 = (__CFString *)v17;
                v21 = (__CFString *)v18;
                v22 = (__CFString *)v19;
                v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v23 = &stru_1E793AF80;
                v20 = &stru_1E793AF80;
                v21 = &stru_1E793AF80;
                v22 = &stru_1E793AF80;
              }
              objc_msgSend(v10, "setSupportingPrint:", v20);
              objc_msgSend(v10, "setSupportingSpeak:", v21);
              objc_msgSend(v10, "setRedactedSupportingPrint:", v22);
              objc_msgSend(v10, "setRedactedSupportingSpeak:", v23);
              objc_msgSend(v9, "objectForKey:", CFSTR("unfilteredContent"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v24)
              {
                v41 = v24;
                objc_msgSend(v24, "objectForKey:", CFSTR("print"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKey:", CFSTR("speak"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setUnfilteredFullPrint:", v44);
                objc_msgSend(v10, "setUnfilteredFullSpeak:", v45);
                objc_msgSend(v9, "objectForKey:", CFSTR("unfilteredCaption"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = v26;
                if (v26)
                {
                  objc_msgSend(v26, "objectForKey:", CFSTR("print"));
                  v47 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "objectForKey:", CFSTR("speak"));
                  v27 = objc_claimAutoreleasedReturnValue();
                  v28 = (const __CFString *)v47;
                  v29 = (__CFString *)v27;
                }
                else
                {
                  v29 = &stru_1E793AF80;
                  v28 = &stru_1E793AF80;
                }
                v48 = (__CFString *)v28;
                objc_msgSend(v10, "setUnfilteredSupportingPrint:");
                objc_msgSend(v10, "setUnfilteredSupportingSpeak:", v29);
                objc_msgSend(v9, "objectForKey:", CFSTR("printOnly"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v30)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v9, "objectForKey:", CFSTR("spokenOnly"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setSpokenOnlyDefined:", v31 != 0);
                if (!v31)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v10, "setPrintOnly:", objc_msgSend(v30, "BOOLValue"));
                objc_msgSend(v10, "setSpokenOnly:", objc_msgSend(v31, "BOOLValue"));
                objc_msgSend(v9, "objectForKey:", CFSTR("isApprovedForGrading"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v32;
                if (v32)
                  v34 = objc_msgSend(v32, "BOOLValue");
                else
                  v34 = 0;
                objc_msgSend(v10, "setIsApprovedForGrading:", v34);
                objc_msgSend(v40, "addObject:", v10);

                v25 = v41;
              }

              v13 = v46;
            }

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v7);
    }

    objc_msgSend(v38, "setDialog:", v40);
  }

  return v38;
}

+ (id)CreateDEExecutor:(id)a3 templateDir:(id)a4 catId:(id)a5 paramsXML:(id)a6 localeXML:(id)a7 parameters:(id)a8 globalContext:(id)a9 callback:(id)a10 options:(int)a11
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v20 = v18;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Invalid globals object - must be a Dictionary or CATContext instance", v25);
      v22 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v18, "toDictionary");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;
  v22 = (void *)objc_opt_new();
  if (v14)
    +[DEExecutor bundleTemplateDir:](DEExecutor, "bundleTemplateDir:", v14);
  else
    objc_msgSend(v15, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTemplateDir:", v23);

  +[CATCommonApi ConfigureDEExecutor:parameters:globalParameters:catId:callback:options:](CATCommonApi, "ConfigureDEExecutor:parameters:globalParameters:catId:callback:options:", v22, v17, v21, v16, v19, a11);
LABEL_8:

  return v22;
}

id __87__CATCommonApi_ConfigureDEExecutor_parameters_globalParameters_catId_callback_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  CATParams *v16;
  id v17;
  const char *v18;
  void *v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_opt_new();
  v15 = v14;
  v16 = -[CATParams initWithParams:]([CATParams alloc], "initWithParams:", v14);
  v17 = *(id *)(a1 + 32);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForComputedProperty:typeName:propName:params:", v9, v10, v11, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Callback object does not implement valueForComputedProperty:typeName:propName:params:", v18);
    v19 = 0;
  }

  return v19;
}

@end
