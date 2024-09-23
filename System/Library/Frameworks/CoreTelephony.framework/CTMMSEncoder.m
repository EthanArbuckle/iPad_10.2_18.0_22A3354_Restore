@implementation CTMMSEncoder

+ (id)decodeSmsFromData:(id)a3
{
  id v4;
  CTXPCServiceSubscriptionContext *v5;
  void *v6;

  v4 = a3;
  v5 = -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1);
  objc_msgSend(a1, "decodeSmsFromData:data:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)decodeSmsFromData:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  CTMessage *v7;
  void *v8;
  CTMessage *v9;
  std::string *v10;
  void *v11;
  void *v12;
  std::string::size_type size;
  uint64_t v14;
  std::string *v15;
  void *v16;
  void *v17;
  std::string *v18;
  void *v19;
  id v20;
  id v21;
  std::string *p_p;
  void *v23;
  void *v24;
  unsigned int v26;
  _OWORD v27[2];
  uint64_t v28;
  std::string __p;
  std::string v30;
  std::string v31;
  std::string v32;
  uint64_t v33;

  v5 = a3;
  memset(&v32, 0, sizeof(v32));
  v33 = 0;
  memset(&v31, 0, sizeof(v31));
  memset(&v30, 0, sizeof(v30));
  memset(&__p, 0, sizeof(__p));
  v28 = 0;
  memset(v27, 0, sizeof(v27));
  v6 = objc_retainAutorelease(a4);
  MMSPduDecoder::MMSPduDecoder((ctu::OsLogLogger *)v27, objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 1);
  if ((MMSPduDecoder::decodeSms((MMSPduDecoder *)v27, &v33, &v32, &v31, &v30, &__p) & 1) != 0)
  {
    v7 = [CTMessage alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CTMessage initWithDate:](v7, "initWithDate:", v8);

    -[CTMessage setContext:](v9, "setContext:", v5);
    -[CTMessage setMessageType:](v9, "setMessageType:", 1);
    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v10 = &v32;
    else
      v10 = (std::string *)v32.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CTPhoneNumber isValidPhoneNumber:](CTPhoneNumber, "isValidPhoneNumber:", v11))
      +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", objc_msgSend(v5, "slotID"), v11, CFSTR("1"));
    else
      +[CTAsciiAddress asciiAddressWithString:](CTAsciiAddress, "asciiAddressWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTMessage setSender:](v9, "setSender:", v12);

    size = HIBYTE(v30.__r_.__value_.__r.__words[2]);
    if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v30.__r_.__value_.__l.__size_;
    if (size)
    {
      v14 = objc_msgSend(v5, "slotID");
      if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &v30;
      else
        v15 = (std::string *)v30.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", v14, v16, CFSTR("1"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTMessage setServiceCenter:](v9, "setServiceCenter:", v17);

    }
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v18 = &v31;
    else
      v18 = (std::string *)v31.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CTMessage addText:](v9, "addText:", v19);

    v21 = objc_alloc(MEMORY[0x1E0CB3A28]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithUUIDString:", v23);

    -[CTMessage setUniqueIdentifier:](v9, "setUniqueIdentifier:", v24);
    v26 = 0;
    if (MMSPduDecoder::decodeWspIntegerValue((MMSPduDecoder *)v27, &v26))
      -[CTMessage setReplaceMessage:](v9, "setReplaceMessage:", v26);

  }
  else
  {
    v9 = 0;
  }
  MEMORY[0x186DBA1B4](v27);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);

  return v9;
}

+ (id)encodeSms:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  const char *p_dst;
  void **v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *__p[2];
  __int128 v26;
  uint64_t v27;
  void *__dst;
  uint64_t v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  __int128 v33;
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
  char v46[31];
  char v47;
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
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[31];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  memset(v62, 0, sizeof(v62));
  v61 = 0u;
  v60 = 0u;
  v59 = 0u;
  v58 = 0u;
  v57 = 0u;
  v56 = 0u;
  v55 = 0u;
  v54 = 0u;
  v53 = 0u;
  v52 = 0u;
  v51 = 0u;
  v50 = 0u;
  v49 = 0u;
  v48 = 0u;
  memset(v46, 0, sizeof(v46));
  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v47 = 0;
  v31 = 0;
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "getCString:maxLength:encoding:", &v47, 255, 4) & 1) != 0)
  {
    objc_msgSend(v3, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    __dst = 0;
    v29 = 0;
    v30 = 0;
    objc_msgSend(v8, "data");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (void *)objc_msgSend(v9, "bytes");
    objc_msgSend(v8, "data");
    v11 = objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:nn180100](&__dst, v10, objc_msgSend((id)v11, "length"));

    objc_msgSend(v3, "serviceCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = v12 == 0;

    if ((v11 & 1) != 0
      || (objc_msgSend(v3, "serviceCenter"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "formatForCallingCountry:", CFSTR("1")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "getCString:maxLength:encoding:", &v31, 255, 4),
          v14,
          v13,
          (v15 & 1) != 0))
    {
      v16 = HIBYTE(v30);
      if (v30 < 0)
        v16 = v29;
      if (v16)
      {
        v27 = 0;
        *(_OWORD *)__p = 0u;
        v26 = 0u;
        MMSPduEncoder::MMSPduEncoder((MMSPduEncoder *)__p);
        if (v30 >= 0)
          p_dst = (const char *)&__dst;
        else
          p_dst = (const char *)__dst;
        MMSPduEncoder::encodeSms((MMSPduEncoder *)__p, 0, &v47, p_dst, &v31, "");
        if (v26 >= 0)
          v18 = &__p[1];
        else
          v18 = (void **)__p[1];
        if (v26 >= 0)
          v19 = HIBYTE(v26);
        else
          v19 = v26;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v26) < 0)
          operator delete(__p[1]);
        goto LABEL_26;
      }
      v23 = sMmsPduLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        +[CTMMSEncoder encodeSms:].cold.1();
    }
    else
    {
      v22 = sMmsPduLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        +[CTMMSEncoder encodeSms:].cold.2();
    }
    v20 = 0;
LABEL_26:
    if (SHIBYTE(v30) < 0)
      operator delete(__dst);

    goto LABEL_29;
  }
  v21 = sMmsPduLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    +[CTMMSEncoder encodeSms:].cold.3();
  v20 = 0;
LABEL_29:

  return v20;
}

+ (id)encodeMessage:(id)a3
{
  const __CFString *MobileUser;
  const void *v5;
  uint64_t (*v6)(uint64_t);
  const void *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  unsigned int i;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  const char *v29;
  __int128 v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  CoreTelephonyClient *v34;
  CTBundle *v35;
  id v36;
  id v37;
  void *v38;
  int v39;
  unsigned int v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  id v45;
  MMSContentType *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  char *v53;
  id v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  NSString *v60;
  void *v61;
  char *v62;
  id v63;
  const char *v64;
  char v65;
  NSObject *v66;
  char *v67;
  char *v68;
  int v69;
  NSString *v70;
  id v71;
  CoreTelephonyClient *v72;
  CTBundle *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  MMSHeader *v78;
  id v79;
  MMSHeaderContainer *v80;
  const char *v81;
  NSString *v82;
  id v83;
  const char *v84;
  char *v85;
  uint8_t *v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v103;
  __int128 v104;
  void *v105;
  void *v106;
  char *v107;
  char *v108;
  char *__s;
  unsigned int v110;
  MMSHeaderContainer *v111;
  MMSMessage *v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  char *Value;
  _BYTE v119[128];
  _BYTE v120[12];
  __int16 v121;
  unsigned int v122;
  uint8_t buf[16];
  __int128 v124;
  uint64_t v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v113 = a3;
  *(_QWORD *)buf = 0;
  MobileUser = (const __CFString *)_CFStringGetMobileUser();
  *(_QWORD *)v120 = CFPreferencesCopyValue(CFSTR("MMS"), CFSTR("com.apple.carrier_1"), MobileUser, (CFStringRef)*MEMORY[0x1E0C9B230]);
  ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(buf, (CFTypeRef *)v120);
  v5 = *(const void **)buf;
  v6 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!*(_QWORD *)buf)
    v6 = 0;
  if (v6)
  {
    *(_QWORD *)v120 = 0;
    Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)buf, CFSTR("MimeEncodingHint"));
    ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(v120, (CFTypeRef *)&Value);
    v7 = *(const void **)v120;
    v8 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
    if (!*(_QWORD *)v120)
      v8 = 0;
    if (v8)
    {
      if (CFEqual(CFSTR("UTF8"), *(CFTypeRef *)v120))
        v9 = 134217984;
      else
        v9 = 0xFFFFFFFFLL;
      v7 = *(const void **)v120;
      if (*(_QWORD *)v120)
        goto LABEL_11;
    }
    else
    {
      v9 = 0xFFFFFFFFLL;
      if (*(_QWORD *)v120)
LABEL_11:
        CFRelease(v7);
    }
    v5 = *(const void **)buf;
    if (!*(_QWORD *)buf)
      goto LABEL_14;
    goto LABEL_13;
  }
  v9 = 0xFFFFFFFFLL;
  if (*(_QWORD *)buf)
LABEL_13:
    CFRelease(v5);
LABEL_14:
  v10 = sMmsPduLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl(&dword_18425C000, v10, OS_LOG_TYPE_DEFAULT, "*****************Using mime encoding hint: %u***********************\n", buf, 8u);
  }
  if (objc_msgSend(v113, "messageType") == 1)
  {
    objc_msgSend(a1, "encodeSms:", v113);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_105;
  }
  v125 = 0;
  *(_OWORD *)buf = 0u;
  v124 = 0u;
  MMSPduEncoder::MMSPduEncoder((MMSPduEncoder *)buf);
  objc_msgSend(v113, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 0;

  if (v13)
  {
    v31 = sMmsPduLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[CTMMSEncoder encodeMessage:].cold.1();
    goto LABEL_102;
  }
  objc_msgSend(v113, "recipients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") == 0;

  if (v15)
  {
    v32 = sMmsPduLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[CTMMSEncoder encodeMessage:].cold.2();
LABEL_102:
    v11 = 0;
    goto LABEL_103;
  }
  v112 = (MMSMessage *)operator new();
  MMSMessage::MMSMessage(v112);
  for (i = 0; ; ++i)
  {
    objc_msgSend(v113, "recipients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") > (unint64_t)i;

    if (!v18)
      break;
    objc_msgSend(v113, "recipients");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "encodedString");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    if (v22)
      MMSMessage::setTo(v112, v22, 1);

  }
  objc_msgSend(v113, "sender");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 == 0;

  if (!v24)
  {
    objc_msgSend(v113, "sender");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "encodedString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_retainAutorelease(v26);
    MMSMessage::setFrom(v112, (const char *)objc_msgSend(v27, "UTF8String"));

  }
  objc_msgSend(v113, "subject");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = (const char *)objc_msgSend(v28, "UTF8String");

  if (!v29)
    goto LABEL_43;
  if (!*v29)
  {
    objc_msgSend(v113, "context");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v34 = -[CoreTelephonyClient initWithQueue:]([CoreTelephonyClient alloc], "initWithQueue:", 0);
    v35 = -[CTBundle initWithBundleType:]([CTBundle alloc], "initWithBundleType:", 1);
    *(_QWORD *)v120 = 0;
    v36 = -[CoreTelephonyClient copyCarrierBundleValue:keyHierarchy:bundleType:error:](v34, "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v33, &unk_1E1587048, v35, v120);
    v37 = *(id *)v120;
    v38 = v37;
    if (!v36 || v37)
    {

      goto LABEL_43;
    }
    v39 = objc_msgSend(v36, "BOOLValue");

    if (!v39)
      goto LABEL_43;
  }
  MMSMessage::setSubject(v112, v29);
LABEL_43:
  v40 = 0;
  *(_QWORD *)&v30 = 136315394;
  v104 = v30;
  while (1)
  {
    objc_msgSend(v113, "items", v104);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v40;
    v42 = objc_msgSend(v41, "count") > (unint64_t)v40;

    if (!v42)
      break;
    objc_msgSend(v113, "items");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndex:", v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "contentType");
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = (MMSContentType *)objc_msgSend(v45, "UTF8String");

    objc_msgSend(v44, "contentId");
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v107 = (char *)objc_msgSend(v47, "UTF8String");

    objc_msgSend(v44, "contentLocation");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    __s = (char *)objc_msgSend(v48, "UTF8String");

    objc_msgSend(v44, "data");
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v49;
    if (!v46)
    {
      v88 = sMmsPduLog();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        +[CTMMSEncoder encodeMessage:].cold.3(v110, v88, v89, v90, v91, v92, v93, v94);
      (*(void (**)(MMSMessage *))(*(_QWORD *)v112 + 8))(v112);

      goto LABEL_101;
    }
    if (!v49)
    {
      v95 = sMmsPduLog();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        +[CTMMSEncoder encodeMessage:].cold.4(v110, v95, v96, v97, v98, v99, v100, v101);
      (*(void (**)(MMSMessage *))(*(_QWORD *)v112 + 8))(v112);
LABEL_101:

      goto LABEL_102;
    }
    Value = 0;
    MMSContentType::contentTypeForName(v46, &Value);
    v108 = Value;
    if (Value)
    {
      v105 = v50;
      v111 = (MMSHeaderContainer *)operator new();
      v51 = objc_retainAutorelease(v50);
      MMSMimePart::MMSMimePart(v111, (const void *)objc_msgSend(v51, "bytes"), objc_msgSend(v51, "length"), 0);
      objc_msgSend(v44, "allContentTypeParameterNames");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = __s;
      v106 = v52;
      if (v52)
      {
        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        v54 = v52;
        v55 = 0;
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
        if (v56)
        {
          v57 = *(_QWORD *)v115;
          do
          {
            for (j = 0; j != v56; ++j)
            {
              if (*(_QWORD *)v115 != v57)
                objc_enumerationMutation(v54);
              v59 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
              if (objc_msgSend(v59, "caseInsensitiveCompare:", CFSTR("name")))
                v55 = 1;
              objc_msgSend(v44, "contentTypeParameterWithName:", v59);
              v60 = (NSString *)objc_claimAutoreleasedReturnValue();
              _mimeEncodeWithEncodingHint(v60, v9);
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              v62 = (char *)objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
              v63 = objc_retainAutorelease(v61);
              v64 = (const char *)objc_msgSend(v63, "UTF8String");
              if (v62 && v64)
                MMSHeaderContainer::addHeader((MMSHeaderContainer *)(Value + 8), v62, v64, 0);

            }
            v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
          }
          while (v56);
        }

        v65 = v55 & 1;
        v53 = __s;
        if (!__s)
          goto LABEL_78;
LABEL_67:
        v67 = strrchr(v53, 47);
        if (v67)
        {
          v69 = v67[1];
          v68 = v67 + 1;
          if (v69)
            v53 = v68;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v53);
        v70 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "context");
        v71 = (id)objc_claimAutoreleasedReturnValue();
        v72 = -[CoreTelephonyClient initWithQueue:]([CoreTelephonyClient alloc], "initWithQueue:", 0);
        v73 = -[CTBundle initWithBundleType:]([CTBundle alloc], "initWithBundleType:", 1);
        *(_QWORD *)v120 = 0;
        v74 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](v72, "copyCarrierBundleValue:key:bundleType:error:", v71, CFSTR("ASCIIFileNameRequired"), v73, v120);
        v75 = *(id *)v120;
        v76 = v75;
        if (v74 && !v75)
          objc_msgSend(v74, "BOOLValue");

        _mimeEncodeWithEncodingHint(v70, v9);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v65 & 1) == 0)
          MMSHeaderContainer::addHeader((MMSHeaderContainer *)(Value + 8), "name", (const char *)objc_msgSend(objc_retainAutorelease(v77), "UTF8String"), 0);
        v78 = MMSHeaderContainer::addHeader(v111, "Content-Disposition", "Attachment", 0);
        v79 = objc_retainAutorelease(v77);
        v80 = (MMSHeader *)((char *)v78 + 32);
        MMSHeaderContainer::addHeader(v80, "filename", (const char *)objc_msgSend(v79, "UTF8String"), 0);
        v81 = (const char *)(*(uint64_t (**)(char *))(*(_QWORD *)Value + 16))(Value);
        if (!strcmp(v81, "text"))
          MMSParameterContainer::setCharset(v80, 106);

      }
      else
      {
        v65 = 0;
        if (__s)
          goto LABEL_67;
      }
LABEL_78:
      MMSHeaderContainer::setContentType(v111, (uint64_t *)&Value);
      if (v107)
        MMSHeaderContainer::addHeader(v111, "Content-ID", v107, 0);
      objc_msgSend(v44, "contentLocation");
      v82 = (NSString *)objc_claimAutoreleasedReturnValue();
      _mimeEncodeWithEncodingHint(v82, v9);
      v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v84 = (const char *)objc_msgSend(v83, "UTF8String");

      if (v84)
        MMSHeaderContainer::addHeader(v111, "Content-Location", v84, 0);
      MMSMessage::addPart(v112, v111);

      v50 = v105;
      goto LABEL_83;
    }
    v66 = sMmsPduLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v120 = v104;
      *(_QWORD *)&v120[4] = v46;
      v121 = 1024;
      v122 = v110;
      _os_log_error_impl(&dword_18425C000, v66, OS_LOG_TYPE_ERROR, "invalid content type %s for part %u", v120, 0x12u);
    }
    (*(void (**)(MMSMessage *))(*(_QWORD *)v112 + 8))(v112);
LABEL_83:
    v85 = Value;
    Value = 0;
    if (v85)
      (*(void (**)(char *))(*(_QWORD *)v85 + 8))(v85);

    if (!v108)
      goto LABEL_102;
    v40 = v110 + 1;
  }
  if (MMSPduEncoder::encodeMessage((MMSPduEncoder *)buf, v112))
  {
    if (v124 >= 0)
      v86 = &buf[8];
    else
      v86 = *(uint8_t **)&buf[8];
    if (v124 >= 0)
      v87 = HIBYTE(v124);
    else
      v87 = v124;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v86, v87);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v103 = sMmsPduLog();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      +[CTMMSEncoder encodeMessage:].cold.5();
    v11 = 0;
  }
  (*(void (**)(MMSMessage *))(*(_QWORD *)v112 + 8))(v112);
LABEL_103:
  if (SHIBYTE(v124) < 0)
    operator delete(*(void **)&buf[8]);
LABEL_105:

  return v11;
}

+ (id)decodeMessageFromData:(id)a3
{
  id v4;
  CTXPCServiceSubscriptionContext *v5;
  void *v6;

  v4 = a3;
  v5 = -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1);
  objc_msgSend(a1, "decodeMessageFromData:data:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)decodeMessageFromData:(id)a3 data:(id)a4
{
  MMSHeaderContainer *v5;
  uint64_t v6;
  CTMessage *v7;
  unint64_t v8;
  void *v9;
  CTMessage *v10;
  unsigned int i;
  uint64_t v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  char *v23;
  NSString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  MMSHeaderContainer *v32;
  unint64_t v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  void **v37;
  void *v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  CTMessagePart *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSString *v48;
  void *v49;
  MMSHeaderEncodingMap *v50;
  unint64_t v51;
  unsigned int v52;
  uint64_t v53;
  void *v54;
  void **v55;
  NSString *v56;
  NSString *v57;
  BOOL v58;
  void *v59;
  id v60;
  id v62;
  id v63;
  id v64;
  CTMessage *v65;
  void *v66;
  void *v67;
  unsigned int j;
  MMSHeaderEncodingMap *v69;
  _OWORD v70[2];
  uint64_t v71;
  void **v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t buf[4];
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v71 = 0;
  memset(v70, 0, sizeof(v70));
  v63 = objc_retainAutorelease(a4);
  MMSPduDecoder::MMSPduDecoder((ctu::OsLogLogger *)v70, objc_msgSend(v63, "bytes"), objc_msgSend(v63, "length"), 1);
  v5 = MMSPduDecoder::decodeMessage((MMSPduDecoder *)v70, 1, 1);
  if (v5)
  {
    v69 = v5;
    v6 = MMSHeaderContainer::headerWithName(v5, "Date");
    if (v6)
    {
      v7 = [CTMessage alloc];
      LODWORD(v8) = *(_DWORD *)(v6 + 20);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CTMessage initWithDate:](v7, "initWithDate:", v9);

    }
    else
    {
      v10 = objc_alloc_init(CTMessage);
    }
    -[CTMessage setMessageType:](v10, "setMessageType:", 2);
    -[CTMessage setContext:](v10, "setContext:", v62);
    v65 = v10;
    v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    for (i = 0; MMSHeaderContainer::headerCount(v69) > (unint64_t)i; ++i)
    {
      v12 = MMSHeaderEncodingMap::encodingForNumber(v69, i);
      v72 = 0;
      v73 = 0;
      v74 = 0;
      if (((*(uint64_t (**)(uint64_t, void ***))(*(_QWORD *)v12 + 72))(v12, &v72) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 64))(v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74 >= 0)
          v14 = (void **)&v72;
        else
          v14 = v72;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v13)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (!v17)
          objc_msgSend(v64, "setObject:forKey:", v15, v13);

      }
      else
      {
        v18 = sMmsPduLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 64))(v12);
          *(_DWORD *)buf = 136315138;
          v76 = v19;
          _os_log_error_impl(&dword_18425C000, v18, OS_LOG_TYPE_ERROR, "unable to convert value of header %s to a string", buf, 0xCu);
        }
      }
      if (SHIBYTE(v74) < 0)
        operator delete(v72);
    }
    -[CTMessage setRawHeaders:](v10, "setRawHeaders:", v64);
    v20 = MMSHeaderContainer::valueForStringHeader(v69, "Subject");
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTMessage setSubject:](v10, "setSubject:", v21);

    }
    addRecipientsFromMMSWithHeader("To", v69, v10);
    addRecipientsFromMMSWithHeader("Cc", v69, v10);
    v22 = (char *)MMSHeaderContainer::valueForStringHeader(v69, "From");
    v23 = v22;
    if (v22)
    {
      if (strchr(v22, 64))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23);
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        _mimeDecode(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        +[CTEmailAddress emailAddress:](CTEmailAddress, "emailAddress:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTMessage setSender:](v65, "setSender:", v26);
      }
      else
      {
        stripAddressType(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[CTPhoneNumber isValidPhoneNumber:](CTPhoneNumber, "isValidPhoneNumber:", v25))
          +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", objc_msgSend(v62, "slotID"), v25, CFSTR("1"));
        else
          +[CTAsciiAddress asciiAddressWithString:](CTAsciiAddress, "asciiAddressWithString:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTMessage setSender:](v10, "setSender:", v26);
      }

    }
    v27 = MMSHeaderContainer::contentType(v69);
    v28 = v27;
    if (v27)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%s/%s"), v30, (*(uint64_t (**)(uint64_t))(*(_QWORD *)v28 + 24))(v28));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTMessage setContentType:](v65, "setContentType:", v31);
      v32 = (MMSHeaderContainer *)(v28 + 8);
      v33 = MMSHeaderContainer::headerCount(v32);
      if (v33)
      {
        v34 = 1;
        do
        {
          v35 = MMSHeaderEncodingMap::encodingForNumber(v32, v34 - 1);
          v72 = 0;
          v73 = 0;
          v74 = 0;
          if ((*(unsigned int (**)(uint64_t, void ***))(*(_QWORD *)v35 + 72))(v35, &v72))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v35 + 64))(v35));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v74 >= 0)
              v37 = (void **)&v72;
            else
              v37 = v72;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[CTMessage addContentTypeParameterWithName:value:](v65, "addContentTypeParameterWithName:value:", v36, v38);

          }
          if (SHIBYTE(v74) < 0)
            operator delete(v72);
          v39 = v33 > v34++;
        }
        while (v39);
      }

    }
    for (j = 0; j < MMSMessage::partCount(v69); ++j)
    {
      v40 = MMSMessage::part(v69, j);
      v41 = MMSHeaderContainer::contentType((MMSHeaderContainer *)v40);
      v42 = (void *)MEMORY[0x1E0CB3940];
      v43 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v41 + 16))(v41);
      objc_msgSend(v42, "stringWithFormat:", CFSTR("%s/%s"), v43, (*(uint64_t (**)(uint64_t))(*(_QWORD *)v41 + 24))(v41));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(v40 + 72), *(unsigned int *)(v40 + 96));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[CTMessagePart initWithData:contentType:]([CTMessagePart alloc], "initWithData:contentType:", v67, v66);
      v45 = MMSHeaderContainer::valueForStringHeader((MMSHeaderContainer *)v40, "Content-ID");
      if (v45)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTMessagePart setContentId:](v44, "setContentId:", v46);

      }
      v47 = MMSHeaderContainer::valueForStringHeader((MMSHeaderContainer *)v40, "Content-Location");
      if (v47)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v47);
        v48 = (NSString *)objc_claimAutoreleasedReturnValue();
        _mimeDecode(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTMessagePart setContentLocation:](v44, "setContentLocation:", v49);

      }
      v50 = (MMSHeaderEncodingMap *)(v41 + 8);
      v51 = MMSHeaderContainer::headerCount((MMSHeaderContainer *)(v41 + 8));
      if (v51)
      {
        v52 = 1;
        do
        {
          v53 = MMSHeaderEncodingMap::encodingForNumber(v50, v52 - 1);
          v72 = 0;
          v73 = 0;
          v74 = 0;
          if ((*(unsigned int (**)(uint64_t, void ***))(*(_QWORD *)v53 + 72))(v53, &v72))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v53 + 64))(v53));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v74 >= 0)
              v55 = (void **)&v72;
            else
              v55 = v72;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v55);
            v56 = (NSString *)objc_claimAutoreleasedReturnValue();
            v57 = v56;
            if (v54)
              v58 = v56 == 0;
            else
              v58 = 1;
            if (v58)
            {
              v59 = v56;
            }
            else
            {
              _mimeDecode(v56);
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              -[CTMessagePart addContentTypeParameterWithName:value:](v44, "addContentTypeParameterWithName:value:", v54, v59);
              if (!v47 && !objc_msgSend(v54, "caseInsensitiveCompare:", CFSTR("name")))
                -[CTMessagePart setContentLocation:](v44, "setContentLocation:", v59);
            }

          }
          if (SHIBYTE(v74) < 0)
            operator delete(v72);
          v39 = v51 > v52++;
        }
        while (v39);
      }
      v60 = -[CTMessage addPart:](v65, "addPart:", v44);

    }
    (*(void (**)(MMSHeaderEncodingMap *))(*(_QWORD *)v69 + 8))(v69);

  }
  else
  {
    v65 = 0;
  }
  MEMORY[0x186DBA1B4](v70);

  return v65;
}

+ (void)encodeSms:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "text part contains null text", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)encodeSms:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "unable to get serviceCenter for SMS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)encodeSms:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "unable to get recipient for SMS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)encodeMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "encodeMessage failed: no message body", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)encodeMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "encodeMessage failed: no recipients", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)encodeMessage:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18425C000, a2, a3, "no content type specified for part %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)encodeMessage:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18425C000, a2, a3, "part %u doesn't contain a body", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)encodeMessage:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "unable to encode mms", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
