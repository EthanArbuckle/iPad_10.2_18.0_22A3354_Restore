@implementation CMIOExtensionProvider

+ (id)proprietaryDefaultsDomainForAuditToken:(id *)a3
{
  __int128 v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  NSObject *v18;
  NSObject *v19;
  void *STExecutableIdentityResolverClass;
  __int128 v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  __CFString *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  const __CFString *v41;
  void *v42;
  uint64_t v43;
  uint64_t UpTimeNanoseconds;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  const char *v54;
  NSObject *v55;
  NSObject *v56;
  const char *v57;
  NSObject *v58;
  const char *v59;
  NSObject *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  const char *v66;
  NSObject *v68;
  const char *v69;
  const __CFString *v70;
  unsigned int v71;
  uint64_t v72;
  void *v73;
  id obj;
  int v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  _BYTE atoken[108];
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  unint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v76 = 0;
  if (!SystemStatusLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)atoken = xmmword_250457A80;
    *(_QWORD *)&atoken[16] = 0;
    SystemStatusLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SystemStatusLibraryCore_frameworkLibrary)
    return CFSTR("unknown");
  if (proprietaryDefaultsDomainForAuditToken__onceToken != -1)
    dispatch_once(&proprietaryDefaultsDomainForAuditToken__onceToken, &__block_literal_global_308);
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken[16] = v4;
  v71 = audit_token_to_pid((audit_token_t *)atoken);
  v72 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v71);
  v5 = (void *)objc_msgSend((id)sProprietaryDefaultsDomainsByPID, "objectForKeyedSubscript:", v72);
  if (!v5)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v71), &v76);
    if (v10)
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "bundle"), "extensionPointIdentifier"), "isEqualToString:", CFSTR("com.apple.securecapture")) & 1) != 0)
      {
        v11 = CMIOLog();
        v12 = v11;
        if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)atoken = 136315907;
          *(_QWORD *)&atoken[4] = v13;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = 2173;
          *(_WORD *)&atoken[18] = 2080;
          *(_QWORD *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
          *(_WORD *)&atoken[28] = 1025;
          *(_DWORD *)&atoken[30] = v71;
          _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] client is a secure capture extension, looking up containing app", atoken, 0x22u);
        }
        v14 = *(_OWORD *)&a3->var0[4];
        *(_OWORD *)atoken = *(_OWORD *)a3->var0;
        *(_OWORD *)&atoken[16] = v14;
        v15 = (void *)objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForAuditToken:error:", atoken, &v76);
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = objc_msgSend((id)objc_msgSend(v15, "containingBundleRecord"), "bundleIdentifier");
            *(_QWORD *)atoken = 0;
            *(_QWORD *)&atoken[8] = atoken;
            *(_QWORD *)&atoken[16] = 0x3052000000;
            *(_QWORD *)&atoken[24] = __Block_byref_object_copy_;
            *(_QWORD *)&atoken[32] = __Block_byref_object_dispose_;
            v17 = (objc_class *)getSTExecutableIdentityClass_softClass;
            *(_QWORD *)&atoken[40] = getSTExecutableIdentityClass_softClass;
            if (!getSTExecutableIdentityClass_softClass)
            {
              *(_QWORD *)&v77 = MEMORY[0x24BDAC760];
              *((_QWORD *)&v77 + 1) = 3221225472;
              *(_QWORD *)&v78 = __getSTExecutableIdentityClass_block_invoke;
              *((_QWORD *)&v78 + 1) = &unk_250457AA0;
              *(_QWORD *)&v79 = atoken;
              __getSTExecutableIdentityClass_block_invoke((uint64_t)&v77);
              v17 = *(objc_class **)(*(_QWORD *)&atoken[8] + 40);
            }
            _Block_object_dispose(atoken, 8);
            v18 = (id)objc_msgSend([v17 alloc], "initWithApplicationBundleIdentifier:", v16);
            goto LABEL_27;
          }
          v27 = CMIOLog();
          v22 = v27;
          if (!v27)
            goto LABEL_38;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            +[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:].cold.4();
        }
        else
        {
          v26 = CMIOLog();
          if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:].cold.3();
        }
        goto LABEL_37;
      }
    }
    else
    {
      v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:].cold.2();
    }
    if (sResponsibleIdentityForAuditTokenIsSupported)
    {
      STExecutableIdentityResolverClass = (void *)getSTExecutableIdentityResolverClass();
      v21 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)atoken = *(_OWORD *)a3->var0;
      *(_OWORD *)&atoken[16] = v21;
      v18 = objc_msgSend(STExecutableIdentityResolverClass, "responsibleIdentityForAuditToken:", atoken);
LABEL_27:
      v22 = v18;
LABEL_38:
      v28 = CMIOLog();
      v29 = v28;
      if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v30 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)atoken = 136316163;
        *(_QWORD *)&atoken[4] = v30;
        *(_WORD *)&atoken[12] = 1024;
        *(_DWORD *)&atoken[14] = 2206;
        *(_WORD *)&atoken[18] = 2080;
        *(_QWORD *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
        *(_WORD *)&atoken[28] = 1025;
        *(_DWORD *)&atoken[30] = v71;
        *(_WORD *)&atoken[34] = 2113;
        *(_QWORD *)&atoken[36] = v22;
        _os_log_impl(&dword_2330C2000, v29, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] resolvedIdentity: %{private}@", atoken, 0x2Cu);
      }
      v31 = (__CFString *)-[NSObject bundleIdentifier](v22, "bundleIdentifier");
      if (!v31)
      {
        v32 = (void *)-[NSObject executablePath](v22, "executablePath");
        if (!v32)
          goto LABEL_47;
        v33 = CMIOLog();
        v34 = v33;
        if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v35 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)atoken = 136316163;
          *(_QWORD *)&atoken[4] = v35;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = 2211;
          *(_WORD *)&atoken[18] = 2080;
          *(_QWORD *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
          *(_WORD *)&atoken[28] = 1025;
          *(_DWORD *)&atoken[30] = v71;
          *(_WORD *)&atoken[34] = 2113;
          *(_QWORD *)&atoken[36] = v32;
          _os_log_impl(&dword_2330C2000, v34, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] falling back to using last part of the executable's path %{private}@", atoken, 0x2Cu);
        }
        v31 = (__CFString *)(id)objc_msgSend((id)objc_msgSend(v32, "componentsSeparatedByString:", CFSTR("/")), "lastObject");
        if (!v31)
        {
LABEL_47:
          v36 = CMIOLog();
          v37 = v36;
          if (v36 && os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            +[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:].cold.1(v71, v37);
          v31 = CFSTR("unknown");
        }
      }
      if ((-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("avconferenced")) & 1) != 0
        || (-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("com.apple.avconferenced")) & 1) != 0
        || (-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("com.apple.InCallService")) & 1) != 0
        || (-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("com.apple.FaceTime.FaceTimeNotificationCenterService")) & 1) != 0|| -[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("com.apple.TelephonyUtilities")))
      {
        v38 = CMIOLog();
        v39 = v38;
        if (v38)
        {
          v70 = CFSTR("com.apple.FaceTime");
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            goto LABEL_62;
          v40 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)atoken = 136316419;
          *(_QWORD *)&atoken[4] = v40;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = 2228;
          *(_WORD *)&atoken[18] = 2080;
          *(_QWORD *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
          *(_WORD *)&atoken[28] = 1025;
          *(_DWORD *)&atoken[30] = v71;
          *(_WORD *)&atoken[34] = 2113;
          *(_QWORD *)&atoken[36] = v31;
          *(_WORD *)&atoken[44] = 2113;
          *(_QWORD *)&atoken[46] = CFSTR("com.apple.FaceTime");
          goto LABEL_59;
        }
        v41 = CFSTR("com.apple.FaceTime");
        goto LABEL_61;
      }
      if ((-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("com.cisco.webexmeetingsapp")) & 1) != 0
        || (-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("Cisco-Systems-Spark")) & 1) != 0
        || -[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("Cisco-Systems.Spark")))
      {
        v68 = CMIOLog();
        v39 = v68;
        if (!v68)
        {
          v41 = CFSTR("com.webex.meetingmanager");
LABEL_61:
          v70 = v41;
          goto LABEL_62;
        }
        v70 = CFSTR("com.webex.meetingmanager");
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          v69 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)atoken = 136316419;
          *(_QWORD *)&atoken[4] = v69;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = 2240;
          *(_WORD *)&atoken[18] = 2080;
          *(_QWORD *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
          *(_WORD *)&atoken[28] = 1025;
          *(_DWORD *)&atoken[30] = v71;
          *(_WORD *)&atoken[34] = 2113;
          *(_QWORD *)&atoken[36] = v31;
          *(_WORD *)&atoken[44] = 2113;
          *(_QWORD *)&atoken[46] = CFSTR("com.webex.meetingmanager");
LABEL_59:
          _os_log_impl(&dword_2330C2000, v39, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] remapping preference domain %{private}@ to %{private}@", atoken, 0x36u);
        }
      }
      else
      {
        v70 = v31;
      }
LABEL_62:
      v42 = (void *)sMostRecentProprietaryDefaultDomainLookupTimeByPID;
      v75 = sPostTerminationTimoutForClearingEntryFromProprietaryDefaultsDomainsByPID;
      v73 = (void *)sProprietaryDefaultsDomainsByPID;
      obj = (id)objc_msgSend((id)sProprietaryDefaultsDomainsByPID, "allKeys");
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, atoken, 16);
      if (!v43)
      {
LABEL_91:
        objc_msgSend((id)sProprietaryDefaultsDomainsByPID, "setObject:forKeyedSubscript:", v70, v72);
        objc_msgSend((id)sMostRecentProprietaryDefaultDomainLookupTimeByPID, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", FigGetUpTimeNanoseconds()), v72);
        v64 = CMIOLog();
        v65 = v64;
        if (!v64 || !os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          return (id)v70;
        v66 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)atoken = 136316163;
        *(_QWORD *)&atoken[4] = v66;
        *(_WORD *)&atoken[12] = 1024;
        *(_DWORD *)&atoken[14] = 2249;
        *(_WORD *)&atoken[18] = 2080;
        *(_QWORD *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
        *(_WORD *)&atoken[28] = 1025;
        *(_DWORD *)&atoken[30] = v71;
        *(_WORD *)&atoken[34] = 2113;
        v9 = v70;
        *(_QWORD *)&atoken[36] = v70;
        _os_log_impl(&dword_2330C2000, v65, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] preference domain %{private}@", atoken, 0x2Cu);
        return (id)v9;
      }
      UpTimeNanoseconds = 0;
      v45 = *(_QWORD *)v78;
LABEL_64:
      v46 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v45)
          objc_enumerationMutation(obj);
        v47 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v46);
        v48 = objc_msgSend(v47, "intValue");
        if (v48 < 2)
        {
LABEL_70:
          if (!UpTimeNanoseconds)
            UpTimeNanoseconds = FigGetUpTimeNanoseconds();
          v50 = (UpTimeNanoseconds
               - objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", v47), "longLongValue"))
              / 0x3B9ACA00uLL;
          v51 = CMIOLog();
          v52 = v51;
          if (v75 >= (int)v50)
          {
            if (v51 && os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v54 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              *(_DWORD *)buf = 136316163;
              v84 = v54;
              v85 = 1024;
              v86 = 2272;
              v87 = 2080;
              v88 = "cmioep_pruneStalePIDsFromDictionary";
              v89 = 1025;
              v90 = v48;
              v91 = 2048;
              v92 = v50;
              _os_log_impl(&dword_2330C2000, v52, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] keeping stale pid because it was accessed %lld seconds ago", buf, 0x2Cu);
            }
          }
          else
          {
            if (v51 && os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v53 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              *(_DWORD *)buf = 136316163;
              v84 = v53;
              v85 = 1024;
              v86 = 2267;
              v87 = 2080;
              v88 = "cmioep_pruneStalePIDsFromDictionary";
              v89 = 1025;
              v90 = v48;
              v91 = 2048;
              v92 = v50;
              _os_log_impl(&dword_2330C2000, v52, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] dropping stale pid; last accessed %lld seconds ago",
                buf,
                0x2Cu);
            }
            objc_msgSend(v73, "setObject:forKeyedSubscript:", 0, v47);
            objc_msgSend(v42, "setObject:forKeyedSubscript:", 0, v47);
          }
          goto LABEL_86;
        }
        v81 = 0;
        v49 = objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v48), &v81);
        if (!v81)
          break;
        if (objc_msgSend(v81, "code") == 3)
          goto LABEL_70;
        v60 = CMIOLog();
        v61 = v60;
        if (v60 && os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v62 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          *(_DWORD *)buf = 136316162;
          v84 = v62;
          v85 = 1024;
          v86 = 2293;
          v87 = 2080;
          v88 = "cmioep_pidIsValid";
          v89 = 1024;
          v90 = v48;
          v91 = 2112;
          v92 = (unint64_t)v81;
          v58 = v61;
          v59 = "%s:%d:%s [%d] creating process handle returned error: %@";
LABEL_89:
          _os_log_error_impl(&dword_2330C2000, v58, OS_LOG_TYPE_ERROR, v59, buf, 0x2Cu);
        }
LABEL_86:
        if (v43 == ++v46)
        {
          v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, atoken, 16);
          v43 = v63;
          if (!v63)
            goto LABEL_91;
          goto LABEL_64;
        }
      }
      if (v49)
        goto LABEL_86;
      v55 = CMIOLog();
      v56 = v55;
      if (!v55 || !os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        goto LABEL_86;
      v57 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136316162;
      v84 = v57;
      v85 = 1024;
      v86 = 2297;
      v87 = 2080;
      v88 = "cmioep_pidIsValid";
      v89 = 1024;
      v90 = v48;
      v91 = 2112;
      v92 = (unint64_t)v81;
      v58 = v56;
      v59 = "%s:%d:%s [%d] could not create process handle: %@";
      goto LABEL_89;
    }
    v23 = CMIOLog();
    v24 = v23;
    if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)atoken = 136315650;
      *(_QWORD *)&atoken[4] = v25;
      *(_WORD *)&atoken[12] = 1024;
      *(_DWORD *)&atoken[14] = 2203;
      *(_WORD *)&atoken[18] = 2080;
      *(_QWORD *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
      _os_log_impl(&dword_2330C2000, v24, OS_LOG_TYPE_DEFAULT, "%s:%d:%s proper version of System Status not present to support this call.", atoken, 0x1Cu);
    }
LABEL_37:
    v22 = 0;
    goto LABEL_38;
  }
  v6 = CMIOLog();
  v7 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    *(_DWORD *)atoken = 136316163;
    *(_QWORD *)&atoken[4] = v8;
    *(_WORD *)&atoken[12] = 1024;
    *(_DWORD *)&atoken[14] = 2144;
    *(_WORD *)&atoken[18] = 2080;
    *(_QWORD *)&atoken[20] = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
    *(_WORD *)&atoken[28] = 1025;
    *(_DWORD *)&atoken[30] = v71;
    *(_WORD *)&atoken[34] = 2113;
    *(_QWORD *)&atoken[36] = v5;
    _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] returning cached preference domain %{private}@", atoken, 0x2Cu);
  }
  objc_msgSend((id)sMostRecentProprietaryDefaultDomainLookupTimeByPID, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", FigGetUpTimeNanoseconds()), v72);
  return v5;
}

+ (CMIOExtensionProvider)providerWithSource:(id)source clientQueue:(dispatch_queue_t)clientQueue
{
  return (CMIOExtensionProvider *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSource:clientQueue:", source, clientQueue);
}

- (CMIOExtensionProvider)initWithSource:(id)source clientQueue:(dispatch_queue_t)clientQueue
{
  CMIOExtensionProvider *v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *TargetingWorkloopWithPriority;
  NSObject *v11;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  dispatch_queue_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)CMIOExtensionProvider;
  v6 = -[CMIOExtensionProvider init](&v18, sel_init);
  if (v6)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)buf = 136316418;
        v20 = v9;
        v21 = 1024;
        v22 = 1679;
        v23 = 2080;
        v24 = "-[CMIOExtensionProvider initWithSource:clientQueue:]";
        v25 = 2048;
        v26 = (uint64_t)v6;
        v27 = 2048;
        v28 = source;
        v29 = 2048;
        v30 = clientQueue;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s initializing provider %p with source %p : queue %p", buf, 0x3Au);
      }
    }
    objc_storeWeak((id *)&v6->_source, source);
    if (clientQueue)
    {
      TargetingWorkloopWithPriority = clientQueue;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      TargetingWorkloopWithPriority = FigDispatchQueueCreateTargetingWorkloopWithPriority();
    }
    v6->_clientQueue = (OS_dispatch_queue *)TargetingWorkloopWithPriority;
    v6->_contextsMapLock._os_unfair_lock_opaque = 0;
    v6->_contextsRegistration = (NSMutableArray *)objc_opt_new();
    v6->_contextsMap = (NSMutableDictionary *)objc_opt_new();
    v6->_pendingCountMap = (NSMutableDictionary *)objc_opt_new();
    v6->_connectedClientsLock._os_unfair_lock_opaque = 0;
    v6->_connectedClients = (NSArray *)objc_opt_new();
    v6->_devicesMapLock._os_unfair_lock_opaque = 0;
    v6->_devicesMap = (NSMutableDictionary *)objc_opt_new();
    v6->_streamsMapLock._os_unfair_lock_opaque = 0;
    v6->_streamsMap = (NSMutableDictionary *)objc_opt_new();
    v6->_devicesLock._os_unfair_lock_opaque = 0;
    v6->_devices = (NSMutableArray *)objc_opt_new();
    v6->_changedDeviceIDsLock._os_unfair_lock_opaque = 0;
    v6->_changedDeviceIDs = 0;
    v6->_changedStreamIDsLock._os_unfair_lock_opaque = 0;
    v6->_changedStreamIDs = 0;
    v6->_changedPropertiesLock._os_unfair_lock_opaque = 0;
    v6->_changedProperties = (NSMutableDictionary *)objc_opt_new();
    if (-[CMIOExtensionProviderServer internalDaemon](+[CMIOExtensionProviderServer sharedServer](CMIOExtensionProviderServer, "sharedServer"), "internalDaemon"))
    {
      v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProvider initWithSource:clientQueue:].cold.1();
      }
    }
    v6->_nonStreamingProxyFrontedExtensionPIDs = (NSArray *)objc_opt_new();
    v6->_nonStreamingProxyFrontedExtensionPIDsHasChanged = 0;
    v6->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionProvider>"));
    if (gProvider)
    {

      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("There should be only one CMIOProvider per extension."));
      return 0;
    }
    else
    {
      gProvider = v6;
      v13 = CMIOLog();
      if (v13)
      {
        v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v16 = gProvider;
          v17 = objc_msgSend((id)gProvider, "retainCount");
          *(_DWORD *)buf = 136316162;
          v20 = v15;
          v21 = 1024;
          v22 = 1739;
          v23 = 2080;
          v24 = "-[CMIOExtensionProvider initWithSource:clientQueue:]";
          v25 = 2048;
          v26 = v16;
          v27 = 1024;
          LODWORD(v28) = v17;
          _os_log_impl(&dword_2330C2000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Retained and set gProvider to %p (retain count %d)", buf, 0x2Cu);
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v14 = 1024;
      v15 = 1752;
      v16 = 2080;
      v17 = "-[CMIOExtensionProvider dealloc]";
      v18 = 2048;
      v19 = gProvider;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s dealloc starting, shared provider reference %p", buf, 0x26u);
    }
  }
  gProvider = 0;

  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136315650;
      v13 = v7;
      v14 = 1024;
      v15 = 1773;
      v16 = 2080;
      v17 = "-[CMIOExtensionProvider dealloc]";
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s calling [super dealloc]", buf, 0x1Cu);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CMIOExtensionProvider;
  -[CMIOExtensionProvider dealloc](&v11, sel_dealloc);
  v8 = CMIOLog();
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136315650;
      v13 = v10;
      v14 = 1024;
      v15 = 1776;
      v16 = 2080;
      v17 = "-[CMIOExtensionProvider dealloc]";
      _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s dealloc done", buf, 0x1Cu);
    }
  }
}

- (id)description
{
  return self->_description;
}

+ (id)sharedProvider
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&gProviderLock);
  v2 = (id)gProvider;
  os_unfair_lock_unlock((os_unfair_lock_t)&gProviderLock);
  v3 = CMIOLogLevel(1);
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136316162;
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v8 = 1024;
      v9 = 1794;
      v10 = 2080;
      v11 = "+[CMIOExtensionProvider sharedProvider]";
      v12 = 2048;
      v13 = v2;
      v14 = 1024;
      v15 = objc_msgSend(v2, "retainCount");
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s returning autoreleased global provider %p (its retain count is %d)", (uint8_t *)&v6, 0x2Cu);
    }
  }
  return v2;
}

+ (id)internalProperties
{
  if (internalProperties_onceToken_290 != -1)
    dispatch_once(&internalProperties_onceToken_290, &__block_literal_global_291);
  return (id)internalProperties_gInternalProviderProperties;
}

uint64_t __43__CMIOExtensionProvider_internalProperties__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", 0x250459518, 0);
  internalProperties_gInternalProviderProperties = result;
  return result;
}

+ (id)internalWritableProperties
{
  return 0;
}

+ (void)startServiceWithProvider:(CMIOExtensionProvider *)provider
{
  void *v4;
  CMIOExtensionProvider *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  CMIOExtensionProvider *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  CMIOExtensionProvider *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x23492F950](a1, a2);
  v5 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = CMIOLog();
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316674;
      v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v17 = 1024;
      v18 = 1821;
      v19 = 2080;
      v20 = "+[CMIOExtensionProvider startServiceWithProvider:]";
      v21 = 2048;
      v22 = provider;
      v23 = 2112;
      v24 = objc_msgSend(v6, "bundleIdentifier");
      v25 = 2048;
      v26 = v5;
      v27 = 1024;
      v28 = -[CMIOExtensionProvider retainCount](v5, "retainCount");
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %p (%@), autoreleased global provider %p (its retain count is %d)", (uint8_t *)&v15, 0x40u);
    }
  }
  v9 = (_QWORD *)MEMORY[0x24BDBCAB8];
  if (v5 != provider)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid provider."));
  v10 = objc_msgSend(v6, "objectForInfoDictionaryKey:", CFSTR("CMIOExtension"));
  if (!v10 || (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !objc_msgSend(v11, "count"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v9, CFSTR("CMIOExtension information dictionary missing from the Info.plist."));
  if (startServiceWithProvider__onceToken != -1)
    dispatch_once(&startServiceWithProvider__onceToken, &__block_literal_global_297);
  objc_autoreleasePoolPop(v4);
  v12 = CMIOLog();
  if (v12)
  {
    v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 136315650;
      v16 = v14;
      v17 = 1024;
      v18 = 1851;
      v19 = 2080;
      v20 = "+[CMIOExtensionProvider startServiceWithProvider:]";
      _os_log_impl(&dword_2330C2000, v13, OS_LOG_TYPE_DEFAULT, "%s:%d:%s leaving", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

uint64_t __50__CMIOExtensionProvider_startServiceWithProvider___block_invoke()
{
  NSObject *global_queue;

  CMIOPreferences();
  global_queue = dispatch_get_global_queue(21, 0);
  gSignalHandlerSource = (uint64_t)dispatch_source_create(MEMORY[0x24BDACA08], 0xFuLL, 0, global_queue);
  dispatch_source_set_event_handler((dispatch_source_t)gSignalHandlerSource, &__block_literal_global_298);
  dispatch_activate((dispatch_object_t)gSignalHandlerSource);
  return -[CMIOExtensionProviderServer start](+[CMIOExtensionProviderServer sharedServer](CMIOExtensionProviderServer, "sharedServer"), "start");
}

void __50__CMIOExtensionProvider_startServiceWithProvider___block_invoke_2()
{
  int v0;
  NSObject *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = gIgnoreSIGTERM;
  v1 = CMIOLog();
  v2 = v1;
  if (v0 != 1)
  {
    if (v1 && os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315650;
      v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v5 = 1024;
      v6 = 1842;
      v7 = 2080;
      v8 = "+[CMIOExtensionProvider startServiceWithProvider:]_block_invoke";
      _os_log_impl(&dword_2330C2000, v2, OS_LOG_TYPE_DEFAULT, "%s:%d:%s SIGTERM signal received, exiting", (uint8_t *)&v3, 0x1Cu);
    }
    exit(0);
  }
  if (v1)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315650;
      v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v5 = 1024;
      v6 = 1839;
      v7 = 2080;
      v8 = "+[CMIOExtensionProvider startServiceWithProvider:]_block_invoke_2";
      _os_log_impl(&dword_2330C2000, v2, OS_LOG_TYPE_DEFAULT, "%s:%d:%s SIGTERM signal received, but told to ignore", (uint8_t *)&v3, 0x1Cu);
    }
  }
}

+ (void)stopServiceWithProvider:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  CMIOExtensionProviderServer *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  CMIOExtensionProviderServer *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x23492F950](a1, a2);
  v5 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
  v6 = CMIOLog();
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136316418;
      v30 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v31 = 1024;
      v32 = 1858;
      v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      v35 = 2048;
      v36 = a3;
      v37 = 2048;
      v38 = v5;
      v39 = 1024;
      v40 = objc_msgSend(v5, "retainCount");
      _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %p, autoreleased global provider %p (its retain count is %d)", (uint8_t *)&v29, 0x36u);
    }
  }
  if (v5 != a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid provider."));
  v8 = CMIOLog();
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v29 = 136315906;
      v30 = v10;
      v31 = 1024;
      v32 = 1863;
      v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      v35 = 2112;
      v36 = a3;
      _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s removing all contexts from %@", (uint8_t *)&v29, 0x26u);
    }
  }
  objc_msgSend(a3, "removeAllProviderContexts");
  v11 = CMIOLog();
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v14 = +[CMIOExtensionProviderServer sharedServer](CMIOExtensionProviderServer, "sharedServer");
      v29 = 136315906;
      v30 = v13;
      v31 = 1024;
      v32 = 1865;
      v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s stopping shared server %@", (uint8_t *)&v29, 0x26u);
    }
  }
  -[CMIOExtensionProviderServer stop](+[CMIOExtensionProviderServer sharedServer](CMIOExtensionProviderServer, "sharedServer"), "stop");
  v15 = CMIOLog();
  if (v15)
  {
    v16 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v18 = +[CMIOExtensionProviderServer sharedServer](CMIOExtensionProviderServer, "sharedServer");
      v29 = 136315906;
      v30 = v17;
      v31 = 1024;
      v32 = 1867;
      v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_2330C2000, v16, OS_LOG_TYPE_DEFAULT, "%s:%d:%s shared server %@ has been stopped", (uint8_t *)&v29, 0x26u);
    }
  }
  v19 = CMIOLog();
  if (v19)
  {
    v20 = v19;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v22 = objc_msgSend(v5, "retainCount");
      v29 = 136316162;
      v30 = v21;
      v31 = 1024;
      v32 = 1868;
      v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      v35 = 2048;
      v36 = v5;
      v37 = 1024;
      LODWORD(v38) = v22;
      _os_log_impl(&dword_2330C2000, v20, OS_LOG_TYPE_DEFAULT, "%s:%d:%s releasing shared provider reference %p (its retain count is %d)", (uint8_t *)&v29, 0x2Cu);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&gProviderLock);

  gProvider = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&gProviderLock);
  v23 = CMIOLog();
  if (v23)
  {
    v24 = v23;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v29 = 136315650;
      v30 = v25;
      v31 = 1024;
      v32 = 1876;
      v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      _os_log_impl(&dword_2330C2000, v24, OS_LOG_TYPE_DEFAULT, "%s:%d:%s released and set shared provider reference to nil", (uint8_t *)&v29, 0x1Cu);
    }
  }
  objc_autoreleasePoolPop(v4);
  v26 = CMIOLog();
  if (v26)
  {
    v27 = v26;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v28 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v29 = 136315650;
      v30 = v28;
      v31 = 1024;
      v32 = 1878;
      v33 = 2080;
      v34 = "+[CMIOExtensionProvider stopServiceWithProvider:]";
      _os_log_impl(&dword_2330C2000, v27, OS_LOG_TYPE_DEFAULT, "%s:%d:%s leaving", (uint8_t *)&v29, 0x1Cu);
    }
  }
}

+ (void)ignoreSIGTERM
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = CMIOLog();
  if (v2)
  {
    v3 = v2;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v6 = 1024;
      v7 = 1883;
      v8 = 2080;
      v9 = "+[CMIOExtensionProvider ignoreSIGTERM]";
      _os_log_impl(&dword_2330C2000, v3, OS_LOG_TYPE_DEFAULT, "%s:%d:%s will be ignoring the SIGTERM signal", (uint8_t *)&v4, 0x1Cu);
    }
  }
  gIgnoreSIGTERM = 1;
}

- (dispatch_queue_t)clientQueue
{
  return (dispatch_queue_t)self->_clientQueue;
}

- (NSArray)connectedClients
{
  os_unfair_lock_s *p_connectedClientsLock;
  NSArray *v4;

  p_connectedClientsLock = &self->_connectedClientsLock;
  os_unfair_lock_lock(&self->_connectedClientsLock);
  v4 = self->_connectedClients;
  os_unfair_lock_unlock(p_connectedClientsLock);
  return v4;
}

- (void)setConnectedClients:(id)a3
{
  os_unfair_lock_s *p_connectedClientsLock;
  NSArray *connectedClients;

  p_connectedClientsLock = &self->_connectedClientsLock;
  os_unfair_lock_lock(&self->_connectedClientsLock);
  connectedClients = self->_connectedClients;
  self->_connectedClients = (NSArray *)a3;
  os_unfair_lock_unlock(p_connectedClientsLock);

}

- (NSArray)devices
{
  NSObject *v3;
  NSObject *v4;
  os_unfair_lock_s *p_devicesLock;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  CMIOExtensionProvider *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLogLevel(1);
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v10 = 1024;
      v11 = 1917;
      v12 = 2080;
      v13 = "-[CMIOExtensionProvider devices]";
      v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v8, 0x26u);
    }
  }
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  v6 = (void *)-[NSMutableArray copy](self->_devices, "copy");
  os_unfair_lock_unlock(p_devicesLock);
  return (NSArray *)v6;
}

- (BOOL)addDevice:(CMIOExtensionDevice *)device error:(NSError *)outError
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  NSObject *v15;
  NSError *v16;
  BOOL result;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  CMIOExtensionProvider *v32;
  __int16 v33;
  CMIOExtensionDevice *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v26 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v27 = 1024;
      v28 = 1931;
      v29 = 2080;
      v30 = "-[CMIOExtensionProvider addDevice:error:]";
      v31 = 2112;
      v32 = self;
      v33 = 2112;
      v34 = device;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  if (!device || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider addDevice:error:].cold.1();
      if (!outError)
        return 0;
    }
    else if (!outError)
    {
      return 0;
    }
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD1100];
    v23 = *MEMORY[0x24BDD0FC8];
    v24 = CFSTR("Invalid device");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = &v24;
    v14 = &v23;
    goto LABEL_15;
  }
  os_unfair_lock_lock(&self->_devicesLock);
  if ((-[NSMutableArray containsObject:](self->_devices, "containsObject:", device) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_devicesLock);
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider addDevice:error:].cold.2();
      if (outError)
        goto LABEL_10;
    }
    else if (outError)
    {
LABEL_10:
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD1100];
      v21 = *MEMORY[0x24BDD0FC8];
      v22 = CFSTR("Device already included");
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = &v22;
      v14 = &v21;
LABEL_15:
      v16 = (NSError *)objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, -50, objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1, v21, v22, v23, v24));
      result = 0;
      *outError = v16;
      return result;
    }
  }
  else
  {
    -[NSMutableArray addObject:](self->_devices, "addObject:", device);
    os_unfair_lock_unlock(&self->_devicesLock);
    v18 = CMIOLog();
    if (v18)
    {
      v19 = v18;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)buf = 136316162;
        v26 = v20;
        v27 = 1024;
        v28 = 1952;
        v29 = 2080;
        v30 = "-[CMIOExtensionProvider addDevice:error:]";
        v31 = 2114;
        v32 = self;
        v33 = 2114;
        v34 = device;
        _os_log_impl(&dword_2330C2000, v19, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@", buf, 0x30u);
      }
    }
    if (-[CMIOExtensionProvider registerDevice:error:](self, "registerDevice:error:", device, outError))
    {
      -[CMIOExtensionDevice setParent:](device, "setParent:", self);
      return 1;
    }
    os_unfair_lock_lock(&self->_devicesLock);
    -[NSMutableArray removeObject:](self->_devices, "removeObject:", device);
    os_unfair_lock_unlock(&self->_devicesLock);
  }
  return 0;
}

- (BOOL)removeDevice:(CMIOExtensionDevice *)device error:(NSError *)outError
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  BOOL result;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  NSError *v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  CMIOExtensionProvider *v32;
  __int16 v33;
  CMIOExtensionDevice *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v26 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v27 = 1024;
      v28 = 1976;
      v29 = 2080;
      v30 = "-[CMIOExtensionProvider removeDevice:error:]";
      v31 = 2112;
      v32 = self;
      v33 = 2112;
      v34 = device;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  if (!device || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider removeDevice:error:].cold.1();
      if (!outError)
        return 0;
    }
    else if (!outError)
    {
      return 0;
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD1100];
    v23 = *MEMORY[0x24BDD0FC8];
    v24 = CFSTR("Invalid device");
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v24;
    v18 = &v23;
LABEL_15:
    v19 = (NSError *)objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, -50, objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v21, v22, v23, v24));
    result = 0;
    *outError = v19;
    return result;
  }
  os_unfair_lock_lock(&self->_devicesLock);
  if (!-[NSMutableArray containsObject:](self->_devices, "containsObject:", device))
  {
    os_unfair_lock_unlock(&self->_devicesLock);
    v20 = CMIOLog();
    if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider removeDevice:error:].cold.2();
      if (outError)
        goto LABEL_19;
    }
    else if (outError)
    {
LABEL_19:
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD1100];
      v21 = *MEMORY[0x24BDD0FC8];
      v22 = CFSTR("Device not included");
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = &v22;
      v18 = &v21;
      goto LABEL_15;
    }
    return 0;
  }
  -[NSMutableArray removeObject:](self->_devices, "removeObject:", device);
  os_unfair_lock_unlock(&self->_devicesLock);
  v9 = CMIOLog();
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136316162;
      v26 = v11;
      v27 = 1024;
      v28 = 2004;
      v29 = 2080;
      v30 = "-[CMIOExtensionProvider removeDevice:error:]";
      v31 = 2114;
      v32 = self;
      v33 = 2114;
      v34 = device;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@", buf, 0x30u);
    }
  }
  -[CMIOExtensionProvider unregisterDevice:error:](self, "unregisterDevice:error:", device, outError);
  return 1;
}

- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates
{
  NSObject *v5;
  NSObject *v6;
  NSObject *clientQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionProvider *v16;
  __int16 v17;
  NSDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v11 = 1024;
      v12 = 2012;
      v13 = 2080;
      v14 = "-[CMIOExtensionProvider notifyPropertiesChanged:]";
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = propertyStates;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyStates %@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_changedPropertiesLock);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_changedProperties, "addEntriesFromDictionary:", propertyStates);
  os_unfair_lock_unlock(&self->_changedPropertiesLock);
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CMIOExtensionProvider_notifyPropertiesChanged___block_invoke;
  v8[3] = &unk_2504577C0;
  v8[4] = self;
  v8[5] = propertyStates;
  dispatch_async(clientQueue, v8);
}

void __49__CMIOExtensionProvider_notifyPropertiesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
  if (objc_msgSend(v2, "count"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "pluginPropertiesChanged:", *(_QWORD *)(a1 + 40));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }

}

- (int64_t)authorizationStatusForClient:(id)a3 mediaType:(unsigned int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_contextsMapLock;
  id v8;

  v4 = *(_QWORD *)&a4;
  p_contextsMapLock = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  v8 = (id)-[NSMutableDictionary objectForKey:](self->_contextsMap, "objectForKey:", objc_msgSend(a3, "clientID"));
  os_unfair_lock_unlock(p_contextsMapLock);
  if (v8)
    return objc_msgSend((id)objc_msgSend(v8, "clientInfo"), "authorizationStatusForMediaType:", v4);
  else
    return 0;
}

- (void)requestAccessForClient:(id)a3 mediaType:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  os_unfair_lock_s *p_contextsMapLock;
  id v10;

  v6 = *(_QWORD *)&a4;
  p_contextsMapLock = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  v10 = (id)-[NSMutableDictionary objectForKey:](self->_contextsMap, "objectForKey:", objc_msgSend(a3, "clientID"));
  os_unfair_lock_unlock(p_contextsMapLock);
  if (v10)
    objc_msgSend((id)objc_msgSend(v10, "clientInfo"), "requestAccessForMediaType:reply:", v6, a5);
  else
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)removeAllProviderContexts
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionProvider *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLogLevel(1);
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v18 = 1024;
      v19 = 2083;
      v20 = 2080;
      v21 = "-[CMIOExtensionProvider removeAllProviderContexts]";
      v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
    }
  }
  os_unfair_lock_lock(&self->_contextsMapLock);
  v5 = (void *)-[NSMutableDictionary allValues](self->_contextsMap, "allValues");
  if (objc_msgSend(v5, "count"))
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v5);
  else
    v6 = 0;
  os_unfair_lock_unlock(&self->_contextsMapLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[CMIOExtensionProvider removeProviderContext:](self, "removeProviderContext:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

uint64_t __64__CMIOExtensionProvider_proprietaryDefaultsDomainForAuditToken___block_invoke()
{
  int IntegerValue;
  int v1;
  NSObject *v2;
  NSObject *v3;
  const char *v4;
  uint64_t result;
  char v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sProprietaryDefaultsDomainsByPID = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
  sMostRecentProprietaryDefaultDomainLookupTimeByPID = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = 0;
  IntegerValue = CMIOPreferencesGetIntegerValue(CFSTR("proprietary_default_domain_most_recent_pid_lookup_time_limit"), &v6);
  if (v6)
    v1 = IntegerValue;
  else
    v1 = 15;
  sPostTerminationTimoutForClearingEntryFromProprietaryDefaultsDomainsByPID = v1;
  v2 = CMIOLog();
  if (v2)
  {
    v3 = v2;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136315906;
      v8 = v4;
      v9 = 1024;
      v10 = 2128;
      v11 = 2080;
      v12 = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]_block_invoke";
      v13 = 1024;
      v14 = sPostTerminationTimoutForClearingEntryFromProprietaryDefaultsDomainsByPID;
      _os_log_impl(&dword_2330C2000, v3, OS_LOG_TYPE_DEFAULT, "%s:%d:%s stale pid timeout: %d seconds", buf, 0x22u);
    }
  }
  getSTExecutableIdentityResolverClass();
  result = objc_opt_respondsToSelector();
  sResponsibleIdentityForAuditTokenIsSupported = result & 1;
  return result;
}

+ (id)newActivityAttributionWithToken:(id *)a3
{
  return 0;
}

- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CMIOExtensionPropertyState *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  CMIOExtensionProvider *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v23 = 1024;
      v24 = 2320;
      v25 = 2080;
      v26 = "-[CMIOExtensionProvider _clientQueue_internalPropertyStatesForProperties:]";
      v27 = 2112;
      v28 = self;
      v29 = 2112;
      v30 = a3;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, properties %@", buf, 0x30u);
    }
  }
  if (a3 && !objc_msgSend(a3, "containsObject:", 0x250459518))
    return 0;
  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = -[CMIOExtensionProvider devices](self, "devices", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12++), "deviceID"), "UUIDString"));
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  v13 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", v7, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));

  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v13, 0x250459518);
  return v14;
}

- (void)beginProviderContextRegistration:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *clientQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionProvider *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v11 = 1024;
      v12 = 2339;
      v13 = 2080;
      v14 = "-[CMIOExtensionProvider beginProviderContextRegistration:]";
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__CMIOExtensionProvider_beginProviderContextRegistration___block_invoke;
  v8[3] = &unk_2504577C0;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(clientQueue, v8);
}

uint64_t __58__CMIOExtensionProvider_beginProviderContextRegistration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)finishProviderContextRegistration:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *clientQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionProvider *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v11 = 1024;
      v12 = 2348;
      v13 = 2080;
      v14 = "-[CMIOExtensionProvider finishProviderContextRegistration:]";
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke;
  v8[3] = &unk_2504577C0;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(clientQueue, v8);
}

uint64_t __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint8_t v28[128];
  uint8_t v29[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v3 = CMIOLog();
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_3();
    v4 = CMIOLog();
    v5 = v4;
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v7 = *v2;
      *(_DWORD *)buf = 136315906;
      v38 = v6;
      v39 = 1024;
      v40 = 2353;
      v41 = 2080;
      v42 = "-[CMIOExtensionProvider finishProviderContextRegistration:]_block_invoke";
      v43 = 2112;
      v44 = v7;
      _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_INFO, "%s:%d:%s Unregistered provider context %@, don't be surprised if things go badly", buf, 0x26u);
    }
  }
  v27 = 0;
  if ((objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 176)), "connectClient:error:", objc_msgSend(*(id *)(a1 + 40), "clientInfo"), &v27) & 1) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInfo"), "clientID"));
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12++), "clientInfo"));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }
    objc_msgSend(*(id *)(a1 + 32), "setConnectedClients:", v9);
  }
  else
  {
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_1();
    v14 = CMIOLog();
    v15 = v14;
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v17 = objc_msgSend(*v2, "clientInfo");
      *(_DWORD *)v29 = 136315906;
      v30 = v16;
      v31 = 1024;
      v32 = 2368;
      v33 = 2080;
      v34 = "-[CMIOExtensionProvider finishProviderContextRegistration:]_block_invoke";
      v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_2330C2000, v15, OS_LOG_TYPE_INFO, "%s:%d:%s Refusing connection(%@)", v29, 0x26u);
    }
  }
  v18 = CMIOLog();
  v19 = v18;
  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    v21 = objc_msgSend(*v2, "clientInfo");
    *(_DWORD *)v29 = 136315906;
    v30 = v20;
    v31 = 1024;
    v32 = 2386;
    v33 = 2080;
    v34 = "-[CMIOExtensionProvider finishProviderContextRegistration:]_block_invoke";
    v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_2330C2000, v19, OS_LOG_TYPE_INFO, "%s:%d:%s New connection(%@)", v29, 0x26u);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeProviderContext:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *clientQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionProvider *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v11 = 1024;
      v12 = 2393;
      v13 = 2080;
      v14 = "-[CMIOExtensionProvider removeProviderContext:]";
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__CMIOExtensionProvider_removeProviderContext___block_invoke;
  v8[3] = &unk_2504577C0;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async_and_wait(clientQueue, v8);
}

uint64_t __47__CMIOExtensionProvider_removeProviderContext___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  int v17;
  void *v18;
  CMIOExtensionPropertyState *v19;
  CMIOExtensionPropertyState *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v3 = CMIOLog();
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47__CMIOExtensionProvider_removeProviderContext___block_invoke_cold_2();
    v4 = CMIOLog();
    v5 = v4;
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v7 = *v2;
      *(_DWORD *)buf = 136315906;
      v52 = v6;
      v53 = 1024;
      v54 = 2399;
      v55 = 2080;
      v56 = "-[CMIOExtensionProvider removeProviderContext:]_block_invoke";
      v57 = 2112;
      v58 = v7;
      _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_INFO, "%s:%d:%s Unregistered provider context %@, don't be surprised if things go badly", buf, 0x26u);
    }
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_msgSend(*(id *)(a1 + 32), "devices");
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v45;
    v27 = *MEMORY[0x24BDD0FC8];
    v28 = *MEMORY[0x24BDD1100];
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v33 = v8;
        v34 = (id)objc_msgSend(v8, "streams", v27, v28);
        v9 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v41 != v10)
                objc_enumerationMutation(v34);
              v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
              v13 = (void *)objc_msgSend(v12, "_clientQueue_streamingClientsMap");
              if (objc_msgSend(v13, "objectForKey:", objc_msgSend((id)objc_msgSend(*v2, "clientInfo"), "clientID"))
                && objc_msgSend(v13, "count") == 1)
              {
                v39 = 0;
                if ((objc_msgSend((id)objc_msgSend(v12, "source"), "stopStreamAndReturnError:", &v39) & 1) == 0)
                {
                  v14 = CMIOLog();
                  v15 = v14;
                  if (v14)
                  {
                    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                    {
                      v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                      *(_DWORD *)buf = 136315906;
                      v52 = v16;
                      v53 = 1024;
                      v54 = 2417;
                      v55 = 2080;
                      v56 = "-[CMIOExtensionProvider removeProviderContext:]_block_invoke";
                      v57 = 2112;
                      v58 = v39;
                      _os_log_error_impl(&dword_2330C2000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s Could not stop streaming %@", buf, 0x26u);
                    }
                  }
                }
                objc_msgSend(v12, "_clientQueue_removeStreamingClient:", objc_msgSend(*(id *)(a1 + 40), "clientInfo"));
                objc_msgSend(*(id *)(a1 + 32), "_clientQueue_notifyIsRunningSomewhereForStream:", v12);
              }
              else
              {
                objc_msgSend(v12, "_clientQueue_removeStreamingClient:", objc_msgSend(*v2, "clientInfo"));
              }
              objc_msgSend(*(id *)(a1 + 32), "_clientQueue_removePendingStartStreamCountForClient:streamID:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInfo"), "clientID"), objc_msgSend(v12, "streamID"));
              objc_msgSend(*(id *)(a1 + 32), "removeSystemStatusAttributionsForClient:stream:", objc_msgSend(*(id *)(a1 + 40), "clientInfo"), v12);
            }
            v9 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v9);
        }
        v17 = objc_msgSend(v33, "deviceControlPID");
        if (v17 == objc_msgSend((id)objc_msgSend(*v2, "clientInfo"), "pid"))
        {
          objc_msgSend(v33, "setDeviceControlPID:", 0xFFFFFFFFLL);
          v18 = (void *)objc_opt_new();
          v19 = [CMIOExtensionPropertyState alloc];
          v20 = -[CMIOExtensionPropertyState initWithValue:](v19, "initWithValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v33, "deviceControlPID")));
          objc_msgSend(v18, "setObject:forKey:", v20, 0x2504595F8);

          objc_msgSend(v33, "notifyPropertiesChanged:", v18);
        }
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v31);
  }
  objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 176)), "disconnectClient:", objc_msgSend(*(id *)(a1 + 40), "clientInfo"));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInfo"), "clientID"));
  v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v22 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "clientInfo"));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v23);
  }
  objc_msgSend(*(id *)(a1 + 32), "setConnectedClients:", v22);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)registerDevice:(id)a3 error:(id *)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  BOOL result;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionProvider *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v18 = 1024;
      v19 = 2468;
      v20 = 2080;
      v21 = "-[CMIOExtensionProvider registerDevice:error:]";
      v22 = 2112;
      v23 = self;
      v24 = 2112;
      v25 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_devicesMapLock);
  if (-[NSMutableDictionary objectForKey:](self->_devicesMap, "objectForKey:", objc_msgSend(a3, "deviceID")))
  {
    os_unfair_lock_unlock(&self->_devicesMapLock);
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider registerDevice:error:].cold.1();
      if (a4)
        goto LABEL_8;
    }
    else if (a4)
    {
LABEL_8:
      v10 = *MEMORY[0x24BDD1100];
      v14 = *MEMORY[0x24BDD0FC8];
      v15 = CFSTR("deviceID already included");
      v11 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      result = 0;
      *a4 = v11;
      return result;
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_devicesMap, "setObject:forKey:", a3, objc_msgSend(a3, "deviceID"));
    v13 = -[NSMutableDictionary allKeys](self->_devicesMap, "allKeys");
    os_unfair_lock_unlock(&self->_devicesMapLock);
    if ((objc_msgSend(a3, "didRegister:", a4) & 1) != 0)
    {
      -[CMIOExtensionProvider notifyAvailableDevicesChanged:](self, "notifyAvailableDevicesChanged:", v13);
      return 1;
    }
    os_unfair_lock_lock(&self->_devicesMapLock);
    -[NSMutableDictionary removeObjectForKey:](self->_devicesMap, "removeObjectForKey:", objc_msgSend(a3, "deviceID"));
    os_unfair_lock_unlock(&self->_devicesMapLock);
  }
  return 0;
}

- (BOOL)unregisterDevice:(id)a3 error:(id *)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionProvider *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v18 = 1024;
      v19 = 2505;
      v20 = 2080;
      v21 = "-[CMIOExtensionProvider unregisterDevice:error:]";
      v22 = 2112;
      v23 = self;
      v24 = 2112;
      v25 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_devicesMapLock);
  v9 = -[NSMutableDictionary objectForKey:](self->_devicesMap, "objectForKey:", objc_msgSend(a3, "deviceID"));
  if (!v9)
  {
    os_unfair_lock_unlock(&self->_devicesMapLock);
    v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionProvider unregisterDevice:error:].cold.1();
      if (!a4)
        return v9 != 0;
    }
    else if (!a4)
    {
      return v9 != 0;
    }
    v12 = *MEMORY[0x24BDD1100];
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("deviceID not registered");
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    return v9 != 0;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_devicesMap, "removeObjectForKey:", objc_msgSend(a3, "deviceID"));
  v10 = -[NSMutableDictionary allKeys](self->_devicesMap, "allKeys");
  os_unfair_lock_unlock(&self->_devicesMapLock);
  objc_msgSend(a3, "didUnregister");
  -[CMIOExtensionProvider notifyAvailableDevicesChanged:](self, "notifyAvailableDevicesChanged:", v10);
  return v9 != 0;
}

- (BOOL)registerStream:(id)a3 withDeviceID:(id)a4 error:(id *)a5
{
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  CMIOExtensionProvider *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLogLevel(1);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v19 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v20 = 1024;
      v21 = 2535;
      v22 = 2080;
      v23 = "-[CMIOExtensionProvider registerStream:withDeviceID:error:]";
      v24 = 2112;
      v25 = self;
      v26 = 2112;
      v27 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_streamsMapLock);
  v11 = -[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", objc_msgSend(a3, "streamID"));
  if (!v11)
  {
    -[NSMutableDictionary setObject:forKey:](self->_streamsMap, "setObject:forKey:", a3, objc_msgSend(a3, "streamID"));
    v14 = -[NSMutableDictionary allKeys](self->_streamsMap, "allKeys");
    os_unfair_lock_unlock(&self->_streamsMapLock);
    -[CMIOExtensionProvider notifyAvailableStreamsChangedWithDeviceID:streamIDs:](self, "notifyAvailableStreamsChangedWithDeviceID:streamIDs:", a4, v14);
    return v11 == 0;
  }
  os_unfair_lock_unlock(&self->_streamsMapLock);
  v12 = CMIOLog();
  if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[CMIOExtensionProvider registerStream:withDeviceID:error:].cold.1();
    if (!a5)
      return v11 == 0;
    goto LABEL_8;
  }
  if (a5)
  {
LABEL_8:
    v13 = *MEMORY[0x24BDD1100];
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("streamID already included");
    *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v13, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  }
  return v11 == 0;
}

- (BOOL)unregisterStream:(id)a3 withDeviceID:(id)a4 notify:(BOOL)a5 error:(id *)a6
{
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v35;
  _BOOL4 v37;
  id v38;
  uint64_t v39;
  _QWORD v40[7];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const __CFString *v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  CMIOExtensionProvider *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v37 = a5;
  v64 = *MEMORY[0x24BDAC8D0];
  v8 = CMIOLogLevel(1);
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v52 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v53 = 1024;
      v54 = 2564;
      v55 = 2080;
      v56 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
      v57 = 2112;
      v58 = self;
      v59 = 2112;
      v60 = (uint64_t)a3;
      _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  os_unfair_lock_lock(&self->_streamsMapLock);
  if (-[NSMutableDictionary count](self->_streamsMap, "count"))
    v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", -[NSMutableDictionary allKeys](self->_streamsMap, "allKeys"));
  else
    v38 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v39 = -[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", objc_msgSend(a3, "streamID", a4));
  if (v39)
  {
    v10 = objc_msgSend((id)objc_msgSend(a3, "streamingClients"), "count");
    v46[3] = v10;
    if (v10)
    {
      v11 = CMIOLog();
      v12 = v11;
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)buf = 136316162;
        v52 = v13;
        v53 = 1024;
        v54 = 2577;
        v55 = 2080;
        v56 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
        v57 = 2114;
        v58 = self;
        v59 = 2114;
        v60 = (uint64_t)a3;
        _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@ pending stream clients for %{public}@, wait for stream stop before removing it", buf, 0x30u);
      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v14 = (void *)objc_msgSend(a3, "streamingClients");
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v63, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v42 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            v19 = CMIOLog();
            v20 = v19;
            if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              v22 = objc_msgSend((id)objc_msgSend(a3, "streamID"), "UUIDString");
              *(_DWORD *)buf = 136316419;
              v52 = v21;
              v53 = 1024;
              v54 = 2579;
              v55 = 2080;
              v56 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
              v57 = 2114;
              v58 = self;
              v59 = 2114;
              v60 = v22;
              v61 = 2113;
              v62 = v18;
              _os_log_impl(&dword_2330C2000, v20, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@, %{private}@", buf, 0x3Au);
            }
            v23 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
            v24 = objc_msgSend(v18, "clientID");
            v25 = objc_msgSend(a3, "streamID");
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __68__CMIOExtensionProvider_unregisterStream_withDeviceID_notify_error___block_invoke;
            v40[3] = &unk_250457808;
            v40[5] = a3;
            v40[6] = &v45;
            v40[4] = self;
            objc_msgSend(v23, "stopStreamForClientID:streamID:reply:", v24, v25, v40);
            -[CMIOExtensionProvider removeSystemStatusAttributionsForClient:stream:](self, "removeSystemStatusAttributionsForClient:stream:", v18, a3);
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v63, 16);
        }
        while (v15);
      }
    }
    else
    {
      v27 = CMIOLog();
      v28 = v27;
      if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        *(_DWORD *)buf = 136316162;
        v52 = v29;
        v53 = 1024;
        v54 = 2592;
        v55 = 2080;
        v56 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
        v57 = 2114;
        v58 = self;
        v59 = 2114;
        v60 = (uint64_t)a3;
        _os_log_impl(&dword_2330C2000, v28, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@ no active clients for %{public}@ removing it", buf, 0x30u);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_streamsMap, "removeObjectForKey:", objc_msgSend(a3, "streamID"));
    }
    objc_msgSend(v38, "removeObject:", objc_msgSend(a3, "streamID"));
    v26 = objc_msgSend(v38, "allObjects");
  }
  else
  {
    v26 = 0;
  }
  os_unfair_lock_unlock(&self->_streamsMapLock);

  if (v39)
  {
    if (v37)
      -[CMIOExtensionProvider notifyAvailableStreamsChangedWithDeviceID:streamIDs:](self, "notifyAvailableStreamsChangedWithDeviceID:streamIDs:", v35, v26);
  }
  else
  {
    v30 = CMIOLog();
    if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      objc_msgSend(a3, "streamID");
      -[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:].cold.1();
    }
    if (a6)
    {
      v31 = (void *)MEMORY[0x24BDD1540];
      v49 = *MEMORY[0x24BDD0FC8];
      v50 = CFSTR("streamID not register");
      v32 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      *a6 = (id)objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v32);
    }
  }
  _Block_object_dispose(&v45, 8);
  return v39 != 0;
}

uint64_t __68__CMIOExtensionProvider_unregisterStream_withDeviceID_notify_error___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    v2 = CMIOLog();
    if (v2)
    {
      v3 = v2;
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        v5 = *(_QWORD *)(v1 + 32);
        v6 = objc_msgSend(*(id *)(v1 + 40), "streamID");
        v7 = 136316162;
        v8 = v4;
        v9 = 1024;
        v10 = 2584;
        v11 = 2080;
        v12 = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]_block_invoke";
        v13 = 2114;
        v14 = v5;
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_2330C2000, v3, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@ stop stream complete, remove %{public}@", (uint8_t *)&v7, 0x30u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 88), "removeObjectForKey:", objc_msgSend(*(id *)(v1 + 40), "streamID"));
  }
  return result;
}

- (void)availablePluginPropertiesForClientID:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *clientQueue;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionProvider *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v13 = 1024;
      v14 = 2623;
      v15 = 2080;
      v16 = "-[CMIOExtensionProvider availablePluginPropertiesForClientID:reply:]";
      v17 = 2112;
      v18 = self;
      v19 = 2112;
      v20 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__CMIOExtensionProvider_availablePluginPropertiesForClientID_reply___block_invoke;
  v10[3] = &unk_250457830;
  v10[4] = self;
  v10[5] = a4;
  dispatch_async(clientQueue, v10);
}

uint64_t __68__CMIOExtensionProvider_availablePluginPropertiesForClientID_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 176)), "availableProperties");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)pluginStatesForClientID:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *clientQueue;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionProvider *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v13 = 1024;
      v14 = 2634;
      v15 = 2080;
      v16 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]";
      v17 = 2112;
      v18 = self;
      v19 = 2112;
      v20 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke;
  v10[3] = &unk_250457830;
  v10[4] = self;
  v10[5] = a4;
  dispatch_async(clientQueue, v10);
}

uint64_t __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  const char *v37;
  NSObject *v39;
  const char *v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  void *v45;
  id obj;
  uint64_t v47;
  void *v48;
  id *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  _BYTE v62[128];
  uint8_t v63[192];
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v61 = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v44 = a1;
  v49 = (id *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_clientQueue_internalPropertyStatesForProperties:", 0);
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v2, "addEntriesFromDictionary:", v3);
  v45 = v2;
  v4 = (void *)objc_msgSend(objc_loadWeak((id *)*v49 + 22), "availableProperties");
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v8 = *v49;
      *(_DWORD *)buf = 136316162;
      v65 = v7;
      v66 = 1024;
      v67 = 2644;
      v68 = 2080;
      v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
      v70 = 2114;
      v71 = v8;
      v72 = 2114;
      v73 = (uint64_t)v4;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, availableProperties %{public}@", buf, 0x30u);
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)*v49 + 22), "providerPropertiesForProperties:error:", v4, &v61), "propertiesDictionary");
    if (v61)
    {
      v10 = CMIOLog();
      v11 = v10;
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v40 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v41 = v61;
          v42 = objc_msgSend(v61, "localizedDescription");
          *(_DWORD *)buf = 136316162;
          v65 = v40;
          v66 = 1024;
          v67 = 2651;
          v68 = 2080;
          v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
          v70 = 2112;
          v71 = v41;
          v72 = 2112;
          v73 = v42;
          _os_log_error_impl(&dword_2330C2000, v11, OS_LOG_TYPE_ERROR, "%s:%d:%s providerPropertiesForProperties error %@ localizedDescription: %@", buf, 0x30u);
        }
      }
    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v45, "addEntriesFromDictionary:", v9);
    }
    else
    {
      v39 = CMIOLog();
      if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke_cold_1();
    }
  }
  v48 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_msgSend(*v49, "devices");
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v50)
  {
    v47 = *(_QWORD *)v58;
    *(_QWORD *)&v13 = 136315906;
    v43 = v13;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v58 != v47)
        {
          v15 = v14;
          objc_enumerationMutation(obj);
          v14 = v15;
        }
        v51 = v14;
        v16 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v14);
        v17 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v43);
        v18 = (void *)objc_msgSend(v16, "_clientQueue_internalPropertyStatesForProperties:", 0);
        if (objc_msgSend(v18, "count"))
          objc_msgSend(v17, "addEntriesFromDictionary:", v18);
        objc_msgSend(*v49, "_addAvailablePropertyStatesForDevice:toDictionary:", v16, v17);
        objc_msgSend(v48, "addObject:", v17);
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v19 = (void *)objc_msgSend(v16, "streams");
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v54;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v54 != v21)
                objc_enumerationMutation(v19);
              v23 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v22);
              v24 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v25 = (void *)objc_msgSend(v23, "_clientQueue_internalPropertyStatesForProperties:", 0);
              if (objc_msgSend(v25, "count"))
                objc_msgSend(v24, "addEntriesFromDictionary:", v25);
              v26 = (void *)objc_msgSend((id)objc_msgSend(v23, "source"), "availableProperties");
              v27 = CMIOLog();
              v28 = v27;
              if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                *(_DWORD *)buf = 136316162;
                v65 = v29;
                v66 = 1024;
                v67 = 2689;
                v68 = 2080;
                v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
                v70 = 2114;
                v71 = v23;
                v72 = 2114;
                v73 = (uint64_t)v26;
                _os_log_impl(&dword_2330C2000, v28, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, stream availableProperties %{public}@", buf, 0x30u);
              }
              if (objc_msgSend(v26, "count"))
              {
                v30 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "source"), "streamPropertiesForProperties:error:", v26, &v61), "propertiesDictionary");
                if (v61)
                {
                  v31 = CMIOLog();
                  v32 = v31;
                  if (v31)
                  {
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                    {
                      v52 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                      v35 = v61;
                      v36 = objc_msgSend(v61, "localizedDescription");
                      *(_DWORD *)buf = 136316162;
                      v65 = v52;
                      v66 = 1024;
                      v67 = 2696;
                      v68 = 2080;
                      v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
                      v70 = 2114;
                      v71 = v35;
                      v72 = 2114;
                      v73 = v36;
                      _os_log_error_impl(&dword_2330C2000, v32, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                    }
                  }
                }
                if (objc_msgSend(v30, "count"))
                {
                  objc_msgSend(v24, "addEntriesFromDictionary:", v30);
                }
                else
                {
                  v33 = CMIOLog();
                  v34 = v33;
                  if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    v37 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    *(_DWORD *)buf = 136316162;
                    v65 = v37;
                    v66 = 1024;
                    v67 = 2707;
                    v68 = 2080;
                    v69 = "-[CMIOExtensionProvider pluginStatesForClientID:reply:]_block_invoke";
                    v70 = 2114;
                    v71 = v61;
                    v72 = 2114;
                    v73 = (uint64_t)v23;
                    _os_log_error_impl(&dword_2330C2000, v34, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ for stream %{public}@", buf, 0x30u);
                  }
                }
              }
              objc_msgSend(v12, "addObject:", v24);
              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          }
          while (v20);
        }
        v14 = v51 + 1;
      }
      while (v51 + 1 != v50);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v50);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(v44 + 40) + 16))();
}

- (void)_addAvailablePropertyStatesForDevice:(id)a3 toDictionary:(id)a4
{
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  id v14;
  uint64_t v15;
  id v16[3];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v16[0] = 0;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "source"), "availableProperties");
  v7 = CMIOLog();
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v19 = 1024;
      v20 = 2722;
      v21 = 2080;
      v22 = "-[CMIOExtensionProvider _addAvailablePropertyStatesForDevice:toDictionary:]";
      v23 = 2114;
      v24 = a3;
      v25 = 2114;
      v26 = (uint64_t)v6;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, device availableProperties %{public}@", buf, 0x30u);
    }
  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "source"), "devicePropertiesForProperties:error:", v6, v16), "propertiesDictionary");
    if (v16[0])
    {
      v10 = CMIOLog();
      v11 = v10;
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v14 = v16[0];
          v15 = objc_msgSend(v16[0], "localizedDescription");
          *(_DWORD *)buf = 136316162;
          v18 = v13;
          v19 = 1024;
          v20 = 2729;
          v21 = 2080;
          v22 = "-[CMIOExtensionProvider _addAvailablePropertyStatesForDevice:toDictionary:]";
          v23 = 2114;
          v24 = v14;
          v25 = 2114;
          v26 = v15;
          _os_log_error_impl(&dword_2330C2000, v11, OS_LOG_TYPE_ERROR, "%s:%d:%s devicePropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
        }
      }
    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(a4, "addEntriesFromDictionary:", v9);
    }
    else
    {
      v12 = CMIOLog();
      if (v12)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionProvider _addAvailablePropertyStatesForDevice:toDictionary:].cold.1();
      }
    }
  }
}

- (void)pluginPropertyStatesForClientID:(id)a3 properties:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *clientQueue;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionProvider *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLogLevel(1);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 1024;
      v16 = 2748;
      v17 = 2080;
      v18 = "-[CMIOExtensionProvider pluginPropertyStatesForClientID:properties:reply:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke;
  block[3] = &unk_250457858;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

uint64_t __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v14;
  const char *v15;
  id v16;
  uint64_t v17;
  id v18[3];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18[0] = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = a1 + 32;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_clientQueue_internalPropertyStatesForProperties:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v2, "addEntriesFromDictionary:", v4);
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:");
    if (+[CMIOExtensionProvider internalProperties](CMIOExtensionProvider, "internalProperties"))
      objc_msgSend(v5, "minusSet:", +[CMIOExtensionProvider internalProperties](CMIOExtensionProvider, "internalProperties"));
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)v3 + 176)), "availableProperties");
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        v9 = *(void **)v3;
        *(_DWORD *)buf = 136316162;
        v20 = v8;
        v21 = 1024;
        v22 = 2760;
        v23 = 2080;
        v24 = "-[CMIOExtensionProvider pluginPropertyStatesForClientID:properties:reply:]_block_invoke";
        v25 = 2114;
        v26 = v9;
        v27 = 2114;
        v28 = (uint64_t)v5;
        _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, availableProperties %{public}@", buf, 0x30u);
      }
    }
  }
  if (objc_msgSend(v5, "count"))
  {
    v10 = (void *)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)v3 + 176)), "providerPropertiesForProperties:error:", v5, v18), "propertiesDictionary");
    if (v18[0])
    {
      v11 = CMIOLog();
      v12 = v11;
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v15 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v16 = v18[0];
          v17 = objc_msgSend(v18[0], "localizedDescription");
          *(_DWORD *)buf = 136316162;
          v20 = v15;
          v21 = 1024;
          v22 = 2774;
          v23 = 2080;
          v24 = "-[CMIOExtensionProvider pluginPropertyStatesForClientID:properties:reply:]_block_invoke";
          v25 = 2114;
          v26 = v16;
          v27 = 2114;
          v28 = v17;
          _os_log_error_impl(&dword_2330C2000, v12, OS_LOG_TYPE_ERROR, "%s:%d:%s providerPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
        }
      }
    }
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v2, "addEntriesFromDictionary:", v10);
    }
    else
    {
      v14 = CMIOLog();
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)setPluginPropertyValuesForClientID:(id)a3 propertyValues:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *clientQueue;
  _QWORD v12[8];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionProvider *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLogLevel(1);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 1024;
      v16 = 2800;
      v17 = 2080;
      v18 = "-[CMIOExtensionProvider setPluginPropertyValuesForClientID:propertyValues:reply:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = a3;
      v23 = 2112;
      v24 = a4;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@, propertyValues %@", buf, 0x3Au);
    }
  }
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke;
  v12[3] = &unk_2504578A8;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  v12[7] = a5;
  dispatch_async(clientQueue, v12);
}

void __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  CMIOExtensionProviderProperties *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  uint64_t v18;
  const char *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[6];
  id v23;
  id v24[9];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v24[0] = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", objc_msgSend(*(id *)(a1 + 32), "allKeys"));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", *(_QWORD *)(a1 + 48));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    v4 = -[CMIOExtensionProviderProperties initWithPropertyValues:client:]([CMIOExtensionProviderProperties alloc], "initWithPropertyValues:client:", *(_QWORD *)(a1 + 32), objc_msgSend(v3, "clientInfo"));
    objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 40) + 176)), "setProviderProperties:error:", v4, v24);

    if (v24[0])
    {
      v5 = CMIOLog();
      v6 = v5;
      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v19 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v20 = v24[0];
          v21 = objc_msgSend(v24[0], "localizedDescription");
          *(_DWORD *)buf = 136316162;
          v26 = v19;
          v27 = 1024;
          v28 = 2826;
          v29 = 2080;
          v30 = "-[CMIOExtensionProvider setPluginPropertyValuesForClientID:propertyValues:reply:]_block_invoke";
          v31 = 2112;
          v32 = v20;
          v33 = 2112;
          v34 = v21;
          _os_log_error_impl(&dword_2330C2000, v6, OS_LOG_TYPE_ERROR, "%s:%d:%s setProviderProperties error %@ localizedDescription: %@", buf, 0x30u);
        }
      }
    }
    v23 = 0;
    v7 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 40) + 176)), "providerPropertiesForProperties:error:", v2, &v23), "propertiesDictionary");
    if (v23)
    {
      v8 = CMIOLog();
      v9 = v8;
      if (v8)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v17 = v23;
          v18 = objc_msgSend(v23, "localizedDescription");
          *(_DWORD *)buf = 136316162;
          v26 = v16;
          v27 = 1024;
          v28 = 2841;
          v29 = 2080;
          v30 = "-[CMIOExtensionProvider setPluginPropertyValuesForClientID:propertyValues:reply:]_block_invoke";
          v31 = 2114;
          v32 = v17;
          v33 = 2114;
          v34 = v18;
          _os_log_error_impl(&dword_2330C2000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s providerPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "notifyPropertiesChanged:", v7);
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_353;
    v22[3] = &unk_250457880;
    v11 = *(_QWORD *)(a1 + 56);
    v22[4] = v24[0];
    v22[5] = v11;
    dispatch_async(v10, v22);
  }
  else
  {
    v12 = CMIOLog();
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_1();
    v13 = *(_QWORD *)(a1 + 56);
    v14 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    v36[0] = CFSTR("Invalid property value");
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v15));
  }
}

uint64_t __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_353(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)availableDevicePropertiesForClientID:(id)a3 deviceID:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *clientQueue;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionProvider *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLogLevel(1);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 1024;
      v16 = 2858;
      v17 = 2080;
      v18 = "-[CMIOExtensionProvider availableDevicePropertiesForClientID:deviceID:reply:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CMIOExtensionProvider_availableDevicePropertiesForClientID_deviceID_reply___block_invoke;
  block[3] = &unk_250457858;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

uint64_t __77__CMIOExtensionProvider_availableDevicePropertiesForClientID_deviceID_reply___block_invoke(_QWORD *a1)
{
  id v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 64));
  v2 = (id)objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 64));
  if (v2)
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties"), 0);
  v4 = CMIOLog();
  if (v4)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__CMIOExtensionProvider_availableDevicePropertiesForClientID_deviceID_reply___block_invoke_cold_1();
  }
  v5 = a1[6];
  v6 = *MEMORY[0x24BDD1100];
  v7 = *MEMORY[0x24BDD0FC8];
  v8[0] = CFSTR("Invalid deviceID");
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v5, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v6, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1)));
}

- (void)deviceStatesForClientID:(id)a3 deviceID:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *clientQueue;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionProvider *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLogLevel(1);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 1024;
      v16 = 2881;
      v17 = 2080;
      v18 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke;
  block[3] = &unk_250457858;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

uint64_t __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  const char *v31;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  _QWORD *v42;
  void *v43;
  const char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[192];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[4];

  v62[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 64));
  v2 = (id)objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 64));
  if (v2)
  {
    v49 = 0;
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_msgSend(v2, "_clientQueue_internalPropertyStatesForProperties:", 0);
    if (objc_msgSend(v4, "count"))
      objc_msgSend(v3, "addEntriesFromDictionary:", v4);
    v42 = a1;
    v43 = v3;
    v5 = (void *)objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties");
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        v52 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        v53 = 1024;
        v54 = 2904;
        v55 = 2080;
        v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
        v57 = 2114;
        v58 = v2;
        v59 = 2114;
        v60 = (uint64_t)v5;
        _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, device availableProperties %{public}@", buf, 0x30u);
      }
    }
    if (objc_msgSend(v5, "count"))
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "devicePropertiesForProperties:error:", v5, &v49), "propertiesDictionary");
      if (v49)
      {
        v9 = CMIOLog();
        v10 = v9;
        if (v9)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v38 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            v39 = v49;
            v40 = objc_msgSend(v49, "localizedDescription");
            *(_DWORD *)buf = 136316162;
            v52 = v38;
            v53 = 1024;
            v54 = 2911;
            v55 = 2080;
            v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
            v57 = 2114;
            v58 = v39;
            v59 = 2114;
            v60 = v40;
            _os_log_error_impl(&dword_2330C2000, v10, OS_LOG_TYPE_ERROR, "%s:%d:%s devicePropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
          }
        }
      }
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v43, "addEntriesFromDictionary:", v8);
      }
      else
      {
        v37 = CMIOLog();
        if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_2();
      }
    }
    v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = (void *)objc_msgSend(v2, "streams");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v13)
    {
      v15 = *(_QWORD *)v46;
      *(_QWORD *)&v14 = 136315906;
      v41 = v14;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
          v18 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v41);
          v19 = (void *)objc_msgSend(v17, "_clientQueue_internalPropertyStatesForProperties:", 0);
          if (objc_msgSend(v19, "count"))
            objc_msgSend(v18, "addEntriesFromDictionary:", v19);
          v20 = (void *)objc_msgSend((id)objc_msgSend(v17, "source"), "availableProperties");
          v21 = CMIOLog();
          v22 = v21;
          if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            *(_DWORD *)buf = 136316162;
            v52 = v23;
            v53 = 1024;
            v54 = 2935;
            v55 = 2080;
            v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
            v57 = 2114;
            v58 = v17;
            v59 = 2114;
            v60 = (uint64_t)v20;
            _os_log_impl(&dword_2330C2000, v22, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, stream availableProperties %{public}@", buf, 0x30u);
          }
          if (objc_msgSend(v20, "count"))
          {
            v24 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "source"), "streamPropertiesForProperties:error:", v20, &v49), "propertiesDictionary");
            if (v49)
            {
              v25 = CMIOLog();
              v26 = v25;
              if (v25)
              {
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v44 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                  v29 = v49;
                  v30 = objc_msgSend(v49, "localizedDescription");
                  *(_DWORD *)buf = 136316162;
                  v52 = v44;
                  v53 = 1024;
                  v54 = 2942;
                  v55 = 2080;
                  v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
                  v57 = 2114;
                  v58 = v29;
                  v59 = 2114;
                  v60 = v30;
                  _os_log_error_impl(&dword_2330C2000, v26, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                }
              }
            }
            if (objc_msgSend(v24, "count"))
            {
              objc_msgSend(v18, "addEntriesFromDictionary:", v24);
            }
            else
            {
              v27 = CMIOLog();
              v28 = v27;
              if (v27)
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v31 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                  *(_DWORD *)buf = 136316162;
                  v52 = v31;
                  v53 = 1024;
                  v54 = 2953;
                  v55 = 2080;
                  v56 = "-[CMIOExtensionProvider deviceStatesForClientID:deviceID:reply:]_block_invoke";
                  v57 = 2114;
                  v58 = v49;
                  v59 = 2114;
                  v60 = (uint64_t)v17;
                  _os_log_error_impl(&dword_2330C2000, v28, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ for stream %{public}@", buf, 0x30u);
                }
              }
            }
          }
          objc_msgSend(v11, "addObject:", v18);
          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v13);
    }
    return (*(uint64_t (**)(void))(v42[6] + 16))();
  }
  else
  {
    v33 = CMIOLog();
    if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_1();
    v34 = a1[6];
    v35 = (void *)MEMORY[0x24BDD1540];
    v61 = *MEMORY[0x24BDD0FC8];
    v62[0] = CFSTR("Invalid deviceID");
    v36 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v34 + 16))(v34, 0, 0, objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v36));
  }
}

- (void)devicePropertyStatesForClientID:(id)a3 deviceID:(id)a4 properties:(id)a5 reply:(id)a6
{
  NSObject *v11;
  NSObject *v12;
  NSObject *clientQueue;
  _QWORD v14[8];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  CMIOExtensionProvider *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v11 = CMIOLogLevel(1);
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v17 = 1024;
      v18 = 2964;
      v19 = 2080;
      v20 = "-[CMIOExtensionProvider devicePropertyStatesForClientID:deviceID:properties:reply:]";
      v21 = 2112;
      v22 = self;
      v23 = 2112;
      v24 = a3;
      _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke;
  v14[3] = &unk_2504578D0;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a6;
  dispatch_async(clientQueue, v14);
}

uint64_t __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  uint64_t v19;
  id v20[3];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 64));
  v2 = (id)objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 64));
  if (v2)
  {
    v20[0] = 0;
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_msgSend(v2, "_clientQueue_internalPropertyStatesForProperties:", a1[6]);
    if (objc_msgSend(v4, "count"))
      objc_msgSend(v3, "addEntriesFromDictionary:", v4);
    if (a1[6])
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:");
      if (+[CMIOExtensionDevice internalProperties](CMIOExtensionDevice, "internalProperties"))
        objc_msgSend(v5, "minusSet:", +[CMIOExtensionDevice internalProperties](CMIOExtensionDevice, "internalProperties"));
    }
    else
    {
      v5 = (void *)objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties");
      v11 = CMIOLog();
      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v23 = 1024;
          v24 = 2989;
          v25 = 2080;
          v26 = "-[CMIOExtensionProvider devicePropertyStatesForClientID:deviceID:properties:reply:]_block_invoke";
          v27 = 2114;
          v28 = v2;
          v29 = 2114;
          v30 = (uint64_t)v5;
          _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, device availableProperties %{public}@", buf, 0x30u);
        }
      }
    }
    if (objc_msgSend(v5, "count"))
    {
      v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "devicePropertiesForProperties:error:", v5, v20), "propertiesDictionary");
      if (v20[0])
      {
        v14 = CMIOLog();
        v15 = v14;
        if (v14)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            v18 = v20[0];
            v19 = objc_msgSend(v20[0], "localizedDescription");
            *(_DWORD *)buf = 136316162;
            v22 = v17;
            v23 = 1024;
            v24 = 3003;
            v25 = 2080;
            v26 = "-[CMIOExtensionProvider devicePropertyStatesForClientID:deviceID:properties:reply:]_block_invoke";
            v27 = 2114;
            v28 = v18;
            v29 = 2114;
            v30 = v19;
            _os_log_error_impl(&dword_2330C2000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s devicePropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
          }
        }
      }
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v3, "addEntriesFromDictionary:", v13);
      }
      else
      {
        v16 = CMIOLog();
        if (v16)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_2();
        }
      }
    }
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_1();
    v7 = a1[7];
    v8 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    v32[0] = CFSTR("Invalid deviceID");
    v9 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v7, 0, objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v9));
  }
}

- (void)setDevicePropertyValuesForClientID:(id)a3 deviceID:(id)a4 propertyValues:(id)a5 reply:(id)a6
{
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  CMIOExtensionProvider *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v30;
  _QWORD block[9];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  CMIOExtensionProvider *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLog();
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316163;
      v38 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v39 = 1024;
      v40 = 3029;
      v41 = 2080;
      v42 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]";
      v43 = 2114;
      v44 = self;
      v45 = 2113;
      v46 = (uint64_t)a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{private}@", buf, 0x30u);
    }
  }
  v30 = a3;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = (void *)objc_msgSend(a5, "allKeys", self);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        v16 = *(CMIOExtensionProvider **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v17 = -[CMIOExtensionProvider isEqualToString:](v16, "isEqualToString:", 0x2504595F8);
        v18 = CMIOLog();
        v19 = v18;
        if (v17)
        {
          if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            v21 = objc_msgSend(a5, "objectForKeyedSubscript:", v16);
            *(_DWORD *)buf = 136316163;
            v38 = v20;
            v39 = 1024;
            v40 = 3032;
            v41 = 2080;
            v42 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]";
            v43 = 2113;
            v44 = v16;
            v45 = 2113;
            v46 = v21;
            v22 = v19;
            v23 = "%s:%d:%s %{private}@ : %{private}@";
LABEL_16:
            _os_log_impl(&dword_2330C2000, v22, OS_LOG_TYPE_INFO, v23, buf, 0x30u);
            continue;
          }
        }
        else if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v24 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v25 = objc_msgSend(a5, "objectForKeyedSubscript:", v16);
          *(_DWORD *)buf = 136316162;
          v38 = v24;
          v39 = 1024;
          v40 = 3035;
          v41 = 2080;
          v42 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]";
          v43 = 2114;
          v44 = v16;
          v45 = 2114;
          v46 = v25;
          v22 = v19;
          v23 = "%s:%d:%s %{public}@ : %{public}@";
          goto LABEL_16;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v13);
  }
  v26 = *(NSObject **)(v27 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke;
  block[3] = &unk_2504578F8;
  block[4] = v27;
  block[5] = a4;
  block[6] = a5;
  block[7] = v30;
  block[8] = a6;
  dispatch_async(v26, block);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  CMIOExtensionDeviceProperties *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  id v32;
  uint64_t v33;
  const char *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[6];
  id v38;
  id v39[9];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
      v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 56));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
      if (v3)
      {
        if ((int)objc_msgSend(v2, "deviceControlPID") < 1
          || (v4 = objc_msgSend(v2, "deviceControlPID"),
              v4 == objc_msgSend((id)objc_msgSend(v3, "clientInfo"), "pid")))
        {
          v39[0] = 0;
          v5 = (void *)objc_msgSend(v2, "_clientQueue_setAndRemoveInternalPropertyValuesForClient:propertyValues:error:", objc_msgSend(v3, "clientInfo"), *(_QWORD *)(a1 + 48), v39);
          if (!v39[0])
          {
            v6 = v5;
            if (objc_msgSend(v5, "count"))
            {
              v7 = -[CMIOExtensionDeviceProperties initWithPropertyValues:]([CMIOExtensionDeviceProperties alloc], "initWithPropertyValues:", v6);
              objc_msgSend((id)objc_msgSend(v2, "source"), "setDeviceProperties:error:", v7, v39);

              if (v39[0])
              {
                v8 = CMIOLog();
                v9 = v8;
                if (v8)
                {
                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                  {
                    v31 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    v32 = v39[0];
                    v33 = objc_msgSend(v39[0], "localizedDescription");
                    *(_DWORD *)buf = 136316162;
                    v41 = v31;
                    v42 = 1024;
                    v43 = 3087;
                    v44 = 2080;
                    v45 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]_block_invoke";
                    v46 = 2114;
                    v47 = v32;
                    v48 = 2114;
                    v49 = v33;
                    _os_log_error_impl(&dword_2330C2000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s setDeviceProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                  }
                }
              }
              v38 = 0;
              v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "devicePropertiesForProperties:error:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", objc_msgSend(v6, "allKeys")), &v38), "propertiesDictionary");
              if (v38)
              {
                v11 = CMIOLog();
                v12 = v11;
                if (v11)
                {
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                  {
                    v34 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    v35 = v38;
                    v36 = objc_msgSend(v38, "localizedDescription");
                    *(_DWORD *)buf = 136316162;
                    v41 = v34;
                    v42 = 1024;
                    v43 = 3103;
                    v44 = 2080;
                    v45 = "-[CMIOExtensionProvider setDevicePropertyValuesForClientID:deviceID:propertyValues:reply:]_block_invoke";
                    v46 = 2114;
                    v47 = v35;
                    v48 = 2114;
                    v49 = v36;
                    _os_log_error_impl(&dword_2330C2000, v12, OS_LOG_TYPE_ERROR, "%s:%d:%s devicePropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                  }
                }
              }
              objc_msgSend(v2, "notifyPropertiesChanged:", v10);
            }
          }
          v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_361;
          v37[3] = &unk_250457880;
          v14 = *(_QWORD *)(a1 + 64);
          v37[4] = v39[0];
          v37[5] = v14;
          dispatch_async(v13, v37);
        }
        else
        {
          v27 = CMIOLog();
          if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_6();
          v28 = *(_QWORD *)(a1 + 64);
          v29 = (void *)MEMORY[0x24BDD1540];
          v50 = *MEMORY[0x24BDD0FC8];
          v51 = CFSTR("Invalid deviceControlPID");
          v30 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v28, objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v30));
        }
      }
      else
      {
        v23 = CMIOLog();
        if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_3();
        v24 = *(_QWORD *)(a1 + 64);
        v25 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BDD0FC8];
        v53 = CFSTR("Invalid clientID");
        v26 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v26));
      }
    }
    else
    {
      v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_2();
      v20 = *(_QWORD *)(a1 + 64);
      v21 = (void *)MEMORY[0x24BDD1540];
      v54 = *MEMORY[0x24BDD0FC8];
      v55 = CFSTR("Invalid property value");
      v22 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v22));
    }
  }
  else
  {
    v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_1();
    v16 = *(_QWORD *)(a1 + 64);
    v17 = (void *)MEMORY[0x24BDD1540];
    v56 = *MEMORY[0x24BDD0FC8];
    v57[0] = CFSTR("Invalid deviceID");
    v18 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v18));
  }
}

uint64_t __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_361(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)availableStreamPropertiesForClientID:(id)a3 streamID:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *clientQueue;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionProvider *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLogLevel(1);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 1024;
      v16 = 3121;
      v17 = 2080;
      v18 = "-[CMIOExtensionProvider availableStreamPropertiesForClientID:streamID:reply:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CMIOExtensionProvider_availableStreamPropertiesForClientID_streamID_reply___block_invoke;
  block[3] = &unk_250457858;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

uint64_t __77__CMIOExtensionProvider_availableStreamPropertiesForClientID_streamID_reply___block_invoke(_QWORD *a1)
{
  id v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  v2 = (id)objc_msgSend(*(id *)(a1[4] + 88), "objectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  if (v2)
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties"), 0);
  v4 = CMIOLog();
  if (v4)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__CMIOExtensionProvider_availableStreamPropertiesForClientID_streamID_reply___block_invoke_cold_1();
  }
  v5 = a1[6];
  v6 = *MEMORY[0x24BDD1100];
  v7 = *MEMORY[0x24BDD0FC8];
  v8[0] = CFSTR("Invalid streamID");
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v5, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v6, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1)));
}

- (void)streamPropertyStatesForClientID:(id)a3 streamID:(id)a4 properties:(id)a5 reply:(id)a6
{
  NSObject *v11;
  NSObject *v12;
  NSObject *clientQueue;
  _QWORD v14[8];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  CMIOExtensionProvider *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v11 = CMIOLogLevel(1);
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v17 = 1024;
      v18 = 3144;
      v19 = 2080;
      v20 = "-[CMIOExtensionProvider streamPropertyStatesForClientID:streamID:properties:reply:]";
      v21 = 2112;
      v22 = self;
      v23 = 2112;
      v24 = a3;
      _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke;
  v14[3] = &unk_2504578D0;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a6;
  dispatch_async(clientQueue, v14);
}

uint64_t __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  uint64_t v19;
  id v20[3];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  v2 = (id)objc_msgSend(*(id *)(a1[4] + 88), "objectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  if (v2)
  {
    v20[0] = 0;
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_msgSend(v2, "_clientQueue_internalPropertyStatesForProperties:", a1[6]);
    if (objc_msgSend(v4, "count"))
      objc_msgSend(v3, "addEntriesFromDictionary:", v4);
    if (a1[6])
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:");
      if (+[CMIOExtensionStream internalProperties](CMIOExtensionStream, "internalProperties"))
        objc_msgSend(v5, "minusSet:", +[CMIOExtensionStream internalProperties](CMIOExtensionStream, "internalProperties"));
    }
    else
    {
      v5 = (void *)objc_msgSend((id)objc_msgSend(v2, "source"), "availableProperties");
      v11 = CMIOLog();
      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v23 = 1024;
          v24 = 3169;
          v25 = 2080;
          v26 = "-[CMIOExtensionProvider streamPropertyStatesForClientID:streamID:properties:reply:]_block_invoke";
          v27 = 2114;
          v28 = v2;
          v29 = 2114;
          v30 = (uint64_t)v5;
          _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, stream availableProperties %{public}@", buf, 0x30u);
        }
      }
    }
    if (objc_msgSend(v5, "count"))
    {
      v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "streamPropertiesForProperties:error:", v5, v20), "propertiesDictionary");
      if (v20[0])
      {
        v14 = CMIOLog();
        v15 = v14;
        if (v14)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            v18 = v20[0];
            v19 = objc_msgSend(v20[0], "localizedDescription");
            *(_DWORD *)buf = 136316162;
            v22 = v17;
            v23 = 1024;
            v24 = 3183;
            v25 = 2080;
            v26 = "-[CMIOExtensionProvider streamPropertyStatesForClientID:streamID:properties:reply:]_block_invoke";
            v27 = 2114;
            v28 = v18;
            v29 = 2114;
            v30 = v19;
            _os_log_error_impl(&dword_2330C2000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
          }
        }
      }
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v3, "addEntriesFromDictionary:", v13);
      }
      else
      {
        v16 = CMIOLog();
        if (v16)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_2();
        }
      }
    }
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_1();
    v7 = a1[7];
    v8 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    v32[0] = CFSTR("Invalid streamID");
    v9 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v7, 0, objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v9));
  }
}

- (void)setStreamPropertyValuesForClientID:(id)a3 streamID:(id)a4 propertyValues:(id)a5 reply:(id)a6
{
  NSObject *v11;
  NSObject *v12;
  NSObject *clientQueue;
  _QWORD block[9];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  CMIOExtensionProvider *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = CMIOLog();
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316419;
      v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v17 = 1024;
      v18 = 3209;
      v19 = 2080;
      v20 = "-[CMIOExtensionProvider setStreamPropertyValuesForClientID:streamID:propertyValues:reply:]";
      v21 = 2114;
      v22 = self;
      v23 = 2113;
      v24 = a3;
      v25 = 2114;
      v26 = a5;
      _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@, propertyValues %{public}@", buf, 0x3Au);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke;
  block[3] = &unk_2504578F8;
  block[4] = self;
  block[5] = a4;
  block[7] = a3;
  block[8] = a6;
  block[6] = a5;
  dispatch_async(clientQueue, block);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  CMIOExtensionStreamProperties *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  id v32;
  uint64_t v33;
  const char *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[6];
  id v38;
  id v39[9];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
      v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 56));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
      if (v3)
      {
        if ((int)objc_msgSend((id)objc_msgSend(v2, "parent"), "deviceControlPID") < 1
          || (v4 = objc_msgSend((id)objc_msgSend(v2, "parent"), "deviceControlPID"),
              v4 == objc_msgSend((id)objc_msgSend(v3, "clientInfo"), "pid")))
        {
          v39[0] = 0;
          v5 = (void *)objc_msgSend(v2, "_clientQueue_setAndRemoveInternalPropertyValuesForClient:propertyValues:error:", objc_msgSend(v3, "clientInfo"), *(_QWORD *)(a1 + 48), v39);
          if (!v39[0])
          {
            v6 = v5;
            if (objc_msgSend(v5, "count"))
            {
              v7 = -[CMIOExtensionStreamProperties initWithPropertyValues:client:]([CMIOExtensionStreamProperties alloc], "initWithPropertyValues:client:", v6, objc_msgSend(v3, "clientInfo"));
              objc_msgSend((id)objc_msgSend(v2, "source"), "setStreamProperties:error:", v7, v39);

              if (v39[0])
              {
                v8 = CMIOLog();
                v9 = v8;
                if (v8)
                {
                  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                  {
                    v34 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    v35 = v39[0];
                    v36 = objc_msgSend(v39[0], "localizedDescription");
                    *(_DWORD *)buf = 136316162;
                    v41 = v34;
                    v42 = 1024;
                    v43 = 3259;
                    v44 = 2080;
                    v45 = "-[CMIOExtensionProvider setStreamPropertyValuesForClientID:streamID:propertyValues:reply:]_block_invoke";
                    v46 = 2114;
                    v47 = v35;
                    v48 = 2114;
                    v49 = v36;
                    _os_log_error_impl(&dword_2330C2000, v9, OS_LOG_TYPE_ERROR, "%s:%d:%s setStreamProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                  }
                }
              }
              v38 = 0;
              v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "source"), "streamPropertiesForProperties:error:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", objc_msgSend(v6, "allKeys")), &v38), "propertiesDictionary");
              if (v38)
              {
                v11 = CMIOLog();
                v12 = v11;
                if (v11)
                {
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                  {
                    v31 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                    v32 = v38;
                    v33 = objc_msgSend(v38, "localizedDescription");
                    *(_DWORD *)buf = 136316162;
                    v41 = v31;
                    v42 = 1024;
                    v43 = 3275;
                    v44 = 2080;
                    v45 = "-[CMIOExtensionProvider setStreamPropertyValuesForClientID:streamID:propertyValues:reply:]_block_invoke";
                    v46 = 2114;
                    v47 = v32;
                    v48 = 2114;
                    v49 = v33;
                    _os_log_error_impl(&dword_2330C2000, v12, OS_LOG_TYPE_ERROR, "%s:%d:%s streamPropertiesForProperties error %{public}@ localizedDescription: %{public}@", buf, 0x30u);
                  }
                }
              }
              objc_msgSend(v2, "notifyPropertiesChanged:", v10);
            }
          }
          v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_364;
          v37[3] = &unk_250457880;
          v14 = *(_QWORD *)(a1 + 64);
          v37[4] = v39[0];
          v37[5] = v14;
          dispatch_async(v13, v37);
        }
        else
        {
          v27 = CMIOLog();
          if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_6();
          v28 = *(_QWORD *)(a1 + 64);
          v29 = (void *)MEMORY[0x24BDD1540];
          v50 = *MEMORY[0x24BDD0FC8];
          v51 = CFSTR("Invalid deviceControlPID");
          v30 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v28, objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v30));
        }
      }
      else
      {
        v23 = CMIOLog();
        if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_3();
        v24 = *(_QWORD *)(a1 + 64);
        v25 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BDD0FC8];
        v53 = CFSTR("Invalid clientID");
        v26 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v26));
      }
    }
    else
    {
      v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_2();
      v20 = *(_QWORD *)(a1 + 64);
      v21 = (void *)MEMORY[0x24BDD1540];
      v54 = *MEMORY[0x24BDD0FC8];
      v55 = CFSTR("Invalid property value");
      v22 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v22));
    }
  }
  else
  {
    v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_1();
    v16 = *(_QWORD *)(a1 + 64);
    v17 = (void *)MEMORY[0x24BDD1540];
    v56 = *MEMORY[0x24BDD0FC8];
    v57[0] = CFSTR("Invalid streamID");
    v18 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v18));
  }
}

uint64_t __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_364(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_clientQueue_incrementPendingStartStreamCountForClientID:(id)a3 streamID:(id)a4
{
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionProvider *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:start-stream"), objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString"));
  v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", v5), "intValue");
  v7 = CMIOLog();
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316675;
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v11 = 1024;
      v12 = 3302;
      v13 = 2080;
      v14 = "-[CMIOExtensionProvider _clientQueue_incrementPendingStartStreamCountForClientID:streamID:]";
      v15 = 2114;
      v16 = self;
      v17 = 2113;
      v18 = v5;
      v19 = 1025;
      v20 = v6;
      v21 = 1025;
      v22 = v6 + 1;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@ : %{private}d => %{private}d", buf, 0x3Cu);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingCountMap, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v6 + 1)), v5);
}

- (void)_clientQueue_decrementPendingStreamStartCountForClientID:(id)a3 streamID:(id)a4
{
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSMutableDictionary *pendingCountMap;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  CMIOExtensionProvider *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:start-stream"), objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString"));
  v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", v5), "intValue");
  v7 = CMIOLog();
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316675;
      v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v14 = 1024;
      v15 = 3311;
      v16 = 2080;
      v17 = "-[CMIOExtensionProvider _clientQueue_decrementPendingStreamStartCountForClientID:streamID:]";
      v18 = 2114;
      v19 = self;
      v20 = 2113;
      v21 = v5;
      v22 = 1025;
      v23 = v6;
      v24 = 1025;
      v25 = v6 - 1;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@ : %{private}d => %{private}d", buf, 0x3Cu);
    }
  }
  if (v6 >= 2)
  {
    v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v6 - 1));
    pendingCountMap = self->_pendingCountMap;
LABEL_11:
    -[NSMutableDictionary setObject:forKeyedSubscript:](pendingCountMap, "setObject:forKeyedSubscript:", v9, v5);
    return;
  }
  if (v6 == 1)
  {
    pendingCountMap = self->_pendingCountMap;
    v9 = 0;
    goto LABEL_11;
  }
  v11 = CMIOLog();
  if (v11)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProvider _clientQueue_decrementPendingStreamStartCountForClientID:streamID:].cold.1();
  }
}

- (int)_clientQueue_pendingStartStreamCountForClient:(id)a3 streamID:(id)a4
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:start-stream"), objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString"))), "intValue");
}

- (void)_clientQueue_removePendingStartStreamCountForClient:(id)a3 streamID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  int v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionProvider *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:start-stream"), objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString"));
  v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", v5);
  v7 = CMIOLog();
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        v10 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCountMap, "objectForKeyedSubscript:", v5), "intValue");
        *(_DWORD *)buf = 136316419;
        v12 = v9;
        v13 = 1024;
        v14 = 3333;
        v15 = 2080;
        v16 = "-[CMIOExtensionProvider _clientQueue_removePendingStartStreamCountForClient:streamID:]";
        v17 = 2112;
        v18 = self;
        v19 = 2113;
        v20 = v5;
        v21 = 1024;
        v22 = v10;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@{public}, %{private}@: forcing pending stream start count %d => 0", buf, 0x36u);
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingCountMap, "setObject:forKeyedSubscript:", 0, v5);
  }
  else if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316163;
    v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    v13 = 1024;
    v14 = 3337;
    v15 = 2080;
    v16 = "-[CMIOExtensionProvider _clientQueue_removePendingStartStreamCountForClient:streamID:]";
    v17 = 2112;
    v18 = self;
    v19 = 2113;
    v20 = v5;
    _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@{public}, %{private}@: no pending stream starts", buf, 0x30u);
  }
}

- (void)startStreamForClientID:(id)a3 streamID:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *clientQueue;
  _QWORD v12[8];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionProvider *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLog();
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316163;
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 1024;
      v16 = 3343;
      v17 = 2080;
      v18 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]";
      v19 = 2114;
      v20 = self;
      v21 = 2113;
      v22 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke;
  v12[3] = &unk_2504578D0;
  v12[4] = self;
  v12[5] = a4;
  v12[6] = a3;
  v12[7] = a5;
  dispatch_async(clientQueue, v12);
}

uint64_t __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t i;
  CMMediaType MediaType;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[6];
  int8x16_t v44;
  char v45;
  char v46;
  _QWORD v47[6];
  int8x16_t v48;
  char v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  _BYTE v64[10];
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  _BYTE v69[128];
  uint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  _QWORD v75[4];

  v75[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  if (!v2)
  {
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_1();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = (void *)MEMORY[0x24BDD1540];
    v74 = *MEMORY[0x24BDD0FC8];
    v75[0] = CFSTR("Invalid streamID");
    v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v11, objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v13));
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 48));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  if (!v3)
  {
    v14 = CMIOLog();
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_2();
    v15 = *(_QWORD *)(a1 + 56);
    v16 = (void *)MEMORY[0x24BDD1540];
    v72 = *MEMORY[0x24BDD0FC8];
    v73 = CFSTR("Invalid clientID");
    v17 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v15, objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v17));
  }
  v4 = objc_msgSend(v3, "clientInfo");
  if ((objc_msgSend((id)objc_msgSend(v2, "source"), "authorizedToStartStreamForClient:", v4) & 1) == 0)
  {
    v34 = CMIOLog();
    v35 = v34;
    if (v34 && os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v36 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v37 = *(_QWORD *)(a1 + 32);
      v38 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136316163;
      v56 = v36;
      v57 = 1024;
      v58 = 3380;
      v59 = 2080;
      v60 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]_block_invoke";
      v61 = 2114;
      v62 = v37;
      v63 = 2113;
      *(_QWORD *)v64 = v38;
      _os_log_impl(&dword_2330C2000, v35, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: refusing streaming for clientID %{private}@", buf, 0x30u);
    }
    v39 = *(_QWORD *)(a1 + 56);
    v40 = (void *)MEMORY[0x24BDD1540];
    v70 = *MEMORY[0x24BDD0FC8];
    v71 = CFSTR("Refusing streaming request");
    v41 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 16))(v39, objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -4, v41));
  }
  if (objc_msgSend(v2, "direction"))
  {
    v5 = 0;
    v6 = 0;
LABEL_6:
    v7 = 0;
    v8 = 0;
    goto LABEL_7;
  }
  v42 = (void *)v4;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v26 = (void *)objc_msgSend((id)objc_msgSend(v2, "source"), "formats");
  v6 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
  if (!v6)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v27 = 0;
  v28 = 0;
  v29 = *(_QWORD *)v52;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v52 != v29)
        objc_enumerationMutation(v26);
      MediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "formatDescription"));
      if (MediaType == 1836415096)
      {
        v27 = 1;
LABEL_43:
        v28 = 1;
        goto LABEL_44;
      }
      if (MediaType != 1936684398)
        goto LABEL_43;
      v27 = 1;
LABEL_44:
      v8 = v28 & 1;
      if ((v27 & 1) != 0 && (v28 & 1) != 0)
        goto LABEL_50;
    }
    v6 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
    if (v6)
      continue;
    break;
  }
  if ((v27 & 1) == 0)
  {
    v5 = 0;
    v7 = 0;
    goto LABEL_57;
  }
LABEL_50:
  if (!objc_msgSend(v42, "microphoneAuthorizationStatus"))
    objc_msgSend(v42, "authorizationStatusForMediaType:", 1936684398);
  v7 = objc_msgSend(v42, "microphoneAuthorizationStatus") != 3;
  if (objc_msgSend(v42, "microphoneAuthorizationStatus"))
  {
    v5 = 1;
  }
  else
  {
    v5 = 1;
    if ((objc_msgSend(v42, "hasPendingMicrophoneAuthorizationRequest") & 1) == 0)
    {
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_367;
      v47[3] = &unk_250457920;
      v32 = *(_QWORD *)(a1 + 32);
      v49 = v28 & 1;
      v47[4] = v32;
      v47[5] = v42;
      v48 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      v50 = 1;
      objc_msgSend(v42, "requestAccessForMediaType:performPreFlightTest:reply:", 1936684398, 0, v47);
    }
  }
LABEL_57:
  v6 = v8 != 0;
  if ((v28 & 1) != 0)
  {
    if (!objc_msgSend(v42, "cameraAuthorizationStatus"))
      objc_msgSend(v42, "authorizationStatusForMediaType:", 1986618469);
    v8 = objc_msgSend(v42, "cameraAuthorizationStatus") != 3;
    if (objc_msgSend(v42, "cameraAuthorizationStatus"))
    {
      v6 = 1;
    }
    else
    {
      v6 = 1;
      if ((objc_msgSend(v42, "hasPendingCameraAuthorizationRequest") & 1) == 0)
      {
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_369;
        v43[3] = &unk_250457920;
        v33 = *(_QWORD *)(a1 + 32);
        v45 = v5;
        v43[4] = v33;
        v43[5] = v42;
        v44 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
        v46 = 1;
        objc_msgSend(v42, "requestAccessForMediaType:performPreFlightTest:reply:", 1986618469, 0, v43);
      }
    }
  }
LABEL_7:
  if (!v7 && !v8)
    return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v5, v6, *(_QWORD *)(a1 + 56));
  v18 = CMIOLog();
  v19 = v18;
  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    v21 = *(_QWORD *)(a1 + 32);
    if (v7)
      v22 = 84;
    else
      v22 = 70;
    *(_DWORD *)buf = 136316930;
    if (v8)
      v23 = 84;
    else
      v23 = 70;
    v56 = v20;
    v58 = 3455;
    if ((_DWORD)v5)
      v24 = 84;
    else
      v24 = 70;
    v57 = 1024;
    v59 = 2080;
    v60 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]_block_invoke";
    if ((_DWORD)v6)
      v25 = 84;
    else
      v25 = 70;
    v61 = 2114;
    v62 = v21;
    v63 = 1024;
    *(_DWORD *)v64 = v22;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = v23;
    v65 = 1024;
    v66 = v24;
    v67 = 1024;
    v68 = v25;
    _os_log_impl(&dword_2330C2000, v19, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: waiting for authorization (audio %c, video %c), requesting audio %c, video %c... returning no error so we don't jam up the caller", buf, 0x3Eu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_clientQueue_incrementPendingStartStreamCountForClientID:streamID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_367(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  _BOOL8 v9;
  _BYTE v10[12];
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = CMIOLog();
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v10 = 136316162;
      if (a2 == 3)
        v8 = 89;
      else
        v8 = 78;
      *(_QWORD *)&v10[4] = v6;
      v11 = 1024;
      v12 = 3419;
      v13 = 2080;
      v14 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]_block_invoke";
      v15 = 2114;
      v16 = v7;
      v17 = 1024;
      v18 = v8;
      _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: authorized for microphone %c", v10, 0x2Cu);
    }
  }
  if (a2 == 3)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "cameraAuthorizationStatus") != 3)
        return;
      v9 = *(_BYTE *)(a1 + 64) != 0;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v9, *(unsigned __int8 *)(a1 + 65), *(_QWORD *)v10);
  }
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_369(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  _BOOL8 v9;
  _BYTE v10[12];
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = CMIOLog();
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v10 = 136316162;
      if (a2 == 3)
        v8 = 89;
      else
        v8 = 78;
      *(_QWORD *)&v10[4] = v6;
      v11 = 1024;
      v12 = 3442;
      v13 = 2080;
      v14 = "-[CMIOExtensionProvider startStreamForClientID:streamID:reply:]_block_invoke";
      v15 = 2114;
      v16 = v7;
      v17 = 1024;
      v18 = v8;
      _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: authorized for camera %c", v10, 0x2Cu);
    }
  }
  if (a2 == 3)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "microphoneAuthorizationStatus") != 3)
        return;
      v9 = *(_BYTE *)(a1 + 64) != 0;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 65), v9, *(_QWORD *)v10);
  }
}

- (void)_clientQueue_startStreamForClientID:(id)a3 streamID:(id)a4 requestAudio:(BOOL)a5 requestVideo:(BOOL)a6 reply:(id)a7
{
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  int v28;
  int v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  _QWORD v34[3];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  _BYTE v42[10];
  _QWORD v43[2];
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v11 = CMIOLog();
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316163;
      v36 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v37 = 1024;
      v38 = 3467;
      v39 = 2080;
      v40 = "-[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]";
      v41 = 2114;
      *(_QWORD *)v42 = self;
      *(_WORD *)&v42[8] = 2113;
      v43[0] = a3;
      _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@", buf, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_streamsMapLock);
  v13 = (id)-[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", a4);
  os_unfair_lock_unlock(&self->_streamsMapLock);
  if (v13)
  {
    os_unfair_lock_lock(&self->_contextsMapLock);
    v14 = (id)-[NSMutableDictionary objectForKey:](self->_contextsMap, "objectForKey:", a3);
    os_unfair_lock_unlock(&self->_contextsMapLock);
    if (v14)
    {
      v15 = (void *)objc_msgSend(v14, "clientInfo");
      v34[0] = 0;
      if (objc_msgSend((id)objc_msgSend(v13, "_clientQueue_streamingClientsMap"), "count"))
      {
        v16 = CMIOLog();
        v17 = v16;
        if (v16)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            *(_DWORD *)buf = 136316163;
            v36 = v18;
            v37 = 1024;
            v38 = 3518;
            v39 = 2080;
            v40 = "-[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]";
            v41 = 2114;
            *(_QWORD *)v42 = self;
            *(_WORD *)&v42[8] = 2113;
            v43[0] = v15;
            _os_log_impl(&dword_2330C2000, v17, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: add streaming client %{private}@", buf, 0x30u);
          }
        }
        objc_msgSend(v13, "_clientQueue_addStreamingClient:", v15);
      }
      else
      {
        objc_msgSend(v14, "setClientSourcedByNonStreamingProxyFrontedExtension:", -[NSArray containsObject:](self->_nonStreamingProxyFrontedExtensionPIDs, "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v15, "pid"))));
        v25 = CMIOLog();
        v26 = v25;
        if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v27 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v28 = objc_msgSend(v15, "pid");
          v29 = objc_msgSend(v14, "isClientSourcedByNonStreamingProxyFrontedExtension");
          *(_DWORD *)buf = 136316419;
          if (v29)
            v30 = 84;
          else
            v30 = 70;
          v36 = v27;
          v37 = 1024;
          v38 = 3501;
          v39 = 2080;
          v40 = "-[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]";
          v41 = 1025;
          *(_DWORD *)v42 = v28;
          *(_WORD *)&v42[4] = 1024;
          *(_DWORD *)&v42[6] = v30;
          LOWORD(v43[0]) = 2112;
          *(_QWORD *)((char *)v43 + 2) = v14;
          _os_log_impl(&dword_2330C2000, v26, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] set proxy streaming status to %c for %@", buf, 0x32u);
        }
        if (objc_msgSend((id)objc_msgSend(v13, "source"), "startStreamAndReturnError:", v34))
        {
          v31 = CMIOLog();
          v32 = v31;
          if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v33 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            *(_DWORD *)buf = 136316163;
            v36 = v33;
            v37 = 1024;
            v38 = 3511;
            v39 = 2080;
            v40 = "-[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]";
            v41 = 2114;
            *(_QWORD *)v42 = self;
            *(_WORD *)&v42[8] = 2113;
            v43[0] = v15;
            _os_log_impl(&dword_2330C2000, v32, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: start streaming for client %{private}@", buf, 0x30u);
          }
          objc_msgSend(v13, "_clientQueue_addStreamingClient:", v15);
          -[CMIOExtensionProvider _clientQueue_notifyIsRunningSomewhereForStream:](self, "_clientQueue_notifyIsRunningSomewhereForStream:", v13);
        }
      }
      (*((void (**)(id, _QWORD))a7 + 2))(a7, v34[0]);
    }
    else
    {
      v22 = CMIOLog();
      if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:].cold.2();
      v23 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD0FC8];
      v45 = CFSTR("Invalid clientID");
      v24 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      (*((void (**)(id, uint64_t))a7 + 2))(a7, objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v24));
    }
  }
  else
  {
    v19 = CMIOLog();
    if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:].cold.1();
    v20 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0FC8];
    v47[0] = CFSTR("Invalid streamID");
    v21 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    (*((void (**)(id, uint64_t))a7 + 2))(a7, objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v21));
  }
}

- (void)_performDeferredStreamStartsForClient:(id)a3 streamID:(id)a4 requestVideo:(BOOL)a5 requestAudio:(BOOL)a6
{
  NSObject *v11;
  NSObject *v12;
  NSObject *clientQueue;
  _QWORD v14[7];
  BOOL v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProvider *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v11 = CMIOLog();
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v19 = 1024;
      v20 = 3568;
      v21 = 2080;
      v22 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]";
      v23 = 2114;
      v24 = self;
      _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: dispatching pending stream starting to client queue", buf, 0x26u);
    }
  }
  clientQueue = self->_clientQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke;
  v14[3] = &unk_250457970;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v15 = a6;
  v16 = a5;
  dispatch_async(clientQueue, v14);
}

void __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  __int128 v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[6];
  _QWORD v21[3];
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_clientQueue_pendingStartStreamCountForClient:streamID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_clientQueue_removePendingStartStreamCountForClient:streamID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = CMIOLog();
  if (v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      v24 = v6;
      v25 = 1024;
      v26 = 3572;
      v27 = 2080;
      v28 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]_block_invoke";
      v29 = 2114;
      v30 = v7;
      v31 = 1024;
      v32 = v2;
      _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: %d stream starts are pending", buf, 0x2Cu);
    }
  }
  if (v2 >= 1)
  {
    v8 = 0;
    v9 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v4 = 136316162;
    v19 = v4;
    do
    {
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v22 = v8 + 1;
      v10 = CMIOLog();
      v11 = v10;
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
          v13 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = v19;
          v24 = v12;
          v25 = 1024;
          v26 = 3576;
          v27 = 2080;
          v28 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]_block_invoke";
          v29 = 2114;
          v30 = v13;
          v31 = 1024;
          v32 = v8 + 1;
          _os_log_impl(&dword_2330C2000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: attempting deferred stream start %d", buf, 0x2Cu);
        }
      }
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(unsigned __int8 *)(a1 + 56);
      v18 = *(unsigned __int8 *)(a1 + 57);
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke_370;
      v20[3] = &unk_250457948;
      v20[4] = v14;
      v20[5] = v21;
      objc_msgSend(v14, "_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:", v15, v16, v17, v18, v20, v19);
      _Block_object_dispose(v21, 8);
      ++v8;
    }
    while (v2 != v8);
  }
}

void __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke_370(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = CMIOLog();
  v5 = v4;
  if (a2)
  {
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke_370_cold_1();
    }
  }
  else if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v9 = 136316162;
    v10 = v6;
    v11 = 1024;
    v12 = 3582;
    v13 = 2080;
    v14 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]_block_invoke";
    v15 = 2114;
    v16 = v7;
    v17 = 1026;
    v18 = v8;
    _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: startStream %{public}d succeeded", (uint8_t *)&v9, 0x2Cu);
  }
}

- (void)stopStreamForClientID:(id)a3 streamID:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *clientQueue;
  _QWORD v12[8];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionProvider *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLog();
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316163;
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 1024;
      v16 = 3592;
      v17 = 2080;
      v18 = "-[CMIOExtensionProvider stopStreamForClientID:streamID:reply:]";
      v19 = 2114;
      v20 = self;
      v21 = 2113;
      v22 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, %{private}@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke;
  v12[3] = &unk_250457998;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  dispatch_async(clientQueue, v12);
}

uint64_t __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_clientQueue_pendingStartStreamCountForClient:streamID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (v3 < 1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
    v10 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", *(_QWORD *)(a1 + 48));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
    if (v10)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
      v11 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
      if (v11)
      {
        v12 = objc_msgSend(v11, "clientInfo");
        v31 = 0;
        v13 = (void *)objc_msgSend(v10, "_clientQueue_streamingClientsMap");
        if (objc_msgSend(v13, "objectForKey:", *v2) && objc_msgSend(v13, "count") == 1)
        {
          if ((objc_msgSend((id)objc_msgSend(v10, "source"), "stopStreamAndReturnError:", &v31) & 1) == 0)
          {
            v14 = CMIOLog();
            if (v14)
            {
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_3();
            }
          }
          objc_msgSend(v10, "_clientQueue_removeStreamingClient:", v12);
          v15 = CMIOLog();
          v16 = v15;
          if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
            v18 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 136316163;
            v33 = v17;
            v34 = 1024;
            v35 = 3646;
            v36 = 2080;
            v37 = "-[CMIOExtensionProvider stopStreamForClientID:streamID:reply:]_block_invoke";
            v38 = 2114;
            v39 = v18;
            v40 = 2113;
            v41 = v12;
            _os_log_impl(&dword_2330C2000, v16, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, stop streaming for client %{private}@", buf, 0x30u);
          }
          objc_msgSend(*(id *)(a1 + 32), "_clientQueue_notifyIsRunningSomewhereForStream:", v10);
        }
        else
        {
          objc_msgSend(v10, "_clientQueue_removeStreamingClient:", v12);
          v23 = CMIOLog();
          if (v23)
          {
            v24 = v23;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v25 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              v26 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 136316163;
              v33 = v25;
              v34 = 1024;
              v35 = 3653;
              v36 = 2080;
              v37 = "-[CMIOExtensionProvider stopStreamForClientID:streamID:reply:]_block_invoke";
              v38 = 2114;
              v39 = v26;
              v40 = 2113;
              v41 = v12;
              _os_log_impl(&dword_2330C2000, v24, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@, removed streaming client %{private}@", buf, 0x30u);
            }
          }
        }
        if (!objc_msgSend(v10, "direction"))
          objc_msgSend(*(id *)(a1 + 32), "removeSystemStatusAttributionsForClient:stream:", v12, v10);
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        v27 = CMIOLog();
        if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_2();
        v28 = *(_QWORD *)(a1 + 56);
        v29 = (void *)MEMORY[0x24BDD1540];
        v42 = *MEMORY[0x24BDD0FC8];
        v43 = CFSTR("Invalid clientID");
        v30 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 16))(v28, objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v30));
      }
    }
    else
    {
      v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_1();
      v20 = *(_QWORD *)(a1 + 56);
      v21 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD0FC8];
      v45[0] = CFSTR("Invalid streamID");
      v22 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(v20, objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v22));
    }
  }
  else
  {
    v4 = v3;
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        v33 = v7;
        v34 = 1024;
        v35 = 3598;
        v36 = 2080;
        v37 = "-[CMIOExtensionProvider stopStreamForClientID:streamID:reply:]_block_invoke";
        v38 = 2114;
        v39 = v8;
        v40 = 1024;
        LODWORD(v41) = v4;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{public}@: stop called for pending deferred start %d... just returning", buf, 0x2Cu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_clientQueue_decrementPendingStreamStartCountForClientID:streamID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)notifyAvailableDevicesChanged:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *changedDeviceIDs;
  NSObject *clientQueue;
  _QWORD block[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CMIOExtensionProvider *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v22 = 1024;
      v23 = 3666;
      v24 = 2080;
      v25 = "-[CMIOExtensionProvider notifyAvailableDevicesChanged:]";
      v26 = 2112;
      v27 = self;
      v28 = 2112;
      v29 = a3;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  v7 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(a3);
        -[NSArray addObject:](v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "UUIDString"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  os_unfair_lock_lock(&self->_changedDeviceIDsLock);
  changedDeviceIDs = self->_changedDeviceIDs;
  self->_changedDeviceIDs = v7;
  os_unfair_lock_unlock(&self->_changedDeviceIDsLock);

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CMIOExtensionProvider_notifyAvailableDevicesChanged___block_invoke;
  block[3] = &unk_2504576D0;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

void __55__CMIOExtensionProvider_notifyAvailableDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "availableDevicesChanged:", v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)notifyAvailableStreamsChangedWithDeviceID:(id)a3 streamIDs:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *changedStreamIDs;
  NSObject *clientQueue;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  CMIOExtensionProvider *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v24 = 1024;
      v25 = 3709;
      v26 = 2080;
      v27 = "-[CMIOExtensionProvider notifyAvailableStreamsChangedWithDeviceID:streamIDs:]";
      v28 = 2112;
      v29 = self;
      v30 = 2112;
      v31 = a3;
      v32 = 2112;
      v33 = a4;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@, %@", buf, 0x3Au);
    }
  }
  v9 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(a4);
        -[NSArray addObject:](v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++), "UUIDString"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  os_unfair_lock_lock(&self->_changedStreamIDsLock);
  changedStreamIDs = self->_changedStreamIDs;
  self->_changedStreamIDs = v9;
  os_unfair_lock_unlock(&self->_changedStreamIDsLock);

  clientQueue = self->_clientQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __77__CMIOExtensionProvider_notifyAvailableStreamsChangedWithDeviceID_streamIDs___block_invoke;
  v16[3] = &unk_2504577C0;
  v16[4] = self;
  v16[5] = a3;
  dispatch_async(clientQueue, v16);
}

void __77__CMIOExtensionProvider_notifyAvailableStreamsChangedWithDeviceID_streamIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 128));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 128));
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "availableStreamsChangedWithDeviceID:streamIDs:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"), v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)captureAsyncStillImageForClientID:(id)a3 streamID:(id)a4 uniqueID:(int64_t)a5 options:(id)a6 reply:(id)a7
{
  NSObject *v13;
  NSObject *v14;
  NSObject *clientQueue;
  _QWORD v16[10];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionProvider *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v13 = CMIOLogLevel(1);
  if (v13)
  {
    v14 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v19 = 1024;
      v20 = 3752;
      v21 = 2080;
      v22 = "-[CMIOExtensionProvider captureAsyncStillImageForClientID:streamID:uniqueID:options:reply:]";
      v23 = 2112;
      v24 = self;
      v25 = 2112;
      v26 = a3;
      v27 = 2112;
      v28 = a4;
      _os_log_impl(&dword_2330C2000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@, %@", buf, 0x3Au);
    }
  }
  clientQueue = self->_clientQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke;
  v16[3] = &unk_2504579E8;
  v16[4] = self;
  v16[5] = a4;
  v16[8] = a7;
  v16[9] = a5;
  v16[6] = a3;
  v16[7] = a6;
  dispatch_async(clientQueue, v16);
}

uint64_t __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[12];
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  v2 = (id)objc_msgSend(*(id *)(a1[4] + 88), "objectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
    v3 = (id)objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[6]);
    objc_msgSend(v3, "setClientSourcedByNonStreamingProxyFrontedExtension:", objc_msgSend(*(id *)(a1[4] + 160), "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(v3, "clientInfo"), "pid"))));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
    if (v3)
    {
      if (objc_msgSend(v3, "isClientSourcedByNonStreamingProxyFrontedExtension"))
      {
        v4 = CMIOLog();
        if (v4)
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
            __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_3();
        }
        v5 = a1[8];
        v6 = (void *)MEMORY[0x24BDD1540];
        v20 = *MEMORY[0x24BDD0FC8];
        v21 = CFSTR("Client is fronted by proxy that is not streaming");
        v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v5, 0, objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v7));
      }
      else
      {
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_373;
        v19[3] = &unk_2504579C0;
        v17 = a1[7];
        v18 = a1[9];
        v19[4] = a1[8];
        return objc_msgSend(v2, "captureAsyncStillImage:options:completionHandler:", v18, v17, v19);
      }
    }
    else
    {
      v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_2();
      v14 = a1[8];
      v15 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      v23 = CFSTR("Invalid clientID");
      v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v14 + 16))(v14, 0, objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v16));
    }
  }
  else
  {
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_1();
    v10 = a1[8];
    v11 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    v25[0] = CFSTR("Invalid streamID");
    v12 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v10, 0, objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v12));
  }
}

uint64_t __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_373(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a3, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enqueueReactionEffectForClientID:(id)a3 streamID:(id)a4 reactionType:(id)a5 reply:(id)a6
{
  NSObject *v11;
  NSObject *v12;
  NSObject *clientQueue;
  _QWORD block[9];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  CMIOExtensionProvider *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = CMIOLogLevel(1);
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v17 = 1024;
      v18 = 3804;
      v19 = 2080;
      v20 = "-[CMIOExtensionProvider enqueueReactionEffectForClientID:streamID:reactionType:reply:]";
      v21 = 2112;
      v22 = self;
      v23 = 2112;
      v24 = a3;
      v25 = 2112;
      v26 = a4;
      _os_log_impl(&dword_2330C2000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@, %@", buf, 0x3Au);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke;
  block[3] = &unk_2504578F8;
  block[4] = self;
  block[5] = a4;
  block[7] = a5;
  block[8] = a6;
  block[6] = a3;
  dispatch_async(clientQueue, block);
}

uint64_t __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[12];
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  v2 = (id)objc_msgSend(*(id *)(a1[4] + 88), "objectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
    v3 = (id)objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
    if (v3)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_376;
      v14[3] = &unk_250457A10;
      v4 = a1[7];
      v14[4] = a1[8];
      return objc_msgSend(v2, "enqueueReactionEffect:completionHandler:", v4, v14);
    }
    else
    {
      v10 = CMIOLog();
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_2();
      }
      v11 = a1[8];
      v12 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD0FC8];
      v16 = CFSTR("Invalid clientID");
      v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v11, objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v13));
    }
  }
  else
  {
    v6 = CMIOLog();
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_1();
    v7 = a1[8];
    v8 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("Invalid streamID");
    v9 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -50, v9));
  }
}

uint64_t __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_376(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_clientQueue_notifyDevicePropertiesChangedWithDeviceID:(id)a3 propertyStates:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  os_unfair_lock_s *p_contextsMapLock;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CMIOExtensionProvider *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v22 = 1024;
      v23 = 3850;
      v24 = 2080;
      v25 = "-[CMIOExtensionProvider _clientQueue_notifyDevicePropertiesChangedWithDeviceID:propertyStates:]";
      v26 = 2112;
      v27 = self;
      v28 = 2112;
      v29 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  p_contextsMapLock = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  v10 = (void *)-[NSMutableDictionary allValues](self->_contextsMap, "allValues");
  os_unfair_lock_unlock(p_contextsMapLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "devicePropertiesChangedWithDeviceID:propertyStates:", objc_msgSend(a3, "UUIDString"), a4);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
}

- (void)_clientQueue_notifyStreamPropertiesChangedWithStreamID:(id)a3 propertyStates:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  os_unfair_lock_s *p_contextsMapLock;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CMIOExtensionProvider *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v21 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v22 = 1024;
      v23 = 3866;
      v24 = 2080;
      v25 = "-[CMIOExtensionProvider _clientQueue_notifyStreamPropertiesChangedWithStreamID:propertyStates:]";
      v26 = 2112;
      v27 = self;
      v28 = 2112;
      v29 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  p_contextsMapLock = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  v10 = (void *)-[NSMutableDictionary allValues](self->_contextsMap, "allValues");
  os_unfair_lock_unlock(p_contextsMapLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "streamPropertiesChangedWithStreamID:propertyStates:", objc_msgSend(a3, "UUIDString"), a4);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
}

- (void)_clientQueue_notifyIsRunningSomewhereForStream:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  CMIOExtensionPropertyState *v14;
  CMIOExtensionPropertyState *v15;
  CMIOExtensionPropertyState *v16;
  CMIOExtensionPropertyState *v17;
  CMIOExtensionPropertyState *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  CMIOExtensionProvider *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLogLevel(1);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v30 = 1024;
      v31 = 3882;
      v32 = 2080;
      v33 = "-[CMIOExtensionProvider _clientQueue_notifyIsRunningSomewhereForStream:]";
      v34 = 2112;
      v35 = self;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
    }
  }
  v7 = (void *)objc_msgSend(a3, "parent");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = (void *)objc_msgSend(v7, "streams", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (!v9)
  {
    if ((objc_msgSend(v7, "isRunningSomewhere") & 1) == 0)
      return;
    v11 = 0;
    goto LABEL_15;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v8);
      v11 |= objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "_clientQueue_streamingClientsMap"), "count") != 0;
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  }
  while (v10);
  if ((v11 & 1) != objc_msgSend(v7, "isRunningSomewhere"))
  {
LABEL_15:
    objc_msgSend(v7, "setRunningSomewhere:", v11 & 1);
    v14 = [CMIOExtensionPropertyState alloc];
    v15 = -[CMIOExtensionPropertyState initWithValue:attributes:](v14, "initWithValue:attributes:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11 & 1), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    v16 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", objc_msgSend((id)objc_msgSend(a3, "streamID"), "UUIDString"), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    v17 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", objc_msgSend((id)objc_msgSend(v7, "deviceID"), "UUIDString"), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    if (objc_msgSend(v7, "legacyDeviceID")
      && (objc_msgSend((id)objc_msgSend(v7, "legacyDeviceID"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v7, "deviceID"), "UUIDString")) & 1) == 0)
    {
      v18 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", objc_msgSend(v7, "legacyDeviceID"), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    }
    else
    {
      v18 = 0;
    }
    v25[0] = 0x2504595B8;
    v25[1] = 0x2504595D8;
    v26[0] = v15;
    v26[1] = v16;
    v25[2] = 0x250459558;
    v26[2] = v17;
    v19 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
    v20 = v19;
    if (v18)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, 0x250459578);

    objc_msgSend(v7, "notifyPropertiesChanged:", v20);
  }
}

- (void)_clientQueue_sendSampleForStream:(id)a3 sample:(id)a4
{
  id v4;
  const opaqueCMFormatDescription *FormatDescription;
  NSObject *v8;
  NSObject *v9;
  os_unfair_lock_s *p_contextsMapLock;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  __int128 v28;
  uint64_t v29;
  id v30;
  CMMediaType MediaType;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  CMIOExtensionProvider *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  CMMediaType v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  uint64_t v60;

  v4 = a4;
  v60 = *MEMORY[0x24BDAC8D0];
  FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)objc_msgSend(a4, "sampleBuffer"));
  MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
  v8 = CMIOLogLevel(3);
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317186;
      v43 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v44 = 1024;
      v45 = 3922;
      v46 = 2080;
      v47 = "-[CMIOExtensionProvider _clientQueue_sendSampleForStream:sample:]";
      v48 = 2112;
      v49 = self;
      v50 = 2112;
      v51 = a3;
      v52 = 1024;
      v53 = HIBYTE(MediaType);
      v54 = 1024;
      v55 = BYTE2(MediaType);
      v56 = 1024;
      v57 = BYTE1(MediaType);
      v58 = 1024;
      v59 = MediaType;
      _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@ %c%c%c%c", buf, 0x48u);
    }
  }
  p_contextsMapLock = &self->_contextsMapLock;
  os_unfair_lock_lock(&self->_contextsMapLock);
  v11 = (void *)-[NSMutableDictionary allValues](self->_contextsMap, "allValues");
  v12 = v11;
  if (self->_nonStreamingProxyFrontedExtensionPIDsHasChanged)
  {
    v30 = v4;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "setClientSourcedByNonStreamingProxyFrontedExtension:", -[NSArray containsObject:](self->_nonStreamingProxyFrontedExtensionPIDs, "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "clientInfo"), "pid"))));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v14);
    }
    self->_nonStreamingProxyFrontedExtensionPIDsHasChanged = 0;
    p_contextsMapLock = &self->_contextsMapLock;
    v4 = v30;
  }
  os_unfair_lock_unlock(p_contextsMapLock);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v33;
    HIDWORD(v29) = BYTE1(MediaType);
    LODWORD(v29) = MediaType;
    *(_QWORD *)&v18 = 136317186;
    v28 = v18;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v12);
        v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(a3, "_clientQueue_streamingClientsMap", v28, v29), "objectForKey:", objc_msgSend((id)objc_msgSend(v22, "clientInfo"), "clientID")))
        {
          v23 = (void *)objc_msgSend(v22, "clientInfo");
          if (MediaType == 1936684398)
            v24 = objc_msgSend(v23, "microphoneAuthorizationStatus");
          else
            v24 = objc_msgSend(v23, "cameraAuthorizationStatus");
          if (v24 == 3)
          {
            if ((objc_msgSend(v22, "isClientSourcedByNonStreamingProxyFrontedExtension") & 1) == 0)
              objc_msgSend(v22, "receivedSampleWithStreamID:sample:", objc_msgSend((id)objc_msgSend(a3, "streamID"), "UUIDString"), v4);
          }
          else
          {
            v25 = CMIOLogLevel(3);
            if (v25)
            {
              v26 = v25;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v27 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
                *(_DWORD *)buf = v28;
                v43 = v27;
                v44 = 1024;
                v45 = 3953;
                v46 = 2080;
                v47 = "-[CMIOExtensionProvider _clientQueue_sendSampleForStream:sample:]";
                v48 = 2112;
                v49 = self;
                v50 = 2112;
                v51 = a3;
                v52 = 1024;
                v53 = HIBYTE(MediaType);
                v54 = 1024;
                v55 = BYTE2(MediaType);
                v56 = 1024;
                v57 = HIDWORD(v29);
                v58 = 1024;
                v59 = v29;
                _os_log_impl(&dword_2330C2000, v26, OS_LOG_TYPE_DEFAULT, "%s:%d:%s not authorized %@, %@ %c%c%c%c", buf, 0x48u);
              }
            }
          }
        }
      }
      v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v19);
  }
}

- (void)consumeSampleBufferForStream:(id)a3 client:(id)a4 reply:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *clientQueue;
  _QWORD v12[8];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  CMIOExtensionProvider *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = CMIOLogLevel(3);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v14 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v15 = 1024;
      v16 = 3961;
      v17 = 2080;
      v18 = "-[CMIOExtensionProvider consumeSampleBufferForStream:client:reply:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = a3;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke;
  v12[3] = &unk_2504578D0;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = self;
  v12[7] = a5;
  dispatch_async(clientQueue, v12);
}

uint64_t __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  NSObject *v14;
  _QWORD v15[5];
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_clientQueue_streamingClientsMap"), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "clientID")))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 80));
    v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "clientID"));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 80));
    if (v2)
    {
      v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "streamID"), "UUIDString");
      v4 = *(_QWORD *)(a1 + 56);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_381;
      v15[3] = &unk_250457A38;
      v15[4] = v4;
      return objc_msgSend(v2, "pullSampleBufferForStreamID:replyq:reply:", v3, v5, v15);
    }
    v14 = CMIOLog();
    if (v14)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_cold_2();
    }
    v8 = *(_QWORD *)(a1 + 56);
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD1100];
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("Invalid clientID");
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = &v17;
    v13 = &v16;
  }
  else
  {
    v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_cold_1();
    v8 = *(_QWORD *)(a1 + 56);
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD1100];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = CFSTR("Invalid not streaming");
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = (const __CFString **)v19;
    v13 = &v18;
  }
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(v8 + 16))(v8, 0, 0, 0, 0, objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -50, objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1)));
}

uint64_t __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_381(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  const void *v8;
  CFTypeRef v9;
  const void *v10;
  CFTypeID TypeID;
  const void *v12;
  CFTypeRef v13;
  const void *v14;
  CFTypeID v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unsigned int valuePtr;

  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  valuePtr = 0;
  v19 = 0;
  v8 = (const void *)objc_msgSend(a2, "sampleBuffer");
  v9 = CMGetAttachment(v8, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, 0);
  if (v9)
  {
    v10 = v9;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v10) && !CFNumberGetValue((CFNumberRef)v10, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 0;
  }
  v12 = (const void *)objc_msgSend(a2, "sampleBuffer");
  v13 = CMGetAttachment(v12, kCMIOSampleBufferAttachmentKey_SequenceNumber, 0);
  if (v13)
  {
    v14 = v13;
    v15 = CFNumberGetTypeID();
    if (v15 == CFGetTypeID(v14) && !CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt64Type, &v19))
      v19 = 0;
  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = objc_msgSend(a2, "sampleBuffer", v19);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 16))(v16, v17, v19, valuePtr, a3, a4);
}

- (void)notifyScheduledOutputChangedForStream:(id)a3 scheduledOutput:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *clientQueue;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionProvider *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(2);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v13 = 1024;
      v14 = 4014;
      v15 = 2080;
      v16 = "-[CMIOExtensionProvider notifyScheduledOutputChangedForStream:scheduledOutput:]";
      v17 = 2112;
      v18 = self;
      v19 = 2112;
      v20 = a3;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__CMIOExtensionProvider_notifyScheduledOutputChangedForStream_scheduledOutput___block_invoke;
  block[3] = &unk_250457A60;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(clientQueue, block);
}

uint64_t __79__CMIOExtensionProvider_notifyScheduledOutputChangedForStream_scheduledOutput___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_clientQueue_streamingClientsMap"), "objectForKey:", objc_msgSend((id)objc_msgSend(v7, "clientInfo"), "clientID")))
        {
          objc_msgSend(v7, "streamScheduledOutputChangedWithStreamID:scheduledOutput:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "streamID"), "UUIDString"), *(_QWORD *)(a1 + 48));
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)removeSystemStatusAttributionsForClient:(id)a3 stream:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  CMMediaType MediaType;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = CMIOLog();
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315907;
      v22 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v23 = 1024;
      v24 = 4035;
      v25 = 2080;
      v26 = "-[CMIOExtensionProvider removeSystemStatusAttributionsForClient:stream:]";
      v27 = 1025;
      v28 = objc_msgSend(a3, "pid");
      _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s removeSystemStatusAttributionsForClient for client %{private}d", buf, 0x22u);
    }
  }
  if (a4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "source", 0), "formats");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v8);
          MediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "formatDescription"));
          if (MediaType == 1836415096)
          {
            v11 = 1;
          }
          else if (MediaType != 1936684398)
          {
            v11 = 1;
            if ((v12 & 1) == 0)
              goto LABEL_17;
            goto LABEL_16;
          }
          v12 = 1;
LABEL_16:
          if ((v11 & 1) != 0)
            return;
LABEL_17:
          ++v14;
        }
        while (v10 != v14);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
  }
}

- (void)updateNonStreamingProxyFrontedExtensionPIDs:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSArray *nonStreamingProxyFrontedExtensionPIDs;
  NSArray *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSArray *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      nonStreamingProxyFrontedExtensionPIDs = self->_nonStreamingProxyFrontedExtensionPIDs;
      v10 = 136316163;
      v11 = v7;
      v12 = 1024;
      v13 = 4113;
      v14 = 2080;
      v15 = "-[CMIOExtensionProvider updateNonStreamingProxyFrontedExtensionPIDs:]";
      v16 = 2113;
      v17 = nonStreamingProxyFrontedExtensionPIDs;
      v18 = 2113;
      v19 = a3;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s updating %{private}@ to %{private}@", (uint8_t *)&v10, 0x30u);
    }
  }
  os_unfair_lock_lock(&self->_contextsMapLock);
  v9 = self->_nonStreamingProxyFrontedExtensionPIDs;
  self->_nonStreamingProxyFrontedExtensionPIDs = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", a3);

  self->_nonStreamingProxyFrontedExtensionPIDsHasChanged = 1;
  os_unfair_lock_unlock(&self->_contextsMapLock);
}

- (id)source
{
  return objc_loadWeak((id *)&self->_source);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
}

- (void)initWithSource:clientQueue:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s SystemStatus unavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addDevice:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addDevice:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Device already included", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeDevice:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeDevice:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Device not included", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)proprietaryDefaultsDomainForAuditToken:(int)a1 .cold.1(int a1, NSObject *a2)
{
  __int16 v4;
  uint8_t v5[20];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8();
  v6 = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
  v7 = v4;
  v8 = a1;
  _os_log_error_impl(&dword_2330C2000, a2, OS_LOG_TYPE_ERROR, "%s:%d:%s [%d] could not get preference domain, returning \"unknown\", v5, 0x22u);
  OUTLINED_FUNCTION_2();
}

+ (void)proprietaryDefaultsDomainForAuditToken:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d:%s Error getting process handle for %{private}d: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)proprietaryDefaultsDomainForAuditToken:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_24(&dword_2330C2000, v0, v1, "%s:%d:%s Error getting bundle record for %{private}d: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)proprietaryDefaultsDomainForAuditToken:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[20];
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_16();
  v7 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v4 = "+[CMIOExtensionProvider proprietaryDefaultsDomainForAuditToken:]";
  v5 = 2113;
  v6 = v1;
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v2, "%s:%d:%s Bundle record is not an extension record: %{private}@", v3);
  OUTLINED_FUNCTION_2();
}

void __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s failed %@", v2);
  OUTLINED_FUNCTION_2();
}

void __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __59__CMIOExtensionProvider_finishProviderContextRegistration___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Unregistered provider context %@, don't be surprised if things go badly", v2);
  OUTLINED_FUNCTION_2();
}

void __47__CMIOExtensionProvider_removeProviderContext___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __47__CMIOExtensionProvider_removeProviderContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Unregistered provider context %@, don't be surprised if things go badly", v2);
  OUTLINED_FUNCTION_2();
}

- (void)registerDevice:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s deviceID already included %{public}@", v2);
  OUTLINED_FUNCTION_17();
}

- (void)unregisterDevice:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s deviceID %{public}@ not registered", v2);
  OUTLINED_FUNCTION_17();
}

- (void)registerStream:withDeviceID:error:.cold.1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[40];
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  v4 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  objc_msgSend(v1, "streamID");
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v2, "%s:%d:%s streamID already included %{public}@", v3);
  OUTLINED_FUNCTION_17();
}

- (void)unregisterStream:withDeviceID:notify:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  *(_QWORD *)(v6 + 20) = "-[CMIOExtensionProvider unregisterStream:withDeviceID:notify:error:]";
  *(_WORD *)(v6 + 28) = 2114;
  *(_QWORD *)(v6 + 30) = v7;
  OUTLINED_FUNCTION_4(&dword_2330C2000, v9, v6, "%s:%d:%s streamID not register %{public}@", v8);
}

void __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_2330C2000, v0, v1, "%s:%d:%s providerPropertiesForProperties error %@ for plugin %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

- (void)_addAvailablePropertyStatesForDevice:toDictionary:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_2330C2000, v0, v1, "%s:%d:%s devicePropertiesForProperties error %{public}@ for device %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_addAvailablePropertyStatesForDevice:toDictionary:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_2330C2000, v0, v1, "%s:%d:%s providerPropertiesForProperties error %{public}@ for plugin %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid property", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __77__CMIOExtensionProvider_availableDevicePropertiesForClientID_deviceID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid deviceID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid deviceID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_2330C2000, v0, v1, "%s:%d:%s devicePropertiesForProperties error %{public}@ for device %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid deviceID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_2330C2000, v0, v1, "%s:%d:%s devicePropertiesForProperties error %{public}@ for device %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid deviceID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid property", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  objc_msgSend(v0, "deviceControlPID");
  objc_msgSend((id)OUTLINED_FUNCTION_27(), "pid");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_23(&dword_2330C2000, v1, v2, "%s:%d:%s Invalid deviceControlPID %d vs %d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_17();
}

void __77__CMIOExtensionProvider_availableStreamPropertiesForClientID_streamID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_2330C2000, v0, v1, "%s:%d:%s streamPropertiesForProperties error %{public}@ for stream %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid property", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  objc_msgSend((id)objc_msgSend(v0, "parent"), "deviceControlPID");
  objc_msgSend((id)OUTLINED_FUNCTION_27(), "pid");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_23(&dword_2330C2000, v1, v2, "%s:%d:%s Invalid deviceControlPID %d vs %d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_17();
}

- (void)_clientQueue_decrementPendingStreamStartCountForClientID:streamID:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11(&dword_2330C2000, v0, v1, "%s:%d:%s %{public}@, %{private}@ : UNDERFLOW", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __63__CMIOExtensionProvider_startStreamForClientID_streamID_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

- (void)_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __98__CMIOExtensionProvider__performDeferredStreamStartsForClient_streamID_requestVideo_requestAudio___block_invoke_370_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  __int16 v3;
  int v4;
  uint8_t v5[14];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_14();
  v15 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_21();
  v6 = 3579;
  v7 = 2080;
  v8 = "-[CMIOExtensionProvider _performDeferredStreamStartsForClient:streamID:requestVideo:requestAudio:]_block_invoke";
  v9 = 2114;
  v10 = v2;
  v11 = v3;
  v12 = v4;
  v13 = 2114;
  v14 = v1;
  _os_log_error_impl(&dword_2330C2000, v0, OS_LOG_TYPE_ERROR, "%s:%d:%s %{public}@: startStream %d failed %{public}@", v5, 0x36u);
  OUTLINED_FUNCTION_10();
}

void __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Could not stop streaming %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __62__CMIOExtensionProvider_stopStreamForClientID_streamID_reply___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Client %{public}@ is fronted by proxy that is not streaming", v2);
  OUTLINED_FUNCTION_2();
}

void __91__CMIOExtensionProvider_captureAsyncStillImageForClientID_streamID_uniqueID_options_reply___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid streamID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid clientID %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __86__CMIOExtensionProvider_enqueueReactionEffectForClientID_streamID_reactionType_reply___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_5(v0, 4.8153e-34, v1, v2);
  OUTLINED_FUNCTION_9(v3, v4, v5);
  OUTLINED_FUNCTION_6(v6, v7, v8);
  OUTLINED_FUNCTION_4(&dword_2330C2000, v11, v9, "%s:%d:%s exception %@", v10);
}

void __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  v3 = *MEMORY[0x24BDAC8D0];
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid stream %{public}@ is not streaming", v2);
  OUTLINED_FUNCTION_2();
}

void __67__CMIOExtensionProvider_consumeSampleBufferForStream_client_reply___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid clientID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
