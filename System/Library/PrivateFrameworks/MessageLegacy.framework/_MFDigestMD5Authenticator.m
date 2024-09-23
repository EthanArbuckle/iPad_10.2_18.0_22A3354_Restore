@implementation _MFDigestMD5Authenticator

- (void)dealloc
{
  objc_super v3;

  if (self->_expectedResponse)
    NSZoneFree((NSZone *)-[_MFDigestMD5Authenticator zone](self, "zone"), self->_expectedResponse);

  v3.receiver = self;
  v3.super_class = (Class)_MFDigestMD5Authenticator;
  -[MFSASLAuthenticator dealloc](&v3, sel_dealloc);
}

- (void)setAuthenticationState:(int)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFDigestMD5Authenticator;
  -[MFSASLAuthenticator setAuthenticationState:](&v6, sel_setAuthenticationState_);
  if (a3 != 1)
  {
    v5 = (void *)*((_QWORD *)self + 5);
    if (v5)
    {

      *((_QWORD *)self + 5) = 0;
    }
    *((_BYTE *)&self->super._authenticationState + 6) = *((_BYTE *)&self->super._authenticationState + 6) & 0xFC | 1;
    *((_WORD *)&self->super._authenticationState + 2) = 0;
  }
}

- (id)responseForServerData:(id)a3
{
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  const UInt8 *v8;
  const UInt8 *v9;
  UInt8 v10;
  const UInt8 *v11;
  UInt8 v12;
  const UInt8 *v13;
  UInt8 v14;
  NSObject *v15;
  CC_LONG v16;
  const UInt8 *v17;
  UInt8 v18;
  uint64_t v19;
  CFStringRef v20;
  CFDataRef v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  CFDataRef v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  CFDataRef v31;
  NSObject *v32;
  __CFString *v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  CFStringRef v44;
  int v45;
  int v46;
  __CFString *v47;
  int v48;
  __CFString *v49;
  NSObject *v50;
  NSObject *v51;
  const __CFData *v52;
  CFDataRef v53;
  CFDataRef v54;
  NSObject *v55;
  id v56;
  unsigned int v57;
  NSObject *v58;
  NSObject *v59;
  const char *v60;
  CFDataRef v62;
  id v63;
  int v64;
  NSObject *v65;
  NSData *expectedResponse;
  NSData *v67;
  void *ResponseData;
  void *v69;
  void *v70;
  void *v71;
  const UInt8 *v72;
  const UInt8 *v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CC_MD5_CTX buf;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  if (-[MFSASLAuthenticator authenticationState](self, "authenticationState") == 1)
  {
    v72 = (const UInt8 *)objc_msgSend(a3, "bytes");
    v5 = objc_msgSend(a3, "length");
    v73 = &v72[v5];
    v74 = 1;
    v75 = 0u;
    v76 = 0u;
    v77 = 0;
    if (v5 >= 1)
    {
      while (1)
      {
        if (!(_DWORD)v74)
          goto LABEL_141;
        v6 = (__CFString *)copyToken(&v72);
        v7 = v6;
        v8 = v72;
        v9 = v73;
        if (v72 < v73)
LABEL_6:
          v10 = *v8;
        else
          v10 = 0;
        v11 = v8;
        v8 = v72;
        do
        {
          while (1)
          {
            do
            {
              v12 = v10;
              v10 = 0;
            }
            while (v12 > 0x20u);
            if (((1 << v12) & 0x100002600) == 0)
              break;
            v10 = 0;
            v8 = v11 + 1;
            v11 = v8;
            if (v8 < v73)
            {
              v72 = v8;
              goto LABEL_6;
            }
          }
        }
        while (v12);
        v72 = v8;
        if (v6)
        {
          if (v11 >= v73 || *v11 != 61)
          {
            v15 = MFLogGeneral();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              goto LABEL_53;
            if (v11 >= v9)
              v16 = 0;
            else
              v16 = *v11;
            goto LABEL_51;
          }
          v13 = v11 + 1;
          v72 = v11 + 1;
          if (v11 + 1 >= v73)
            v14 = 0;
          else
LABEL_18:
            v14 = *v13;
          v17 = v13;
          v13 = v72;
          do
          {
            while (1)
            {
              do
              {
                v18 = v14;
                v14 = 0;
              }
              while (v18 > 0x20u);
              if (((1 << v18) & 0x100002600) == 0)
                break;
              v14 = 0;
              v13 = v17 + 1;
              v17 = v13;
              if (v13 < v73)
              {
                v72 = v13;
                goto LABEL_18;
              }
            }
          }
          while (v18);
          v72 = v13;
          if (-[__CFString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("realm")))
          {
            if (-[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("nonce")))
            {
              if (-[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("qop")))
              {
                if (-[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("stale")))
                {
                  if (-[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("maxbuf")))
                  {
                    if (-[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("charset")))
                    {
                      if (-[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("algorithm")))
                      {
                        if (!-[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("cipher-opts")))
                        {
                          v52 = (const __CFData *)copyQuotedTokenList(&v72);
                          v21 = v52;
                          if (v52)
                          {
                            if (!(_QWORD)v76)
                              *(_QWORD *)&v76 = -[__CFData copy](v52, "copy");
                            goto LABEL_117;
                          }
                          v55 = MFLogGeneral();
                          if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                            goto LABEL_117;
                          buf.A = 138412290;
                          *(_QWORD *)&buf.B = v7;
                          v28 = v55;
                          v29 = "*** Unable to parse %@. Ignoring";
LABEL_60:
                          v30 = 12;
                          goto LABEL_61;
                        }
                        v19 = -[__CFString caseInsensitiveCompare:](v7, "caseInsensitiveCompare:", CFSTR("rspauth"));
                        v20 = copyToken(&v72);
                        v21 = (CFDataRef)v20;
                        if (v19)
                        {
                          if (v20)
                            goto LABEL_117;
                          v21 = quoted_string(&v72);
                          if (v21)
                            goto LABEL_117;
                          v22 = MFLogGeneral();
                          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                          {
                            buf.A = 138412290;
                            *(_QWORD *)&buf.B = v7;
                            v23 = v22;
                            v24 = "*** Unable to parse %@. Aborting";
                            v25 = 12;
                            goto LABEL_52;
                          }
                          goto LABEL_53;
                        }
                        if (v20)
                        {
                          if (!*((_QWORD *)&v76 + 1))
                            *((_QWORD *)&v76 + 1) = MFCreateDataWithString();
                          goto LABEL_117;
                        }
                        v43 = MFLogGeneral();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                        {
LABEL_126:
                          buf.A = 138412290;
                          *(_QWORD *)&buf.B = v7;
                          _os_log_impl(&dword_1C8839000, v43, OS_LOG_TYPE_INFO, "*** Unable to parse %@. Ignoring", (uint8_t *)&buf, 0xCu);
                        }
                      }
                      else
                      {
                        v34 = (__CFString *)copyToken(&v72);
                        if (v34
                          || (v53 = quoted_string(&v72)) != 0
                          && (v54 = v53,
                              v34 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v53, 4), v54, v34))
                        {
                          if (-[__CFString caseInsensitiveCompare:](v34, "caseInsensitiveCompare:", CFSTR("md5-sess")))
                          {
                            v51 = MFLogGeneral();
                            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                            {
                              buf.A = 138412546;
                              *(_QWORD *)&buf.B = v34;
                              LOWORD(buf.D) = 2112;
                              *(_QWORD *)((char *)&buf.D + 2) = v7;
                              _os_log_impl(&dword_1C8839000, v51, OS_LOG_TYPE_INFO, "*** Unexpected value %@ for %@. Ignoring", (uint8_t *)&buf, 0x16u);
                            }
                            LODWORD(v74) = 0;
                          }
                          else
                          {
                            LODWORD(v77) = v77 | 0x20;
                          }
LABEL_77:

                          goto LABEL_54;
                        }
                        v43 = MFLogGeneral();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                          goto LABEL_126;
                      }
                    }
                    else
                    {
                      v49 = (__CFString *)copyToken(&v72);
                      if (v49)
                      {
                        v21 = (CFDataRef)v49;
                        if (-[__CFString caseInsensitiveCompare:](v49, "caseInsensitiveCompare:", CFSTR("utf-8")))
                        {
                          v50 = MFLogGeneral();
                          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                          {
                            buf.A = 138412546;
                            *(_QWORD *)&buf.B = v21;
                            LOWORD(buf.D) = 2112;
                            *(_QWORD *)((char *)&buf.D + 2) = v7;
                            v28 = v50;
                            v29 = "*** Unexpected value %@ for %@. Ignoring";
                            v30 = 22;
LABEL_61:
                            _os_log_impl(&dword_1C8839000, v28, OS_LOG_TYPE_INFO, v29, (uint8_t *)&buf, v30);
                          }
LABEL_117:

                          goto LABEL_54;
                        }
                        v46 = v77 | 0x10;
LABEL_116:
                        LODWORD(v77) = v46;
                        goto LABEL_117;
                      }
                      v43 = MFLogGeneral();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                        goto LABEL_126;
                    }
                  }
                  else
                  {
                    v47 = (__CFString *)copyToken(&v72);
                    if (v47)
                    {
                      v21 = (CFDataRef)v47;
                      v48 = -[__CFString intValue](v47, "intValue");
                      if ((v48 - 1) > 0xFFFD)
                        goto LABEL_117;
                      v46 = v77 & 0xFFC0003F | ((unsigned __int16)v48 << 6);
                      goto LABEL_116;
                    }
                    v43 = MFLogGeneral();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                      goto LABEL_126;
                  }
                }
                else
                {
                  v44 = copyToken(&v72);
                  if (v44)
                  {
                    v21 = (CFDataRef)v44;
                    if (NSBOOLFromString())
                      v45 = 8;
                    else
                      v45 = 0;
                    v46 = v77 & 0xFFFFFFF7 | v45;
                    goto LABEL_116;
                  }
                  v43 = MFLogGeneral();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                    goto LABEL_126;
                }
              }
              else
              {
                v33 = (__CFString *)copyQuotedTokenList(&v72);
                if (v33)
                {
                  v34 = v33;
                  v35 = -[__CFString count](v33, "count");
                  if (v35)
                  {
                    v36 = v35;
                    v37 = v77;
                    do
                    {
                      v38 = -[__CFString objectAtIndex:](v34, "objectAtIndex:", --v36);
                      v39 = 0;
                      do
                      {
                        v40 = v39;
                        v41 = -[__CFString caseInsensitiveCompare:](QOP_NAMES[v39], "caseInsensitiveCompare:", v38);
                        v39 = v40 + 1;
                      }
                      while (v40 <= 1 && v41);
                      v42 = (1 << v39) & 7;
                      if (v41)
                        v42 = 0;
                      v37 |= v42;
                    }
                    while (v36);
                    LODWORD(v77) = v37;
                  }
                  goto LABEL_77;
                }
                v43 = MFLogGeneral();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  goto LABEL_126;
              }
            }
            else
            {
              v31 = quoted_string(&v72);
              if (v31)
              {
                v21 = v31;
                if (*((_QWORD *)&v75 + 1))
                {
                  v32 = MFLogGeneral();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    buf.A = 138412290;
                    *(_QWORD *)&buf.B = v7;
                    _os_log_impl(&dword_1C8839000, v32, OS_LOG_TYPE_INFO, "*** Duplicate value for %@. Ignoring", (uint8_t *)&buf, 0xCu);
                  }
                  LODWORD(v74) = 0;
                  goto LABEL_117;
                }
                *((_QWORD *)&v75 + 1) = v31;
              }
              else
              {
                v43 = MFLogGeneral();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  goto LABEL_126;
              }
            }
          }
          else
          {
            v26 = quoted_string(&v72);
            if (v26)
            {
              v21 = v26;
              if ((_QWORD)v75)
              {
                v27 = MFLogGeneral();
                if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  goto LABEL_117;
                buf.A = 138412290;
                *(_QWORD *)&buf.B = v7;
                v28 = v27;
                v29 = "*** Duplicate value for %@. Ignoring";
                goto LABEL_60;
              }
              *(_QWORD *)&v75 = v26;
            }
            else
            {
              v43 = MFLogGeneral();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                goto LABEL_126;
            }
          }
        }
        else
        {
          if (v11 >= v73 || *v11 != 44)
          {
            v15 = MFLogGeneral();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              goto LABEL_53;
            if (v11 >= v9)
              v16 = 0;
            else
              v16 = *v11;
LABEL_51:
            buf.A = 67109120;
            buf.B = v16;
            v23 = v15;
            v24 = "*** Unexpected character '%c', aborting";
            v25 = 8;
LABEL_52:
            _os_log_impl(&dword_1C8839000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&buf, v25);
LABEL_53:
            LODWORD(v74) = 0;
            goto LABEL_54;
          }
          v72 = v11 + 1;
        }
LABEL_54:

        if (v72 >= v73)
        {
          if (!(_DWORD)v74)
            goto LABEL_141;
          break;
        }
      }
    }
    if (*((_QWORD *)self + 5))
    {
      if (*((_QWORD *)&v76 + 1))
      {
        if ((objc_msgSend(*((id *)&v76 + 1), "isEqual:") & 1) != 0)
        {
          -[_MFDigestMD5Authenticator setAuthenticationState:](self, "setAuthenticationState:", 4);
          v56 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
LABEL_142:

          return v56;
        }
        v59 = MFLogGeneral();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.A) = 0;
          v60 = "*** Bogus rspauth value returned from the server";
          goto LABEL_140;
        }
      }
      else
      {
        v59 = MFLogGeneral();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.A) = 0;
          v60 = "*** Missing rspauth value in server message";
LABEL_140:
          _os_log_impl(&dword_1C8839000, v59, OS_LOG_TYPE_INFO, v60, (uint8_t *)&buf, 2u);
        }
      }
LABEL_141:
      -[_MFDigestMD5Authenticator setAuthenticationState:](self, "setAuthenticationState:", 3);
      v56 = 0;
      goto LABEL_142;
    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v78 = 0u;
    v57 = v77;
    if ((v77 & 0x20) != 0)
    {
      if ((MFGetRandomBytes() & 1) != 0)
      {
        v62 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&buf, 16, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
        *(_QWORD *)&v78 = (id)-[__CFData mf_encodeBase64WithoutLineBreaks](v62, "mf_encodeBase64WithoutLineBreaks");
        CFRelease(v62);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%08x"), 1);
        *((_QWORD *)&v78 + 1) = MFCreateDataWithString();
        if ((v57 & 4) != 0)
        {
          -[_MFDigestMD5Authenticator setSecurityLevel:](self, "setSecurityLevel:", 2);
          -[_MFDigestMD5Authenticator setMaxBuffer:](self, "setMaxBuffer:", (unsigned __int16)(v57 >> 6));
        }
        else
        {
          -[_MFDigestMD5Authenticator setSecurityLevel:](self, "setSecurityLevel:", 1);
        }
        -[_MFDigestMD5Authenticator securityLevel](self, "securityLevel");
        *(_QWORD *)&v79 = MFCreateDataWithString();
        v63 = -[MFSASLAuthenticator account](self, "account");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), objc_msgSend((id)objc_opt_class(), "saslProfileName"), objc_msgSend(v63, "hostname"));
        objc_msgSend(v63, "username");
        *((_QWORD *)&v79 + 1) = MFCreateDataWithString();
        objc_msgSend(v63, "password");
        *(_QWORD *)&v80 = MFCreateDataWithString();
        *((_QWORD *)&v80 + 1) = MFCreateDataWithString();
        *(_QWORD *)&v81 = objc_msgSend((id)v75, "copy");
        *((_QWORD *)&v81 + 1) = _createResponseData((uint64_t)self, (uint64_t)&v75, (uint64_t)&v78, 1);
        if (*((_QWORD *)&v81 + 1))
        {
          v64 = -[_MFDigestMD5Authenticator securityLevel](self, "securityLevel");
          if (v64 == 2)
          {
            memset(&buf, 0, sizeof(buf));
            -[_MFDigestMD5Authenticator setCryptInfo:](self, "setCryptInfo:", NSZoneCalloc((NSZone *)-[_MFDigestMD5Authenticator zone](self, "zone"), 1uLL, 0x28uLL));
            CC_MD5_Init(&buf);
            CC_MD5_Update(&buf, &v82, 0x10u);
            CC_MD5_Update(&buf, "Digest session key to server-to-client signing key magic constant", 0x41u);
            if ((*((_BYTE *)&self->super._authenticationState + 6) & 3) == 2)
              expectedResponse = self->_expectedResponse;
            else
              expectedResponse = 0;
            CC_MD5_Final((unsigned __int8 *)&expectedResponse[3], &buf);
            CC_MD5_Init(&buf);
            CC_MD5_Update(&buf, &v82, 0x10u);
            CC_MD5_Update(&buf, "Digest session key to client-to-server signing key magic constant", 0x41u);
            if ((*((_BYTE *)&self->super._authenticationState + 6) & 3) == 2)
              v67 = self->_expectedResponse;
            else
              v67 = 0;
            CC_MD5_Final((unsigned __int8 *)&v67[1], &buf);
          }
          else if (v64 == 3)
          {
            v65 = MFLogGeneral();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf.A) = 0;
              _os_log_impl(&dword_1C8839000, v65, OS_LOG_TYPE_INFO, "*** SASLPrivacySecurityLevel is not supported.", (uint8_t *)&buf, 2u);
            }
          }
          ResponseData = _createResponseData((uint64_t)self, (uint64_t)&v75, (uint64_t)&v78, 0);
          -[_MFDigestMD5Authenticator setExpectedResponse:](self, "setExpectedResponse:", ResponseData);

          v69 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "init");
          v70 = v69;
          if (*((_QWORD *)&v79 + 1))
            _appendQuotedString(v69, (uint64_t)"username", *((void **)&v79 + 1));
          if ((_QWORD)v75)
            _appendQuotedString(v70, (uint64_t)"realm", (void *)v75);
          if (*((_QWORD *)&v75 + 1))
            _appendQuotedString(v70, (uint64_t)"nonce", *((void **)&v75 + 1));
          _appendQuotedString(v70, (uint64_t)"cnonce", (void *)v78);
          _appendValue(v70, (uint64_t)"nc", *((uint64_t *)&v78 + 1));
          _appendValue(v70, (uint64_t)"qop", v79);
          _appendQuotedString(v70, (uint64_t)"digest-uri", *((void **)&v80 + 1));
          _appendValue(v70, (uint64_t)"response", *((uint64_t *)&v81 + 1));
          if (*((_WORD *)&self->super._authenticationState + 2))
          {
            EFStringWithInt();
            v71 = (void *)MFCreateDataWithString();
            _appendValue(v70, (uint64_t)"maxbuf", (uint64_t)v71);

          }
          if ((v77 & 0x10) != 0)
            _appendValue(v70, (uint64_t)"charset", objc_msgSend(CFSTR("utf-8"), "dataUsingEncoding:", 1));
          v56 = v70;
          goto LABEL_154;
        }
      }
    }
    else
    {
      v58 = MFLogGeneral();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.A) = 0;
        _os_log_impl(&dword_1C8839000, v58, OS_LOG_TYPE_INFO, "*** Missing algorithm=md5-sess in server response", (uint8_t *)&buf, 2u);
      }
    }
    -[_MFDigestMD5Authenticator setAuthenticationState:](self, "setAuthenticationState:", 3);
    v56 = 0;
LABEL_154:
    if ((_QWORD)v78)

    if ((_QWORD)v79)
    if (*((_QWORD *)&v78 + 1))

    if (*((_QWORD *)&v79 + 1))
    if ((_QWORD)v80)

    if (*((_QWORD *)&v80 + 1))
    if ((_QWORD)v81)

    if (*((_QWORD *)&v81 + 1))
    goto LABEL_142;
  }
  return 0;
}

- (void)setSecurityLevel:(int)a3
{
  *((_BYTE *)&self->super._authenticationState + 6) = *((_BYTE *)&self->super._authenticationState + 6) & 0xFC | a3 & 3;
}

- (int)securityLevel
{
  return *((_BYTE *)&self->super._authenticationState + 6) & 3;
}

- (void)setMaxBuffer:(unsigned int)a3
{
  *((_WORD *)&self->super._authenticationState + 2) = a3;
}

- (void)setCryptInfo:(void *)a3
{
  if (self->_expectedResponse)
    NSZoneFree((NSZone *)-[_MFDigestMD5Authenticator zone](self, "zone"), self->_expectedResponse);
  self->_expectedResponse = (NSData *)a3;
}

- (void)setExpectedResponse:(id)a3
{
  id v5;

  v5 = a3;

  *((_QWORD *)self + 5) = a3;
}

@end
