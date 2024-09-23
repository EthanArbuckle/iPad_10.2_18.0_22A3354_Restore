@implementation WKSOAuthorizationDelegate

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)authorization:(id)a3 presentViewController:(id)a4 withCompletion:(id)a5
{
  WKSOAuthorizationDelegate *v8;
  NSObject *v9;
  SOAuthorizationSession *m_ptr;
  SOAuthorizationSession *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const void *v29;
  const void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  WebKit::WebPageProxy *v36;
  const void *v37;
  WKSOAuthorizationDelegate *v38;
  _BYTE buf[12];
  __int16 v40;
  id v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v8 = self;
  v50 = *MEMORY[0x1E0C80C00];
  v38 = self;
  v9 = qword_1ECE70E98;
  if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v8->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = &v38;
    v40 = 2048;
    v41 = a3;
    v42 = 2048;
    v43 = (const char *)m_ptr;
    _os_log_impl(&dword_196BCC000, v9, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization (authorization = %p, _session = %p)", buf, 0x20u);
    v8 = v38;
  }
  v11 = v8->_session.m_ptr;
  if (!v11)
  {
    v16 = qword_1ECE70E98;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = &v38;
      _os_log_impl(&dword_196BCC000, v16, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization: No session, so completing with NO as success state.", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v12 = qword_1ECE70E98;
  v13 = os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT);
  if (!a4)
  {
    if (v13)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = &v38;
      _os_log_impl(&dword_196BCC000, v12, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization: No view controller to present, so completing with NO as success state.", buf, 0xCu);
    }
LABEL_14:
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
    return;
  }
  if (v13)
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = &v38;
    v40 = 2048;
    v41 = a4;
    _os_log_impl(&dword_196BCC000, v12, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization: presentingViewController %p", buf, 0x16u);
    v11 = v38->_session.m_ptr;
    v12 = qword_1ECE70E98;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *((unsigned __int8 *)v11 + 48);
    if (*((_BYTE *)v11 + 48))
    {
      if (v14 == 2)
      {
        v15 = "SubFrame";
      }
      else if (v14 == 1)
      {
        v15 = "PopUp";
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = "Redirect";
    }
    v17 = "Idle";
    switch(*((_BYTE *)v11 + 16))
    {
      case 0:
        break;
      case 1:
        v17 = "Active";
        break;
      case 2:
        v17 = "Waiting";
        break;
      case 3:
        v17 = "Completed";
        break;
      default:
        v17 = 0;
        break;
    }
    v18 = *((_QWORD *)v11 + 7);
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v11;
    v40 = 2080;
    v41 = (id)v15;
    v42 = 2080;
    v43 = v17;
    v44 = 2048;
    v45 = v18;
    _os_log_impl(&dword_196BCC000, v12, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::presentViewController: m_viewController=%p", buf, 0x2Au);
  }
  v19 = *((_QWORD *)v11 + 5);
  if (v19 && (v20 = *(_QWORD *)(v19 + 8)) != 0 && !*(_BYTE *)(v20 + 713) && !*((_QWORD *)v11 + 7))
  {
    CFRetain(a4);
    v30 = (const void *)*((_QWORD *)v11 + 7);
    *((_QWORD *)v11 + 7) = a4;
    if (v30)
      CFRelease(v30);
    v31 = *(_QWORD *)(*((_QWORD *)v11 + 5) + 8);
    if (v31)
      v32 = v31 - 16;
    else
      v32 = 0;
    v33 = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(v32 + 104) + 488))(*(_QWORD *)(v32 + 104));
    if (v33)
      goto LABEL_69;
    v34 = *((_QWORD *)v11 + 5);
    if (v34)
    {
      v35 = *(_QWORD *)(v34 + 8);
      if (v35)
        v36 = (WebKit::WebPageProxy *)(v35 - 16);
      else
        v36 = 0;
    }
    else
    {
      v36 = 0;
    }
    WebKit::WebPageProxy::cocoaView(v36, buf);
    v37 = *(const void **)buf;
    v33 = (void *)objc_msgSend(*(id *)buf, "_wk_viewControllerForFullScreenPresentation");
    if (v37)
      CFRelease(v37);
    if (v33)
    {
LABEL_69:
      objc_msgSend(v33, "presentViewController:animated:completion:", *((_QWORD *)v11 + 7), 1, 0);
      (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
      return;
    }
  }
  else
  {
    v21 = qword_1ECE70E98;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *((unsigned __int8 *)v11 + 48);
      if (*((_BYTE *)v11 + 48))
      {
        if (v22 == 2)
        {
          v23 = "SubFrame";
        }
        else if (v22 == 1)
        {
          v23 = "PopUp";
        }
        else
        {
          v23 = 0;
        }
      }
      else
      {
        v23 = "Redirect";
      }
      v24 = "Idle";
      switch(*((_BYTE *)v11 + 16))
      {
        case 0:
          goto LABEL_45;
        case 1:
          v24 = "Active";
          if (!v19)
            goto LABEL_43;
          goto LABEL_46;
        case 2:
          v24 = "Waiting";
          if (!v19)
            goto LABEL_43;
          goto LABEL_46;
        case 3:
          v24 = "Completed";
LABEL_45:
          if (v19)
            goto LABEL_46;
          goto LABEL_43;
        default:
          v24 = 0;
          if (v19)
          {
LABEL_46:
            v26 = *(_QWORD *)(v19 + 8);
            v25 = v26 - 16;
            if (v26)
              LODWORD(v26) = *(unsigned __int8 *)(v26 + 713);
            else
              v25 = 0;
          }
          else
          {
LABEL_43:
            v25 = 0;
            LODWORD(v26) = 0;
          }
          v27 = *((_QWORD *)v11 + 7);
          *(_DWORD *)buf = 134219266;
          *(_QWORD *)&buf[4] = v11;
          v40 = 2080;
          v41 = (id)v23;
          v42 = 2080;
          v43 = v24;
          v44 = 2048;
          v45 = v25;
          v46 = 1024;
          v47 = v26;
          v48 = 2048;
          v49 = v27;
          _os_log_impl(&dword_196BCC000, v21, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::presentViewController: m_page=%p, m_page->isClosed=%d, m_viewController=%p", buf, 0x3Au);
          break;
      }
    }
  }
  v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v29 = (const void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", PAL::get_AppSSO_SOErrorDomain((PAL *)v28), -7, 0);
  (*((void (**)(id, _QWORD, const void *))a5 + 2))(a5, 0, v29);
  if (v29)
    CFRelease(v29);
}

- (void)authorizationDidNotHandle:(id)a3
{
  WKSOAuthorizationDelegate *v4;
  NSObject *v5;
  SOAuthorizationSession *m_ptr;
  WebKit::SOAuthorizationSession *v7;
  _BOOL4 v8;
  WKSOAuthorizationDelegate *v9;
  uint8_t buf[4];
  WKSOAuthorizationDelegate **v11;
  __int16 v12;
  id v13;
  __int16 v14;
  SOAuthorizationSession *v15;
  uint64_t v16;

  v4 = self;
  v16 = *MEMORY[0x1E0C80C00];
  v9 = self;
  v5 = qword_1ECE70E98;
  if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v4->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    v11 = &v9;
    v12 = 2048;
    v13 = a3;
    v14 = 2048;
    v15 = m_ptr;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidNotHandle: (authorization = %p, _session = %p)", buf, 0x20u);
    v4 = v9;
    v5 = qword_1ECE70E98;
  }
  v7 = (WebKit::SOAuthorizationSession *)v4->_session.m_ptr;
  v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v11 = &v9;
      _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidNotHandle: Falling back to web path.", buf, 0xCu);
      v7 = (WebKit::SOAuthorizationSession *)v9->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::fallBackToWebPath(v7);
  }
  else if (v8)
  {
    *(_DWORD *)buf = 134217984;
    v11 = &v9;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidNotHandle: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorizationDidCancel:(id)a3
{
  WKSOAuthorizationDelegate *v4;
  NSObject *v5;
  SOAuthorizationSession *m_ptr;
  WebKit::SOAuthorizationSession *v7;
  _BOOL4 v8;
  WKSOAuthorizationDelegate *v9;
  uint8_t buf[4];
  WKSOAuthorizationDelegate **v11;
  __int16 v12;
  id v13;
  __int16 v14;
  SOAuthorizationSession *v15;
  uint64_t v16;

  v4 = self;
  v16 = *MEMORY[0x1E0C80C00];
  v9 = self;
  v5 = qword_1ECE70E98;
  if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v4->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    v11 = &v9;
    v12 = 2048;
    v13 = a3;
    v14 = 2048;
    v15 = m_ptr;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidCancel: (authorization = %p, _session = %p)", buf, 0x20u);
    v4 = v9;
    v5 = qword_1ECE70E98;
  }
  v7 = (WebKit::SOAuthorizationSession *)v4->_session.m_ptr;
  v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v11 = &v9;
      _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidCancel: Aborting session.", buf, 0xCu);
      v7 = (WebKit::SOAuthorizationSession *)v9->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::abort(v7);
  }
  else if (v8)
  {
    *(_DWORD *)buf = 134217984;
    v11 = &v9;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidCancel: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorizationDidComplete:(id)a3
{
  WKSOAuthorizationDelegate *v4;
  NSObject *v5;
  SOAuthorizationSession *m_ptr;
  WebKit::SOAuthorizationSession *v7;
  _BOOL4 v8;
  WKSOAuthorizationDelegate *v9;
  uint8_t buf[4];
  WKSOAuthorizationDelegate **v11;
  __int16 v12;
  id v13;
  __int16 v14;
  SOAuthorizationSession *v15;
  uint64_t v16;

  v4 = self;
  v16 = *MEMORY[0x1E0C80C00];
  v9 = self;
  v5 = qword_1ECE70E98;
  if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v4->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    v11 = &v9;
    v12 = 2048;
    v13 = a3;
    v14 = 2048;
    v15 = m_ptr;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidComplete: (authorization = %p, _session = %p)", buf, 0x20u);
    v4 = v9;
    v5 = qword_1ECE70E98;
  }
  v7 = (WebKit::SOAuthorizationSession *)v4->_session.m_ptr;
  v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v11 = &v9;
      _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidComplete: Falling back to web path.", buf, 0xCu);
      v7 = (WebKit::SOAuthorizationSession *)v9->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::fallBackToWebPath(v7);
  }
  else if (v8)
  {
    *(_DWORD *)buf = 134217984;
    v11 = &v9;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorizationDidComplete: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4
{
  WKSOAuthorizationDelegate *v5;
  NSObject *v6;
  SOAuthorizationSession *m_ptr;
  WebKit::SOAuthorizationSession *v8;
  _BOOL4 v9;
  WKSOAuthorizationDelegate *v10;
  uint8_t buf[4];
  WKSOAuthorizationDelegate **v12;
  __int16 v13;
  id v14;
  __int16 v15;
  SOAuthorizationSession *v16;
  uint64_t v17;

  v5 = self;
  v17 = *MEMORY[0x1E0C80C00];
  v10 = self;
  v6 = qword_1ECE70E98;
  if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v5->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    v12 = &v10;
    v13 = 2048;
    v14 = a3;
    v15 = 2048;
    v16 = m_ptr;
    _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPAuthorizationHeaders: (authorization = %p, _session = %p)", buf, 0x20u);
    v5 = v10;
    v6 = qword_1ECE70E98;
  }
  v8 = (WebKit::SOAuthorizationSession *)v5->_session.m_ptr;
  v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      v12 = &v10;
      _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPAuthorizationHeaders: Falling back to web path.", buf, 0xCu);
      v8 = (WebKit::SOAuthorizationSession *)v10->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::fallBackToWebPath(v8);
  }
  else if (v9)
  {
    *(_DWORD *)buf = 134217984;
    v12 = &v10;
    _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPAuthorizationHeaders: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  WKSOAuthorizationDelegate *v8;
  NSObject *v9;
  uint64_t m_ptr;
  SOAuthorizationSession *v11;
  _BOOL4 v12;
  int v13;
  const char *v14;
  const char *v15;
  int v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  int v20;
  const char *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  WebCore::SecurityOrigin *v25;
  const WTF::URL *v26;
  WebCore::SecurityOrigin *v27;
  WebCore::SecurityOrigin *v28;
  const WTF::URL *v29;
  WTF::StringImpl *v30;
  char isSameOriginAs;
  WebCore::SecurityOrigin *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  unsigned int v39;
  WebCore::SecurityOrigin *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  int v45;
  const char *v46;
  const char *v47;
  const char *v48;
  int v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  WTF::StringImpl *v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  API::HTTPCookieStore *v60;
  WTF::ThreadSafeWeakPtrControlBlock *v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CFTypeRef v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  CFTypeRef v84;
  WTF::StringImpl *v85;
  CFTypeRef v86;
  CFTypeRef v87;
  void *v88;
  unsigned __int8 *v89;
  NSObject *v90;
  int v91;
  const char *v92;
  NSObject *v93;
  int v94;
  const char *v95;
  const char *v96;
  const char *v97;
  CFTypeRef v98;
  WKSOAuthorizationDelegate *v99;
  uint64_t v100;
  WebCore::SecurityOrigin *v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[19];
  CFTypeRef v122;
  char v123;
  _BYTE buf[24];
  uint64_t v125;
  _BYTE v126[32];
  uint64_t v127;
  _BYTE v128[24];
  __int128 v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[19];
  CFTypeRef v142;
  char v143;
  CFTypeRef cf;
  uint64_t v145;

  v8 = self;
  v145 = *MEMORY[0x1E0C80C00];
  v99 = self;
  v9 = qword_1ECE70E98;
  if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = (uint64_t)v8->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = &v99;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    v125 = m_ptr;
    _os_log_impl(&dword_196BCC000, v9, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPResponse: (authorization = %p, _session = %p)", buf, 0x20u);
    v8 = v99;
    v9 = qword_1ECE70E98;
  }
  v11 = v8->_session.m_ptr;
  v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = &v99;
      _os_log_impl(&dword_196BCC000, v9, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPResponse: Completing.", buf, 0xCu);
      v11 = v99->_session.m_ptr;
      v9 = qword_1ECE70E98;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *((unsigned __int8 *)v11 + 48);
      if (*((_BYTE *)v11 + 48))
      {
        if (v13 == 2)
        {
          v14 = "SubFrame";
        }
        else if (v13 == 1)
        {
          v14 = "PopUp";
        }
        else
        {
          v14 = 0;
        }
      }
      else
      {
        v14 = "Redirect";
      }
      v15 = "Idle";
      switch(*((_BYTE *)v11 + 16))
      {
        case 0:
          break;
        case 1:
          v15 = "Active";
          break;
        case 2:
          v15 = "Waiting";
          break;
        case 3:
          v15 = "Completed";
          break;
        default:
          v15 = 0;
          break;
      }
      v16 = objc_msgSend(a4, "statusCode", v99);
      v17 = *((_QWORD *)v11 + 7);
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2080;
      v125 = (uint64_t)v15;
      *(_WORD *)v126 = 1024;
      *(_DWORD *)&v126[2] = v16;
      *(_WORD *)&v126[6] = 2048;
      *(_QWORD *)&v126[8] = v17;
      _os_log_impl(&dword_196BCC000, v9, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete: httpState=%d, m_viewController=%p", buf, 0x30u);
    }
    v18 = *((unsigned __int8 *)v11 + 16);
    if (v18 == 1)
    {
      WebKit::SOAuthorizationSession::becomeCompleted((WebKit::SOAuthorizationSession *)v11);
      WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)&v103, (NSURLResponse *)a4);
      if ((*(unsigned int (**)(SOAuthorizationSession *, uint64_t *))(*(_QWORD *)v11 + 48))(v11, &v103))
      {
        v19 = qword_1ECE70E98;
        if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *((unsigned __int8 *)v11 + 48);
          if (*((_BYTE *)v11 + 48))
          {
            if (v20 == 2)
            {
              v21 = "SubFrame";
            }
            else if (v20 == 1)
            {
              v21 = "PopUp";
            }
            else
            {
              v21 = 0;
            }
          }
          else
          {
            v21 = "Redirect";
          }
          v48 = "Idle";
          switch(*((_BYTE *)v11 + 16))
          {
            case 0:
              break;
            case 1:
              v48 = "Active";
              break;
            case 2:
              v48 = "Waiting";
              break;
            case 3:
              v48 = "Completed";
              break;
            default:
              v48 = 0;
              break;
          }
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2080;
          v125 = (uint64_t)v48;
          v51 = "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete: CSP failed. Falling back to web path.";
LABEL_89:
          _os_log_impl(&dword_196BCC000, v19, OS_LOG_TYPE_DEFAULT, v51, buf, 0x20u);
          goto LABEL_90;
        }
        goto LABEL_90;
      }
      v25 = (WebCore::SecurityOrigin *)WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)(*((_QWORD *)v11 + 4) + 40));
      WebCore::SecurityOrigin::create(v25, v26);
      v27 = *(WebCore::SecurityOrigin **)buf;
      v28 = (WebCore::SecurityOrigin *)WebCore::ResourceResponseBase::url((WebCore::ResourceResponseBase *)&v103);
      WebCore::SecurityOrigin::create(v28, v29);
      isSameOriginAs = WebCore::SecurityOrigin::isSameOriginAs(v27, v101);
      v32 = v101;
      v101 = 0;
      if (v32)
        WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v32, v30);
      v33 = *(_QWORD *)buf;
      *(_QWORD *)buf = 0;
      if (v33)
      {
        WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref(v33, v30);
        if ((isSameOriginAs & 1) != 0)
          goto LABEL_38;
      }
      else if ((isSameOriginAs & 1) != 0)
      {
LABEL_38:
        v34 = (void *)MEMORY[0x1E0C92C00];
        v35 = objc_msgSend(a4, "allHeaderFields", v99);
        WebCore::ResourceResponseBase::url((WebCore::ResourceResponseBase *)&v103);
        v36 = (void *)objc_msgSend(v34, "cookiesWithResponseHeaderFields:forURL:", v35, WTF::URL::operator NSURL *());
        v37 = objc_msgSend(v36, "count");
        v38 = v37;
        v101 = 0;
        v102 = 0;
        if (v37)
        {
          if (v37 >= 0x1E1E1E2)
          {
            __break(0xC471u);
            return;
          }
          v39 = 136 * v37;
          v40 = (WebCore::SecurityOrigin *)WTF::fastMalloc((WTF *)(136 * v37));
          v41 = 0;
          LODWORD(v102) = v39 / 0x88;
          v101 = v40;
          v42 = (uint64_t)v40;
          do
          {
            MEMORY[0x19AEB4AC4](buf, objc_msgSend(v36, "objectAtIndexedSubscript:", v41));
            WebCore::Cookie::Cookie(v42, (uint64_t *)buf);
            WebCore::Cookie::~Cookie((WebCore::Cookie *)buf, v43);
            v42 += 136;
            ++v41;
          }
          while (v38 != v41);
          HIDWORD(v102) = v38;
        }
        v44 = qword_1ECE70E98;
        if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
        {
          v45 = *((unsigned __int8 *)v11 + 48);
          if (*((_BYTE *)v11 + 48))
          {
            if (v45 == 2)
            {
              v46 = "SubFrame";
            }
            else if (v45 == 1)
            {
              v46 = "PopUp";
            }
            else
            {
              v46 = 0;
            }
          }
          else
          {
            v46 = "Redirect";
          }
          v53 = "Idle";
          switch(*((_BYTE *)v11 + 16))
          {
            case 0:
              break;
            case 1:
              v53 = "Active";
              break;
            case 2:
              v53 = "Waiting";
              break;
            case 3:
              v53 = "Completed";
              break;
            default:
              v53 = 0;
              break;
          }
          v55 = WebCore::ResourceResponseBase::httpStatusCode((WebCore::ResourceResponseBase *)&v103);
          v56 = HIDWORD(v102);
          v57 = objc_msgSend(a5, "length");
          *(_DWORD *)buf = 134219266;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v46;
          *(_WORD *)&buf[22] = 2080;
          v125 = (uint64_t)v53;
          *(_WORD *)v126 = 1024;
          *(_DWORD *)&v126[2] = v55;
          *(_WORD *)&v126[6] = 1024;
          *(_DWORD *)&v126[8] = v56 != 0;
          *(_WORD *)&v126[12] = 1024;
          *(_DWORD *)&v126[14] = v57 != 0;
          _os_log_impl(&dword_196BCC000, v44, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete: (httpStatusCode=%d, hasCookies=%d, hasData=%d)", buf, 0x32u);
          LODWORD(v38) = HIDWORD(v102);
        }
        if ((_DWORD)v38)
        {
          v58 = *((_QWORD *)v11 + 5);
          if (v58 && (v59 = *(_QWORD *)(v58 + 8)) != 0)
          {
            v60 = WebKit::WebsiteDataStore::cookieStore(*(WebKit::WebsiteDataStore **)(v59 + 248));
            *(_QWORD *)buf = v11;
            v61 = (WTF::ThreadSafeWeakPtrControlBlock *)*((_QWORD *)v11 + 1);
            if (v61)
              v61 = WTF::ThreadSafeWeakPtrControlBlock::weakRef(v61);
            *(_OWORD *)v126 = v104;
            *(_OWORD *)&v126[16] = v105;
            v62 = v108;
            v108 = 0u;
            v63 = v109;
            v109 = 0u;
            *(_QWORD *)&buf[8] = v61;
            *(_QWORD *)&buf[16] = v11;
            v64 = v103;
            v103 = 0;
            v125 = v64;
            LODWORD(v104) = v104 & 0xFFFFFFFE;
            v65 = v106;
            v106 = 0;
            v127 = v65;
            *(_QWORD *)v128 = v107;
            *(_OWORD *)&v128[8] = v62;
            v129 = v63;
            *(_QWORD *)&v62 = v110;
            v110 = 0;
            v130 = v62;
            v66 = v111;
            v111 = 0;
            v131 = v66;
            *(_QWORD *)&v62 = v112;
            v112 = 0;
            v132 = v62;
            v67 = v113;
            v113 = 0;
            v133 = v67;
            LOBYTE(v134) = 0;
            v135 = 0;
            if (v115)
            {
              v68 = v114;
              v114 = 0;
              v134 = v68;
              v135 = 1;
            }
            v140 = v120;
            *(_OWORD *)v141 = *(_OWORD *)v121;
            *(_DWORD *)&v141[15] = *(_DWORD *)&v121[15];
            v136 = v116;
            v137 = v117;
            v138 = v118;
            v139 = v119;
            v69 = v122;
            v122 = 0;
            v142 = v69;
            v143 = v123;
            cf = (CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", a5);
            v70 = WTF::fastMalloc((WTF *)0x128);
            *(_QWORD *)v70 = off_1E34CB330;
            *(_QWORD *)(v70 + 8) = *(_QWORD *)buf;
            *(_QWORD *)(v70 + 16) = *(_QWORD *)&buf[8];
            v71 = *(_QWORD *)&buf[16];
            *(_QWORD *)&buf[8] = 0;
            *(_QWORD *)&buf[16] = 0;
            *(_QWORD *)(v70 + 24) = v71;
            WTF::URL::URL(v70 + 32, &v125);
            v72 = v127;
            v127 = 0;
            *(_QWORD *)(v70 + 72) = v72;
            *(_OWORD *)(v70 + 80) = *(_OWORD *)v128;
            *(_QWORD *)(v70 + 96) = *(_QWORD *)&v128[16];
            *(_QWORD *)(v70 + 104) = v129;
            v73 = *((_QWORD *)&v129 + 1);
            *(_OWORD *)&v128[8] = 0u;
            v129 = 0u;
            *(_QWORD *)(v70 + 112) = v73;
            v74 = v130;
            v130 = 0;
            *(_QWORD *)(v70 + 120) = v74;
            v75 = v131;
            v131 = 0;
            *(_QWORD *)(v70 + 128) = v75;
            v76 = v132;
            v132 = 0;
            *(_QWORD *)(v70 + 136) = v76;
            v77 = v133;
            v133 = 0;
            *(_QWORD *)(v70 + 144) = v77;
            *(_BYTE *)(v70 + 152) = 0;
            *(_BYTE *)(v70 + 160) = 0;
            if (v135)
            {
              v78 = v134;
              v134 = 0;
              *(_QWORD *)(v70 + 152) = v78;
              *(_BYTE *)(v70 + 160) = 1;
            }
            v79 = v139;
            v80 = v140;
            v81 = *(_OWORD *)v141;
            *(_DWORD *)(v70 + 263) = *(_DWORD *)&v141[15];
            v82 = v136;
            v83 = v137;
            *(_OWORD *)(v70 + 200) = v138;
            *(_OWORD *)(v70 + 184) = v83;
            *(_OWORD *)(v70 + 168) = v82;
            *(_OWORD *)(v70 + 248) = v81;
            *(_OWORD *)(v70 + 232) = v80;
            *(_OWORD *)(v70 + 216) = v79;
            *(_QWORD *)(v70 + 272) = v142;
            *(_BYTE *)(v70 + 280) = v143;
            v84 = cf;
            v142 = 0;
            cf = 0;
            *(_QWORD *)(v70 + 288) = v84;
            v100 = v70;
            API::HTTPCookieStore::setCookies((uint64_t)v60, (uint64_t *)&v101, &v100);
            if (v100)
              (*(void (**)(uint64_t))(*(_QWORD *)v100 + 8))(v100);
            v86 = cf;
            cf = 0;
            if (v86)
              CFRelease(v86);
            v87 = v142;
            v142 = 0;
            if (v87)
              CFRelease(v87);
            WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v125, v85);
            v89 = *(unsigned __int8 **)&buf[8];
            *(_QWORD *)&buf[8] = 0;
            if (v89)
              WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v89, v88);
          }
          else
          {
            v90 = qword_1ECE70E98;
            if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
            {
              v91 = *((unsigned __int8 *)v11 + 48);
              if (*((_BYTE *)v11 + 48))
              {
                if (v91 == 2)
                {
                  v92 = "SubFrame";
                }
                else if (v91 == 1)
                {
                  v92 = "PopUp";
                }
                else
                {
                  v92 = 0;
                }
              }
              else
              {
                v92 = "Redirect";
              }
              v96 = "Idle";
              switch(*((_BYTE *)v11 + 16))
              {
                case 0:
                  break;
                case 1:
                  v96 = "Active";
                  break;
                case 2:
                  v96 = "Waiting";
                  break;
                case 3:
                  v96 = "Completed";
                  break;
                default:
                  v96 = 0;
                  break;
              }
              *(_DWORD *)buf = 134218498;
              *(_QWORD *)&buf[4] = v11;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = v92;
              *(_WORD *)&buf[22] = 2080;
              v125 = (uint64_t)v96;
              _os_log_impl(&dword_196BCC000, v90, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete:  Returning early because m_page is null.", buf, 0x20u);
            }
          }
        }
        else
        {
          v93 = qword_1ECE70E98;
          if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
          {
            v94 = *((unsigned __int8 *)v11 + 48);
            if (*((_BYTE *)v11 + 48))
            {
              if (v94 == 2)
              {
                v95 = "SubFrame";
              }
              else if (v94 == 1)
              {
                v95 = "PopUp";
              }
              else
              {
                v95 = 0;
              }
            }
            else
            {
              v95 = "Redirect";
            }
            v97 = "Idle";
            switch(*((_BYTE *)v11 + 16))
            {
              case 0:
                break;
              case 1:
                v97 = "Active";
                break;
              case 2:
                v97 = "Waiting";
                break;
              case 3:
                v97 = "Completed";
                break;
              default:
                v97 = 0;
                break;
            }
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v95;
            *(_WORD *)&buf[22] = 2080;
            v125 = (uint64_t)v97;
            _os_log_impl(&dword_196BCC000, v93, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete:  No cookies to set. Completing (internal).", buf, 0x20u);
          }
          (*(void (**)(SOAuthorizationSession *, uint64_t *, id))(*(_QWORD *)v11 + 40))(v11, &v103, a5);
        }
        WTF::Vector<WebCore::Cookie,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v101, v88);
        goto LABEL_142;
      }
      v19 = qword_1ECE70E98;
      if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
      {
        v49 = *((unsigned __int8 *)v11 + 48);
        if (*((_BYTE *)v11 + 48))
        {
          if (v49 == 2)
          {
            v50 = "SubFrame";
          }
          else if (v49 == 1)
          {
            v50 = "PopUp";
          }
          else
          {
            v50 = 0;
          }
        }
        else
        {
          v50 = "Redirect";
        }
        v52 = "Idle";
        switch(*((_BYTE *)v11 + 16))
        {
          case 0:
            break;
          case 1:
            v52 = "Active";
            break;
          case 2:
            v52 = "Waiting";
            break;
          case 3:
            v52 = "Completed";
            break;
          default:
            v52 = 0;
            break;
        }
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2080;
        v125 = (uint64_t)v52;
        v51 = "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete:  Origins don't match. Falling back to web path.";
        goto LABEL_89;
      }
LABEL_90:
      (*(void (**)(SOAuthorizationSession *))(*(_QWORD *)v11 + 24))(v11);
LABEL_142:
      v98 = v122;
      v122 = 0;
      if (v98)
        CFRelease(v98);
      WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v103, v54);
      return;
    }
    v22 = qword_1ECE70E98;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *((unsigned __int8 *)v11 + 48);
      if (*((_BYTE *)v11 + 48))
      {
        if (v23 == 2)
        {
          v24 = "SubFrame";
        }
        else if (v23 == 1)
        {
          v24 = "PopUp";
        }
        else
        {
          v24 = 0;
        }
      }
      else
      {
        v24 = "Redirect";
      }
      if (v18)
      {
        if (v18 == 3)
        {
          v47 = "Completed";
        }
        else if (v18 == 2)
        {
          v47 = "Waiting";
        }
        else
        {
          v47 = 0;
        }
      }
      else
      {
        v47 = "Idle";
      }
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2080;
      v125 = (uint64_t)v47;
      _os_log_impl(&dword_196BCC000, v22, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::complete: Returning early since not active.", buf, 0x20u);
    }
    WebKit::SOAuthorizationSession::dismissViewController((WebKit::SOAuthorizationSession *)v11);
  }
  else if (v12)
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = &v99;
    _os_log_impl(&dword_196BCC000, v9, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithHTTPResponse: No session, so returning early.", buf, 0xCu);
  }
}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  NSObject *v7;
  SOAuthorizationSession *m_ptr;
  WebKit::SOAuthorizationSession *v9;
  NSObject *v10;
  _BOOL4 v11;
  WKSOAuthorizationDelegate *v12;
  uint8_t buf[4];
  WKSOAuthorizationDelegate **v14;
  __int16 v15;
  id v16;
  __int16 v17;
  SOAuthorizationSession *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = self;
  v7 = qword_1ECE70E98;
  if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = self->_session.m_ptr;
    *(_DWORD *)buf = 134218496;
    v14 = &v12;
    v15 = 2048;
    v16 = a3;
    v17 = 2048;
    v18 = m_ptr;
    _os_log_impl(&dword_196BCC000, v7, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithError: (authorization = %p, _session = %p)", buf, 0x20u);
  }
  objc_msgSend(a4, "code");
  v9 = (WebKit::SOAuthorizationSession *)v12->_session.m_ptr;
  v10 = qword_1ECE70E98;
  v11 = os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      v14 = &v12;
      _os_log_impl(&dword_196BCC000, v10, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithError: Falling back to web path.", buf, 0xCu);
      v9 = (WebKit::SOAuthorizationSession *)v12->_session.m_ptr;
    }
    WebKit::SOAuthorizationSession::fallBackToWebPath(v9);
  }
  else if (v11)
  {
    *(_DWORD *)buf = 134217984;
    v14 = &v12;
    _os_log_impl(&dword_196BCC000, v10, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::authorization:didCompleteWithError: No session, so returning early.", buf, 0xCu);
  }
}

- (void)setSession:(void *)a3
{
  WKSOAuthorizationDelegate *v4;
  WTF::RunLoop *v5;
  NSObject *v6;
  SOAuthorizationSession *m_ptr;
  SOAuthorizationSession *v8;
  SOAuthorizationSession *v9;
  SOAuthorizationSession *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  WKSOAuthorizationDelegate *v18;
  uint8_t buf[4];
  WKSOAuthorizationDelegate **v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v4 = self;
  v27 = *MEMORY[0x1E0C80C00];
  v18 = self;
  v5 = (WTF::RunLoop *)WTF::RunLoop::main((WTF::RunLoop *)self);
  if ((WTF::RunLoop::isCurrent(v5) & 1) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1972486B4);
  }
  v6 = qword_1ECE70E98;
  if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = v4->_session.m_ptr;
    v8 = *(SOAuthorizationSession **)a3;
    *(_DWORD *)buf = 134218496;
    v20 = &v18;
    v21 = 2048;
    v22 = (const char *)m_ptr;
    v23 = 2048;
    v24 = (const char *)v8;
    _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKSOAuthorizationDelegate::setSession: (existing session = %p, new session = %p)", buf, 0x20u);
    v4 = v18;
  }
  v9 = *(SOAuthorizationSession **)a3;
  *(_QWORD *)a3 = 0;
  v10 = v4->_session.m_ptr;
  v4->_session.m_ptr = v9;
  if (v10)
  {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::SOAuthorizationSession,(WTF::DestructionThread)2>(*((unsigned __int8 **)v10 + 1));
    v9 = v18->_session.m_ptr;
  }
  if (v9)
  {
    v11 = qword_1ECE70E98;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E98, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *((unsigned __int8 *)v9 + 48);
      if (*((_BYTE *)v9 + 48))
      {
        if (v12 == 2)
        {
          v13 = "SubFrame";
        }
        else if (v12 == 1)
        {
          v13 = "PopUp";
        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        v13 = "Redirect";
      }
      v14 = "Idle";
      switch(*((_BYTE *)v9 + 16))
      {
        case 0:
          break;
        case 1:
          v14 = "Active";
          break;
        case 2:
          v14 = "Waiting";
          break;
        case 3:
          v14 = "Completed";
          break;
        default:
          v14 = 0;
          break;
      }
      v15 = *((_QWORD *)v9 + 5);
      if (v15)
      {
        v16 = *(_QWORD *)(v15 + 8);
        if (v16)
          v15 = v16 - 16;
        else
          v15 = 0;
      }
      *(_DWORD *)buf = 134218754;
      v20 = (WKSOAuthorizationDelegate **)v9;
      v21 = 2080;
      v22 = v13;
      v23 = 2080;
      v24 = v14;
      v25 = 2048;
      v26 = v15;
      _os_log_impl(&dword_196BCC000, v11, OS_LOG_TYPE_DEFAULT, "%p - [InitiatingAction=%s][State=%s] SOAuthorizationSession::shouldStart: m_page=%p", buf, 0x2Au);
    }
    v17 = *((_QWORD *)v9 + 5);
    if (v17)
    {
      if (*(_QWORD *)(v17 + 8))
        (*(void (**)(SOAuthorizationSession *))(*(_QWORD *)v9 + 16))(v9);
    }
  }
}

- (void).cxx_destruct
{
  SOAuthorizationSession *m_ptr;

  m_ptr = self->_session.m_ptr;
  self->_session.m_ptr = 0;
  if (m_ptr)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::SOAuthorizationSession,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_ptr + 1));
}

@end
