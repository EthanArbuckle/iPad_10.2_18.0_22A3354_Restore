@implementation _WKWebExtensionActionWebViewDelegate

- (_WKWebExtensionActionWebViewDelegate)initWithWebExtensionAction:(void *)a3
{
  _WKWebExtensionActionWebViewDelegate *v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int *m_ptr;
  unsigned int v9;
  unsigned int v10;
  _WKWebExtensionActionWebViewDelegate *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_WKWebExtensionActionWebViewDelegate;
  v4 = -[_WKWebExtensionActionWebViewDelegate init](&v13, sel_init);
  if (v4)
  {
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 4, (uint64_t)a3);
    v6 = (unsigned int *)*((_QWORD *)a3 + 2);
    if (v6)
    {
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 + 1, v6));
    }
    m_ptr = (unsigned int *)v4->_webExtensionAction.m_impl.m_ptr;
    v4->_webExtensionAction.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr)
    {
      do
      {
        v9 = __ldaxr(m_ptr);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, m_ptr));
      if (!v10)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
    v11 = v4;
  }

  return v4;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  const URL *v19;
  int v20;
  StringImpl *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  StringImpl *v27;
  WebKit::WebExtensionTab *v28;
  char v29;
  uint64_t v30;
  char v31;
  unsigned __int8 v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  WTF::StringImpl *v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  _QWORD *v42;
  URL v43;
  char v44;
  WTF::StringImpl *v45;
  char v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  __int16 v57;

  v7 = a4;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    v11 = *((_QWORD *)m_ptr + 1);
    if (v11)
    {
      v12 = *(_QWORD *)(v11 + 24);
      if (v12)
      {
        if (*(_QWORD *)(v12 + 8))
        {
          objc_msgSend(v7, "request");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "URL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = *(_QWORD *)(*((_QWORD *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
          if (v15)
          {
            v16 = *(_QWORD *)(v15 + 8);
            if (v16)
              v17 = v16 - 16;
            else
              v17 = 0;
          }
          else
          {
            v17 = 0;
          }
          MEMORY[0x19AEABB18](&v43, v14);
          if ((*((_BYTE *)&v43 + 8) & 1) != 0)
            v20 = WTF::protocolHostAndPortAreEqual((WTF *)(v17 + 72), &v43, v19);
          else
            v20 = 0;
          v21 = v43.m_string.m_impl.m_ptr;
          v43.m_string.m_impl.m_ptr = 0;
          if (v21)
          {
            if (*(_DWORD *)v21 == 2)
              WTF::StringImpl::destroy((WTF::StringImpl *)v21, v18);
            else
              *(_DWORD *)v21 -= 2;
          }
          objc_msgSend(v7, "targetFrame");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v7, "targetFrame");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isMainFrame");

            if (((v24 ^ 1 | v20) & 1) != 0)
            {
              objc_msgSend(v7, "targetFrame");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "isMainFrame");

              v9[2](v9, 1);
LABEL_53:

              goto LABEL_10;
            }
          }
          v26 = *((_QWORD *)self->_webExtensionAction.m_impl.m_ptr + 1);
          v27 = *(StringImpl **)(v26 + 40);
          if (v27)
          {
            ++*(_DWORD *)v27;
            v28 = *(WebKit::WebExtensionTab **)(v26 + 32);
            if (v28)
            {
              v29 = 0;
              ++*(_DWORD *)v28;
              goto LABEL_25;
            }
          }
          else
          {
            v28 = *(WebKit::WebExtensionTab **)(v26 + 32);
            if (v28)
            {
              ++*(_DWORD *)v28;
              WebKit::WebExtensionTab::window(v28, &v43);
              v29 = 0;
              v27 = v43.m_string.m_impl.m_ptr;
              goto LABEL_25;
            }
            v27 = 0;
          }
          v29 = 1;
LABEL_25:
          LOBYTE(v43.m_string.m_impl.m_ptr) = 0;
          *((_BYTE *)&v43 + 8) = 0;
          LOBYTE(v43.m_userEnd) = 0;
          v44 = 0;
          LOBYTE(v45) = 0;
          v46 = 0;
          LOBYTE(v47) = 0;
          v48 = 0;
          LOBYTE(v49) = 0;
          v50 = 0;
          v51 = 0;
          v52 = 0;
          v53 = 0;
          v54 = 0;
          v55 = 0;
          v56 = 0;
          v57 = 0;
          MEMORY[0x19AEABB18](&v43.m_userEnd, v14);
          v44 = 1;
          if (v27)
            v30 = *((_QWORD *)v27 + 2);
          else
            v30 = -3;
          if (!v48)
            v48 = 1;
          v47 = v30;
          if ((v29 & 1) != 0)
          {
            v31 = 0;
            v32 = 0;
            v33 = 0;
          }
          else
          {
            v34 = WebKit::WebExtensionTab::index(v28);
            v32 = v34 + 1;
            v33 = (v34 + 1) & 0xFFFFFFFFFFFFFF00;
            v31 = 1;
          }
          v49 = v33 | v32;
          v50 = v31;
          LOWORD(v55) = 257;
          v35 = *(_QWORD *)(*((_QWORD *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
          if (v35)
          {
            v36 = *(_QWORD *)(v35 + 8);
            if (v36)
              v37 = v36 - 16;
            else
              v37 = 0;
          }
          else
          {
            v37 = 0;
          }
          v38 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
          *v38 = off_1E34F4918;
          v42 = v38;
          WebKit::WebExtensionContext::openNewTab(v37, (uint64_t)&v43, (uint64_t *)&v42);
          if (v42)
            (*(void (**)(_QWORD *))(*v42 + 8))(v42);
          v9[2](v9, 0);
          if (v46)
          {
            v40 = v45;
            v45 = 0;
            if (v40)
            {
              if (*(_DWORD *)v40 == 2)
                WTF::StringImpl::destroy(v40, v39);
              else
                *(_DWORD *)v40 -= 2;
            }
          }
          if (v44)
          {
            v41 = *(WTF::StringImpl **)&v43.m_userEnd;
            *(_QWORD *)&v43.m_userEnd = 0;
            if (v41)
            {
              if (*(_DWORD *)v41 == 2)
              {
                WTF::StringImpl::destroy(v41, v39);
                if ((v29 & 1) != 0)
                {
LABEL_51:
                  if (v27)
                    WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v27);
                  goto LABEL_53;
                }
LABEL_50:
                WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v28);
                goto LABEL_51;
              }
              *(_DWORD *)v41 -= 2;
            }
          }
          if ((v29 & 1) != 0)
            goto LABEL_51;
          goto LABEL_50;
        }
      }
    }
  }
  (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
LABEL_10:

}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v8;
  id v9;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  WebKit::WebExtensionContext *v17;
  WTF::StringImpl *v18;
  void *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  uint64_t v22;
  WTF::StringImpl *v23;
  WebKit::WebExtensionTab *v24;
  char v25;
  uint64_t v26;
  char v27;
  unsigned __int8 v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  void *v35;
  WTF::StringImpl *v36;
  void *v37;
  __int16 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  WTF::StringImpl *v58;
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  uint64_t v62[2];
  _BYTE v63[16];
  int v64;
  _BYTE v65[16];
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  int v72;
  __int128 v73;
  WTF::StringImpl *v74[5];
  char v75;
  WTF::StringImpl *v76;
  char v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _OWORD v82[2];
  WTF::StringImpl *v83[2];
  WTF::StringImpl *v84;
  char v85;
  WTF::StringImpl *v86;
  char v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _OWORD v92[2];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (!m_ptr)
    goto LABEL_79;
  v11 = *((_QWORD *)m_ptr + 1);
  if (!v11)
    goto LABEL_79;
  v12 = *(_QWORD *)(v11 + 24);
  if (!v12 || !*(_QWORD *)(v12 + 8))
    goto LABEL_79;
  LOBYTE(v73) = 0;
  BYTE8(v73) = 0;
  LOBYTE(v74[0]) = 0;
  v75 = 0;
  LOBYTE(v76) = 0;
  v77 = 0;
  LOBYTE(v78) = 0;
  BYTE8(v78) = 0;
  LOBYTE(v79) = 0;
  BYTE8(v79) = 0;
  LOBYTE(v80) = 0;
  LOBYTE(v81) = 0;
  BYTE8(v81) = 0;
  LOBYTE(v82[0]) = 0;
  memset((char *)v82 + 8, 0, 18);
  objc_msgSend(v8, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x19AEABB18](v74, v14);
  v75 = 1;

  v15 = *(_QWORD *)(*((_QWORD *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
  if (v15)
  {
    v16 = *(_QWORD *)(v15 + 8);
    if (v16)
      v17 = (WebKit::WebExtensionContext *)(v16 - 16);
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  if (!WebKit::WebExtensionContext::canOpenNewWindow(v17))
  {
    v22 = *((_QWORD *)self->_webExtensionAction.m_impl.m_ptr + 1);
    v23 = *(WTF::StringImpl **)(v22 + 40);
    if (v23)
    {
      ++*(_DWORD *)v23;
      v24 = *(WebKit::WebExtensionTab **)(v22 + 32);
      if (v24)
      {
        v25 = 0;
        ++*(_DWORD *)v24;
      }
      else
      {
        v25 = 1;
      }
    }
    else
    {
      v24 = *(WebKit::WebExtensionTab **)(v22 + 32);
      if (!v24)
      {
        v23 = 0;
        v26 = -3;
        v25 = 1;
        goto LABEL_21;
      }
      ++*(_DWORD *)v24;
      WebKit::WebExtensionTab::window(v24, v83);
      v25 = 0;
      v23 = v83[0];
      if (!v83[0])
      {
        v26 = -3;
        goto LABEL_21;
      }
    }
    v26 = *((_QWORD *)v23 + 2);
LABEL_21:
    if (!BYTE8(v78))
      BYTE8(v78) = 1;
    *(_QWORD *)&v78 = v26;
    if ((v25 & 1) != 0)
    {
      v27 = 0;
      v28 = 0;
      v29 = 0;
    }
    else
    {
      v30 = WebKit::WebExtensionTab::index(v24);
      v28 = v30 + 1;
      v29 = (v30 + 1) & 0xFFFFFFFFFFFFFF00;
      v27 = 1;
    }
    *(_QWORD *)&v79 = v29 | v28;
    BYTE8(v79) = v27;
    WORD4(v82[0]) = 257;
    v31 = *(_QWORD *)(*((_QWORD *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
    if (v31)
    {
      v32 = *(_QWORD *)(v31 + 8);
      if (v32)
        v33 = v32 - 16;
      else
        v33 = 0;
    }
    else
    {
      v33 = 0;
    }
    v34 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v34 = off_1E34F4968;
    v83[0] = v34;
    WebKit::WebExtensionContext::openNewTab(v33, (uint64_t)&v73, (uint64_t *)v83);
    if (v83[0])
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v83[0] + 8))(v83[0]);
    if ((v25 & 1) == 0)
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v24);
    if (v23)
      WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v23);
    goto LABEL_69;
  }
  v63[0] = 0;
  v63[8] = 0;
  v65[0] = 0;
  v66 = 0;
  LOBYTE(v67) = 0;
  v71 = 0;
  v64 = 0;
  v72 = 257;
  *(_OWORD *)v83 = v73;
  std::__optional_move_base<WTF::URL,false>::__optional_move_base[abi:sn180100](&v84, (uint64_t)v74);
  LOBYTE(v86) = 0;
  v87 = 0;
  if (v77)
  {
    v18 = v76;
    v76 = 0;
    v86 = v18;
    v87 = 1;
  }
  v90 = v80;
  v91 = v81;
  v92[0] = v82[0];
  *(_OWORD *)((char *)v92 + 10) = *(_OWORD *)((char *)v82 + 10);
  v88 = v78;
  v89 = v79;
  WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v62, (uint64_t)v83, 1uLL);
  std::optional<WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>::operator=[abi:sn180100]<WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,void>((uint64_t)v65, v62);
  WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v62, v19);
  if (v87)
  {
    v21 = v86;
    v86 = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2)
        WTF::StringImpl::destroy(v21, v20);
      else
        *(_DWORD *)v21 -= 2;
    }
  }
  if (v85)
  {
    v36 = v84;
    v84 = 0;
    if (v36)
    {
      if (*(_DWORD *)v36 == 2)
        WTF::StringImpl::destroy(v36, v20);
      else
        *(_DWORD *)v36 -= 2;
    }
  }
  HIWORD(v64) = objc_msgSend(v9, "_wantsPopup") | 0x100;
  objc_msgSend(v9, "_fullscreenDisplay");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "BOOLValue"))
    v38 = 259;
  else
    v38 = 256;
  LOWORD(v64) = v38;

  objc_msgSend(v9, "x");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend(v9, "x");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v42 = v41;

  }
  else
  {
    v42 = 0x7FF8000000000000;
  }

  objc_msgSend(v9, "y");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v9, "y");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v46 = v45;

  }
  else
  {
    v46 = 0x7FF8000000000000;
  }

  objc_msgSend(v9, "width");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    objc_msgSend(v9, "width");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "doubleValue");
    v50 = v49;

  }
  else
  {
    v50 = 0x7FF8000000000000;
  }

  objc_msgSend(v9, "height");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(v9, "height");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    v54 = v53;

  }
  else
  {
    v54 = 0x7FF8000000000000;
  }

  v67 = v42;
  v68 = v46;
  v69 = v50;
  v70 = v54;
  if (!v71)
    v71 = 1;
  v55 = *(_QWORD *)(*((_QWORD *)self->_webExtensionAction.m_impl.m_ptr + 1) + 24);
  if (v55)
  {
    v56 = *(_QWORD *)(v55 + 8);
    if (v56)
      v57 = v56 - 16;
    else
      v57 = 0;
  }
  else
  {
    v57 = 0;
  }
  v58 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v58 = off_1E34F4940;
  v83[0] = v58;
  WebKit::WebExtensionContext::openNewWindow(v57, (uint64_t)v63, (uint64_t *)v83);
  if (v83[0])
    (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v83[0] + 8))(v83[0]);
  if (v66)
    WTF::Vector<WebKit::WebExtensionTabParameters,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v65, v35);
LABEL_69:
  if (v77)
  {
    v59 = v76;
    v76 = 0;
    if (v59)
    {
      if (*(_DWORD *)v59 == 2)
        WTF::StringImpl::destroy(v59, (WTF::StringImpl *)v35);
      else
        *(_DWORD *)v59 -= 2;
    }
  }
  if (v75)
  {
    v60 = v74[0];
    v74[0] = 0;
    if (v60)
    {
      if (*(_DWORD *)v60 == 2)
        WTF::StringImpl::destroy(v60, (WTF::StringImpl *)v35);
      else
        *(_DWORD *)v60 -= 2;
    }
  }
LABEL_79:

  return 0;
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  WebKit::WebExtensionAction *v4;

  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebKit::WebExtensionAction *)*((_QWORD *)m_ptr + 1);
    if (v4)
      WebKit::WebExtensionAction::closePopup(v4);
  }
}

- (void)webViewDidClose:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  WebKit::WebExtensionAction *v4;

  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebKit::WebExtensionAction *)*((_QWORD *)m_ptr + 1);
    if (v4)
      WebKit::WebExtensionAction::closePopup(v4);
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  WebKit *v10;
  DefaultWeakPtrImpl *m_ptr;
  NSObject *v12;
  NSError *v13;
  DefaultWeakPtrImpl *v14;
  WebKit::WebExtensionAction *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (WebKit *)a5;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    v12 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      WebKit::privacyPreservingDescription(v10, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_error_impl(&dword_196BCC000, v12, OS_LOG_TYPE_ERROR, "Popup provisional load failed: %{public}@", (uint8_t *)&v17, 0xCu);

    }
    v14 = self->_webExtensionAction.m_impl.m_ptr;
    if (v14)
      v15 = (WebKit::WebExtensionAction *)*((_QWORD *)v14 + 1);
    else
      v15 = 0;
    WebKit::WebExtensionAction::closePopup(v15);
  }

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  WebKit *v10;
  DefaultWeakPtrImpl *m_ptr;
  NSObject *v12;
  NSError *v13;
  DefaultWeakPtrImpl *v14;
  WebKit::WebExtensionAction *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (WebKit *)a5;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    v12 = (id)qword_1ECE710C8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      WebKit::privacyPreservingDescription(v10, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_error_impl(&dword_196BCC000, v12, OS_LOG_TYPE_ERROR, "Popup load failed: %{public}@", (uint8_t *)&v17, 0xCu);

    }
    v14 = self->_webExtensionAction.m_impl.m_ptr;
    if (v14)
      v15 = (WebKit::WebExtensionAction *)*((_QWORD *)v14 + 1);
    else
      v15 = 0;
    WebKit::WebExtensionAction::closePopup(v15);
  }

}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;
  uint64_t v6;
  dispatch_time_t v7;
  _QWORD *v8;
  void *v9;
  void *aBlock;

  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 24);
      if (v6)
      {
        if (*(_QWORD *)(v6 + 8) && (*(_BYTE *)(v5 + 124) & 2) == 0 && (*(_BYTE *)(v5 + 124) & 1) != 0)
        {
          if (*(_QWORD *)(v5 + 56))
          {
            v7 = dispatch_time(0, 250000000);
            CFRetain(*(CFTypeRef *)(v5 + 8));
            v8 = malloc_type_malloc(0x30uLL, 0x10E004002B5D1D8uLL);
            *v8 = MEMORY[0x1E0C809A0];
            v8[1] = 50331650;
            v8[2] = WTF::BlockPtrArc<void ()(void)>::fromCallable<WebKit::WebExtensionAction::popupDidFinishDocumentLoad(void)::$_0>(WebKit::WebExtensionAction::popupDidFinishDocumentLoad(void)::$_0)::{lambda(void *)#1}::__invoke;
            v8[3] = &WTF::BlockPtrArc<void ()(void)>::fromCallable<WebKit::WebExtensionAction::popupDidFinishDocumentLoad(void)::$_0>(WebKit::WebExtensionAction::popupDidFinishDocumentLoad(void)::$_0)::descriptor;
            v8[4] = v5;
            v8[5] = v5;
            aBlock = _Block_copy(v8);

            v9 = _Block_copy(aBlock);
            dispatch_after(v7, MEMORY[0x1E0C80D38], v9);

          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_webExtensionAction.m_impl.m_ptr;
  self->_webExtensionAction.m_impl.m_ptr = 0;
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

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (uint64_t)webView:(uint64_t)a1 decidePolicyForNavigationAction:(uint64_t *)a2 decisionHandler:
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    return WTF::RefCounted<WebKit::WebExtensionTab>::deref(result);
  return result;
}

- (uint64_t)webView:(uint64_t)a1 createWebViewWithConfiguration:(uint64_t *)a2 forNavigationAction:windowFeatures:
{
  uint64_t result;

  result = *a2;
  *a2 = 0;
  if (result)
    return WTF::RefCounted<WebKit::WebExtensionTab>::deref(result);
  return result;
}

@end
