@implementation NFCISO7816APDU

- (NFCISO7816APDU)initWithInstructionClass:(uint8_t)instructionClass instructionCode:(uint8_t)instructionCode p1Parameter:(uint8_t)p1Parameter p2Parameter:(uint8_t)p2Parameter data:(NSData *)data expectedResponseLength:(NSInteger)expectedResponseLength
{
  NSData *v15;
  NFCISO7816APDU *v16;
  NFCISO7816APDU *v17;
  NSData *v18;
  unint64_t v19;
  NSData *v20;
  uint64_t v21;
  uint64_t Logger;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  NFCISO7816APDU *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSData *v35;
  uint64_t v36;
  NSData *fullPacket;
  const char *Name;
  __int16 v40;
  char v41;
  objc_super v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v15 = data;
  if (!expectedResponseLength || (unint64_t)(expectedResponseLength - 65537) <= 0xFFFFFFFFFFFEFFFDLL)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v27 = 45;
      if (isMetaClass)
        v27 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Invalid expectedResponseLength value; should be from 1 to 65536 or -1",
        v27,
        ClassName,
        Name,
        33);
    }
    NFSharedLogGetLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      *(_DWORD *)buf = 67109890;
      v44 = v30;
      v45 = 2082;
      v46 = object_getClassName(self);
      v47 = 2082;
      v48 = sel_getName(a2);
      v49 = 1024;
      v50 = 33;
      _os_log_impl(&dword_215BBD000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid expectedResponseLength value; should be from 1 to 65536 or -1",
        buf,
        0x22u);
    }

    v31 = 0;
    goto LABEL_32;
  }
  v42.receiver = self;
  v42.super_class = (Class)NFCISO7816APDU;
  v16 = -[NFCISO7816APDU init](&v42, sel_init);
  if (v16)
  {
    v17 = v16;
    v18 = (NSData *)objc_opt_new();
    buf[0] = instructionClass;
    buf[1] = instructionCode;
    buf[2] = p1Parameter;
    buf[3] = p2Parameter;
    -[NSData appendBytes:length:](v18, "appendBytes:length:", buf, 4);
    v19 = -[NSData length](v15, "length");
    if (-[NSData length](v15, "length"))
    {
      if (expectedResponseLength > 256 || v19 >= 0x100)
      {
        LOBYTE(v40) = 0;
        HIBYTE(v40) = (unsigned __int16)-[NSData length](v15, "length") >> 8;
        v41 = -[NSData length](v15, "length");
        v20 = v18;
        v21 = 3;
      }
      else
      {
        LOBYTE(v40) = -[NSData length](v15, "length");
        v20 = v18;
        v21 = 1;
      }
      -[NSData appendBytes:length:](v20, "appendBytes:length:", &v40, v21);
      v32 = -[NSData length](v18, "length");
      v33 = -[NSData length](v15, "length");
      v17->_payloadOffset.location = v32;
      v17->_payloadOffset.length = v33;
      -[NSData appendData:](v18, "appendData:", v15);
    }
    else
    {
      v17->_payloadOffset = (_NSRange)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    }
    v17->_le = expectedResponseLength;
    if (expectedResponseLength >= 1)
    {
      v34 = -[NSData length](v15, "length");
      if (expectedResponseLength < 257 || v34)
      {
        if (expectedResponseLength > 256 || v19 >= 0x100)
        {
          v40 = bswap32(expectedResponseLength) >> 16;
          v35 = v18;
          v36 = 2;
        }
        else
        {
          LOBYTE(v40) = expectedResponseLength;
          v35 = v18;
          v36 = 1;
        }
      }
      else
      {
        LOBYTE(v40) = 0;
        HIBYTE(v40) = BYTE1(expectedResponseLength);
        v41 = expectedResponseLength;
        v35 = v18;
        v36 = 3;
      }
      -[NSData appendBytes:length:](v35, "appendBytes:length:", &v40, v36);
    }
    fullPacket = v17->_fullPacket;
    v17->_fullPacket = v18;

    self = v17;
    v31 = self;
LABEL_32:

    goto LABEL_33;
  }
  v31 = 0;
LABEL_33:

  return v31;
}

- (NFCISO7816APDU)initWithData:(NSData *)data
{
  NSData *v5;
  char *v6;
  NSData *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *v20;
  NFCISO7816APDU *v21;
  uint64_t v22;
  void *v23;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unsigned int v28;
  _BOOL4 v29;
  unsigned int v30;
  _BOOL4 v31;
  uint64_t Logger;
  void (*v33)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v37;
  objc_class *v38;
  int v39;
  const char *v40;
  const char *v41;
  int v42;
  int64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, const char *, ...);
  objc_class *v46;
  _BOOL4 v47;
  const char *v48;
  uint64_t v49;
  objc_class *v50;
  int v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  int v56;
  uint64_t v57;
  void (*v58)(uint64_t, const char *, ...);
  objc_class *v59;
  _BOOL4 v60;
  const char *v61;
  uint64_t v62;
  objc_class *v63;
  int v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void (*v68)(uint64_t, const char *, ...);
  objc_class *v69;
  _BOOL4 v70;
  const char *v71;
  uint64_t v72;
  objc_class *v73;
  int v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, const char *, ...);
  objc_class *v82;
  _BOOL4 v83;
  const char *v84;
  uint64_t v85;
  objc_class *v86;
  int v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void (*v91)(uint64_t, const char *, ...);
  objc_class *v92;
  _BOOL4 v93;
  const char *v94;
  uint64_t v95;
  objc_class *v96;
  int v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *Name;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  objc_super v107;
  uint8_t buf[4];
  int v109;
  __int16 v110;
  const char *v111;
  __int16 v112;
  const char *v113;
  __int16 v114;
  int v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v5 = data;
  v107.receiver = self;
  v107.super_class = (Class)NFCISO7816APDU;
  v6 = -[NFCISO7816APDU init](&v107, sel_init);
  if (!v6)
    goto LABEL_14;
  v7 = objc_retainAutorelease(v5);
  v8 = -[NSData bytes](v7, "bytes");
  *(int64x2_t *)(v6 + 8) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *((_QWORD *)v6 + 3) = -1;
  if (-[NSData length](v7, "length") > 3)
  {
    if (-[NSData length](v7, "length") == 4)
      goto LABEL_16;
    v25 = (unsigned __int8 *)(v8 + 4);
    v26 = -[NSData length](v7, "length");
    v27 = (unsigned __int8 *)(v8 + v26);
    if (v26 < 5)
    {
      v42 = 0;
      v29 = 0;
      v31 = 0;
      v30 = -1;
    }
    else
    {
      v28 = *v25;
      v29 = *v25 == 0;
      if (*v25)
      {
        v25 = (unsigned __int8 *)(v8 + 5);
        v30 = v28;
LABEL_22:
        v31 = v28 != 0;
        if (v27 - v25 >= v30)
        {
          *((_QWORD *)v6 + 1) = &v25[-v8];
          *((_QWORD *)v6 + 2) = v30;
          v25 += v30;
        }
        else if (v27 - v25 >= 1)
        {
          Logger = NFLogGetLogger();
          if (Logger)
          {
            v33 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(v6);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(v6);
            Name = sel_getName(a2);
            v37 = 45;
            if (isMetaClass)
              v37 = 43;
            v33(3, "%c[%{public}s %{public}s]:%i Missing data specified by Lc", v37, ClassName, Name, 148);
          }
          NFSharedLogGetLogger();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          v38 = object_getClass(v6);
          if (class_isMetaClass(v38))
            v39 = 43;
          else
            v39 = 45;
          v40 = object_getClassName(v6);
          v41 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v109 = v39;
          v110 = 2082;
          v111 = v40;
          v112 = 2082;
          v113 = v41;
          v114 = 1024;
          v115 = 148;
          v20 = "%c[%{public}s %{public}s]:%i Missing data specified by Lc";
          goto LABEL_12;
        }
        v42 = 1;
        goto LABEL_38;
      }
      if (v26 == 5)
      {
        v42 = 0;
        v29 = 0;
        v30 = 0;
        v25 = (unsigned __int8 *)(v8 + 5);
        v31 = 1;
      }
      else
      {
        if ((unint64_t)v26 <= 6)
        {
          v90 = NFLogGetLogger();
          if (v90)
          {
            v91 = (void (*)(uint64_t, const char *, ...))v90;
            v92 = object_getClass(v6);
            v93 = class_isMetaClass(v92);
            v94 = object_getClassName(v6);
            v106 = sel_getName(a2);
            v95 = 45;
            if (v93)
              v95 = 43;
            v91(3, "%c[%{public}s %{public}s]:%i Unexpected Lc & Le field combination", v95, v94, v106, 133);
          }
          NFSharedLogGetLogger();
          v15 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          v96 = object_getClass(v6);
          if (class_isMetaClass(v96))
            v97 = 43;
          else
            v97 = 45;
          v98 = object_getClassName(v6);
          v99 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v109 = v97;
          v110 = 2082;
          v111 = v98;
          v112 = 2082;
          v113 = v99;
          v114 = 1024;
          v115 = 133;
          v20 = "%c[%{public}s %{public}s]:%i Unexpected Lc & Le field combination";
          goto LABEL_12;
        }
        v25 = (unsigned __int8 *)(v8 + 7);
        v30 = __rev16(*(unsigned __int16 *)(v8 + 5));
        if (v30)
          goto LABEL_22;
        v42 = 0;
        v31 = 0;
        v29 = 1;
      }
    }
LABEL_38:
    if (v25 == v27)
    {
      v54 = -[NSData copy](v7, "copy");
      v55 = (void *)*((_QWORD *)v6 + 4);
      *((_QWORD *)v6 + 4) = v54;

      if (*((_QWORD *)v6 + 1) == 0x7FFFFFFFFFFFFFFFLL && (v31 || v29))
      {
        if (v31)
          v56 = 256;
        else
          v56 = 0x10000;
        if (v30)
          v56 = v30;
        *((_QWORD *)v6 + 3) = v56;
      }
      goto LABEL_17;
    }
    v43 = v27 - v25;
    if (v43 == 2)
    {
      if (v31)
      {
        v57 = NFLogGetLogger();
        if (v57)
        {
          v58 = (void (*)(uint64_t, const char *, ...))v57;
          v59 = object_getClass(v6);
          v60 = class_isMetaClass(v59);
          v61 = object_getClassName(v6);
          v103 = sel_getName(a2);
          v62 = 45;
          if (v60)
            v62 = 43;
          v58(3, "%c[%{public}s %{public}s]:%i Unexpected short Lc & extended Le combination", v62, v61, v103, 176);
        }
        NFSharedLogGetLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v63 = object_getClass(v6);
        if (class_isMetaClass(v63))
          v64 = 43;
        else
          v64 = 45;
        v65 = object_getClassName(v6);
        v66 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v109 = v64;
        v110 = 2082;
        v111 = v65;
        v112 = 2082;
        v113 = v66;
        v114 = 1024;
        v115 = 176;
        v20 = "%c[%{public}s %{public}s]:%i Unexpected short Lc & extended Le combination";
        goto LABEL_12;
      }
      v78 = *v25;
      *((_QWORD *)v6 + 3) = v78 << 8;
      v79 = v25[1] | ((unint64_t)v78 << 8);
      v77 = 0x10000;
      if (v79)
        v77 = v79;
    }
    else
    {
      if (v43 != 1)
      {
        v67 = NFLogGetLogger();
        if (v67)
        {
          v68 = (void (*)(uint64_t, const char *, ...))v67;
          v69 = object_getClass(v6);
          v70 = class_isMetaClass(v69);
          v71 = object_getClassName(v6);
          v104 = sel_getName(a2);
          v72 = 45;
          if (v70)
            v72 = 43;
          v68(3, "%c[%{public}s %{public}s]:%i Unexpected lc & le field combination", v72, v71, v104, 184);
        }
        NFSharedLogGetLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v73 = object_getClass(v6);
        if (class_isMetaClass(v73))
          v74 = 43;
        else
          v74 = 45;
        v75 = object_getClassName(v6);
        v76 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v109 = v74;
        v110 = 2082;
        v111 = v75;
        v112 = 2082;
        v113 = v76;
        v114 = 1024;
        v115 = 184;
        v20 = "%c[%{public}s %{public}s]:%i Unexpected lc & le field combination";
        goto LABEL_12;
      }
      if (v29)
      {
        v44 = NFLogGetLogger();
        if (v44)
        {
          v45 = (void (*)(uint64_t, const char *, ...))v44;
          v46 = object_getClass(v6);
          v47 = class_isMetaClass(v46);
          v48 = object_getClassName(v6);
          v102 = sel_getName(a2);
          v49 = 45;
          if (v47)
            v49 = 43;
          v45(3, "%c[%{public}s %{public}s]:%i Unexpected extended Lc & short Le combination", v49, v48, v102, 170);
        }
        NFSharedLogGetLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v50 = object_getClass(v6);
        if (class_isMetaClass(v50))
          v51 = 43;
        else
          v51 = 45;
        v52 = object_getClassName(v6);
        v53 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v109 = v51;
        v110 = 2082;
        v111 = v52;
        v112 = 2082;
        v113 = v53;
        v114 = 1024;
        v115 = 170;
        v20 = "%c[%{public}s %{public}s]:%i Unexpected extended Lc & short Le combination";
        goto LABEL_12;
      }
      v77 = *v25;
    }
    *((_QWORD *)v6 + 3) = v77;
    if (v42 && *((_QWORD *)v6 + 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v80 = NFLogGetLogger();
      if (v80)
      {
        v81 = (void (*)(uint64_t, const char *, ...))v80;
        v82 = object_getClass(v6);
        v83 = class_isMetaClass(v82);
        v84 = object_getClassName(v6);
        v105 = sel_getName(a2);
        v85 = 45;
        if (v83)
          v85 = 43;
        v81(3, "%c[%{public}s %{public}s]:%i Missing data when Lc is > 0", v85, v84, v105, 189);
      }
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v86 = object_getClass(v6);
      if (class_isMetaClass(v86))
        v87 = 43;
      else
        v87 = 45;
      v88 = object_getClassName(v6);
      v89 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v109 = v87;
      v110 = 2082;
      v111 = v88;
      v112 = 2082;
      v113 = v89;
      v114 = 1024;
      v115 = 189;
      v20 = "%c[%{public}s %{public}s]:%i Missing data when Lc is > 0";
      goto LABEL_12;
    }
LABEL_16:
    v22 = -[NSData copy](v7, "copy");
    v23 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v22;

LABEL_17:
    v21 = v6;
    goto LABEL_18;
  }
  v9 = NFLogGetLogger();
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    v11 = object_getClass(v6);
    v12 = class_isMetaClass(v11);
    v13 = object_getClassName(v6);
    v100 = sel_getName(a2);
    v14 = 45;
    if (v12)
      v14 = 43;
    v10(3, "%c[%{public}s %{public}s]:%i Invalid APDU format", v14, v13, v100, 106);
  }
  NFSharedLogGetLogger();
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    goto LABEL_13;
  v16 = object_getClass(v6);
  if (class_isMetaClass(v16))
    v17 = 43;
  else
    v17 = 45;
  v18 = object_getClassName(v6);
  v19 = sel_getName(a2);
  *(_DWORD *)buf = 67109890;
  v109 = v17;
  v110 = 2082;
  v111 = v18;
  v112 = 2082;
  v113 = v19;
  v114 = 1024;
  v115 = 106;
  v20 = "%c[%{public}s %{public}s]:%i Invalid APDU format";
LABEL_12:
  _os_log_impl(&dword_215BBD000, v15, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
LABEL_13:

LABEL_14:
  v21 = 0;
LABEL_18:

  return v21;
}

- (uint8_t)instructionClass
{
  return *(_BYTE *)-[NSData bytes](self->_fullPacket, "bytes");
}

- (uint8_t)instructionCode
{
  return *(_BYTE *)(-[NSData bytes](self->_fullPacket, "bytes") + 1);
}

- (uint8_t)p1Parameter
{
  return *(_BYTE *)(-[NSData bytes](self->_fullPacket, "bytes") + 2);
}

- (uint8_t)p2Parameter
{
  return *(_BYTE *)(-[NSData bytes](self->_fullPacket, "bytes") + 3);
}

- (NSData)data
{
  NSUInteger location;

  location = self->_payloadOffset.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    return (NSData *)0;
  -[NSData subdataWithRange:](self->_fullPacket, "subdataWithRange:", location, self->_payloadOffset.length);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSInteger)expectedResponseLength
{
  return self->_le;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  objc_opt_class();
  v5 = objc_opt_new();
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_NSRange *)(v5 + 8) = self->_payloadOffset;
    *(_QWORD *)(v5 + 24) = self->_le;
    v7 = -[NSData copyWithZone:](self->_fullPacket, "copyWithZone:", a3);
    v8 = (void *)v6[4];
    v6[4] = v7;

  }
  return v6;
}

- (id)asData
{
  return self->_fullPacket;
}

- (id)description
{
  void *v3;
  unsigned __int8 *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("["));
  v4 = -[NSData bytes](self->_fullPacket, "bytes");
  if (-[NSData length](self->_fullPacket, "length"))
  {
    v5 = 0;
    do
    {
      if (-[NSData length](self->_fullPacket, "length") - 1 <= v5)
        v6 = CFSTR("0x%02X");
      else
        v6 = CFSTR("0x%02X, ");
      objc_msgSend(v3, "appendFormat:", v6, v4[v5++]);
    }
    while (-[NSData length](self->_fullPacket, "length") > v5);
  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullPacket, 0);
}

@end
