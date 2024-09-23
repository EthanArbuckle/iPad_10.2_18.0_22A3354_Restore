@implementation NSAttributedString

void __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned __int8 isKindOfClass;
  double v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  double v8;
  double v9;
  dispatch_time_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t *v13;
  const void *v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFTypeRef v22;
  _WKAttributedStringNavigationDelegate *v23;
  const void *v24;
  uint64_t v25;
  _QWORD block[6];
  _QWORD v27[9];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[4];
  __int128 v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint64_t (*v44)(uint64_t);
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  void *v52;
  CFTypeRef cf;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  void *v59;
  _WKAttributedStringNavigationDelegate *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  void *v66;
  const void *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;

  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  +[_WKAttributedStringWebViewCache invalidateGlobalConfigurationIfNeeded:](_WKAttributedStringWebViewCache, "invalidateGlobalConfigurationIfNeeded:", *(_QWORD *)(a1 + 32));
  v61 = 0;
  v62 = &v61;
  v63 = 0x3812000000;
  v64 = __Block_byref_object_copy__4;
  v65 = __Block_byref_object_dispose__4;
  v66 = &unk_197A0BBD2;
  +[_WKAttributedStringWebViewCache retrieveOrCreateWebView](_WKAttributedStringWebViewCache, "retrieveOrCreateWebView");
  v54 = 0;
  v55 = &v54;
  v56 = 0x3812000000;
  v57 = __Block_byref_object_copy__183;
  v58 = __Block_byref_object_dispose__184;
  v59 = &unk_197A0BBD2;
  v60 = objc_alloc_init(_WKAttributedStringNavigationDelegate);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3812000000;
  v50 = __Block_byref_object_copy__187;
  v51 = __Block_byref_object_dispose__188;
  v52 = &unk_197A0BBD2;
  cf = 0;
  objc_msgSend((id)v62[6], "setNavigationDelegate:", v55[6]);
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CEA160]);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = 1.0;
  if ((isKindOfClass & (v2 != 0)) == 1)
    objc_msgSend(v2, "doubleValue", 1.0);
  objc_msgSend((id)v62[6], "_setTextZoomFactor:", v4);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3812000000;
  v43 = __Block_byref_object_copy__190;
  v44 = __Block_byref_object_dispose__191;
  v45 = &unk_197A0BBD2;
  v46 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_193;
  v33[3] = &unk_1E34BAD00;
  v35 = &v68;
  v36 = &v40;
  v37 = &v61;
  v38 = &v54;
  v39 = &v47;
  v34 = *(_OWORD *)(a1 + 40);
  v31[4] = &v47;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_2;
  v32[3] = &unk_1E34BAD28;
  v32[4] = v33;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_3;
  v31[3] = &unk_1E34BAD50;
  objc_msgSend((id)v55[6], "setDecidePolicyForNavigationAction:", v31);
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_4;
  v30[3] = &unk_1E34BAD78;
  v30[4] = v32;
  objc_msgSend((id)v55[6], "setWebContentProcessDidTerminate:", v30);
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_5;
  v29[3] = &unk_1E34BADA0;
  v29[4] = v32;
  objc_msgSend((id)v55[6], "setDidFailProvisionalNavigation:", v29);
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_6;
  v28[3] = &unk_1E34BADA0;
  v28[4] = v32;
  objc_msgSend((id)v55[6], "setDidFailNavigation:", v28);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_7;
  v27[3] = &unk_1E34BADF0;
  v27[6] = &v68;
  v27[7] = &v54;
  v27[8] = &v61;
  v27[4] = v32;
  v27[5] = v33;
  objc_msgSend((id)v55[6], "setDidFinishNavigation:", v27);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CEA170]);
  objc_opt_class();
  v7 = 60000000000;
  if ((objc_opt_isKindOfClass() & (v6 != 0)) == 1)
  {
    objc_msgSend(v6, "doubleValue");
    if (v8 >= 0.0)
    {
      objc_msgSend(v6, "doubleValue");
      v7 = (uint64_t)(v9 * 1000000000.0);
    }
  }
  v10 = dispatch_time(0, v7);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_9;
  block[3] = &unk_1E34BAE18;
  block[4] = v32;
  block[5] = &v68;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);
  v11 = (const void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v12 = (uint64_t)v11;
  v13 = v48;
  if (v11)
    CFRetain(v11);
  v14 = (const void *)v13[6];
  v13[6] = v12;
  if (v14)
    CFRelease(v14);
  if (!*((_BYTE *)v69 + 24))
  {
    objc_msgSend((id)v62[6], "_page");
    v15 = *(_QWORD *)(v25 + 208);
    v16 = (unsigned int *)(v15 + 16);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 + 1, v16));
    v18 = WTF::fastMalloc((WTF *)0x28);
    WebKit::ProcessThrottlerActivity::ProcessThrottlerActivity(v18, v15 + 200, "NSAttributedString serialization", 33, 1, 0);
    v19 = WTF::fastMalloc((WTF *)0x10);
    *(_DWORD *)v19 = 1;
    *(_QWORD *)(v19 + 8) = v18;
    v20 = v41[6];
    v41[6] = v19;
    if (v20)
      WTF::ThreadSafeRefCounted<WTF::Box<WTF::UniqueRef<WebKit::ProcessThrottlerActivity>>::Data,(WTF::DestructionThread)0>::deref(v20);
    if (v15)
      WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)(v15 + 16));
  }
  _Block_object_dispose(&v40, 8);
  v21 = v46;
  v46 = 0;
  if (v21)
    WTF::ThreadSafeRefCounted<WTF::Box<WTF::UniqueRef<WebKit::ProcessThrottlerActivity>>::Data,(WTF::DestructionThread)0>::deref(v21);
  _Block_object_dispose(&v47, 8);
  v22 = cf;
  cf = 0;
  if (v22)
    CFRelease(v22);
  _Block_object_dispose(&v54, 8);
  v23 = v60;
  v60 = 0;
  if (v23)
    CFRelease(v23);
  _Block_object_dispose(&v61, 8);
  v24 = v67;
  v67 = 0;
  if (v24)
    CFRelease(v24);
  _Block_object_dispose(&v68, 8);
}

void __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_193(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  const void *v17;
  const void *v18;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(_QWORD *)(v8 + 48);
    *(_QWORD *)(v8 + 48) = 0;
    if (v9)
      WTF::ThreadSafeRefCounted<WTF::Box<WTF::UniqueRef<WebKit::ProcessThrottlerActivity>>::Data,(WTF::DestructionThread)0>::deref(v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48), "setNavigationDelegate:", 0);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v11 = *(const void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = 0;
    if (v11)
      CFRelease(v11);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v13 = *(const void **)(v12 + 48);
    *(_QWORD *)(v12 + 48) = 0;
    if (v13)
      CFRelease(v13);
    if (!a4)
      +[_WKAttributedStringWebViewCache cacheWebView:](_WKAttributedStringWebViewCache, "cacheWebView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(const void **)(v14 + 48);
    *(_QWORD *)(v14 + 48) = 0;
    if (v15)
      CFRelease(v15);
    if (!a2 || (v16 = *(_QWORD *)(a1 + 32), v16 == objc_opt_class()))
      v17 = 0;
    else
      v17 = (const void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithAttributedString:", a2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", a3);
    else
      v18 = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (v18)
      CFRelease(v18);
    if (v17)
      CFRelease(v17);
  }
}

void __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_2(uint64_t a1, WKErrorCode a2, const __CFString *a3)
{
  uint64_t v3;
  CFTypeRef v4;
  CFTypeRef cf;

  v3 = *(_QWORD *)(a1 + 32);
  createNSError(a2, a3, &cf);
  (*(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef))(v3 + 16))(v3, 0, 0, cf);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, objc_msgSend((id)objc_msgSend(a2, "_mainFrameNavigation"), "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48)));
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_7(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    v2 = *(_QWORD *)(*(_QWORD *)(result + 56) + 8);
    v3 = *(const void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = 0;
    if (v3)
      CFRelease(v3);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_8;
    v5[3] = &unk_1E34BADC8;
    v6 = *(_OWORD *)(v1 + 32);
    return objc_msgSend(v4, "_getContentsAsAttributedStringWithCompletionHandler:", v5);
  }
  return result;
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_9(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __107__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithRequest_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loadRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __107__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithFileURL_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ReadAccessURL"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  return objc_msgSend(a2, "loadFileURL:allowingReadAccessToURL:", *(_QWORD *)(a1 + 40), v5);
}

uint64_t __106__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithString_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CEA060]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  return objc_msgSend(a2, "loadHTMLString:baseURL:", *(_QWORD *)(a1 + 40), v5);
}

uint64_t __104__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithData_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  CFStringRef v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  BOOL v10;
  CFStringEncoding v11;
  uint64_t v12;

  v4 = (CFStringRef)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CEA150]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v4 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CEA078]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)v5;
  else
    v6 = 0;
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CEA060]);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v7)
    v10 = v4 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v11 = CFStringConvertNSStringEncodingToEncoding(v7);
    if (v11 == -1)
      v4 = 0;
    else
      v4 = CFStringConvertEncodingToIANACharSetName(v11);
  }
  if ((isKindOfClass & 1) != 0)
    v12 = v8;
  else
    v12 = 0;
  return objc_msgSend(a2, "loadData:MIMEType:characterEncodingName:baseURL:", *(_QWORD *)(a1 + 40), CFSTR("text/html"), v4, v12);
}

@end
