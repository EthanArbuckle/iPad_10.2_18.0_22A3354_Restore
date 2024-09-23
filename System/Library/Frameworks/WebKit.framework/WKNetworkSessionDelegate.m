@implementation WKNetworkSessionDelegate

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  void (*v12)(id, uint64_t, _QWORD);
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  WTF::StringImpl *v17;
  id v18;
  CFTypeRef v19;
  CFTypeRef v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  int v28;
  int v29;
  int v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  id v38;
  WTF::StringImpl *v39;
  uint64_t v40;
  CFTypeRef v41;
  CFTypeRef v42;
  unint64_t v43;
  BOOL v44;
  BOOL v45;
  int v46;
  BOOL v47;
  int v48;
  int v49;
  BOOL v50;
  uint64_t v51;
  char *v52;
  char *v53;
  WTF::StringImpl *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  _WORD *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  _BYTE *v70;
  size_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  WTF::StringImpl *v76;
  uint64_t v77;
  uint64_t v78;
  WTF::StringImpl *v79;
  WTF::StringImpl *v80;
  WTF::StringImpl *v81;
  WTF::StringImpl *v82;
  unsigned int *v83;
  unsigned int v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  char *v88;
  __int128 v89;
  uint64_t v90;
  void *v91;
  unsigned int *v92;
  unsigned int v93;
  unsigned int v94;
  uint64_t v95;
  void *v96;
  unsigned int *v97;
  unsigned int v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  WTF::StringImpl *v104;
  WTF::StringImpl *v105;
  WTF::StringImpl *v106;
  uint64_t v107;
  id to;
  WTF *v109[2];
  uint64_t v110;
  uint64_t v111;
  char v112;
  CFTypeRef v113;
  CFTypeRef cf;
  WTF::StringImpl *v115;
  WTF::StringImpl *v116;
  id location;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v10 = -[WKNetworkSessionDelegate sessionFromTask:](self, "sessionFromTask:", a4);
  if (!v10 || (v11 = (uint64_t)v10, objc_msgSend(a4, "state") == 2))
  {
    v12 = (void (*)(id, uint64_t, _QWORD))*((_QWORD *)a6 + 2);
    v13 = a6;
    v14 = 2;
LABEL_4:
    v12(v13, v14, 0);
    return;
  }
  v15 = objc_msgSend(a4, "taskIdentifier");
  if (objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "isProxy") && !*(_BYTE *)(v11 + 960))
  {
    v12 = (void (*)(id, uint64_t, _QWORD))*((_QWORD *)a6 + 2);
    v13 = a6;
    v14 = 0;
    goto LABEL_4;
  }
  v16 = (void *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "authenticationMethod");
  if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C92B70]))
    goto LABEL_30;
  MEMORY[0x19AEB2658](&to, a5);
  WebKit::NetworkProcess::sourceApplicationAuditData((WebKit::NetworkProcess *)&location, *(_QWORD *)(*(_QWORD *)(v11 + 32) + 32));
  v18 = location;
  if (location)
  {
    objc_msgSend((id)objc_msgSend((id)cf, "protectionSpace"), "serverTrust");
    SecTrustSetClientAuditToken();
    CFRelease(v18);
  }
  v19 = cf;
  cf = 0;
  if (v19)
    CFRelease(v19);
  v20 = v113;
  v113 = 0;
  if (v20)
    CFRelease(v20);
  WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)&to, v17);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "_incompleteTaskMetrics"), "transactionMetrics"), "lastObject"), "negotiatedTLSProtocolVersion"), "unsignedShortValue")- 771 >= 0xFFFFFFFE|| (objc_opt_respondsToSelector() & 1) != 0&& ((v21 = objc_msgSend(a4, "_TLSNegotiatedProtocolVersion"), v21 == 7) || v21 == 4))
  {
    if (objc_msgSend(a4, "_preconnect"))
    {
      (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 2, 0);
      return;
    }
    v33 = 1;
    goto LABEL_32;
  }
  if (!*(_BYTE *)(v11 + 947))
  {
LABEL_30:
    v33 = 0;
LABEL_32:
    m_ptr = self->_sessionWrapper.m_impl.m_ptr;
    if (m_ptr)
      v35 = *((_QWORD *)m_ptr + 1);
    else
      v35 = 0;
    MEMORY[0x19AEB2658](&to, a5);
    -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
    v36 = _Block_copy(a6);
    v37 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v37 = off_1E34B5FB8;
    v37[1] = v36;
    location = v37;
    WebKit::NetworkSessionCocoa::continueDidReceiveChallenge(v11, v35, (WebCore::AuthenticationChallengeBase *)&to, v33, v15, &v103, (uint64_t *)&location);
    v38 = location;
    location = 0;
    if (v38)
      (*(void (**)(id))(*(_QWORD *)v38 + 8))(v38);
    _Block_release(0);
    v40 = v103;
    v103 = 0;
    if (v40)
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v40 + 8));
    v41 = cf;
    cf = 0;
    if (v41)
      CFRelease(v41);
    v42 = v113;
    v113 = 0;
    if (v42)
      CFRelease(v42);
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)&to, v39);
    return;
  }
  if (self)
  {
    -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
    if (v107)
    {
      v22 = (void *)objc_msgSend(a5, "protectionSpace");
      v23 = v107;
      MEMORY[0x19AEABCC8](&v105, objc_msgSend(v22, "protocol"));
      MEMORY[0x19AEABCC8](&v104, objc_msgSend(v22, "host"));
      v24 = objc_msgSend(v22, "port");
      v25 = v24;
      v27 = v104;
      v26 = v105;
      if (v105)
      {
        v28 = *((_DWORD *)v105 + 1);
        if (v104)
          goto LABEL_26;
      }
      else
      {
        v28 = 0;
        if (v104)
        {
LABEL_26:
          v29 = *((_DWORD *)v104 + 1);
          if ((v24 & 0x8000000000000000) == 0)
            goto LABEL_27;
          goto LABEL_48;
        }
      }
      v29 = 0;
      if ((v24 & 0x8000000000000000) == 0)
      {
LABEL_27:
        v30 = 0;
        v31 = v24;
        do
        {
          ++v30;
          v32 = v31 > 9;
          v31 /= 0xAuLL;
        }
        while (v32);
LABEL_50:
        if (v30 < 0)
          goto LABEL_141;
        v45 = __OFADD__(v30, 1);
        v46 = v30 + 1;
        v47 = v45;
        if (v29 < 0)
          goto LABEL_141;
        if (v47)
          goto LABEL_141;
        v45 = __OFADD__(v29, v46);
        v48 = v29 + v46;
        if (v45)
          goto LABEL_141;
        v45 = __OFADD__(v48, 3);
        v49 = v48 + 3;
        v50 = v45;
        if (v28 < 0)
          goto LABEL_141;
        if (v50)
          goto LABEL_141;
        v51 = (v28 + v49);
        if (__OFADD__(v28, v49))
          goto LABEL_141;
        if ((!v105 || (*((_BYTE *)v105 + 16) & 4) != 0) && (!v104 || (*((_BYTE *)v104 + 16) & 4) != 0))
        {
          if ((_DWORD)v51)
          {
            if ((v51 & 0x80000000) != 0)
              goto LABEL_141;
            WTF::tryFastCompactMalloc((WTF *)(v51 + 20));
            v62 = (char *)location;
            if (!location)
              goto LABEL_141;
            v102 = v23;
            v63 = (char *)location + 20;
            *(_DWORD *)location = 2;
            *((_DWORD *)v62 + 1) = v51;
            *((_QWORD *)v62 + 1) = v62 + 20;
            v54 = (WTF::StringImpl *)v62;
            *((_DWORD *)v62 + 4) = 4;
            v115 = v26;
            WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<unsigned char>((uint64_t *)&v115, v62 + 20);
            v64 = (uint64_t)v115;
            if (v115)
              v64 = *((unsigned int *)v115 + 1);
            v65 = &v63[v64];
            v65[2] = 47;
            *(_WORD *)v65 = 12090;
            v66 = v65 + 3;
            v116 = v27;
            WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<unsigned char>((uint64_t *)&v116, v65 + 3);
            v67 = (uint64_t)v116;
            if (v116)
              v67 = *((unsigned int *)v116 + 1);
            v66[v67] = 58;
            v68 = &v66[v67 + 1];
            v69 = 0;
            if ((v25 & 0x8000000000000000) != 0)
            {
              v74 = -(uint64_t)v25;
              v23 = v102;
              do
              {
                *((_BYTE *)&v119 + v69--) = (v74 % 0xA) | 0x30;
                v32 = v74 > 9;
                v74 /= 0xAuLL;
              }
              while (v32);
              v75 = v69 + 24;
              v70 = (char *)&location + v69 + 24;
              *v70 = 45;
              if (v69 + 26 > 26)
                goto LABEL_106;
              if (v75 <= 24)
                v75 = 24;
              v71 = v75 - v69 - 23;
            }
            else
            {
              v23 = v102;
              do
              {
                *((_BYTE *)&v119 + v69--) = (v25 % 0xA) | 0x30;
                v32 = v25 > 9;
                v25 /= 0xAuLL;
              }
              while (v32);
              if (v69 + 26 > 25)
                goto LABEL_106;
              v70 = (char *)&v119 + v69 + 1;
              v71 = -v69;
            }
            memcpy(v68, v70, v71);
LABEL_106:
            v106 = v54;
            MEMORY[0x19AEABB0C](&to, &v106, 0);
            v77 = *(_QWORD *)(v23 + 24);
            if (v77)
            {
              v78 = *(_QWORD *)(v77 + 8);
              if (v78)
                (*(void (**)(uint64_t, id *))(*(_QWORD *)v78 + 96))(v78, &to);
            }
            v79 = (WTF::StringImpl *)to;
            to = 0;
            if (v79)
            {
              if (*(_DWORD *)v79 == 2)
                WTF::StringImpl::destroy(v79, v76);
              else
                *(_DWORD *)v79 -= 2;
            }
            v80 = v106;
            v106 = 0;
            if (v80)
            {
              if (*(_DWORD *)v80 == 2)
                WTF::StringImpl::destroy(v80, v76);
              else
                *(_DWORD *)v80 -= 2;
            }
            v81 = v104;
            v104 = 0;
            if (v81)
            {
              if (*(_DWORD *)v81 == 2)
                WTF::StringImpl::destroy(v81, v76);
              else
                *(_DWORD *)v81 -= 2;
            }
            v82 = v105;
            v105 = 0;
            if (v82)
            {
              if (*(_DWORD *)v82 == 2)
                WTF::StringImpl::destroy(v82, v76);
              else
                *(_DWORD *)v82 -= 2;
            }
            goto LABEL_125;
          }
        }
        else if ((_DWORD)v51)
        {
          if (v51 <= 0x7FFFFFEF)
          {
            WTF::tryFastCompactMalloc((WTF *)(2 * v51 + 20));
            v52 = (char *)location;
            if (location)
            {
              v101 = v23;
              v53 = (char *)location + 20;
              *(_DWORD *)location = 2;
              *((_DWORD *)v52 + 1) = v51;
              *((_QWORD *)v52 + 1) = v52 + 20;
              v54 = (WTF::StringImpl *)v52;
              *((_DWORD *)v52 + 4) = 0;
              v115 = v26;
              WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<char16_t>((uint64_t *)&v115, v52 + 20);
              v55 = (uint64_t)v115;
              if (v115)
                v55 = *((unsigned int *)v115 + 1);
              v56 = &v53[2 * v55];
              *(_DWORD *)v56 = 3080250;
              *((_WORD *)v56 + 2) = 47;
              v57 = v56 + 6;
              v116 = v27;
              WTF::StringTypeAdapter<WTF::StringImpl *,void>::writeTo<char16_t>((uint64_t *)&v116, v56 + 6);
              v58 = (uint64_t)v116;
              if (v116)
                v58 = *((unsigned int *)v116 + 1);
              v59 = &v57[2 * v58];
              *(_WORD *)v59 = 58;
              v60 = v59 + 2;
              if ((v25 & 0x8000000000000000) != 0)
              {
                v72 = -(uint64_t)v25;
                v73 = 24;
                v23 = v101;
                do
                {
                  *((_BYTE *)&location + v73--) = (v72 % 0xA) | 0x30;
                  v32 = v72 > 9;
                  v72 /= 0xAuLL;
                }
                while (v32);
                *((_BYTE *)&location + v73) = 45;
                if (v73 + 2 <= 26)
                {
                  do
                  {
                    *v60++ = *((unsigned __int8 *)&location + v73);
                    v32 = v73++ < 24;
                  }
                  while (v32);
                }
              }
              else
              {
                v61 = 0;
                v23 = v101;
                do
                {
                  *((_BYTE *)&v119 + v61--) = (v25 % 0xA) | 0x30;
                  v32 = v25 > 9;
                  v25 /= 0xAuLL;
                }
                while (v32);
                if (v61 + 26 <= 25)
                {
                  do
                  {
                    *v60++ = *((unsigned __int8 *)&v119 + v61 + 1);
                    v44 = __CFADD__(v61++, 1);
                  }
                  while (!v44);
                }
              }
              goto LABEL_106;
            }
          }
LABEL_141:
          __break(0xC471u);
          return;
        }
        v54 = (WTF::StringImpl *)MEMORY[0x1E0CBEF70];
        *MEMORY[0x1E0CBEF70] += 2;
        goto LABEL_106;
      }
LABEL_48:
      v43 = -v24;
      v30 = 1;
      do
      {
        ++v30;
        v44 = v43 >= 0xA;
        v43 /= 0xAuLL;
      }
      while (v44);
      goto LABEL_50;
    }
  }
  else
  {
    v107 = 0;
  }
LABEL_125:
  location = 0;
  objc_initWeak(&location, self);
  WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v11 + 8), v11);
  v83 = *(unsigned int **)(v11 + 8);
  if (v83)
  {
    do
      v84 = __ldaxr(v83);
    while (__stlxr(v84 + 1, v83));
  }
  *(_QWORD *)&v118 = v83;
  *((_QWORD *)&v118 + 1) = _Block_copy(a6);
  v119 = v15;
  v85 = v107;
  if (v107)
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((unsigned __int8 **)(v107 + 8));
  v120 = v85;
  v121 = 0;
  to = 0;
  objc_moveWeak(&to, &location);
  v86 = v118;
  v118 = 0uLL;
  *(_OWORD *)v109 = v86;
  v87 = v120;
  v120 = 0;
  v110 = v119;
  v111 = v87;
  v112 = v121;
  v88 = (char *)malloc_type_malloc(0x50uLL, 0x10E004094DE4F88uLL);
  *(_QWORD *)v88 = MEMORY[0x1E0C809A0];
  *((_QWORD *)v88 + 1) = 50331650;
  *((_QWORD *)v88 + 2) = WTF::BlockPtr<void ()(NSURLAuthenticationChallenge *,int)>::fromCallable<-[WKNetworkSessionDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_15>(-[WKNetworkSessionDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_15)::{lambda(void *,NSURLAuthenticationChallenge *,int)#1}::__invoke;
  *((_QWORD *)v88 + 3) = &WTF::BlockPtr<void ()(NSURLAuthenticationChallenge *,int)>::fromCallable<-[WKNetworkSessionDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_15>(-[WKNetworkSessionDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_15)::descriptor;
  *((_QWORD *)v88 + 4) = 0;
  objc_moveWeak((id *)v88 + 4, &to);
  v89 = *(_OWORD *)v109;
  v109[0] = 0;
  v109[1] = 0;
  *(_OWORD *)(v88 + 40) = v89;
  v90 = v111;
  *((_QWORD *)v88 + 7) = v110;
  *((_QWORD *)v88 + 8) = v90;
  v88[72] = v112;
  v111 = 0;
  _Block_release(0);
  v92 = (unsigned int *)v109[0];
  v109[0] = 0;
  if (v92)
  {
    do
    {
      v93 = __ldaxr(v92);
      v94 = v93 - 1;
    }
    while (__stlxr(v94, v92));
    if (!v94)
    {
      atomic_store(1u, v92);
      WTF::fastFree((WTF *)v92, v91);
    }
  }
  objc_destroyWeak(&to);
  v95 = v120;
  v120 = 0;
  if (v95)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v95 + 8));
  _Block_release(*((const void **)&v118 + 1));
  v97 = (unsigned int *)v118;
  *(_QWORD *)&v118 = 0;
  if (v97)
  {
    do
    {
      v98 = __ldaxr(v97);
      v99 = v98 - 1;
    }
    while (__stlxr(v99, v97));
    if (!v99)
    {
      atomic_store(1u, v97);
      WTF::fastFree((WTF *)v97, v96);
    }
  }
  objc_destroyWeak(&location);
  objc_msgSend(MEMORY[0x1E0C92C98], "_strictTrustEvaluate:queue:completionHandler:", a5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue"), "underlyingQueue"), v88);
  _Block_release(v88);
  v100 = v107;
  v107 = 0;
  if (v100)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v100 + 8));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSData *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  os_signpost_id_t v20;
  uint64_t v21;
  unsigned int *v22;
  uint64_t v23;
  WebCore::FragmentedSharedBuffer *v24;
  uint8_t buf[4];
  _BYTE v26[10];
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = (WebCore::FragmentedSharedBuffer *)a5;
  if (!self)
    return;
  -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
  v6 = v23;
  if (!v23)
    return;
  WebCore::SharedBuffer::create<NSData *&>(&v24, v5, (uint64_t *)&v22);
  v7 = (uint64_t)v22;
  if (kdebug_is_enabled())
  {
    v13 = *MEMORY[0x1E0CBE150];
    v14 = WTFSignpostLogHandle();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(v6 + 608);
        v17 = WTFCurrentContinuousTime();
        v18 = *(_QWORD *)(v7 + 48);
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)v26 = 0;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = 0;
        v27 = 2048;
        v28 = v16;
        v29 = 2048;
        v30 = v17;
        v31 = 2048;
        v32 = v18;
        _os_log_impl(&dword_196BCC000, v15, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received %zd bytes", buf, 0x2Cu);
      }
      goto LABEL_4;
    }
    v19 = *(const void **)(v6 + 608);
    if (v19)
    {
      v20 = os_signpost_id_make_with_pointer(v14, v19);
      if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_4;
    }
    else
    {
      v20 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v15))
    {
      v21 = *(_QWORD *)(v7 + 48);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v26 = v21;
      _os_signpost_emit_with_name_impl(&dword_196BCC000, v15, OS_SIGNPOST_EVENT, v20, "DataTask", "received %zd bytes", buf, 0xCu);
    }
  }
LABEL_4:
  v9 = *(_QWORD *)(v6 + 24);
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 8);
    if (v10)
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v10 + 32))(v10, v7);
  }
  v11 = v22;
  v22 = 0;
  if (v11)
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v11, v8);
  v12 = v23;
  v23 = 0;
  if (v12)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v12 + 8));
}

- (RefPtr<WebKit::NetworkDataTaskCocoa,)existingTask:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  WKNetworkSessionDelegate *v13;
  int v14;
  WKNetworkSessionDelegate *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  void *v18;

  v4 = v3;
  m_ptr = self->_sessionWrapper.m_impl.m_ptr;
  if (m_ptr)
  {
    v6 = *((_QWORD *)m_ptr + 1);
    if (v6)
    {
      if (a3)
      {
        self = (WKNetworkSessionDelegate *)objc_msgSend(a3, "taskIdentifier");
        v7 = *(_QWORD *)(v6 + 24);
        if (v7)
        {
          v8 = *(_DWORD *)(v7 - 8);
          v9 = ((unint64_t)self + ~((_QWORD)self << 32)) ^ (((unint64_t)self + ~((_QWORD)self << 32)) >> 22);
          v10 = 9 * ((v9 + ~(v9 << 13)) ^ ((v9 + ~(v9 << 13)) >> 8));
          v11 = (v10 ^ (v10 >> 15)) + ~((v10 ^ (v10 >> 15)) << 27);
          v12 = v8 & ((v11 >> 31) ^ v11);
          v13 = *(WKNetworkSessionDelegate **)(v7 + 24 * v12);
          if (v13 == self)
          {
LABEL_6:
            self = *(WKNetworkSessionDelegate **)(v7 + 24 * v12 + 8);
            if (self)
            {
              self = (WKNetworkSessionDelegate *)WTF::ThreadSafeWeakPtrControlBlock::weakRef((WTF::ThreadSafeWeakPtrControlBlock *)self);
              if (self)
              {
                v15 = self;
                v16 = (uint64_t)v4;
                v17 = (unsigned __int8 *)v15;
                WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::NetworkDataTaskCocoa>(v16, (uint64_t)v15, *(_QWORD *)(v7 + 24 * v12 + 16));
                return (RefPtr<WebKit::NetworkDataTaskCocoa, WTF::RawPtrTraits<WebKit::NetworkDataTaskCocoa>, WTF::DefaultRefDerefTraits<WebKit::NetworkDataTaskCocoa>>)WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v17, v18);
              }
            }
          }
          else
          {
            v14 = 1;
            while (v13)
            {
              v12 = (v12 + v14) & v8;
              v13 = *(WKNetworkSessionDelegate **)(v7 + 24 * v12);
              ++v14;
              if (v13 == self)
                goto LABEL_6;
            }
          }
        }
      }
    }
  }
  *v4 = 0;
  return (RefPtr<WebKit::NetworkDataTaskCocoa, WTF::RawPtrTraits<WebKit::NetworkDataTaskCocoa>, WTF::DefaultRefDerefTraits<WebKit::NetworkDataTaskCocoa>>)self;
}

- (void)sessionFromTask:(id)a3
{
  WTF *v5;
  uint64_t v6;
  _QWORD *v7;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v9;
  WTF *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  DefaultWeakPtrImpl *v14;
  uint64_t v15;
  void *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  WTF *v22;

  if (!self || (-[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a3), (v5 = v22) == 0))
  {
    m_ptr = self->_sessionWrapper.m_impl.m_ptr;
    if (m_ptr)
    {
      v9 = *((_QWORD *)m_ptr + 1);
      if (v9)
      {
        v10 = (WTF *)WTF::HashMap<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>,std::unique_ptr<WebCore::NetworkLoadInformation>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkLoadInformation>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>,std::unique_ptr<WebCore::NetworkLoadInformation>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkLoadInformation>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>>,WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>(*(_QWORD *)(v9 + 32), objc_msgSend(a3, "taskIdentifier"));
        if (v10)
        {
          v11 = (uint64_t *)(*(_QWORD *)(*((_QWORD *)self->_session.m_impl.m_ptr + 1) + 32) + 176);
          v22 = v10;
          v12 = WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::UniqueRef<WebKit::RemoteAudioDestination>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::UniqueRef<WebKit::RemoteAudioDestination>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::UniqueRef<WebKit::RemoteAudioDestination>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::UniqueRef<WebKit::RemoteAudioDestination>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>(v11, &v22);
          if (v12)
          {
            v13 = *(_QWORD *)(*((_QWORD *)self->_session.m_impl.m_ptr + 1) + 32);
            v22 = *(WTF **)(v12 + 88);
            return (void *)WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<PAL::SessionID>>,PAL::SessionID>((uint64_t *)(v13 + 208), &v22);
          }
        }
        else
        {
          v14 = self->_sessionWrapper.m_impl.m_ptr;
          if (v14)
            v15 = *((_QWORD *)v14 + 1);
          else
            v15 = 0;
          WTF::HashMap<unsigned long long,WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<unsigned long long,WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned long long>>,unsigned long long>((unsigned int **)&v22, *(_QWORD *)(v15 + 40), objc_msgSend(a3, "taskIdentifier"));
          v17 = (unsigned int *)v22;
          if (v22)
          {
            v7 = (_QWORD *)*((_QWORD *)v22 + 1);
            v22 = 0;
            do
            {
              v18 = __ldaxr(v17);
              v19 = v18 - 1;
            }
            while (__stlxr(v19, v17));
            if (v19)
            {
              if (!v7)
                return v7;
            }
            else
            {
              atomic_store(1u, v17);
              WTF::fastFree((WTF *)v17, v16);
              if (!v7)
                return v7;
            }
            v20 = *(_QWORD *)(v7[6] + 40);
            if (v20)
              return *(void **)(v20 + 8);
          }
        }
      }
    }
    return 0;
  }
  v6 = *((_QWORD *)v22 + 2);
  if (v6)
    v7 = *(_QWORD **)(v6 + 8);
  else
    v7 = 0;
  v22 = 0;
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*((unsigned __int8 **)v5 + 1));
  return v7;
}

- (uint64_t)URLSession:(const void *)a1 task:didReceiveChallenge:completionHandler:
{
  void *v2;

  *a1 = off_1E34B5FB8;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)URLSession:(WebCore::Credential *)this task:didReceiveChallenge:completionHandler:
{
  WebCore::Credential::nsCredential(this);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (WKNetworkSessionDelegate)initWithNetworkSession:(NakedRef<WebKit:(void *)a4 :(BOOL)a5 NetworkSessionCocoa>)a3 wrapper:withCredentials:
{
  WKNetworkSessionDelegate *v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *m_ptr;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WKNetworkSessionDelegate;
  v8 = -[WKNetworkSessionDelegate init](&v22, sel_init);
  if (v8)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3.var0 + 2, (uint64_t)a3.var0);
    v10 = (unsigned int *)*((_QWORD *)a3.var0 + 1);
    if (v10)
    {
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
    }
    m_ptr = (unsigned int *)v8->_session.m_impl.m_ptr;
    v8->_session.m_impl.m_ptr = (DefaultWeakPtrImpl *)v10;
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
        WTF::fastFree((WTF *)m_ptr, v9);
      }
    }
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a4, (uint64_t)a4);
    v16 = *(unsigned int **)a4;
    if (*(_QWORD *)a4)
    {
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 + 1, v16));
    }
    v18 = (unsigned int *)v8->_sessionWrapper.m_impl.m_ptr;
    v8->_sessionWrapper.m_impl.m_ptr = (DefaultWeakPtrImpl *)v16;
    if (v18)
    {
      do
      {
        v19 = __ldaxr(v18);
        v20 = v19 - 1;
      }
      while (__stlxr(v20, v18));
      if (!v20)
      {
        atomic_store(1u, v18);
        WTF::fastFree((WTF *)v18, v15);
      }
    }
    v8->_withCredentials = a5;
  }
  return v8;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSError *v5;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  id ResolutionReport;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  uint64_t v21;
  CFTypeRef v22;
  WTF::StringImpl *v23;
  void *v24;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v26;
  uint64_t v27;
  DefaultWeakPtrImpl *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  _BOOL8 v32;
  NSDictionary *v33;
  id v34;
  const void *v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  NSObject *v38;
  uint64_t v39;
  objc_class *v40;
  const char *v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  const void *v47;
  os_signpost_id_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE buf[44];
  WTF::StringImpl *v55;
  char v56;
  CFTypeRef cf;
  uint8_t v58[128];
  uint8_t v59[4];
  _BOOL4 v60;
  __int16 v61;
  int v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  _BOOL4 v68;
  uint64_t v69;

  v5 = (NSError *)a5;
  v69 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    if (objc_msgSend(a5, "userInfo", a3))
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
    else
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = v8;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(a4, "description"), CFSTR("networkTaskDescription"));
    if (self)
    {
      -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
      if (*(_QWORD *)buf)
      {
        v10 = *(unsigned __int8 *)(*(_QWORD *)buf + 715) - 1;
        if (v10 > 4)
          v11 = CFSTR("Unknown");
        else
          v11 = off_1E34B6200[(char)v10];
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("networkTaskMetricsPrivacyStance"));
        ResolutionReport = extractResolutionReport(v5);
        if (ResolutionReport)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", ResolutionReport, CFSTR("networkResolutionReport"));
        }
        else
        {
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v13 = -[NSError underlyingErrors](v5, "underlyingErrors");
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v51;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v51 != v15)
                  objc_enumerationMutation(v13);
                v17 = extractResolutionReport(*(NSError **)(*((_QWORD *)&v50 + 1) + 8 * i));
                if (v17)
                {
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("networkResolutionReport"));
                  goto LABEL_22;
                }
              }
              v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
              if (v14)
                continue;
              break;
            }
          }
        }
LABEL_22:
        v18 = *(_QWORD *)buf;
        *(_QWORD *)buf = 0;
        if (v18)
          WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v18 + 8));
      }
    }
    v5 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", -[NSError domain](v5, "domain"), -[NSError code](v5, "code"), v9);
  }
  if (self)
  {
    -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
    if (v49)
    {
      MEMORY[0x19AEADCC0](buf, v5);
      if (!kdebug_is_enabled())
      {
LABEL_28:
        v20 = *(_QWORD *)(v49 + 24);
        if (v20)
        {
          v21 = *(_QWORD *)(v20 + 8);
          if (v21)
            (*(void (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)v21 + 40))(v21, buf, v49 + 616);
        }
        goto LABEL_31;
      }
      v42 = *MEMORY[0x1E0CBE150];
      v43 = WTFSignpostLogHandle();
      v44 = v43;
      if (v42)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v45 = *(_QWORD *)(v49 + 608);
          v46 = WTFCurrentContinuousTime();
          *(_DWORD *)v59 = 67110144;
          v60 = 0;
          v61 = 1024;
          v62 = 0;
          v63 = 2048;
          v64 = v45;
          v65 = 2048;
          v66 = v46;
          v67 = 1024;
          v68 = v56 != 0;
          _os_log_impl(&dword_196BCC000, v44, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu completed with error: %d", v59, 0x28u);
        }
        goto LABEL_28;
      }
      v47 = *(const void **)(v49 + 608);
      if (v47)
      {
        v48 = os_signpost_id_make_with_pointer(v43, v47);
        if (v48 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_28;
      }
      else
      {
        v48 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v44))
      {
        *(_DWORD *)v59 = 67109120;
        v60 = v56 != 0;
        _os_signpost_emit_with_name_impl(&dword_196BCC000, v44, OS_SIGNPOST_EVENT, v48, "DataTask", "completed with error: %d", v59, 8u);
      }
      goto LABEL_28;
    }
  }
  else
  {
    v49 = 0;
  }
  v24 = -[WKNetworkSessionDelegate existingWebSocketTask:](self, "existingWebSocketTask:", a4);
  if (!v24)
  {
    if (!v5)
      goto LABEL_61;
    m_ptr = self->_sessionWrapper.m_impl.m_ptr;
    if (!m_ptr)
      goto LABEL_61;
    v26 = *((_QWORD *)m_ptr + 1);
    if (!v26)
      goto LABEL_61;
    v27 = WTF::HashMap<unsigned long long,WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTableTraits>::take((uint64_t *)(v26 + 32), objc_msgSend(a4, "taskIdentifier"));
    if (!v27)
      goto LABEL_61;
    v28 = self->_session.m_impl.m_ptr;
    if (!v28)
      goto LABEL_61;
    v29 = *((_QWORD *)v28 + 1);
    if (!v29)
      goto LABEL_61;
    v30 = (uint64_t *)(*(_QWORD *)(v29 + 32) + 176);
    *(_QWORD *)buf = v27;
    v31 = WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::UniqueRef<WebKit::RemoteAudioDestination>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::UniqueRef<WebKit::RemoteAudioDestination>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::UniqueRef<WebKit::RemoteAudioDestination>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::UniqueRef<WebKit::RemoteAudioDestination>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>(v30, buf);
    if (!v31)
      goto LABEL_61;
    v32 = v31;
    v33 = -[NSError userInfo](v5, "userInfo");
    if (v33)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = -[NSDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", CFSTR("NSURLSessionDownloadTaskResumeData"));
        if (v34)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = (const void *)objc_msgSend(v34, "bytes");
            v33 = (NSDictionary *)objc_msgSend(v34, "length");
LABEL_68:
            MEMORY[0x19AEADCC0](buf, v5);
            WebKit::Download::didFail(v32, (uint64_t)buf, v35, (size_t)v33);
LABEL_31:
            v22 = cf;
            cf = 0;
            if (v22)
              CFRelease(v22);
            v23 = v55;
            v55 = 0;
            if (v23)
            {
              if (*(_DWORD *)v23 == 2)
                WTF::StringImpl::destroy(v23, v19);
              else
                *(_DWORD *)v23 -= 2;
            }
            v36 = *(WTF::StringImpl **)&buf[8];
            *(_QWORD *)&buf[8] = 0;
            if (v36)
            {
              if (*(_DWORD *)v36 == 2)
                WTF::StringImpl::destroy(v36, v19);
              else
                *(_DWORD *)v36 -= 2;
            }
            v37 = *(WTF::StringImpl **)buf;
            *(_QWORD *)buf = 0;
            if (v37)
            {
              if (*(_DWORD *)v37 == 2)
                WTF::StringImpl::destroy(v37, v19);
              else
                *(_DWORD *)v37 -= 2;
            }
            goto LABEL_61;
          }
          v38 = qword_1ECE714B0;
          if (os_log_type_enabled((os_log_t)qword_1ECE714B0, OS_LOG_TYPE_DEFAULT))
          {
            v39 = objc_msgSend(a4, "taskIdentifier");
            v40 = (objc_class *)objc_opt_class();
            v41 = -[NSString UTF8String](NSStringFromClass(v40), "UTF8String");
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v39;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v41;
            _os_log_impl(&dword_196BCC000, v38, OS_LOG_TYPE_DEFAULT, "Download task %llu finished with resume data of wrong class: %s", buf, 0x16u);
          }
        }
      }
      v35 = 0;
      v33 = 0;
      goto LABEL_68;
    }
    v35 = 0;
    goto LABEL_68;
  }
  if (!*((_BYTE *)v24 + 64))
  {
    *((_BYTE *)v24 + 64) = 1;
    WebKit::NetworkSocketChannel::didClose(*((uint64_t **)v24 + 6), (WTF::StringImpl *)0x3EE, MEMORY[0x1E0CBF738]);
  }
LABEL_61:
  if (v49)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v49 + 8));
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  uint64_t v19;
  WTF::StringImpl *v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  uint64_t v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  WTF::StringImpl *v26;
  double v27;
  WTF::StringImpl *v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  int v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  unsigned int v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  WTF::StringImpl *v45;
  float v46;
  char v47;
  unsigned int v48;
  WTF::StringImpl *v49;
  WTF::StringImpl *v50;
  WTF::StringImpl *v51;
  int v52;
  uint64_t v53;
  WTF::StringImpl *v54;
  WTF::StringImpl *v55;
  WTF::StringImpl *v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *v58;
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  uint64_t v69;
  WebCore::AdditionalNetworkLoadMetricsForWebInspector *v70;
  WTF::StringImpl *v71;
  WTF::StringImpl *v72;
  WTF::StringImpl *v73;
  WTF::StringImpl *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  WTF::StringImpl *v81;
  WTF::StringImpl **v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  WTF::ASCIILiteral *(*v85)(uint64_t);
  uint64_t v86;
  _BYTE v87[16];
  uint64_t v88;
  WTF::StringImpl *v89;
  uint64_t v90;
  uint64_t v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (!self)
    return;
  -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
  if (!v91)
    return;
  v7 = (void *)objc_msgSend(a5, "transactionMetrics");
  v8 = (void *)objc_msgSend(v7, "lastObject");
  v9 = v91;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "firstObject"), "fetchStartDate"), "timeIntervalSince1970");
  if (*(double *)&v10 == 0.0)
  {
    v11 = 0;
  }
  else
  {
    v81 = v10;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  *(_QWORD *)(v9 + 616) = v11;
  objc_msgSend((id)objc_msgSend(v8, "fetchStartDate"), "timeIntervalSince1970");
  if (*(double *)&v12 == 0.0)
  {
    v13 = 0;
  }
  else
  {
    v81 = v12;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  *(_QWORD *)(v9 + 624) = v13;
  objc_msgSend((id)objc_msgSend(v8, "domainLookupStartDate"), "timeIntervalSince1970");
  if (*(double *)&v14 == 0.0)
  {
    v15 = 0;
  }
  else
  {
    v81 = v14;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  *(_QWORD *)(v9 + 632) = v15;
  objc_msgSend((id)objc_msgSend(v8, "domainLookupEndDate"), "timeIntervalSince1970");
  if (*(double *)&v16 == 0.0)
  {
    v17 = 0;
  }
  else
  {
    v81 = v16;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  *(_QWORD *)(v9 + 640) = v17;
  objc_msgSend((id)objc_msgSend(v8, "connectStartDate"), "timeIntervalSince1970");
  if (*(double *)&v18 == 0.0)
  {
    v19 = 0;
  }
  else
  {
    v81 = v18;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  *(_QWORD *)(v9 + 648) = v19;
  if (objc_msgSend(v8, "isReusedConnection")
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "response"), "URL"), "scheme"), "isEqualToString:", CFSTR("https")))
  {
    *(_QWORD *)(v9 + 656) = 0xBFF0000000000000;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v8, "secureConnectionStartDate"), "timeIntervalSince1970");
    if (*(double *)&v20 == 0.0)
    {
      v21 = 0;
    }
    else
    {
      v81 = v20;
      WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
    }
    *(_QWORD *)(v9 + 656) = v21;
  }
  objc_msgSend((id)objc_msgSend(v8, "connectEndDate"), "timeIntervalSince1970");
  if (*(double *)&v22 == 0.0)
  {
    v23 = 0;
  }
  else
  {
    v81 = v22;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  *(_QWORD *)(v9 + 664) = v23;
  objc_msgSend((id)objc_msgSend(v8, "requestStartDate"), "timeIntervalSince1970");
  if (*(double *)&v24 == 0.0)
  {
    v25 = 0;
  }
  else
  {
    v81 = v24;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  *(_QWORD *)(v9 + 672) = v25;
  objc_msgSend((id)objc_msgSend(v8, "responseStartDate"), "timeIntervalSince1970");
  if (*(double *)&v26 == 0.0)
  {
    v27 = 0.0;
  }
  else
  {
    v81 = v26;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  if (*(double *)(v9 + 672) >= v27)
    v27 = *(double *)(v9 + 672);
  *(double *)(v9 + 680) = v27;
  objc_msgSend((id)objc_msgSend(v8, "responseEndDate"), "timeIntervalSince1970");
  if (*(double *)&v28 == 0.0)
  {
    v29 = 0;
  }
  else
  {
    v81 = v28;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v81);
  }
  *(_QWORD *)(v9 + 688) = v29;
  *(_BYTE *)(v9 + 714) |= 1u;
  *(_WORD *)(v9 + 712) = objc_msgSend(a5, "redirectCount");
  MEMORY[0x19AEABCC8](&v81, objc_msgSend(v8, "networkProtocolName"));
  v31 = v81;
  v81 = 0;
  v32 = *(WTF::StringImpl **)(v9 + 704);
  *(_QWORD *)(v9 + 704) = v31;
  if (v32)
  {
    v33 = *(_DWORD *)v32 - 2;
    if (*(_DWORD *)v32 != 2)
    {
LABEL_29:
      *(_DWORD *)v32 = v33;
      goto LABEL_30;
    }
    WTF::StringImpl::destroy(v32, v30);
    v32 = v81;
    v81 = 0;
    if (v32)
    {
      v33 = *(_DWORD *)v32 - 2;
      if (*(_DWORD *)v32 != 2)
        goto LABEL_29;
      WTF::StringImpl::destroy(v32, v45);
    }
  }
LABEL_30:
  if (objc_msgSend(v8, "isCellular"))
    v34 = 2;
  else
    v34 = 0;
  *(_BYTE *)(v9 + 714) = *(_BYTE *)(v9 + 714) & 0xFD | v34;
  if (objc_msgSend(v8, "isExpensive"))
    v35 = 4;
  else
    v35 = 0;
  *(_BYTE *)(v9 + 714) = *(_BYTE *)(v9 + 714) & 0xFB | v35;
  if (objc_msgSend(v8, "isConstrained"))
    v36 = 8;
  else
    v36 = 0;
  *(_BYTE *)(v9 + 714) = *(_BYTE *)(v9 + 714) & 0xF7 | v36;
  if (objc_msgSend(v8, "isMultipath"))
    v37 = 16;
  else
    v37 = 0;
  *(_BYTE *)(v9 + 714) = *(_BYTE *)(v9 + 714) & 0xEF | v37;
  if (objc_msgSend(v8, "isReusedConnection"))
    v38 = 32;
  else
    v38 = 0;
  *(_BYTE *)(v9 + 714) = *(_BYTE *)(v9 + 714) & 0xDF | v38;
  v39 = objc_msgSend(v8, "_privacyStance");
  if (v39 >= 6)
    v40 = 0;
  else
    v40 = v39;
  *(_BYTE *)(v9 + 715) = v40;
  v41 = *(_QWORD *)(v91 + 24);
  if (v41)
  {
    v42 = *(_QWORD *)(v41 + 8);
    if (v42)
    {
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v42 + 88))(v42))
      {
        WebCore::AdditionalNetworkLoadMetricsForWebInspector::create((WebCore::AdditionalNetworkLoadMetricsForWebInspector *)&v90);
        objc_msgSend(a4, "priority");
        if (*MEMORY[0x1E0C92BD0] > v46)
          v47 = 1;
        else
          v47 = 2;
        if (*MEMORY[0x1E0C92BD8] >= v46)
          v47 = 0;
        v75 = v90;
        *(_BYTE *)(v90 + 4) = v47;
        v48 = objc_msgSend((id)objc_msgSend(v8, "remotePort"), "unsignedIntValue");
        if (v48)
        {
          MEMORY[0x19AEABCC8](&v89, objc_msgSend(v8, "remoteAddress"));
          WTF::makeString<WTF::String,char,unsigned int>((uint64_t)&v81, (uint64_t)v89, v48);
          v50 = *(WTF::StringImpl **)(v75 + 8);
          *(_QWORD *)(v75 + 8) = v81;
          if (v50)
          {
            if (*(_DWORD *)v50 == 2)
              WTF::StringImpl::destroy(v50, v49);
            else
              *(_DWORD *)v50 -= 2;
          }
          v51 = v89;
          v89 = 0;
          if (!v51)
            goto LABEL_83;
        }
        else
        {
          MEMORY[0x19AEABCC8](&v81, objc_msgSend(v8, "remoteAddress"));
          v72 = v81;
          v81 = 0;
          v51 = *(WTF::StringImpl **)(v75 + 8);
          *(_QWORD *)(v75 + 8) = v72;
          if (!v51)
            goto LABEL_83;
          v52 = *(_DWORD *)v51 - 2;
          if (*(_DWORD *)v51 != 2)
          {
LABEL_82:
            *(_DWORD *)v51 = v52;
LABEL_83:
            v53 = v75;
            MEMORY[0x19AEABCC8](&v81, objc_msgSend((id)objc_msgSend(v8, "_connectionIdentifier"), "UUIDString"));
            v55 = v81;
            v81 = 0;
            v56 = *(WTF::StringImpl **)(v75 + 16);
            *(_QWORD *)(v75 + 16) = v55;
            if (v56)
            {
              if (*(_DWORD *)v56 == 2)
              {
                WTF::StringImpl::destroy(v56, v54);
                v74 = v81;
                v81 = 0;
                if (v74)
                {
                  if (*(_DWORD *)v74 == 2)
                    WTF::StringImpl::destroy(v74, v73);
                  else
                    *(_DWORD *)v74 -= 2;
                  v53 = v75;
                }
              }
              else
              {
                *(_DWORD *)v56 -= 2;
              }
            }
            stringForTLSProtocolVersion(&v81, objc_msgSend((id)objc_msgSend(v8, "negotiatedTLSProtocolVersion"), "unsignedShortValue"));
            v58 = *(WTF::StringImpl **)(v53 + 24);
            *(_QWORD *)(v53 + 24) = v81;
            if (v58)
            {
              if (*(_DWORD *)v58 == 2)
                WTF::StringImpl::destroy(v58, v57);
              else
                *(_DWORD *)v58 -= 2;
            }
            stringForTLSCipherSuite(&v81, objc_msgSend((id)objc_msgSend(v8, "negotiatedTLSCipherSuite"), "unsignedShortValue"));
            v60 = *(WTF::StringImpl **)(v53 + 32);
            *(_QWORD *)(v53 + 32) = v81;
            if (v60)
            {
              if (*(_DWORD *)v60 == 2)
                WTF::StringImpl::destroy(v60, v59);
              else
                *(_DWORD *)v60 -= 2;
            }
            v81 = 0;
            v82 = &v81;
            v83 = 0x5012000000;
            v84 = __Block_byref_object_copy__1;
            v85 = __Block_byref_object_dispose__1;
            v86 = 0;
            WebCore::HTTPHeaderMap::HTTPHeaderMap((WebCore::HTTPHeaderMap *)v87);
            v61 = (void *)objc_msgSend((id)objc_msgSend(v8, "request"), "allHTTPHeaderFields");
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v80[2] = __71__WKNetworkSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke;
            v80[3] = &unk_1E34B5A08;
            v80[4] = &v81;
            objc_msgSend(v61, "enumerateKeysAndObjectsUsingBlock:", v80);
            WebCore::HTTPHeaderMap::operator=(v53 + 40, (uint64_t *)v82 + 6);
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v62 = (void *)objc_msgSend(a5, "transactionMetrics");
            v63 = 0;
            v64 = 0;
            v65 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
            if (v65)
            {
              v66 = *(_QWORD *)v77;
              do
              {
                for (i = 0; i != v65; ++i)
                {
                  if (*(_QWORD *)v77 != v66)
                    objc_enumerationMutation(v62);
                  v68 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
                  v63 += objc_msgSend(v68, "countOfRequestHeaderBytesSent");
                  v64 += objc_msgSend(v68, "countOfResponseHeaderBytesReceived");
                }
                v65 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
              }
              while (v65);
            }
            *(_QWORD *)(v75 + 72) = v63;
            v69 = objc_msgSend(a4, "countOfBytesSent");
            *(_QWORD *)(v75 + 80) = v64;
            *(_QWORD *)(v75 + 88) = v69;
            *(_BYTE *)(v75 + 96) = objc_msgSend(v8, "isProxyConnection");
            v70 = *(WebCore::AdditionalNetworkLoadMetricsForWebInspector **)(v9 + 736);
            *(_QWORD *)(v9 + 736) = v75;
            if (v70)
              WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v70);
            _Block_object_dispose(&v81, 8);
            WTF::Vector<WebCore::HTTPHeaderMap::UncommonHeader,0ul,WTF::CrashOnOverflow,0ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)&v88);
            WTF::Vector<WebCore::HTTPHeaderMap::CommonHeader,0ul,WTF::CrashOnOverflow,6ul,WTF::FastMalloc>::~Vector((WTF::ASCIILiteral *)v87);
            goto LABEL_51;
          }
          WTF::StringImpl::destroy(v51, v71);
          v51 = v81;
          v81 = 0;
          if (!v51)
            goto LABEL_83;
        }
        v52 = *(_DWORD *)v51 - 2;
        if (*(_DWORD *)v51 == 2)
        {
          WTF::StringImpl::destroy(v51, v49);
          goto LABEL_83;
        }
        goto LABEL_82;
      }
    }
  }
LABEL_51:
  *(_QWORD *)(v9 + 720) = objc_msgSend(v8, "countOfResponseBodyBytesReceived");
  v43 = objc_msgSend(v8, "countOfResponseBodyBytesAfterDecoding");
  *(_QWORD *)(v9 + 728) = v43;
  if (!v43)
    *(_QWORD *)(v9 + 720) = 0;
  v44 = v91;
  v91 = 0;
  if (v44)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v44 + 8));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  __int16 v14;
  int v15;
  void *v16;
  WTF::URL *v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  WTF *v20;
  WebCore::AdditionalNetworkLoadMetricsForWebInspector **v21;
  WTF::StringImpl *v22;
  WebCore::AdditionalNetworkLoadMetricsForWebInspector **v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  WebKit::NetworkIssueReporter *v27;
  NSURLSessionTaskMetrics *v28;
  WebCore::IPAddress *v29;
  const WTF::String *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  CFTypeRef v35;
  uint64_t v36;
  const WTF::URL *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  const void *v47;
  os_signpost_id_t v48;
  _QWORD *v49;
  _BYTE v50[112];
  WTF *v51;
  CFTypeRef cf;
  uint64_t v53;
  WTF::StringImpl *v54;
  uint8_t buf[8];
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    v53 = 0;
    goto LABEL_29;
  }
  v11 = v10;
  -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
  if (!v53)
  {
LABEL_29:
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
    goto LABEL_25;
  }
  v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "_incompleteTaskMetrics"), "transactionMetrics"), "lastObject");
  v13 = objc_msgSend(v12, "_privacyStance") == 4 || objc_msgSend(v12, "_privacyStance") == 1;
  v14 = objc_msgSend((id)objc_msgSend(v12, "negotiatedTLSProtocolVersion"), "unsignedShortValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_36;
  v15 = objc_msgSend(a5, "statusCode");
  v16 = (void *)objc_msgSend(a5, "valueForHTTPHeaderField:", CFSTR("X-Content-Type-Options"));
  if (v16)
    objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("nosniff"));
  if (v15 != 304)
  {
LABEL_36:
    objc_msgSend(a5, "_CFURLResponse");
    WebCore::adjustMIMETypeIfNecessary();
  }
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v50, (NSURLResponse *)a5);
  v17 = (WTF::URL *)WebCore::ResourceResponseBase::url((WebCore::ResourceResponseBase *)v50);
  v18 = (WTF::URL::hasSpecialScheme(v17) & 1) != 0 && !v13;
  WebCore::ResourceResponse::disableLazyInitialization((WebCore::ResourceResponse *)v50);
  WebCore::copyTimingData();
  v20 = *(WTF **)buf;
  *(_QWORD *)buf = 0;
  v21 = (WebCore::AdditionalNetworkLoadMetricsForWebInspector **)v51;
  v51 = v20;
  if (v21)
  {
    WTF::ThreadSafeRefCounted<WTF::Box<WebCore::NetworkLoadMetrics>::Data,(WTF::DestructionThread)0>::deref(v21, v19);
    v23 = *(WebCore::AdditionalNetworkLoadMetricsForWebInspector ***)buf;
    *(_QWORD *)buf = 0;
    if (v23)
      WTF::ThreadSafeRefCounted<WTF::Box<WebCore::NetworkLoadMetrics>::Data,(WTF::DestructionThread)0>::deref(v23, v22);
  }
  v24 = v53;
  v25 = _Block_copy(a6);
  v26 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v26 = off_1E34B5FE0;
  v26[1] = v25;
  v26[2] = v11;
  v49 = v26;
  if (!kdebug_is_enabled())
    goto LABEL_15;
  v38 = *MEMORY[0x1E0CBE150];
  v39 = WTFSignpostLogHandle();
  v40 = v39;
  if (v38)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v41 = *(_QWORD *)(v24 + 608);
      v42 = WTFCurrentContinuousTime();
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = 0;
      v56 = 1024;
      v57 = 0;
      v58 = 2048;
      v59 = v41;
      v60 = 2048;
      v61 = v42;
      _os_log_impl(&dword_196BCC000, v40, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received response headers", buf, 0x22u);
    }
    goto LABEL_15;
  }
  v47 = *(const void **)(v24 + 608);
  if (!v47)
  {
    v48 = 0xEEEEB0B5B2B2EEEELL;
    goto LABEL_45;
  }
  v48 = os_signpost_id_make_with_pointer(v39, v47);
  if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_45:
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_196BCC000, v40, OS_SIGNPOST_EVENT, v48, "DataTask", "received response headers", buf, 2u);
    }
  }
LABEL_15:
  if (*(_BYTE *)(v24 + 544))
  {
    v37 = (const WTF::URL *)WebCore::ResourceResponseBase::url((WebCore::ResourceResponseBase *)v50);
    WebKit::NetworkDataTaskCocoa::updateFirstPartyInfoForSession((WebKit::NetworkDataTaskCocoa *)v24, v37);
  }
  else
  {
    v27 = (WebKit::NetworkIssueReporter *)objc_msgSend(*(id *)(v24 + 608), "_incompleteTaskMetrics");
    if (WebKit::NetworkIssueReporter::shouldReport(v27, v28))
    {
      v43 = *(_QWORD *)(v24 + 16);
      if (v43)
      {
        v44 = *(_QWORD *)(v43 + 8);
        if (v44)
        {
          v45 = *(_QWORD *)(v24 + 768);
          v46 = (uint64_t *)WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)(v24 + 128));
          WebKit::NetworkSession::reportNetworkIssue(v44, v45, v46);
        }
      }
    }
  }
  v29 = (WebCore::IPAddress *)MEMORY[0x19AEABCC8](&v54, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v24 + 608), "_incompleteTaskMetrics"), "transactionMetrics"), "lastObject"), "remoteAddress"));
  WebCore::IPAddress::fromString(v29, v30);
  WebKit::NetworkDataTask::didReceiveResponse(v24, (WebCore::ResourceResponseBase *)v50, (unsigned __int16)(v14 - 769) < 2u, v18, (WebCore::IPAddress *)buf, (uint64_t *)&v49);
  v32 = v54;
  v54 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2)
      WTF::StringImpl::destroy(v32, v31);
    else
      *(_DWORD *)v32 -= 2;
  }
  v33 = (uint64_t)v49;
  v49 = 0;
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  _Block_release(0);
  v35 = cf;
  cf = 0;
  if (v35)
    CFRelease(v35);
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v50, v34);
LABEL_25:
  v36 = v53;
  v53 = 0;
  if (v36)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v36 + 8));
}

- (uint64_t)URLSession:(const void *)a1 dataTask:didReceiveResponse:completionHandler:
{
  void *v2;

  *a1 = off_1E34B5FE0;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)URLSession:(uint64_t)a1 dataTask:didReceiveResponse:completionHandler:
{
  *(_QWORD *)a1 = off_1E34B5FE0;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  unsigned __int8 **v9;

  if (self)
  {
    -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
    if (v9)
    {
      WebKit::NetworkDataTaskCocoa::didSendData((WebKit::NetworkDataTaskCocoa *)v9, a6, a7);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(v9[1]);
    }
  }
}

- (void)sessionInvalidated
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_sessionWrapper.m_impl.m_ptr;
  self->_sessionWrapper.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  CFTypeRef cf;
  WTF::RefCountedBase *v7;
  uint64_t v8;

  if (!self)
  {
    v8 = 0;
LABEL_8:
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    goto LABEL_9;
  }
  -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
  if (!v8)
    goto LABEL_8;
  WebCore::ResourceRequestBase::httpBody((WebCore::ResourceRequestBase *)(v8 + 128));
  if (!v7)
    goto LABEL_8;
  WebCore::createHTTPBodyNSInputStream();
  (*((void (**)(id))a5 + 2))(a5);
  if (cf)
    CFRelease(cf);
  WTF::RefCounted<WebCore::FormData>::deref(v7);
LABEL_9:
  if (v8)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v8 + 8));
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  WTF::StringImpl *v23;
  int shouldBlockCookies;
  WTF::StringImpl *v25;
  WTF::StringImpl *isa;
  Class v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  CFTypeRef v33;
  WTF::StringImpl *v34;
  CFTypeRef v35;
  uint64_t v36;
  _QWORD *v37;
  WTF::StringImpl *v38[24];
  CFTypeRef v39;
  NSURLRequest v40;
  CFTypeRef cf;
  __int128 v42;
  char v43;
  uint64_t v44;

  v12 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    v44 = 0;
    goto LABEL_8;
  }
  -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
  if (!v44)
  {
LABEL_8:
    v17 = -[WKNetworkSessionDelegate existingWebSocketTask:](self, "existingWebSocketTask:", a4);
    if (!v17)
    {
      (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
      goto LABEL_37;
    }
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)&v40, (NSURLResponse *)a5);
    MEMORY[0x19AEAEC20](v38, a6);
    v18 = *(_QWORD *)(v17[6] + 40);
    if (v18)
      v19 = *(_QWORD *)(v18 + 8);
    else
      v19 = 0;
    v20 = _Block_copy(a7);
    v21 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
    *v21 = off_1E34B5F68;
    v21[1] = v19;
    v21[2] = v20;
    v21[3] = v12;
    v37 = v21;
    WebKit::NetworkTaskCocoa::willPerformHTTPRedirection((uint64_t)v17, (WebCore::ResourceResponseBase *)&v40, (WebCore::ResourceRequestBase *)v38, (uint64_t *)&v37);
    goto LABEL_30;
  }
  v13 = *(_QWORD *)(v44 + 16);
  if (v13)
  {
    v14 = *(_QWORD *)(v13 + 8);
    if (v14)
    {
      v15 = *(_QWORD *)(v14 + 32);
      v40.super.isa = *(Class *)(v14 + 24);
      WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<PAL::SessionID>>,PAL::SessionID>((uint64_t *)(v15 + 216), &v40);
      v16 = *(_BYTE *)(v44 + 544) ? objc_msgSend(a6, "URL") : objc_msgSend(a6, "mainDocumentURL");
      v22 = v16;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(a6, "_schemeWasUpgradedDueToDynamicHSTS"))
        {
          MEMORY[0x19AEABB18](&v40, v22);
          MEMORY[0x19AEABB18](v38, objc_msgSend(a6, "URL"));
          v42 = *(_OWORD *)(v44 + 744);
          v43 = 1;
          shouldBlockCookies = WebCore::NetworkStorageSession::shouldBlockCookies();
          v25 = v38[0];
          v38[0] = 0;
          if (v25)
          {
            if (*(_DWORD *)v25 == 2)
              WTF::StringImpl::destroy(v25, v23);
            else
              *(_DWORD *)v25 -= 2;
          }
          isa = v40.super.isa;
          v40.super.isa = 0;
          if (isa)
          {
            if (*(_DWORD *)isa == 2)
            {
              WTF::StringImpl::destroy(isa, v23);
              if (shouldBlockCookies)
              {
LABEL_24:
                downgradeRequest(&v40, a6);
                updateIgnoreStrictTransportSecuritySetting((id *)&v40.super.isa, 1);
                v27 = v40.super.isa;
                (*((void (**)(id, Class))a7 + 2))(a7, v40.super.isa);
                if (v27)
                  CFRelease(v27);
                goto LABEL_37;
              }
              goto LABEL_27;
            }
            *(_DWORD *)isa -= 2;
          }
          if (shouldBlockCookies)
            goto LABEL_24;
        }
      }
    }
  }
LABEL_27:
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)&v40, (NSURLResponse *)a5);
  v28 = v44;
  MEMORY[0x19AEAEC20](v38, a6);
  v29 = *(_QWORD *)(v44 + 16);
  if (v29)
    v30 = *(_QWORD *)(v29 + 8);
  else
    v30 = 0;
  v31 = _Block_copy(a7);
  v32 = WTF::fastMalloc((WTF *)0x28);
  *(_QWORD *)v32 = off_1E34B5F40;
  *(_QWORD *)(v32 + 8) = v30;
  *(_QWORD *)(v32 + 16) = v31;
  *(_QWORD *)(v32 + 24) = v12;
  *(_BYTE *)(v32 + 32) = 0;
  v37 = (_QWORD *)v32;
  WebKit::NetworkDataTaskCocoa::willPerformHTTPRedirection(v28, (uint64_t)&v40, (WebCore::ResourceRequestBase *)v38, (uint64_t *)&v37);
LABEL_30:
  if (v37)
    (*(void (**)(_QWORD *))(*v37 + 8))(v37);
  _Block_release(0);
  v33 = v39;
  v39 = 0;
  if (v33)
    CFRelease(v33);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v38);
  v35 = cf;
  cf = 0;
  if (v35)
    CFRelease(v35);
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v40, v34);
LABEL_37:
  v36 = v44;
  v44 = 0;
  if (v36)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v36 + 8));
}

- (void)URLSession:(id)a3 task:(id)a4 _schemeUpgraded:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int shouldBlockCookies;
  CFTypeRef v16;
  Class isa;
  WebCore *v18;
  NSURLResponse *v19;
  NSURLResponse *v20;
  uint64_t v21;
  const __CFString *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  CFTypeRef v28;
  WTF::StringImpl *v29;
  CFTypeRef v30;
  uint64_t v31;
  uint64_t v32;
  WTF::StringImpl *v33[24];
  CFTypeRef v34;
  NSURLRequest v35;
  CFTypeRef v36;
  CFTypeRef cf;
  __int128 v38;
  char v39;
  uint64_t v40;

  v10 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    v40 = 0;
    goto LABEL_13;
  }
  v11 = v10;
  -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
  if (!v40)
  {
LABEL_13:
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
    goto LABEL_28;
  }
  v12 = *(_QWORD *)(v40 + 16);
  if (!v12)
    goto LABEL_14;
  v13 = *(_QWORD *)(v12 + 8);
  if (!v13)
    goto LABEL_14;
  v14 = *(_QWORD *)(v13 + 32);
  v35.super.isa = *(Class *)(v13 + 24);
  WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<PAL::SessionID>>,PAL::SessionID>((uint64_t *)(v14 + 216), &v35);
  if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(a5, "_schemeWasUpgradedDueToDynamicHSTS"))
    goto LABEL_14;
  MEMORY[0x19AEAEC20](&v35, a5);
  v38 = *(_OWORD *)(v40 + 744);
  v39 = 1;
  shouldBlockCookies = WebCore::NetworkStorageSession::shouldBlockCookies();
  v16 = v36;
  v36 = 0;
  if (v16)
    CFRelease(v16);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)&v35);
  if (shouldBlockCookies)
  {
    downgradeRequest(&v35, a5);
    updateIgnoreStrictTransportSecuritySetting((id *)&v35.super.isa, 1);
    isa = v35.super.isa;
    (*((void (**)(id, Class))a6 + 2))(a6, v35.super.isa);
    if (isa)
      CFRelease(isa);
  }
  else
  {
LABEL_14:
    v18 = (WebCore *)objc_msgSend(a4, "currentRequest");
    v20 = (NSURLResponse *)WebCore::synthesizeRedirectResponseIfNecessary(v18, (NSURLRequest *)a5, 0, v19);
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)&v35, v20);
    v21 = objc_msgSend(a5, "valueForHTTPHeaderField:", CFSTR("Origin"));
    if (v21)
      v22 = (const __CFString *)v21;
    else
      v22 = CFSTR("*");
    MEMORY[0x19AEABCC8](v33, v22);
    WebCore::ResourceResponseBase::setHTTPHeaderField();
    v24 = v33[0];
    v33[0] = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2)
        WTF::StringImpl::destroy(v24, v23);
      else
        *(_DWORD *)v24 -= 2;
    }
    v25 = v40;
    MEMORY[0x19AEAEC20](v33, a5);
    v26 = _Block_copy(a6);
    v27 = WTF::fastMalloc((WTF *)0x20);
    *(_QWORD *)v27 = off_1E34B5F90;
    *(_QWORD *)(v27 + 8) = v26;
    *(_QWORD *)(v27 + 16) = v11;
    *(_BYTE *)(v27 + 24) = 0;
    v32 = v27;
    WebKit::NetworkDataTaskCocoa::willPerformHTTPRedirection(v25, (uint64_t)&v35, (WebCore::ResourceRequestBase *)v33, &v32);
    if (v32)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
    _Block_release(0);
    v28 = v34;
    v34 = 0;
    if (v28)
      CFRelease(v28);
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v33);
    v30 = cf;
    cf = 0;
    if (v30)
      CFRelease(v30);
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v35, v29);
  }
LABEL_28:
  v31 = v40;
  v40 = 0;
  if (v31)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v31 + 8));
}

WTF::StringImpl *__71__WKNetworkSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *result;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  MEMORY[0x19AEABCC8](&v9);
  MEMORY[0x19AEABCC8](&v8, a3);
  WebCore::HTTPHeaderMap::set((WebCore::HTTPHeaderMap *)(v4 + 48), (const WTF::String *)&v9, (const WTF::String *)&v8);
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
  result = v9;
  v9 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v5);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5
{
  WTF::StringImpl *v6;
  uint64_t v7;
  uint64_t v8;
  CFTypeRef v9;
  uint64_t v10;
  _BYTE v11[240];
  CFTypeRef cf;
  uint64_t v13;

  if (self)
  {
    -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
    if (v13)
    {
      WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v11, (NSURLResponse *)a5);
      v7 = *(_QWORD *)(v13 + 24);
      if (v7)
      {
        v8 = *(_QWORD *)(v7 + 8);
        if (v8)
          (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v8 + 16))(v8, v11);
      }
      v9 = cf;
      cf = 0;
      if (v9)
        CFRelease(v9);
      WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v11, v6);
      v10 = v13;
      v13 = 0;
      if (v10)
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v10 + 8));
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _didReceiveInformationalResponse:(id)a5
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[WKNetworkSessionDelegate URLSession:task:didReceiveInformationalResponse:](self, "URLSession:task:didReceiveInformationalResponse:", a3, a4, a5);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v6;
  uint64_t v8;
  DefaultWeakPtrImpl *v9;
  uint64_t v10;
  uint64_t *v11;
  WebKit::Download *v12;
  uint64_t v13;

  m_ptr = self->_sessionWrapper.m_impl.m_ptr;
  if (m_ptr)
  {
    v6 = *((_QWORD *)m_ptr + 1);
    if (v6)
    {
      v8 = WTF::HashMap<unsigned long long,WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTableTraits>::take((uint64_t *)(v6 + 32), objc_msgSend(a4, "taskIdentifier", a3));
      if (v8)
      {
        v9 = self->_session.m_impl.m_ptr;
        if (v9)
        {
          v10 = *((_QWORD *)v9 + 1);
          if (v10)
          {
            v11 = (uint64_t *)(*(_QWORD *)(v10 + 32) + 176);
            v13 = v8;
            v12 = (WebKit::Download *)WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::UniqueRef<WebKit::RemoteAudioDestination>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::UniqueRef<WebKit::RemoteAudioDestination>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::UniqueRef<WebKit::RemoteAudioDestination>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::UniqueRef<WebKit::RemoteAudioDestination>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>(v11, &v13);
            if (v12)
              WebKit::Download::didFinish(v12);
          }
        }
      }
    }
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v8;
  uint64_t v13;
  DefaultWeakPtrImpl *v14;
  uint64_t v15;
  uint64_t *v16;
  WebKit::Download *v17;
  uint64_t v18;

  m_ptr = self->_sessionWrapper.m_impl.m_ptr;
  if (m_ptr)
  {
    v8 = *((_QWORD *)m_ptr + 1);
    if (v8)
    {
      v13 = WTF::HashMap<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>,std::unique_ptr<WebCore::NetworkLoadInformation>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkLoadInformation>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>,std::unique_ptr<WebCore::NetworkLoadInformation>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkLoadInformation>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>>,WTF::ObjectIdentifierGeneric<WebCore::ResourceLoader,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>(*(_QWORD *)(v8 + 32), objc_msgSend(a4, "taskIdentifier", a3));
      if (v13)
      {
        v14 = self->_session.m_impl.m_ptr;
        if (v14)
        {
          v15 = *((_QWORD *)v14 + 1);
          if (v15)
          {
            v16 = (uint64_t *)(*(_QWORD *)(v15 + 32) + 176);
            v18 = v13;
            v17 = (WebKit::Download *)WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::UniqueRef<WebKit::RemoteAudioDestination>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::UniqueRef<WebKit::RemoteAudioDestination>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::UniqueRef<WebKit::RemoteAudioDestination>,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTraits<WTF::UniqueRef<WebKit::RemoteAudioDestination>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::ObjectIdentifierGeneric<WebKit::RemoteAudioDestinationIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>(v16, &v18);
            if (v17)
              WebKit::Download::didReceiveData(v17, a5, a6, a7);
          }
        }
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  WebKit::NetworkDataTaskCocoa *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 **v10;
  uint64_t v11;
  uint64_t v12;
  WebKit::Download *v13;
  uint64_t *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WebKit::NetworkDataTaskCocoa *v17;
  uint64_t v18;
  const char ***v19;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  DefaultWeakPtrImpl *v31;
  uint64_t v32;
  const char ***v33;
  WTF::StringImpl *v34[3];
  uint64_t v35;
  const char ***v36;
  uint64_t v37;
  WebKit::NetworkDataTaskCocoa *v38;

  if (self)
  {
    -[WKNetworkSessionDelegate existingTask:](self, "existingTask:", a4);
    v7 = v38;
    if (v38)
    {
      v8 = *((_QWORD *)v38 + 2);
      if (!v8 || (v9 = *(_QWORD *)(v8 + 8)) == 0)
      {
        v38 = 0;
LABEL_25:
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*((unsigned __int8 **)v7 + 1));
        return;
      }
      v10 = (unsigned __int8 **)((char *)v38 + 8);
      WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((unsigned __int8 **)v38 + 1);
      v37 = *((_QWORD *)v38 + 5);
      v11 = v37;
      v12 = *(_QWORD *)(v9 + 32);
      WebKit::NetworkDataTaskCocoa::suggestedFilename((uint64_t)v38, v34);
      v13 = (WebKit::Download *)WTF::fastMalloc((WTF *)0x180);
      v14 = (uint64_t *)(v12 + 152);
      v36 = (const char ***)WebKit::Download::Download((uint64_t)v13, v14, v11, a5, v9);
      v16 = v34[0];
      v34[0] = 0;
      if (v16)
      {
        if (*(_DWORD *)v16 == 2)
          WTF::StringImpl::destroy(v16, v15);
        else
          *(_DWORD *)v16 -= 2;
      }
      v17 = v38;
      v18 = *((_QWORD *)v38 + 75);
      *((_QWORD *)v38 + 75) = 0;
      v19 = (const char ***)*((_QWORD *)v13 + 7);
      *((_QWORD *)v13 + 7) = v18;
      if (v19)
      {
        WTF::RefCounted<WebKit::SandboxExtension>::deref(v19);
        v17 = v38;
      }
      WebKit::Download::didCreateDestination(v13, (WebKit::NetworkDataTaskCocoa *)((char *)v17 + 120));
      WebKit::DownloadManager::dataTaskBecameDownloadTask(v14, v37, &v36);
      m_ptr = self->_sessionWrapper.m_impl.m_ptr;
      if (m_ptr)
        v21 = *((_QWORD *)m_ptr + 1);
      else
        v21 = 0;
      v22 = objc_msgSend(a5, "taskIdentifier");
      v23 = *(_QWORD *)(v21 + 32);
      if (v23)
      {
        v24 = *(_DWORD *)(v23 - 8);
        v25 = (v22 + ~(v22 << 32)) ^ ((unint64_t)(v22 + ~(v22 << 32)) >> 22);
        v26 = 9 * ((v25 + ~(v25 << 13)) ^ ((v25 + ~(v25 << 13)) >> 8));
        v27 = (v26 ^ (v26 >> 15)) + ~((v26 ^ (v26 >> 15)) << 27);
        v28 = v24 & ((v27 >> 31) ^ v27);
        v29 = *(_QWORD *)(v23 + 16 * v28);
        if (v29 == v22)
        {
LABEL_19:
          __break(0xC471u);
          JUMPOUT(0x196FEB30CLL);
        }
        v30 = 1;
        while (v29)
        {
          v28 = (v28 + v30) & v24;
          v29 = *(_QWORD *)(v23 + 16 * v28);
          ++v30;
          if (v29 == v22)
            goto LABEL_19;
        }
      }
      v31 = self->_sessionWrapper.m_impl.m_ptr;
      if (v31)
        v32 = *((_QWORD *)v31 + 1);
      else
        v32 = 0;
      v35 = objc_msgSend(a5, "taskIdentifier");
      WTF::HashMap<unsigned long long,WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTableTraits>::add<WTF::ObjectIdentifierGeneric<WebKit::DownloadIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>&>((uint64_t *)(v32 + 32), &v35, &v37, (uint64_t)v34);
      v33 = v36;
      v36 = 0;
      if (v33)
        ((void (*)(const char ***))(*v33)[1])(v33);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*v10);
      v7 = v38;
      v38 = 0;
      if (v7)
        goto LABEL_25;
    }
  }
}

- (void)existingWebSocketTask:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  WTF *v11;

  m_ptr = self->_sessionWrapper.m_impl.m_ptr;
  if (!m_ptr)
    return 0;
  v4 = 0;
  if (!a3)
    return v4;
  v5 = *((_QWORD *)m_ptr + 1);
  if (!v5)
    return v4;
  WTF::HashMap<unsigned long long,WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<unsigned long long,WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<WTF::WeakPtr<WebKit::WebSocketTask,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned long long>>,unsigned long long>((unsigned int **)&v11, *(_QWORD *)(v5 + 40), objc_msgSend(a3, "taskIdentifier"));
  v7 = (unsigned int *)v11;
  if (!v11)
    return 0;
  v4 = (void *)*((_QWORD *)v11 + 1);
  v11 = 0;
  do
  {
    v8 = __ldaxr(v7);
    v9 = v8 - 1;
  }
  while (__stlxr(v9, v7));
  if (!v9)
  {
    atomic_store(1u, v7);
    WTF::fastFree((WTF *)v7, v6);
  }
  return v4;
}

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5
{
  WebKit::WebSocketTask *v6;
  WebKit::WebSocketTask *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  v6 = -[WKNetworkSessionDelegate existingWebSocketTask:](self, "existingWebSocketTask:", a4);
  if (v6)
  {
    v7 = v6;
    MEMORY[0x19AEABCC8](&v10, a5);
    WebKit::WebSocketTask::didConnect(v7, (const WTF::String *)&v10);
    v9 = v10;
    v10 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v8);
      else
        *(_DWORD *)v9 -= 2;
    }
  }
}

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didCloseWithCode:(int64_t)a5 reason:(id)a6
{
  unsigned __int16 v7;
  void *v8;
  void *v9;
  const void *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;

  v7 = a5;
  v8 = -[WKNetworkSessionDelegate existingWebSocketTask:](self, "existingWebSocketTask:", a4);
  if (v8)
  {
    v9 = v8;
    v10 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a6, 4);
    MEMORY[0x19AEABCC8](&v13, v10);
    if (!*((_BYTE *)v9 + 64))
    {
      *((_BYTE *)v9 + 64) = 1;
      WebKit::NetworkSocketChannel::didClose(*((uint64_t **)v9 + 6), (WTF::StringImpl *)v7, (const WTF::String *)&v13);
    }
    v12 = v13;
    v13 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v11);
        if (!v10)
          return;
LABEL_8:
        CFRelease(v10);
        return;
      }
      *(_DWORD *)v12 -= 2;
    }
    if (!v10)
      return;
    goto LABEL_8;
  }
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  m_ptr = (unsigned int *)self->_sessionWrapper.m_impl.m_ptr;
  self->_sessionWrapper.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
  v6 = (unsigned int *)self->_session.m_impl.m_ptr;
  self->_session.m_impl.m_ptr = 0;
  if (v6)
  {
    do
    {
      v7 = __ldaxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, (void *)a2);
    }
  }
}

- (void)URLSession:task:didReceiveChallenge:completionHandler:
{
  id WeakRetained;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  const void *v18;
  const void *v19;
  _QWORD *v20;
  WTF::StringImpl *v21;
  uint64_t v22;
  CFTypeRef v23;
  CFTypeRef v24;
  _QWORD *v25;
  uint64_t v26;
  _BYTE v27[416];
  CFTypeRef v28;
  CFTypeRef cf;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && (v8 = *((_QWORD *)WeakRetained + 2)) != 0 && *(_QWORD *)(v8 + 8))
  {
    v9 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;
    v10 = *(_QWORD *)(a1 + 40);
    if (v10 && a3 && (v11 = *(_QWORD *)(v10 + 8)) != 0)
    {
      v12 = *((_QWORD *)WeakRetained + 2);
      if (v12)
        v13 = *(_QWORD *)(v12 + 8);
      else
        v13 = 0;
      v14 = *(unsigned __int8 *)(a1 + 72);
      v15 = *(_QWORD *)(a1 + 56);
      v16 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v16 = off_1E34B5D00;
      v17 = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;
      v16[1] = v17;
      MEMORY[0x19AEB2658](v27, a2);
      if (v9)
        WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((unsigned __int8 **)(v9 + 8));
      v26 = v9;
      v18 = (const void *)objc_msgSend((id)objc_msgSend(a2, "protectionSpace"), "serverTrust");
      v19 = v18;
      if (v18)
        CFRetain(v18);
      v20 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
      *v20 = &off_1E34B5CD8;
      v20[1] = v16;
      v20[2] = v19;
      v25 = v20;
      WebKit::NetworkSessionCocoa::continueDidReceiveChallenge(v11, v13, (WebCore::AuthenticationChallengeBase *)v27, v14 != 0, v15, &v26, (uint64_t *)&v25);
      v22 = (uint64_t)v25;
      v25 = 0;
      if (v22)
        (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
      if (v9)
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v9 + 8));
      v23 = cf;
      cf = 0;
      if (v23)
        CFRelease(v23);
      v24 = v28;
      v28 = 0;
      if (v24)
        CFRelease(v24);
      WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)v27, v21);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    if (v9)
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::NetworkDataTask,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v9 + 8));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (!v7)
      return;
  }
  CFRelease(v7);
}

- (uint64_t)URLSession:(uint64_t)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:
{
  *(_QWORD *)a1 = off_1E34B5F68;
  _Block_release(*(const void **)(a1 + 16));
  return a1;
}

- (uint64_t)URLSession:(const void *)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:
{
  void *v2;

  *a1 = off_1E34B5F68;
  _Block_release(a1[2]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)URLSession:(uint64_t)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:
{
  const void *v2;
  const void *v3;

  v2 = (const void *)WebCore::ResourceRequest::nsURLRequest();
  v3 = v2;
  if (v2)
    CFRetain(v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  if (v3)
    CFRelease(v3);
}

- (uint64_t)URLSession:(uint64_t)a1 task:_schemeUpgraded:completionHandler:
{
  *(_QWORD *)a1 = off_1E34B5F90;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)URLSession:(const void *)a1 task:_schemeUpgraded:completionHandler:
{
  void *v2;

  *a1 = off_1E34B5F90;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)URLSession:(uint64_t)a1 task:_schemeUpgraded:completionHandler:
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)WebCore::ResourceRequest::nsURLRequest();
  v4 = v2;
  if (v2)
    CFRetain(v2);
  updateIgnoreStrictTransportSecuritySetting(&v4, *(unsigned __int8 *)(a1 + 24));
  v3 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v3)
    CFRelease(v3);
}

- (uint64_t)URLSession:(uint64_t)a1 task:didReceiveChallenge:completionHandler:
{
  *(_QWORD *)a1 = off_1E34B5FB8;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

@end
