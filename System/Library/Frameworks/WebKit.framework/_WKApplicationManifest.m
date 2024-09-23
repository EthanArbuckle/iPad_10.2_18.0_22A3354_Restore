@implementation _WKApplicationManifest

- (_WKApplicationManifest)initWithJSONData:(id)a3 manifestURL:(id)a4 documentURL:(id)a5
{
  _WKApplicationManifest *v8;
  uint64_t v9;
  const void *v10;
  const WTF::URL *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  Object *v16;
  void *v17;
  WTF::StringImpl *v19[5];
  WTF::StringImpl *v20[5];
  WTF::StringImpl *v21;
  _BYTE v22[264];
  char v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_WKApplicationManifest;
  v8 = -[_WKApplicationManifest init](&v24, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a3, 4);
    if (v9)
    {
      v10 = (const void *)v9;
      MEMORY[0x19AEABCC8](&v21, v9);
      MEMORY[0x19AEABB18](v20, a4);
      MEMORY[0x19AEABB18](v19, a5);
      WebCore::ApplicationManifestParser::parseWithValidation((WebCore::ApplicationManifestParser *)&v21, (const WTF::String *)v20, (const WTF::URL *)v19, v11);
      v13 = v19[0];
      v19[0] = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2)
          WTF::StringImpl::destroy(v13, v12);
        else
          *(_DWORD *)v13 -= 2;
      }
      v14 = v20[0];
      v20[0] = 0;
      if (v14)
      {
        if (*(_DWORD *)v14 == 2)
          WTF::StringImpl::destroy(v14, v12);
        else
          *(_DWORD *)v14 -= 2;
      }
      v15 = v21;
      v21 = 0;
      if (v15)
      {
        if (*(_DWORD *)v15 == 2)
          WTF::StringImpl::destroy(v15, v12);
        else
          *(_DWORD *)v15 -= 2;
      }
      if (v23)
      {
        v16 = -[_WKApplicationManifest _apiObject](v8, "_apiObject");
        v16->var0 = (void **)off_1E34CC2A8;
        WebKit::InitializeWebKit2((WebKit *)v16);
        v16->var0 = (void **)&off_1E34BDAF0;
        WebCore::ApplicationManifest::ApplicationManifest((uint64_t)&v16[1], (uint64_t)v22);
        v16->var1 = v8;
        if (v23)
          WebCore::ApplicationManifest::~ApplicationManifest((WebCore::ApplicationManifest *)v22, v17);
      }
      else
      {
        v8 = 0;
      }
      CFRelease(v10);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKApplicationManifest)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  __int16 v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28;
  WTF::StringImpl *v29;
  WebCore *v30;
  CGColor *v31;
  uint64_t v32;
  uint64_t v33;
  WebCore *v34;
  CGColor *v35;
  uint64_t v36;
  uint64_t v37;
  _WKApplicationManifest *result;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  WTF::StringImpl *v45;
  void *v46;
  WTF::StringImpl *v47;
  WTF::StringImpl *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  Object *v52;
  void *v53;
  WTF::StringImpl *v54;
  WTF::StringImpl *v55;
  WTF::StringImpl *v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *v58;
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  _WKApplicationManifest *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[5];
  __int128 v68;
  __int128 v69;
  char v70;
  char v71;
  __int16 v72;
  WTF::StringImpl *v73;
  __int128 v74;
  __int128 v75;
  WTF::StringImpl *v76;
  __int128 v77;
  __int128 v78;
  WTF::StringImpl *v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  WTF::StringImpl *v88;
  __int128 v89;
  __int128 v90;
  WTF::StringImpl *v91;
  __int128 v92;
  __int128 v93;
  WTF::StringImpl *v94;
  __int128 v95;
  __int128 v96;
  WTF::StringImpl *v97;
  __int128 v98;
  __int128 v99;
  WTF::StringImpl *v100;
  WTF::StringImpl *v101;
  WTF::StringImpl *v102;
  WTF::StringImpl *v103;
  uint64_t v104;
  uint64_t v105[5];
  uint64_t v106;
  int v107;
  int v108;
  char v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  WTF::StringImpl *v114;
  WTF::StringImpl *v115;
  _BYTE v116[16];
  _QWORD v117[3];
  _QWORD v118[2];
  _QWORD v119[2];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("raw_json"));
  MEMORY[0x19AEABCC8](&v103, v5);
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  MEMORY[0x19AEABCC8](&v102, v6);
  v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("short_name"));
  MEMORY[0x19AEABCC8](&v101, v7);
  v8 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
  MEMORY[0x19AEABCC8](&v100, v8);
  v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scope"));
  MEMORY[0x19AEABB18](&v97, v9);
  v10 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("is_default_scope"));
  v11 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("display"));
  v12 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("orientation"));
  v13 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifest_url"));
  MEMORY[0x19AEABB18](&v94, v13);
  v14 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start_url"));
  MEMORY[0x19AEABB18](&v91, v14);
  v15 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestId"));
  MEMORY[0x19AEABB18](&v88, v15);
  v66 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("background_color"));
  v63 = self;
  v65 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("theme_color"));
  v16 = (void *)MEMORY[0x1E0C99E60];
  v119[0] = objc_opt_class();
  v119[1] = objc_opt_class();
  v64 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2)), CFSTR("categories"));
  v17 = (void *)MEMORY[0x1E0C99E60];
  v118[0] = objc_opt_class();
  v118[1] = objc_opt_class();
  v18 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2)), CFSTR("icons"));
  v19 = (void *)MEMORY[0x1E0C99E60];
  v117[0] = objc_opt_class();
  v117[1] = objc_opt_class();
  v117[2] = objc_opt_class();
  v20 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v19, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 3)), CFSTR("shortcuts"));
  v22 = v102;
  v21 = v103;
  v102 = 0;
  v103 = 0;
  v67[0] = v21;
  v67[1] = v22;
  v24 = v100;
  v23 = v101;
  v100 = 0;
  v101 = 0;
  v67[2] = v23;
  v67[3] = v24;
  v25 = v97;
  v97 = 0;
  v67[4] = v25;
  v68 = v98;
  v69 = v99;
  LODWORD(v98) = v98 & 0xFFFFFFFE;
  v70 = v10;
  v71 = v11;
  v26 = v12 | 0x100;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    v26 = 0;
  v72 = v26;
  v27 = v94;
  v94 = 0;
  v73 = v27;
  v74 = v95;
  v75 = v96;
  LODWORD(v95) = v95 & 0xFFFFFFFE;
  v28 = v91;
  v91 = 0;
  v76 = v28;
  v77 = v92;
  v78 = v93;
  LODWORD(v92) = v92 & 0xFFFFFFFE;
  v29 = v88;
  v88 = 0;
  v79 = v29;
  v80 = v89;
  v81 = v90;
  LODWORD(v89) = v89 & 0xFFFFFFFE;
  v30 = (WebCore *)objc_msgSend(v66, "CGColor");
  v32 = WebCore::roundAndClampToSRGBALossy(v30, v31);
  v33 = bswap32(v32) | 0x1104000000000000;
  if (!BYTE4(v32))
    v33 = 0;
  v82 = v33;
  v34 = (WebCore *)objc_msgSend(v65, "CGColor");
  v36 = WebCore::roundAndClampToSRGBALossy(v34, v35);
  v37 = bswap32(v36) | 0x1104000000000000;
  if (!BYTE4(v36))
    v37 = 0;
  v83 = v37;
  WTF::makeVector<WTF::String>(v64, (uint64_t)&v84);
  WTF::makeVector<WebCore::ApplicationManifest::Icon>((uint64_t)&v85, v18);
  v86 = 0;
  v87 = 0;
  result = (_WKApplicationManifest *)objc_msgSend(v20, "count");
  v39 = (int)result;
  if (result)
  {
    if ((unint64_t)result >> 26)
    {
      __break(0xC471u);
      return result;
    }
    v40 = WTF::fastMalloc((WTF *)((_QWORD)result << 6));
    LODWORD(v87) = v39;
    v86 = v40;
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v41 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v111 != v42)
          objc_enumerationMutation(v20);
        v44 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
        objc_opt_class();
        if (((v44 != 0) & objc_opt_isKindOfClass()) != 0)
        {
          MEMORY[0x19AEABCC8](&v114, objc_msgSend(v44, "name"));
          MEMORY[0x19AEABB18](&v115, objc_msgSend(v44, "url"));
          WTF::makeVector<WebCore::ApplicationManifest::Icon>((uint64_t)v116, (void *)objc_msgSend(v44, "icons"));
          std::__optional_destruct_base<WebCore::ApplicationManifest::Shortcut,false>::__optional_destruct_base[abi:sn180100]<WebCore::ApplicationManifest::Shortcut>((uint64_t)&v104, (uint64_t *)&v114);
          WTF::Vector<WebCore::ApplicationManifest::Icon,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v116, v46);
          v47 = v115;
          v115 = 0;
          if (v47)
          {
            if (*(_DWORD *)v47 == 2)
              WTF::StringImpl::destroy(v47, v45);
            else
              *(_DWORD *)v47 -= 2;
          }
          v48 = v114;
          v114 = 0;
          if (v48)
          {
            if (*(_DWORD *)v48 == 2)
              WTF::StringImpl::destroy(v48, v45);
            else
              *(_DWORD *)v48 -= 2;
          }
          if (v109)
          {
            if (HIDWORD(v87) == (_DWORD)v87)
            {
              WTF::Vector<WebCore::ApplicationManifest::Shortcut,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::ApplicationManifest::Shortcut>((uint64_t)&v86, (unint64_t)&v104);
            }
            else
            {
              v49 = v86 + ((unint64_t)HIDWORD(v87) << 6);
              v50 = v104;
              v104 = 0;
              *(_QWORD *)v49 = v50;
              WTF::URL::URL(v49 + 8, v105);
              *(_QWORD *)(v49 + 48) = 0;
              *(_QWORD *)(v49 + 56) = 0;
              v51 = v106;
              v106 = 0;
              *(_QWORD *)(v49 + 48) = v51;
              LODWORD(v51) = v107;
              v107 = 0;
              *(_DWORD *)(v49 + 56) = v51;
              LODWORD(v51) = v108;
              v108 = 0;
              *(_DWORD *)(v49 + 60) = v51;
              ++HIDWORD(v87);
            }
          }
        }
        else
        {
          LOBYTE(v104) = 0;
          v109 = 0;
        }
        std::__optional_destruct_base<WebCore::ApplicationManifest::Shortcut,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v104, v45);
      }
      v41 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
    }
    while (v41);
  }
  WTF::Vector<WebCore::ApplicationManifest::Shortcut,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&v86, HIDWORD(v87));
  v52 = -[_WKApplicationManifest _apiObject](v63, "_apiObject");
  v52->var0 = (void **)off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v52);
  v52->var0 = (void **)&off_1E34BDAF0;
  WebCore::ApplicationManifest::ApplicationManifest((uint64_t)&v52[1], (uint64_t)v67);
  v52->var1 = v63;
  WebCore::ApplicationManifest::~ApplicationManifest((WebCore::ApplicationManifest *)v67, v53);
  v55 = v88;
  v88 = 0;
  if (v55)
  {
    if (*(_DWORD *)v55 == 2)
      WTF::StringImpl::destroy(v55, v54);
    else
      *(_DWORD *)v55 -= 2;
  }
  v56 = v91;
  v91 = 0;
  if (v56)
  {
    if (*(_DWORD *)v56 == 2)
      WTF::StringImpl::destroy(v56, v54);
    else
      *(_DWORD *)v56 -= 2;
  }
  v57 = v94;
  v94 = 0;
  if (v57)
  {
    if (*(_DWORD *)v57 == 2)
      WTF::StringImpl::destroy(v57, v54);
    else
      *(_DWORD *)v57 -= 2;
  }
  v58 = v97;
  v97 = 0;
  if (v58)
  {
    if (*(_DWORD *)v58 == 2)
      WTF::StringImpl::destroy(v58, v54);
    else
      *(_DWORD *)v58 -= 2;
  }
  v59 = v100;
  v100 = 0;
  if (v59)
  {
    if (*(_DWORD *)v59 == 2)
      WTF::StringImpl::destroy(v59, v54);
    else
      *(_DWORD *)v59 -= 2;
  }
  v60 = v101;
  v101 = 0;
  if (v60)
  {
    if (*(_DWORD *)v60 == 2)
      WTF::StringImpl::destroy(v60, v54);
    else
      *(_DWORD *)v60 -= 2;
  }
  v61 = v102;
  v102 = 0;
  if (v61)
  {
    if (*(_DWORD *)v61 == 2)
      WTF::StringImpl::destroy(v61, v54);
    else
      *(_DWORD *)v61 -= 2;
  }
  v62 = v103;
  v103 = 0;
  if (v62)
  {
    if (*(_DWORD *)v62 == 2)
      WTF::StringImpl::destroy(v62, v54);
    else
      *(_DWORD *)v62 -= 2;
  }
  return v63;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebCore::ApplicationManifest::~ApplicationManifest((WebCore::ApplicationManifest *)&self->_applicationManifest.data.__lx[16], v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKApplicationManifest;
    -[_WKApplicationManifest dealloc](&v5, sel_dealloc);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;

  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest rawJSON](self, "rawJSON"), CFSTR("raw_json"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest name](self, "name"), CFSTR("name"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest shortName](self, "shortName"), CFSTR("short_name"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest applicationDescription](self, "applicationDescription"), CFSTR("description"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest scope](self, "scope"), CFSTR("scope"));
  objc_msgSend(a3, "encodeBool:forKey:", -[_WKApplicationManifest isDefaultScope](self, "isDefaultScope"), CFSTR("is_default_scope"));
  objc_msgSend(a3, "encodeInteger:forKey:", self[1]._applicationManifest.data.__lx[33], CFSTR("display"));
  if (self[1]._applicationManifest.data.__lx[35])
    v5 = self[1]._applicationManifest.data.__lx[34];
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a3, "encodeInteger:forKey:", v5, CFSTR("orientation"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest manifestURL](self, "manifestURL"), CFSTR("manifest_url"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest startURL](self, "startURL"), CFSTR("start_url"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest manifestId](self, "manifestId"), CFSTR("manifestId"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest backgroundColor](self, "backgroundColor"), CFSTR("background_color"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest themeColor](self, "themeColor"), CFSTR("theme_color"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest categories](self, "categories"), CFSTR("categories"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest icons](self, "icons"), CFSTR("icons"));
  objc_msgSend(a3, "encodeObject:forKey:", -[_WKApplicationManifest shortcuts](self, "shortcuts"), CFSTR("shortcuts"));
}

+ (id)applicationManifestFromJSON:(id)a3 manifestURL:(id)a4 documentURL:(id)a5
{
  const WTF::URL *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  const void *v12;
  void *v13;
  CFTypeRef v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v17[5];
  WTF::StringImpl *v18[5];
  WTF::StringImpl *v19;
  _BYTE v20[264];

  MEMORY[0x19AEABCC8](&v19, a3);
  MEMORY[0x19AEABB18](v18, a4);
  MEMORY[0x19AEABB18](v17, a5);
  WebCore::ApplicationManifestParser::parse((WebCore::ApplicationManifestParser *)&v19, (const WTF::String *)v18, (const WTF::URL *)v17, v7);
  v9 = v17[0];
  v17[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
  v10 = v18[0];
  v18[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v19;
  v19 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v8);
    else
      *(_DWORD *)v11 -= 2;
  }
  API::ApplicationManifest::create((API::ApplicationManifest *)v20, v18);
  v12 = (const void *)*((_QWORD *)v18[0] + 1);
  if (v12)
    CFRetain(*((CFTypeRef *)v18[0] + 1));
  v14 = (id)CFMakeCollectable(v12);
  v15 = v18[0];
  v18[0] = 0;
  if (v15)
    CFRelease(*((CFTypeRef *)v15 + 1));
  WebCore::ApplicationManifest::~ApplicationManifest((WebCore::ApplicationManifest *)v20, v13);
  return (id)v14;
}

- (Object)_apiObject
{
  return (Object *)&self->_applicationManifest;
}

- (NSString)rawJSON
{
  NSString *result;

  result = *(NSString **)&self->_applicationManifest.data.__lx[16];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (NSString)name
{
  NSString *result;

  result = *(NSString **)&self->_applicationManifest.data.__lx[24];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (NSString)shortName
{
  NSString *result;

  result = *(NSString **)&self->_applicationManifest.data.__lx[32];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (NSString)applicationDescription
{
  NSString *result;

  result = *(NSString **)&self->_applicationManifest.data.__lx[40];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (NSURL)scope
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (BOOL)isDefaultScope
{
  return self[1]._applicationManifest.data.__lx[32];
}

- (NSURL)manifestURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (NSURL)startURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (UIColor)backgroundColor
{
  CFTypeRef cf;

  WebCore::cocoaColor((WebCore *)&self[4], (const Color *)a2);
  return (UIColor *)(id)CFMakeCollectable(cf);
}

- (UIColor)themeColor
{
  CFTypeRef cf;

  WebCore::cocoaColor((WebCore *)&self[4]._applicationManifest, (const Color *)a2);
  return (UIColor *)(id)CFMakeCollectable(cf);
}

- (int64_t)displayMode
{
  if (self[1]._applicationManifest.data.__lx[33] - 1 < 3)
    return (self[1]._applicationManifest.data.__lx[33] - 1) + 1;
  else
    return 0;
}

- (optional<_WKApplicationManifestOrientation>)orientation
{
  unint64_t v2;
  $30EDB2C23837B5636D2A627A1D04886E v3;
  _BOOL8 v4;
  optional<_WKApplicationManifestOrientation> result;

  if (self[1]._applicationManifest.data.__lx[35] && (v2 = (char)self[1]._applicationManifest.data.__lx[34], v2 <= 7))
  {
    v3 = stru_1978CF6D8[v2];
    v4 = 1;
  }
  else
  {
    v3.var1 = 0;
    v4 = 0;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (NSArray)categories
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  const __CFString *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)&self[4]._applicationManifest.data.__lx[20]);
  v4 = *(unsigned int *)&self[4]._applicationManifest.data.__lx[20];
  if ((_DWORD)v4)
  {
    v5 = *(_QWORD **)&self[4]._applicationManifest.data.__lx[8];
    v6 = 8 * v4;
    while (*v5)
    {
      v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (v7)
        goto LABEL_5;
LABEL_6:
      ++v5;
      v6 -= 8;
      if (!v6)
        return (NSArray *)(id)CFMakeCollectable(v3);
    }
    v7 = &stru_1E351F1B8;
LABEL_5:
    objc_msgSend(v3, "addObject:", v7);
    goto LABEL_6;
  }
  return (NSArray *)(id)CFMakeCollectable(v3);
}

- (NSArray)icons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _WKApplicationManifestIcon *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)&self[4]._applicationManifest.data.__lx[36]);
  v4 = *(unsigned int *)&self[4]._applicationManifest.data.__lx[36];
  if ((_DWORD)v4)
  {
    v5 = *(_QWORD *)&self[4]._applicationManifest.data.__lx[24];
    v6 = 72 * v4;
    do
    {
      v7 = -[_WKApplicationManifestIcon initWithCoreIcon:]([_WKApplicationManifestIcon alloc], "initWithCoreIcon:", v5);
      if (v7)
      {
        objc_msgSend(v3, "addObject:", v7);
        CFRelease(v7);
      }
      v5 += 72;
      v6 -= 72;
    }
    while (v6);
  }
  return (NSArray *)(id)CFMakeCollectable(v3);
}

- (NSArray)shortcuts
{
  void *v3;
  uint64_t isa_high;
  uint64_t v5;
  uint64_t v6;
  _WKApplicationManifestShortcut *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", HIDWORD(self[5].super.isa));
  isa_high = HIDWORD(self[5].super.isa);
  if ((_DWORD)isa_high)
  {
    v5 = *(_QWORD *)&self[4]._applicationManifest.data.__lx[40];
    v6 = isa_high << 6;
    do
    {
      v7 = -[_WKApplicationManifestShortcut initWithCoreShortcut:]([_WKApplicationManifestShortcut alloc], "initWithCoreShortcut:", v5);
      if (v7)
      {
        objc_msgSend(v3, "addObject:", v7);
        CFRelease(v7);
      }
      v5 += 64;
      v6 -= 64;
    }
    while (v6);
  }
  return (NSArray *)(id)CFMakeCollectable(v3);
}

- (NSURL)manifestId
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

@end
