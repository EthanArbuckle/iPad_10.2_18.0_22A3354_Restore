@implementation WKWebView(WKPrivate)

- (uint64_t)_getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:()WKPrivate
{
  WTF::StringImpl *v3;
  uint64_t result;
  WTF::StringImpl *v5;

  v3 = *a2;
  if (*a2)
  {
    *(_DWORD *)v3 += 2;
    WTF::StringImpl::operator NSString *();
  }
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      return WTF::StringImpl::destroy(v3, v5);
    else
      *(_DWORD *)v3 -= 2;
  }
  return result;
}

- (uint64_t)_setInputDelegate:()WKPrivate
{
  void *v2;

  *a1 = off_1E34BCDA0;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_setInputDelegate:()WKPrivate
{
  id *WeakRetained;
  id *v11;
  WebKit::CompletionHandlerCallChecker *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFTypeRef v23;
  _QWORD *v24;
  CFTypeRef v25;
  uint64_t v26;
  CFTypeRef cf;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v12 = (WebKit::CompletionHandlerCallChecker *)objc_loadWeakRetained(WeakRetained + 59);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a5[3]);
      v14 = a5[3];
      if ((_DWORD)v14)
      {
        v15 = 16 * v14;
        v16 = (_QWORD *)(*(_QWORD *)a5 + 8);
        do
        {
          if (*v16)
            v17 = (const __CFString *)WTF::StringImpl::operator NSString *();
          else
            v17 = &stru_1E351F1B8;
          if (*(v16 - 1))
            v18 = (const __CFString *)WTF::StringImpl::operator NSString *();
          else
            v18 = &stru_1E351F1B8;
          objc_msgSend(v13, "setObject:forKey:", v17, v18);
          v16 += 2;
          v15 -= 16;
        }
        while (v15);
      }
      if (a6)
        API::Object::toNSObject(a6, &cf);
      else
        cf = 0;
      WebKit::CompletionHandlerCallChecker::create(v12, (objc_object *)sel__webView_willSubmitFormValues_userObject_submissionHandler_, &v26);
      v21 = *a7;
      *a7 = 0;
      v22 = v26;
      v23 = cf;
      v24 = malloc_type_malloc(0x30uLL, 0x10E004002B5D1D8uLL);
      *v24 = MEMORY[0x1E0C809A0];
      v24[1] = 50331650;
      v24[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKPrivate) _setInputDelegate:]::FormClient::willSubmitForm(WebKit::WebPageProxy &,WebKit::WebFrameProxy &,WebKit::WebFrameProxy &,WTF::Vector<std::pair<WTF::String,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,API::Object *,WTF::CompletionHandler<void ()(void)> &&)::{lambda(void)#1}>(-[WKWebView(WKPrivate) _setInputDelegate:]::FormClient::willSubmitForm(WebKit::WebPageProxy &,WebKit::WebFrameProxy &,WebKit::WebFrameProxy &,WTF::Vector<std::pair<WTF::String,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,API::Object *,WTF::CompletionHandler<void ()(void)> &&)::{lambda(void)#1})::{lambda(void *)#1}::__invoke;
      v24[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKPrivate) _setInputDelegate:]::FormClient::willSubmitForm(WebKit::WebPageProxy &,WebKit::WebFrameProxy &,WebKit::WebFrameProxy &,WTF::Vector<std::pair<WTF::String,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,API::Object *,WTF::CompletionHandler<void ()(void)> &&)::{lambda(void)#1}>(-[WKWebView(WKPrivate) _setInputDelegate:]::FormClient::willSubmitForm(WebKit::WebPageProxy &,WebKit::WebFrameProxy &,WebKit::WebFrameProxy &,WTF::Vector<std::pair<WTF::String,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,API::Object *,WTF::CompletionHandler<void ()(void)> &&)::{lambda(void)#1})::descriptor;
      v24[4] = v21;
      v24[5] = v22;
      -[WebKit::CompletionHandlerCallChecker _webView:willSubmitFormValues:userObject:submissionHandler:](v12, "_webView:willSubmitFormValues:userObject:submissionHandler:", v11, v13, v23, v24);
      _Block_release(v24);
      v25 = cf;
      cf = 0;
      if (v25)
        CFRelease(v25);
      if (v13)
        CFRelease(v13);
    }
    else
    {
      v20 = *a7;
      *a7 = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 16))(v20);
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
    }
    if (v12)
      CFRelease(v12);
    CFRelease(v11);
  }
  else
  {
    v19 = *a7;
    *a7 = 0;
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  }
}

- (uint64_t)_setInputDelegate:
{
  uint64_t result;
  uint64_t v3;

  result = WebKit::CompletionHandlerCallChecker::completionHandlerHasBeenCalled(*(SEL **)(a1 + 40));
  if ((result & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
    *(_QWORD *)(a1 + 32) = 0;
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  }
  return result;
}

- (uint64_t)_frames:()WKPrivate
{
  uint64_t v2;

  *(_QWORD *)a1 = off_1E34BD3A0;
  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  uint64_t v2;
  void *v3;

  *(_QWORD *)a1 = off_1E34BD3A0;
  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  _Block_release(*(const void **)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_frames:()WKPrivate
{
  const void *v3;
  uint64_t v4;
  uint64_t v5;

  API::FrameTreeNode::create(a2, *(_QWORD *)(a1 + 16), &v5);
  v3 = *(const void **)(v5 + 8);
  if (v3)
    CFRetain(*(CFTypeRef *)(v5 + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v3)
    CFRelease(v3);
  v4 = v5;
  v5 = 0;
  if (v4)
    CFRelease(*(CFTypeRef *)(v4 + 8));
}

- (uint64_t)_frameTrees:()WKPrivate
{
  uint64_t v2;

  *(_QWORD *)a1 = off_1E34BD3C8;
  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  uint64_t v2;
  void *v3;

  *(_QWORD *)a1 = off_1E34BD3C8;
  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  _Block_release(*(const void **)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_frameTrees:()WKPrivate
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", *(unsigned int *)(a2 + 12));
  v5 = *(_DWORD *)(a2 + 12);
  if (v5)
  {
    v6 = *(_QWORD *)a2;
    v7 = 312 * v5;
    do
    {
      API::FrameTreeNode::create(v6, *(_QWORD *)(a1 + 16), &v10);
      v8 = *(const void **)(v10 + 8);
      if (v8)
        CFRetain(*(CFTypeRef *)(v10 + 8));
      objc_msgSend(v4, "addObject:", v8);
      if (v8)
        CFRelease(v8);
      v9 = v10;
      v10 = 0;
      if (v9)
        CFRelease(*(CFTypeRef *)(v9 + 8));
      v6 += 312;
      v7 -= 312;
    }
    while (v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v4)
    CFRelease(v4);
}

- (uint64_t)_executeEditCommand:()WKPrivate argument:completion:
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (uint64_t)_startTextManipulationsWithConfiguration:()WKPrivate completion:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (void)_startTextManipulationsWithConfiguration:()WKPrivate completion:
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  _WKTextManipulationToken *v9;
  const __CFString *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t isa;
  unint64_t info;
  unint64_t length;
  unint64_t v21;
  BOOL v22;
  int v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  BOOL v27;
  int v28;
  BOOL v29;
  int v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  char *v40;
  unint64_t v41;
  char *v42;
  int v43;
  uint64_t v44;
  char *v45;
  WTF::StringImpl *v46;
  _QWORD *v47;
  const __CFString *v48;
  WTF::StringImpl *v49[5];

  v47 = a1;
  v49[4] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a2 + 44));
  v48 = (const __CFString *)a2;
  v4 = *(unsigned int *)(a2 + 44);
  if (!(_DWORD)v4)
  {
LABEL_29:
    v17 = 0;
    v7 = v48;
    isa = (unint64_t)v48->isa;
    info = v48->info;
    length = v48->length;
    v21 = info;
    do
    {
      ++v17;
      v22 = v21 > 9;
      v21 /= 0xAuLL;
    }
    while (v22);
    v23 = 0;
    v24 = (unint64_t)v48->isa;
    do
    {
      ++v23;
      v22 = v24 > 9;
      v24 /= 0xAuLL;
    }
    while (v22);
    v25 = 0;
    v26 = v48->length;
    do
    {
      ++v25;
      v22 = v26 > 9;
      v26 /= 0xAuLL;
    }
    while (v22);
    if ((v25 & 0x80000000) == 0)
    {
      v27 = __OFADD__(v25, 1);
      v28 = v25 + 1;
      v29 = v27;
      if ((v23 & 0x80000000) == 0 && !v29)
      {
        v27 = __OFADD__(v23, v28);
        v30 = v23 + v28;
        if (!v27)
        {
          v27 = __OFADD__(v30, 1);
          v31 = v30 + 1;
          v32 = v27;
          if ((v17 & 0x80000000) == 0 && !v32)
          {
            v33 = (v17 + v31);
            if (!__OFADD__(v17, v31))
            {
              if (!(_DWORD)v33)
                goto LABEL_74;
              if ((v33 & 0x80000000) == 0)
              {
                WTF::tryFastCompactMalloc((WTF *)(v33 + 20));
                v34 = v49[0];
                if (v49[0])
                {
                  v35 = 0;
                  v36 = (char *)v49[0] + 20;
                  *(_DWORD *)v49[0] = 2;
                  *((_DWORD *)v34 + 1) = v33;
                  *((_QWORD *)v34 + 1) = (char *)v34 + 20;
                  *((_DWORD *)v34 + 4) = 4;
                  v37 = info;
                  do
                  {
                    *((_BYTE *)&v49[3] + v35--) = (v37 % 0xA) | 0x30;
                    v22 = v37 > 9;
                    v37 /= 0xAuLL;
                  }
                  while (v22);
                  if (v35 + 26 <= 25)
                    memcpy((char *)v34 + 20, (char *)&v49[3] + v35 + 1, -v35);
                  v38 = 0;
                  do
                  {
                    ++v38;
                    v22 = info > 9;
                    info /= 0xAuLL;
                  }
                  while (v22);
                  v39 = 0;
                  v40 = &v36[v38];
                  *v40 = 45;
                  v41 = isa;
                  do
                  {
                    *((_BYTE *)&v49[3] + v39--) = (v41 % 0xA) | 0x30;
                    v22 = v41 > 9;
                    v41 /= 0xAuLL;
                  }
                  while (v22);
                  v42 = v40 + 1;
                  if (v39 + 26 <= 25)
                    memcpy(v42, (char *)&v49[3] + v39 + 1, -v39);
                  v43 = 0;
                  do
                  {
                    ++v43;
                    v22 = isa > 9;
                    isa /= 0xAuLL;
                  }
                  while (v22);
                  v44 = 0;
                  v45 = &v42[v43];
                  *v45 = 45;
                  do
                  {
                    *((_BYTE *)&v49[3] + v44--) = (length % 0xA) | 0x30;
                    v22 = length > 9;
                    length /= 0xAuLL;
                  }
                  while (v22);
                  if (v44 + 26 <= 25)
                    memcpy(v45 + 1, (char *)&v49[3] + v44 + 1, -v44);
                  goto LABEL_67;
                }
              }
            }
          }
        }
      }
    }
    __break(0xC471u);
    return;
  }
  v5 = 0;
  v6 = *(_QWORD *)(a2 + 32);
  v7 = CFSTR("_WKTextManipulationTokenUserInfoVisibilityKey");
  v8 = 96 * v4;
  while (1)
  {
    v9 = objc_alloc_init(_WKTextManipulationToken);
    WTF::String::number(*(WTF::String **)(v6 + v5));
    if (v49[0])
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_1E351F1B8;
    -[_WKTextManipulationToken setIdentifier:](v9, "setIdentifier:", v10, v47);
    v12 = v49[0];
    v49[0] = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v11);
      else
        *(_DWORD *)v12 -= 2;
    }
    if (*(_QWORD *)(v6 + v5 + 8))
      v13 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v13 = &stru_1E351F1B8;
    -[_WKTextManipulationToken setContent:](v9, "setContent:", v13);
    v14 = v6 + v5;
    -[_WKTextManipulationToken setExcluded:](v9, "setExcluded:", *(unsigned __int8 *)(v6 + v5 + 88));
    if (!*(_BYTE *)(v6 + v5 + 80))
    {
      v16 = 0;
      goto LABEL_21;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    if (!*(_BYTE *)(v14 + 80))
      break;
    v16 = v15;
    if (*(_QWORD *)(v6 + v5 + 32))
    {
      objc_msgSend(v15, "setObject:forKey:", WTF::URL::operator NSURL *(), CFSTR("_WKTextManipulationTokenUserInfoDocumentURLKey"));
      if (!*(_BYTE *)(v14 + 80))
        break;
    }
    if (*(_QWORD *)(v14 + 16))
    {
      objc_msgSend(v16, "setObject:forKey:", WTF::StringImpl::operator NSString *(), CFSTR("_WKTextManipulationTokenUserInfoTagNameKey"));
      if (!*(_BYTE *)(v14 + 80))
        break;
    }
    if (*(_QWORD *)(v6 + v5 + 24))
    {
      objc_msgSend(v16, "setObject:forKey:", WTF::StringImpl::operator NSString *(), CFSTR("_WKTextManipulationTokenUserInfoRoleAttributeKey"));
      if (!*(_BYTE *)(v14 + 80))
        break;
    }
    objc_msgSend(v16, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v6 + v5 + 72)), CFSTR("_WKTextManipulationTokenUserInfoVisibilityKey"));
LABEL_21:
    -[_WKTextManipulationToken setUserInfo:](v9, "setUserInfo:", v16);
    if (v16)
      CFRelease(v16);
    if (v9)
    {
      objc_msgSend(v3, "addObject:", v9);
      CFRelease(v9);
    }
    v5 += 96;
    if (v8 == v5)
      goto LABEL_29;
  }
  __break(1u);
LABEL_74:
  v34 = (WTF::StringImpl *)MEMORY[0x1E0CBEF70];
  *MEMORY[0x1E0CBEF70] += 2;
LABEL_67:
  *v47 = -[_WKTextManipulationItem initWithIdentifier:tokens:isSubframe:isCrossSiteSubframe:]([_WKTextManipulationItem alloc], "initWithIdentifier:tokens:isSubframe:isCrossSiteSubframe:", WTF::StringImpl::operator NSString *(), v3, LOBYTE(v7->data), BYTE1(v7->data));
  if (*(_DWORD *)v34 == 2)
  {
    WTF::StringImpl::destroy(v34, v46);
    if (v3)
LABEL_69:
      CFRelease(v3);
  }
  else
  {
    *(_DWORD *)v34 -= 2;
    if (v3)
      goto LABEL_69;
  }
}

- (uint64_t)_completeTextManipulation:()WKPrivate completion:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_completeTextManipulationForItems:()WKPrivate completion:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E34BD490;
  _Block_release(*(const void **)(a1 + 16));
  v2 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

{
  void *v2;
  const void *v3;

  *(_QWORD *)a1 = off_1E34BD490;
  _Block_release(*(const void **)(a1 + 16));
  v3 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_completeTextManipulationForItems:()WKPrivate completion:
{
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    makeFailureSetForAllTextManipulationItems(v15, *(void **)(a1 + 8));
    v4 = (void *)v15[0];
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    if (!v4)
      return;
    goto LABEL_3;
  }
  if (*(_DWORD *)(a3 + 12))
  {
    v6 = *(void **)(a1 + 8);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a3 + 12));
    v7 = *(unsigned int *)(a3 + 12);
    if ((_DWORD)v7)
    {
      v8 = 40 * v7;
      v9 = *(_QWORD *)a3 + 24;
      do
      {
        v10 = *(_QWORD *)v9;
        if (v10 < objc_msgSend(v6, "count"))
        {
          if (((*(unsigned __int8 *)(v9 + 8) - 1) & 0xFC) != 0)
            v11 = 0;
          else
            v11 = (*(_BYTE *)(v9 + 8) - 1) + 1;
          v12 = objc_msgSend(v6, "objectAtIndexedSubscript:", *(_QWORD *)v9);
          v14 = CFSTR("item");
          v15[0] = v12;
          v13 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKTextManipulationItemErrorDomain"), v11, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
          if (v13)
            objc_msgSend(v4, "addObject:", v13);
        }
        v9 += 40;
        v8 -= 40;
      }
      while (v8);
    }
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  if (v4)
LABEL_3:
    CFRelease(v4);
}

- (uint64_t)_dataTaskWithRequest:()WKPrivate runAtForegroundPriority:completionHandler:
{
  void *v2;

  *a1 = off_1E34BD4B8;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_dataTaskWithRequest:()WKPrivate runAtForegroundPriority:completionHandler:
{
  CFRetain(*(CFTypeRef *)(a2 + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  CFRelease(*(CFTypeRef *)(a2 + 8));
}

- (uint64_t)_requestTargetedElementInfo:()WKPrivate completionHandler:
{
  void *v2;

  *a1 = off_1E34BD530;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_requestTargetedElementInfo:()WKPrivate completionHandler:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a2 + 3));
  v5 = *((unsigned int *)a2 + 3);
  if ((_DWORD)v5)
  {
    v6 = *a2;
    v7 = 8 * v5;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)v6 + 8))
        objc_msgSend(v4, "addObject:");
      v6 += 8;
      v7 -= 8;
    }
    while (v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v4)
    CFRelease(v4);
}

- (uint64_t)_loadAndDecodeImage:()WKPrivate constrainedToSize:maximumBytesFromNetwork:completionHandler:
{
  uint64_t v2;
  int v4;
  WebCore::ResourceError *v5;
  _QWORD v6[3];
  _QWORD *v7;

  v6[0] = a1 + 8;
  v6[1] = a1 + 16;
  v6[2] = a1 + 8;
  v2 = *(unsigned int *)(a2 + 80);
  if ((_DWORD)v2 == -1)
  {
    v4 = std::__throw_bad_variant_access[abi:sn180100]();
    return std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:sn180100]<std::__variant_detail::__visitation::__variant::__value_visitor<WTF::Visitor<-[WKWebView(WKPrivate) _loadAndDecodeImage:constrainedToSize:maximumBytesFromNetwork:completionHandler:]::$_38::operator()(std::variant<WebCore::ResourceError,WTF::Ref<WebCore::ShareableBitmap,WTF::RawPtrTraits<WebCore::ShareableBitmap>,WTF::DefaultRefDerefTraits<WebCore::ShareableBitmap>>> &&)::{lambda(WebCore::ResourceError&&)#1},-[WKWebView(WKPrivate) _loadAndDecodeImage:constrainedToSize:maximumBytesFromNetwork:completionHandler:]::$_38::operator()(std::variant<WebCore::ResourceError,WTF::Ref<WebCore::ShareableBitmap,WTF::RawPtrTraits<WebCore::ShareableBitmap>,WTF::DefaultRefDerefTraits<WebCore::ShareableBitmap>>> &)::{lambda(WTF::Ref<WebCore::ShareableBitmap,WTF::RawPtrTraits<WebCore::ShareableBitmap>,WTF::DefaultRefDerefTraits<WebCore::ShareableBitmap>>&&)#1}>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,WebCore::ResourceError,WTF::Ref<WebCore::ShareableBitmap,WTF::RawPtrTraits<WebCore::ShareableBitmap>,WTF::DefaultRefDerefTraits<WebCore::ShareableBitmap>>> &&>(v4, v5);
  }
  else
  {
    v7 = v6;
    return ((uint64_t (*)(_QWORD **))*(&off_1E34BD570 + v2))(&v7);
  }
}

- (uint64_t)_loadServiceWorker:()WKPrivate usingModules:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_didLoadAppInitiatedRequest:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_didLoadNonAppInitiatedRequest:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_suspendPage:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_resumePage:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_getPDFFirstPageSizeInFrame:()WKPrivate completionHandler:
{
  WebCore::FloatSize::operator CGSize();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_sessionStateWithFilter:()WKPrivate
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a2 + 8));
  else
    return 1;
}

- (uint64_t)_insertAttachmentWithFileWrapper:()WKPrivate contentType:completion:
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (uint64_t)_showSafeBrowsingWarningWithURL:()WKPrivate title:warning:detailsWithLinks:completionHandler:
{
  void *v2;

  *a1 = off_1E34BD6D0;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (_QWORD)_showSafeBrowsingWarningWithURL:()WKPrivate title:warning:detailsWithLinks:completionHandler:
{
  uint64_t v2;
  _QWORD ***v4;
  _QWORD v5[2];
  _QWORD *v6;

  v5[0] = a1 + 8;
  v5[1] = a1 + 8;
  v2 = *(unsigned int *)(a2 + 40);
  if ((_DWORD)v2 == -1)
  {
    v4 = (_QWORD ***)std::__throw_bad_variant_access[abi:sn180100]();
    return std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:sn180100]<std::__variant_detail::__visitation::__variant::__value_visitor<WTF::Visitor<-[WKWebView(WKPrivate) _showSafeBrowsingWarningWithURL:title:warning:detailsWithLinks:completionHandler:]::$_39::operator() const(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)::{lambda(WebKit::ContinueUnsafeLoad)#1},-[WKWebView(WKPrivate) _showSafeBrowsingWarningWithURL:title:warning:detailsWithLinks:completionHandler:]::$_39::operator() const(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &)::{lambda(WTF::URL)#1}>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,WebKit::ContinueUnsafeLoad,WTF::URL> &>(v4);
  }
  else
  {
    v6 = v5;
    return (_QWORD *)((uint64_t (*)(_QWORD **))off_1E34BD6E8[v2])(&v6);
  }
}

- (uint64_t)_isJITEnabled:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_saveResources:()WKPrivate suggestedFileName:completionHandler:
{
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), 0);
}

- (uint64_t)_archiveWithConfiguration:()WKPrivate completionHandler:
{
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), 0);
}

- (uint64_t)_getMainResourceDataWithCompletionHandler:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_getContentsAsStringWithCompletionHandler:()WKPrivate
{
  WTF::StringImpl *v3;
  uint64_t result;
  WTF::StringImpl *v5;

  v3 = *a2;
  if (*a2)
  {
    *(_DWORD *)v3 += 2;
    WTF::StringImpl::operator NSString *();
  }
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      return WTF::StringImpl::destroy(v3, v5);
    else
      *(_DWORD *)v3 -= 2;
  }
  return result;
}

- (_QWORD)_getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:()WKPrivate
{
  *a1 = off_1E34BD7D0;
  -[WKWebView(WKPrivate) _getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:]::$_65::~$_65((uint64_t)(a1 + 1));
  return a1;
}

- (uint64_t)_getContentsOfAllFramesAsStringWithCompletionHandler:()WKPrivate
{
  WTF::StringImpl *v3;
  uint64_t result;
  WTF::StringImpl *v5;

  v3 = *a2;
  if (*a2)
  {
    *(_DWORD *)v3 += 2;
    WTF::StringImpl::operator NSString *();
  }
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      return WTF::StringImpl::destroy(v3, v5);
    else
      *(_DWORD *)v3 -= 2;
  }
  return result;
}

- (uint64_t)_getContentsAsAttributedStringWithCompletionHandler:()WKPrivate
{
  void *v2;

  *a1 = off_1E34BD820;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getContentsAsAttributedStringWithCompletionHandler:()WKPrivate
{
  CFTypeRef v4;
  CFTypeRef v5;
  CFTypeRef cf;
  CFTypeRef v7;

  WebCore::AttributedString::nsAttributedString(this);
  if (v7)
  {
    WebCore::AttributedString::documentAttributesAsNSDictionary(this);
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
  else
  {
    createNSError(WKErrorUnknown, 0, &cf);
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  v5 = v7;
  v7 = 0;
  if (v5)
    CFRelease(v5);
}

- (uint64_t)_getApplicationManifestWithCompletionHandler:()WKPrivate
{
  void *v2;

  *a1 = off_1E34BD848;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getApplicationManifestWithCompletionHandler:()WKPrivate
{
  uint64_t v3;
  WebKit *v4;
  WebKit *v5;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    if (*((_BYTE *)this + 264))
    {
      API::ApplicationManifest::create(this, &v5);
      (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
      v4 = v5;
      v5 = 0;
      if (v4)
        CFRelease(*((CFTypeRef *)v4 + 1));
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    }
  }
}

- (uint64_t)_getTextFragmentMatchWithCompletionHandler:()WKPrivate
{
  if (*a2)
    WTF::StringImpl::operator NSString *();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_clearServiceWorkerEntitlementOverride:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_getProcessDisplayNameWithCompletionHandler:()WKPrivate
{
  if (*a2)
    WTF::StringImpl::operator NSString *();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_removeDataDetectedLinks:()WKPrivate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 8);
    if (v4)
      WebKit::WebPageProxy::setDataDetectionResult(v4 - 16, a2);
  }
  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (uint64_t)_setDisplayCaptureState:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setSystemAudioCaptureState:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_resetVisibilityAdjustmentsForTargetedElements:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_adjustVisibilityForTargetedElements:()WKPrivate completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_numberOfVisibilityAdjustmentRectsWithCompletionHandler:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_playPredominantOrNowPlayingMediaSession:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_pauseNowPlayingMediaSession:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

@end
