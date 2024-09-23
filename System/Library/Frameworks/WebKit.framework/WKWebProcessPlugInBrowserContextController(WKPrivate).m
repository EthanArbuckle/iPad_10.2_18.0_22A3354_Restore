@implementation WKWebProcessPlugInBrowserContextController(WKPrivate)

- (uint64_t)_setFormDelegate:()WKPrivate
{
  id *WeakRetained;
  id *v2;
  id v3;
  uint64_t v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 314);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "_webProcessPlugInBrowserContextControllerShouldNotifyOnFormChanges:", v2);
      if (!v3)
        goto LABEL_8;
    }
    else
    {
      v4 = 0;
      if (!v3)
      {
LABEL_8:
        CFRelease(v2);
        return v4;
      }
    }
    CFRelease(v3);
    goto LABEL_8;
  }
  return 0;
}

- (void)_setFormDelegate:()WKPrivate
{
  id *WeakRetained;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeRef *v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (!WeakRetained)
    return;
  v11 = WeakRetained;
  v12 = objc_loadWeakRetained(WeakRetained + 314);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a3)
    {
      WebKit::InjectedBundleNodeHandle::getOrCreate((WebKit::InjectedBundleNodeHandle *)a3, (WebKit::InjectedBundleNodeHandle **)&v17);
      a3 = v17;
    }
    API::Object::fromNSObject((void *)objc_msgSend(v12, "_webProcessPlugInBrowserContextController:willBeginInputSessionForElement:inFrame:userIsInteracting:", v11, a3[1], *(_QWORD *)(a4 + 8), a5), &v16);
LABEL_6:
    v13 = v16;
    v16 = 0;
    v14 = *a6;
    *a6 = v13;
    if (v14)
    {
      CFRelease(*(CFTypeRef *)(v14 + 8));
      v15 = v16;
      v16 = 0;
      if (v15)
        CFRelease(*(CFTypeRef *)(v15 + 8));
    }
    CFRelease(a3[1]);
    goto LABEL_15;
  }
  if ((_DWORD)a5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a3)
    {
      WebKit::InjectedBundleNodeHandle::getOrCreate((WebKit::InjectedBundleNodeHandle *)a3, (WebKit::InjectedBundleNodeHandle **)&v17);
      a3 = v17;
    }
    API::Object::fromNSObject((void *)objc_msgSend(v12, "_webProcessPlugInBrowserContextController:willBeginInputSessionForElement:inFrame:", v11, a3[1], *(_QWORD *)(a4 + 8)), &v16);
    goto LABEL_6;
  }
LABEL_15:
  if (v12)
    CFRelease(v12);
  CFRelease(v11);
}

- (uint64_t)_setEditingDelegate:()WKPrivate
{
  WebKit::InjectedBundleNodeHandle *v8;
  uint64_t v9;
  WebKit::InjectedBundleNodeHandle *v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WebKit::InjectedBundleNodeHandle *v16;
  int v17;
  uint64_t v18;
  int v19;
  char v20;
  uint64_t v21;

  if (!*(_BYTE *)(a1 + 22))
    return 0;
  v8 = *(WebKit::InjectedBundleNodeHandle **)a4;
  *((_DWORD *)v8 + 6) = *(_DWORD *)(*(_QWORD *)a4 + 24) + 2;
  v16 = v8;
  v17 = *(_DWORD *)(a4 + 8);
  v9 = *(_QWORD *)(a4 + 16);
  *(_DWORD *)(v9 + 24) += 2;
  v18 = v9;
  v19 = *(_DWORD *)(a4 + 24);
  v20 = 1;
  WebKit::createHandle(&v21);
  std::__optional_destruct_base<WebCore::SimpleRange,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v16);
  WebKit::InjectedBundleNodeHandle::getOrCreate(a3, &v16);
  v10 = v16;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 8) + 2520));
  v12 = *(_QWORD *)(a1 + 8);
  v13 = v21;
  v14 = objc_msgSend(WeakRetained, "_webProcessPlugInBrowserContextController:performTwoStepDrop:atDestination:isMove:", v12, *((_QWORD *)v10 + 1), *(_QWORD *)(v21 + 8), a5);
  if (WeakRetained)
    CFRelease(WeakRetained);
  CFRelease(*((CFTypeRef *)v10 + 1));
  CFRelease(*(CFTypeRef *)(v13 + 8));
  return v14;
}

- (void)_setEditingDelegate:()WKPrivate
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 21))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 8) + 2520));
    objc_msgSend(WeakRetained, "_webProcessPlugInBrowserContextControllerDidWriteToPasteboard:", *(_QWORD *)(a1 + 8));
    if (WeakRetained)
      CFRelease(WeakRetained);
  }
}

@end
