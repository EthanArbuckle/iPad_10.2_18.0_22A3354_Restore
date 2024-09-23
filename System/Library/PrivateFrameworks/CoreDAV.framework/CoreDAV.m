uint64_t sub_20960884C()
{
  void *v0;
  uint64_t v1;

  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_20960BA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_20960C4E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_209613754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209613AA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209613D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2096141A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20961468C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209615068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209616774(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209617A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209619FB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20961B394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CDVPLog(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CDVPLogV(a1, a2, a3, (uint64_t)&a9);
}

void CDVPLogV(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a1;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logDiagnosticForProvider:withLevel:format:args:", v8, a2, v7, a4);

}

void CDVLog(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CDVPLogV(0, a1, a2, (uint64_t)&a9);
}

CFTypeRef _CoreDAVSecCopyIdentityFromPersist(CFTypeRef a1)
{
  void *v1;
  const __CFDictionary *v2;
  OSStatus v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v9;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = (void *)*MEMORY[0x24BDE9558];
    keys[0] = *(void **)MEMORY[0x24BDE94D8];
    keys[1] = v1;
    values[0] = *(void **)MEMORY[0x24BDBD270];
    values[1] = (void *)a1;
    v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, 0, 0);
    result = 0;
    v3 = SecItemCopyMatching(v2, &result);
    if (v2)
      CFRelease(v2);
    if (v3)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logHandleForAccountInfoProvider:", 0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v9 = v3;
          _os_log_impl(&dword_209602000, v6, OS_LOG_TYPE_ERROR, "Could not find identity for persistent ref. %d", buf, 8u);
        }
      }

    }
    return result;
  }
  return a1;
}

uint64_t _CoreDAVSecDeleteIdentityByPersistentRef()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  uint8_t v4[16];

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "logHandleForAccountInfoProvider:", 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_209602000, v2, OS_LOG_TYPE_ERROR, "Intentionally not deleting identity by persistent ref", v4, 2u);
  }

  return 0;
}

__CFArray *_CoreDAVSecIdentityCopySSLClientAuthenticationChain(void *a1)
{
  SecPolicyRef SSL;
  SecPolicyRef v3;
  __CFArray *Mutable;
  void *v5;
  uint64_t CertificateCount;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SecCertificateRef CertificateAtIndex;
  int v12;
  SecTrustRef trust;
  SecCertificateRef certificateRef;

  SSL = SecPolicyCreateSSL(0, 0);
  if (!SSL)
    return 0;
  v3 = SSL;
  certificateRef = 0;
  Mutable = 0;
  if (!SecIdentityCopyCertificate((SecIdentityRef)a1, &certificateRef))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", certificateRef);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(certificateRef);
    trust = 0;
    Mutable = 0;
    if (!SecTrustCreateWithCertificates(v5, v3, &trust))
    {
      v12 = 0;
      if (MEMORY[0x20BD11120](trust, &v12))
      {
        Mutable = 0;
      }
      else
      {
        CertificateCount = SecTrustGetCertificateCount(trust);
        Mutable = CFArrayCreateMutable(0, CertificateCount, MEMORY[0x24BDBD690]);
        CFArrayAppendValue(Mutable, a1);
        v7 = CertificateCount - 2;
        if (CertificateCount >= 2)
        {
          v8 = 0;
          v9 = CertificateCount - 1;
          do
          {
            if (v7 != v8 || v12 != 4)
            {
              CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, v8 + 1);
              CFArrayAppendValue(Mutable, CertificateAtIndex);
            }
            ++v8;
          }
          while (v9 != v8);
        }
      }
      CFRelease(trust);
    }

  }
  CFRelease(v3);
  return Mutable;
}

uint64_t CalDAVServerSimulatorLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CalDAVServerSimulatorLibraryCore_frameworkLibrary;
  v6 = CalDAVServerSimulatorLibraryCore_frameworkLibrary;
  if (!CalDAVServerSimulatorLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24C1D9C98;
    v8 = *(_OWORD *)&off_24C1D9CA8;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CalDAVServerSimulatorLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20961EB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CalDAVServerSimulatorLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = CalDAVServerSimulatorLibraryCore();
  if (!result)
    CalDAVServerSimulatorLibrary_cold_1(&v1);
  return result;
}

void sub_209620060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

Class __getCalDAVServerSimulatorClass_block_invoke(uint64_t a1)
{
  Class result;

  CalDAVServerSimulatorLibrary();
  result = objc_getClass("CalDAVServerSimulator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCalDAVServerSimulatorClass_block_invoke_cold_1();
  getCalDAVServerSimulatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_20962B0BC(void *a1)
{
  return a1;
}

uint64_t CDVHTTPStatusCodeFromStatusLine(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(" "));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v2, "count") < 3)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v2, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 0;
      if (objc_msgSend(v3, "hasPrefix:", CFSTR("HTTP/")))
      {
        objc_msgSend(v2, "objectAtIndex:", 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "length") == 3)
        {
          v6 = objc_msgSend(v5, "integerValue");
          if ((unint64_t)(v6 - 600) >= 0xFFFFFFFFFFFFFE0CLL)
            v4 = v6;
          else
            v4 = 0;
        }
        else
        {
          v4 = 0;
        }

      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL CDVHTTPStatusCodeRepresentsRedirection(uint64_t a1)
{
  return (unint64_t)(a1 - 300) < 0x64;
}

BOOL CDVHTTPStatusCodeRepresentsClientError(uint64_t a1)
{
  return (unint64_t)(a1 - 400) < 0x64;
}

BOOL CDVHTTPStatusCodeRepresentsServerError(uint64_t a1)
{
  return (unint64_t)(a1 - 500) < 0x64;
}

const __CFString *CDVHTTPStatusCodeAsStatusString(uint64_t a1)
{
  const __CFString *result;

  if (a1 <= 299)
  {
    switch(a1)
    {
      case 200:
        result = CFSTR("OK");
        break;
      case 201:
        result = CFSTR("Created");
        break;
      case 202:
        result = CFSTR("Accepted");
        break;
      case 203:
        result = CFSTR("Non Authoritative Information");
        break;
      case 204:
        result = CFSTR("No Content");
        break;
      case 205:
        result = CFSTR("Reset Content");
        break;
      case 206:
        result = CFSTR("Partial Content");
        break;
      case 207:
        result = CFSTR("Multi-Status");
        break;
      default:
        if (a1 == 100)
        {
          result = CFSTR("Continue");
        }
        else if (a1 == 101)
        {
          result = CFSTR("Switching Protocols");
        }
        else
        {
LABEL_21:
          result = 0;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 400:
        result = CFSTR("Bad Request");
        break;
      case 401:
        result = CFSTR("Unauthorized");
        break;
      case 402:
        result = CFSTR("Payment Required");
        break;
      case 403:
        result = CFSTR("Forbidden");
        break;
      case 404:
        result = CFSTR("Not Found");
        break;
      case 405:
        result = CFSTR("Method Not Allowed");
        break;
      case 406:
        result = CFSTR("Not Acceptable");
        break;
      case 407:
        result = CFSTR("Proxy Authentication Required");
        break;
      case 408:
        result = CFSTR("Request Timeout");
        break;
      case 409:
        result = CFSTR("Conflict");
        break;
      case 410:
        result = CFSTR("Gone");
        break;
      case 411:
        result = CFSTR("Length Required");
        break;
      case 412:
        result = CFSTR("Precondition Failed");
        break;
      case 413:
        result = CFSTR("Request Entity Too Large");
        break;
      case 414:
        result = CFSTR("Request URI Too Long");
        break;
      case 415:
        result = CFSTR("Unsupported Media Type");
        break;
      case 416:
        result = CFSTR("Requested Range Not Satisfiable");
        break;
      case 417:
        result = CFSTR("Expectation Failed");
        break;
      case 418:
        result = CFSTR("I'm a teapot");
        break;
      case 419:
      case 420:
      case 421:
        goto LABEL_21;
      case 422:
        result = CFSTR("Unprocessable Entity");
        break;
      case 423:
        result = CFSTR("Locked");
        break;
      case 424:
        result = CFSTR("Failed Dependency");
        break;
      default:
        switch(a1)
        {
          case 300:
            result = CFSTR("Multiple Choices");
            break;
          case 301:
            result = CFSTR("Moved Permanently");
            break;
          case 302:
            result = CFSTR("Found");
            break;
          case 303:
            result = CFSTR("See Other");
            break;
          case 304:
            result = CFSTR("Not Modified");
            break;
          case 305:
            result = CFSTR("Use Proxy");
            break;
          case 306:
            goto LABEL_21;
          case 307:
            result = CFSTR("Temporary Redirect");
            break;
          default:
            switch(a1)
            {
              case 500:
                result = CFSTR("Internal Server Error");
                break;
              case 501:
                result = CFSTR("Not Implemented");
                break;
              case 502:
                result = CFSTR("Bad Gateway");
                break;
              case 503:
                result = CFSTR("Service Unavailable");
                break;
              case 504:
                result = CFSTR("Gateway Timeout");
                break;
              case 505:
                result = CFSTR("HTTP Version Not Supported");
                break;
              case 507:
                result = CFSTR("Insufficient Storage");
                break;
              default:
                goto LABEL_21;
            }
            break;
        }
        break;
    }
  }
  return result;
}

void CDVInheritedInitializerUsageDisallowed()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Initializing this class instance with an inherited initializer not allowed."), 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v0);
}

void CDVAbstractMethod()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("This is an abstract method that should be implemented by subclasses."), 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v0);
}

void CDVUnimplemented()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("This section is unimplemented."), 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v0);
}

id CDVExtractValuesFromRedirectString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "rangeOfString:", CFSTR(" "));
  if (v4)
  {
    v5 = v3;
    objc_msgSend(v1, "substringToIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v1, "length");
    if (v5 + 1 < v7)
      v8 = v5 + 1;
    else
      v8 = v7;
    objc_msgSend(v1, "substringFromIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("kCDVRedirectReasonKey"));

  }
  else
  {
    objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("kCDVRedirectURLKey"));

  return v2;
}

id _systemVersionDict()
{
  if (_systemVersionDict_once != -1)
    dispatch_once(&_systemVersionDict_once, &__block_literal_global_240);
  return (id)_systemVersionDict_versionDictionary;
}

void ___systemVersionDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = _CFCopyServerVersionDictionary();
  v1 = (void *)_systemVersionDict_versionDictionary;
  _systemVersionDict_versionDictionary = v0;

  if (!_systemVersionDict_versionDictionary)
  {
    v2 = _CFCopySystemVersionDictionary();
    v3 = (void *)_systemVersionDict_versionDictionary;
    _systemVersionDict_versionDictionary = v2;

  }
}

id CDVDefaultUserAgent()
{
  void *v0;
  void *v1;
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v0 = (void *)CDVDefaultUserAgent__sUserAgentString;
  if (!CDVDefaultUserAgent__sUserAgentString)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "infoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("CFBundleVersion"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v3, "length"))
    {

      v3 = CFSTR("1.0");
    }
    _systemVersionDict();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("CoreDAV/%@ (%@)"), v3, v5);
    v7 = (void *)CDVDefaultUserAgent__sUserAgentString;
    CDVDefaultUserAgent__sUserAgentString = v6;

    v0 = (void *)CDVDefaultUserAgent__sUserAgentString;
  }
  return v0;
}

id CDVAppleClientInfoString()
{
  if (CDVAppleClientInfoString_gotVersionString != -1)
    dispatch_once(&CDVAppleClientInfoString_gotVersionString, &__block_literal_global_249);
  return (id)CDVAppleClientInfoString__sVersionString;
}

id CDVRunLoopModesToPerformDelayedSelectorsIn()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CDVRunLoopModesToPerformDelayedSelectorsInFromRunLoop(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CDVRunLoopModesToPerformDelayedSelectorsInFromRunLoop(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "currentMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  v3 = *MEMORY[0x24BDBCA90];
  if (v1 && !objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDBCA90]))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, v2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

void initializeLibXMLParser()
{
  if (initializeLibXMLParser_didInitializeXMLParser != -1)
    dispatch_once(&initializeLibXMLParser_didInitializeXMLParser, &__block_literal_global_268);
}

id CDVCleanedStringsFromResponseHeaders(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v16 = a2;
  objc_msgSend(v3, "CDVObjectForKeyCaseInsensitive:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "length"))
        {
          if (v9)
          {
            objc_msgSend(v9, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v14);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id CDVRelativeOrderHeaderString()
{
  if (CDVRelativeOrderHeaderString_onceToken != -1)
    dispatch_once(&CDVRelativeOrderHeaderString_onceToken, &__block_literal_global_274);
  return (id)CDVRelativeOrderHeaderString__sRelativeOrderString;
}

void ___logFormater_block_invoke()
{
  const __CFAllocator *v0;
  const __CFLocale *v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
  _logFormater___logFormatter = (uint64_t)CFDateFormatterCreate(v0, v1, kCFDateFormatterShortStyle, kCFDateFormatterFullStyle);

  if (_logFormater___logFormatter)
  {
    CFDateFormatterSetFormat((CFDateFormatterRef)_logFormater___logFormatter, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logHandleForAccountInfoProvider:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_209602000, v4, OS_LOG_TYPE_ERROR, "Could not create a date formatter", v5, 2u);
      }
    }

  }
}

void sub_209630354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_209631EA4()
{
  void *v0;
  uint64_t v1;

  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

id sub_2096325C0(void *a1)
{
  return a1;
}

uint64_t sub_209632AA8()
{
  void *v0;
  uint64_t v1;

  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t sub_209636840()
{
  void *v0;
  uint64_t v1;

  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t sub_209637F74()
{
  void *v0;
  uint64_t v1;

  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t sub_20964C24C()
{
  void *v0;
  uint64_t v1;

  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_20964E258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20964E658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20964E9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20964F034(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20964F368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_20964FF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209650800(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_209650C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209650EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CalDAVServerSimulatorLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CalDAVServerSimulatorLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CoreDAVTask.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCalDAVServerSimulatorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCalDAVServerSimulatorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CoreDAVTask.m"), 33, CFSTR("Unable to find class %s"), "CalDAVServerSimulator");

  __break(1u);
  AnalyticsIsEventUsed();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x24BE1A1A8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
  MEMORY[0x24BDBBBE8](theSet, theString);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x24BDBBC00](alloc);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x24BDBBC30](theSet, theChar);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBBD88](formatter, formatString);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

uint64_t CFURLRequestCopyHTTPCookieStorage()
{
  return MEMORY[0x24BDB7390]();
}

uint64_t CFURLRequestCreateMutableCopy()
{
  return MEMORY[0x24BDB7398]();
}

uint64_t CFURLRequestGetSSLProperties()
{
  return MEMORY[0x24BDB73A0]();
}

uint64_t CFURLRequestSetSSLProperties()
{
  return MEMORY[0x24BDB73B8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C78](server, hostname);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x24BDE8DF8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x24BDE8E00](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x24BDBCFA0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _CFHTTPCookieStorageCopyRequestHeaderFieldsForURL()
{
  return MEMORY[0x24BDB74C0]();
}

uint64_t _CFURLCredentialCreateOAuth2()
{
  return MEMORY[0x24BDB7590]();
}

uint64_t _CFURLCredentialCreateXMobileMeAuthToken()
{
  return MEMORY[0x24BDB7598]();
}

uint64_t _CFURLRequestSetStorageSession()
{
  return MEMORY[0x24BDB75B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E0](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint64_t nw_array_apply()
{
  return MEMORY[0x24BDE0A28]();
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x24BDE0A48]();
}

uint64_t nw_endpoint_create_srv()
{
  return MEMORY[0x24BDE0EA8]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F20](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F40](endpoint);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x24BDE1558]();
}

uint64_t nw_resolver_cancel()
{
  return MEMORY[0x24BDE2398]();
}

uint64_t nw_resolver_create_srv_weighted_variant()
{
  return MEMORY[0x24BDE2460]();
}

uint64_t nw_resolver_create_with_endpoint()
{
  return MEMORY[0x24BDE2468]();
}

uint64_t nw_resolver_get_error()
{
  return MEMORY[0x24BDE2478]();
}

uint64_t nw_resolver_set_cancel_handler()
{
  return MEMORY[0x24BDE2480]();
}

uint64_t nw_resolver_set_update_handler()
{
  return MEMORY[0x24BDE2488]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void xmlDocDumpFormatMemory(xmlDocPtr cur, xmlChar **mem, int *size, int format)
{
  MEMORY[0x24BEDE738](cur, mem, size, *(_QWORD *)&format);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
  MEMORY[0x24BEDE7B0](writer);
}

void xmlInitParser(void)
{
  MEMORY[0x24BEDE8C0]();
}

xmlTextWriterPtr xmlNewTextWriterDoc(xmlDocPtr *doc, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x24BEDEA00](doc, *(_QWORD *)&compression);
}

int xmlTextWriterEndAttribute(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED20](writer);
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED38](writer);
}

int xmlTextWriterFullEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED58](writer);
}

int xmlTextWriterStartAttributeNS(xmlTextWriterPtr writer, const xmlChar *prefix, const xmlChar *name, const xmlChar *namespaceURI)
{
  return MEMORY[0x24BEDED70](writer, prefix, name, namespaceURI);
}

int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x24BEDED88](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x24BEDED90](writer, name);
}

int xmlTextWriterStartElementNS(xmlTextWriterPtr writer, const xmlChar *prefix, const xmlChar *name, const xmlChar *namespaceURI)
{
  return MEMORY[0x24BEDED98](writer, prefix, name, namespaceURI);
}

int xmlTextWriterWriteCDATA(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x24BEDEDB8](writer, content);
}

int xmlTextWriterWriteString(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x24BEDEDD8](writer, content);
}

