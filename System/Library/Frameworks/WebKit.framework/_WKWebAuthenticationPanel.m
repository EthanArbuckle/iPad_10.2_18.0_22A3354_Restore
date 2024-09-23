@implementation _WKWebAuthenticationPanel

+ (id)getAllLocalAuthenticatorCredentialsWithRPIDAndAccessGroup:(id)a3 rpID:(id)a4
{
  CFTypeRef cf;

  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)a3, (NSData *)a4, 0);
  return (id)(id)CFMakeCollectable(cf);
}

+ (id)getAllLocalAuthenticatorCredentials
{
  CFTypeRef cf;

  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.webkit.webauthn"), 0, 0);
  return (id)(id)CFMakeCollectable(cf);
}

- (_WKWebAuthenticationPanel)init
{
  _WKWebAuthenticationPanel *v2;
  _WKWebAuthenticationPanel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKWebAuthenticationPanel;
  v2 = -[_WKWebAuthenticationPanel init](&v5, sel_init);
  v3 = v2;
  if (v2)
    *((_QWORD *)API::WebAuthenticationPanel::WebAuthenticationPanel((API::WebAuthenticationPanel *)-[_WKWebAuthenticationPanel _apiObject](v2, "_apiObject"))+ 1) = v2;
  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::WebAuthenticationPanel::~WebAuthenticationPanel((API::WebAuthenticationPanel *)&self->_panel, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKWebAuthenticationPanel;
    -[_WKWebAuthenticationPanel dealloc](&v5, sel_dealloc);
  }
}

- (_WKWebAuthenticationPanelDelegate)delegate
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v3;
  id WeakRetained;

  m_ptr = self->_client.m_impl.m_ptr;
  if (!m_ptr)
    return 0;
  v3 = *((_QWORD *)m_ptr + 1);
  if (!v3)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
  return (_WKWebAuthenticationPanelDelegate *)(id)CFMakeCollectable(WeakRetained);
}

- (void)setDelegate:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *m_ptr;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = WTF::fastMalloc((WTF *)0x28);
  WebKit::WebAuthenticationPanelClient::WebAuthenticationPanelClient(v5, (uint64_t)self, a3);
  v17 = v5;
  v7 = *(_QWORD *)(v5 + 8);
  if (v7)
    goto LABEL_17;
  v7 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)v7 = 1;
  *(_QWORD *)(v7 + 8) = v5;
  v8 = *(unsigned int **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v7;
  if (!v8)
    goto LABEL_17;
  do
  {
    v9 = __ldaxr(v8);
    v10 = v9 - 1;
  }
  while (__stlxr(v10, v8));
  if (!v10)
  {
    atomic_store(1u, v8);
    WTF::fastFree((WTF *)v8, v6);
  }
  v7 = *(_QWORD *)(v5 + 8);
  if (v7)
  {
LABEL_17:
    do
      v11 = __ldaxr((unsigned int *)v7);
    while (__stlxr(v11 + 1, (unsigned int *)v7));
  }
  m_ptr = (unsigned int *)self->_client.m_impl.m_ptr;
  self->_client.m_impl.m_ptr = (DefaultWeakPtrImpl *)v7;
  if (m_ptr)
  {
    do
    {
      v13 = __ldaxr(m_ptr);
      v14 = v13 - 1;
    }
    while (__stlxr(v14, m_ptr));
    if (!v14)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v6);
    }
  }
  v15 = v17;
  v17 = 0;
  v16 = *(_QWORD *)&self->_panel.data.__lx[32];
  *(_QWORD *)&self->_panel.data.__lx[32] = v15;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  std::unique_ptr<WebKit::WebAuthenticationPanelClient>::reset[abi:sn180100](&v17);
}

- (NSString)relyingPartyID
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)self->_anon_38;
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (NSSet)transports
{
  NSSet *result;
  void *v4;
  void *v5;
  void *m_ptr;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  id v10;
  uint64_t v11;
  const void *v12;

  result = (NSSet *)self->_transports.m_ptr;
  if (!result)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", *(unsigned int *)&self->_anon_38[20]);
    v5 = v4;
    if (v4)
      CFRetain(v4);
    m_ptr = self->_transports.m_ptr;
    self->_transports.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = *(unsigned int *)&self->_anon_38[20];
    if ((_DWORD)v7)
    {
      v8 = *(_BYTE **)&self->_anon_38[8];
      do
      {
        v9 = self->_transports.m_ptr;
        v10 = objc_alloc(MEMORY[0x1E0CB37E8]);
        if (*v8 - 1 < 6)
          v11 = (*v8 - 1) + 1;
        else
          v11 = 0;
        v12 = (const void *)objc_msgSend(v10, "initWithInt:", v11);
        objc_msgSend(v9, "addObject:", v12);
        if (v12)
          CFRelease(v12);
        ++v8;
        --v7;
      }
      while (v7);
    }
    return (NSSet *)self->_transports.m_ptr;
  }
  return result;
}

- (int64_t)type
{
  return self->_anon_38[24];
}

- (NSString)userName
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)&self->_anon_38[32];
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

+ (id)getAllLocalAuthenticatorCredentialsWithAccessGroup:(id)a3
{
  CFTypeRef cf;

  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)a3, 0, 0);
  return (id)(id)CFMakeCollectable(cf);
}

+ (id)getAllLocalAuthenticatorCredentialsWithRPID:(id)a3
{
  CFTypeRef cf;

  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.webkit.webauthn"), (NSData *)a3, 0);
  return (id)(id)CFMakeCollectable(cf);
}

+ (id)getAllLocalAuthenticatorCredentialsWithCredentialID:(id)a3
{
  CFTypeRef cf;

  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.webkit.webauthn"), 0, (uint64_t)a3);
  return (id)(id)CFMakeCollectable(cf);
}

+ (id)getAllLocalAuthenticatorCredentialsWithCredentialIDAndAccessGroup:(id)a3 credentialID:(id)a4
{
  CFTypeRef cf;

  getAllLocalAuthenticatorCredentialsImpl((NSString *)&cf, (NSString *)a3, 0, (uint64_t)a4);
  return (id)(id)CFMakeCollectable(cf);
}

+ (void)deleteLocalAuthenticatorCredentialWithID:(id)a3
{
  objc_msgSend(a1, "deleteLocalAuthenticatorCredentialWithGroupAndID:credential:", 0, a3);
}

+ (void)deleteLocalAuthenticatorCredentialWithGroupAndID:(id)a3 credential:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = *MEMORY[0x1E0CD6CC0];
  v8 = *MEMORY[0x1E0CD6900];
  v11[0] = *MEMORY[0x1E0CD6C98];
  v11[1] = v8;
  v12[0] = v7;
  v12[1] = a4;
  v9 = *MEMORY[0x1E0CD6B80];
  v11[2] = *MEMORY[0x1E0CD70A8];
  v11[3] = v9;
  v10 = *MEMORY[0x1E0CD6B88];
  v12[2] = MEMORY[0x1E0C9AAB0];
  v12[3] = v10;
  objc_msgSend(v6, "setDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4));
  if (a3)
    objc_msgSend(v6, "setObject:forKey:", a3, *MEMORY[0x1E0CD6B60]);
  SecItemDelete((CFDictionaryRef)v6);
  if (v6)
    CFRelease(v6);
}

+ (void)setDisplayNameForLocalCredentialWithGroupAndID:(id)a3 credential:(id)a4 displayName:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OSStatus v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *Map;
  _QWORD *v28;
  _QWORD *v29;
  char v30;
  _QWORD *String;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  _QWORD *v34;
  _QWORD *v35;
  BOOL v36;
  WTF::StringImpl *v37;
  WTF::StringImpl *v38;
  const void *v39;
  const __CFDictionary *v40;
  void *v41;
  WTF *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  WTF *v48;
  int v49;
  unsigned int v50;
  char v51;
  WTF::StringImpl *v52;
  _QWORD v53[4];
  WTF **v54;
  WTF *v55[2];
  _DWORD v56[8];
  char v57;
  CFTypeRef result;
  WTF **v59;
  _QWORD v60[3];
  _QWORD v61[3];
  uint64_t v62;
  const void *v63;
  _QWORD v64[6];
  _QWORD v65[8];

  v65[6] = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = *MEMORY[0x1E0CD6C98];
  v10 = *MEMORY[0x1E0CD6CC0];
  v11 = *MEMORY[0x1E0CD7010];
  v64[0] = *MEMORY[0x1E0CD6C98];
  v64[1] = v11;
  v65[0] = v10;
  v65[1] = MEMORY[0x1E0C9AAB0];
  v12 = *MEMORY[0x1E0CD7020];
  v64[2] = *MEMORY[0x1E0CD6900];
  v64[3] = v12;
  v13 = *MEMORY[0x1E0C9AE50];
  v65[2] = a4;
  v65[3] = v13;
  v14 = *MEMORY[0x1E0CD6B80];
  v15 = *MEMORY[0x1E0CD6B88];
  v16 = *MEMORY[0x1E0CD70A8];
  v64[4] = *MEMORY[0x1E0CD6B80];
  v64[5] = v16;
  v65[4] = v15;
  v65[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 6));
  if (a3)
    objc_msgSend(v8, "setObject:forKey:", a3, *MEMORY[0x1E0CD6B60]);
  result = 0;
  v17 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v17 != -25300 && v17)
    goto LABEL_52;
  v46 = v15;
  v18 = (void *)result;
  v47 = *MEMORY[0x1E0CD6908];
  v19 = (void *)objc_msgSend((id)result, "objectForKeyedSubscript:");
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "bytes");
    v22 = objc_msgSend(v20, "length");
    v23 = v22;
    if (v22)
    {
      if (HIDWORD(v22))
      {
        __break(0xC471u);
        return;
      }
      v24 = WTF::fastMalloc((WTF *)v22);
      v20 = (void *)v24;
      v25 = 0;
      do
      {
        *(_BYTE *)(v24 + v25) = *(_BYTE *)(v21 + v25);
        ++v25;
      }
      while (v23 != v25);
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    LODWORD(v23) = 0;
  }
  v53[0] = v20;
  v53[1] = v23;
  cbor::CBORReader::read();
  if (v20)
    WTF::fastFree((WTF *)v20, v26);
  if (v57)
  {
    if (v56[0] != 5)
    {
LABEL_49:
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
      goto LABEL_50;
    }
    Map = (_QWORD *)cbor::CBORValue::getMap((cbor::CBORValue *)v56);
    v44 = v14;
    v45 = v10;
    v43 = v9;
    v55[0] = 0;
    v55[1] = 0;
    v54 = v55;
    v28 = Map + 1;
    v29 = (_QWORD *)*Map;
    if ((_QWORD *)*Map == Map + 1)
    {
      v30 = 0;
      if (!a5)
        goto LABEL_40;
    }
    else
    {
      v30 = 0;
      do
      {
        if (*((_DWORD *)v29 + 8) == 3
          && (String = (_QWORD *)cbor::CBORValue::getString((cbor::CBORValue *)(v29 + 4)),
              MEMORY[0x19AEABBCC](*String, "displayName", 11)))
        {
          if (a5)
          {
            MEMORY[0x19AEABCC8](&v52, a5);
            cbor::CBORValue::CBORValue();
            cbor::CBORValue::clone((cbor::CBORValue *)(v29 + 4));
            v59 = &v48;
            std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v54, (cbor::CBORValue *)&v48);
            cbor::CBORValue::operator=();
            cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v48);
            cbor::CBORValue::~CBORValue((cbor::CBORValue *)v53);
            v33 = v52;
            v52 = 0;
            if (v33)
            {
              if (*(_DWORD *)v33 == 2)
                WTF::StringImpl::destroy(v33, v32);
              else
                *(_DWORD *)v33 -= 2;
            }
          }
          v30 = 1;
        }
        else
        {
          cbor::CBORValue::clone((cbor::CBORValue *)(v29 + 8));
          cbor::CBORValue::clone((cbor::CBORValue *)(v29 + 4));
          v59 = &v48;
          std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v54, (cbor::CBORValue *)&v48);
          cbor::CBORValue::operator=();
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v48);
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)v53);
        }
        v34 = (_QWORD *)v29[1];
        if (v34)
        {
          do
          {
            v35 = v34;
            v34 = (_QWORD *)*v34;
          }
          while (v34);
        }
        else
        {
          do
          {
            v35 = (_QWORD *)v29[2];
            v36 = *v35 == (_QWORD)v29;
            v29 = v35;
          }
          while (!v36);
        }
        v29 = v35;
      }
      while (v35 != v28);
      if (!a5)
      {
LABEL_40:
        cbor::CBORValue::CBORValue();
        cbor::CBORWriter::write();
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v53);
        if (!v51)
          __break(1u);
        v39 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v48, v50);
        v62 = v47;
        v63 = v39;
        v40 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v60[0] = *MEMORY[0x1E0CD70E0];
        v61[0] = objc_msgSend(v18, "objectForKey:");
        v61[1] = v45;
        v60[1] = v43;
        v60[2] = v44;
        v61[2] = v46;
        objc_msgSend(v8, "setDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3));
        if (a3)
          objc_msgSend(v8, "setObject:forKey:", a3, *MEMORY[0x1E0CD6B60]);
        SecItemUpdate((CFDictionaryRef)v8, v40);
        if (v39)
          CFRelease(v39);
        if (v51)
        {
          v42 = v48;
          if (v48)
          {
            v48 = 0;
            v49 = 0;
            WTF::fastFree(v42, v41);
          }
        }
        std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::destroy((uint64_t)&v54, v55[0]);
        if (!v57)
          goto LABEL_50;
        goto LABEL_49;
      }
    }
    if ((v30 & 1) == 0)
    {
      MEMORY[0x19AEABCC8](&v52, a5);
      cbor::CBORValue::CBORValue();
      cbor::CBORValue::CBORValue();
      v59 = &v48;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v54, (cbor::CBORValue *)&v48);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v48);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v53);
      v38 = v52;
      v52 = 0;
      if (v38)
      {
        if (*(_DWORD *)v38 == 2)
          WTF::StringImpl::destroy(v38, v37);
        else
          *(_DWORD *)v38 -= 2;
      }
    }
    goto LABEL_40;
  }
LABEL_50:
  if (v18)
    CFRelease(v18);
LABEL_52:
  if (v8)
    CFRelease(v8);
}

+ (void)setNameForLocalCredentialWithGroupAndID:(id)a3 credential:(id)a4 name:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OSStatus v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *Map;
  _QWORD *v28;
  _QWORD *v29;
  char v30;
  _QWORD *String;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  _QWORD *v34;
  _QWORD *v35;
  BOOL v36;
  WTF::StringImpl *v37;
  WTF::StringImpl *v38;
  const void *v39;
  const __CFDictionary *v40;
  void *v41;
  WTF *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  WTF *v48;
  int v49;
  unsigned int v50;
  char v51;
  WTF::StringImpl *v52;
  _QWORD v53[4];
  WTF **v54;
  WTF *v55[2];
  _DWORD v56[8];
  char v57;
  CFTypeRef result;
  WTF **v59;
  _QWORD v60[3];
  _QWORD v61[3];
  uint64_t v62;
  const void *v63;
  _QWORD v64[6];
  _QWORD v65[8];

  v65[6] = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = *MEMORY[0x1E0CD6C98];
  v10 = *MEMORY[0x1E0CD6CC0];
  v11 = *MEMORY[0x1E0CD7010];
  v64[0] = *MEMORY[0x1E0CD6C98];
  v64[1] = v11;
  v65[0] = v10;
  v65[1] = MEMORY[0x1E0C9AAB0];
  v12 = *MEMORY[0x1E0CD7020];
  v64[2] = *MEMORY[0x1E0CD6900];
  v64[3] = v12;
  v13 = *MEMORY[0x1E0C9AE50];
  v65[2] = a4;
  v65[3] = v13;
  v14 = *MEMORY[0x1E0CD6B80];
  v15 = *MEMORY[0x1E0CD6B88];
  v16 = *MEMORY[0x1E0CD70A8];
  v64[4] = *MEMORY[0x1E0CD6B80];
  v64[5] = v16;
  v65[4] = v15;
  v65[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 6));
  if (a3)
    objc_msgSend(v8, "setObject:forKey:", a3, *MEMORY[0x1E0CD6B60]);
  result = 0;
  v17 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v17 != -25300 && v17)
    goto LABEL_52;
  v46 = v15;
  v18 = (void *)result;
  v47 = *MEMORY[0x1E0CD6908];
  v19 = (void *)objc_msgSend((id)result, "objectForKeyedSubscript:");
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "bytes");
    v22 = objc_msgSend(v20, "length");
    v23 = v22;
    if (v22)
    {
      if (HIDWORD(v22))
      {
        __break(0xC471u);
        return;
      }
      v24 = WTF::fastMalloc((WTF *)v22);
      v20 = (void *)v24;
      v25 = 0;
      do
      {
        *(_BYTE *)(v24 + v25) = *(_BYTE *)(v21 + v25);
        ++v25;
      }
      while (v23 != v25);
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    LODWORD(v23) = 0;
  }
  v53[0] = v20;
  v53[1] = v23;
  cbor::CBORReader::read();
  if (v20)
    WTF::fastFree((WTF *)v20, v26);
  if (v57)
  {
    if (v56[0] != 5)
    {
LABEL_49:
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v56);
      goto LABEL_50;
    }
    Map = (_QWORD *)cbor::CBORValue::getMap((cbor::CBORValue *)v56);
    v44 = v14;
    v45 = v10;
    v43 = v9;
    v55[0] = 0;
    v55[1] = 0;
    v54 = v55;
    v28 = Map + 1;
    v29 = (_QWORD *)*Map;
    if ((_QWORD *)*Map == Map + 1)
    {
      v30 = 0;
      if (!a5)
        goto LABEL_40;
    }
    else
    {
      v30 = 0;
      do
      {
        if (*((_DWORD *)v29 + 8) == 3
          && (String = (_QWORD *)cbor::CBORValue::getString((cbor::CBORValue *)(v29 + 4)),
              MEMORY[0x19AEABBCC](*String, "name", 4)))
        {
          if (a5)
          {
            MEMORY[0x19AEABCC8](&v52, a5);
            cbor::CBORValue::CBORValue();
            cbor::CBORValue::clone((cbor::CBORValue *)(v29 + 4));
            v59 = &v48;
            std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v54, (cbor::CBORValue *)&v48);
            cbor::CBORValue::operator=();
            cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v48);
            cbor::CBORValue::~CBORValue((cbor::CBORValue *)v53);
            v33 = v52;
            v52 = 0;
            if (v33)
            {
              if (*(_DWORD *)v33 == 2)
                WTF::StringImpl::destroy(v33, v32);
              else
                *(_DWORD *)v33 -= 2;
            }
          }
          v30 = 1;
        }
        else
        {
          cbor::CBORValue::clone((cbor::CBORValue *)(v29 + 8));
          cbor::CBORValue::clone((cbor::CBORValue *)(v29 + 4));
          v59 = &v48;
          std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v54, (cbor::CBORValue *)&v48);
          cbor::CBORValue::operator=();
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v48);
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)v53);
        }
        v34 = (_QWORD *)v29[1];
        if (v34)
        {
          do
          {
            v35 = v34;
            v34 = (_QWORD *)*v34;
          }
          while (v34);
        }
        else
        {
          do
          {
            v35 = (_QWORD *)v29[2];
            v36 = *v35 == (_QWORD)v29;
            v29 = v35;
          }
          while (!v36);
        }
        v29 = v35;
      }
      while (v35 != v28);
      if (!a5)
      {
LABEL_40:
        cbor::CBORValue::CBORValue();
        cbor::CBORWriter::write();
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v53);
        if (!v51)
          __break(1u);
        v39 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v48, v50);
        v62 = v47;
        v63 = v39;
        v40 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v60[0] = *MEMORY[0x1E0CD70E0];
        v61[0] = objc_msgSend(v18, "objectForKey:");
        v61[1] = v45;
        v60[1] = v43;
        v60[2] = v44;
        v61[2] = v46;
        objc_msgSend(v8, "setDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3));
        if (a3)
          objc_msgSend(v8, "setObject:forKey:", a3, *MEMORY[0x1E0CD6B60]);
        SecItemUpdate((CFDictionaryRef)v8, v40);
        if (v39)
          CFRelease(v39);
        if (v51)
        {
          v42 = v48;
          if (v48)
          {
            v48 = 0;
            v49 = 0;
            WTF::fastFree(v42, v41);
          }
        }
        std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::destroy((uint64_t)&v54, v55[0]);
        if (!v57)
          goto LABEL_50;
        goto LABEL_49;
      }
    }
    if ((v30 & 1) == 0)
    {
      MEMORY[0x19AEABCC8](&v52, a5);
      cbor::CBORValue::CBORValue();
      cbor::CBORValue::CBORValue();
      v59 = &v48;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v54, (cbor::CBORValue *)&v48);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v48);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v53);
      v38 = v52;
      v52 = 0;
      if (v38)
      {
        if (*(_DWORD *)v38 == 2)
          WTF::StringImpl::destroy(v38, v37);
        else
          *(_DWORD *)v38 -= 2;
      }
    }
    goto LABEL_40;
  }
LABEL_50:
  if (v18)
    CFRelease(v18);
LABEL_52:
  if (v8)
    CFRelease(v8);
}

+ (id)importLocalAuthenticatorCredential:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "importLocalAuthenticatorWithAccessGroup:credential:error:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.webkit.webauthn"), a3, a4);
}

+ (id)importLocalAuthenticatorWithAccessGroup:(id)a3 credential:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v8;
  id result;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t Map;
  _QWORD *v15;
  _QWORD *v16;
  cbor::CBORValue *v17;
  int v18;
  uint64_t ByteString;
  const __CFData *v20;
  _QWORD *v21;
  cbor::CBORValue *v22;
  unsigned int v23;
  uint64_t v24;
  _QWORD *v25;
  cbor::CBORValue *v26;
  unsigned int v27;
  uint64_t v28;
  _QWORD *v29;
  cbor::CBORValue *v30;
  int v31;
  WTF::StringImpl *v32;
  _QWORD *v33;
  void *v34;
  cbor::CBORValue *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __SecKey *v42;
  __SecKey *v43;
  id v44;
  void *v45;
  __SecKey *v46;
  CFDataRef v47;
  CFDataRef v48;
  id v49;
  const __CFString *v50;
  WebKit *v51;
  WebKit *v52;
  const void *v53;
  id v54;
  const __CFString *v55;
  WebKit *v56;
  WebKit *v57;
  void *v58;
  WTF *v59;
  WTF *v60;
  void *v61;
  WTF *v62;
  uint64_t v63;
  uint64_t v64;
  WebKit *v65;
  __SecKey *v66;
  CFDataRef v67;
  CFTypeRef cf;
  PAL::CryptoDigest *v69;
  CFErrorRef error;
  WTF *v71;
  int v72;
  unsigned int v73;
  char v74;
  WTF *v75;
  uint64_t v76;
  _DWORD v77[8];
  char v78;
  _QWORD v79[3];
  _QWORD v80[5];

  v6 = a4;
  v80[3] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v8 = objc_msgSend(a4, "bytes");
    result = (id)objc_msgSend(v6, "length");
    v10 = (char *)result;
    if (result)
    {
      if ((unint64_t)result >> 32)
      {
        __break(0xC471u);
        goto LABEL_108;
      }
      v11 = WTF::fastMalloc((WTF *)result);
      v6 = (id)v11;
      v12 = 0;
      do
      {
        v12[v11] = v12[v8];
        ++v12;
      }
      while (v10 != v12);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    LODWORD(v10) = 0;
  }
  v75 = (WTF *)v6;
  v76 = v10;
  cbor::CBORReader::read();
  if (v6)
    WTF::fastFree((WTF *)v6, v13);
  if (v78 && v77[0] == 5)
  {
    Map = cbor::CBORValue::getMap((cbor::CBORValue *)v77);
    cbor::CBORValue::CBORValue((cbor::CBORValue *)&v75, "priv");
    v15 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v75);
    cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v75);
    v16 = (_QWORD *)(Map + 8);
    if ((_QWORD *)(Map + 8) != v15)
    {
      v18 = *((_DWORD *)v15 + 16);
      v17 = (cbor::CBORValue *)(v15 + 8);
      if (v18 == 2)
      {
        ByteString = cbor::CBORValue::getByteString(v17);
        v20 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)ByteString, *(unsigned int *)(ByteString + 12));
        cbor::CBORValue::CBORValue((cbor::CBORValue *)&v75, "key_type");
        v21 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v75);
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v75);
        if (v16 == v21 || (v23 = *((_DWORD *)v21 + 16), v22 = (cbor::CBORValue *)(v21 + 8), v23 >= 2))
        {
          if (!a5)
            goto LABEL_38;
        }
        else
        {
          v24 = *(_QWORD *)cbor::CBORValue::getInteger(v22);
          cbor::CBORValue::CBORValue((cbor::CBORValue *)&v75, "key_size");
          v25 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v75);
          cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v75);
          if (v16 != v25)
          {
            v27 = *((_DWORD *)v25 + 16);
            v26 = (cbor::CBORValue *)(v25 + 8);
            if (v27 < 2)
            {
              v28 = *(_QWORD *)cbor::CBORValue::getInteger(v26);
              cbor::CBORValue::CBORValue((cbor::CBORValue *)&v75, "rp");
              v29 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v75);
              cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v75);
              if (v16 != v29)
              {
                v31 = *((_DWORD *)v29 + 16);
                v30 = (cbor::CBORValue *)(v29 + 8);
                if (v31 == 3)
                {
                  v32 = *(WTF::StringImpl **)cbor::CBORValue::getString(v30);
                  if (v32)
                    *(_DWORD *)v32 += 2;
                  cbor::CBORValue::CBORValue((cbor::CBORValue *)&v75, "tag");
                  v33 = std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::find<cbor::CBORValue>(Map, (cbor::CBORValue *)&v75);
                  cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v75);
                  if (v16 == v33 || (v36 = *((_DWORD *)v33 + 16), v35 = (cbor::CBORValue *)(v33 + 8), v36 != 5))
                  {
                    v44 = 0;
                    if (a5)
                      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
                    goto LABEL_100;
                  }
                  v37 = cbor::CBORValue::getMap(v35);
                  MEMORY[0x19AEAC178](&v75, v37);
                  cbor::CBORWriter::write();
                  cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v75);
                  v79[0] = *MEMORY[0x1E0CD6A38];
                  v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), v24);
                  v39 = *MEMORY[0x1E0CD69F8];
                  v40 = *MEMORY[0x1E0CD6A00];
                  v80[0] = v38;
                  v80[1] = v40;
                  v41 = *MEMORY[0x1E0CD6A20];
                  v79[1] = v39;
                  v79[2] = v41;
                  v80[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v28);
                  error = 0;
                  v42 = SecKeyCreateWithData(v20, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3), &error);
                  v43 = v42;
                  if (error)
                  {
                    v44 = 0;
                    if (a5)
                      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
LABEL_95:
                    if (v43)
                      CFRelease(v43);
                    if (v74)
                    {
                      v62 = v71;
                      if (v71)
                      {
                        v71 = 0;
                        v72 = 0;
                        WTF::fastFree(v62, v34);
                      }
                    }
LABEL_100:
                    if (v32)
                    {
                      if (*(_DWORD *)v32 == 2)
                        WTF::StringImpl::destroy(v32, (WTF::StringImpl *)v34);
                      else
                        *(_DWORD *)v32 -= 2;
                    }
                    goto LABEL_39;
                  }
                  v46 = SecKeyCopyPublicKey(v42);
                  v47 = SecKeyCopyExternalRepresentation(v46, &error);
                  v48 = v47;
                  if (error)
                  {
                    v44 = 0;
                    if (a5)
                      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
LABEL_91:
                    if (v48)
                      CFRelease(v48);
                    if (v46)
                      CFRelease(v46);
                    goto LABEL_95;
                  }
                  v66 = v46;
                  v67 = v47;
                  PAL::CryptoDigest::create();
                  if (v48)
                  {
                    -[__CFData bytes](v48, "bytes");
                    -[__CFData length](v67, "length");
                  }
                  PAL::CryptoDigest::addBytes();
                  PAL::CryptoDigest::computeHash(v69);
                  cf = (CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v75, HIDWORD(v76));
                  v49 = objc_alloc(MEMORY[0x1E0C99E08]);
                  if (v32)
                    v50 = (const __CFString *)WTF::StringImpl::operator NSString *();
                  else
                    v50 = &stru_1E351F1B8;
                  v63 = *MEMORY[0x1E0CD70A8];
                  v64 = *MEMORY[0x1E0CD6A90];
                  v51 = (WebKit *)objc_msgSend(v49, "initWithObjectsAndKeys:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98], v40, v39, v50, *MEMORY[0x1E0CD6A90], cf, *MEMORY[0x1E0CD6900], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70A8], 0);
                  v65 = v51;
                  v52 = (WebKit *)WebKit::getASCWebKitSPISupportClass[0](v51);
                  if (v52
                    && objc_msgSend((id)WebKit::getASCWebKitSPISupportClass[0](v52), "shouldUseAlternateCredentialStore"))
                  {
                    -[WebKit setObject:forKey:](v51, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD6B80]);
                  }
                  if (a3)
                    -[WebKit setObject:forKey:](v51, "setObject:forKey:", a3, *MEMORY[0x1E0CD6898]);
                  result = (id)SecItemCopyMatching(v51, 0);
                  if (!(_DWORD)result)
                  {
                    v44 = 0;
                    if (a5)
                      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 15, 0);
                    v46 = v66;
                    v48 = v67;
                    goto LABEL_83;
                  }
                  if (v74)
                  {
                    v53 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v71, v73);
                    v54 = objc_alloc(MEMORY[0x1E0C99E08]);
                    if (v32)
                      v55 = (const __CFString *)WTF::StringImpl::operator NSString *();
                    else
                      v55 = &stru_1E351F1B8;
                    v56 = (WebKit *)objc_msgSend(v54, "initWithObjectsAndKeys:", v43, *MEMORY[0x1E0CD70E8], v40, v39, v55, v64, v53, *MEMORY[0x1E0CD6908], MEMORY[0x1E0C9AAB0], v63, *MEMORY[0x1E0CD68A8], *MEMORY[0x1E0CD68A0], 0);
                    v57 = (WebKit *)WebKit::getASCWebKitSPISupportClass[0](v56);
                    if (v57
                      && objc_msgSend((id)WebKit::getASCWebKitSPISupportClass[0](v57), "shouldUseAlternateCredentialStore"))
                    {
                      -[WebKit setObject:forKey:](v56, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD6B80]);
                    }
                    if (a3)
                      -[WebKit setObject:forKey:](v56, "setObject:forKey:", a3, *MEMORY[0x1E0CD6898]);
                    if (SecItemAdd(v56, 0))
                    {
                      v44 = 0;
                      if (a5)
                        *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
                    }
                    else
                    {
                      v58 = (void *)CFMakeCollectable(cf);
                      cf = 0;
                      v44 = v58;
                    }
                    v48 = v67;
                    if (v56)
                      CFRelease(v56);
                    if (v53)
                      CFRelease(v53);
                    v46 = v66;
LABEL_83:
                    if (v65)
                      CFRelease(v65);
                    if (cf)
                      CFRelease(cf);
                    v59 = v75;
                    if (v75)
                    {
                      v75 = 0;
                      LODWORD(v76) = 0;
                      WTF::fastFree(v59, v34);
                    }
                    if (v69)
                    {
                      PAL::CryptoDigest::~CryptoDigest(v69);
                      WTF::fastFree(v60, v61);
                    }
                    goto LABEL_91;
                  }
LABEL_108:
                  __break(1u);
                  return result;
                }
              }
              if (a5)
                goto LABEL_37;
LABEL_38:
              v44 = 0;
LABEL_39:
              if (v20)
                CFRelease(v20);
              goto LABEL_41;
            }
          }
          if (!a5)
            goto LABEL_38;
        }
LABEL_37:
        v44 = 0;
        *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
        goto LABEL_39;
      }
    }
    if (a5)
    {
      v45 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
      goto LABEL_29;
    }
LABEL_30:
    v44 = 0;
    goto LABEL_41;
  }
  if (!a5)
    goto LABEL_30;
  v45 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
LABEL_29:
  v44 = 0;
  *a5 = v45;
LABEL_41:
  if (v78)
    cbor::CBORValue::~CBORValue((cbor::CBORValue *)v77);
  return v44;
}

+ (id)exportLocalAuthenticatorCredentialWithID:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "exportLocalAuthenticatorCredentialWithGroupAndID:credential:error:", 0, a3, a4);
}

+ (id)exportLocalAuthenticatorCredentialWithGroupAndID:(id)a3 credential:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  OSStatus v12;
  CFTypeRef v13;
  NSData *v14;
  CFErrorRef v15;
  CFTypeRef v16;
  OSStatus v17;
  void *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  char *v26;
  uint64_t v27;
  char *v28;
  void *v29;
  void *v30;
  WTF *v31;
  WTF *v32;
  int v33;
  unsigned int v34;
  char v35;
  _DWORD v36[8];
  char v37;
  _QWORD v38[4];
  WTF **v39;
  WTF *v40[2];
  uint64_t v41;
  uint64_t valuePtr;
  CFTypeRef v43;
  CFErrorRef error;
  CFTypeRef result;
  WTF **v46;

  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9 = *MEMORY[0x1E0CD7028];
  v10 = (const __CFDictionary *)objc_msgSend(v8, "initWithObjectsAndKeys:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98], a4, *MEMORY[0x1E0CD6900], *MEMORY[0x1E0CD6A00], *MEMORY[0x1E0CD69F8], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70A8], *MEMORY[0x1E0CD6B88], *MEMORY[0x1E0CD6B80], 0);
  v11 = v10;
  if (a3)
    -[__CFDictionary setObject:forKey:](v10, "setObject:forKey:", a3, *MEMORY[0x1E0CD6B60]);
  result = 0;
  v12 = SecItemCopyMatching(v11, &result);
  if (v12 != -25300 && v12)
  {
    v16 = 0;
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 17, 0);
    goto LABEL_54;
  }
  v13 = result;
  error = 0;
  v14 = (NSData *)SecKeyCopyExternalRepresentation((SecKeyRef)result, &error);
  v15 = error;
  if (error)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 17, 0);
    CFRelease(v15);
LABEL_9:
    v16 = 0;
    goto LABEL_51;
  }
  -[__CFDictionary removeObjectForKey:](v11, "removeObjectForKey:", v9);
  -[__CFDictionary setObject:forKey:](v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7010]);
  v43 = 0;
  v17 = SecItemCopyMatching(v11, &v43);
  if (v17 != -25300 && v17)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 17, 0);
    goto LABEL_9;
  }
  v18 = (void *)v43;
  v41 = 0;
  valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)objc_msgSend((id)v43, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A38]), kCFNumberSInt64Type, &valuePtr))
  {
    if (CFNumberGetValue((CFNumberRef)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A20]), kCFNumberSInt64Type, &v41))
    {
      v40[0] = 0;
      v40[1] = 0;
      v39 = v40;
      WebCore::toBufferSource((WebCore *)&v32, v14);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v36, (const WebCore::BufferSource *)&v32);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v38, "priv");
      v46 = (WTF **)v38;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v39, (cbor::CBORValue *)v38);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v38);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v36);
      if (v33 != -1)
        ((void (*)(_QWORD *, WTF **))off_1E34C44E0[v33])(v38, &v32);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v36);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v38, "key_type");
      v32 = (WTF *)v38;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v39, (cbor::CBORValue *)v38);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v38);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v36);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v36);
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v38, "key_size");
      v32 = (WTF *)v38;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v39, (cbor::CBORValue *)v38);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v38);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v36);
      MEMORY[0x19AEABCC8](&v46, objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]));
      cbor::CBORValue::CBORValue();
      cbor::CBORValue::CBORValue((cbor::CBORValue *)v38, "rp");
      v32 = (WTF *)v38;
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v39, (cbor::CBORValue *)v38);
      cbor::CBORValue::operator=();
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v38);
      cbor::CBORValue::~CBORValue((cbor::CBORValue *)v36);
      v20 = (WTF::StringImpl *)v46;
      v46 = 0;
      if (v20)
      {
        if (*(_DWORD *)v20 == 2)
          WTF::StringImpl::destroy(v20, v19);
        else
          *(_DWORD *)v20 -= 2;
      }
      v22 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6908]);
      v23 = v22;
      if (!v22)
      {
        LODWORD(v26) = 0;
        goto LABEL_36;
      }
      v24 = objc_msgSend(v22, "bytes");
      v25 = (id)objc_msgSend(v23, "length");
      v26 = (char *)v25;
      if (!v25)
        goto LABEL_61;
      if ((unint64_t)v25 >> 32)
      {
        __break(0xC471u);
        return v25;
      }
      v27 = WTF::fastMalloc((WTF *)v25);
      v23 = (void *)v27;
      v28 = 0;
      do
      {
        v28[v27] = v28[v24];
        ++v28;
      }
      while (v26 != v28);
      while (1)
      {
LABEL_36:
        v38[0] = v23;
        v38[1] = v26;
        cbor::CBORReader::read();
        if (v23)
          WTF::fastFree((WTF *)v23, v29);
        if (!v37 || v36[0] != 5)
          break;
        cbor::CBORValue::CBORValue();
        a5 = (id *)&v32;
        cbor::CBORValue::CBORValue((cbor::CBORValue *)&v32, "tag");
        v46 = &v32;
        std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::__emplace_unique_key_args<cbor::CBORValue,std::piecewise_construct_t const&,std::tuple<cbor::CBORValue&&>,std::tuple<>>((uint64_t **)&v39, (cbor::CBORValue *)&v32);
        cbor::CBORValue::operator=();
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)&v32);
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v38);
        cbor::CBORValue::CBORValue();
        cbor::CBORWriter::write();
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v38);
        if (v35)
        {
          v16 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v32, v34));
          if (v35)
          {
            v31 = v32;
            if (v32)
            {
              v32 = 0;
              v33 = 0;
              WTF::fastFree(v31, v30);
            }
          }
          goto LABEL_46;
        }
        std::__throw_bad_optional_access[abi:sn180100]();
        __break(1u);
LABEL_61:
        v23 = 0;
      }
      v16 = 0;
      if (a5)
        *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
LABEL_46:
      if (v37)
        cbor::CBORValue::~CBORValue((cbor::CBORValue *)v36);
      std::__tree<std::__value_type<cbor::CBORValue,cbor::CBORValue>,std::__map_value_compare<cbor::CBORValue,std::__value_type<cbor::CBORValue,cbor::CBORValue>,cbor::CBORValue::CTAPLess,true>,WTF::FastAllocator<std::__value_type<cbor::CBORValue,cbor::CBORValue>>>::destroy((uint64_t)&v39, v40[0]);
      goto LABEL_49;
    }
    if (a5)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
      goto LABEL_28;
    }
  }
  else if (a5)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 16, 0);
LABEL_28:
    v16 = 0;
    *a5 = v21;
    goto LABEL_49;
  }
  v16 = 0;
LABEL_49:
  if (v18)
    CFRelease(v18);
LABEL_51:
  if (v14)
  {
    CFRelease(v14);
    if (!v13)
      goto LABEL_54;
    goto LABEL_53;
  }
  if (v13)
LABEL_53:
    CFRelease(v13);
LABEL_54:
  if (v11)
    CFRelease(v11);
  return (id)v16;
}

- (void)cancel
{
  API::WebAuthenticationPanel::cancel((API::WebAuthenticationPanel *)&self->_panel);
}

+ (PublicKeyCredentialCreationOptions)convertToCoreCreationOptionsWithOptions:(SEL)a3
{
  UserEntity *p_var1;
  String *p_var3;
  Vector<WebCore::PublicKeyCredentialCreationOptions::Parameters, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *v8;
  BOOL *v9;
  WebCore::PublicKeyCredentialDescriptor **p_var5;
  void *v11;
  WTF::StringImpl *v12;
  StringImpl *isa;
  StringImpl *m_ptr;
  StringImpl *appid;
  StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  int v27;
  Class v28;
  WTF::StringImpl *v29;
  StringImpl *v30;
  StringImpl *v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  void *v38;
  PublicKeyCredentialCreationOptions *result;
  void *v40;
  PublicKeyCredentialCreationOptions *v41;
  Parameters *v42;
  PublicKeyCredentialCreationOptions *v43;
  uint64_t *v44;
  uint64_t v45;
  WTF *var0;
  void *v47;
  unsigned int var2;
  WTF *v49;
  NSString *v50;
  void *v51;
  uint64_t v52;
  int v53;
  int v54;
  unint64_t v55;
  int v56;
  unint64_t v57;
  unint64_t v58;
  __int16 v59;
  unsigned int v60;
  _BOOL4 var1;
  unint64_t v62;
  char v63;
  void *v64;
  void *v65;
  WTF::StringImpl *v66;
  _WKAuthenticationExtensionsClientInputs v67;
  WTF::StringImpl *v68;
  int v69;
  WTF::StringImpl *v70;
  uint64_t v71;
  objc_class *v72;
  int v73;
  _BYTE v74[9];

  retstr->var0.var2.var1 = 0;
  retstr->var0.var0.m_impl.m_ptr = 0;
  retstr->var0.var1.m_impl.m_ptr = 0;
  retstr->var0.var2.var0.var0 = 0;
  retstr->var1.var0.m_impl.m_ptr = 0;
  p_var1 = &retstr->var1;
  retstr->var1.var3.m_impl.m_ptr = 0;
  p_var3 = &retstr->var1.var3;
  retstr->var1.var1.m_impl.m_ptr = 0;
  retstr->var1.var2.var0.var0.var0.var1.var0.var0 = 0;
  retstr->var1.var2.var0.var0.var1 = 0;
  retstr->var3.var0 = 0;
  v8 = &retstr->var3;
  retstr->var4.__engaged_ = 0;
  retstr->var6.var1 = 0;
  retstr->var8.var0.var1.var1 = 0;
  v9 = &retstr->var8.var0.var1.var1;
  LOBYTE(retstr[1].var0.var0.m_impl.m_ptr) = 0;
  retstr->var2.var0.var0.var0.var1.var0.var0 = 0;
  retstr->var2.var0.var0.var1 = 0;
  *(_QWORD *)&retstr->var3.var1 = 0;
  retstr->var4.var0.__null_state_ = 0;
  retstr->var5.var0 = 0;
  *(_QWORD *)&retstr->var5.var1 = 0;
  p_var5 = (WebCore::PublicKeyCredentialDescriptor **)&retstr->var5;
  retstr->var6.var0.var0 = 0;
  v11 = (void *)objc_msgSend(a4, "relyingParty");
  LOBYTE(v69) = 0;
  LOBYTE(v68) = 0;
  MEMORY[0x19AEABCC8](&v72, objc_msgSend(v11, "name"));
  v67.super.isa = v72;
  MEMORY[0x19AEABCC8](&v72, objc_msgSend(v11, "icon"));
  v67._appid = (NSString *)v72;
  MEMORY[0x19AEABCC8](&v68, objc_msgSend(v11, "identifier"));
  LOBYTE(v69) = 1;
  isa = (StringImpl *)v67.super.isa;
  v67.super.isa = 0;
  m_ptr = retstr->var0.var0.m_impl.m_ptr;
  retstr->var0.var0.m_impl.m_ptr = isa;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v12);
    else
      *(_DWORD *)m_ptr -= 2;
  }
  appid = (StringImpl *)v67._appid;
  v67._appid = 0;
  v16 = retstr->var0.var1.m_impl.m_ptr;
  retstr->var0.var1.m_impl.m_ptr = appid;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)v16, v12);
    else
      *(_DWORD *)v16 -= 2;
  }
  std::__optional_storage_base<WTF::String,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::String,false>>((uint64_t)&retstr->var0.var2, (uint64_t)&v68);
  if ((_BYTE)v69)
  {
    v18 = v68;
    v68 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v17);
      else
        *(_DWORD *)v18 -= 2;
    }
  }
  v19 = (WTF::StringImpl *)v67._appid;
  v67._appid = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v17);
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = v67.super.isa;
  v67.super.isa = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy(v20, v17);
    else
      *(_DWORD *)v20 -= 2;
  }
  v21 = (void *)objc_msgSend(a4, "user");
  v70 = 0;
  v68 = 0;
  v69 = 0;
  MEMORY[0x19AEABCC8](&v72, objc_msgSend(v21, "name"));
  v22 = v72;
  v72 = 0;
  v67.super.isa = v22;
  MEMORY[0x19AEABCC8](&v72, objc_msgSend(v21, "icon"));
  v23 = (NSString *)v72;
  v72 = 0;
  v67._appid = v23;
  WebCore::toBufferSource((WebCore *)&v72, (NSData *)objc_msgSend(v21, "identifier"));
  std::__variant_detail::__assignment<std::__variant_detail::__traits<WTF::RefPtr<JSC::ArrayBufferView,WTF::RawPtrTraits<JSC::ArrayBufferView>,WTF::DefaultRefDerefTraits<JSC::ArrayBufferView>>,WTF::RefPtr<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>>>::__generic_assign[abi:sn180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<WTF::RefPtr<JSC::ArrayBufferView,WTF::RawPtrTraits<JSC::ArrayBufferView>,WTF::DefaultRefDerefTraits<JSC::ArrayBufferView>>,WTF::RefPtr<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>>,(std::__variant_detail::_Trait)1>>((uint64_t)&v68, (uint64_t)&v72);
  if (v73 != -1)
    ((void (*)(_BYTE *, objc_class **))off_1E34C44E0[v73])(v74, &v72);
  MEMORY[0x19AEABCC8](&v72, objc_msgSend(v21, "displayName"));
  v25 = v72;
  v72 = 0;
  v26 = v70;
  v70 = v25;
  if (v26)
  {
    v27 = *(_DWORD *)v26 - 2;
    if (*(_DWORD *)v26 != 2)
      goto LABEL_28;
    WTF::StringImpl::destroy(v26, v24);
    v26 = v72;
    v72 = 0;
    if (!v26)
      goto LABEL_29;
    v27 = *(_DWORD *)v26 - 2;
    if (*(_DWORD *)v26 == 2)
      WTF::StringImpl::destroy(v26, v24);
    else
LABEL_28:
      *(_DWORD *)v26 = v27;
  }
LABEL_29:
  v28 = v67.super.isa;
  v67.super.isa = 0;
  v29 = (WTF::StringImpl *)p_var1->var0.m_impl.m_ptr;
  p_var1->var0.m_impl.m_ptr = (StringImpl *)v28;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2)
      WTF::StringImpl::destroy(v29, v24);
    else
      *(_DWORD *)v29 -= 2;
  }
  v30 = (StringImpl *)v67._appid;
  v67._appid = 0;
  v31 = retstr->var1.var1.m_impl.m_ptr;
  retstr->var1.var1.m_impl.m_ptr = v30;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)v31, v24);
    else
      *(_DWORD *)v31 -= 2;
  }
  std::__variant_detail::__assignment<std::__variant_detail::__traits<WTF::RefPtr<JSC::ArrayBufferView,WTF::RawPtrTraits<JSC::ArrayBufferView>,WTF::DefaultRefDerefTraits<JSC::ArrayBufferView>>,WTF::RefPtr<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>>>::__generic_assign[abi:sn180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<WTF::RefPtr<JSC::ArrayBufferView,WTF::RawPtrTraits<JSC::ArrayBufferView>,WTF::DefaultRefDerefTraits<JSC::ArrayBufferView>>,WTF::RefPtr<JSC::ArrayBuffer,WTF::RawPtrTraits<JSC::ArrayBuffer>,WTF::DefaultRefDerefTraits<JSC::ArrayBuffer>>>,(std::__variant_detail::_Trait)1>>((uint64_t)&retstr->var1.var2, (uint64_t)&v68);
  v33 = v70;
  v70 = 0;
  v34 = (WTF::StringImpl *)p_var3->m_impl.m_ptr;
  p_var3->m_impl.m_ptr = (StringImpl *)v33;
  if (v34)
  {
    if (*(_DWORD *)v34 == 2)
      WTF::StringImpl::destroy(v34, v32);
    else
      *(_DWORD *)v34 -= 2;
    v35 = v70;
    v70 = 0;
    if (v35)
    {
      if (*(_DWORD *)v35 == 2)
        WTF::StringImpl::destroy(v35, v32);
      else
        *(_DWORD *)v35 -= 2;
    }
  }
  if (v69 != -1)
    ((void (*)(objc_class **, WTF::StringImpl **))off_1E34C44E0[v69])(&v72, &v68);
  v69 = -1;
  v36 = (WTF::StringImpl *)v67._appid;
  v67._appid = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 2)
      WTF::StringImpl::destroy(v36, v32);
    else
      *(_DWORD *)v36 -= 2;
  }
  v37 = v67.super.isa;
  v67.super.isa = 0;
  if (v37)
  {
    if (*(_DWORD *)v37 == 2)
      WTF::StringImpl::destroy(v37, v32);
    else
      *(_DWORD *)v37 -= 2;
  }
  v38 = (void *)objc_msgSend(a4, "publicKeyCredentialParamaters");
  result = (PublicKeyCredentialCreationOptions *)objc_msgSend(v38, "count");
  v41 = result;
  if (result)
  {
    if ((unint64_t)result >> 28)
    {
      __break(0xC471u);
      return result;
    }
    v42 = (Parameters *)WTF::fastMalloc((WTF *)(16 * (_QWORD)result));
    v43 = 0;
    v44 = (uint64_t *)((char *)v42 + 8);
    do
    {
      v45 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "objectAtIndexedSubscript:", v43), "algorithm"), "longLongValue");
      *(v44 - 1) = 0;
      *v44 = v45;
      v43 = (PublicKeyCredentialCreationOptions *)((char *)v43 + 1);
      v44 += 2;
    }
    while (v41 != v43);
  }
  else
  {
    v42 = 0;
  }
  var0 = (WTF *)v8->var0;
  if (v8->var0)
  {
    retstr->var3.var0 = 0;
    retstr->var3.var1 = 0;
    WTF::fastFree(var0, v40);
  }
  retstr->var3.var0 = v42;
  retstr->var3.var1 = v41;
  retstr->var3.var2 = v41;
  if (objc_msgSend(a4, "timeout"))
  {
    retstr->var4.var0.__val_ = objc_msgSend((id)objc_msgSend(a4, "timeout"), "unsignedIntValue");
    retstr->var4.__engaged_ = 1;
  }
  if (objc_msgSend(a4, "excludeCredentials"))
  {
    publicKeyCredentialDescriptors((uint64_t)&v67, (void *)objc_msgSend(a4, "excludeCredentials"));
    var2 = retstr->var5.var2;
    if (var2)
      WTF::VectorDestructor<true,WebCore::PublicKeyCredentialDescriptor>::destruct(*p_var5, (WebCore::PublicKeyCredentialDescriptor *)((char *)*p_var5 + 40 * var2));
    v49 = *p_var5;
    if (*p_var5)
    {
      retstr->var5.var0 = 0;
      retstr->var5.var1 = 0;
      WTF::fastFree(v49, v47);
    }
    retstr->var5.var0 = (PublicKeyCredentialDescriptor *)v67.super.isa;
    v50 = v67._appid;
    v67.super.isa = 0;
    v67._appid = 0;
    *(_QWORD *)&retstr->var5.var1 = v50;
    WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v67);
  }
  if (objc_msgSend(a4, "authenticatorSelection"))
  {
    v51 = (void *)objc_msgSend(a4, "authenticatorSelection");
    v52 = objc_msgSend(v51, "authenticatorAttachment");
    if (v52 == 2)
    {
      v53 = 1;
    }
    else
    {
      if (v52 != 1)
      {
        v53 = 0;
        v54 = 0;
        goto LABEL_78;
      }
      v53 = 0;
    }
    v54 = 1;
LABEL_78:
    v55 = objc_msgSend(v51, "residentKey");
    v56 = objc_msgSend(v51, "requireResidentKey");
    v57 = objc_msgSend(v51, "userVerification");
    v58 = v57 << 40;
    if (v57 >= 3)
      WORD2(v58) = 256;
    v59 = WORD2(v58) | (v56 != 0);
    v60 = ((0x2010000u >> (8 * v55)) & 3 | (unsigned __int16)((unsigned __int16)(0x1010100u >> (8 * v55)) << 8)) << 16;
    if (v55 >= 4)
      v60 = 16842752;
    var1 = retstr->var6.var1;
    *(_WORD *)&retstr->var6.var0.var1.var2 = v59;
    *(_DWORD *)&retstr->var6.var0.var0 = v60 | v53 | (v54 << 8);
    if (!var1)
      retstr->var6.var1 = 1;
  }
  v62 = objc_msgSend(a4, "attestation");
  if (v62 >= 4)
    v63 = 0;
  else
    v63 = v62;
  retstr->var8.var0.var0 = v63;
  if (objc_msgSend(a4, "extensionsCBOR"))
  {
    v64 = (void *)objc_msgSend(a4, "extensionsCBOR");
    v65 = v64;
    if (v64)
    {
      objc_msgSend(v64, "bytes");
      objc_msgSend(v65, "length");
    }
    WebCore::AuthenticationExtensionsClientInputs::fromCBOR();
    std::__optional_storage_base<WebCore::AuthenticationExtensionsClientInputs,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WebCore::AuthenticationExtensionsClientInputs,false>>((WebCore::AuthenticationExtensionsClientInputs *)v9, (uint64_t)&v67);
    return (PublicKeyCredentialCreationOptions *)std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v67);
  }
  else
  {
    authenticationExtensionsClientInputs(&v67, (void *)objc_msgSend(a4, "extensions"));
    std::optional<WebCore::AuthenticationExtensionsClientInputs>::operator=[abi:sn180100]<WebCore::AuthenticationExtensionsClientInputs,void>((uint64_t)v9, (WTF::StringImpl *)&v67);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs::PRFInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs::PRFInputs *)&v71);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs::LargeBlobInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs::LargeBlobInputs *)&v68);
    result = (PublicKeyCredentialCreationOptions *)v67.super.isa;
    v67.super.isa = 0;
    if (result)
    {
      if (LODWORD(result->var0.var0.m_impl.m_ptr) == 2)
        return (PublicKeyCredentialCreationOptions *)WTF::StringImpl::destroy((WTF::StringImpl *)result, v66);
      else
        LODWORD(result->var0.var0.m_impl.m_ptr) -= 2;
    }
  }
  return result;
}

- (void)makeCredentialWithChallenge:(id)a3 origin:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  WTF *isa;
  _QWORD *v16;
  _BYTE v17[296];
  NSData v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[3];
  _DWORD v22[76];
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  char v27;
  __int16 v28;
  _BYTE v29[216];
  __int128 v30;
  _BYTE v31[48];
  int v32;
  __int16 v33;
  __int128 v34;
  __int16 v35;
  char v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  produceClientDataJson(&v20, 0, a3, (uint64_t)a4, 0);
  v9 = v20;
  produceClientDataJsonHash(&v18, v20);
  v10 = _Block_copy(a6);
  v20 = 0;
  v21[0] = v18.super.isa;
  v11 = v19;
  v18.super.isa = 0;
  v19 = 0;
  v21[1] = v11;
  +[_WKWebAuthenticationPanel convertToCoreCreationOptionsWithOptions:](_WKWebAuthenticationPanel, "convertToCoreCreationOptionsWithOptions:", a5);
  WebCore::PublicKeyCredentialCreationOptions::PublicKeyCredentialCreationOptions((uint64_t)v22, (uint64_t)v17);
  v22[74] = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  WebCore::ResourceRequest::ResourceRequest((WebCore::ResourceRequest *)v29);
  v31[40] = 0;
  v32 = 0;
  v33 = 0;
  v36 = 0;
  v37 = 0;
  *(_OWORD *)&v29[200] = 0u;
  v30 = 0u;
  memset(v31, 0, 25);
  v34 = 0u;
  v35 = 0;
  v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v12 = off_1E34C4538;
  v12[1] = v10;
  v12[2] = v9;
  v16 = v12;
  API::WebAuthenticationPanel::handleRequest((uint64_t)&self->_panel, (uint64_t)v21, (uint64_t)&v16);
  v13 = v16;
  v16 = 0;
  if (v13)
    (*(void (**)(_QWORD *))(*v13 + 8))(v13);
  WebKit::WebAuthenticationRequestData::~WebAuthenticationRequestData((WebKit::WebAuthenticationRequestData *)v21);
  WebCore::PublicKeyCredentialCreationOptions::~PublicKeyCredentialCreationOptions((WebCore::PublicKeyCredentialCreationOptions *)v17);
  _Block_release(0);
  isa = v18.super.isa;
  if (v18.super.isa)
  {
    v18.super.isa = 0;
    LODWORD(v19) = 0;
    WTF::fastFree(isa, v14);
  }
}

- (void)makeCredentialWithMediationRequirement:(int64_t)a3 clientDataHash:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _BYTE v20[296];
  uint64_t v21;
  uint64_t v22;
  _DWORD v23[76];
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  char v28;
  __int16 v29;
  _BYTE v30[216];
  __int128 v31;
  _BYTE v32[48];
  int v33;
  __int16 v34;
  __int128 v35;
  char v36;
  char v37;
  char v38;
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = _Block_copy(a6);
  if (a4)
  {
    v11 = objc_msgSend(a4, "bytes");
    v12 = objc_msgSend(a4, "length");
    v13 = v12;
    v21 = 0;
    LODWORD(v22) = 0;
    HIDWORD(v22) = v12;
    if (v12)
    {
      if (HIDWORD(v12))
      {
        __break(0xC471u);
        return;
      }
      v14 = WTF::fastMalloc((WTF *)v12);
      v15 = 0;
      LODWORD(v22) = v13;
      v21 = v14;
      do
      {
        *(_BYTE *)(v14 + v15) = *(_BYTE *)(v11 + v15);
        ++v15;
      }
      while (v13 != v15);
    }
  }
  else
  {
    v21 = 0;
    v22 = 0;
  }
  +[_WKWebAuthenticationPanel convertToCoreCreationOptionsWithOptions:](_WKWebAuthenticationPanel, "convertToCoreCreationOptionsWithOptions:", a5);
  WebCore::PublicKeyCredentialCreationOptions::PublicKeyCredentialCreationOptions((uint64_t)v23, (uint64_t)v20);
  v23[74] = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  WebCore::ResourceRequest::ResourceRequest((WebCore::ResourceRequest *)v30);
  v32[40] = 0;
  v33 = 0;
  v34 = 0;
  *(_OWORD *)&v30[200] = 0u;
  v31 = 0u;
  memset(v32, 0, 25);
  v35 = 0u;
  if ((unint64_t)a3 >= 4)
    v16 = 1;
  else
    v16 = a3;
  v36 = v16;
  v37 = 1;
  v38 = 0;
  v39 = 0;
  v17 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v17 = off_1E34C4570;
  v17[1] = v10;
  v19 = v17;
  API::WebAuthenticationPanel::handleRequest((uint64_t)&self->_panel, (uint64_t)&v21, (uint64_t)&v19);
  v18 = v19;
  v19 = 0;
  if (v18)
    (*(void (**)(_QWORD *))(*v18 + 8))(v18);
  WebKit::WebAuthenticationRequestData::~WebAuthenticationRequestData((WebKit::WebAuthenticationRequestData *)&v21);
  WebCore::PublicKeyCredentialCreationOptions::~PublicKeyCredentialCreationOptions((WebCore::PublicKeyCredentialCreationOptions *)v20);
  _Block_release(0);
}

- (void)makeCredentialWithClientDataHash:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  -[_WKWebAuthenticationPanel makeCredentialWithMediationRequirement:clientDataHash:options:completionHandler:](self, "makeCredentialWithMediationRequirement:clientDataHash:options:completionHandler:", 1, a3, a4, a5);
}

+ (PublicKeyCredentialRequestOptions)convertToCoreRequestOptionsWithOptions:(SEL)a3
{
  String *p_var2;
  WTF::StringImpl *v7;
  Class isa;
  Class m_ptr;
  int v10;
  WTF::StringImpl *v11;
  void *v12;
  unsigned int var2;
  PublicKeyCredentialDescriptor *var0;
  NSString *appid;
  void *v16;
  void *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  unint64_t v20;
  unsigned __int8 v21;
  PublicKeyCredentialRequestOptions *result;
  __int16 v23;
  __int16 v24;
  _WKAuthenticationExtensionsClientInputs v25;
  uint64_t v26;
  uint64_t v27;

  retstr->var0.var0.var0.var0.var1.var0.var0 = 0;
  retstr->var0.var0.var0.var1 = 0;
  retstr->var1.var0.__null_state_ = 0;
  retstr->var1.__engaged_ = 0;
  retstr->var2.m_impl.m_ptr = 0;
  p_var2 = &retstr->var2;
  retstr->var3.var0 = 0;
  *(_QWORD *)&retstr->var3.var1 = 0;
  retstr->var4 = 1;
  retstr->var5.var0.var0 = 0;
  retstr->var5.var1 = 0;
  retstr->var6 = 0;
  if (objc_msgSend(a4, "timeout"))
  {
    retstr->var1.var0.__val_ = objc_msgSend((id)objc_msgSend(a4, "timeout"), "unsignedIntValue");
    retstr->var1.__engaged_ = 1;
  }
  if (objc_msgSend(a4, "relyingPartyIdentifier"))
  {
    MEMORY[0x19AEABCC8](&v25, objc_msgSend(a4, "relyingPartyIdentifier"));
    isa = v25.super.isa;
    v25.super.isa = 0;
    m_ptr = (Class)p_var2->m_impl.m_ptr;
    p_var2->m_impl.m_ptr = (StringImpl *)isa;
    if (m_ptr)
    {
      v10 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr != 2)
        goto LABEL_8;
      WTF::StringImpl::destroy(m_ptr, v7);
      m_ptr = v25.super.isa;
      v25.super.isa = 0;
      if (!m_ptr)
        goto LABEL_9;
      v10 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
        WTF::StringImpl::destroy(m_ptr, v11);
      else
LABEL_8:
        *(_DWORD *)m_ptr = v10;
    }
  }
LABEL_9:
  if (objc_msgSend(a4, "allowCredentials"))
  {
    publicKeyCredentialDescriptors((uint64_t)&v25, (void *)objc_msgSend(a4, "allowCredentials"));
    var2 = retstr->var3.var2;
    if (var2)
      WTF::VectorDestructor<true,WebCore::PublicKeyCredentialDescriptor>::destruct((WebCore::PublicKeyCredentialDescriptor *)retstr->var3.var0, (WebCore::PublicKeyCredentialDescriptor *)((char *)retstr->var3.var0 + 40 * var2));
    var0 = retstr->var3.var0;
    if (var0)
    {
      retstr->var3.var0 = 0;
      retstr->var3.var1 = 0;
      WTF::fastFree((WTF *)var0, v12);
    }
    retstr->var3.var0 = (PublicKeyCredentialDescriptor *)v25.super.isa;
    appid = v25._appid;
    v25.super.isa = 0;
    v25._appid = 0;
    *(_QWORD *)&retstr->var3.var1 = appid;
    WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v25);
  }
  if (objc_msgSend(a4, "extensionsCBOR"))
  {
    v16 = (void *)objc_msgSend(a4, "extensionsCBOR");
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "bytes");
      objc_msgSend(v17, "length");
    }
    WebCore::AuthenticationExtensionsClientInputs::fromCBOR();
    std::__optional_storage_base<WebCore::AuthenticationExtensionsClientInputs,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WebCore::AuthenticationExtensionsClientInputs,false>>((WebCore::AuthenticationExtensionsClientInputs *)&retstr->var5, (uint64_t)&v25);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v25);
  }
  else
  {
    authenticationExtensionsClientInputs(&v25, (void *)objc_msgSend(a4, "extensions"));
    std::optional<WebCore::AuthenticationExtensionsClientInputs>::operator=[abi:sn180100]<WebCore::AuthenticationExtensionsClientInputs,void>((uint64_t)&retstr->var5, (WTF::StringImpl *)&v25);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs::PRFInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs::PRFInputs *)&v27);
    std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs::LargeBlobInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs::LargeBlobInputs *)&v26);
    v19 = v25.super.isa;
    v25.super.isa = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2)
        WTF::StringImpl::destroy(v19, v18);
      else
        *(_DWORD *)v19 -= 2;
    }
  }
  v20 = objc_msgSend(a4, "userVerification");
  if (v20 >= 3)
    v21 = 1;
  else
    v21 = v20;
  retstr->var4 = v21;
  result = (PublicKeyCredentialRequestOptions *)objc_msgSend(a4, "authenticatorAttachment");
  if (result == (PublicKeyCredentialRequestOptions *)2)
  {
    v23 = 1;
  }
  else
  {
    if (result != (PublicKeyCredentialRequestOptions *)1)
    {
      v23 = 0;
      v24 = 0;
      goto LABEL_32;
    }
    v23 = 0;
  }
  v24 = 1;
LABEL_32:
  retstr->var6 = (optional<WebCore::AuthenticatorAttachment>)(v23 | (v24 << 8));
  return result;
}

- (void)getAssertionWithChallenge:(id)a3 origin:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  void *v16;
  WTF *isa;
  _QWORD *v18;
  char v19[8];
  int v20;
  WTF::StringImpl *v21;
  uint64_t v22;
  uint64_t v23;
  NSData v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[3];
  _DWORD v28[76];
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  char v33;
  __int16 v34;
  _BYTE v35[216];
  __int128 v36;
  _BYTE v37[48];
  int v38;
  __int16 v39;
  __int128 v40;
  __int16 v41;
  char v42;
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  produceClientDataJson(&v26, 1, a3, (uint64_t)a4, 0);
  v9 = v26;
  produceClientDataJsonHash(&v24, v26);
  v10 = _Block_copy(a6);
  v26 = 0;
  v27[0] = v24.super.isa;
  v11 = v25;
  v24.super.isa = 0;
  v25 = 0;
  v27[1] = v11;
  +[_WKWebAuthenticationPanel convertToCoreRequestOptionsWithOptions:](_WKWebAuthenticationPanel, "convertToCoreRequestOptionsWithOptions:", a5);
  std::__variant_detail::__alt<1ul,WebCore::PublicKeyCredentialRequestOptions>::__alt[abi:sn180100]<WebCore::PublicKeyCredentialRequestOptions>((uint64_t)v28, (uint64_t)v19);
  v28[74] = 1;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  WebCore::ResourceRequest::ResourceRequest((WebCore::ResourceRequest *)v35);
  v37[40] = 0;
  v38 = 0;
  v39 = 0;
  v42 = 0;
  v43 = 0;
  *(_OWORD *)&v35[200] = 0u;
  v36 = 0u;
  memset(v37, 0, 25);
  v40 = 0u;
  v41 = 0;
  v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v12 = off_1E34C45A8;
  v12[1] = v10;
  v12[2] = v9;
  v18 = v12;
  API::WebAuthenticationPanel::handleRequest((uint64_t)&self->_panel, (uint64_t)v27, (uint64_t)&v18);
  v13 = v18;
  v18 = 0;
  if (v13)
    (*(void (**)(_QWORD *))(*v13 + 8))(v13);
  WebKit::WebAuthenticationRequestData::~WebAuthenticationRequestData((WebKit::WebAuthenticationRequestData *)v27);
  std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v23);
  WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v22);
  v15 = v21;
  v21 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v14);
    else
      *(_DWORD *)v15 -= 2;
  }
  if (v20 != -1)
    ((void (*)(_QWORD **, char *))off_1E34C44E0[v20])(&v18, v19);
  _Block_release(0);
  isa = v24.super.isa;
  if (v24.super.isa)
  {
    v24.super.isa = 0;
    LODWORD(v25) = 0;
    WTF::fastFree(isa, v16);
  }
}

- (void)getAssertionWithMediationRequirement:(int64_t)a3 clientDataHash:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  void *v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  char v15;
  char v16;
  _QWORD *v17;
  _QWORD *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  _QWORD *v21;
  char v22[8];
  int v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  _DWORD v29[76];
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  char v34;
  __int16 v35;
  _BYTE v36[216];
  __int128 v37;
  _BYTE v38[48];
  int v39;
  __int16 v40;
  __int128 v41;
  char v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = _Block_copy(a6);
  if (a4)
  {
    v11 = (char *)objc_msgSend(a4, "bytes");
    v12 = objc_msgSend(a4, "length");
    v13 = v12;
    v27 = 0;
    LODWORD(v28) = 0;
    HIDWORD(v28) = v12;
    if (v12)
    {
      if (HIDWORD(v12))
      {
        __break(0xC471u);
        return;
      }
      v14 = (_BYTE *)WTF::fastMalloc((WTF *)v12);
      LODWORD(v28) = v13;
      v27 = v14;
      do
      {
        v15 = *v11++;
        *v14++ = v15;
        --v13;
      }
      while (v13);
    }
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
  +[_WKWebAuthenticationPanel convertToCoreRequestOptionsWithOptions:](_WKWebAuthenticationPanel, "convertToCoreRequestOptionsWithOptions:", a5);
  std::__variant_detail::__alt<1ul,WebCore::PublicKeyCredentialRequestOptions>::__alt[abi:sn180100]<WebCore::PublicKeyCredentialRequestOptions>((uint64_t)v29, (uint64_t)v22);
  v29[74] = 1;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  WebCore::ResourceRequest::ResourceRequest((WebCore::ResourceRequest *)v36);
  v38[40] = 0;
  v39 = 0;
  v40 = 0;
  *(_OWORD *)&v36[200] = 0u;
  v37 = 0u;
  memset(v38, 0, 25);
  v41 = 0u;
  if ((unint64_t)a3 >= 4)
    v16 = 1;
  else
    v16 = a3;
  v42 = v16;
  v43 = 1;
  v44 = 0;
  v45 = 0;
  v17 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v17 = off_1E34C45E0;
  v17[1] = v10;
  v21 = v17;
  API::WebAuthenticationPanel::handleRequest((uint64_t)&self->_panel, (uint64_t)&v27, (uint64_t)&v21);
  v18 = v21;
  v21 = 0;
  if (v18)
    (*(void (**)(_QWORD *))(*v18 + 8))(v18);
  WebKit::WebAuthenticationRequestData::~WebAuthenticationRequestData((WebKit::WebAuthenticationRequestData *)&v27);
  std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v26);
  WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v25);
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy(v20, v19);
    else
      *(_DWORD *)v20 -= 2;
  }
  if (v23 != -1)
    ((void (*)(_QWORD **, char *))off_1E34C44E0[v23])(&v21, v22);
  _Block_release(0);
}

- (void)getAssertionWithClientDataHash:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  -[_WKWebAuthenticationPanel getAssertionWithMediationRequirement:clientDataHash:options:completionHandler:](self, "getAssertionWithMediationRequirement:clientDataHash:options:completionHandler:", 1, a3, a4, a5);
}

+ (id)getClientDataJSONForAuthenticationType:(int64_t)a3 challenge:(id)a4 origin:(id)a5
{
  CFTypeRef cf;

  produceClientDataJson(&cf, a3, a4, (uint64_t)a5, 0);
  return (id)(id)CFMakeCollectable(cf);
}

+ (id)getClientDataJSONWithTopOrigin:(int64_t)a3 challenge:(id)a4 origin:(id)a5 topOrigin:(id)a6 crossOrigin:(BOOL)a7
{
  CFTypeRef cf;

  produceClientDataJson(&cf, a3, a4, (uint64_t)a5, (uint64_t)a6);
  return (id)(id)CFMakeCollectable(cf);
}

+ (id)encodeMakeCredentialCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5
{
  return (id)objc_msgSend(a1, "encodeMakeCredentialCommandWithClientDataJSON:options:userVerificationAvailability:authenticatorSupportedExtensions:", a3, a4, a5, 0);
}

+ (id)encodeMakeCredentialCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6
{
  void *v8;
  void *v9;
  CFTypeRef v10;
  WTF *v11;
  WTF *isa;
  _BYTE v14[16];
  _BYTE v15[296];
  WTF *v16;
  int v17;
  unsigned int v18;
  NSData v19;
  int v20;

  produceClientDataJsonHash(&v19, a3);
  +[_WKWebAuthenticationPanel convertToCoreCreationOptionsWithOptions:](_WKWebAuthenticationPanel, "convertToCoreCreationOptionsWithOptions:", a4);
  WTF::makeVector<WTF::String>(a6, (uint64_t)v14);
  fido::encodeMakeCredentialRequestAsCBOR();
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v14, v8);
  WebCore::PublicKeyCredentialCreationOptions::~PublicKeyCredentialCreationOptions((WebCore::PublicKeyCredentialCreationOptions *)v15);
  v10 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v16, v18));
  v11 = v16;
  if (v16)
  {
    v16 = 0;
    v17 = 0;
    WTF::fastFree(v11, v9);
  }
  isa = v19.super.isa;
  if (v19.super.isa)
  {
    v19.super.isa = 0;
    v20 = 0;
    WTF::fastFree(isa, v9);
  }
  return (id)v10;
}

+ (id)encodeGetAssertionCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5
{
  return (id)objc_msgSend(a1, "encodeGetAssertionCommandWithClientDataJSON:options:userVerificationAvailability:authenticatorSupportedExtensions:", a3, a4, a5, 0);
}

+ (id)encodeGetAssertionCommandWithClientDataJSON:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6
{
  void *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  void *v11;
  CFTypeRef v12;
  WTF *v13;
  WTF *isa;
  _BYTE v16[16];
  _BYTE v17[8];
  int v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  uint64_t v21;
  WTF *v22;
  int v23;
  unsigned int v24;
  NSData v25;
  int v26;

  produceClientDataJsonHash(&v25, a3);
  +[_WKWebAuthenticationPanel convertToCoreRequestOptionsWithOptions:](_WKWebAuthenticationPanel, "convertToCoreRequestOptionsWithOptions:", a4);
  WTF::makeVector<WTF::String>(a6, (uint64_t)v16);
  fido::encodeGetAssertionRequestAsCBOR();
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v16, v8);
  std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v21);
  WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v20);
  v10 = v19;
  v19 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v9);
    else
      *(_DWORD *)v10 -= 2;
  }
  if (v18 != -1)
    ((void (*)(_BYTE *, _BYTE *))off_1E34C44E0[v18])(v16, v17);
  v12 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v22, v24));
  v13 = v22;
  if (v22)
  {
    v22 = 0;
    v23 = 0;
    WTF::fastFree(v13, v11);
  }
  isa = v25.super.isa;
  if (v25.super.isa)
  {
    v25.super.isa = 0;
    v26 = 0;
    WTF::fastFree(isa, v11);
  }
  return (id)v12;
}

+ (id)encodeMakeCredentialCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5
{
  return (id)objc_msgSend(a1, "encodeMakeCredentialCommandWithClientDataHash:options:userVerificationAvailability:authenticatorSupportedExtensions:", a3, a4, a5, 0);
}

+ (id)encodeMakeCredentialCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6
{
  uint64_t v9;
  id result;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  WTF *v16;
  void *v17;
  CFTypeRef v18;
  WTF *v19;
  _BYTE v20[16];
  char v21[296];
  WTF *v22;
  uint64_t v23;
  WTF *v24;
  int v25;
  unsigned int v26;

  if (a3)
  {
    v9 = objc_msgSend(a3, "bytes");
    result = (id)objc_msgSend(a3, "length");
    v11 = (char *)result;
    v22 = 0;
    LODWORD(v23) = 0;
    HIDWORD(v23) = (_DWORD)result;
    if (result)
    {
      if ((unint64_t)result >> 32)
      {
        __break(0xC471u);
        return result;
      }
      v12 = WTF::fastMalloc((WTF *)result);
      v13 = 0;
      LODWORD(v23) = (_DWORD)v11;
      v22 = (WTF *)v12;
      do
      {
        v13[v12] = v13[v9];
        ++v13;
      }
      while (v11 != v13);
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  +[_WKWebAuthenticationPanel convertToCoreCreationOptionsWithOptions:](_WKWebAuthenticationPanel, "convertToCoreCreationOptionsWithOptions:", a4);
  WTF::makeVector<WTF::String>(a6, (uint64_t)v20);
  fido::encodeMakeCredentialRequestAsCBOR();
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v20, v14);
  WebCore::PublicKeyCredentialCreationOptions::~PublicKeyCredentialCreationOptions((WebCore::PublicKeyCredentialCreationOptions *)v21);
  v16 = v22;
  if (v22)
  {
    v22 = 0;
    LODWORD(v23) = 0;
    WTF::fastFree(v16, v15);
  }
  v18 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v24, v26));
  v19 = v24;
  if (v24)
  {
    v24 = 0;
    v25 = 0;
    WTF::fastFree(v19, v17);
  }
  return (id)v18;
}

+ (id)encodeGetAssertionCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5
{
  return (id)objc_msgSend(a1, "encodeGetAssertionCommandWithClientDataHash:options:userVerificationAvailability:authenticatorSupportedExtensions:", a3, a4, a5, 0);
}

+ (id)encodeGetAssertionCommandWithClientDataHash:(id)a3 options:(id)a4 userVerificationAvailability:(int64_t)a5 authenticatorSupportedExtensions:(id)a6
{
  char *v9;
  id result;
  char *v11;
  WTF *v12;
  char v13;
  void *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF *v17;
  void *v18;
  CFTypeRef v19;
  WTF *v20;
  _BYTE v21[16];
  char v22[8];
  int v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  uint64_t v26;
  WTF *v27;
  uint64_t v28;
  WTF *v29;
  int v30;
  unsigned int v31;

  if (a3)
  {
    v9 = (char *)objc_msgSend(a3, "bytes");
    result = (id)objc_msgSend(a3, "length");
    v11 = (char *)result;
    v27 = 0;
    LODWORD(v28) = 0;
    HIDWORD(v28) = (_DWORD)result;
    if (result)
    {
      if ((unint64_t)result >> 32)
      {
        __break(0xC471u);
        return result;
      }
      v12 = (WTF *)WTF::fastMalloc((WTF *)result);
      LODWORD(v28) = (_DWORD)v11;
      v27 = v12;
      do
      {
        v13 = *v9++;
        *(_BYTE *)v12 = v13;
        v12 = (WTF *)((char *)v12 + 1);
        --v11;
      }
      while (v11);
    }
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
  +[_WKWebAuthenticationPanel convertToCoreRequestOptionsWithOptions:](_WKWebAuthenticationPanel, "convertToCoreRequestOptionsWithOptions:", a4);
  WTF::makeVector<WTF::String>(a6, (uint64_t)v21);
  fido::encodeGetAssertionRequestAsCBOR();
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v21, v14);
  std::__optional_destruct_base<WebCore::AuthenticationExtensionsClientInputs,false>::~__optional_destruct_base[abi:sn180100]((WebCore::AuthenticationExtensionsClientInputs *)&v26);
  WTF::Vector<WebCore::PublicKeyCredentialDescriptor,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v25);
  v16 = v24;
  v24 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v15);
    else
      *(_DWORD *)v16 -= 2;
  }
  if (v23 != -1)
    ((void (*)(_BYTE *, char *))off_1E34C44E0[v23])(v21, v22);
  v17 = v27;
  if (v27)
  {
    v27 = 0;
    LODWORD(v28) = 0;
    WTF::fastFree(v17, v15);
  }
  v19 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v29, v31));
  v20 = v29;
  if (v29)
  {
    v29 = 0;
    v30 = 0;
    WTF::fastFree(v20, v18);
  }
  return (id)v19;
}

- (void)setMockConfiguration:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _BYTE v14[32];
  char v15;
  char v16;
  uint64_t v17;
  char v18;
  _BYTE v19[16];
  char v20;

  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("privateKeyBase64")))
  {
    MEMORY[0x19AEABCC8](&v7, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("privateKeyBase64")));
    v5 = v7;
  }
  else
  {
    v5 = 0;
  }
  LOBYTE(v7) = 0;
  v14[0] = 0;
  v15 = 0;
  v16 = 0;
  v18 = 0;
  v19[0] = 0;
  v20 = 0;
  v8 = 1;
  v9 = v5;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 1;
  API::WebAuthenticationPanel::setMockConfiguration((uint64_t)&self->_panel, (uint64_t)&v7);
  if (v20)
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v19, v6);
  if (v18)
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v17, v6);
  if (v15)
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v14, v6);
  std::__optional_destruct_base<WebCore::MockWebAuthenticationConfiguration::LocalConfiguration,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v8, (WTF::StringImpl *)v6);
}

- (Object)_apiObject
{
  return (Object *)&self->_panel;
}

- (void).cxx_destruct
{
  void *m_ptr;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  m_ptr = self->_transports.m_ptr;
  self->_transports.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = (unsigned int *)self->_client.m_impl.m_ptr;
  self->_client.m_impl.m_ptr = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

- (uint64_t)makeCredentialWithChallenge:(uint64_t)a1 origin:options:completionHandler:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E34C4538;
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;

  *(_QWORD *)a1 = off_1E34C4538;
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v3);
}

- (uint64_t)makeCredentialWithChallenge:(uint64_t)a1 origin:(uint64_t)a2 options:completionHandler:
{
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD *v6;

  v5[0] = a1 + 8;
  v5[1] = a1 + 16;
  v5[2] = a1 + 8;
  v2 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v2 == -1)
  {
    v4 = std::__throw_bad_variant_access[abi:sn180100]();
    return std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:sn180100]<std::__variant_detail::__visitation::__variant::__value_visitor<WTF::Visitor<-[_WKWebAuthenticationPanel makeCredentialWithChallenge:origin:options:completionHandler:]::$_0::operator()(std::variant<WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &&)::{lambda(WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>> const&)#1},-[_WKWebAuthenticationPanel makeCredentialWithChallenge:origin:options:completionHandler:]::$_0::operator()(std::variant<WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &)::{lambda(WebCore::ExceptionData const&)#1}>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &>(v4);
  }
  else
  {
    v6 = v5;
    return ((uint64_t (*)(_QWORD **))off_1E34C4550[v2])(&v6);
  }
}

- (uint64_t)makeCredentialWithMediationRequirement:(uint64_t)a1 clientDataHash:options:completionHandler:
{
  *(_QWORD *)a1 = off_1E34C4570;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)makeCredentialWithMediationRequirement:(const void *)a1 clientDataHash:options:completionHandler:
{
  void *v2;

  *a1 = off_1E34C4570;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)makeCredentialWithMediationRequirement:(uint64_t)a1 clientDataHash:(uint64_t)a2 options:completionHandler:
{
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD *v6;

  v5[0] = a1 + 8;
  v5[1] = a1 + 8;
  v2 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v2 == -1)
  {
    v4 = std::__throw_bad_variant_access[abi:sn180100]();
    return std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:sn180100]<std::__variant_detail::__visitation::__variant::__value_visitor<WTF::Visitor<-[_WKWebAuthenticationPanel makeCredentialWithMediationRequirement:clientDataHash:options:completionHandler:]::$_1::operator()(std::variant<WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &&)::{lambda(WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>> const&)#1},-[_WKWebAuthenticationPanel makeCredentialWithMediationRequirement:clientDataHash:options:completionHandler:]::$_1::operator()(std::variant<WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &)::{lambda(WebCore::ExceptionData const&)#1}>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &>(v4);
  }
  else
  {
    v6 = v5;
    return ((uint64_t (*)(_QWORD **))off_1E34C4588[v2])(&v6);
  }
}

- (uint64_t)getAssertionWithChallenge:(uint64_t)a1 origin:options:completionHandler:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E34C45A8;
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;

  *(_QWORD *)a1 = off_1E34C45A8;
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v3);
}

- (uint64_t)getAssertionWithChallenge:(uint64_t)a1 origin:(uint64_t)a2 options:completionHandler:
{
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD *v6;

  v5[0] = a1 + 8;
  v5[1] = a1 + 16;
  v5[2] = a1 + 8;
  v2 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v2 == -1)
  {
    v4 = std::__throw_bad_variant_access[abi:sn180100]();
    return std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:sn180100]<std::__variant_detail::__visitation::__variant::__value_visitor<WTF::Visitor<-[_WKWebAuthenticationPanel getAssertionWithChallenge:origin:options:completionHandler:]::$_2::operator()(std::variant<WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &&)::{lambda(WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>> const&)#1},-[_WKWebAuthenticationPanel getAssertionWithChallenge:origin:options:completionHandler:]::$_2::operator()(std::variant<WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &)::{lambda(WebCore::ExceptionData const&)#1}>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &>(v4);
  }
  else
  {
    v6 = v5;
    return ((uint64_t (*)(_QWORD **))off_1E34C45C0[v2])(&v6);
  }
}

- (uint64_t)getAssertionWithMediationRequirement:(uint64_t)a1 clientDataHash:options:completionHandler:
{
  *(_QWORD *)a1 = off_1E34C45E0;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)getAssertionWithMediationRequirement:(const void *)a1 clientDataHash:options:completionHandler:
{
  void *v2;

  *a1 = off_1E34C45E0;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)getAssertionWithMediationRequirement:(uint64_t)a1 clientDataHash:(uint64_t)a2 options:completionHandler:
{
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD *v6;

  v5[0] = a1 + 8;
  v5[1] = a1 + 8;
  v2 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v2 == -1)
  {
    v4 = std::__throw_bad_variant_access[abi:sn180100]();
    return std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:sn180100]<std::__variant_detail::__visitation::__variant::__value_visitor<WTF::Visitor<-[_WKWebAuthenticationPanel getAssertionWithMediationRequirement:clientDataHash:options:completionHandler:]::$_3::operator()(std::variant<WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &&)::{lambda(WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>> const&)#1},-[_WKWebAuthenticationPanel getAssertionWithMediationRequirement:clientDataHash:options:completionHandler:]::$_3::operator()(std::variant<WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &)::{lambda(WebCore::ExceptionData const&)#1}>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,WTF::Ref<WebCore::AuthenticatorResponse,WTF::RawPtrTraits<WebCore::AuthenticatorResponse>,WTF::DefaultRefDerefTraits<WebCore::AuthenticatorResponse>>,WebCore::ExceptionData> &>(v4);
  }
  else
  {
    v6 = v5;
    return ((uint64_t (*)(_QWORD **))off_1E34C45F8[v2])(&v6);
  }
}

@end
