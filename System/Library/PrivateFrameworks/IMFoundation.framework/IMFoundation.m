BOOL sub_19066EDD0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_indexOfObjectIdenticalTo_(a1, a2, a3, a4) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_19066EE04(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("temp:"), a4);
}

CFMutableDictionaryRef sub_19066EE18(uint64_t a1)
{
  CFMutableDictionaryRef result;

  pthread_mutex_init((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8), 0);
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  return result;
}

dispatch_queue_t sub_19066EF18()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("IMLocalObjectQueue", v0);
  qword_1ECD90E98 = (uint64_t)result;
  return result;
}

uint64_t sub_19066EF4C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;

  v5 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3, a4);
  return objc_msgSend_postNotificationName_object_(v5, v6, (uint64_t)CFSTR("IMLocalObjectDidDisconnect"), *(_QWORD *)(a1 + 32));
}

void sub_19066F278(uint64_t a1)
{
  void *v2;
  const void *v3;
  const void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x19400E788]();
  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    v5 = CFEqual(v3, CFSTR("Vendor")) != 0;
    v7 = *(_QWORD *)(a1 + 32);
    v6 = a1 + 32;
    *(_BYTE *)(v7 + 12) = v5;
    *(_BYTE *)(*(_QWORD *)v6 + 10) = CFEqual(v4, CFSTR("Carrier")) != 0;
    CFRelease(v4);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v6 = a1 + 32;
    *(_BYTE *)(v8 + 12) = 0;
    *(_BYTE *)(*(_QWORD *)v6 + 10) = 0;
  }
  *(_BYTE *)(*(_QWORD *)v6 + 9) = os_variant_has_internal_ui();
  *(_BYTE *)(*(_QWORD *)v6 + 11) = os_variant_has_factory_content();
  objc_autoreleasePoolPop(v2);
}

void sub_19066F51C(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)

  }
}

CFNumberRef sub_19066F568()
{
  CFNumberRef result;
  char valuePtr;

  valuePtr = 0;
  qword_1ECD90EA8 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  valuePtr = 1;
  qword_1ECD90EB0 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  valuePtr = 2;
  qword_1ECD90EB8 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  valuePtr = 3;
  qword_1ECD90EC0 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  valuePtr = 4;
  qword_1ECD90EC8 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  valuePtr = 5;
  qword_1ECD90ED0 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  valuePtr = 6;
  qword_1ECD90ED8 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  valuePtr = 7;
  qword_1ECD90EE0 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  valuePtr = 8;
  result = CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  qword_1ECD90EE8 = (uint64_t)result;
  return result;
}

void sub_19066F6A4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v0 = (void *)qword_1ECD91050;
  qword_1ECD91050 = (uint64_t)CFSTR("UIApplicationDidBecomeActiveNotification");

  v1 = (void *)qword_1ECD91058;
  qword_1ECD91058 = (uint64_t)CFSTR("UIApplicationWillResignActiveNotification");

  v2 = (void *)qword_1ECD91060;
  qword_1ECD91060 = (uint64_t)CFSTR("UIApplicationDidEnterBackgroundNotification");

  v3 = (void *)qword_1ECD91068;
  qword_1ECD91068 = (uint64_t)CFSTR("UIApplicationWillEnterForegroundNotification");

  v4 = (void *)qword_1ECD91070;
  qword_1ECD91070 = (uint64_t)CFSTR("UIApplicationSuspendedNotification");

  v5 = (void *)qword_1ECD91078;
  qword_1ECD91078 = (uint64_t)CFSTR("UIApplicationResumedNotification");

  v6 = (void *)qword_1ECD91080;
  qword_1ECD91080 = (uint64_t)CFSTR("UIApplicationSuspendedEventsOnlyNotification");

  v7 = (void *)qword_1ECD91088;
  qword_1ECD91088 = (uint64_t)CFSTR("UIApplicationResumedEventsOnlyNotification");

  v8 = (void *)qword_1ECD91090;
  qword_1ECD91090 = (uint64_t)CFSTR("_UIApplicationWillAddDeactivationReasonNotification");

  v9 = (void *)qword_1ECD91098;
  qword_1ECD91098 = (uint64_t)CFSTR("_UIApplicationDidRemoveDeactivationReasonNotification");

  v10 = (void *)qword_1ECD910A0;
  qword_1ECD910A0 = (uint64_t)CFSTR("_UIApplicationDeactivationReasonUserInfoKey");

}

void sub_19066F7B8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t *);
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = sub_19067AA80;
  v23 = &unk_1E2C46148;
  v24 = a1;
  v11 = v8;
  v25 = v11;
  v12 = v9;
  v26 = v12;
  v13 = v10;
  v27 = v13;
  v14 = &v20;
  if (_os_feature_enabled_impl()
    && (im_primary_base_queue(), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    im_primary_queue();
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v19, v14);

  }
  else if (objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v15, v16, v17, v20, v21))
  {
    v22(v14);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v14);
  }

}

BOOL sub_19066FCA4(void *a1, const char *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v5;
  void *v8;
  _BOOL8 result;
  unint64_t v10;
  uint64_t v11;

  v10 = a4;
  v11 = a5;
  v5 = a5 + a4;
  if (a4 >= a5 + a4)
    return 0;
  do
  {
    objc_msgSend_attribute_atIndex_effectiveRange_(a1, a2, a3, a4, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    result = v8 != 0;
    if (v8)
      break;
    a4 = v11 + v10;
  }
  while (v11 + v10 < v5);
  return result;
}

BOOL sub_19066FE40(_QWORD *a1, _QWORD *a2, _QWORD *a3, _BYTE *a4, _BYTE *a5, void *a6, void *a7, void *a8)
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CFMutableDictionaryRef Mutable;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  __CFDictionary *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  uint64_t v71;
  void *v72;
  __CFDictionary *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void **v124;
  void *v125;
  void **v126;
  void *v127;
  void **v128;
  void *v129;
  id v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  uint64_t *v138;
  id v139;
  id v140;
  _QWORD *v142;
  _BYTE *v143;
  id v144;
  id obj;
  void *value;
  uint64_t v150;
  void *v151;
  void *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = a8;
  IMGetEnvironmentName((uint64_t)v14, v15, v16, v17);
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90AB8);
  v22 = (void *)qword_1ECD90DA0;
  if (!qword_1ECD90DA0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v24 = (void *)qword_1ECD90DA0;
    qword_1ECD90DA0 = (uint64_t)Mutable;

    v22 = (void *)qword_1ECD90DA0;
  }
  value = v13;
  objc_msgSend___imFirstObject(v13, v19, v20, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v22, v26, (uint64_t)v25, v27);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v14)
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v32, (uint64_t)v14, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
        CFDictionarySetValue(v34, CFSTR("url"), v35);

    }
    CFDictionarySetValue(v34, CFSTR("apsenv"), &unk_1E2C5D0F8);
    if (value)
      CFDictionarySetValue(v34, CFSTR("topics"), value);
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v36, 0, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      CFDictionarySetValue(v34, CFSTR("selfsigned"), v38);

    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v39, 0, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      CFDictionarySetValue(v34, CFSTR("unsigned"), v41);

    objc_msgSend_setObject_forKey_(v28, v42, (uint64_t)v34, (uint64_t)CFSTR("prod"));
    v43 = (void *)qword_1ECD90DA0;
    objc_msgSend___imFirstObject(value, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v43, v48, (uint64_t)v28, (uint64_t)v47);

  }
  if (!objc_msgSend_length(v18, v29, v30, v31))
  {

    v18 = CFSTR("prod");
  }
  v49 = value;
  if (_IMWillLog(CFSTR("Settings")))
    _IMAlwaysLog(0, CFSTR("Settings"), CFSTR("Using environment: %@"), v51, v52, v53, v54, v55, (char)v18);
  if ((objc_msgSend_isEqualToString_(v18, v50, (uint64_t)CFSTR("prod"), v51) & 1) == 0
    && (unint64_t)objc_msgSend_count(v28, v56, v57, v58) <= 1)
  {
    v142 = a3;
    v143 = a5;
    v152 = v28;
    v59 = objc_alloc(MEMORY[0x1E0C99D80]);
    v144 = v12;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v151 = (void *)objc_msgSend_initWithContentsOfFile_(v59, v60, (uint64_t)v12, v61);
    objc_msgSend_allKeys(v151, v62, v63, v64);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v153, (uint64_t)v157, 16);
    if (v66)
    {
      v69 = v66;
      v150 = *(_QWORD *)v154;
      do
      {
        for (i = 0; i != v69; ++i)
        {
          if (*(_QWORD *)v154 != v150)
            objc_enumerationMutation(obj);
          v71 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * i);
          objc_msgSend_objectForKey_(v151, v67, v71, v68);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend_objectForKey_(v72, v74, (uint64_t)CFSTR("url"), v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (v76)
          {
            v79 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend_objectForKey_(v72, v77, (uint64_t)CFSTR("url"), v78);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_URLWithString_(v79, v81, (uint64_t)v80, v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();

            if (v83)
              CFDictionarySetValue(v73, CFSTR("url"), v83);

            v49 = value;
          }
          objc_msgSend_objectForKey_(v72, v77, (uint64_t)CFSTR("apsenv"), v78);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (v84)
            CFDictionarySetValue(v73, CFSTR("apsenv"), v84);

          if (v49)
            CFDictionarySetValue(v73, CFSTR("topics"), v49);
          objc_msgSend_objectForKey_(v72, v85, (uint64_t)CFSTR("selfsigned"), v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (v87)
            CFDictionarySetValue(v73, CFSTR("selfsigned"), v87);

          objc_msgSend_objectForKey_(v72, v88, (uint64_t)CFSTR("unsigned"), v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (v90)
            CFDictionarySetValue(v73, CFSTR("unsigned"), v90);

          objc_msgSend_setObject_forKey_(v152, v91, (uint64_t)v73, v71);
        }
        v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v67, (uint64_t)&v153, (uint64_t)v157, 16);
      }
      while (v69);
    }

    v12 = v144;
    a5 = v143;
    v28 = v152;
    a3 = v142;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90AB8);
  objc_msgSend_objectForKey_(v28, v92, (uint64_t)v18, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v94, v95, v96, v97))
  {

    v18 = CFSTR("prod");
    objc_msgSend_objectForKey_(v28, v101, (uint64_t)CFSTR("prod"), v102);
    v103 = objc_claimAutoreleasedReturnValue();

    v94 = (void *)v103;
  }
  v106 = objc_msgSend_count(v94, v98, v99, v100);
  if (v106)
  {
    if (a1)
    {
      objc_msgSend_objectForKey_(v94, v104, (uint64_t)CFSTR("url"), v105);
      *a1 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsObject_(v49, v107, (uint64_t)CFSTR("com.apple.private.ids"), v108) & 1) != 0
        || (objc_msgSend_containsObject_(v49, v109, (uint64_t)CFSTR("com.apple.private.ac"), v110) & 1) != 0
        || objc_msgSend_containsObject_(v49, v111, (uint64_t)CFSTR("com.apple.ess"), v112))
      {
        IMGetCachedDomainValueForKey(CFSTR("com.apple.ids"), CFSTR("custom-ids-bag-url"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if (v115)
        {
          objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v113, (uint64_t)v115, v114);
          *a1 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
    }
    if (a3)
      *a3 = objc_retainAutorelease(v49);
    if (a4)
    {
      objc_msgSend_objectForKey_(v94, v104, (uint64_t)CFSTR("selfsigned"), v105);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend_BOOLValue(v116, v117, v118, v119);

    }
    if (a5)
    {
      objc_msgSend_objectForKey_(v94, v104, (uint64_t)CFSTR("unsigned"), v105);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = objc_msgSend_BOOLValue(v120, v121, v122, v123);

    }
    if (a2)
    {
      if (!qword_1ECD90DA8)
      {
        v124 = (void **)IMWeakLinkSymbol("APSEnvironmentProduction", CFSTR("ApplePushService"));
        if (v124)
          v125 = *v124;
        else
          v125 = 0;
        objc_storeStrong((id *)&qword_1ECD90DA8, v125);
      }
      if (!qword_1ECD90DB0)
      {
        v126 = (void **)IMWeakLinkSymbol("APSEnvironmentDevelopment", CFSTR("ApplePushService"));
        if (v126)
          v127 = *v126;
        else
          v127 = 0;
        objc_storeStrong((id *)&qword_1ECD90DB0, v127);
      }
      if (!qword_1ECD90DB8)
      {
        v128 = (void **)IMWeakLinkSymbol("APSEnvironmentDemo", CFSTR("ApplePushService"));
        if (v128)
          v129 = *v128;
        else
          v129 = 0;
        objc_storeStrong((id *)&qword_1ECD90DB8, v129);
      }
      v130 = (id)qword_1ECD90DA8;
      objc_msgSend_objectForKey_(v94, v131, (uint64_t)CFSTR("apsenv"), v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend_intValue(v133, v134, v135, v136);

      if (v137 == 1)
      {
        v138 = &qword_1ECD90DB0;
      }
      else
      {
        if (v137 != 2)
        {
LABEL_78:
          v140 = objc_retainAutorelease(v130);
          *a2 = v140;

          v49 = value;
          goto LABEL_79;
        }
        v138 = &qword_1ECD90DB8;
      }
      v139 = (id)*v138;

      v130 = v139;
      goto LABEL_78;
    }
  }
LABEL_79:

  return v106 != 0;
}

_xpc_connection_s *im_local_object_from_connection(_xpc_connection_s *result)
{
  void *context;
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    context = xpc_connection_get_context(result);
    return (_xpc_connection_s *)(id)objc_msgSend_object(context, v2, v3, v4);
  }
  return result;
}

void sub_190670770(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(void);
  void (**v13)(void);
  id v14;
  NSObject *v15;
  void (**v16)(void);
  void *v17;
  void *v18;
  _xpc_connection_s *v19;
  id v20;
  id v21;
  NSObject *v22;
  _xpc_connection_s *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  id v41;
  _xpc_connection_s *v42;
  id v43;
  void *context;
  uint64_t v45;
  NSObject *v46;
  __int128 buf;
  void (*v48)(uint64_t, void *);
  void *v49;
  _xpc_connection_s *v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x19400EE48]();
  if (v4 == MEMORY[0x1E0C81310])
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    v9 = *(void **)(a1 + 40);
    v10 = *(id *)(a1 + 32);
    v11 = v3;
    v12 = v7;
    v13 = v8;
    v14 = v9;
    if (v11 == (id)MEMORY[0x1E0C81260])
    {
      OSLogHandleForIDSCategory("XPC");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_19066D000, v39, OS_LOG_TYPE_DEFAULT, "Connection went invalid: %p", (uint8_t *)&buf, 0xCu);
      }

      v16 = v12;
      if (!v12)
        goto LABEL_20;
    }
    else
    {
      if (v11 != (id)MEMORY[0x1E0C81288])
      {
        v45 = MEMORY[0x19400EE48](v11);
        OSLogHandleForIDSCategory("Warning");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v45;
          _os_log_impl(&dword_19066D000, v46, OS_LOG_TYPE_DEFAULT, "Unknown error type: %@, exiting", (uint8_t *)&buf, 0xCu);
        }

        exit(0);
      }
      OSLogHandleForIDSCategory("XPC");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_19066D000, v15, OS_LOG_TYPE_DEFAULT, "Termination coming for connection: %p", (uint8_t *)&buf, 0xCu);
      }

      v16 = v13;
      if (!v13)
        goto LABEL_20;
    }
    v16[2]();
LABEL_20:

    goto LABEL_27;
  }
  v5 = v4;
  if (v4 == MEMORY[0x1E0C812E0])
  {
    v17 = *(void **)(a1 + 64);
    v18 = *(void **)(a1 + 40);
    v19 = (_xpc_connection_s *)*(id *)(a1 + 32);
    v20 = v3;
    v21 = v17;
    v22 = v18;
    v23 = (_xpc_connection_s *)v20;
    if (!v22)
    {
      if (_os_feature_enabled_impl())
      {
        im_primary_base_queue();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v24, v25, v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v28, v30, (uint64_t)CFSTR("PeerQueue with WL Target: %@"), v31, v29);
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v36 = (const char *)objc_msgSend_UTF8String(v32, v33, v34, v35);
          dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v37 = objc_claimAutoreleasedReturnValue();
          im_primary_base_queue();
          v38 = objc_claimAutoreleasedReturnValue();
          v22 = dispatch_queue_create_with_target_V2(v36, v37, v38);

        }
        else
        {
          v22 = MEMORY[0x1E0C80D38];
          v41 = MEMORY[0x1E0C80D38];
        }

      }
      else
      {
        v22 = MEMORY[0x1E0C80D38];
        v40 = MEMORY[0x1E0C80D38];
      }
    }
    xpc_connection_set_target_queue(v23, v22);
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v48 = sub_19067876C;
    v49 = &unk_1E2C45D68;
    v42 = v23;
    v50 = v42;
    v51 = v21;
    v43 = v21;
    xpc_connection_set_event_handler(v42, &buf);
    if (xpc_connection_get_context(v19))
    {
      context = xpc_connection_get_context(v19);
      xpc_connection_set_context(v42, context);
    }
    xpc_connection_resume(v42);

  }
  else
  {
    OSLogHandleForIDSCategory("Warning");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_19066D000, v6, OS_LOG_TYPE_DEFAULT, "Unhandled listener event:  %p", (uint8_t *)&buf, 0xCu);
    }

  }
LABEL_27:

}

_xpc_connection_s *sub_190670CC0(const char *a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_connection_t mach_service;
  xpc_connection_t v19;
  NSObject *v20;
  _xpc_connection_s *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _xpc_connection_s *v27;
  _QWORD handler[4];
  _xpc_connection_s *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  xpc_connection_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (v13)
  {
    if (!a1)
      goto LABEL_7;
  }
  else
  {
    dispatch_get_global_queue(2, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!a1)
      goto LABEL_7;
  }
  if (*a1)
  {
    mach_service = xpc_connection_create_mach_service(a1, v13, 1uLL);
    goto LABEL_8;
  }
LABEL_7:
  mach_service = xpc_connection_create(0, v13);
LABEL_8:
  v19 = mach_service;
  if (a7)
    xpc_connection_enable_sim2host_4sim();
  OSLogHandleForIDSCategory("XPC");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = a1;
    v37 = 2048;
    v38 = v19;
    _os_log_impl(&dword_19066D000, v20, OS_LOG_TYPE_DEFAULT, "Created XPC service with name: %s  (Connection: %p)", buf, 0x16u);
  }

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_190670770;
  handler[3] = &unk_1E2C45D40;
  v21 = v19;
  v32 = v14;
  v33 = v15;
  v30 = v21;
  v31 = v17;
  v34 = v16;
  v22 = v16;
  v23 = v17;
  v24 = v15;
  v25 = v14;
  xpc_connection_set_event_handler(v21, handler);
  v26 = v34;
  v27 = v21;

  return v27;
}

void sub_1906710B4(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  void (**v5)(_QWORD);
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char isEqual;
  const char *v13;
  id v14;

  v14 = a1;
  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend_currentThread(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v9, v10, (uint64_t)v14, v11);

  if ((isEqual & 1) != 0)
    v5[2](v5);
  else
    objc_msgSend___im_performBlock_waitUntilDone_(v14, v13, (uint64_t)v5, 0);

}

void sub_190671174(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = sub_19067A920;
  v15 = &unk_1E2C460F8;
  v16 = a1;
  v5 = v4;
  v17 = v5;
  v6 = &v12;
  if (_os_feature_enabled_impl()
    && (im_primary_base_queue(), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    im_primary_queue();
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v11, v6);

  }
  else if (objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v7, v8, v9, v12, v13))
  {
    ((void (*)(uint64_t *))v14)(v6);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }

}

BOOL sub_190671274(const __CFString *a1, int a2, CFStringRef theString2)
{
  return theString2 && CFStringCompare(a1, theString2, 1uLL) == kCFCompareEqualTo;
}

__CFString *IMCopyStringWithLocalizedNumbers(const __CFString *a1)
{
  uint64_t Length;
  uint64_t v3;
  __CFString *Mutable;
  CFIndex i;
  UChar32 CharacterAtIndex;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  __CFString *v13;
  UniChar chars;

  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  if (Length < 1)
    return 0;
  v3 = Length;
  Mutable = CFStringCreateMutable(0, Length);
  for (i = 0; i != v3; ++i)
  {
    chars = -21846;
    CharacterAtIndex = CFStringGetCharacterAtIndex(a1, i);
    chars = CharacterAtIndex;
    v7 = u_charDigitValue(CharacterAtIndex);
    if ((_DWORD)v7 == -1)
    {
      CFStringAppendCharacters(Mutable, &chars, 1);
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v8, v7, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringFromNumber_numberStyle_(v10, v12, (uint64_t)v11, 1);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFStringAppend(Mutable, v13);

    }
  }
  return Mutable;
}

uint64_t IMCopyGUIDForChat(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return _NSNewStringByAppendingStrings();
  else
    return 0;
}

void sub_190671BDC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[2];
  uint64_t (*v17)(uint64_t, const char *);
  void *v18;
  uint64_t v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = sub_190677CC8;
  v18 = &unk_1E2C46120;
  v19 = a1;
  v8 = v6;
  v20 = v8;
  v9 = v7;
  v21 = v9;
  v10 = v16;
  if (_os_feature_enabled_impl()
    && (im_primary_base_queue(), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    im_primary_queue();
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v15, v10);

  }
  else if (objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v11, v12, v13))
  {
    ((void (*)(_QWORD *))v17)(v10);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v10);
  }

}

id IMGetXPCDictionaryFromDictionary(void *a1, const char *a2)
{
  void *v2;
  void *v3;

  v2 = 0;
  if (a1 && a2)
  {
    sub_190671E18(a2, a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    JWDecodeDictionary(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id JWDecodeDictionary(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  uint64_t v10;
  unint64_t v11;

  v1 = a1;
  v5 = v1;
  if (v1 && objc_msgSend_length(v1, v2, v3, v4))
  {
    v10 = 0;
    v11 = 0xAAAAAAAAAAAAAAAALL;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v6, (uint64_t)v5, 0, &v11, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id sub_190671E18(const char *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  const void *data;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  size_t length;

  v5 = a2;
  if (MEMORY[0x19400EE48]() == MEMORY[0x1E0C812F8]
    && (length = 0, (data = xpc_dictionary_get_data(v5, a1, &length)) != 0))
  {
    v8 = (uint64_t)data;
    v9 = objc_alloc(MEMORY[0x1E0C99D50]);
    if (a3)
      v11 = objc_msgSend_initWithBytes_length_(v9, v10, v8, length);
    else
      v11 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v9, v10, v8, length, 0);
    v6 = (void *)v11;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id sub_190671F14(void *a1, const char *a2, _QWORD *a3, uint64_t a4)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  if ((objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("token:"), a4) & 1) != 0
    || objc_msgSend_hasPrefix_(a1, v6, (uint64_t)CFSTR("self-token:"), v8))
  {
    objc_msgSend__stripFZIDPrefix(a1, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_rangeOfString_(v9, v10, (uint64_t)CFSTR("/"), v11);
    v16 = v12;
    if (a3)
    {
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = v9;
      }
      else
      {
        objc_msgSend_substringToIndex_(v9, v13, v12, v15);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v17;
      objc_msgSend___imDataWithHexString_(MEMORY[0x1E0C99D50], v18, (uint64_t)v17, v19);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend_length(v9, v13, v14, v15) <= (unint64_t)(v16 + 1))
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend_substringFromIndex_(v9, v22, v16 + 1, v23);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v20 = a1;
  }
  return v20;
}

uint64_t IMOSLoggingEnabled()
{
  if (qword_1ECD90DD8 != -1)
    dispatch_once(&qword_1ECD90DD8, &unk_1E2C43968);
  return byte_1ECD90D98;
}

void im_assert_primary_base_queue()
{
  NSObject *v0;

  im_primary_base_queue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v0);

}

id im_primary_base_queue()
{
  unsigned __int8 v0;

  v0 = atomic_load(byte_1EE1DD510);
  if ((v0 & 1) == 0)
    atomic_store(1u, byte_1EE1DD510);
  return (id)qword_1EE1DD5D0;
}

uint64_t sub_190672788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](a1, sel_initWithTarget_protocol_, 0, a3);
}

id sub_190672794(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return (id)objc_msgSend_copyStringGUID(a1, a2, a3, a4);
}

CFStringRef sub_1906727A8()
{
  CFStringRef v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0xAAAAAAAAAAAAAAAALL;
  v2[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x19400EC8C](v2);
  v1 = 0;
  jw_uuid_to_cfstring((const unsigned __int8 *)v2, &v1);
  return v1;
}

uint64_t IMInsertDictionariesToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  __int128 v11;
  BOOL v12;
  uint64_t v13;
  id *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char **v24;
  __int128 v26;
  id *v27;
  _QWORD *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  if (v10)
    v12 = a2 == 0;
  else
    v12 = 1;
  v13 = !v12;
  if (!v12)
  {
    v27 = (id *)&a9;
    *(_QWORD *)&v11 = 138412290;
    v26 = v11;
    do
    {
      v14 = v27;
      v28 = v27 + 1;
      v15 = *v14;
      JWEncodeDictionary(v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        if (objc_msgSend_count(v15, v16, v17, v18))
        {
          OSLogHandleForIDSCategory("Warning");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v30 = v15;
            _os_log_impl(&dword_19066D000, v23, OS_LOG_TYPE_DEFAULT, "Failed to encode dictionary: %@", buf, 0xCu);
          }

        }
        objc_msgSend_data(MEMORY[0x1E0C99D50], v20, v21, v22, v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      sub_190673110(v19, a2, v10);

      v24 = (const char **)v28;
      v27 = (id *)(v28 + 1);
      a2 = *v24;
    }
    while (*v24);
  }

  return v13;
}

id JWEncodeDictionary(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v17;
  uint64_t v19;

  v1 = a1;
  v5 = v1;
  if (v1 && objc_msgSend_count(v1, v2, v3, v4))
  {
    v19 = 0;
    objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v6, (uint64_t)v5, 200, 0, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    if (v7)
      v16 = 1;
    else
      v16 = v19 == 0;
    if (v16)
    {
      v17 = v7;
    }
    else
    {
      _IMWarn(CFSTR("Error while encoding dictionary %@"), v8, v9, v10, v11, v12, v13, v14, v19);
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void sub_190673110(void *a1, const char *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  xpc_object_t xdict;

  xdict = a3;
  v5 = objc_retainAutorelease(a1);
  v9 = (const void *)objc_msgSend_bytes(v5, v6, v7, v8);
  v13 = objc_msgSend_length(v5, v10, v11, v12);

  if (v9 && v13)
    xpc_dictionary_set_data(xdict, a2, v9, v13);

}

id sub_190673194(void *a1)
{
  __int128 v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CC_LONG v11;
  const char *v12;
  CC_SHA1_CTX v14;
  unsigned __int8 md[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(md, 170, 20);
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v14.data[9] = v2;
  *(_OWORD *)&v14.data[13] = v2;
  *(_OWORD *)&v14.data[1] = v2;
  *(_OWORD *)&v14.data[5] = v2;
  *(_OWORD *)&v14.h0 = v2;
  *(_OWORD *)&v14.h4 = v2;
  CC_SHA1_Init(&v14);
  v3 = objc_retainAutorelease(a1);
  v7 = (const void *)objc_msgSend_bytes(v3, v4, v5, v6);
  v11 = objc_msgSend_length(v3, v8, v9, v10);
  CC_SHA1_Update(&v14, v7, v11);
  CC_SHA1_Final(md, &v14);
  objc_msgSend___imHexStringOfBytes_withLength_(v3, v12, (uint64_t)md, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_190673254(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend___imHexStringOfBytes_withLength_(MEMORY[0x1E0C99D50], a2, a3, a4);
}

char *sub_190673260(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _BYTE *v9;
  unsigned int v10;
  id v11;
  const char *v12;

  if (a4 < 0)
    return (char *)0;
  v4 = a4;
  v6 = 2 * a4;
  v7 = (char *)malloc_type_malloc(2 * a4, 0x79E1DCAuLL);
  if (v7)
  {
    v8 = (uint64_t)v7;
    if (v4)
    {
      v9 = v7 + 1;
      do
      {
        v10 = *a3++;
        *(v9 - 1) = byte_1906BC7A0[(unint64_t)v10 >> 4];
        *v9 = byte_1906BC7A0[v10 & 0xF];
        v9 += 2;
        --v4;
      }
      while (v4);
    }
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (char *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v11, v12, v8, v6, 4, 1);
  }
  return v7;
}

void IMComponentsFromChatGUID(void *a1, _QWORD *a2, _QWORD *a3, _BYTE *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;

  v7 = a1;
  v29 = v7;
  if (a2 && !a3 && !a4)
  {
    v10 = objc_msgSend_rangeOfString_options_(v7, v8, (uint64_t)CFSTR(";"), 4);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_substringFromIndex_(v29, v11, (uint64_t)&v11[v10], v12);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    objc_msgSend_componentsSeparatedByString_(v29, v11, (uint64_t)CFSTR(";"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v13, v14, v15, v16);
    goto LABEL_14;
  }
  if (!a4 && !a2 && a3)
  {
    v18 = objc_msgSend_rangeOfString_options_(v7, v8, (uint64_t)CFSTR(";"), 0);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_substringToIndex_(v29, v17, v18, v19);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    objc_msgSend_componentsSeparatedByString_(v29, v17, (uint64_t)CFSTR(";"), v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v13, v20, v21, v22);
    goto LABEL_17;
  }
  objc_msgSend_componentsSeparatedByString_(v7, v8, (uint64_t)CFSTR(";"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend_lastObject(v13, v23, v24, v25);
LABEL_14:
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
  {
    objc_msgSend___imFirstObject(v13, v23, v24, v25);
LABEL_17:
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    objc_msgSend_objectAtIndex_(v13, v23, 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend_characterAtIndex_(v26, v27, 0, v28);

  }
LABEL_21:

}

uint64_t sub_1906735CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFString *v35;
  const char *v36;

  v5 = (void *)objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, a3, a4);
  v9 = (void *)objc_msgSend_threadDictionary(v5, v6, v7, v8);
  v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("com.apple.IMRemoteObjectDeliveringMessageKey"), v11);
  objc_msgSend_setObject_forKeyedSubscript_(v9, v13, *(_QWORD *)(a1 + 32), (uint64_t)CFSTR("com.apple.IMRemoteObjectDeliveringMessageKey"));
  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 64);
  if ((objc_msgSend_isValid(v14, v18, v19, v20) & 1) != 0)
  {
    if (objc_msgSend_forwardXPCObject_messageContext_locked_(v14, v21, v15, v16, 0) == 1)
    {
      if (dword_1ECD90A78 < 0)
      {
        if (qword_1ECD90F20 != -1)
          dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
        if (dword_1ECD90A78 <= 0)
          goto LABEL_25;
      }
      else if (!dword_1ECD90A78)
      {
        goto LABEL_25;
      }
      v35 = CFSTR("* Message delivery failed, object is dead: %@");
    }
    else
    {
      if (dword_1ECD90A78 < 0)
      {
        if (qword_1ECD90F20 != -1)
          dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
        if (dword_1ECD90A78 <= 0)
          goto LABEL_25;
      }
      else if (!dword_1ECD90A78)
      {
LABEL_25:
        if (v17)
          (*(void (**)(uint64_t))(v17 + 16))(v17);
        goto LABEL_27;
      }
      v35 = CFSTR("* Message delivery success to: %@");
    }
    _IMLog(v35, v28, v29, v30, v31, v32, v33, v34, (char)v14);
    goto LABEL_25;
  }
  if ((dword_1ECD90A78 & 0x80000000) == 0)
  {
    if (!dword_1ECD90A78)
      goto LABEL_27;
    goto LABEL_15;
  }
  if (qword_1ECD90F20 != -1)
    dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
  if (dword_1ECD90A78 > 0)
LABEL_15:
    _IMLog(CFSTR("* Object is no longer valid, skipping this message: %@"), (uint64_t)v21, v22, v23, v24, v25, v26, v27, (char)v14);
LABEL_27:
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  return objc_msgSend_setObject_forKeyedSubscript_(v9, v36, v12, (uint64_t)CFSTR("com.apple.IMRemoteObjectDeliveringMessageKey"));
}

CFArrayRef sub_190673DFC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  CFArrayRef result;

  result = (CFArrayRef)objc_msgSend_count(a1, a2, a3, a4);
  if (result)
    return CFArrayCreateCopy(0, (CFArrayRef)a1);
  return result;
}

id sub_19067401C(void *a1, uint64_t a2, void *a3)
{
  unsigned int (**v4)(id, uint64_t);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (v4 && v8)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v13 = a1;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v36, (uint64_t)v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v13);
          v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (v4[2](v4, v20))
            objc_msgSend_addObject_(v12, v21, v20, v22, (_QWORD)v36);
          else
            v17 = 1;
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v21, (uint64_t)&v36, (uint64_t)v40, 16);
      }
      while (v16);

      if ((v17 & 1) != 0)
      {
        v26 = v12;
LABEL_23:
        v31 = v26;

        goto LABEL_24;
      }
    }
    else
    {

    }
    if ((objc_msgSend___imIsMutable(v13, v23, v24, v25, (_QWORD)v36) & 1) != 0)
      v26 = (id)objc_msgSend_copy(v13, v32, v33, v34);
    else
      v26 = v13;
    goto LABEL_23;
  }
  if ((objc_msgSend___imIsMutable(a1, v9, v10, v11) & 1) != 0)
    v30 = (id)objc_msgSend_copy(a1, v27, v28, v29);
  else
    v30 = a1;
  v31 = v30;
LABEL_24:

  return v31;
}

id sub_1906741C4(void *a1, uint64_t a2, void *a3)
{
  void (**v4)(id, _QWORD);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (v4 && v8)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = a1;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v38, (uint64_t)v42, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          ((void (**)(id, void *))v4)[2](v4, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend_addObject_(v12, v21, (uint64_t)v23, v22, (_QWORD)v38);
            v17 |= v23 != v20;
          }
          else
          {
            v17 = 1;
          }

        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v24, (uint64_t)&v38, (uint64_t)v42, 16);
      }
      while (v16);

      if ((v17 & 1) != 0)
      {
        v28 = v12;
LABEL_23:
        v33 = v28;

        goto LABEL_24;
      }
    }
    else
    {

    }
    if ((objc_msgSend___imIsMutable(v13, v25, v26, v27, (_QWORD)v38) & 1) != 0)
      v28 = (id)objc_msgSend_copy(v13, v34, v35, v36);
    else
      v28 = v13;
    goto LABEL_23;
  }
  if ((objc_msgSend___imIsMutable(a1, v9, v10, v11) & 1) != 0)
    v32 = (id)objc_msgSend_copy(a1, v29, v30, v31);
  else
    v32 = a1;
  v33 = v32;
LABEL_24:

  return v33;
}

id sub_190674384(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_count(a1, a2, a3, a4);
  if (v5)
  {
    objc_msgSend_objectAtIndex_(a1, v6, 0, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

id IMCountryCodeForIncomingTextMessage(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  pthread_mutex_lock(&stru_1ECD909F0);
  v2 = (void *)qword_1EE1DD900;
  if (qword_1EE1DD900)
    goto LABEL_7;
  if (qword_1ECD90AF0 != -1)
    dispatch_once(&qword_1ECD90AF0, &unk_1E2C43548);
  if (off_1ECD90AE8)
  {
    v3 = off_1ECD90AE8(a1);
    v4 = (void *)qword_1EE1DD900;
    qword_1EE1DD900 = v3;

    im_dispatch_after(&unk_1E2C43588, 0.0);
  }
  v2 = (void *)qword_1EE1DD900;
  if (qword_1EE1DD900)
LABEL_7:
    v5 = v2;
  else
    v5 = 0;
  pthread_mutex_unlock(&stru_1ECD909F0);
  if (objc_msgSend_length(v5, v6, v7, v8))
  {
    v12 = v5;
  }
  else
  {
    objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x1E0C99DC8], v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x1E0C997B0], v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

void im_dispatch_after(void *a1, double a2)
{
  int64_t v2;
  dispatch_time_t v3;
  dispatch_block_t block;

  if (a1)
  {
    v2 = (uint64_t)(a2 * 1000000000.0);
    block = a1;
    v3 = dispatch_time(0, v2);
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t IMCreateInvocationFromXPCObjectWithProtocol(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v7)
  {
    xpc_dictionary_get_value(v7, "invocation");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
      v11 = v7;
    v12 = JWCreateInvocationFromXPCObject(v11, v8, v9, v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_1906747C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  id v9;
  NSObject *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    OSLogHandleForIDSCategory("Warning");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(_QWORD *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_19066D000, v10, OS_LOG_TYPE_DEFAULT, "Exception building invocation: %@", (uint8_t *)&a9, 0xCu);
    }

    IMLogBacktrace(0);
    IMLogSimulateCrashForException(v9);

    objc_end_catch();
    JUMPOUT(0x190674770);
  }
  _Unwind_Resume(exception_object);
}

#error "190674894: stack frame is too big (funcsize=0)"

void sub_190675830(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  const char *v17;
  uint64_t v18;
  NSString *v19;
  SEL v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;

  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    v6 = v2;
    v7 = (const char *)objc_msgSend_selector(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3, v4, v5);
    v11 = (void *)objc_msgSend_methodSignature(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8, v9, v10);
    v15 = objc_msgSend_numberOfArguments(v11, v12, v13, v14);
    v16 = NSStringFromSelector(v7);
    if (v15 == 2)
      v19 = (NSString *)objc_msgSend_stringByAppendingString_(v16, v17, (uint64_t)CFSTR("WithMessageContext:"), v18);
    else
      v19 = (NSString *)objc_msgSend_stringByAppendingString_(v16, v17, (uint64_t)CFSTR("messageContext:"), v18);
    v20 = NSSelectorFromString(v19);
    if (v20)
    {
      v23 = (uint64_t)v20;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v24 = objc_msgSend_methodSignatureForSelector_(v6, v21, v23, v22);
        if (v24)
        {
          v25 = (void *)objc_msgSend_invocationWithMethodSignature_(MEMORY[0x1E0C99DB8], v21, v24, v22);
          objc_msgSend_setSelector_(v25, v26, v23, v27);
          JWCopyInvocationArguments(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v25);
          objc_msgSend_setArgument_atIndex_(v25, v28, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40, v15);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v25;
        }
      }
    }
    objc_msgSend_invokeWithTarget_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v21, (uint64_t)v6, v22);
    if (*(_BYTE *)(a1 + 56))
      kdebug_trace();

    if (*(_BYTE *)(a1 + 56))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8) = 0;
  }
}

id sub_190675994(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  Protocol *v10;
  objc_method_description MethodDescription;
  const char *v12;
  uint64_t v13;

  objc_msgSend_methodSignatureForSelector_(a1, a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend_protocol(a1, v7, v8, v9);
    v10 = (Protocol *)objc_claimAutoreleasedReturnValue();
    MethodDescription = protocol_getMethodDescription(v10, a3, 0, 1);

    if (MethodDescription.name)
    {
      objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v12, (uint64_t)MethodDescription.types, v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

id IMCleanupPhoneNumber(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  int hasPrefix;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  if ((IMStringIsPhoneNumber(v1) & 1) != 0)
  {
    hasPrefix = objc_msgSend_hasPrefix_(v1, v2, (uint64_t)CFSTR("+"), v3);
    IMNormalizeFormattedString(v1, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    if (hasPrefix && (objc_msgSend_hasPrefix_(v5, v6, (uint64_t)CFSTR("+"), v7) & 1) == 0)
    {
      objc_msgSend_stringByAppendingString_(CFSTR("+"), v9, (uint64_t)v8, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v11;
    }
  }
  else
  {
    v8 = v1;
  }

  return v8;
}

id IMStripFormattingFromAddress(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v1 = a1;
  if (!objc_msgSend_length(v1, v2, v3, v4))
  {
    v13 = v1;
LABEL_8:
    v12 = v13;
    v11 = v13;
    goto LABEL_9;
  }
  if (qword_1ECD90AE0 != -1)
    dispatch_once(&qword_1ECD90AE0, &unk_1E2C45F68);
  objc_msgSend_stringByRemovingCharactersFromSet_(v1, v5, qword_1ECD90AD8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__im_normalizedURIString(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((IMStringIsPhoneNumber(v11) & 1) == 0)
  {
    v13 = v11;
    goto LABEL_8;
  }
  IMFormatPhoneNumber(v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v12;
}

id IMFormatPhoneNumber(void *a1, int a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  UChar32 v23;
  int32_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v3 = a1;
  if (objc_msgSend_length(v3, v4, v5, v6) && !IMStringIsEmail(v3))
  {
    if (qword_1ECD90E60 != -1)
      dispatch_once(&qword_1ECD90E60, &unk_1E2C42F28);
    v9 = &qword_1ECD90E58;
    if (!a2)
      v9 = &qword_1ECD90E50;
    objc_msgSend_stringByTrimmingCharactersInSet_(v3, v7, *v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend_length(v10, v11, v12, v13);
    v15 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v21 = (void *)objc_msgSend_initWithCapacity_(v15, v16, v14, v17);
    if (v14)
    {
      v22 = 0;
      while (2)
      {
        v23 = objc_msgSend_characterAtIndex_(v10, v18, v22, v20);
        v19 = CFSTR("+");
        switch(v23)
        {
          case '#':
            objc_msgSend_appendString_(v21, v18, (uint64_t)CFSTR("#"), v20);
            goto LABEL_17;
          case '$':
          case '%':
          case '&':
          case '\'':
          case '(':
          case ')':
            goto LABEL_14;
          case '*':
            objc_msgSend_appendString_(v21, v18, (uint64_t)CFSTR("*"), v20);
            goto LABEL_17;
          case '+':
            goto LABEL_16;
          case ',':
            break;
          default:
            if ((v23 - 59) <= 0x3D && ((1 << (v23 - 59)) & 0x2020000000000001) != 0)
              break;
LABEL_14:
            v24 = u_charDigitValue(v23);
            if (v24 <= 9)
            {
              v19 = *(&off_1E2C45F88 + v24);
LABEL_16:
              objc_msgSend_appendString_(v21, v18, (uint64_t)v19, v20);
            }
LABEL_17:
            if (v14 == ++v22)
              break;
            continue;
        }
        break;
      }
    }
    if (objc_msgSend_length(v21, v18, (uint64_t)v19, v20))
    {
      if (_IMWillLog(CFSTR("Normalization")))
        _IMAlwaysLog(0, CFSTR("Normalization"), CFSTR("Converted phone number from %@ to %@"), v25, v26, v27, v28, v29, (char)v10);
      v30 = v21;

      v10 = v30;
    }

    v3 = v10;
  }
  return v3;
}

BOOL IMStringIsEmail(void *a1)
{
  __CFString *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
    v5 = CFStringFind(v1, CFSTR("@"), 0).location != -1;
  else
    v5 = 1;

  return v5;
}

double IMTimeOfDay()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return (double)v1.tv_usec / 1000000.0 + (double)v1.tv_sec;
}

BOOL _IMWillLog(void *a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _BOOL8 v5;
  BOOL v6;
  CFStringRef *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  __CFString *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;

  v4 = a1;
  if (!byte_1EE1DDCD0)
  {
    if (dword_1ECD90A84 < 0)
    {
      dword_1ECD90A84 = CFPreferencesGetAppBooleanValue(CFSTR("Log"), (CFStringRef)*MEMORY[0x1E0C9B248], 0);
      v6 = byte_1EE1DDCD0 == 0;
      if (dword_1ECD90A84)
        goto LABEL_9;
    }
    else
    {
      v6 = 1;
      if (dword_1ECD90A84)
        goto LABEL_9;
    }
    if (v6)
      goto LABEL_18;
    goto LABEL_9;
  }
  if (!byte_1EE1DDCD1)
  {
LABEL_9:
    v7 = (CFStringRef *)MEMORY[0x1E0C9B248];
    if (dword_1EE1DCD20 < 0)
    {
      dword_1EE1DCD20 = CFPreferencesGetAppBooleanValue(CFSTR("Log.All"), (CFStringRef)*MEMORY[0x1E0C9B248], 0);
      if (dword_1EE1DCD20)
        goto LABEL_11;
    }
    else if (dword_1EE1DCD20)
    {
LABEL_11:
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      v11 = (__CFString *)objc_msgSend_initWithFormat_(v8, v9, (uint64_t)CFSTR("DontLog.%@"), v10, v4);
      v5 = CFPreferencesGetAppBooleanValue(v11, *v7, 0) == 0;
LABEL_12:

      goto LABEL_19;
    }
    if (objc_msgSend_length(v4, v1, v2, v3))
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3940]);
      v11 = (__CFString *)objc_msgSend_initWithFormat_(v12, v13, (uint64_t)CFSTR("Log.%@"), v14, v4);
      v5 = byte_1EE1DDCD0
        && (objc_msgSend_objectForKey_((void *)qword_1EE1DDCB8, v15, (uint64_t)v11, v16),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend_intValue(v17, v18, v19, v20),
            v17,
            v21)
        || CFPreferencesGetAppBooleanValue(v11, *v7, 0) != 0;
      goto LABEL_12;
    }
LABEL_18:
    v5 = 0;
    goto LABEL_19;
  }
  v5 = 1;
LABEL_19:

  return v5;
}

uint64_t jw_uuid_to_cfstring(const unsigned __int8 *a1, CFStringRef *a2)
{
  __int128 v3;
  CFStringRef v4;
  uint64_t result;
  _OWORD v6[4];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 22;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[2] = v3;
  v6[3] = v3;
  v6[0] = v3;
  v6[1] = v3;
  uuid_unparse_upper(a1, (char *)v6);
  v4 = CFStringCreateWithCString(0, (const char *)v6, 0x8000100u);
  result = 0;
  *a2 = v4;
  return result;
}

id OSLogHandleForIDSCategory(const void *a1)
{
  return sub_190679084(a1, qword_1ECD90F60, "com.apple.IDS");
}

uint64_t IMStringIsPhoneNumber_0(const __CFString *a1)
{
  CFIndex Length;
  char v3;
  CFIndex v5;
  CFIndex v6;
  UChar32 CharacterAtIndex;
  int v8;

  if (a1)
  {
    Length = CFStringGetLength(a1);
    if (Length >= 2)
    {
      v5 = Length;
      v3 = 0;
      v6 = 0;
      while (1)
      {
        CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
        if (CharacterAtIndex <= 111)
        {
          switch(CharacterAtIndex)
          {
            case ' ':
            case '"':
            case '#':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '+':
            case ',':
            case '-':
            case '.':
            case '/':
            case ':':
            case ';':
            case '?':
              goto LABEL_8;
            default:
              goto LABEL_23;
          }
        }
        if (CharacterAtIndex > 8209)
        {
          if (CharacterAtIndex > 8235)
          {
            if (CharacterAtIndex == 8236)
              goto LABEL_8;
            v8 = 8237;
          }
          else
          {
            if (CharacterAtIndex == 8210)
              goto LABEL_8;
            v8 = 8234;
          }
          if (CharacterAtIndex != v8)
            goto LABEL_23;
        }
        else if (CharacterAtIndex <= 8207)
        {
          if (CharacterAtIndex == 112)
            goto LABEL_9;
          if (CharacterAtIndex != 160)
          {
LABEL_23:
            if (u_charDigitValue(CharacterAtIndex) == -1)
              break;
          }
        }
LABEL_8:
        v3 = 1;
LABEL_9:
        if (v5 == ++v6)
          return v3 & 1;
      }
    }
  }
  v3 = 0;
  return v3 & 1;
}

__CFString *sub_190676908(__CFString *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CFRange v23;

  v4 = a3;
  v8 = objc_msgSend_length(a1, v5, v6, v7);
  if (v8 << 32
    && (v23.length = (int)v8, v23.location = 0, CFStringFindCharacterFromSet(a1, (CFCharacterSetRef)v4, v23, 0, 0)))
  {
    v9 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (objc_msgSend_length(a1, v10, v11, v12))
    {
      v15 = 0;
      do
      {
        v16 = objc_msgSend_characterAtIndex_(a1, v13, v15, v14);
        if ((objc_msgSend_characterIsMember_(v4, v17, v16, v18) & 1) == 0)
          objc_msgSend_appendFormat_(v9, v19, (uint64_t)CFSTR("%C"), v21, v16);
        ++v15;
      }
      while (v15 < objc_msgSend_length(a1, v19, v20, v21));
    }
  }
  else
  {
    v9 = a1;
  }

  return v9;
}

uint64_t sub_1906769F8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t hasPrefix;

  objc_msgSend_lowercaseString(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("urn:biz:"), v6) & 1) != 0)
    hasPrefix = 1;
  else
    hasPrefix = objc_msgSend_hasPrefix_(v4, v7, (uint64_t)CFSTR("biz:"), v8);

  return hasPrefix;
}

id sub_190676A50(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if ((objc_msgSend__appearsToBePseudonymID(a1, a2, a3, a4) & 1) != 0
    || objc_msgSend__appearsToBeHardwareID(a1, v5, v6, v7))
  {
    v11 = a1;
  }
  else
  {
    objc_msgSend_lowercaseString(a1, v8, v9, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

uint64_t sub_190676A94(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("pseud:"), a4);
}

uint64_t sub_190676AA0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("dev:"), a4);
}

id sub_190676AAC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;

  if ((objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("urn:biz:"), a4) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v5, (uint64_t)CFSTR("biz:"), v6) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v7, (uint64_t)CFSTR("temp:"), v8) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v9, (uint64_t)CFSTR("pseud:"), v10) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v11, (uint64_t)CFSTR("dev:"), v12) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v13, (uint64_t)CFSTR("urn:ds:"), v14) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v15, (uint64_t)CFSTR("ds:"), v16) & 1) != 0
    || objc_msgSend_hasPrefix_(a1, v17, (uint64_t)CFSTR("sip:"), v18)
    || objc_msgSend__appearsToBeStewie(a1, v19, v20, v21)
    || (v24 = objc_msgSend_rangeOfString_(a1, v22, (uint64_t)CFSTR(":"), v23), v24 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v27 = a1;
  }
  else
  {
    objc_msgSend_substringFromIndex_(a1, v25, v24 + 1, v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v27;
}

uint64_t sub_190676BA4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("stewie:"), a4);
}

id im_primary_queue()
{
  unsigned __int8 v0;
  id v1;
  id v2;

  v0 = atomic_load(byte_1ECD90E90);
  if ((v0 & 1) == 0)
    atomic_store(1u, byte_1ECD90E90);
  if (qword_1EE1DD5F0)
  {
    v1 = (id)qword_1EE1DD5F0;
  }
  else
  {
    v1 = (id)MEMORY[0x1E0C80D38];
    v2 = MEMORY[0x1E0C80D38];
  }
  return v1;
}

#error "190676C10: stack frame is too big (funcsize=0)"

uint64_t JWCopyInvocationArguments(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t i;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *ArgumentTypeAtIndex;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  size_t v23;
  char *v24;
  const char *v25;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend_methodSignature(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_numberOfArguments(v8, v9, v10, v11);
  if (v12 >= 3)
  {
    v13 = v12;
    for (i = 2; i != v13; ++i)
    {
      v15 = objc_retainAutorelease(v8);
      ArgumentTypeAtIndex = (const char *)objc_msgSend_getArgumentTypeAtIndex_(v15, v16, i, v17);
      if (*ArgumentTypeAtIndex == 64)
      {
        sizep[0] = 0;
        objc_msgSend_getArgument_atIndex_(v3, v19, (uint64_t)sizep, i);
        objc_msgSend_setArgument_atIndex_(v4, v20, (uint64_t)sizep, i);
      }
      else
      {
        sizep[0] = 0xAAAAAAAAAAAAAAAALL;
        v21 = NSGetSizeAndAlignment(ArgumentTypeAtIndex, sizep, 0);
        MEMORY[0x1E0C80A78](v21);
        v24 = (char *)sizep - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (v23)
          memset((char *)sizep - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v23);
        objc_msgSend_getArgument_atIndex_(v3, v22, (uint64_t)v24, i);
        objc_msgSend_setArgument_atIndex_(v4, v25, (uint64_t)v24, i);
      }
    }
  }

  return 1;
}

uint64_t IMCreateXPCObjectFromInvocation(uint64_t result)
{
  if (result)
    return JWCreateXPCObjectFromInvocation();
  return result;
}

void im_configure_connection_with_local_object(xpc_connection_t connection, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5;
  id context;

  if (connection)
  {
    if (a2)
    {
      v5 = (id)objc_msgSend_weakRefWithObject_(MEMORY[0x1E0D13238], a2, (uint64_t)a2, a4);
      xpc_connection_set_context(connection, v5);
      xpc_connection_set_finalizer_f(connection, (xpc_finalizer_t)sub_19066F51C);
    }
    else
    {
      context = xpc_connection_get_context(connection);
      xpc_connection_set_context(connection, 0);
      if (context)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)

      }
    }
  }
}

uint64_t IMDispatchForNotify(const char *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v18;

  v7 = a3;
  v18 = -1;
  if (!v7)
  {
    v7 = (id)MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
  }
  if (im_notify_register_dispatch(a1, (int *)&v18, 0, a2, v7, a4))
    _IMWarn(CFSTR("Dispatch registration failed for %s (%u)\n"), v9, v10, v11, v12, v13, v14, v15, (char)a1);
  v16 = v18;

  return v16;
}

uint64_t im_notify_register_dispatch(const char *a1, int *a2, uint64_t *a3, char a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, const char *, uint64_t, uint64_t);
  void *v30;
  dispatch_queue_t v31;
  id v32;
  const char *v33;
  char v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = v12;
  v14 = 0;
  if (a1 && a2 && v11)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = sub_1906817A8;
    v30 = &unk_1E2C43C18;
    v34 = a4;
    v33 = a1;
    v32 = v12;
    v31 = (dispatch_queue_t)v11;
    v14 = notify_register_dispatch(a1, a2, v31, &v27);
    if ((_DWORD)v14)
    {
      objc_msgSend_registration(IMRGLog, v15, v16, v17, v27, v28, v29, v30);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = CFSTR("YES");
        *(_DWORD *)buf = 136315650;
        v36 = a1;
        if (!a3)
          v19 = CFSTR("NO");
        v37 = 1024;
        v38 = v14;
        v39 = 2112;
        v40 = v19;
        v20 = "Dispatch registration failed {name: %s, status: %u, hasInitialState: %@}";
        v21 = v18;
        v22 = 28;
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_16;
    }
    if (a3)
    {
      notify_get_state(*a2, a3);
      objc_msgSend_registration(IMRGLog, v23, v24, v25, v27, v28, v29, v30);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136315394;
      v36 = a1;
      v37 = 1024;
      v38 = (int)a3;
      v20 = "Dispatch registration success - initial state {name: %s, initialState: %u}";
      v21 = v18;
      v22 = 18;
    }
    else
    {
      objc_msgSend_registration(IMRGLog, v15, v16, v17, v27, v28, v29, v30);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136315138;
      v36 = a1;
      v20 = "Dispatch registration success {name: %s}";
      v21 = v18;
      v22 = 12;
    }
LABEL_14:
    _os_log_impl(&dword_19066D000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    goto LABEL_15;
  }
LABEL_16:

  return v14;
}

uint64_t IMGetAppIntForKey(void *a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  IMCopyAppValueForKey(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_integerValue(v1, v2, v3, v4);

  return v5;
}

id IMCopyAppValueForKey(void *a1)
{
  __CFString *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
    v5 = (void *)CFPreferencesCopyAppValue(v1, (CFStringRef)*MEMORY[0x1E0C9B248]);
  else
    v5 = 0;

  return v5;
}

__CFString *IMGetEnvironmentName(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;

  if (!qword_1ECD90B00)
  {
    IMGetCachedDomainValueForKey(CFSTR("com.apple.ids"), CFSTR("env"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD90B00;
    qword_1ECD90B00 = v4;

  }
  if (qword_1ECD90DC0 != -1)
    dispatch_once(&qword_1ECD90DC0, &unk_1E2C42C68);
  if (byte_1ECD90AF8 && !objc_msgSend_length((void *)qword_1ECD90B00, a2, a3, a4))
  {
    v8 = CFSTR("ven1-external");
  }
  else
  {
    v6 = objc_msgSend_length((void *)qword_1ECD90B00, a2, a3, a4);
    v7 = (__CFString *)qword_1ECD90B00;
    if (!v6)
      v7 = CFSTR("prod");
    v8 = v7;
  }
  return v8;
}

id IMGetCachedDomainValueForKey(CFStringRef applicationID, CFStringRef key)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)CFPreferencesCopyAppValue(key, applicationID);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

uint64_t IMGetMainBundle(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, a3, a4);
}

uint64_t IMCopyThreadNameForChat(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return _NSNewStringByAppendingStrings();
  else
    return 0;
}

id OSLogHandleForTransportCategory(const void *a1)
{
  return sub_190679084(a1, qword_1ECD90B08, "com.apple.Transport");
}

uint64_t sub_190677CB8()
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
}

uint64_t sub_190677CC8(uint64_t a1, const char *a2)
{
  return objc_msgSend_postNotificationName_object_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

BOOL IMGetDomainBoolForKey(CFStringRef applicationID, CFStringRef key)
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

uint64_t IMGetCachedDomainBoolForKeyWithDefaultValue(CFStringRef applicationID, CFStringRef key, unsigned int a3)
{
  _BOOL4 v4;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v4 = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
    return v4;
  else
    return a3;
}

BOOL IMGetXPCBoolFromDictionary(void *a1, const char *a2)
{
  return a1 && a2 && xpc_dictionary_get_BOOL(a1, a2);
}

void IMSyncronizeAppPreferencesLater()
{
  im_dispatch_after(&unk_1E2C43D10, 5.0);
}

void IMLogBacktrace(void *a1)
{
  IMLogBacktraceToDepth(a1, 128);
}

__CFBundle *IMGetMainBundleIdentifier()
{
  __CFBundle *MainBundle;

  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFBundleGetIdentifier(MainBundle);
    MainBundle = (__CFBundle *)objc_claimAutoreleasedReturnValue();
  }
  return MainBundle;
}

id IMGetXPCStringFromDictionary(void *a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *string_ptr;
  const char *v7;
  uint64_t v8;

  v2 = 0;
  if (a1 && a2)
  {
    xpc_dictionary_get_value(a1, a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3 && MEMORY[0x19400EE48](v3) == MEMORY[0x1E0C81390] && (string_ptr = xpc_string_get_string_ptr(v4)) != 0)
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v7, (uint64_t)string_ptr, v8);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

void IMSetDomainBoolForKey(void *a1, const __CFString *a2, int a3)
{
  const void *v3;

  if (a3)
    v3 = (const void *)MEMORY[0x1E0C9AAB0];
  else
    v3 = 0;
  IMSetDomainValueForKey(a1, a2, v3);
}

const __CFString *IMSystemRootDirectory()
{
  return CFSTR("/");
}

id IMInternationalForPhoneNumberWithOptions(void *a1, void *a2, int a3)
{
  void *v3;
  void *v4;

  v3 = (void *)IMPhoneNumberRefCopyForPhoneNumber(a1, a2, a3);
  IMNormalizedPhoneNumberForCFPhoneNumberRef(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    CFRelease(v3);
  return v4;
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a1;
  v6 = a2;
  if (!v6)
  {
    if (qword_1ECD90CB8 != -1)
      dispatch_once(&qword_1ECD90CB8, &unk_1E2C435C8);
    if (qword_1ECD90CA8 != -1)
      dispatch_once(&qword_1ECD90CA8, &unk_1E2C43628);
    v6 = (id)off_1ECD90CA0();
    if (!v6)
      v6 = (id)off_1ECD90C98();
  }
  if (qword_1ECD90D00 == -1)
  {
    if (!a3)
      goto LABEL_12;
  }
  else
  {
    dispatch_once(&qword_1ECD90D00, &unk_1E2C43668);
    if (!a3)
      goto LABEL_12;
  }
  if (!v6)
    v6 = (id)off_1ECD90CF0();
LABEL_12:
  if (qword_1ECD90CF8 != -1)
    dispatch_once(&qword_1ECD90CF8, &unk_1E2C45EC8);
  v7 = off_1ECD90D10(*MEMORY[0x1E0C9AE00], v5, v6);

  return v7;
}

id IMNormalizedPhoneNumberForCFPhoneNumberRef(id a1)
{
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;

  v1 = a1;
  if (a1)
  {
    if (qword_1ECD90CD8 != -1)
      dispatch_once(&qword_1ECD90CD8, &unk_1E2C45F08);
    if (qword_1ECD90CE0 != -1)
      dispatch_once(&qword_1ECD90CE0, &unk_1E2C43728);
    v2 = (void *)off_1ECD90CD0(v1);
    if ((unint64_t)objc_msgSend_length(v2, v3, v4, v5) < 7)
      goto LABEL_13;
    v9 = (void *)off_1ECD90CC8(v1);
    if ((unint64_t)objc_msgSend_length(v2, v10, v11, v12) <= 7
      && objc_msgSend_hasPrefix_(v9, v6, (uint64_t)CFSTR("+90444"), v8))
    {
      if (_IMWillLog(CFSTR("IMFormattingUtilities")))
        _IMAlwaysLog(0, CFSTR("IMFormattingUtilities"), CFSTR("Turkish short code detected, using unformatted phone number"), v15, v16, v17, v18, v19, v22);
      v20 = objc_msgSend_copy(v2, v13, v14, v15);

      v9 = (void *)v20;
    }
    if (!v9)
LABEL_13:
      v9 = (void *)objc_msgSend_copy(v2, v6, v7, v8);
    v1 = v9;

  }
  return v1;
}

__CFString *IMFormattedDisplayStringForNumber(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;

  v3 = a1;
  v7 = v3;
  switch(a2)
  {
    case 3:
      IMFormattedNumberForUnformattedNumber(v3);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend_lowercaseString(v3, v4, v5, v6);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      v8 = (__CFString *)v3;
LABEL_7:
      v12 = v8;
      v13 = objc_msgSend_length(v8, v9, v10, v11);
      goto LABEL_9;
  }
  v12 = 0;
  v13 = objc_msgSend_length(0, v4, v5, v6);
LABEL_9:
  if (v13)
  {
    v14 = v12;
    v12 = v14;
  }
  else if (IMStringIsEmail(v7))
  {
    objc_msgSend_lowercaseString(v7, v15, v16, v17);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMFormattedNumberForUnformattedNumber(v7);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v18, v19, v20, v21))
    {
      v22 = IMCopyStringWithLocalizedNumbers(v18);
      if (objc_msgSend_length(v22, v23, v24, v25))
        v26 = v22;
      else
        v26 = v18;
      v14 = v26;

    }
    else
    {
      v14 = v7;
    }
    v12 = v18;
  }

  return v14;
}

id IMFormattedNumberForUnformattedNumber(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1)
  {
    if (qword_1EE1DD630 != -1)
      dispatch_once(&qword_1EE1DD630, &unk_1E2C45F48);
    v2 = (void *)off_1EE1DD628(v1, 0, 2, 0);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t IMCreateDictionaryFromXPCObjectWithStandardAllowlist(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    IMGetXPCDataFromDictionary(v1, "__encoded__");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      JWDecodeKeyedCodableObjectWithSecureCoding(v3, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
LABEL_8:

        goto LABEL_9;
      }
      JWDecodeDictionary(v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = _CFXPCCreateCFObjectFromXPCMessage();
    }
    v5 = v6;
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

id IMGetXPCDataFromDictionary(void *a1, const char *a2)
{
  void *v3;

  v3 = 0;
  if (a1 && a2)
  {
    sub_190671E18(a2, a1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id IMCreateXPCObjectFromDictionary(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v1 = a1;
  if (objc_msgSend_count(v1, v2, v3, v4))
  {
    v5 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    if (!v5)
    {
      v6 = xpc_dictionary_create(0, 0, 0);
      v5 = v6;
      if (v6)
        IMInsertOptionallyCodableDictionariesToXPCDictionary(v6, "__encoded__", v7, v8, v9, v10, v11, v12, (uint64_t)v1);
    }
    v13 = v5;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t IMInsertNSStringsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  BOOL v11;
  uint64_t v12;
  id *v13;
  __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  const char *CStringPtr;
  const char **v20;
  UInt8 *v21;
  id *v23;
  _QWORD *v24;
  CFIndex maxBufLen;
  CFRange v26;
  CFRange v27;

  v10 = a1;
  if (v10)
    v11 = a2 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    v23 = (id *)&a9;
    do
    {
      v13 = v23;
      v24 = v23 + 1;
      v14 = (__CFString *)*v13;
      if (objc_msgSend_length(v14, v15, v16, v17))
        v18 = v14 == 0;
      else
        v18 = 1;
      if (!v18)
      {
        CStringPtr = CFStringGetCStringPtr(v14, 0x600u);
        if (CStringPtr
          || (CStringPtr = CFStringGetCStringPtr(v14, 0)) != 0
          || (CStringPtr = CFStringGetCStringPtr(v14, 0x8000100u)) != 0)
        {
          xpc_dictionary_set_string(v10, a2, CStringPtr);
        }
        else
        {
          maxBufLen = 0;
          v26.length = CFStringGetLength(v14);
          v26.location = 0;
          CFStringGetBytes(v14, v26, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
          v21 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x6D1BBAA9uLL);
          v27.length = CFStringGetLength(v14);
          v27.location = 0;
          CFStringGetBytes(v14, v27, 0x8000100u, 0, 0, v21, maxBufLen, 0);
          v21[maxBufLen] = 0;
          xpc_dictionary_set_string(v10, a2, (const char *)v21);
          free(v21);
        }
      }

      v20 = (const char **)v24;
      v23 = (id *)(v24 + 1);
      a2 = *v20;
    }
    while (*v20);
  }

  return v12;
}

id ValidMobileMeDomains()
{
  if (qword_1ECD90C88 != -1)
    dispatch_once(&qword_1ECD90C88, &unk_1E2C42CC8);
  return (id)qword_1ECD90C90;
}

void IMSetDomainValueForKey(void *a1, const __CFString *a2, const void *a3)
{
  __CFString *applicationID;

  applicationID = a1;
  CFPreferencesSetAppValue(a2, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

BOOL IMGetCachedDomainBoolForKey(CFStringRef applicationID, CFStringRef key)
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

id IMGetXPCCodableFromDictionaryWithStandardAllowlist(void *a1, const char *a2)
{
  void *v2;
  void *v3;

  v2 = 0;
  if (a1 && a2)
  {
    sub_190671E18(a2, a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    JWDecodeKeyedCodableObjectWithSecureCoding(v3, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id IMGetXPCKeyedCodableFromDictionaryWithSecureCoding(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  void *v5;

  v3 = 0;
  if (a1 && a2)
  {
    sub_190671E18(a2, a1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    JWDecodeKeyedCodableObjectWithSecureCoding(v5, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id JWDecodeKeyedCodableObjectWithSecureCoding(void *a1, uint64_t a2)
{
  return sub_19067A2F4(a1, a2, 0);
}

void sub_19067876C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  OSLogHandleForIDSCategory("XPC");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134217984;
    v7 = v5;
    _os_log_impl(&dword_19066D000, v4, OS_LOG_TYPE_DEBUG, "Message from client: %p", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void im_local_object_peer_event_handler_is_syncReply(_xpc_connection_s *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *context;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  xpc_object_t value;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  pid_t v39;
  int v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  int v64;
  pid_t pid;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = MEMORY[0x19400EE48](a2);
    if (v6 != MEMORY[0x1E0C81310])
    {
      if (v6 != MEMORY[0x1E0C812F8])
        return;
      if (dword_1ECD90A78 < 0)
      {
        if (qword_1ECD90F20 != -1)
          dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
        if (dword_1ECD90A78 <= 0)
          goto LABEL_23;
      }
      else if (!dword_1ECD90A78)
      {
LABEL_23:
        context = xpc_connection_get_context(a1);
        v23 = (id)objc_msgSend_object(context, v20, v21, v22);
        if (!v23)
          return;
        if (xpc_dictionary_get_BOOL(a2, "xpc-object"))
        {
          v27 = OSLogHandleForIDSCategory("IMLocalObject");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v64) = 0;
            _os_log_impl(&dword_19066D000, v27, OS_LOG_TYPE_DEFAULT, "Incoming file descriptor request", (uint8_t *)&v64, 2u);
          }
          value = xpc_dictionary_get_value(a2, "object");
          v29 = objc_opt_class();
          v30 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding(a2, "object-context", v29);
          if (!objc_msgSend_count(v30, v31, v32, v33))
          {
            v37 = OSLogHandleForIDSCategory("IMLocalObject");
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v64) = 0;
              _os_log_impl(&dword_19066D000, v37, OS_LOG_TYPE_DEFAULT, " => Empty response, trying serialized response", (uint8_t *)&v64, 2u);
            }
            v30 = IMGetXPCDictionaryFromDictionary(a2, "object-context");
            v38 = OSLogHandleForIDSCategory("IMLocalObject");
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = objc_msgSend_count(v30, v34, v35, v36);
              v64 = 67109120;
              pid = v39;
              _os_log_impl(&dword_19066D000, v38, OS_LOG_TYPE_DEFAULT, " => Found response with %d keys", (uint8_t *)&v64, 8u);
            }
          }
          if (value && MEMORY[0x19400EE48](value) == MEMORY[0x1E0C81318])
          {
            v40 = xpc_fd_dup(value);
            close(v40);
          }
          v41 = (void *)objc_msgSend_target(v23, v34, v35, v36);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend_xpcObject_objectContext_(v41, v42, (uint64_t)value, (uint64_t)v30);
        }
        else
        {
          v52 = (void *)objc_msgSend_protocolChecker(v23, v24, v25, v26);
          v56 = (void *)objc_msgSend_protocol(v52, v53, v54, v55);
          v60 = (void *)objc_msgSend_allowlistedClasses(v23, v57, v58, v59);
          v61 = (void *)IMCreateInvocationFromXPCObjectWithProtocol(a2, v23, v56, v60);
          if (v61)
          {
            if (pthread_main_np())
            {
              objc_msgSend__enqueueInvocationWithSync_xpcMessage_submitToComponentQueue_isReply_(v23, v62, (uint64_t)v61, 0, 1, a3);
            }
            else if ((_DWORD)a3)
            {
              objc_msgSend__enqueueInvocationWithSync_xpcMessage_submitToComponentQueue_isReply_(v23, v62, (uint64_t)v61, 0, 1, 1);
            }
            else
            {
              objc_msgSend__enqueueInvocation_(v23, v62, (uint64_t)v61, v63);
            }

          }
        }
        goto LABEL_49;
      }
      v17 = (void *)MEMORY[0x19400ED88](a2);
      v18 = OSLogHandleForIDSCategory("IMLocalObject");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v64 = 67109378;
        pid = xpc_connection_get_pid(a1);
        v66 = 2080;
        v67 = v17;
        _os_log_impl(&dword_19066D000, v18, OS_LOG_TYPE_DEFAULT, "received message from peer(%d): %s", (uint8_t *)&v64, 0x12u);
      }
      free(v17);
      goto LABEL_23;
    }
    if (a2 == (void *)MEMORY[0x1E0C81260])
    {
      v8 = OSLogHandleForIDSCategory("IMLocalObject");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v64 = 67109120;
        pid = xpc_connection_get_pid(a1);
        _os_log_impl(&dword_19066D000, v8, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_CONNECTION_INVALID", (uint8_t *)&v64, 8u);
      }
      v9 = xpc_connection_get_context(a1);
      v13 = (id)objc_msgSend_object(v9, v10, v11, v12);
      xpc_connection_cancel(a1);
      if (v13)
        objc_msgSend__portDidBecomeInvalid(v13, v14, v15, v16);

    }
    else
    {
      if (a2 == (void *)MEMORY[0x1E0C81258])
      {
        v43 = OSLogHandleForIDSCategory("IMLocalObject");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v64 = 67109120;
          pid = xpc_connection_get_pid(a1);
          _os_log_impl(&dword_19066D000, v43, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", (uint8_t *)&v64, 8u);
        }
        v44 = xpc_connection_get_context(a1);
        v48 = (id)objc_msgSend_object(v44, v45, v46, v47);
        v23 = v48;
        if (v48)
          objc_msgSend__portInterrupted(v48, v49, v50, v51);
LABEL_49:

        return;
      }
      if (a2 == (void *)MEMORY[0x1E0C81288])
      {
        v7 = OSLogHandleForIDSCategory("IMLocalObject");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v64 = 67109120;
          pid = xpc_connection_get_pid(a1);
          _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", (uint8_t *)&v64, 8u);
        }
      }
    }
  }
}

_xpc_connection_s *IMXPCCreateConnectionForServiceWithQueue(char a1, int a2, const char *a3, void *a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  xpc_connection_t mach_service;
  _xpc_connection_s *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t buf[4];
  const char *name;
  __int16 v30;
  _xpc_connection_s *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3)
  {
    if (!v11)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(v15, v16, (uint64_t)CFSTR("%s_connection_queue"), v17, a3));
      v22 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21);
      v11 = dispatch_queue_create(v22, v14);

    }
    if ((a1 & 1) != 0)
      mach_service = xpc_connection_create_mach_service(a3, v11, 0);
    else
      mach_service = xpc_connection_create(a3, v11);
    v24 = mach_service;
    if (mach_service)
    {
      OSLogHandleForIDSCategory("XPC");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        name = xpc_connection_get_name(v24);
        v30 = 2048;
        v31 = v24;
        _os_log_impl(&dword_19066D000, v25, OS_LOG_TYPE_DEFAULT, "Created connection to %s service: %p", buf, 0x16u);
      }

      if (a2)
        IMXPCConfigureConnection(v24, v12, v13);
    }
    else
    {
      OSLogHandleForIDSCategory("Warning");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        name = a3;
        _os_log_impl(&dword_19066D000, v26, OS_LOG_TYPE_DEFAULT, "Unable to build service for name: %s", buf, 0xCu);
      }

    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

id sub_190679084(const void *a1, dispatch_once_t *predicate, const char *a3)
{
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19066EE18;
  block[3] = &unk_1E2C444F8;
  block[4] = predicate;
  if (*predicate != -1)
    dispatch_once(predicate, block);
  pthread_mutex_lock((pthread_mutex_t *)(predicate + 1));
  CFDictionaryGetValue((CFDictionaryRef)predicate[9], a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = os_log_create(a3, (const char *)a1);
    CFDictionarySetValue((CFMutableDictionaryRef)predicate[9], a1, v6);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(predicate + 1));
  return v6;
}

id IMCanonicalizeFormattedString(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    IMNormalizeFormattedString(v3, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v5, v6, v7, v8) && (a2 == 3 || !a2 && IMStringIsPhoneNumber(v4)))
    {
      objc_msgSend_stringByAppendingString_(CFSTR("+"), v9, (uint64_t)v5, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v4;
    }
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id IMNormalizeFormattedString(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a1;
  v7 = v3;
  switch(a2)
  {
    case 3:
      IMFormatPhoneNumber(v3, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend_lowercaseString(v3, v4, v5, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      v8 = v3;
LABEL_7:
      v12 = v8;
      v13 = objc_msgSend_length(v8, v9, v10, v11);
      goto LABEL_9;
  }
  v12 = 0;
  v13 = objc_msgSend_length(0, v4, v5, v6);
LABEL_9:
  if (v13)
  {
    v14 = v12;
  }
  else if (IMStringIsEmail(v7) || !IMStringIsPhoneNumber(v7))
  {
    objc_msgSend_lowercaseString(v7, v15, v16, v17);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMFormatPhoneNumber(v7, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v14;

  return v18;
}

void *IMDAuditTokenTaskCopyValuesForEntitlements(_OWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  CFTypeRef cf[2];
  __int128 v27;

  v3 = a2;
  if (qword_1EE1DD778 != -1)
    dispatch_once(&qword_1EE1DD778, &unk_1E2C43D50);
  if (qword_1EE1DD770 != -1)
    dispatch_once(&qword_1EE1DD770, &unk_1E2C43D70);
  v4 = *MEMORY[0x1E0C9AE00];
  v5 = a1[1];
  *(_OWORD *)cf = *a1;
  v27 = v5;
  v6 = off_1EE1DD768(v4, cf);
  if (v6)
  {
    v14 = (const void *)v6;
    cf[0] = 0;
    v15 = (void *)off_1EE1DD760(v6, v3, cf);
    v16 = v15;
    if (cf[0])
    {

      _IMWarn(CFSTR("Unable to get entitlements for client task. Error: %@"), v17, v18, v19, v20, v21, v22, v23, (char)cf[0]);
      if (cf[0])
        CFRelease(cf[0]);
      v16 = 0;
    }
    CFRelease(v14);
  }
  else
  {
    _IMWarn(CFSTR("Unable to create security task from audit token."), v7, v8, v9, v10, v11, v12, v13, v25);
    v16 = 0;
  }

  return v16;
}

void im_dispatch_after_primary_queue(void *a1, double a2)
{
  int64_t v2;
  id v3;
  dispatch_time_t v4;
  NSObject *v5;

  if (a1)
  {
    v2 = (uint64_t)(a2 * 1000000000.0);
    v3 = a1;
    v4 = dispatch_time(0, v2);
    im_primary_queue();
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v4, v5, v3);

  }
}

uint64_t IMGetDomainBoolForKeyWithDefaultValue(CFStringRef applicationID, CFStringRef key, unsigned int a3)
{
  _BOOL4 v4;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v4 = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
    return v4;
  else
    return a3;
}

BOOL IMGetConferenceSettings(_QWORD *a1, char *a2, _QWORD *a3, _BYTE *a4, _BYTE *a5)
{
  void *v10;
  _BOOL8 v11;

  IMSingleObjectArray(CFSTR("com.apple.ess"), a2, (uint64_t)a3, (uint64_t)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = sub_19066FE40(a1, a2, a3, a4, a5, CFSTR("/AppleInternal/Library/Conference/Environments.plist"), v10, CFSTR("https://init.ess.apple.com/WebObjects/VCInit.woa/wa/getBag?ix=3"));

  return v11;
}

BOOL IMGetiMessageSettings(_QWORD *a1, char *a2, _QWORD *a3, _BYTE *a4, _BYTE *a5)
{
  void *v10;
  _BOOL8 v11;

  IMSingleObjectArray(CFSTR("com.apple.madrid"), a2, (uint64_t)a3, (uint64_t)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = sub_19066FE40(a1, a2, a3, a4, a5, CFSTR("/AppleInternal/Library/Madrid/Environments.plist"), v10, CFSTR("https://init-p01md.apple.com/bag?ix=2"));

  return v11;
}

id IMSingleObjectArray(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], a2, (uint64_t)a1, a4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t IMInsertCodableObjectsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  BOOL v11;
  uint64_t v12;
  id *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char **v19;
  id *v21;
  _QWORD *v22;

  v10 = a1;
  if (v10)
    v11 = a2 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    v21 = (id *)&a9;
    do
    {
      v13 = v21;
      v22 = v21 + 1;
      v14 = *v13;
      JWEncodeKeyedCodableObject(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend_data(MEMORY[0x1E0C99D50], v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      sub_190673110(v18, a2, v10);

      v19 = (const char **)v22;
      v21 = (id *)(v22 + 1);
      a2 = *v19;
    }
    while (*v19);
  }

  return v12;
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  BOOL v11;
  uint64_t v12;
  id *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char **v19;
  id *v21;
  _QWORD *v22;

  v10 = a1;
  if (v10)
    v11 = a2 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    v21 = (id *)&a9;
    do
    {
      v13 = v21;
      v22 = v21 + 1;
      v14 = *v13;
      JWEncodeKeyedCodableObject(v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend_data(MEMORY[0x1E0C99D50], v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      sub_190673110(v18, a2, v10);

      v19 = (const char **)v22;
      v21 = (id *)(v22 + 1);
      a2 = *v19;
    }
    while (*v19);
  }

  return v12;
}

id JWEncodeKeyedCodableObject(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *inited;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0CB36F8];
    v2 = a1;
    v3 = [v1 alloc];
    inited = (void *)objc_msgSend_initRequiringSecureCoding_(v3, v4, 0, v5);
    objc_msgSend_setRequiresSecureCoding_(inited, v7, 1, v8);
    objc_msgSend_encodeObject_forKey_(inited, v9, (uint64_t)v2, *MEMORY[0x1E0CB2CD0]);

    objc_msgSend_encodedData(inited, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

id IMGetXPCArrayFromDictionary(void *a1, const char *a2)
{
  void *v2;
  void *v3;

  v2 = 0;
  if (a1 && a2)
  {
    sub_190671E18(a2, a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    JWDecodeArray(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id JWDecodeArray(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  uint64_t v10;
  unint64_t v11;

  v1 = a1;
  v5 = v1;
  if (v1 && objc_msgSend_length(v1, v2, v3, v4))
  {
    v10 = 0;
    v11 = 0xAAAAAAAAAAAAAAAALL;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v6, (uint64_t)v5, 0, &v11, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void IMXPCConfigureConnection(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _xpc_connection_s *v10;
  _QWORD handler[4];
  id v12;
  id v13;
  id v14;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1906A3B94;
  handler[3] = &unk_1E2C45D18;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (_xpc_connection_s *)v5;
  xpc_connection_set_event_handler(v10, handler);
  xpc_connection_resume(v10);

}

CFIndex IMGetCachedDomainIntForKeyWithDefaultValue(CFStringRef applicationID, CFStringRef key, uint64_t a3)
{
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return a3;
  return result;
}

id JWDecodeCodableObjectWithStandardAllowlist(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v1 = a1;
  v5 = JWCopyCodableObjectStandardAllowlist();
  if (v1 && objc_msgSend_length(v1, v2, v3, v4))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A40]);
    v9 = (void *)objc_msgSend_initForReadingWithData_(v6, v7, (uint64_t)v1, v8);
    objc_msgSend__setAllowedClasses_(v9, v10, (uint64_t)v5, v11);
    objc_msgSend_decodeObject(v9, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id JWCopyCodableObjectStandardAllowlist()
{
  if (qword_1EE1DD8C0 != -1)
    dispatch_once(&qword_1EE1DD8C0, &unk_1E2C42DE8);
  return (id)qword_1EE1DD8B8;
}

void IMLogBacktraceToDepth(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (!v3 || _IMWillLog(v3))
  {
    sub_19069D0C0(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v33, (uint64_t)v37, 16);
    if (v7)
    {
      v15 = v7;
      v16 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v5);
          v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v17);
          if (v4)
          {
            if (objc_msgSend_isEqualToString_(v4, v8, (uint64_t)CFSTR("IDSDaemon"), v10))
            {
              if (qword_1EE1DDCC8)
              {
                sub_19069D1FC(CFSTR("IDSDaemon"), (uint64_t)v19, v20, v21, v22, v23, v24, v25, v18);
              }
              else if (_IMWillLog(CFSTR("IDSDaemon")))
              {
                _IMAlwaysLog(0, CFSTR("IDSDaemon"), CFSTR("%@"), v10, v11, v12, v13, v14, v18);
              }
            }
            else if (objc_msgSend_isEqualToString_(v4, v19, (uint64_t)CFSTR("IDSDAccount"), v21))
            {
              if (qword_1EE1DDCC8)
              {
                sub_19069D1FC(CFSTR("IDSDAccount"), (uint64_t)v26, v27, v28, v29, v30, v31, v32, v18);
              }
              else if (_IMWillLog(CFSTR("IDSDAccount")))
              {
                _IMAlwaysLog(0, CFSTR("IDSDAccount"), CFSTR("%@"), v10, v11, v12, v13, v14, v18);
              }
            }
            else if (objc_msgSend_isEqualToString_(v4, v26, (uint64_t)CFSTR("Power"), v28))
            {
              if (qword_1EE1DDCC8)
              {
                sub_19069D1FC(CFSTR("Power"), (uint64_t)v8, v9, v10, v11, v12, v13, v14, v18);
              }
              else if (_IMWillLog(CFSTR("Power")))
              {
                _IMAlwaysLog(0, CFSTR("Power"), CFSTR("%@"), v10, v11, v12, v13, v14, v18);
              }
            }
          }
          else if (qword_1EE1DDCC0)
          {
            sub_19069D270(CFSTR("%@"), (uint64_t)v8, v9, v10, v11, v12, v13, v14, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v17));
          }
          else
          {
            _IMWarn(CFSTR("%@"), (uint64_t)v8, v9, v10, v11, v12, v13, v14, v18);
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v33, (uint64_t)v37, 16);
      }
      while (v15);
    }

  }
}

uint64_t IMInsertArraysToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  BOOL v11;
  uint64_t v12;
  id *v13;
  id v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char **v20;
  id *v22;
  _QWORD *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  if (v10)
    v11 = a2 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    v22 = (id *)&a9;
    do
    {
      v13 = v22;
      v23 = v22 + 1;
      v14 = *v13;
      JWEncodeArray(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        OSLogHandleForIDSCategory("Warning");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v14;
          _os_log_impl(&dword_19066D000, v16, OS_LOG_TYPE_DEFAULT, "Failed to encode array: %@", buf, 0xCu);
        }

        objc_msgSend_data(MEMORY[0x1E0C99D50], v17, v18, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      sub_190673110(v15, a2, v10);

      v20 = (const char **)v23;
      v22 = (id *)(v23 + 1);
      a2 = *v20;
    }
    while (*v20);
  }

  return v12;
}

id JWEncodeArray(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v17;
  uint64_t v19;

  v1 = a1;
  v5 = v1;
  if (v1 && objc_msgSend_count(v1, v2, v3, v4))
  {
    v19 = 0;
    objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v6, (uint64_t)v5, 200, 0, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    if (v7)
      v16 = 1;
    else
      v16 = v19 == 0;
    if (v16)
    {
      v17 = v7;
    }
    else
    {
      _IMWarn(CFSTR("Error while encoding array %@"), v8, v9, v10, v11, v12, v13, v14, v19);
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

BOOL IMDAuditTokenTaskHasEntitlement(_OWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  const __CFBoolean *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFBoolean *v23;
  CFTypeID v24;
  _BOOL8 v25;
  char v27;
  CFTypeRef cf[2];
  __int128 v29;

  v3 = a2;
  if (qword_1ECD90DF0 != -1)
    dispatch_once(&qword_1ECD90DF0, &unk_1E2C42BA8);
  if (qword_1ECD90DE0 != -1)
    dispatch_once(&qword_1ECD90DE0, &unk_1E2C42BC8);
  v4 = *MEMORY[0x1E0C9AE00];
  v5 = a1[1];
  *(_OWORD *)cf = *a1;
  v29 = v5;
  v6 = off_1ECD90DE8(v4, cf);
  if (v6)
  {
    v14 = (const void *)v6;
    cf[0] = 0;
    v15 = (const __CFBoolean *)off_1ECD90DF8(v6, v3, cf);
    if (v15)
    {
      v23 = v15;
      v24 = CFGetTypeID(v15);
      v25 = v24 == CFBooleanGetTypeID() && CFBooleanGetValue(v23) != 0;
      CFRelease(v23);
    }
    else
    {
      v25 = 0;
    }
    if (cf[0])
    {
      _IMWarn(CFSTR("Unable to get entitlements for client task. Error: %@"), v16, v17, v18, v19, v20, v21, v22, (char)cf[0]);
      if (cf[0])
        CFRelease(cf[0]);
    }
    CFRelease(v14);
  }
  else
  {
    _IMWarn(CFSTR("Unable to create security task from audit token."), v7, v8, v9, v10, v11, v12, v13, v27);
    v25 = 0;
  }

  return v25;
}

void _IMWarn(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _IMAlwaysLogV(2, CFSTR("Warning"), a1, &a9);
}

void _IMAlwaysLogV(uint64_t a1, void *a2, void *a3, va_list a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *FormatString;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x19400E788]();
  FormatString = _IMFastCreateFormatString(v7, a4);
  _IMLogLevel(a1, CFSTR("[%@] %@"), v9, v10, v11, v12, v13, v14, (char)v16);

  objc_autoreleasePoolPop(v8);
}

__CFString *_IMFastCreateFormatString(void *a1, va_list a2)
{
  __CFString *v3;
  __CFString *Mutable;

  if (!a1)
    return 0;
  v3 = a1;
  Mutable = CFStringCreateMutable(0, 300);
  CFStringAppendFormatAndArguments(Mutable, 0, v3, a2);

  return Mutable;
}

void _IMLogLevel(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_19067AA90(a1, a2, &a9);
}

uint64_t IMXPCCreateServerConnection(const char *a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v10;
  uint64_t v11;

  dispatch_get_global_queue(2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_190670CC0(a1, v10, a2, a3, a4, a5, 0);
  v11 = objc_claimAutoreleasedReturnValue();

  return v11;
}

void im_local_object_peer_event_handler(_xpc_connection_s *a1, void *a2)
{
  im_local_object_peer_event_handler_is_syncReply(a1, a2, 0);
}

id sub_19067A2F4(void *a1, uint64_t a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;

  v5 = a1;
  v9 = a3;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8))
  {
    if (qword_1ECD90E80 != -1)
      dispatch_once(&qword_1ECD90E80, &unk_1E2C43228);
    v10 = objc_alloc(MEMORY[0x1E0CB3710]);
    v12 = (void *)objc_msgSend_initForReadingFromData_error_(v10, v11, (uint64_t)v5, 0);
    objc_msgSend_setDecodingFailurePolicy_(v12, v13, 0, v14);
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = v15;
    if (v9)
      objc_msgSend_addObjectsFromArray_(v15, v16, (uint64_t)v9, v17);
    if (a2)
    {
      if (objc_msgSend_containsObject_((void *)qword_1ECD90E68, v16, a2, v17))
        objc_msgSend_unionSet_(v18, v19, qword_1ECD90E70, v20);
      objc_msgSend_addObject_(v18, v19, a2, v20);
    }
    else
    {
      objc_msgSend_unionSet_(v18, v16, qword_1ECD90E70, v17);
    }
    objc_msgSend_decodeObjectOfClasses_forKey_(v12, v21, (uint64_t)v18, *MEMORY[0x1E0CB2CD0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void sub_19067A440(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    objc_msgSend_XPC(IMIDSLog, v3, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1906B6FC4((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);

    IMLogSimulateCrashForException(v2);
    objc_end_catch();
    JUMPOUT(0x19067A404);
  }
  _Unwind_Resume(exception_object);
}

void sub_19067A4C8()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v0, v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v4, v5, (uint64_t)CFSTR("Caches/com.apple.setmme"), v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD90AF8 = objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v13, v12);

}

void sub_19067A554(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;

  objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], a2, (uint64_t)CFSTR("mac.com"), a4, CFSTR("me.com"), CFSTR("icloud.com"), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD90C90;
  qword_1ECD90C90 = v4;

}

uint64_t sub_19067A5A8()
{
  uint64_t result;

  result = IMGetAppIntForKey(CFSTR("Log.RemoteObjects"));
  dword_1ECD90A78 = result;
  return result;
}

void sub_19067A5CC()
{
  id v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  v3 = objc_msgSend_initWithObjects_(v0, v1, (uint64_t)CFSTR("NSString"), v2, CFSTR("NSNumber"), CFSTR("NSCalendarDate"), CFSTR("NSDate"), CFSTR("NSArray"), CFSTR("NSDictionary"), CFSTR("NSMutableDictionary"), CFSTR("NSObject"), CFSTR("NSAttributedString"), CFSTR("NSMutableAttributedString"), CFSTR("NSValue"), CFSTR("NSMutableArray"), CFSTR("NSMutableString"), CFSTR("NSData"), CFSTR("NSMutableData"), CFSTR("NSError"),
         CFSTR("NSURLError"),
         CFSTR("NSURL"),
         CFSTR("NSURLRequest"),
         CFSTR("NSMutableURLRequest"),
         CFSTR("NSURLResponse"),
         0);
  v4 = (void *)qword_1EE1DD8B8;
  qword_1EE1DD8B8 = v3;

}

void sub_19067A6D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  objc_msgSend_controlCharacterSet(MEMORY[0x1E0CB3500], a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend_mutableCopy(v4, v5, v6, v7);

  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_formUnionWithCharacterSet_(v27, v12, (uint64_t)v11, v13);

  objc_msgSend_illegalCharacterSet(MEMORY[0x1E0CB3500], v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_formUnionWithCharacterSet_(v27, v18, (uint64_t)v17, v19);

  objc_msgSend_removeCharactersInString_(v27, v20, (uint64_t)CFSTR("+"), v21);
  v25 = objc_msgSend_copy(v27, v22, v23, v24);
  v26 = (void *)qword_1ECD90AD8;
  qword_1ECD90AD8 = v25;

}

uint64_t sub_19067A780(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isInternalInstall;
  timespec v9;
  uint64_t result;
  char v11;
  stat v12;

  objc_msgSend_sharedInstance(IMLockdownManager, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalInstall = objc_msgSend_isInternalInstall(v4, v5, v6, v7);

  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v9;
  *(timespec *)v12.st_qspare = v9;
  v12.st_birthtimespec = v9;
  *(timespec *)&v12.st_size = v9;
  v12.st_mtimespec = v9;
  v12.st_ctimespec = v9;
  *(timespec *)&v12.st_uid = v9;
  v12.st_atimespec = v9;
  *(timespec *)&v12.st_dev = v9;
  result = lstat("/var/mobile/Library/PPTDevice", &v12);
  v11 = isInternalInstall ^ 1;
  if ((_DWORD)result)
    v11 = 1;
  byte_1ECD90D98 = v11;
  return result;
}

void *sub_19067A7FC()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("PNCreateFormattedStringWithCountry", CFSTR("PhoneNumbers"));
  off_1EE1DD628 = result;
  return result;
}

uint64_t sub_19067A828(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3500], a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_mutableCopy(v4, v5, v6, v7);
  v9 = (void *)qword_1ECD90E50;
  qword_1ECD90E50 = v8;

  objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3500], v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_mutableCopy(v13, v14, v15, v16);
  v18 = (void *)qword_1ECD90E58;
  qword_1ECD90E58 = v17;

  objc_msgSend_addCharactersInString_((void *)qword_1ECD90E58, v19, (uint64_t)CFSTR("+#*,;px"), v20);
  objc_msgSend_invert((void *)qword_1ECD90E50, v21, v22, v23);
  return objc_msgSend_invert((void *)qword_1ECD90E58, v24, v25, v26);
}

uint64_t sub_19067A8B8()
{
  void *v0;

  pthread_mutex_lock(&stru_1ECD909F0);
  v0 = (void *)qword_1EE1DD900;
  qword_1EE1DD900 = 0;

  return pthread_mutex_unlock(&stru_1ECD909F0);
}

void *sub_19067A8F4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CPPhoneNumberCopyCountryCodeForIncomingTextMessage", CFSTR("AppSupport"));
  off_1ECD90AE8 = result;
  return result;
}

uint64_t sub_19067A920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_postNotification_, *(_QWORD *)(a1 + 40), a4);
}

IMRemoteObjectBroadcaster *sub_19067A92C()
{
  IMRemoteObjectBroadcaster *result;

  result = objc_alloc_init(IMRemoteObjectBroadcaster);
  qword_1ECD90F18 = (uint64_t)result;
  return result;
}

void sub_19067A950()
{
  IMMobileNetworkManager *v0;
  void *v1;

  v0 = objc_alloc_init(IMMobileNetworkManager);
  v1 = (void *)qword_1ECD90FD0;
  qword_1ECD90FD0 = (uint64_t)v0;

}

void sub_19067A978()
{
  IMLockdownManager *v0;
  void *v1;

  v0 = objc_alloc_init(IMLockdownManager);
  v1 = (void *)qword_1ECD90FD8;
  qword_1ECD90FD8 = (uint64_t)v0;

}

void sub_19067A9A0()
{
  IMSystemMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(IMSystemMonitor);
  v1 = (void *)qword_1ECD90FC0;
  qword_1ECD90FC0 = (uint64_t)v0;

}

void sub_19067A9C8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD90D28;
  qword_1ECD90D28 = (uint64_t)v1;

}

void sub_19067A9EC()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "AccountEnabled");
  v1 = (void *)qword_1ECD90E78;
  qword_1ECD90E78 = (uint64_t)v0;

}

void sub_19067AA1C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "Registration");
  v1 = (void *)qword_1ECD90F50;
  qword_1ECD90F50 = (uint64_t)v0;

}

void sub_19067AA50()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "timing");
  v1 = (void *)qword_1ECD90F28;
  qword_1ECD90F28 = (uint64_t)v0;

}

uint64_t sub_19067AA80(_QWORD *a1)
{
  return MEMORY[0x1E0DE7D20](a1[4], sel_postNotificationName_object_userInfo_, a1[5], a1[6]);
}

void sub_19067AA90(uint64_t a1, void *a2, va_list a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  __CFString *FormatString;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  __asl_object_s *v33;
  __asl_object_s *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  __CFString *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  id v48;

  v5 = a2;
  v48 = v5;
  if (!qword_1ECD90BE0)
  {
    IMGetMainBundle((uint64_t)v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    if (v9)
    {
      objc_msgSend_bundleIdentifier(v9, v10, v11, v12);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)qword_1ECD90BE0;
      qword_1ECD90BE0 = v14;

    }
    if (!objc_msgSend_length((void *)qword_1ECD90BE0, v10, v11, v12))
    {
      v16 = (void *)qword_1ECD90BE0;
      qword_1ECD90BE0 = (uint64_t)CFSTR("com.apple.imlogging");

    }
  }
  v17 = (void *)MEMORY[0x19400E788]();
  FormatString = _IMFastCreateFormatString(v48, a3);
  if ((unint64_t)(a1 - 1) >= 4)
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v18, 5, v19);
  else
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v18, (6 - a1), v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (byte_1EE1DDCD8)
  {
    IMPrintf(CFSTR("%@"), (uint64_t)v21, v22, v23, v24, v25, v26, v27, (uint64_t)FormatString);
  }
  else if (objc_msgSend_length(FormatString, v21, v22, v23))
  {
    v32 = (const char *)objc_msgSend_UTF8String((void *)qword_1ECD90BE0, v29, v30, v31);
    v33 = asl_open(0, v32, 2u);
    v34 = asl_new(0);
    objc_msgSend_stringValue(v28, v35, v36, v37);
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = (const char *)objc_msgSend_UTF8String(v38, v39, v40, v41);
    asl_set(v34, "Level", v42);

    v43 = objc_retainAutorelease(FormatString);
    v47 = (const char *)objc_msgSend_UTF8String(v43, v44, v45, v46);
    asl_set(v34, "Message", v47);
    asl_send(v33, v34);
    MEMORY[0x19400E3E0](v34);
    MEMORY[0x19400E3D4](v33);
  }

  objc_autoreleasePoolPop(v17);
}

id IMLoggingStringForArray(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v5 = (void *)objc_msgSend_initWithString_(v2, v3, (uint64_t)CFSTR("("), v4);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v1;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v24;
    v14 = 1;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v6);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
        if ((v14 & 1) == 0)
          objc_msgSend_appendString_(v5, v9, (uint64_t)CFSTR(", "), v11, (_QWORD)v23);
        objc_msgSend_description(v16, v9, v10, v11, (_QWORD)v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v5, v18, (uint64_t)v17, v19);

        v14 = 0;
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v23, (uint64_t)v27, 16);
      v14 = 0;
    }
    while (v12);
  }

  objc_msgSend_appendString_(v5, v20, (uint64_t)CFSTR(")"), v21);
  return v5;
}

CFIndex IMGetCachedDomainIntForKey(CFStringRef applicationID, CFStringRef key)
{
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 0;
  return result;
}

__CFString *sub_19067AE2C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __CFString *v4;

  v4 = (__CFString *)objc_msgSend_mutableCopy(a1, a2, a3, a4);
  CFStringTrimWhitespace(v4);
  return v4;
}

id sub_19067AE54(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_count(a1, a2, a3, a4);
  if (v5)
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v6, (uint64_t)a1, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t sub_19067AE8C()
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

id sub_19067C3A8()
{
  if (qword_1EE1DD910 != -1)
    dispatch_once(&qword_1EE1DD910, &unk_1E2C42BE8);
  return (id)qword_1EE1DD908;
}

void sub_19067C3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;

  v9 = (objc_class *)IMWeakLinkClass(CFSTR("SDRDiagnosticReporter"), CFSTR("SymptomDiagnosticReporter"));
  if (v9)
  {
    v17 = objc_alloc_init(v9);
    v18 = (void *)qword_1EE1DD908;
    qword_1EE1DD908 = (uint64_t)v17;

  }
  else
  {
    _IMWarn(CFSTR("Unable to link against <SymptomDiagnosticReporter.framework/SDRDiagnosticReporter> - ABCs will not be reported."), v10, v11, v12, v13, v14, v15, v16, a9);
  }
}

void IMReportAutoBugCapture(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  id v29;
  const char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  _QWORD v38[4];
  id v39;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  sub_19067C3A8();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v14, v15, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleIdentifier(v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(v21, v27, (uint64_t)v9, (uint64_t)v10, v11, v12, v26, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_19067C5E0;
    v38[3] = &unk_1E2C43A70;
    v29 = v28;
    v39 = v29;
    v31 = objc_msgSend_snapshotWithSignature_delay_events_payload_actions_reply_(v21, v30, (uint64_t)v29, 0, v13, 0, v38, 15.0);
    if (_IMWillLog(CFSTR("ABC")))
    {
      if (v31)
        v37 = CFSTR("Auto Bug Capture took a snapshot for signature %@");
      else
        v37 = CFSTR("Auto Bug Capture failed to take snapshot for signature %@");
      _IMAlwaysLog(0, CFSTR("ABC"), v37, v32, v33, v34, v35, v36, (char)v29);
    }

  }
  else
  {
    _IMWarn(CFSTR("Dropping ABC domain:%@ type:%@ subType:%@ subtypeContext:%@ payload:%@"), (uint64_t)v14, v15, v16, v17, v18, v19, v20, (char)v9);
  }

}

void sub_19067C5E0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (_IMWillLog(CFSTR("ABC")))
    _IMAlwaysLog(0, CFSTR("ABC"), CFSTR("Received response from Auto Bug Capture for signature %@ - response: %@"), v3, v4, v5, v6, v7, *(_QWORD *)(a1 + 32));

}

id IMCanonicalFormForEmail(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  objc_msgSend_lowercaseString(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasMobileMeSuffix(v4, v5, v6, v7))
  {
    objc_msgSend_stripMobileMSuffixIfPresent(v4, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByAppendingString_(v11, v12, (uint64_t)CFSTR("@icloud.com"), v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t IMAreEmailsLogicallyTheSame(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t isEqualToIgnoringCase;

  v3 = a2;
  IMCanonicalFormForEmail(a1, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMCanonicalFormForEmail(v3, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v7, v12, (uint64_t)v11, v13);
  return isEqualToIgnoringCase;
}

uint64_t IMStringIsStewieEmergency(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](a1, sel__appearsToBeStewieEmergency, a3, a4);
}

uint64_t IMStringIsStewieRoadside(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](a1, sel__appearsToBeStewieRoadside, a3, a4);
}

uint64_t IMStringIsInHardcodedEmergencyNumberSet(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = qword_1EE1DD598;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&qword_1EE1DD598, &unk_1E2C42C08);
  v3 = (void *)qword_1EE1DD590;
  IMNormalizedPhoneNumberForPhoneNumber(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend_containsObject_(v3, v5, (uint64_t)v4, v6);
  return v7;
}

void sub_19067C7A8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;

  objc_msgSend_set(MEMORY[0x1E0C99E20], a2, a3, a4);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("911"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v5, (uint64_t)v4, v6);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("112"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v8, (uint64_t)v7, v9);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("000"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v11, (uint64_t)v10, v12);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("08"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v14, (uint64_t)v13, v15);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("110"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v17, (uint64_t)v16, v18);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("118"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v20, (uint64_t)v19, v21);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("119"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v23, (uint64_t)v22, v24);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("103"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v26, (uint64_t)v25, v27);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("105"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v29, (uint64_t)v28, v30);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("115"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v32, (uint64_t)v31, v33);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("100"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v35, (uint64_t)v34, v36);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("122"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v38, (uint64_t)v37, v39);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("105"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v41, (uint64_t)v40, v42);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("190"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v44, (uint64_t)v43, v45);

  IMNormalizedPhoneNumberForPhoneNumber(CFSTR("133"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v54, v47, (uint64_t)v46, v48);

  v52 = objc_msgSend_copy(v54, v49, v50, v51);
  v53 = (void *)qword_1EE1DD590;
  qword_1EE1DD590 = v52;

}

uint64_t IMStringIsEmergencyPhoneNumber(void *a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t isPhoneNumberEmergencyNumber;
  char v15;

  v8 = a1;
  if (qword_1EE1DD388 != -1)
    dispatch_once(&qword_1EE1DD388, &unk_1E2C437A8);
  v9 = (void *)qword_1EE1DD380;
  if (!qword_1EE1DD380)
  {
    _IMWarn(CFSTR("Failed to weak link FTSelectedPNRSubscription from IMFoundation for IMStringIsEmergencyPhoneNumber"), (uint64_t)v1, v2, v3, v4, v5, v6, v7, v15);
    v9 = (void *)qword_1EE1DD380;
  }
  objc_msgSend_sharedInstance(v9, v1, v2, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isPhoneNumberEmergencyNumber = objc_msgSend_isPhoneNumberEmergencyNumber_(v10, v11, (uint64_t)v8, v12);

  return isPhoneNumberEmergencyNumber;
}

uint64_t sub_19067CB1C()
{
  uint64_t result;

  result = IMWeakLinkClass(CFSTR("FTSelectedPNRSubscription"), CFSTR("FTServices"));
  qword_1EE1DD380 = result;
  return result;
}

BOOL IMStringIsEmpty(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;

  objc_msgSend_trimmedString(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_length(v4, v5, v6, v7) == 0;

  return v8;
}

id sub_19067CB80(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    v10 = (void *)qword_1EE1DD918;
    if (!qword_1EE1DD918)
    {
      objc_msgSend_resourcePath(a1, v6, v7, v8);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)qword_1EE1DD918;
      qword_1EE1DD918 = v11;

      v10 = (void *)qword_1EE1DD918;
    }
    v9 = v10;
  }
  else
  {
    objc_msgSend_resourcePath(a1, v6, v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

BOOL sub_19067CBF8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend_null(MEMORY[0x1E0C99E38], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == a1;

  return v6;
}

uint64_t sub_19067CC34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  v5 = qword_1EE1DD920;
  if (!qword_1EE1DD920)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v7 = (void *)qword_1EE1DD920;
    qword_1EE1DD920 = (uint64_t)v6;

    objc_msgSend_setFormatterBehavior_((void *)qword_1EE1DD920, v8, 1040, v9);
    objc_msgSend_setNumberStyle_((void *)qword_1EE1DD920, v10, 0, v11);
    v5 = qword_1EE1DD920;
  }
  return MEMORY[0x1E0DE7D20](v5, sel_stringFromNumber_, a1, a4);
}

id sub_19067CC94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)qword_1EE1DD928;
  if (!qword_1EE1DD928)
  {
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], a2, (uint64_t)CFSTR("\\:"), a4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1EE1DD928;
    qword_1EE1DD928 = v5;

    v4 = (void *)qword_1EE1DD928;
  }
  return v4;
}

id sub_19067CCE0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return (id)objc_msgSend_copyStringGUIDForObject_(a1, a2, a3, a4);
}

uint64_t sub_19067CCF4()
{
  unsigned int v0;
  const char *v1;
  uint64_t v2;

  v0 = FastRandomUInt();
  return objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v1, (uint64_t)CFSTR("%u"), v2, v0 % 0x3B9ACA00);
}

uint64_t FastRandomUInt()
{
  if (qword_1EE1DD890 != -1)
    dispatch_once(&qword_1EE1DD890, &unk_1E2C43B60);
  return random();
}

id sub_19067CD84()
{
  uint64_t v0;
  unsigned int v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = FastRandomUInt() % 0x3B9ACA00;
  v1 = FastRandomUInt();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Chat%u%u"), v3, v0, v1 % 0x3B9ACA00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t sub_19067CE18(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  unsigned __int8 v8;

  v8 = 0;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileExistsAtPath_isDirectory_(v5, v6, a1, (uint64_t)&v8);

  return v8;
}

uint64_t sub_19067CE68(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  const char *v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  char v10[16];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(v10, 170, sizeof(v10));
  v9 = 0xAAAAAAAAAAAAAAAALL;
  v5 = objc_msgSend_length(a1, a2, a3, a4);
  result = objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(a1, v6, (uint64_t)v10, 15, &v9, 4, 1, 0, v5, 0);
  if ((_DWORD)result)
  {
    v10[v9] = 0;
    v8 = 0xAAAAAAAAAAAAAAAALL;
    if (sscanf(v10, "%lx", &v8) == 1)
      return v8;
    else
      return 0;
  }
  return result;
}

uint64_t sub_19067CF2C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_trimmedString(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_longLongValue(v4, v5, v6, v7);

  return v8;
}

uint64_t sub_19067CF60(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  v8 = objc_msgSend_length(a1, v5, v6, v7);
  objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x1E0C99DC8], v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_compare_options_range_locale_(a1, v13, (uint64_t)v4, 961, 0, v8, v12);

  return v14;
}

CFStringRef sub_19067CFD8(CFStringRef originalString)
{
  return (id)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_1E2C46CC8);
}

id sub_19067CFFC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E0CB3500], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(a1, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_19067D048(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;

  if (objc_msgSend_length(a1, a2, a3, a4))
  {
    objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v5, (uint64_t)a1, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend_stringByRemovingURLEscapes(a1, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E0CB3500], v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend_mutableCopy(v15, v16, v17, v18);

      objc_msgSend_addCharactersInString_(v19, v20, (uint64_t)CFSTR("#"), v21);
      objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v11, v22, (uint64_t)v19, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v24, v25, v26, v27))
      {
        objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v28, (uint64_t)v24, v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

uint64_t sub_19067D128(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("E:%@"), a4, a1);
}

id sub_19067D15C(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  IMFormatPhoneNumber(a1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v1, v3, (uint64_t)CFSTR("P:%@"), v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t sub_19067D1B8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;

  if ((objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("H:"), a4) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v5, (uint64_t)CFSTR("D:"), v6) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v7, (uint64_t)CFSTR("E:"), v8) & 1) != 0)
  {
    return 1;
  }
  if ((objc_msgSend_hasPrefix_(a1, v9, (uint64_t)CFSTR("P:"), v10) & 1) != 0)
    return 0;
  if ((objc_msgSend_hasPrefix_(a1, v12, (uint64_t)CFSTR("A:"), v13) & 1) != 0)
    return 6;
  if ((objc_msgSend_hasPrefix_(a1, v14, (uint64_t)CFSTR("tel:"), v15) & 1) != 0)
    return 0;
  if ((objc_msgSend_hasPrefix_(a1, v16, (uint64_t)CFSTR("mailto:"), v17) & 1) != 0)
    return 1;
  if ((objc_msgSend_hasPrefix_(a1, v18, (uint64_t)CFSTR("urn:biz:"), v19) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v20, (uint64_t)CFSTR("biz:"), v21) & 1) != 0)
  {
    return 3;
  }
  if ((objc_msgSend_hasPrefix_(a1, v22, (uint64_t)CFSTR("temp:"), v23) & 1) != 0)
    return 4;
  if ((objc_msgSend_hasPrefix_(a1, v24, (uint64_t)CFSTR("pseud:"), v25) & 1) != 0)
    return 5;
  if ((objc_msgSend_hasPrefix_(a1, v26, (uint64_t)CFSTR("dev:"), v27) & 1) != 0)
    return 6;
  if ((objc_msgSend_hasPrefix_(a1, v28, (uint64_t)CFSTR("urn:"), v29) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v30, (uint64_t)CFSTR("ds:"), v31) & 1) != 0)
  {
    return 2;
  }
  if (objc_msgSend_hasPrefix_(a1, v32, (uint64_t)CFSTR("sip:"), v33))
    return 7;
  return -1;
}

id sub_19067D33C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_lowercaseString(a1, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("mailto:%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_19067D394(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  IMFormatPhoneNumber(a1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v1, v3, (uint64_t)CFSTR("tel:%@"), v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id sub_19067D3F0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  if (objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("urn:"), a4))
  {
    v8 = a1;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_lowercaseString(a1, v5, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v9, v11, (uint64_t)CFSTR("urn:%@"), v12, v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

id sub_19067D474(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_lowercaseString(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("urn:biz:"), v6))
  {
    v9 = v4;
  }
  else
  {
    if (objc_msgSend_hasPrefix_(v4, v7, (uint64_t)CFSTR("biz:"), v8))
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("urn:%@"), v11, v4);
    else
      objc_msgSend_stringByAppendingString_(CFSTR("urn:biz:"), v10, (uint64_t)v4, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;

  return v12;
}

id sub_19067D50C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  id v7;

  if (objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("temp:"), a4))
  {
    v7 = a1;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(CFSTR("temp:"), v5, (uint64_t)a1, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

id sub_19067D554(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  id v7;

  if (objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("pseud:"), a4))
  {
    v7 = a1;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(CFSTR("pseud:"), v5, (uint64_t)a1, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

id sub_19067D59C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  id v7;

  if (objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("dev:"), a4))
  {
    v7 = a1;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(CFSTR("dev:"), v5, (uint64_t)a1, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

id sub_19067D5E4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  id v7;

  if (objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("sip:"), a4))
  {
    v7 = a1;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(CFSTR("sip:"), v5, (uint64_t)a1, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

uint64_t sub_19067D62C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend__FZBestGuessFZIDType(a1, a2, a3, a4);
  return MEMORY[0x1E0DE7D20](a1, sel__URIFromFZIDType_, v5, v6);
}

uint64_t sub_19067D654(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringByAppendingString_(CFSTR("mailto:"), a2, a1, a4);
}

uint64_t sub_19067D664(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringByAppendingString_(CFSTR("tel:"), a2, a1, a4);
}

uint64_t sub_19067D674(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringByAppendingString_(CFSTR("urn:"), a2, a1, a4);
}

uint64_t sub_19067D698(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend__FZBestGuessFZIDType(a1, a2, a3, a4);
  return MEMORY[0x1E0DE7D20](a1, sel__URIFromCanonicalizedFZIDType_, v5, v6);
}

uint64_t sub_19067D6C0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  if ((objc_msgSend__appearsToBeSIPID(a1, a2, a3, a4) & 1) != 0)
    return 7;
  if ((objc_msgSend__appearsToBePhoneNumber(a1, v5, v6, v7) & 1) != 0)
    return 0;
  if ((objc_msgSend__appearsToBeEmail(a1, v9, v10, v11) & 1) != 0)
    return 1;
  if ((objc_msgSend__appearsToBeDSID(a1, v12, v13, v14) & 1) != 0)
    return 2;
  if ((objc_msgSend__appearsToBeBusinessID(a1, v15, v16, v17) & 1) != 0)
    return 3;
  if ((objc_msgSend__appearsToBeTemporaryID(a1, v18, v19, v20) & 1) != 0)
    return 4;
  if ((objc_msgSend__appearsToBePseudonymID(a1, v21, v22, v23) & 1) != 0)
    return 5;
  if (objc_msgSend__appearsToBeHardwareID(a1, v24, v25, v26))
    return 6;
  return -1;
}

id sub_19067D778(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case -1:
    case 1:
      objc_msgSend__URIFromCanonicalizedEmail(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend__URIFromCanonicalizedPhoneNumber(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend__URIFromCanonicalizedDSID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend__URIFromCanonicalizedBusinessID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend__URIFromCanonicalizedTemporaryID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend__URIFromCanonicalizedPseudonymID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend__URIFromCanonicalizedHardwareID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend__URIFromCanonicalizedSIPID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

id sub_19067D810(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case -1:
    case 1:
      objc_msgSend__URIFromEmail(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend__URIFromPhoneNumber(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend__URIFromDSID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend__URIFromBusinessID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend__URIFromTemporaryID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend__URIFromPseudonymID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend__URIFromHardwareID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend__URIFromSIPID(a1, a2, a3, a4, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

id sub_19067D8A8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4;

  switch(a3)
  {
    case -1:
    case 1:
      objc_msgSend__FZIDFromEmail(a1, a2, a3, a4);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend__FZIDFromPhoneNumber(a1, a2, a3, a4);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
      v4 = a1;
      break;
    case 6:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("A:%@"), a4, a1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

id sub_19067D92C(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  CC_LONG v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v5 = (const char *)objc_msgSend_UTF8String(v1, v2, v3, v4);
  memset(md, 170, sizeof(md));
  v6 = strlen(v5);
  CC_MD5(v5, v6, md);
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v12 = (void *)objc_msgSend_initWithCapacity_(v7, v8, 32, v9);
  for (i = 0; i != 16; ++i)
    objc_msgSend_appendFormat_(v12, v10, (uint64_t)CFSTR("%02x"), v11, md[i], *(_QWORD *)md, *(_QWORD *)&md[8], v16);
  return v12;
}

__CFString *IMCopyStringWithLatinNumbers(const __CFString *a1)
{
  uint64_t Length;
  uint64_t v3;
  __CFString *Mutable;
  CFIndex i;
  UChar32 CharacterAtIndex;
  uint64_t v7;
  UniChar chars;

  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  if (Length < 1)
    return 0;
  v3 = Length;
  Mutable = CFStringCreateMutable(0, Length);
  for (i = 0; i != v3; ++i)
  {
    chars = -21846;
    CharacterAtIndex = CFStringGetCharacterAtIndex(a1, i);
    chars = CharacterAtIndex;
    v7 = u_charDigitValue(CharacterAtIndex);
    if ((_DWORD)v7 == -1)
      CFStringAppendCharacters(Mutable, &chars, 1);
    else
      CFStringAppendFormat(Mutable, 0, CFSTR("%d"), v7);
  }
  return Mutable;
}

uint64_t sub_19067DABC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  if ((objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("urn:ds:"), a4) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v5, (uint64_t)CFSTR("ds:"), v6) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend_hasPrefix_(a1, v7, (uint64_t)CFSTR("DS:"), v8);
  }
}

uint64_t sub_19067DB18(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("sip:"), a4);
}

uint64_t sub_19067DB24(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("stewie:emergency:"), a4);
}

uint64_t sub_19067DB30(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, (uint64_t)CFSTR("stewie:roadside:"), a4);
}

id sub_19067DB3C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  objc_msgSend_stringByExpandingTildeInPath(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByStandardizingPath(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByResolvingSymlinksInPath(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v14, (uint64_t)v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13;
  if (v16)
  {
    objc_msgSend_URLByResolvingAliasFileAtURL_options_error_(MEMORY[0x1E0C99E98], v15, (uint64_t)v16, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    v17 = v13;
    if (v18)
    {
      objc_msgSend_path(v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v17;
}

uint64_t sub_19067DC00(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = qword_1EE1DD930;
  if (!qword_1EE1DD930)
  {
    objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], a2, 0, a4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1EE1DD930;
    qword_1EE1DD930 = v6;

    v5 = qword_1EE1DD930;
  }
  return MEMORY[0x1E0DE7D20](a1, sel_rangeOfCharacterFromSet_options_range_, v5, 7);
}

id sub_19067DC68(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByTrimmingCharactersInSet_(a1, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_19067DCB4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(a1, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingPathExtension(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingLastPathComponent(a1, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathExtension(a1, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uniqueFilename_atPath_ofType_(v5, v22, (uint64_t)v13, (uint64_t)v17, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

__CFString *sub_19067DD64(void *a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  sub_19067DDCC();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByRemovingCharactersFromSet_(a1, v3, (uint64_t)v2, v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_1E2C46CC8;
  v7 = v5;

  return v7;
}

id sub_19067DDCC()
{
  if (qword_1EE1DD878 != -1)
    dispatch_once(&qword_1EE1DD878, &unk_1E2C440C8);
  return (id)qword_1EE1DD870;
}

__CFString *sub_19067DE0C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  if (qword_1EE1DD790 != -1)
    dispatch_once(&qword_1EE1DD790, &unk_1E2C440E8);
  objc_msgSend_stringByRemovingCharactersFromSet_(a1, a2, qword_1EE1DD788, a4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_1E2C46CC8;
  v7 = v5;

  return v7;
}

id sub_19067DE88(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  if (objc_msgSend_length(a1, a2, a3, a4))
  {
    objc_msgSend_trimmedString(a1, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___stringByStrippingAttachmentAndControlCharacters(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (id)objc_msgSend_mutableCopy(v12, v13, v14, v15);
    objc_msgSend_replaceNewlinesWithSpaces(v16, v17, v18, v19);

  }
  else
  {
    v16 = a1;
  }
  return v16;
}

uint64_t sub_19067DEF0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("\u202D%@\u202C"), a4, a1);
}

BOOL sub_19067DF24(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;

  objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3500], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  objc_msgSend_invert(v9, v10, v11, v12);
  objc_msgSend_stringByTrimmingCharactersInSet_(a1, v13, (uint64_t)v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (unint64_t)objc_msgSend_length(v15, v16, v17, v18) > 5;

  return v19;
}

id sub_19067DF9C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  id v24;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_query(a1, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("&");
    if (!v11)
      v12 = CFSTR("?");
    v13 = v12;

    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_absoluteString(a1, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_initWithFormat_(v14, v19, (uint64_t)CFSTR("%@%@%@"), v20, v18, v13, v4);

    objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v22, (uint64_t)v21, v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = a1;
  }

  return v24;
}

uint64_t sub_19067E080(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  const char *v6;
  uint64_t result;
  const char *v8;
  uint64_t v9;
  const char *v10;

  v5 = objc_msgSend_length(a1, a2, a3, a4);
  result = objc_msgSend___rangeOfNewlineInRange_(a1, v6, 0, v5);
  if (v8)
  {
    v9 = result;
    do
    {
      objc_msgSend_replaceCharactersInRange_withString_(a1, v8, v9, (uint64_t)v8, CFSTR(" "));
      result = objc_msgSend___rangeOfNewlineInRange_(a1, v10, 0, v9);
      v9 = result;
    }
    while (v8);
  }
  return result;
}

id sub_19067E0F4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  const char *v21;
  void *v22;

  objc_msgSend_string(a1, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trimmedString(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(v9, v10, v11, v12);
  if (v13 == objc_msgSend_length(a1, v14, v15, v16))
    goto LABEL_2;
  if (!v13)
  {
    v22 = 0;
    goto LABEL_8;
  }
  v20 = objc_msgSend_rangeOfString_(v5, v17, (uint64_t)v9, v18);
  if (!v21)
  {
LABEL_2:
    v19 = a1;
  }
  else
  {
    objc_msgSend_attributedSubstringFromRange_(a1, v21, v20, (uint64_t)v21);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v19;
LABEL_8:

  return v22;
}

void *IMCreateSuperFormatStringWithAppendedFileTransfers(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v7 = (id)objc_msgSend_mutableCopy(a1, v4, v5, v6);
  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0C99D80]);
        v17 = (void *)objc_msgSend_initWithObjectsAndKeys_(v14, v15, v13, v16, CFSTR("__kIMFileTransferGUIDAttributeName"), 0);
        v18 = objc_alloc(MEMORY[0x1E0CB3498]);
        v20 = (void *)objc_msgSend_initWithString_attributes_(v18, v19, (uint64_t)CFSTR("\uFFFC"), (uint64_t)v17);
        objc_msgSend_appendAttributedString_(v7, v21, (uint64_t)v20, v22);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v10);
  }

  v24 = IMCreateSuperFormatStringByAttachingMessageParts(v7);
  return v24;
}

void *IMCreateSuperFormatStringByAttachingMessageParts(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  unint64_t v31;
  char v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  const char *v42;
  id v44;
  uint64_t v45;
  unint64_t v46;

  v1 = a1;
  if (!objc_msgSend_length(v1, v2, v3, v4))
  {
    v13 = (id)objc_msgSend_copy(v1, v5, v6, v7);
    goto LABEL_5;
  }
  v8 = objc_msgSend_length(v1, v5, v6, v7);
  if (!objc_msgSend_attribute_existsInRange_(v1, v9, (uint64_t)CFSTR("__kIMMessagePartAttributeName"), 0, v8))
  {
    v44 = v1;
    v14 = (void *)objc_msgSend_mutableCopy(v1, v10, v11, v12);
    v18 = objc_msgSend_length(v14, v15, v16, v17);
    objc_msgSend_removeAttribute_range_(v14, v19, (uint64_t)CFSTR("__kIMMessagePartAttributeName"), 0, v18);
    v23 = objc_msgSend_length(v14, v20, v21, v22);
    objc_msgSend_string(v14, v24, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
LABEL_21:

      v1 = v44;
      goto LABEL_22;
    }
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 1;
    while (1)
    {
      v45 = 0xAAAAAAAAAAAAAAAALL;
      v46 = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend_attributesAtIndex_longestEffectiveRange_inRange_(v14, v27, v31, (uint64_t)&v45, v31, v23 - v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend_characterAtIndex_(v28, v34, v45, v35);
      if (v36 == 65532)
      {
        objc_msgSend_objectForKey_(v33, v37, (uint64_t)CFSTR("__kIMEmojiImageAttributeName"), v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          if ((v32 & 1) == 0)
LABEL_17:
            v29 = (v29 + 1);
          v30 = 1;
LABEL_19:
          objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v37, v29, v38);
          goto LABEL_20;
        }
        if ((v32 & 1) != 0)
        {
          v30 = 0;
          goto LABEL_19;
        }
      }
      else
      {
        if ((v32 & 1) != 0)
        {
          v30 = v36 == 65533;
          goto LABEL_19;
        }
        if (v36 == 65533)
          goto LABEL_17;
      }
      v40 = v30;
      v30 = 0;
      v29 = (v29 + v40);
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v37, v29, v38);
LABEL_20:
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addAttribute_value_range_(v14, v42, (uint64_t)CFSTR("__kIMMessagePartAttributeName"), (uint64_t)v41, v45, v46);

      v31 = v46 + v45;
      v32 = 0;
      if (v31 >= v23)
        goto LABEL_21;
    }
  }
  v13 = v1;
LABEL_5:
  v14 = v13;
LABEL_22:

  return v14;
}

void sub_19067E520(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  objc_msgSend_string(a1, a2, a3, a4);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invertedSet(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_length(a1, v13, v14, v15);
  v18 = objc_msgSend_rangeOfCharacterFromSet_options_(v26, v17, (uint64_t)v12, 6);
  v20 = v19;
  if (v19)
    v21 = v18;
  else
    v21 = -1;
  if (v16 > (unint64_t)&v19[v21])
    objc_msgSend_deleteCharactersInRange_(a1, v19, (uint64_t)&v19[v21], v16 - (_QWORD)&v19[v21]);
  if (v20)
  {
    v22 = objc_msgSend_rangeOfCharacterFromSet_options_(v26, v19, (uint64_t)v12, 2);
    if (!v23)
      v22 = objc_msgSend_length(v26, 0, v24, v25);
    if (v22)
      objc_msgSend_deleteCharactersInRange_(a1, v23, 0, v22);
  }

}

void sub_19067E5F8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  objc_msgSend_string(a1, a2, a3, a4);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_length(v20, v5, v6, v7);
  v10 = objc_msgSend___rangeOfNewlineInRange_(v20, v9, 0, v8);
  if (v11)
  {
    v14 = v10;
    v15 = (uint64_t)v11;
    objc_msgSend_beginEditing(a1, v11, v12, v13);
    do
    {
      objc_msgSend_replaceCharactersInRange_withString_(a1, v16, v14, v15, CFSTR(" "));
      v14 = objc_msgSend___rangeOfNewlineInRange_(v20, v17, 0, v14);
      v15 = (uint64_t)v16;
    }
    while (v16);
    objc_msgSend_endEditing(a1, 0, v18, v19);
  }

}

void sub_19067E69C(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = objc_msgSend_length(a1, v11, v12, v13);
  if (v14 << 32)
  {
    v16 = 0;
    v17 = (int)v14;
    do
    {
      v22 = 0xAAAAAAAAAAAAAAAALL;
      v23 = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend_attribute_atIndex_effectiveRange_(a1, v15, (uint64_t)v8, v16, &v22);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v18;
      if (v18 == v9 || objc_msgSend_isEqual_(v18, v19, (uint64_t)v9, v20))
      {
        if (v10)
          objc_msgSend_addAttribute_value_range_(a1, v19, (uint64_t)v8, (uint64_t)v10, v22, v23);
        else
          objc_msgSend_removeAttribute_range_(a1, v19, (uint64_t)v8, v22, v23);
      }
      v16 = v23 + v22;

    }
    while (v16 < v17);
  }

}

void sub_19067E794(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  int v9;
  unint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v9 = objc_msgSend_length(a1, v5, v6, v7);
  if (v9)
  {
    v10 = 0;
    do
    {
      v13 = 0xAAAAAAAAAAAAAAAALL;
      v14 = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend_attribute_atIndex_effectiveRange_(a1, v8, (uint64_t)v4, v10, &v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend_deleteCharactersInRange_(a1, v11, v13, v14);
        v9 -= v14;
      }
      else
      {
        v10 = v14 + v13;
      }

    }
    while (v10 < v9);
  }

}

uint64_t sub_19067E840(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend___imArrayByApplyingBlock_(a1, a2, (uint64_t)&unk_1E2C43AC8, a4);
}

id sub_19067E84C(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  v3 = (void *)MEMORY[0x19400E788]();
  objc_msgSend__stripPotentialTokenURIWithToken_(v2, v4, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);

  return v6;
}

id sub_19067E8A8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (!objc_msgSend_count(a1, a2, a3, a4))
    return a1;
  v4 = (void *)MEMORY[0x19400E788]();
  JWEncodeKeyedCodableObject(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  JWDecodeKeyedCodableObject(v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return (id)v6;
}

uint64_t sub_19067E928(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t isEqual;

  v4 = a3;
  v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (v8 == objc_msgSend_count(v4, v9, v10, v11))
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3550]);
    v15 = (void *)objc_msgSend_initWithArray_(v12, v13, (uint64_t)a1, v14);
    v16 = objc_alloc(MEMORY[0x1E0CB3550]);
    v19 = (void *)objc_msgSend_initWithArray_(v16, v17, (uint64_t)v4, v18);
    isEqual = objc_msgSend_isEqual_(v15, v20, (uint64_t)v19, v21);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

uint64_t sub_19067E9C4(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;

  v6 = a3;
  v10 = objc_msgSend_count(a1, v7, v8, v9);
  if (v10 < 1)
  {
LABEL_8:
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v13 = 0;
    if (v10 <= 1uLL)
      v14 = 1;
    else
      v14 = v10;
    while (1)
    {
      objc_msgSend_objectAtIndex_(a1, v11, v13, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if (!objc_msgSend_performSelector_withObject_(v6, v15, a4, (uint64_t)v16))
          break;
      }

      if (v14 == ++v13)
        goto LABEL_8;
    }

  }
  return v13;
}

BOOL sub_19067EA6C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return a3 && objc_msgSend_indexOfObject_matchingComparison_(a1, a2, a3, a4) != 0x7FFFFFFFFFFFFFFFLL;
}

void sub_19067EA98(void *a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  v7 = objc_msgSend_count(a1, v4, v5, v6);
  v8 = v11;
  if (v11 && v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19067EB28;
    v12[3] = &unk_1E2C43AF0;
    v13 = v11;
    objc_msgSend_enumerateObjectsUsingBlock_(a1, v9, (uint64_t)v12, v10);

    v8 = v11;
  }

}

uint64_t sub_19067EB28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_19067EB34(void *a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(id, _QWORD);
  unsigned int (**v7)(id, _QWORD);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11 = objc_msgSend_count(a1, v8, v9, v10);
  if (v7 && v6 && v11)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v16 = a1;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v21)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (((unsigned int (**)(id, void *))v7)[2](v7, v23))
          {
            ((void (**)(id, void *))v6)[2](v6, v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              objc_msgSend_addObject_(v15, v25, (uint64_t)v27, v26, (_QWORD)v41);
              v20 |= v27 != v23;
            }
            else
            {
              v20 = 1;
            }

          }
          else
          {
            v20 = 1;
          }
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v24, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v19);

      if ((v20 & 1) != 0)
      {
        v31 = v15;
LABEL_27:
        v36 = v31;

        goto LABEL_28;
      }
    }
    else
    {

    }
    if ((objc_msgSend___imIsMutable(v16, v28, v29, v30, (_QWORD)v41) & 1) != 0)
      v31 = (id)objc_msgSend_copy(v16, v37, v38, v39);
    else
      v31 = v16;
    goto LABEL_27;
  }
  if ((objc_msgSend___imIsMutable(a1, v12, v13, v14) & 1) != 0)
    v35 = (id)objc_msgSend_copy(a1, v32, v33, v34);
  else
    v35 = a1;
  v36 = v35;
LABEL_28:

  return v36;
}

id sub_19067ED24(void *a1, uint64_t a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(id, uint64_t, _QWORD *);
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  const char *v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = a1;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, (uint64_t)v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v10);
          v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v26[0] = v15;
          v26[1] = 3221225472;
          v26[2] = sub_19067EF00;
          v26[3] = &unk_1E2C43B18;
          v27 = v9;
          v8[2](v8, v17, v26);

        }
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v18, (uint64_t)&v28, (uint64_t)v32, 16);
      }
      while (v13);
    }

    v22 = (void *)objc_msgSend_copy(v9, v19, v20, v21);
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, a2, (uint64_t)a1, CFSTR("IMFoundationUtil.m"), 1599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    v22 = (void *)objc_opt_new();
  }

  return v22;
}

uint64_t sub_19067EF00(uint64_t result, const char *a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return objc_msgSend_setObject_forKeyedSubscript_(*(void **)(result + 32), a2, a3, (uint64_t)a2);
  }
  return result;
}

void sub_19067EF18(void *a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  v7 = objc_msgSend_count(a1, v4, v5, v6);
  v8 = v11;
  if (v11 && v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19067EFA8;
    v12[3] = &unk_1E2C43B40;
    v13 = v11;
    objc_msgSend_enumerateObjectsUsingBlock_(a1, v9, (uint64_t)v12, v10);

    v8 = v11;
  }

}

uint64_t sub_19067EFA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_19067EFB4(void *a1, uint64_t a2, void *a3)
{
  void (**v4)(id, _QWORD);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (v4 && v8)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = a1;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend_addObject_(v12, v19, (uint64_t)v21, v20, (_QWORD)v24);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v22, (uint64_t)&v24, (uint64_t)v28, 16);
      }
      while (v16);
    }

  }
  else
  {
    objc_msgSend_set(MEMORY[0x1E0C99E60], v9, v10, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id sub_19067F110(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (!objc_msgSend_count(a1, a2, a3, a4))
    return a1;
  v4 = (void *)MEMORY[0x19400E788]();
  JWEncodeKeyedCodableObject(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  JWDecodeKeyedCodableObject(v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return (id)v6;
}

CFMutableSetRef sub_19067F190()
{
  __int128 v0;
  CFSetCallBacks v2;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
  *(_OWORD *)&v2.version = *MEMORY[0x1E0C9B3B0];
  *(_OWORD *)&v2.release = v0;
  *(_OWORD *)&v2.equal = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 32);
  v2.retain = 0;
  v2.release = 0;
  return CFSetCreateMutable(0, 0, &v2);
}

void sub_19067F1D4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend___imFirstObject(a1, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    objc_msgSend_removeObjectAtIndex_(a1, v6, 0, v7);
    v5 = v8;
  }

}

unint64_t sub_19067F218(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;
  unint64_t v6;
  uint64_t i;
  uint32_t v8;
  const char *v9;

  result = objc_msgSend_count(a1, a2, a3, a4);
  if (result >= 2)
  {
    v6 = result;
    for (i = 0; i != v6; ++i)
    {
      v8 = arc4random_uniform(v6);
      result = objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(a1, v9, i, v8);
    }
  }
  return result;
}

CFMutableArrayRef sub_19067F274()
{
  __int128 v0;
  CFArrayCallBacks v2;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9B378] + 16);
  *(_OWORD *)&v2.version = *MEMORY[0x1E0C9B378];
  *(_OWORD *)&v2.release = v0;
  v2.equal = *(CFArrayEqualCallBack *)(MEMORY[0x1E0C9B378] + 32);
  v2.retain = 0;
  v2.release = 0;
  return CFArrayCreateMutable(0, 0, &v2);
}

CFMutableArrayRef sub_19067F2B8()
{
  __int128 v0;
  CFArrayCallBacks v2;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9B378] + 16);
  *(_OWORD *)&v2.version = *MEMORY[0x1E0C9B378];
  *(_OWORD *)&v2.release = v0;
  v2.equal = *(CFArrayEqualCallBack *)(MEMORY[0x1E0C9B378] + 32);
  v2.retain = 0;
  v2.release = 0;
  return CFArrayCreateMutable(0, 0, &v2);
}

uint64_t sub_19067F2FC(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  if (_CFDictionaryIsMutable())
    return 1;
  v3 = objc_opt_class();
  return MEMORY[0x1E0DE7D20](a1, sel_isMemberOfClass_, v3, v4);
}

id sub_19067F344(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  BOOL v54;
  uint64_t v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = a1;
  v7 = v4;
  v8 = v5;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend_allKeys(v6, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v57, (uint64_t)v61, 16);
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v12);
        v20 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v6, v15, v20, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v7, v22, v20, v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v24;
        if (v21 != (void *)v24)
        {
          v29 = !v21 || v24 == 0;
          if (v29
            || (objc_msgSend_isNull(v21, v25, v26, v27) & 1) != 0
            || (objc_msgSend_isNull(v28, v25, v30, v27) & 1) != 0
            || (objc_msgSend_isEqual_(v21, v25, (uint64_t)v28, v27) & 1) == 0)
          {
            objc_msgSend_addObject_(v8, v25, v20, v27);
          }
        }

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v57, (uint64_t)v61, 16);
    }
    while (v17);
  }

  v31 = v7;
  v32 = v6;
  v33 = v8;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend_allKeys(v31, v34, v35, v36, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v57, (uint64_t)v61, 16);
  if (v39)
  {
    v42 = v39;
    v43 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v58 != v43)
          objc_enumerationMutation(v37);
        v45 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend_objectForKey_(v31, v40, v45, v41);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v32, v47, v45, v48);
        v49 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v49;
        if (v46 != (void *)v49)
        {
          if (v46)
            v54 = v49 == 0;
          else
            v54 = 1;
          if (v54
            || (objc_msgSend_isNull(v46, v50, v51, v52) & 1) != 0
            || (objc_msgSend_isNull(v53, v50, v55, v52) & 1) != 0
            || (objc_msgSend_isEqual_(v46, v50, (uint64_t)v53, v52) & 1) == 0)
          {
            objc_msgSend_addObject_(v33, v50, v45, v52);
          }
        }

      }
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v57, (uint64_t)v61, 16);
    }
    while (v42);
  }

  return v33;
}

id sub_19067F624(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v3;
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v3, (uint64_t)v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t sub_19067F6C8(uint64_t a1, const char *a2)
{
  return objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], a2, a1, 200, 0, 0);
}

id sub_19067F6E4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  BOOL v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v9 = objc_msgSend_count(a1, v6, v7, v8);
  objc_msgSend_dictionaryWithCapacity_(v5, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend_allKeys(v4, v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v18)
  {
    v21 = v18;
    v22 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v16);
        v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend_objectForKey_(a1, v19, v24, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v4, v26, v24, v27);
        v28 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v28;
        if (v25)
          v32 = 1;
        else
          v32 = v28 == 0;
        if (!v32 || (v25 ? (v33 = v28 == 0) : (v33 = 1), !v33 && (objc_msgSend_isEqual_(v25, v29, v28, v30) & 1) == 0))
          objc_msgSend_setObject_forKey_(v12, v29, (uint64_t)v31, v24);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v21);
  }

  return v12;
}

id sub_19067F87C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (!objc_msgSend_count(a1, a2, a3, a4))
    return a1;
  v4 = (void *)MEMORY[0x19400E788]();
  JWEncodeKeyedCodableObject(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  JWDecodeKeyedCodableObject(v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return (id)v6;
}

id sub_19067F8FC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11 = objc_msgSend_count(v5, v8, v9, v10);
  v14 = (void *)objc_msgSend_initWithCapacity_(v7, v12, v11, v13);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v5;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v15);
        objc_msgSend_setObject_forKey_(v14, v18, (uint64_t)v6, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v21++), (_QWORD)v23);
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v19);
  }

  return v14;
}

id sub_19067FA38(void *a1, uint64_t a2, void *a3)
{
  unsigned int (**v4)(id, uint64_t, void *);
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = a1;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v6, v9, v14, v10, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4[2](v4, v14, v15))
          objc_msgSend_setObject_forKeyedSubscript_(v5, v16, (uint64_t)v15, v14);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v11);
  }

  return v5;
}

uint64_t sub_19067FB8C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  v5 = objc_msgSend_length(a1, a2, a3, a4);
  v6 = objc_retainAutorelease(a1);
  v10 = objc_msgSend_bytes(v6, v7, v8, v9);
  return objc_msgSend___imHexStringOfBytes_withLength_(v6, v11, v10, v5);
}

id sub_19067FBCC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unsigned int v22;
  int v23;
  __int16 v24;

  v3 = a3;
  v7 = objc_msgSend_length(v3, v4, v5, v6);
  objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v8, (v7 + 1) >> 1, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend_mutableBytes(v10, v11, v12, v13);
  v17 = v7;
  if (v7)
  {
    v18 = v14;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    do
    {
      v23 = objc_msgSend_characterAtIndex_(v3, v15, v19, v16);
      v24 = v23 - 48;
      if ((v23 - 48) <= 0x36 && ((0x7E0000007E03FFuLL >> v24) & 1) != 0)
      {
        ++v21;
        v20 = v23 + word_1906BC6CA[v24] + 16 * v20;
        if ((v21 & 1) == 0)
        {
          *(_BYTE *)(v18 + v22++) = v20;
          v20 = 0;
        }
      }
      ++v19;
    }
    while (v17 != v19);
    if ((v21 & 1) != 0)
      *(_BYTE *)(v18 + v22++) = v20;
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend_setLength_(v10, v15, v22, v16);

  return v10;
}

id sub_19067FCE0(uint64_t a1, uint64_t a2, size_t a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v7 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v4, v5, a3, v6));
  v11 = (void *)objc_msgSend_mutableBytes(v7, v8, v9, v10);
  arc4random_buf(v11, a3);
  return v7;
}

uint64_t SecureRandomBytes(void *a1, size_t a2)
{
  arc4random_buf(a1, a2);
  return 1;
}

id sub_19067FD40(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int128 v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uLong total_out;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  z_stream v52;

  if ((unint64_t)objc_msgSend_length(a1, a2, a3, a4) > 0xC800000)
    return 0;
  if (!objc_msgSend_length(a1, v5, v6, v7))
    return a1;
  v12 = objc_msgSend_length(a1, v9, v10, v11);
  v16 = objc_msgSend_length(a1, v13, v14, v15);
  if (v16 >= 0)
    v19 = v16;
  else
    v19 = v16 + 1;
  objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v17, (v12 + (v19 >> 1)), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_18;
  *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v52.data_type = v21;
  *(_OWORD *)&v52.zfree = v21;
  *(_OWORD *)&v52.state = v21;
  *(_OWORD *)&v52.total_out = v21;
  *(_OWORD *)&v52.next_out = v21;
  *(_OWORD *)&v52.avail_in = v21;
  v22 = objc_retainAutorelease(a1);
  v26 = objc_msgSend_bytes(v22, v23, v24, v25);
  v52.avail_in = objc_msgSend_length(v22, v27, v28, v29, v26, *(_OWORD *)&v52.avail_in, *(_OWORD *)&v52.next_out, *(_OWORD *)&v52.total_out, *(_OWORD *)&v52.state, *(_OWORD *)&v52.zfree, *(_OWORD *)&v52.data_type, 0xAAAAAAAAAAAAAAAALL);
  v52.zalloc = 0;
  v52.zfree = 0;
  v52.total_out = 0;
  v33 = 0;
  if (!inflateInit2_(&v52, 47, "1.2.12", 112))
  {
    v34 = (v19 >> 1);
    do
    {
      total_out = v52.total_out;
      if (total_out >= objc_msgSend_length(v20, v30, v31, v32))
        objc_msgSend_increaseLengthBy_(v20, v36, v34, v37);
      v38 = objc_retainAutorelease(v20);
      v42 = objc_msgSend_mutableBytes(v38, v39, v40, v41);
      v52.next_out = (Bytef *)(v42 + v52.total_out);
      v46 = objc_msgSend_length(v38, v43, v44, v45);
      v52.avail_out = v46 - LODWORD(v52.total_out);
      v47 = inflate(&v52, 2);
    }
    while (!v47);
    if (v47 == 1)
    {
      if (!inflateEnd(&v52))
      {
        objc_msgSend_setLength_(v38, v48, v52.total_out, v49);
        objc_msgSend_dataWithData_(MEMORY[0x1E0C99D50], v50, (uint64_t)v38, v51);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    else
    {
      inflateEnd(&v52);
    }
LABEL_18:
    v33 = 0;
  }
LABEL_19:

  return v33;
}

id sub_19067FEF4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend__FTDecompressData(a1, a2, a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = a1;
  v8 = v7;

  return v8;
}

id im_temporary_directory()
{
  unsigned __int8 v0;

  v0 = atomic_load(byte_1EE1DD5E8);
  if ((v0 & 1) == 0)
    atomic_store(1u, byte_1EE1DD5E8);
  if (qword_1EE1DD938)
    return (id)qword_1EE1DD938;
  NSTemporaryDirectory();
  return (id)objc_claimAutoreleasedReturnValue();
}

void im_set_temporary_directory(void *a1)
{
  id v1;
  unsigned __int8 v2;
  void *v3;

  v1 = a1;
  v2 = atomic_load(byte_1EE1DD5E8);
  if ((v2 & 1) != 0)
    abort();
  v3 = (void *)qword_1EE1DD938;
  qword_1EE1DD938 = (uint64_t)v1;

}

id sub_19067FFAC(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  char v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  char v43;
  id v44;
  char v46;
  id v47;
  id v48;

  v10 = a3;
  if (v10)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v3, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastPathComponent(v10, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__randomTemporaryPathWithFileName_(v11, v16, (uint64_t)v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v19, (uint64_t)v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    if (_IMWillLog(CFSTR("IMFoundation")))
      _IMAlwaysLog(0, CFSTR("IMFoundation"), CFSTR("Attempting to link URL %@ to new URL %@"), v25, v26, v27, v28, v29, (char)v10);
    if (v21)
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v23, v24, v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v32 = objc_msgSend_linkItemAtURL_toURL_error_(v30, v31, (uint64_t)v10, (uint64_t)v21, &v48);
      v33 = v48;

      if ((v32 & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      v33 = 0;
    }
    if (_IMWillLog(CFSTR("IMFoundation")))
      _IMAlwaysLog(0, CFSTR("IMFoundation"), CFSTR("  => First link attempt failed, I'll trying copying (%@)"), v36, v37, v38, v39, v40, (char)v33);
    if (!v21)
      goto LABEL_17;
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v34, v35, v36);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v33;
    v43 = objc_msgSend_copyItemAtURL_toURL_error_(v41, v42, (uint64_t)v10, (uint64_t)v21, &v47);
    v44 = v47;

    v33 = v44;
    if ((v43 & 1) == 0)
    {
LABEL_17:
      _IMWarn(CFSTR("Linking failed with error %@"), (uint64_t)v34, v35, v36, v37, v38, v39, v40, (char)v33);
      v22 = 0;
      goto LABEL_18;
    }
LABEL_16:
    v22 = v21;
LABEL_18:

    goto LABEL_19;
  }
  _IMWarn(CFSTR("Empty URL passed in for link generation"), (uint64_t)v3, v4, v5, v6, v7, v8, v9, v46);
  v22 = 0;
LABEL_19:

  return v22;
}

uint64_t sub_190680184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](a1, sel__randomTemporaryPathWithSuffix_fileName_, a3, 0);
}

uint64_t sub_19068018C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](a1, sel__randomTemporaryPathWithSuffix_fileName_withAppendedPathComponent_, a3, 0);
}

id sub_190680198(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v7, v8, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    objc_msgSend_stringByAppendingPathExtension_(v10, v7, (uint64_t)v6, v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v11;
  }
LABEL_4:
  objc_msgSend__randomTemporaryPathWithFileName_(a1, v7, (uint64_t)v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id sub_190680230(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v13 = a5;
  if (!v9)
  {
    objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v10, v11, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v8)
  {
LABEL_3:
    objc_msgSend_stringByAppendingPathExtension_(v9, v10, (uint64_t)v8, v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
LABEL_4:
  objc_msgSend__randomTemporaryPathWithFileName_withAppendedPathComponent_(a1, v10, (uint64_t)v9, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id sub_1906802E4(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend_stringGUID(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  im_temporary_directory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createUniqueDirectoryWithName_atPath_ofType_(a1, v11, (uint64_t)v9, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastPathComponent(v5, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingPathExtension(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathExtension(v5, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_uniqueFilename_atPath_ofType_(a1, v25, (uint64_t)v20, (uint64_t)v12, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

id sub_1906803C0(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;

  v6 = a4;
  v7 = a3;
  im_temporary_directory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v8, v9, (uint64_t)v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createUniqueDirectoryWithName_atPath_ofType_(a1, v16, (uint64_t)v15, (uint64_t)v11, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastPathComponent(v7, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingPathExtension(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathExtension(v7, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_uniqueFilename_atPath_ofType_(a1, v30, (uint64_t)v25, (uint64_t)v17, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

id sub_1906804C4(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend_stringGUID(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingLastPathComponent(v5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathExtension(v5, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_uniqueFilename_atPath_ofType_(a1, v18, (uint64_t)v9, (uint64_t)v13, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t sub_190680560(uint64_t a1, const char *a2, void *a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;

  objc_msgSend_stringByResolvingAndStandardizingPath(a3, a2, (uint64_t)a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathComponents(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_hasPrefix_(v4, v9, (uint64_t)CFSTR("/Volumes"), v10))
    goto LABEL_4;
  if ((unint64_t)objc_msgSend_count(v8, v11, v12, v13) < 3)
    goto LABEL_4;
  objc_msgSend_objectAtIndex_(v8, v14, 2, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(CFSTR("/Volumes"), v17, (uint64_t)v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_fileExistsAtPath_(v23, v24, (uint64_t)v19, v25);

  if (!v26)
    v27 = 1;
  else
LABEL_4:
    v27 = 0;

  return v27;
}

uint64_t sub_19068063C(void *a1, const char *a2, void *a3, uint64_t a4)
{
  unsigned int v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t DirectoryAtPath_withIntermediateDirectories_attributes_error;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;

  v4 = a4;
  objc_msgSend_stringByResolvingAndStandardizingPath(a3, a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__isPathOnMissingVolume_(a1, v7, (uint64_t)v6, v8) & 1) != 0)
  {
    DirectoryAtPath_withIntermediateDirectories_attributes_error = 0;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v11, v4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_initWithObjectsAndKeys_(v10, v14, (uint64_t)v13, v15, *MEMORY[0x1E0CB2AA8], 0);

    DirectoryAtPath_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(a1, v17, (uint64_t)v6, 1, v16, 0);
  }

  return DirectoryAtPath_withIntermediateDirectories_attributes_error;
}

id sub_190680708(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;

  v8 = a4;
  v9 = a5;
  objc_msgSend_lastPathComponent(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v8, v14, (uint64_t)v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByResolvingAndStandardizingPath(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v9, v21, v22, v23))
  {

    v9 = 0;
  }
  v24 = 0;
  v25 = 0;
  while (1)
  {
    v26 = v24;
    sub_190680820(v20, v25, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v25 == 9999)
      break;
    v25 = (v25 + 1);
    if ((objc_msgSend_fileExistsAtPath_(a1, v27, (uint64_t)v24, v29) & 1) == 0)
    {
      v30 = v24;
      goto LABEL_8;
    }
  }
  objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v27, v28, v29);
  v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v31 = v30;

  return v31;
}

id sub_190680820(void *a1, uint64_t a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a1;
  v8 = a3;
  if ((int)a2 <= 0)
  {
    v16 = v5;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v6, a2, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringFromNumber_numberStyle_(v10, v12, (uint64_t)v11, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v9, v14, (uint64_t)CFSTR("%@-%@"), v15, v5, v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend_length(v8, v17, v18, v19))
  {
    objc_msgSend_stringByAppendingPathExtension_(v16, v20, (uint64_t)v8, v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v22;
  }

  return v16;
}

id sub_190680914(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  char v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  int v33;
  int v34;
  id v36;

  v8 = a4;
  v9 = a5;
  objc_msgSend_lastPathComponent(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v8, v14, (uint64_t)v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByResolvingAndStandardizingPath(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend__isPathOnMissingVolume_(a1, v21, (uint64_t)v20, v22) & 1) != 0)
  {
    v23 = 0;
  }
  else
  {
    v24 = 0;
    v25 = 0;
    while (1)
    {
      v26 = v24;
      sub_190680820(v20, v25, v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0;
      v28 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(a1, v27, (uint64_t)v24, 1, 0, &v36);
      v29 = v36;
      v32 = v29;
      v33 = 0;
      if ((v28 & 1) == 0 && v29)
        v33 = objc_msgSend_fileExistsAtPath_(a1, v30, (uint64_t)v24, v31);
      v34 = v32 ? v33 : 1;

      v23 = 0;
      if (v34 != 1 || (_DWORD)v25 == 99)
        break;
      v25 = (v25 + 1);
      if ((v33 & 1) == 0)
      {
        v23 = v24;
        break;
      }
    }

  }
  return v23;
}

uint64_t sub_190680A74(void *a1, uint64_t a2, void *a3, void *a4, _QWORD *a5, uint64_t a6, int a7)
{
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;

  v11 = a4;
  objc_msgSend_stringByResolvingAndStandardizingPath(a3, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByResolvingAndStandardizingPath(v11, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pathExtension(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingPathExtension(v19, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = 0;
  while (1)
  {
    v30 = v28;
    sub_190680820(v27, v29, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a7)
      break;
    if ((objc_msgSend_copyItemAtPath_toPath_error_(a1, v31, (uint64_t)v15, (uint64_t)v28, a6) & 1) != 0)
      goto LABEL_11;
LABEL_6:
    v34 = 0;
    if (objc_msgSend_fileExistsAtPath_(a1, v32, (uint64_t)v28, v33))
    {
      v35 = v29 >= 0x63;
      v29 = (v29 + 1);
      if (!v35)
        continue;
    }
    goto LABEL_14;
  }
  if (!objc_msgSend_moveItemAtPath_toPath_error_(a1, v31, (uint64_t)v15, (uint64_t)v28, a6))
    goto LABEL_6;
  objc_msgSend_removeItemAtPath_error_(a1, v32, (uint64_t)v15, a6);
LABEL_11:
  if (a5)
    *a5 = objc_retainAutorelease(v28);
  v34 = 1;
LABEL_14:

  return v34;
}

uint64_t sub_190680BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](a1, sel__moveItemAtPath_toPath_uniquePath_error_asCopy_, a3, a4);
}

uint64_t sub_190680BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](a1, sel__moveItemAtPath_toPath_uniquePath_error_asCopy_, a3, a4);
}

id IMTemporaryPath()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  im_temporary_directory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v0, v1, (uint64_t)CFSTR("FaceTime"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v3, v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v3, 1, 0, 0);

  }
  return v3;
}

id TemporaryTransfersPath()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  IMTemporaryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v0, v1, (uint64_t)CFSTR("Transfers"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v3, v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v3, 1, 0, 0);

  }
  return v3;
}

id TemporaryImagePath()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  IMTemporaryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v0, v1, (uint64_t)CFSTR("Images"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v3, v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v3, 1, 0, 0);

  }
  return v3;
}

id IMGetInlineImagePath(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  v3 = a2;
  v4 = a1;
  TemporaryImagePath();
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_((void *)v5, v6, (uint64_t)v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend_fileExistsAtPath_(v12, v13, (uint64_t)v8, v14);

  if ((v5 & 1) == 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v18, v19, (uint64_t)v8, 1, 0, 0);

  }
  objc_msgSend_lastPathComponent(v3, v15, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v8, v21, (uint64_t)v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id IMInlineImageURL(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *inited;

  v3 = (objc_class *)MEMORY[0x1E0C99E98];
  v4 = a2;
  v5 = a1;
  v6 = [v3 alloc];
  IMGetInlineImagePath(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  inited = (void *)objc_msgSend_initFileURLWithPath_(v6, v8, (uint64_t)v7, v9);
  return inited;
}

void sub_190680F08()
{
  unsigned int v0;

  v0 = time(0);
  srandom(v0);
}

uint64_t GetTimeoutDefault(void *a1)
{
  uint64_t result;

  LODWORD(result) = IMGetAppIntForKey(a1);
  if ((int)result < 0)
    return 0xFFFFFFFFLL;
  else
    return result;
}

id ExtractURLQueries(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  __CFString *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  CFStringRef v45;
  const char *v46;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v7 = objc_msgSend_rangeOfString_(v3, v5, (uint64_t)CFSTR("?"), v6);
  if (v8)
  {
    v10 = v7;
    objc_msgSend_substringToIndex_(v3, v8, v7, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringFromIndex_(v3, v12, v10 + 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend_componentsSeparatedByString_(v14, v15, (uint64_t)CFSTR("&"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v50, (uint64_t)v54, 16);
    if (v19)
    {
      v20 = v19;
      v48 = v14;
      v49 = v11;
      v21 = 0;
      v22 = *(_QWORD *)v51;
      do
      {
        v23 = 0;
        v24 = v21;
        do
        {
          if (*(_QWORD *)v51 != v22)
            objc_enumerationMutation(v17);
          v21 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * v23);

          v27 = objc_msgSend_rangeOfString_(v21, v25, (uint64_t)CFSTR("="), v26);
          if (v28)
          {
            v30 = v27;
            objc_msgSend_substringToIndex_(v21, v28, v27, v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lowercaseString(v31, v32, v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_substringFromIndex_(v21, v36, v30 + 1, v37);
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_length(v35, v39, v40, v41) && objc_msgSend_length(v38, v42, v43, v44))
            {
              v45 = CFURLCreateStringByReplacingPercentEscapes(0, v38, &stru_1E2C46CC8);

              objc_msgSend_setObject_forKey_(v4, v46, (uint64_t)v45, (uint64_t)v35);
              v38 = (__CFString *)v45;
            }

          }
          ++v23;
          v24 = v21;
        }
        while (v20 != v23);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v28, (uint64_t)&v50, (uint64_t)v54, 16);
      }
      while (v20);

      v14 = v48;
      v11 = v49;
    }

  }
  else
  {
    v11 = v3;
    v14 = v11;
  }

  return v11;
}

void _FezStartTime()
{
  double Current;
  int v1;

  Current = CFAbsoluteTimeGetCurrent();
  v1 = dword_1EE1DDF08;
  if (dword_1EE1DDF08 <= 99)
    dbl_1EE1DDF10[dword_1EE1DDF08] = Current;
  dword_1EE1DDF08 = v1 + 1;
}

double _FezLogElapsedTimeWithTag(uint64_t a1, _DWORD *a2, double *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double Current;
  int v13;
  int v14;
  double v15;

  Current = CFAbsoluteTimeGetCurrent();
  v13 = dword_1EE1DDF08;
  v14 = --dword_1EE1DDF08;
  if (v13 <= 100)
  {
    v15 = dbl_1EE1DDF10[v14];
    if (a2)
    {
      ++*a2;
      *a3 = Current - v15 + *a3;
      if (dword_1EE1DDF08 <= 100)
        _IMLog(CFSTR("   | %.*s[%s: \"%s\": %6.6f]"), v5, v6, v7, v8, v9, v10, v11, dword_1EE1DDF08);
      _IMLog(CFSTR("   | %.*s         ['%s' called %u times, cumulative time %6.6f]"), v5, v6, v7, v8, v9, v10, v11, dword_1EE1DDF08);
    }
    else
    {
      _IMLog(CFSTR("   | %.*s[%s: \"%s\": %6.6f]"), v5, v6, v7, v8, v9, v10, v11, v14);
    }
  }
  return Current;
}

id IMPathsForPlugInsWithExtension(void *a1)
{
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  id obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_builtInPlugInsPath(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByStandardizingPath(CFSTR("/System/Library/Messages/PlugIns"), v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObjects_(v2, v15, (uint64_t)v10, v16, v14, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v17;
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v57, (uint64_t)v62, 16);
  if (v51)
  {
    v50 = *(_QWORD *)v58;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v58 != v50)
          objc_enumerationMutation(obj);
        v52 = v26;
        v27 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v26);
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v23, v24, v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contentsOfDirectoryAtPath_error_(v28, v29, (uint64_t)v27, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v31 = v30;
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v53, (uint64_t)v61, 16);
        if (v33)
        {
          v37 = v33;
          v38 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v54 != v38)
                objc_enumerationMutation(v31);
              v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_msgSend_pathExtension(v40, v34, v35, v36);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend_caseInsensitiveCompare_(v41, v42, (uint64_t)v1, v43);

              if (!v44)
              {
                objc_msgSend_stringByAppendingPathComponent_(v27, v34, (uint64_t)v40, v36);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v21, v46, (uint64_t)v45, v47);

              }
            }
            v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v53, (uint64_t)v61, 16);
          }
          while (v37);
        }

        v26 = v52 + 1;
      }
      while (v52 + 1 != v51);
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v57, (uint64_t)v62, 16);
    }
    while (v51);
  }

  return v21;
}

BOOL _IMRunningInDaemon()
{
  if (qword_1EE1DD940 != -1)
    dispatch_once(&qword_1EE1DD940, &unk_1E2C43B80);
  return dword_1EE1DC948 != 0;
}

void sub_1906815C0()
{
  const char *v0;
  uint64_t v1;
  id v2;

  IMGetMainBundleIdentifier();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  dword_1EE1DC948 = objc_msgSend_isEqualToString_(v2, v0, (uint64_t)CFSTR("com.apple.imagent"), v1);

}

id _IMFrameworkBundle()
{
  if (qword_1EE1DD950 != -1)
    dispatch_once(&qword_1EE1DD950, &unk_1E2C43BA0);
  return (id)qword_1EE1DD948;
}

void sub_190681640(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;

  objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], a2, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/IMCore.framework"), a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1EE1DD948;
  qword_1EE1DD948 = v4;

}

double _IMGetTimeoutDefault(void *a1, double a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v3 = a1;
  IMCopyAppValueForKey(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a2;
  if (v11)
  {
    v12 = a2;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_doubleValue(v11, v4, v5, v6);
      v12 = v13;
    }
  }
  if (v12 != a2)
    _IMLog(CFSTR("WARNING: Timeout %@ is %g, connections may not behave as expected (default: %g)"), (uint64_t)v4, v5, v6, v7, v8, v9, v10, (char)v3);
  if (v12 >= 0.0)
    v14 = v12;
  else
    v14 = INFINITY;

  return v14;
}

uint64_t IMCopyURLEscapedString(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v1 = a1;
  objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E0CB3500], v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  objc_msgSend_removeCharactersInString_(v9, v10, (uint64_t)CFSTR(":/?#[]@!$&‚Äö√Ñ√¥()*+,;="), v11);
  if (v1 && objc_msgSend_length(v1, v12, v13, v14))
  {
    objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v1, v15, (uint64_t)v9, v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void sub_1906817A8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v4;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v4 = (int)a2;
  v22 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend_registration(IMRGLog, a2, a3, a4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315138;
      v21 = v7;
      _os_log_impl(&dword_19066D000, v6, OS_LOG_TYPE_DEFAULT, "Dispatch registration invoked - checking state {name: %s}", buf, 0xCu);
    }

    dispatch_get_global_queue(2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_190681988;
    v15[3] = &unk_1E2C43BF0;
    v19 = v4;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v17 = v9;
    v18 = v10;
    v16 = *(id *)(a1 + 32);
    dispatch_async(v8, v15);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend_registration(IMRGLog, a2, a3, a4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315138;
        v21 = v14;
        _os_log_impl(&dword_19066D000, v13, OS_LOG_TYPE_DEFAULT, "Dispatch registration invoked - calling handler {name: %s}", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1906B6234(a1, v13);

    }
  }
}

void sub_190681988(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(*(_DWORD *)(a1 + 56), &state64);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend_registration(IMRGLog, v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      v17 = v8;
      v18 = 1024;
      v19 = state64;
      _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "Dispatch registration invoked - fetched state {name: %s, state: %u}", buf, 0x12u);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_190681AE0;
    v11[3] = &unk_1E2C43BC8;
    v9 = *(NSObject **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v14 = *(_DWORD *)(a1 + 56);
    v12 = v10;
    v13 = state64;
    dispatch_async(v9, v11);
    v7 = v12;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1906B62A8(a1, (uint64_t *)&state64, v7);
  }

}

uint64_t sub_190681AE0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t _IMDaemonIsRunning()
{
  if (qword_1EE1DD690 != -1)
    dispatch_once(&qword_1EE1DD690, &unk_1E2C43C38);
  return byte_1EE1DD69C;
}

uint64_t sub_190681B34()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0;
  result = im_notify_register_dispatch("_IMDaemonRunningNotifyToken", (int *)&unk_1EE1DD6A0, &v1, 1, MEMORY[0x1E0C80D38], &unk_1E2C43C78);
  byte_1EE1DD69C = v1 != 0;
  return result;
}

void sub_190681B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  byte_1EE1DD69C = a3 != 0;
}

void _IMGetAVAgentRemoteObject(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int isNonUIInstall;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend_sharedInstance(IMLockdownManager, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isNonUIInstall = objc_msgSend_isNonUIInstall(v14, v15, v16, v17);

  if (!isNonUIInstall)
  {
    if (v9)
    {
      objc_msgSend_connection(v9, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_190681D14;
    v24[3] = &unk_1E2C43CF0;
    v22 = &v25;
    v25 = v10;
    IMAVDaemonRequestConnection(v7, v8, v23, v24);
    if (v9)

    goto LABEL_9;
  }
  if (v10)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_190681D00;
    v26[3] = &unk_1E2C43CA0;
    v22 = &v27;
    v27 = v10;
    im_dispatch_after(v26, 0.0);
LABEL_9:

  }
}

uint64_t sub_190681D00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_190681D14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  IMRemoteObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v9 = a3;
  if (v5)
  {
    v10 = [IMRemoteObject alloc];
    v12 = (void *)objc_msgSend_initWithConnection_protocol_alreadyConfigured_(v10, v11, (uint64_t)v5, (uint64_t)&unk_1EE1EFAC8, 1);
  }
  else
  {
    v12 = 0;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend_mainThread(MEMORY[0x1E0CB3978], v6, v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_190681E44;
    v15[3] = &unk_1E2C43CC8;
    v18 = *(id *)(a1 + 32);
    v16 = v12;
    v17 = v9;
    objc_msgSend___im_performBlock_modes_(v13, v14, (uint64_t)v15, IMRemoteObjectsRunLoopModes);

  }
}

uint64_t sub_190681E44(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

id _IMPathToAgent(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  if (qword_1EE1DD940 != -1)
    dispatch_once(&qword_1EE1DD940, &unk_1E2C43B80);
  if (dword_1EE1DC948)
  {
    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundlePath(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _IMFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundlePath(v4, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v12, v13, (uint64_t)CFSTR("imagent.app"), v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t _IMITunesInteropAvailable()
{
  return 1;
}

__CFString *_IMITunesMessageFormat(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend__IMAppObjectForKey_(MEMORY[0x1E0C99EA0], a2, (uint64_t)CFSTR("iTunesMessageFormat"), a4);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("%Track - %Artist");
  v6 = v4;

  return v6;
}

id _IMStatusMessageWithFormatAndVariables(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v7 = (void *)objc_msgSend_mutableCopy(a1, v4, v5, v6);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_allKeys(v3, v8, v9, v10);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v12)
  {
    v16 = v12;
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v20 = objc_msgSend_length(v7, v13, v14, v15);
        objc_msgSend_stringByAppendingString_(CFSTR("%"), v21, v19, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v3, v24, v19, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v26;
        if (v26)
          objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v7, v27, (uint64_t)v23, v26, 2, 0, v20);
        else
          objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v7, v27, (uint64_t)v23, (uint64_t)&stru_1E2C46CC8, 2, 0, v20);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v16);
  }

  return v7;
}

CFMutableDictionaryRef sub_1906820F4()
{
  __int128 v0;
  CFDictionaryKeyCallBacks v2;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9AEB8] + 16);
  *(_OWORD *)&v2.version = *MEMORY[0x1E0C9AEB8];
  *(_OWORD *)&v2.release = v0;
  *(_OWORD *)&v2.equal = *(_OWORD *)(MEMORY[0x1E0C9AEB8] + 32);
  v2.retain = (CFDictionaryRetainCallBack)sub_190682148;
  return CFDictionaryCreateMutable(0, 0, &v2, MEMORY[0x1E0C9B3A0]);
}

CFTypeRef sub_190682148(int a1, CFTypeRef cf)
{
  return CFRetain(cf);
}

CFMutableDictionaryRef sub_190682150()
{
  __int128 v0;
  __int128 v1;
  CFDictionaryValueCallBacks v3;
  CFDictionaryKeyCallBacks keyCallBacks;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9AEB8] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E0C9AEB8];
  *(_OWORD *)&keyCallBacks.release = v0;
  *(_OWORD *)&keyCallBacks.equal = *(_OWORD *)(MEMORY[0x1E0C9AEB8] + 32);
  keyCallBacks.retain = (CFDictionaryRetainCallBack)sub_190682148;
  v1 = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E0C9B3A0];
  *(_OWORD *)&v3.release = v1;
  v3.equal = *(CFDictionaryEqualCallBack *)(MEMORY[0x1E0C9B3A0] + 32);
  v3.retain = 0;
  v3.release = 0;
  return CFDictionaryCreateMutable(0, 0, &keyCallBacks, &v3);
}

CFMutableDictionaryRef sub_1906821BC()
{
  __int128 v0;
  __int128 v1;
  CFDictionaryValueCallBacks v3;
  CFDictionaryKeyCallBacks keyCallBacks;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9B390] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E0C9B390];
  *(_OWORD *)&keyCallBacks.release = v0;
  *(_OWORD *)&keyCallBacks.equal = *(_OWORD *)(MEMORY[0x1E0C9B390] + 32);
  keyCallBacks.release = 0;
  keyCallBacks.copyDescription = 0;
  keyCallBacks.retain = (CFDictionaryRetainCallBack)sub_19068222C;
  v1 = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E0C9B3A0];
  *(_OWORD *)&v3.release = v1;
  v3.equal = *(CFDictionaryEqualCallBack *)(MEMORY[0x1E0C9B3A0] + 32);
  v3.retain = 0;
  v3.release = 0;
  return CFDictionaryCreateMutable(0, 0, &keyCallBacks, &v3);
}

uint64_t sub_19068222C(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_190682234(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;

  v8 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], a2, a3, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v10, a4, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v12, a5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(v8, v15, (uint64_t)v9, v16, CFSTR("File"), v11, CFSTR("Function"), v14, CFSTR("Line Number"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_errorWithDomain_code_userInfo_(a1, v18, (uint64_t)CFSTR("IMGenericErrorDomain"), 0, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id sub_190682334(void *a1, uint64_t a2, void *a3)
{
  const char *v4;
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  if (qword_1EE1DD940 != -1)
    dispatch_once(&qword_1EE1DD940, &unk_1E2C43B80);
  if (dword_1EE1DC948)
    IMCopyAppValueForKey(v5);
  else
    objc_msgSend__IMObjectForKey_inDomain_(a1, v4, (uint64_t)v5, (uint64_t)CFSTR("com.apple.imagent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend__IMObjectForKey_inDomain_(a1, v7, (uint64_t)v5, (uint64_t)CFSTR("com.apple.iChatAgent"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

id sub_1906823FC(int a1, int a2, CFStringRef key)
{
  return IMGetCachedDomainValueForKey(CFSTR("com.apple.iChat"), key);
}

void sub_190682410(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  id value;

  value = a3;
  v7 = a4;
  v8 = a5;
  v9 = (__CFString *)v8;
  if (v7)
  {
    if (v8)
      v10 = v8;
    else
      v10 = (const __CFString *)*MEMORY[0x1E0C9B248];
    CFPreferencesSetAppValue(v7, value, v10);
    CFPreferencesAppSynchronize(v10);
  }

}

id sub_190682494(int a1, int a2, CFStringRef key, CFStringRef applicationID)
{
  return IMGetCachedDomainValueForKey(applicationID, key);
}

void _IMSwapMethods(objc_class *a1, const char *a2, const char *a3, int a4)
{
  objc_method *ClassMethod;
  objc_method *InstanceMethod;

  if (a4)
  {
    ClassMethod = class_getClassMethod(a1, a2);
    InstanceMethod = class_getClassMethod(a1, a3);
  }
  else
  {
    ClassMethod = class_getInstanceMethod(a1, a2);
    InstanceMethod = class_getInstanceMethod(a1, a3);
  }
  method_exchangeImplementations(ClassMethod, InstanceMethod);
}

CFIndex IMGetDomainIntForKey(CFStringRef applicationID, CFStringRef key)
{
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 0;
  return result;
}

void IMSetDomainIntForKey(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  const char *v8;
  uint64_t v9;
  id v10;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a2;
    v7 = a1;
    objc_msgSend_numberWithInteger_(v5, v8, a3, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey(v7, v6, v10);

  }
  else
  {
    v7 = a2;
    v10 = a1;
    IMSetDomainValueForKey(v10, v7, 0);
  }

}

uint64_t IMSyncronizeAppPreferences()
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
}

id IMCopyAppByHostValueForKey(void *a1)
{
  __CFString *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
    v5 = (void *)CFPreferencesCopyValue(v1, (CFStringRef)*MEMORY[0x1E0C9B248], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  else
    v5 = 0;

  return v5;
}

void IMSetAppValueForKey(const __CFString *a1, const void *a2)
{
  CFPreferencesSetAppValue(a1, a2, (CFStringRef)*MEMORY[0x1E0C9B248]);
}

void IMSetAppByHostValueForKey(const __CFString *a1, const void *a2)
{
  CFPreferencesSetValue(a1, a2, (CFStringRef)*MEMORY[0x1E0C9B248], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

void IMRemoveAppValueForKey(const __CFString *a1)
{
  CFPreferencesSetAppValue(a1, 0, (CFStringRef)*MEMORY[0x1E0C9B248]);
}

void IMRemoveAppByHostValueForKey(const __CFString *a1)
{
  CFPreferencesSetValue(a1, 0, (CFStringRef)*MEMORY[0x1E0C9B248], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

uint64_t IMGetAppByHostIntForKey(void *a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  IMCopyAppByHostValueForKey(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_integerValue(v1, v2, v3, v4);

  return v5;
}

BOOL IMGetAppBoolForKey(void *a1)
{
  return IMGetAppIntForKey(a1) != 0;
}

BOOL IMGetAppByHostBoolForKey(void *a1)
{
  return IMGetAppByHostIntForKey(a1) != 0;
}

void IMSetAppBoolForKey(const __CFString *a1, int a2)
{
  const void *v2;

  if (a2)
    v2 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v2 = 0;
  CFPreferencesSetAppValue(a1, v2, (CFStringRef)*MEMORY[0x1E0C9B248]);
}

void IMSetAppByHostBoolForKey(const __CFString *a1, int a2)
{
  const void *v2;

  if (a2)
    v2 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v2 = 0;
  CFPreferencesSetValue(a1, v2, (CFStringRef)*MEMORY[0x1E0C9B248], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

BOOL IMCanAccessPath(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  getpid();
  v2 = objc_retainAutorelease(v1);
  objc_msgSend_UTF8String(v2, v3, v4, v5);

  return sandbox_check() == 0;
}

BOOL IMCanAccessPreferenceDomain(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;

  v1 = a1;
  getpid();
  v2 = objc_retainAutorelease(v1);
  objc_msgSend_UTF8String(v2, v3, v4, v5);
  if (sandbox_check())
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("~/Library/Preferences/%@.plist"), v7, v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByResolvingAndStandardizingPath(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = IMCanAccessPath(v12);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

id sub_1906828C0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;

  objc_msgSend_objectForKey_(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

id sub_190682918(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;

  objc_msgSend_objectForKey_(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

id sub_190682970(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;

  objc_msgSend_objectForKey_(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

id sub_1906829C8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;

  objc_msgSend_objectForKey_(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

id sub_190682A20(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;

  objc_msgSend_objectForKey_(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

void *sub_190682A78()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SecTaskCreateWithAuditToken", CFSTR("Security"));
  off_1ECD90DE8 = result;
  return result;
}

void *sub_190682AA4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SecTaskCopyValueForEntitlement", CFSTR("Security"));
  off_1ECD90DF8 = result;
  return result;
}

void *IMDAuditTokenTaskCopyValueForEntitlement(_OWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  CFTypeRef cf[2];
  __int128 v27;

  v3 = a2;
  if (qword_1EE1DD960 != -1)
    dispatch_once(&qword_1EE1DD960, &unk_1E2C43D30);
  if (qword_1EE1DD970 != -1)
    dispatch_once(&qword_1EE1DD970, &unk_1E2C42B88);
  v4 = *MEMORY[0x1E0C9AE00];
  v5 = a1[1];
  *(_OWORD *)cf = *a1;
  v27 = v5;
  v6 = off_1EE1DD958(v4, cf);
  if (v6)
  {
    v14 = (const void *)v6;
    cf[0] = 0;
    v15 = (void *)off_1EE1DD968(v6, v3, cf);
    v16 = v15;
    if (cf[0])
    {

      _IMWarn(CFSTR("Unable to get entitlements for client task. Error: %@"), v17, v18, v19, v20, v21, v22, v23, (char)cf[0]);
      if (cf[0])
        CFRelease(cf[0]);
      v16 = 0;
    }
    CFRelease(v14);
  }
  else
  {
    _IMWarn(CFSTR("Unable to create security task from audit token."), v7, v8, v9, v10, v11, v12, v13, v25);
    v16 = 0;
  }

  return v16;
}

void *sub_190682BF0()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SecTaskCreateWithAuditToken", CFSTR("Security"));
  off_1EE1DD958 = result;
  return result;
}

void *sub_190682C1C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SecTaskCopyValueForEntitlement", CFSTR("Security"));
  off_1EE1DD968 = result;
  return result;
}

void *sub_190682C48()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SecTaskCreateWithAuditToken", CFSTR("Security"));
  off_1EE1DD768 = result;
  return result;
}

void *sub_190682C74()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SecTaskCopyValuesForEntitlements", CFSTR("Security"));
  off_1EE1DD760 = result;
  return result;
}

void *IMDSelfTaskCopyValueForEntitlement(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  CFTypeRef cf;

  v1 = a1;
  if (qword_1ECD90E20 != -1)
    dispatch_once(&qword_1ECD90E20, &unk_1E2C43D90);
  if (qword_1ECD90E18 != -1)
    dispatch_once(&qword_1ECD90E18, &unk_1E2C43DB0);
  v2 = off_1ECD90E08(*MEMORY[0x1E0C9AE00]);
  if (v2)
  {
    v10 = (const void *)v2;
    cf = 0;
    v11 = (void *)off_1ECD90E10(v2, v1, &cf);
    v12 = v11;
    if (cf)
    {

      _IMWarn(CFSTR("Unable to get entitlements for client task. Error: %@"), v13, v14, v15, v16, v17, v18, v19, (char)cf);
      if (cf)
        CFRelease(cf);
      v12 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    _IMWarn(CFSTR("Unable to create security task for self."), v3, v4, v5, v6, v7, v8, v9, v21);
    v12 = 0;
  }

  return v12;
}

void *sub_190682DB0()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SecTaskCreateFromSelf", CFSTR("Security"));
  off_1ECD90E08 = result;
  return result;
}

void *sub_190682DDC()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SecTaskCopyValueForEntitlement", CFSTR("Security"));
  off_1ECD90E10 = result;
  return result;
}

uint64_t IMDSelfTaskHasTrueNSNumberForEntitlement(void *a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = IMDSelfTaskCopyValueForEntitlement(a1);
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend_BOOLValue(v1, v2, v3, v4);
  else
    v5 = 0;

  return v5;
}

void sub_1906833FC(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(void);

  v12 = a3;
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainThread(MEMORY[0x1E0CB3978], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v10)
  {
    v12[2]();
  }
  else
  {
    v11 = (void *)MEMORY[0x19400E788]();
    v12[2]();
    objc_autoreleasePoolPop(v11);
  }

}

void sub_190683488(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void (**v17)(void);

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = v7;
  v17 = (void (**)(void))v6;
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend_isEqual_(v13, v14, (uint64_t)v8, v15);

  if ((v7 & 1) != 0)
  {
    v17[2]();
  }
  else if (v9)
  {
    objc_msgSend___im_performBlock_waitUntilDone_modes_(v8, v16, (uint64_t)v17, 0, v9);
  }
  else
  {
    objc_msgSend___im_performBlock_waitUntilDone_(v8, v16, (uint64_t)v17, 0);
  }

}

void sub_190683550(uint64_t a1, const char *a2, void *a3, uint64_t a4)
{
  void *v6;
  const char *v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3978];
  v8 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(v6, v7, (uint64_t)sel__im_runBlock_, a1, v8, a4);

}

void sub_1906835B8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = a5;
  v14 = (id)objc_msgSend_copy(a3, v10, v11, v12);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_modes_(v8, v13, (uint64_t)sel__im_runBlock_, a1, v14, a4, v9);

}

void sub_19068363C(void *a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v6 = a4;
  objc_msgSend___im_afterDelay_(a1, v7, v8, v9, a2);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_copy(v6, v10, v11, v12);

  objc_msgSend___im_performBlock_(v16, v14, (uint64_t)v13, v15);
}

void sub_1906836AC(void *a1, double a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v8 = a5;
  v9 = a4;
  objc_msgSend___im_afterDelay_modes_(a1, v10, (uint64_t)v8, v11, a2);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_copy(v9, v12, v13, v14);

  objc_msgSend___im_performBlock_modes_(v17, v16, (uint64_t)v15, (uint64_t)v8);
}

void im_perform_with_task_assertion(void *a1)
{
  void (**v1)(_QWORD);
  dispatch_semaphore_t v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v1 = a1;
  if (v1)
  {
    if (qword_1EE1DD720 != -1)
      dispatch_once(&qword_1EE1DD720, &unk_1E2C43DD0);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v2 = dispatch_semaphore_create(0);
    v3 = objc_alloc((Class)qword_1EE1DD718);
    v4 = getpid();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1906838E8;
    v20[3] = &unk_1E2C43DF8;
    v22 = &v23;
    v5 = v2;
    v21 = v5;
    v7 = (void *)objc_msgSend_initWithPID_flags_reason_name_withHandler_(v3, v6, v4, 1, 4, CFSTR("com.apple.imcore.generic-task-assertion"), v20);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    if (!*((_BYTE *)v24 + 24))
    {
      _IMWarn(CFSTR("Unable to take process assertion"), v8, v9, v10, v11, v12, v13, v14, v20[0]);
      IMLogBacktrace(0);
    }
    v1[2](v1);
    objc_msgSend_setInvalidationHandler_(v7, v15, 0, v16);
    objc_msgSend_invalidate(v7, v17, v18, v19);

    _Block_object_dispose(&v23, 8);
  }

}

void sub_1906838A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1906838BC()
{
  uint64_t result;

  result = IMWeakLinkClass(CFSTR("BKSProcessAssertion"), CFSTR("BackBoardServices"));
  qword_1EE1DD718 = result;
  return result;
}

intptr_t sub_1906838E8(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void im_main_thread(void *a1)
{
  void (**v1)(void);
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void (**block)(void);

  v1 = a1;
  if (v1)
  {
    block = v1;
    if (objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v2, v3, v4))
      block[2]();
    else
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    v1 = block;
  }

}

void im_dispatch_background_after(void *a1, double a2)
{
  int64_t v2;
  id v3;
  dispatch_time_t v4;
  NSObject *v5;

  if (a1)
  {
    v2 = (uint64_t)(a2 * 1000000000.0);
    v3 = a1;
    v4 = dispatch_time(0, v2);
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v4, v5, v3);

  }
}

void im_dispatch_thread_after(void *a1, void *a2, double a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  if (a2)
  {
    v5 = a2;
    objc_msgSend___im_afterDelay_(a1, v6, v7, v8, a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___im_performBlock_(v11, v9, (uint64_t)v5, v10);

  }
}

void im_dispatch_async_with_timeout(dispatch_time_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD block[4];
  NSObject *v23;
  id v24;
  id v25;
  uint64_t *v26;
  _QWORD handler[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  dispatch_source_t v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[3];
  char v42;
  _QWORD v43[3];
  int v44;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("com.apple.ids.async_with_timeout_1", v10);
  v12 = dispatch_queue_create("com.apple.ids.async_with_timeout_2", v10);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_190683CC4;
  aBlock[3] = &unk_1E2C43E20;
  v39 = v43;
  v40 = v41;
  v37 = v8;
  v38 = v9;
  v14 = v9;
  v15 = v8;
  v16 = _Block_copy(aBlock);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_190683D98;
  v34 = sub_190683DA8;
  v35 = (dispatch_source_t)0xAAAAAAAAAAAAAAAALL;
  v35 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);
  dispatch_source_set_timer((dispatch_source_t)v31[5], a1, 0xFFFFFFFFFFFFFFFFLL, 0);
  v17 = v31[5];
  handler[0] = v13;
  handler[1] = 3221225472;
  handler[2] = sub_190683DB0;
  handler[3] = &unk_1E2C43E48;
  v29 = &v30;
  v18 = v16;
  v28 = v18;
  dispatch_source_set_event_handler(v17, handler);
  dispatch_resume((dispatch_object_t)v31[5]);
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = sub_190683E00;
  block[3] = &unk_1E2C43E98;
  v23 = v12;
  v24 = v7;
  v25 = v18;
  v26 = &v30;
  v19 = v18;
  v20 = v12;
  v21 = v7;
  dispatch_async(v11, block);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

}

uint64_t sub_190683CC4(uint64_t result, int a2)
{
  _QWORD *v2;

  v2 = (_QWORD *)result;
  if (++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) == 1)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
    {
      if (a2)
      {
        *(_BYTE *)(*(_QWORD *)(v2[7] + 8) + 24) = 1;
        result = v2[4];
      }
      result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(v2[7] + 8) + 24));
      if (!*(_BYTE *)(*(_QWORD *)(v2[7] + 8) + 24))
        result = (*(uint64_t (**)(void))(v2[5] + 16))();
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(v2[7] + 8) + 24))
  {
    if (*(_DWORD *)(*(_QWORD *)(v2[6] + 8) + 24) == 2)
      return (*(uint64_t (**)(void))(v2[5] + 16))();
  }
  return result;
}

uint64_t sub_190683D98(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_190683DA8(uint64_t a1)
{

}

uint64_t sub_190683DB0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_190683E00(uint64_t a1)
{
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_190683E94;
  v5[3] = &unk_1E2C43E70;
  v2 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v7 = v4;
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v5);

}

void sub_190683E94(uint64_t a1)
{
  NSObject *v1;
  id v2;
  __int128 v3;
  _QWORD block[4];
  __int128 v5;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190683F10;
  block[3] = &unk_1E2C43E48;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  dispatch_async(v1, block);

}

uint64_t sub_190683F10(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_190683F60(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_mainThread(MEMORY[0x1E0CB3978], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___im_onThread_(a1, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_190683FAC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_mainThread(MEMORY[0x1E0CB3978], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___im_onThread_immediateForMatchingThread_(a1, v6, (uint64_t)v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t sub_190683FFC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend___im_onThread_(a1, a2, 0, a4);
}

id sub_190684004(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  IMThreadedInvocationTrampoline *v7;
  const char *v8;
  void *v9;

  v6 = a3;
  v7 = [IMThreadedInvocationTrampoline alloc];
  v9 = (void *)objc_msgSend_initWithTarget_thread_immediateForMatchingThread_(v7, v8, a1, (uint64_t)v6, a4);

  return v9;
}

uint64_t sub_190684060(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend___im_onThread_immediateForMatchingThread_(a1, a2, a3, 0);
}

id sub_190684068(uint64_t a1, double a2)
{
  IMDelayedInvocationTrampoline *v4;
  const char *v5;

  v4 = [IMDelayedInvocationTrampoline alloc];
  return (id)objc_msgSend_initWithTarget_delay_modes_(v4, v5, a1, 0, a2);
}

id sub_1906840AC(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  IMDelayedInvocationTrampoline *v7;
  const char *v8;
  void *v9;

  v6 = a4;
  v7 = [IMDelayedInvocationTrampoline alloc];
  v9 = (void *)objc_msgSend_initWithTarget_delay_modes_(v7, v8, a1, (uint64_t)v6, a2);

  return v9;
}

id sub_190684110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  IMCapturedInvocationTrampoline *v5;
  const char *v6;

  v5 = [IMCapturedInvocationTrampoline alloc];
  return (id)objc_msgSend_initWithTarget_outInvocation_(v5, v6, a1, a3);
}

const __CFString *_IMStringFromFZRegistrationErrorReason(int a1)
{
  if ((a1 + 1) > 0x1E)
    return CFSTR("Unknown");
  else
    return off_1E2C442C8[a1 + 1];
}

const __CFString *_IMStringFromFZAliasValidationStatus(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("Invalid");
  else
    return off_1E2C443F8[a1 + 1];
}

const __CFString *_IMStringFromFZRegistrationStatus(int a1)
{
  if ((a1 + 1) > 6)
    return CFSTR("Unknown");
  else
    return off_1E2C443C0[a1 + 1];
}

const __CFString *_IMStringFromFZProfileValidationStatus(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E2C443F8[a1 + 1];
}

id _IMStringFromFZListenerCapabilities(int a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  id v64;

  v2 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v5 = (void *)objc_msgSend_initWithString_(v2, v3, (uint64_t)CFSTR("("), v4);
  v9 = v5;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v10, (uint64_t)CFSTR(", "), v11);
    objc_msgSend_appendString_(v9, v10, (uint64_t)CFSTR("Status"), v11);
  }
  if ((a1 & 2) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v12, (uint64_t)CFSTR(", "), v13);
    objc_msgSend_appendString_(v9, v12, (uint64_t)CFSTR("Notifications"), v13);
  }
  if ((a1 & 4) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v14, (uint64_t)CFSTR(", "), v15);
    objc_msgSend_appendString_(v9, v14, (uint64_t)CFSTR("Chats"), v15);
  }
  if ((a1 & 8) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v16, (uint64_t)CFSTR(", "), v17);
    objc_msgSend_appendString_(v9, v16, (uint64_t)CFSTR("VC"), v17);
  }
  if ((a1 & 0x80000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v18, (uint64_t)CFSTR(", "), v19);
    objc_msgSend_appendString_(v9, v18, (uint64_t)CFSTR("FTA"), v19);
  }
  if ((a1 & 0x10) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v20, (uint64_t)CFSTR(", "), v21);
    objc_msgSend_appendString_(v9, v20, (uint64_t)CFSTR("AV Chat Info"), v21);
  }
  if ((a1 & 0x20) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v22, (uint64_t)CFSTR(", "), v23);
    objc_msgSend_appendString_(v9, v22, (uint64_t)CFSTR("Aux Input"), v23);
  }
  if ((a1 & 0x40) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v24, (uint64_t)CFSTR(", "), v25);
    objc_msgSend_appendString_(v9, v24, (uint64_t)CFSTR("VC Invitations"), v25);
  }
  if ((a1 & 0x80) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v26, (uint64_t)CFSTR(", "), v27);
    objc_msgSend_appendString_(v9, v26, (uint64_t)CFSTR("Legacy VC"), v27);
  }
  if ((a1 & 0x100) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v28, (uint64_t)CFSTR(", "), v29);
    objc_msgSend_appendString_(v9, v28, (uint64_t)CFSTR("Transfers"), v29);
  }
  if ((a1 & 0x200) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v30, (uint64_t)CFSTR(", "), v31);
    objc_msgSend_appendString_(v9, v30, (uint64_t)CFSTR("Accounts"), v31);
  }
  if ((a1 & 0x400) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v32, (uint64_t)CFSTR(", "), v33);
    objc_msgSend_appendString_(v9, v32, (uint64_t)CFSTR("Buddy List"), v33);
  }
  if ((a1 & 0x1000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v34, (uint64_t)CFSTR(", "), v35);
    objc_msgSend_appendString_(v9, v34, (uint64_t)CFSTR("Send Messages"), v35);
  }
  if ((a1 & 0x4000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v36, (uint64_t)CFSTR(", "), v37);
    objc_msgSend_appendString_(v9, v36, (uint64_t)CFSTR("ID Queries"), v37);
  }
  if ((a1 & 0x2000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v38, (uint64_t)CFSTR(", "), v39);
    objc_msgSend_appendString_(v9, v38, (uint64_t)CFSTR("Message History"), v39);
  }
  if ((a1 & 0x40000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v40, (uint64_t)CFSTR(", "), v41);
    objc_msgSend_appendString_(v9, v40, (uint64_t)CFSTR("Modify Read State"), v41);
  }
  if ((a1 & 0x8000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v42, (uint64_t)CFSTR(", "), v43);
    objc_msgSend_appendString_(v9, v42, (uint64_t)CFSTR("Chat Counts"), v43);
  }
  if ((a1 & 0x10000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v44, (uint64_t)CFSTR(", "), v45);
    objc_msgSend_appendString_(v9, v44, (uint64_t)CFSTR("Sent Messages"), v45);
  }
  if ((a1 & 0x20000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v46, (uint64_t)CFSTR(", "), v47);
    objc_msgSend_appendString_(v9, v46, (uint64_t)CFSTR("Database Update"), v47);
  }
  if ((a1 & 0x100000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v48, (uint64_t)CFSTR(", "), v49);
    objc_msgSend_appendString_(v9, v48, (uint64_t)CFSTR("AV"), v49);
  }
  if ((a1 & 0x200000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v50, (uint64_t)CFSTR(", "), v51);
    objc_msgSend_appendString_(v9, v50, (uint64_t)CFSTR("On Demand Chats"), v51);
  }
  if ((a1 & 0x400000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v52, (uint64_t)CFSTR(", "), v53);
    objc_msgSend_appendString_(v9, v52, (uint64_t)CFSTR("Truncated Chats"), v53);
  }
  if ((a1 & 0x2000000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v54, (uint64_t)CFSTR(", "), v55);
    objc_msgSend_appendString_(v9, v54, (uint64_t)CFSTR("Even more Truncated Chats"), v55);
  }
  if ((a1 & 0x800000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v56, (uint64_t)CFSTR(", "), v57);
    objc_msgSend_appendString_(v9, v56, (uint64_t)CFSTR("OneTimeCode"), v57);
  }
  if ((a1 & 0x1000000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v58, (uint64_t)CFSTR(", "), v59);
    objc_msgSend_appendString_(v9, v58, (uint64_t)CFSTR("Skip Last Message"), v59);
  }
  if ((a1 & 0x4000000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v60, (uint64_t)CFSTR(", "), v61);
    objc_msgSend_appendString_(v9, v60, (uint64_t)CFSTR("Blackhole Chats"), v61);
  }
  if ((a1 & 0x8000000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v62, (uint64_t)CFSTR(", "), v63);
    objc_msgSend_appendString_(v9, v62, (uint64_t)CFSTR("Send Emergency Messages"), v63);
  }
  objc_msgSend_appendString_(v9, v6, (uint64_t)CFSTR(")"), v8);
  v64 = v9;

  return v64;
}

id _IMStringFromFZCapabilities(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  id v100;

  v2 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v5 = (void *)objc_msgSend_initWithString_(v2, v3, (uint64_t)CFSTR("("), v4);
  v9 = v5;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v10, (uint64_t)CFSTR(", "), v11);
    objc_msgSend_appendString_(v9, v10, (uint64_t)CFSTR("Buddy Icon"), v11);
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v12, (uint64_t)CFSTR(", "), v13);
  objc_msgSend_appendString_(v9, v12, (uint64_t)CFSTR("IM Image"), v13);
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_56;
  }
LABEL_53:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v14, (uint64_t)CFSTR(", "), v15);
  objc_msgSend_appendString_(v9, v14, (uint64_t)CFSTR("Chat"), v15);
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    if ((a1 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_59;
  }
LABEL_56:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v16, (uint64_t)CFSTR(", "), v17);
  objc_msgSend_appendString_(v9, v16, (uint64_t)CFSTR("GetFile"), v17);
  if ((a1 & 0x20) == 0)
  {
LABEL_6:
    if ((a1 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_62;
  }
LABEL_59:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v18, (uint64_t)CFSTR(", "), v19);
  objc_msgSend_appendString_(v9, v18, (uint64_t)CFSTR("SendFile"), v19);
  if ((a1 & 0x40) == 0)
  {
LABEL_7:
    if ((a1 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_65;
  }
LABEL_62:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v20, (uint64_t)CFSTR(", "), v21);
  objc_msgSend_appendString_(v9, v20, (uint64_t)CFSTR("Chat Roomts"), v21);
  if ((a1 & 0x80) == 0)
  {
LABEL_8:
    if ((a1 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_68;
  }
LABEL_65:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v22, (uint64_t)CFSTR(", "), v23);
  objc_msgSend_appendString_(v9, v22, (uint64_t)CFSTR("Registration"), v23);
  if ((a1 & 0x100) == 0)
  {
LABEL_9:
    if ((a1 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_71;
  }
LABEL_68:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v24, (uint64_t)CFSTR(", "), v25);
  objc_msgSend_appendString_(v9, v24, (uint64_t)CFSTR("Offline IM"), v25);
  if ((a1 & 0x200) == 0)
  {
LABEL_10:
    if ((a1 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_74;
  }
LABEL_71:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v26, (uint64_t)CFSTR(", "), v27);
  objc_msgSend_appendString_(v9, v26, (uint64_t)CFSTR("Broadcast Messages"), v27);
  if ((a1 & 0x400) == 0)
  {
LABEL_11:
    if ((a1 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_77;
  }
LABEL_74:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v28, (uint64_t)CFSTR(", "), v29);
  objc_msgSend_appendString_(v9, v28, (uint64_t)CFSTR("IM"), v29);
  if ((a1 & 0x1000) == 0)
  {
LABEL_12:
    if ((a1 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_80;
  }
LABEL_77:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v30, (uint64_t)CFSTR(", "), v31);
  objc_msgSend_appendString_(v9, v30, (uint64_t)CFSTR("Message Blocking"), v31);
  if ((a1 & 0x2000) == 0)
  {
LABEL_13:
    if ((a1 & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_83;
  }
LABEL_80:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v32, (uint64_t)CFSTR(", "), v33);
  objc_msgSend_appendString_(v9, v32, (uint64_t)CFSTR("Presence Blocking"), v33);
  if ((a1 & 0x8000) == 0)
  {
LABEL_14:
    if ((a1 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_86;
  }
LABEL_83:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v34, (uint64_t)CFSTR(", "), v35);
  objc_msgSend_appendString_(v9, v34, (uint64_t)CFSTR("Buddy List"), v35);
  if ((a1 & 0x10000) == 0)
  {
LABEL_15:
    if ((a1 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_89;
  }
LABEL_86:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v36, (uint64_t)CFSTR(", "), v37);
  objc_msgSend_appendString_(v9, v36, (uint64_t)CFSTR("Conference Active"), v37);
  if ((a1 & 0x20000) == 0)
  {
LABEL_16:
    if ((a1 & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_92;
  }
LABEL_89:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v38, (uint64_t)CFSTR(", "), v39);
  objc_msgSend_appendString_(v9, v38, (uint64_t)CFSTR("Viceroy"), v39);
  if ((a1 & 0x40000) == 0)
  {
LABEL_17:
    if ((a1 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_95;
  }
LABEL_92:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v40, (uint64_t)CFSTR(", "), v41);
  objc_msgSend_appendString_(v9, v40, (uint64_t)CFSTR("Video Chat"), v41);
  if ((a1 & 0x80000) == 0)
  {
LABEL_18:
    if ((a1 & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_98;
  }
LABEL_95:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v42, (uint64_t)CFSTR(", "), v43);
  objc_msgSend_appendString_(v9, v42, (uint64_t)CFSTR("Audio Chat"), v43);
  if ((a1 & 0x100000) == 0)
  {
LABEL_19:
    if ((a1 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_101;
  }
LABEL_98:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v44, (uint64_t)CFSTR(", "), v45);
  objc_msgSend_appendString_(v9, v44, (uint64_t)CFSTR("Conference Available"), v45);
  if ((a1 & 0x200000) == 0)
  {
LABEL_20:
    if ((a1 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_104;
  }
LABEL_101:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v46, (uint64_t)CFSTR(", "), v47);
  objc_msgSend_appendString_(v9, v46, (uint64_t)CFSTR("AOL Video"), v47);
  if ((a1 & 0x400000) == 0)
  {
LABEL_21:
    if ((a1 & 0x800000) == 0)
      goto LABEL_22;
    goto LABEL_107;
  }
LABEL_104:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v48, (uint64_t)CFSTR(", "), v49);
  objc_msgSend_appendString_(v9, v48, (uint64_t)CFSTR("AOL Audio"), v49);
  if ((a1 & 0x800000) == 0)
  {
LABEL_22:
    if ((a1 & 0x1000000) == 0)
      goto LABEL_23;
    goto LABEL_110;
  }
LABEL_107:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v50, (uint64_t)CFSTR(", "), v51);
  objc_msgSend_appendString_(v9, v50, (uint64_t)CFSTR("Multi Audio"), v51);
  if ((a1 & 0x1000000) == 0)
  {
LABEL_23:
    if ((a1 & 0x2000000) == 0)
      goto LABEL_24;
    goto LABEL_113;
  }
LABEL_110:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v52, (uint64_t)CFSTR(", "), v53);
  objc_msgSend_appendString_(v9, v52, (uint64_t)CFSTR("Multi Video"), v53);
  if ((a1 & 0x2000000) == 0)
  {
LABEL_24:
    if ((a1 & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_116;
  }
LABEL_113:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v54, (uint64_t)CFSTR(", "), v55);
  objc_msgSend_appendString_(v9, v54, (uint64_t)CFSTR("AOL Multi Audio"), v55);
  if ((a1 & 0x4000000) == 0)
  {
LABEL_25:
    if ((a1 & 0x8000000) == 0)
      goto LABEL_26;
    goto LABEL_119;
  }
LABEL_116:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v56, (uint64_t)CFSTR(", "), v57);
  objc_msgSend_appendString_(v9, v56, (uint64_t)CFSTR("RD Server"), v57);
  if ((a1 & 0x8000000) == 0)
  {
LABEL_26:
    if ((a1 & 0x10000000) == 0)
      goto LABEL_27;
    goto LABEL_122;
  }
LABEL_119:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v58, (uint64_t)CFSTR(", "), v59);
  objc_msgSend_appendString_(v9, v58, (uint64_t)CFSTR("RD Client"), v59);
  if ((a1 & 0x10000000) == 0)
  {
LABEL_27:
    if ((a1 & 0x20000000) == 0)
      goto LABEL_28;
    goto LABEL_125;
  }
LABEL_122:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v60, (uint64_t)CFSTR(", "), v61);
  objc_msgSend_appendString_(v9, v60, (uint64_t)CFSTR("Subscription"), v61);
  if ((a1 & 0x20000000) == 0)
  {
LABEL_28:
    if ((a1 & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_128;
  }
LABEL_125:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v62, (uint64_t)CFSTR(", "), v63);
  objc_msgSend_appendString_(v9, v62, (uint64_t)CFSTR("Profile"), v63);
  if ((a1 & 0x40000000) == 0)
  {
LABEL_29:
    if ((a1 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_131;
  }
LABEL_128:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v64, (uint64_t)CFSTR(", "), v65);
  objc_msgSend_appendString_(v9, v64, (uint64_t)CFSTR("Notes"), v65);
  if ((a1 & 0x80000000) == 0)
  {
LABEL_30:
    if ((a1 & 0x100000000) == 0)
      goto LABEL_31;
    goto LABEL_134;
  }
LABEL_131:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v66, (uint64_t)CFSTR(", "), v67);
  objc_msgSend_appendString_(v9, v66, (uint64_t)CFSTR("Forgot Password"), v67);
  if ((a1 & 0x100000000) == 0)
  {
LABEL_31:
    if ((a1 & 0x200000000) == 0)
      goto LABEL_32;
    goto LABEL_137;
  }
LABEL_134:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v68, (uint64_t)CFSTR(", "), v69);
  objc_msgSend_appendString_(v9, v68, (uint64_t)CFSTR("Custom Ordering"), v69);
  if ((a1 & 0x200000000) == 0)
  {
LABEL_32:
    if ((a1 & 0x400000000) == 0)
      goto LABEL_33;
    goto LABEL_140;
  }
LABEL_137:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v70, (uint64_t)CFSTR(", "), v71);
  objc_msgSend_appendString_(v9, v70, (uint64_t)CFSTR("Buddy Watching"), v71);
  if ((a1 & 0x400000000) == 0)
  {
LABEL_33:
    if ((a1 & 0x800000000) == 0)
      goto LABEL_34;
    goto LABEL_143;
  }
LABEL_140:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v72, (uint64_t)CFSTR(", "), v73);
  objc_msgSend_appendString_(v9, v72, (uint64_t)CFSTR("Groups"), v73);
  if ((a1 & 0x800000000) == 0)
  {
LABEL_34:
    if ((a1 & 0x1000000000) == 0)
      goto LABEL_35;
    goto LABEL_146;
  }
LABEL_143:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v74, (uint64_t)CFSTR(", "), v75);
  objc_msgSend_appendString_(v9, v74, (uint64_t)CFSTR("AV Recording"), v75);
  if ((a1 & 0x1000000000) == 0)
  {
LABEL_35:
    if ((a1 & 0x2000000000) == 0)
      goto LABEL_36;
    goto LABEL_149;
  }
LABEL_146:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v76, (uint64_t)CFSTR(", "), v77);
  objc_msgSend_appendString_(v9, v76, (uint64_t)CFSTR("Aux Video"), v77);
  if ((a1 & 0x2000000000) == 0)
  {
LABEL_36:
    if ((a1 & 0x4000000000) == 0)
      goto LABEL_37;
    goto LABEL_152;
  }
LABEL_149:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v78, (uint64_t)CFSTR(", "), v79);
  objc_msgSend_appendString_(v9, v78, (uint64_t)CFSTR("ICE"), v79);
  if ((a1 & 0x4000000000) == 0)
  {
LABEL_37:
    if ((a1 & 0x8000000000) == 0)
      goto LABEL_38;
    goto LABEL_155;
  }
LABEL_152:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v80, (uint64_t)CFSTR(", "), v81);
  objc_msgSend_appendString_(v9, v80, (uint64_t)CFSTR("Invisible"), v81);
  if ((a1 & 0x8000000000) == 0)
  {
LABEL_38:
    if ((a1 & 0x10000000000) == 0)
      goto LABEL_39;
    goto LABEL_158;
  }
LABEL_155:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v82, (uint64_t)CFSTR(", "), v83);
  objc_msgSend_appendString_(v9, v82, (uint64_t)CFSTR("Require Chat Suffix"), v83);
  if ((a1 & 0x10000000000) == 0)
  {
LABEL_39:
    if ((a1 & 0x20000000000) == 0)
      goto LABEL_40;
    goto LABEL_161;
  }
LABEL_158:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v84, (uint64_t)CFSTR(", "), v85);
  objc_msgSend_appendString_(v9, v84, (uint64_t)CFSTR("Chat Ignore"), v85);
  if ((a1 & 0x20000000000) == 0)
  {
LABEL_40:
    if ((a1 & 0x40000000000) == 0)
      goto LABEL_41;
    goto LABEL_164;
  }
LABEL_161:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v86, (uint64_t)CFSTR(", "), v87);
  objc_msgSend_appendString_(v9, v86, (uint64_t)CFSTR("SMS"), v87);
  if ((a1 & 0x40000000000) == 0)
  {
LABEL_41:
    if ((a1 & 0x80000000000) == 0)
      goto LABEL_42;
    goto LABEL_167;
  }
LABEL_164:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v88, (uint64_t)CFSTR(", "), v89);
  objc_msgSend_appendString_(v9, v88, (uint64_t)CFSTR("RD Mux"), v89);
  if ((a1 & 0x80000000000) == 0)
  {
LABEL_42:
    if ((a1 & 0x100000000000) == 0)
      goto LABEL_43;
    goto LABEL_170;
  }
LABEL_167:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v90, (uint64_t)CFSTR(", "), v91);
  objc_msgSend_appendString_(v9, v90, (uint64_t)CFSTR("Directory Transfer"), v91);
  if ((a1 & 0x100000000000) == 0)
  {
LABEL_43:
    if ((a1 & 0x200000000000) == 0)
      goto LABEL_44;
    goto LABEL_173;
  }
LABEL_170:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v92, (uint64_t)CFSTR(", "), v93);
  objc_msgSend_appendString_(v9, v92, (uint64_t)CFSTR("FaceTime Blob"), v93);
  if ((a1 & 0x200000000000) == 0)
  {
LABEL_44:
    if ((a1 & 0x400000000000) == 0)
      goto LABEL_45;
    goto LABEL_176;
  }
LABEL_173:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v94, (uint64_t)CFSTR(", "), v95);
  objc_msgSend_appendString_(v9, v94, (uint64_t)CFSTR("FaceTime VC"), v95);
  if ((a1 & 0x400000000000) == 0)
  {
LABEL_45:
    if ((a1 & 0x800000000000) == 0)
      goto LABEL_182;
    goto LABEL_179;
  }
LABEL_176:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
    objc_msgSend_appendString_(v9, v96, (uint64_t)CFSTR(", "), v97);
  objc_msgSend_appendString_(v9, v96, (uint64_t)CFSTR("Delivery Receipts"), v97);
  if ((a1 & 0x800000000000) != 0)
  {
LABEL_179:
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2)
      objc_msgSend_appendString_(v9, v98, (uint64_t)CFSTR(", "), v99);
    objc_msgSend_appendString_(v9, v98, (uint64_t)CFSTR("Read Receipts"), v99);
  }
LABEL_182:
  objc_msgSend_appendString_(v9, v6, (uint64_t)CFSTR(")"), v8);
  v100 = v9;

  return v100;
}

id IMGenerateLoginID(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v1 = a1;
  v5 = objc_msgSend__FZBestGuessFZIDType(v1, v2, v3, v4);
  objc_msgSend__IDFromFZIDType_(v1, v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t IMCopyProcessNameForPid(int a1)
{
  __int128 v1;
  id v2;
  const char *v3;
  uint64_t v4;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v1;
  v6[1] = v1;
  if (proc_name(a1, v6, 0x20u) < 1)
    return 0;
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  return objc_msgSend_initWithUTF8String_(v2, v3, (uint64_t)v6, v4);
}

id IMProcessNameForPid(int a1)
{
  __int128 v1;
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v1;
  v7[1] = v1;
  if (proc_name(a1, v7, 0x20u) < 1)
  {
    v5 = 0;
  }
  else
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (void *)objc_msgSend_initWithUTF8String_(v2, v3, (uint64_t)v7, v4);
  }
  return v5;
}

id IMCreateSimpleComponentString(void *a1)
{
  id v1;
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v3);
        objc_msgSend_appendString_(v2, v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), v7, (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v8);
  }

  return v2;
}

uint64_t IMAreObjectsLogicallySame(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t isEqualToString;
  uint64_t v9;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v9 = 1;
  }
  else if ((v3 || !v4) && (!v3 || v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      isEqualToString = objc_msgSend_isEqualToString_(v3, v6, (uint64_t)v5, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        isEqualToString = objc_msgSend_isEqualToData_(v3, v11, (uint64_t)v5, v12);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          isEqualToString = objc_msgSend_isEqualToArray_(v3, v13, (uint64_t)v5, v14);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            isEqualToString = objc_msgSend_isEqualToSet_(v3, v15, (uint64_t)v5, v16);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              isEqualToString = objc_msgSend_isEqualToAttributedString_(v3, v17, (uint64_t)v5, v18);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                isEqualToString = objc_msgSend_isEqualToDate_(v3, v19, (uint64_t)v5, v20);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  isEqualToString = objc_msgSend_isEqualToOrderedSet_(v3, v21, (uint64_t)v5, v22);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    isEqualToString = objc_msgSend_isEqualToValue_(v3, v23, (uint64_t)v5, v24);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      isEqualToString = objc_msgSend_isEqualToDictionary_(v3, v25, (uint64_t)v5, v26);
                    else
                      isEqualToString = objc_msgSend_isEqual_(v3, v25, (uint64_t)v5, v26);
                  }
                }
              }
            }
          }
        }
      }
    }
    v9 = isEqualToString;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_1906858D8(void *a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  unint64_t v9;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v4 = objc_msgSend_count(obj, v1, v2, v3);
  v5 = v4;
  if (v4 >= 2)
  {
    v6 = 0;
    v7 = v4 - 1;
    do
    {
      v9 = arc4random() % v7;
      if (v6 != v9)
        objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(obj, v8, v6, v9);
      ++v6;
    }
    while (v5 != v6);
  }
  objc_sync_exit(obj);

}

void sub_190685964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id _PhotoSharingResponsesForString(void *a1, int a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  dispatch_semaphore_t v21;
  NSObject *v22;
  const char *v23;
  dispatch_time_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint8_t v33[8];
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v3 = a1;
  objc_msgSend_dataDetector(IMIDSLog, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v8)
      sub_1906B6330();
LABEL_15:

    v31 = 0;
    goto LABEL_19;
  }
  if (v8)
    sub_1906B6410();

  if (!v3)
  {
    objc_msgSend_dataDetector(IMIDSLog, v9, v10, v11);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1906B6360(v7, v29, v30);
    goto LABEL_15;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_190683D98;
  v46 = sub_190683DA8;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v12 = (void *)MEMORY[0x19400E788]();
  objc_msgSend_sharedManager(IMRKMessageResponseManager, v13, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    IMCurrentPreferredLanguage();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_semaphore_create(0);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_190685C40;
    v34[3] = &unk_1E2C43EC0;
    v36 = &v38;
    v37 = &v42;
    v22 = v21;
    v35 = v22;
    objc_msgSend_responsesForMessage_maximumResponses_forContext_withLanguage_options_completionBlock_(v19, v23, (uint64_t)v3, 0, 0, v20, 512, v34);
    v24 = dispatch_time(0, 200000000);
    if (dispatch_semaphore_wait(v22, v24))
    {
      *((_BYTE *)v39 + 24) = 1;
      __dmb(0xBu);
      objc_msgSend_dataDetector(IMIDSLog, v25, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1906B63E0();

    }
  }
  else
  {
    objc_msgSend_dataDetector(IMIDSLog, v16, v17, v18);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_19066D000, v20, OS_LOG_TYPE_DEFAULT, "Failed to link RKMessageResponseManager.", v33, 2u);
    }
  }

  objc_autoreleasePoolPop(v12);
  v31 = (id)v43[5];
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

LABEL_19:
  return v31;
}

void sub_190685C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_190685C40(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  __dmb(0xBu);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v4 = v5;
  }

}

uint64_t _AddDDPhotoSharingIntentResultToAttributedString(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  char v92;
  _BYTE v93[15];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  void *v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v91 = a1;
  v3 = a2;
  if (!objc_msgSend_count(v3, v4, v5, v6))
  {
    objc_msgSend_dataDetector(IMIDSLog, v7, v8, v9);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      sub_1906B6440();
    goto LABEL_32;
  }
  IMRKAttributedTokenTypeKey();
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v14 = (void *)v10;
    IMRKAttributedTokenPhotosharingType();
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      IMRKAttributedTokenPhotosharingKeywordsKey();
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        IMRKAttributedTokenPhotosharingKeywordRangesKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = (void *)MEMORY[0x19400E788]();
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v21 = v3;
          v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v94, (uint64_t)v102, 16);
          if (v23)
          {
            v27 = v23;
            v85 = v20;
            v86 = v3;
            v28 = 0;
            v29 = *(_QWORD *)v95;
            v87 = *(_QWORD *)v95;
            v88 = v21;
            do
            {
              v30 = 0;
              v89 = v27;
              do
              {
                if (*(_QWORD *)v95 != v29)
                  objc_enumerationMutation(v21);
                objc_msgSend_attributes(*(void **)(*((_QWORD *)&v94 + 1) + 8 * v30), v24, v25, v26, v85, v86);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                IMRKAttributedTokenTypeKey();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v31, v33, (uint64_t)v32, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                IMRKAttributedTokenPhotosharingType();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = v35;
                LODWORD(v35) = objc_msgSend_isEqualToString_(v35, v37, (uint64_t)v36, v38);

                if ((_DWORD)v35)
                {
                  IMRKAttributedTokenPhotosharingKeywordsKey();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v31, v40, (uint64_t)v39, v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  IMRKAttributedTokenPhotosharingKeywordRangesKey();
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v31, v44, (uint64_t)v43, v45);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend_count(v42, v47, v48, v49))
                  {
                    v53 = 0;
                    do
                    {
                      if (v53 >= objc_msgSend_count(v46, v50, v51, v52))
                      {
                        objc_msgSend_dataDetector(IMIDSLog, v54, v55, v56);
                        v68 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                          sub_1906B64D8(&v92, v93);
                      }
                      else
                      {
                        objc_msgSend_objectAtIndexedSubscript_(v46, v54, v53, v56);
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        v61 = objc_msgSend_rangeValue(v57, v58, v59, v60);
                        v63 = v62;

                        objc_msgSend_addAttribute_value_range_(v91, v64, (uint64_t)CFSTR("__kIMPhotoSharingAttributeName"), MEMORY[0x1E0C9AA70], v61, v63);
                        objc_msgSend_dataDetector(IMIDSLog, v65, v66, v67);
                        v68 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend_objectAtIndexedSubscript_(v42, v69, v53, v70);
                          v74 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_objectAtIndexedSubscript_(v46, v75, v53, v76);
                          v77 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v99 = v74;
                          v100 = 2112;
                          v101 = v77;
                          _os_log_debug_impl(&dword_19066D000, v68, OS_LOG_TYPE_DEBUG, "Found photo sharing intent:%@(%@)", buf, 0x16u);

                        }
                        v28 = 1;
                      }

                      ++v53;
                    }
                    while (v53 < objc_msgSend_count(v42, v71, v72, v73));
                  }

                  v29 = v87;
                  v21 = v88;
                  v27 = v89;
                }

                ++v30;
              }
              while (v30 != v27);
              v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v94, (uint64_t)v102, 16);
            }
            while (v27);

            v20 = v85;
            v3 = v86;
            if ((v28 & 1) != 0)
            {
              v81 = 1;
LABEL_38:
              objc_autoreleasePoolPop(v20);
              goto LABEL_33;
            }
          }
          else
          {

          }
          objc_msgSend_dataDetector(IMIDSLog, v78, v79, v80);
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
            sub_1906B64A8();

          v81 = 0;
          goto LABEL_38;
        }
        goto LABEL_30;
      }

    }
  }
LABEL_30:
  objc_msgSend_dataDetector(IMIDSLog, v11, v12, v13);
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v82, OS_LOG_TYPE_DEFAULT, "Failed to link ResponseKit symbols. Bailing.", buf, 2u);
  }
LABEL_32:

  v81 = 0;
LABEL_33:

  return v81;
}

uint64_t IMSharedDDScanner()
{
  uint64_t v1;

  pthread_mutex_lock(&stru_1EE1DC860);
  if (qword_1EE1DD7E0 != -1)
    dispatch_once(&qword_1EE1DD7E0, &unk_1E2C43EE0);
  v1 = 0;
  if (!qword_1EE1DD7F0)
  {
    qword_1EE1DD7F0 = off_1EE1DD7D0(0, 0, &v1);
    if (qword_1EE1DD7F0)
    {
      if (qword_1EE1DD7E8 != -1)
        dispatch_once(&qword_1EE1DD7E8, &unk_1E2C43F00);
      if (qword_1EE1DD5E0 != -1)
        dispatch_once(&qword_1EE1DD5E0, &unk_1E2C43F20);
      off_1EE1DD7D8(qword_1EE1DD7F0, 2, 1);
      off_1EE1DD7D8(qword_1EE1DD7F0, 8, 1);
      off_1EE1DD5D8(qword_1EE1DD7F0, 2);
    }
  }
  pthread_mutex_unlock(&stru_1EE1DC860);
  return qword_1EE1DD7F0;
}

void *sub_19068624C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDScannerCreate", CFSTR("DataDetectorsCore"));
  off_1EE1DD7D0 = result;
  return result;
}

void *sub_190686278()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDScannerEnableOptionalSource", CFSTR("DataDetectorsCore"));
  off_1EE1DD7D8 = result;
  return result;
}

void *sub_1906862A4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDScannerSetQOS", CFSTR("DataDetectorsCore"));
  off_1EE1DD5D8 = result;
  return result;
}

uint64_t IMSharedDDShortNumberScanner()
{
  uint64_t v1;

  pthread_mutex_lock(&stru_1EE1DC860);
  if (qword_1EE1DD800 != -1)
    dispatch_once(&qword_1EE1DD800, &unk_1E2C43F40);
  v1 = 0;
  if (!qword_1EE1DD808)
    qword_1EE1DD808 = off_1EE1DD7F8(1, 0, &v1);
  pthread_mutex_unlock(&stru_1EE1DC860);
  return qword_1EE1DD808;
}

void *sub_190686360()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDScannerCreate", CFSTR("DataDetectorsCore"));
  off_1EE1DD7F8 = result;
  return result;
}

BOOL IMDDScanAttributedStringWithContext(void *a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  return IMDDScanAttributedStringWithExtendedContext(a1, a2, a3, a4, a5, 0, a6);
}

BOOL IMDDScanAttributedStringWithExtendedContext(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, char a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _BOOL8 v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (qword_1EE1DD7C0 != -1)
    dispatch_once(&qword_1EE1DD7C0, &unk_1E2C43F78);
  v19 = 0;
  if (v13 && v14)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v20 = qword_1EE1DD7C8;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_19068659C;
    v22[3] = &unk_1E2C44040;
    v23 = v14;
    v30 = a7;
    v24 = v18;
    v29 = &v31;
    v25 = v13;
    v26 = v15;
    v27 = v16;
    v28 = v17;
    dispatch_sync(v20, v22);
    v19 = *((_BYTE *)v32 + 24) != 0;

    _Block_object_dispose(&v31, 8);
  }

  return v19;
}

void sub_19068654C()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("IMDDScannerQueue", v2);
  v1 = (void *)qword_1EE1DD7C8;
  qword_1EE1DD7C8 = (uint64_t)v0;

}

void sub_19068659C(uint64_t a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, void *);
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t (*v9)(uint64_t, _QWORD);
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  __CFArray *MutableCopy;
  void (*v33)(__CFArray *, uint64_t, uint64_t);
  uint64_t v34;
  __CFArray *v35;
  const __CFArray *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void **v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  CFIndex v54;
  int v55;
  const void *ValueAtIndex;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  id v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  BOOL v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  id v77;
  id v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  NSObject *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  BOOL v89;
  void *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  char v96;
  id v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  NSObject *v102;
  NSObject *v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  __CFString *v108;
  id v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  BOOL v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  char v126;
  char v127;
  NSObject *v128;
  NSObject *v129;
  NSObject *v130;
  void **v131;
  void *v132;
  void **v133;
  void *v134;
  void *v135;
  void **v136;
  void *v137;
  void *v138;
  void **v139;
  void *v140;
  char v141;
  NSObject *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  uint64_t v150;
  char v151;
  NSObject *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void (*v159)(uint64_t);
  uint64_t v160;
  void (*v161)(uint64_t);
  uint64_t v162;
  char v163;
  char v164;
  id v165;
  void *context;
  id contexta;
  int v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  __CFArray *cf;
  const __CFArray *theArray;
  void *v185;
  const __CFArray *v186;
  id v187;
  char v188;
  char v189[15];
  char v190;
  char v191[15];
  char v192;
  char v193[15];
  char v194;
  char v195[15];
  char v196;
  char v197[15];
  double v198;
  uint64_t v199;
  char v200;
  char v201[15];
  _BYTE buf[12];
  __int16 v203;
  double v204;
  __int16 v205;
  uint64_t v206;
  uint64_t v207;
  CFRange v208;

  v207 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1DD868 != -1)
    dispatch_once(&qword_1EE1DD868, &unk_1E2C43F98);
  if (qword_1EE1DD860 != -1)
    dispatch_once(&qword_1EE1DD860, &unk_1E2C43FB8);
  if (qword_1EE1DD858 != -1)
    dispatch_once(&qword_1EE1DD858, &unk_1E2C43FD8);
  if (qword_1EE1DD850 != -1)
    dispatch_once(&qword_1EE1DD850, &unk_1E2C43FF8);
  if (qword_1EE1DD848 != -1)
    dispatch_once(&qword_1EE1DD848, &unk_1E2C44018);
  v2 = (uint64_t (*)(uint64_t, uint64_t, void *))off_1EE1DD840;
  v3 = IMSharedDDScanner();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v5, (uint64_t)CFSTR("ConversationID"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v2(v3, v4, v7);

  v9 = (uint64_t (*)(uint64_t, _QWORD))off_1EE1DD838;
  v10 = IMSharedDDShortNumberScanner();
  v11 = v9(v10, *(_QWORD *)(a1 + 32));
  _PhotoSharingResponsesForString(*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 88));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && !v11 && !v185)
  {
    objc_msgSend_dataDetector(IMIDSLog, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1906B682C();

    goto LABEL_173;
  }
  objc_msgSend_dataDetector(IMIDSLog, v12, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_1906B67FC();

  if (v8)
  {
    v20 = (uint64_t (*)(uint64_t, uint64_t))off_1EE1DD828;
    v21 = IMSharedDDScanner();
    if (qword_1EE1DD3E8 != -1)
      dispatch_once(&qword_1EE1DD3E8, &unk_1E2C44108);
    theArray = (const __CFArray *)v20(v21, qword_1EE1DD3E0);
    if (v11)
      goto LABEL_23;
LABEL_25:
    v186 = 0;
    goto LABEL_26;
  }
  theArray = 0;
  if (!v11)
    goto LABEL_25;
LABEL_23:
  v22 = (uint64_t (*)(uint64_t, uint64_t))off_1EE1DD828;
  v23 = IMSharedDDShortNumberScanner();
  v186 = (const __CFArray *)v22(v23, 8);
LABEL_26:
  objc_msgSend_dataDetector(IMIDSLog, v17, v18, v19);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    sub_1906B679C();

  objc_msgSend_dataDetector(IMIDSLog, v25, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    sub_1906B673C();

  MutableCopy = 0;
  if (theArray && v186)
  {
    MutableCopy = CFArrayCreateMutableCopy(0, 0, v186);
    v208.length = (int)CFArrayGetCount(theArray);
    v208.location = 0;
    CFArrayAppendArray(MutableCopy, theArray, v208);
    v33 = (void (*)(__CFArray *, uint64_t, uint64_t))off_1EE1DD820;
    v34 = IMSharedDDScanner();
    v33(MutableCopy, v34, 32);
  }
  cf = MutableCopy;
  if (v186)
    v35 = MutableCopy;
  else
    v35 = theArray;
  if (theArray)
    v36 = v35;
  else
    v36 = v186;
  objc_msgSend_dataDetector(IMIDSLog, v29, v30, v31);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    sub_1906B66DC();

  if (!v36)
    goto LABEL_158;
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v38, (uint64_t)CFSTR("ConversationID"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v42, (uint64_t)CFSTR("ServiceName"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *(void **)(a1 + 56);
  v46 = *(void **)(a1 + 64);
  v47 = *(void **)(a1 + 72);
  v168 = *(unsigned __int8 *)(a1 + 88);
  v187 = *(id *)(a1 + 48);
  v180 = v45;
  v181 = v46;
  v182 = v47;
  v178 = v44;
  v179 = v41;
  if (qword_1EE1DD3D0 != -1)
    dispatch_once(&qword_1EE1DD3D0, &unk_1E2C44128);
  if (qword_1EE1DD3D8 != -1)
    dispatch_once(&qword_1EE1DD3D8, &unk_1E2C44148);
  if (!qword_1EE1DD3B8)
  {
    v48 = (void **)IMWeakLinkSymbol("DDBinderAuthCodeKey", CFSTR("DataDetectorsCore"));
    if (v48)
      v49 = *v48;
    else
      v49 = 0;
    objc_storeStrong((id *)&qword_1EE1DD3B8, v49);
  }
  if (!CFArrayGetCount(v36))
  {
    v141 = 0;
    goto LABEL_157;
  }
  objc_msgSend_dataDetector(IMIDSLog, v50, v51, v52);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    sub_1906B667C();

  if ((int)CFArrayGetCount(v36) < 1)
  {
    LOBYTE(v55) = 0;
    goto LABEL_156;
  }
  v54 = 0;
  v169 = 0;
  v170 = 0;
  LOBYTE(v55) = 0;
  while (2)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v36, v54);
    v60 = off_1EE1DD3C0();
    switch(v60)
    {
      case 0:
        if (!off_1EE1DD3C8(ValueAtIndex, qword_1EE1DD3B8))
        {
          objc_msgSend_dataDetector(IMIDSLog, v61, v62, v63);
          v103 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            *(_QWORD *)buf = 67109120;
            _os_log_impl(&dword_19066D000, v103, OS_LOG_TYPE_DEFAULT, "Found result of type: %d", buf, 8u);
          }
          goto LABEL_84;
        }
        LOBYTE(v55) = sub_1906884A4(v187, v169, (uint64_t)ValueAtIndex);
        goto LABEL_151;
      case 1:
        v104 = (sub_190687F64(v187, (uint64_t)ValueAtIndex, CFSTR("__kIMDataDetectedAttributeName")) | v55) & 1;
        v55 = sub_1906881E4(v187, (uint64_t)ValueAtIndex) | v104;
        goto LABEL_151;
      case 2:
        v65 = v187;
        v173 = v180;
        v175 = v181;
        v66 = v182;
        objc_msgSend_dataDetector(IMIDSLog, v67, v68, v69);
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          sub_1906B65F8(&v192, v193);

        v71 = v187 == 0;
        if (!ValueAtIndex)
          v71 = 1;
        if (v71)
        {
          v127 = 0;
        }
        else
        {
          context = (void *)MEMORY[0x19400E788]();
          sub_190688778((uint64_t)ValueAtIndex);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dataDetector(IMIDSLog, v73, v74, v75);
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v72;
            _os_log_debug_impl(&dword_19066D000, v76, OS_LOG_TYPE_DEBUG, "Found an phone number category %@", buf, 0xCu);
          }

          v164 = sub_190687F64(v65, (uint64_t)ValueAtIndex, CFSTR("__kIMPhoneNumberAttributeName"));
          v163 = sub_1906881E4(v65, (uint64_t)ValueAtIndex);
          v77 = v72;
          v171 = v173;
          v78 = v175;
          v82 = v66;
          if (v168)
          {
            objc_msgSend_dataDetector(IMIDSLog, v79, v80, v81);
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              sub_1906B65CC(&v194, v195);

          }
          else
          {
            if (!qword_1EE1DD9F0)
            {
              v133 = (void **)IMWeakLinkSymbol("CRAddressKindPhoneNumber", CFSTR("CoreRecents"));
              if (v133)
                v134 = *v133;
              else
                v134 = 0;
              objc_storeStrong((id *)&qword_1EE1DD9F0, v134);
            }
            v138 = (void *)qword_1EE1DD9F8;
            if (!qword_1EE1DD9F8)
            {
              v139 = (void **)IMWeakLinkSymbol("CRRecentsDomainMessages", CFSTR("CoreRecents"));
              if (v139)
                v140 = *v139;
              else
                v140 = 0;
              objc_storeStrong((id *)&qword_1EE1DD9F8, v140);
              v138 = (void *)qword_1EE1DD9F8;
            }
            sub_190688800(v77, v171, v78, v82, (void *)qword_1EE1DD9F0, v138);
          }

          objc_autoreleasePoolPop(context);
          v127 = v164 | v163;
        }

        v126 = v127 | v55;
        goto LABEL_150;
      case 3:
        v172 = v187;
        v174 = v180;
        v176 = v181;
        v84 = v182;
        objc_msgSend_dataDetector(IMIDSLog, v85, v86, v87);
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
          sub_1906B65F8(&v188, v189);

        v89 = v187 == 0;
        if (!ValueAtIndex)
          v89 = 1;
        if (v89)
        {
          v96 = 0;
        }
        else
        {
          v90 = (void *)MEMORY[0x19400E788]();
          sub_190688778((uint64_t)ValueAtIndex);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dataDetector(IMIDSLog, v92, v93, v94);
          v95 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v91;
            _os_log_debug_impl(&dword_19066D000, v95, OS_LOG_TYPE_DEBUG, "Found an address category %@", buf, 0xCu);
          }

          v96 = sub_190687F64(v172, (uint64_t)ValueAtIndex, CFSTR("__kIMAddressAttributeName"));
          v97 = v91;
          v165 = v174;
          contexta = v176;
          v101 = v84;
          if (v168)
          {
            objc_msgSend_dataDetector(IMIDSLog, v98, v99, v100);
            v102 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
              sub_1906B65CC(&v190, v191);

          }
          else
          {
            if (!qword_1EE1DD998)
            {
              v131 = (void **)IMWeakLinkSymbol("CRAddressKindMapLocation", CFSTR("CoreRecents"));
              if (v131)
                v132 = *v131;
              else
                v132 = 0;
              objc_storeStrong((id *)&qword_1EE1DD998, v132);
            }
            v135 = (void *)qword_1EE1DD9A0;
            if (!qword_1EE1DD9A0)
            {
              v136 = (void **)IMWeakLinkSymbol("CRRecentsDomainMaps", CFSTR("CoreRecents"));
              if (v136)
                v137 = *v136;
              else
                v137 = 0;
              objc_storeStrong((id *)&qword_1EE1DD9A0, v137);
              v135 = (void *)qword_1EE1DD9A0;
            }
            sub_190688800(v97, v165, contexta, v101, (void *)qword_1EE1DD998, v135);
          }

          objc_autoreleasePoolPop(v90);
        }

        goto LABEL_139;
      case 4:
        v64 = sub_190687F64(v187, (uint64_t)ValueAtIndex, CFSTR("__kIMCalendarEventAttributeName"));
        goto LABEL_109;
      case 5:
        if (off_1EE1DD3C8(ValueAtIndex, qword_1EE1DD3B8))
        {
          v105 = v169;
          if (!v169)
            v105 = (uint64_t)ValueAtIndex;
          v169 = v105;
          goto LABEL_151;
        }
        v64 = sub_190687F64(v187, (uint64_t)ValueAtIndex, CFSTR("__kIMDataDetectedAttributeName"));
LABEL_109:
        v126 = v64 | v55;
        goto LABEL_150;
      case 6:
        v106 = v170;
        if (!v170)
          v106 = (uint64_t)ValueAtIndex;
        v170 = v106;
        v107 = v187;
        v108 = CFSTR("__kIMMoneyAttributeName");
        v177 = v178;
        v109 = v179;
        objc_msgSend_dataDetector(IMIDSLog, v110, v111, v112);
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
          sub_1906B6650(&v200, v201);

        if (ValueAtIndex)
          v117 = v187 != 0;
        else
          v117 = 0;
        if (v117)
        {
          v118 = (void *)MEMORY[0x19400E788]();
          v198 = 0.0;
          v199 = 0;
          if (qword_1EE1DDA28 != -1)
            dispatch_once(&qword_1EE1DDA28, &unk_1E2C44248);
          if (off_1EE1DDA20(ValueAtIndex, &v198, &v199) && v199 && (v122 = v198, v198 != 0.0))
          {
            if ((sub_190687F64(v107, (uint64_t)ValueAtIndex, v108) & 1) != 0)
            {
              v96 = 1;
LABEL_121:
              objc_autoreleasePoolPop(v118);
              goto LABEL_122;
            }
          }
          else
          {
            objc_msgSend_dataDetector(IMIDSLog, v119, v120, v121, v122);
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = ValueAtIndex;
              v203 = 2048;
              v204 = v198;
              v205 = 2112;
              v206 = v199;
              _os_log_debug_impl(&dword_19066D000, v129, OS_LOG_TYPE_DEBUG, "Failed to extract amount and currency from money result. Result: %@, amount: %f, currencyCode: %@", buf, 0x20u);
            }

          }
          objc_msgSend_dataDetector(IMIDSLog, v123, v124, v125);
          v130 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
            sub_1906B6624(&v196, v197);

          v96 = 0;
          goto LABEL_121;
        }
        objc_msgSend_dataDetector(IMIDSLog, v114, v115, v116);
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v187;
          v203 = 2112;
          v204 = *(double *)&ValueAtIndex;
          _os_log_debug_impl(&dword_19066D000, v128, OS_LOG_TYPE_DEBUG, "Failed to add detected money result due to invalid preconditions. attributedString: %@, result: %@", buf, 0x16u);
        }

        v96 = 0;
LABEL_122:

LABEL_139:
        v126 = v96 | v55;
LABEL_150:
        LOBYTE(v55) = v126 & 1;
LABEL_151:
        if (++v54 < (int)CFArrayGetCount(v36))
          continue;
        if (v169)
          LOBYTE(v55) = (sub_1906884A4(v187, v169, v170) | v55) & 1;
LABEL_156:
        v141 = v55 & 1;
LABEL_157:

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v141;
LABEL_158:
        objc_msgSend_dataDetector(IMIDSLog, v38, v39, v40);
        v142 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
          sub_1906B656C();

        if (objc_msgSend_count(v185, v143, v144, v145))
        {
          v149 = _AddDDPhotoSharingIntentResultToAttributedString(*(void **)(a1 + 48), v185);
          v150 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          if (*(_BYTE *)(v150 + 24))
            v151 = 1;
          else
            v151 = v149;
          *(_BYTE *)(v150 + 24) = v151;
        }
        objc_msgSend_dataDetector(IMIDSLog, v146, v147, v148);
        v152 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG))
          sub_1906B6504(a1, v152, v153, v154, v155, v156, v157, v158);

        v159 = (void (*)(uint64_t))off_1EE1DD830;
        v160 = IMSharedDDScanner();
        v159(v160);
        v161 = (void (*)(uint64_t))off_1EE1DD830;
        v162 = IMSharedDDShortNumberScanner();
        v161(v162);
        if (theArray)
          CFRelease(theArray);
        if (cf)
          CFRelease(cf);
        if (v186)
          CFRelease(v186);
LABEL_173:

        return;
      default:
        objc_msgSend_dataDetector(IMIDSLog, v57, v58, v59);
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v60;
          _os_log_impl(&dword_19066D000, v103, OS_LOG_TYPE_DEFAULT, "Found result of type: %d", buf, 8u);
        }
LABEL_84:

        goto LABEL_151;
    }
  }
}

void sub_190687610(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_end_catch();
  if (a2 == 1)
  {
    v12 = objc_begin_catch(a1);
    _IMWarn(CFSTR("Exception processing scanned message ID: %@   (%@)"), v5, v6, v7, v8, v9, v10, v11, *(_QWORD *)(v2 + 56));

    objc_end_catch();
    JUMPOUT(0x190687490);
  }
  JUMPOUT(0x1906876D0);
}

void sub_190687620(void *a1, int a2)
{
  id v2;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(a1);
    _IMWarn(CFSTR("Exception processing scanned message ID: %@   (%@)"));

    objc_end_catch();
    JUMPOUT(0x190687490);
  }
  JUMPOUT(0x1906876D0);
}

void sub_1906876B8(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_end_catch();
  if (a2 == 1)
  {
    v12 = objc_begin_catch(a1);
    _IMWarn(CFSTR("Exception scanning messageID: %@   (%@)"), v5, v6, v7, v8, v9, v10, v11, *(_QWORD *)(v2 + 56));

    objc_end_catch();
    JUMPOUT(0x190687514);
  }
  JUMPOUT(0x190687718);
}

void sub_190687708(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void *sub_19068773C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDScannerScanStringFromConversation", CFSTR("DataDetectorsCore"));
  off_1EE1DD840 = result;
  return result;
}

void *sub_190687768()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDScannerScanString", CFSTR("DataDetectorsCore"));
  off_1EE1DD838 = result;
  return result;
}

void *sub_190687794()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDScannerReset", CFSTR("DataDetectorsCore"));
  off_1EE1DD830 = result;
  return result;
}

void *sub_1906877C0()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDScannerCopyResultsWithOptions", CFSTR("DataDetectorsCore"));
  off_1EE1DD828 = result;
  return result;
}

void *sub_1906877EC()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDApplyOptions", CFSTR("DataDetectorsCore"));
  off_1EE1DD820 = result;
  return result;
}

uint64_t IMSetThreadPriority(int a1)
{
  _opaque_pthread_t *v2;
  uint64_t result;
  int v4;
  sched_param v5;

  v2 = pthread_self();
  v5 = (sched_param)0xAAAAAAAAAAAAAAAALL;
  v4 = -1431655766;
  result = pthread_getschedparam(v2, &v4, &v5);
  if (!(_DWORD)result)
  {
    v5.sched_priority = a1;
    return pthread_setschedparam(v2, v4, &v5);
  }
  return result;
}

void IMEnumerateArrayInRange(void *a1, unint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a4;
  v23 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, (uint64_t)v24, 16);
  if (v11)
  {
    v13 = v11;
    v14 = 0;
    v15 = a2 + a3;
    v16 = *(_QWORD *)v20;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v16)
        objc_enumerationMutation(v9);
      if (v14 + v17 >= a2)
        v8[2](v8, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17));
      if (v23 || v14 + v17 + 1 >= v15)
        break;
      if (v13 == ++v17)
      {
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, (uint64_t)v24, 16);
        v14 += v17;
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

}

BOOL IMPerformSystem(const char *a1)
{
  FILE *v1;

  v1 = popen(a1, "r");
  return pclose(v1) == 0;
}

void IMSubmitSimpleAggegateMetric(void *a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a1;
  if (v3)
  {
    dispatch_get_global_queue(-32768, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_190687A94;
    v5[3] = &unk_1E2C44088;
    v6 = v3;
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

void sub_190687A94(uint64_t a1)
{
  if (qword_1EE1DD980 != -1)
    dispatch_once(&qword_1EE1DD980, &unk_1E2C44060);
  if (off_1EE1DD978)
    off_1EE1DD978(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void *sub_190687AF4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("ADClientAddValueForScalarKey", CFSTR("AggregateDictionary"));
  off_1EE1DD978 = result;
  return result;
}

void IMSubmitSimpleAWDMetric(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_190687BA0;
  v5[3] = &unk_1E2C440A8;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

uint64_t sub_190687BA0(uint64_t a1)
{
  uint64_t result;

  result = IMWeakLinkClass(CFSTR("AWDMetricManager"), CFSTR("WirelessDiagnostics"));
  if (result)
    return MEMORY[0x1E0DE7D20](result, sel_postMetricWithId_integerValue_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

__CFString *sub_190687BE8(uint64_t a1, uint64_t a2, void *a3, va_list a4)
{
  return _IMFastCreateFormatString(a3, a4);
}

id IMPreviewCachesDirectoryWithAttachmentURL(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;

  if (a1)
  {
    objc_msgSend_path(a1, a2, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend_rangeOfString_options_(v4, v5, (uint64_t)CFSTR("/var/mobile/Library/SMS/"), 8);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend_substringFromIndex_(v4, v7, (uint64_t)&v7[v6], v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByDeletingLastPathComponent(v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v15, (uint64_t)CFSTR("/var/mobile/Library/Caches/com.apple.MobileSMS"), v16, CFSTR("Previews"), v14, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathWithComponents_(MEMORY[0x1E0CB3940], v18, (uint64_t)v17, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v20, (uint64_t)v21, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

__CFString *IMGetHostUUID()
{
  const __CFAllocator *v0;
  const __CFUUID *v1;
  __CFString *v2;
  timespec v4;
  uuid_t v5;

  memset(v5, 170, sizeof(v5));
  v4.tv_sec = 0;
  v4.tv_nsec = 0;
  if (gethostuuid(v5, &v4) == -1)
  {
    v2 = 0;
  }
  else
  {
    v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
    v1 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], *(CFUUIDBytes *)v5);
    v2 = (__CFString *)CFUUIDCreateString(v0, v1);
    if (v1)
      CFRelease(v1);
  }
  return v2;
}

void sub_190687D88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  __int16 v32;

  objc_msgSend_controlCharacterSet(MEMORY[0x1E0CB3500], a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_mutableCopy(v4, v5, v6, v7);

  objc_msgSend_invert(v8, v9, v10, v11);
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_formUnionWithCharacterSet_(v8, v16, (uint64_t)v15, v17);

  objc_msgSend_invert(v8, v18, v19, v20);
  v32 = 6158;
  v31 = 537731084;
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v23 = (void *)objc_msgSend_initWithCharactersNoCopy_length_freeWhenDone_(v21, v22, (uint64_t)&v31, 3, 0);
  objc_msgSend_removeCharactersInString_(v8, v24, (uint64_t)v23, v25);
  v29 = objc_msgSend_copy(v8, v26, v27, v28);
  v30 = (void *)qword_1EE1DD870;
  qword_1EE1DD870 = v29;

}

void sub_190687E60()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  sub_19067DDCC();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend_mutableCopy(v0, v1, v2, v3);

  objc_msgSend_addCharactersInString_(v13, v4, (uint64_t)CFSTR("\uFFFC"), v5);
  objc_msgSend_addCharactersInString_(v13, v6, (uint64_t)CFSTR("\uFFFD"), v7);
  v11 = objc_msgSend_copy(v13, v8, v9, v10);
  v12 = (void *)qword_1EE1DD788;
  qword_1EE1DD788 = v11;

}

uint64_t *sub_190687EDC()
{
  uint64_t *result;

  result = (uint64_t *)IMWeakLinkSymbol("DDScannerCopyResultsOptionsForPassiveUse", CFSTR("DataDetectorsCore"));
  qword_1EE1DD3E0 = *result;
  return result;
}

void *sub_190687F0C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultGetCategory", CFSTR("DataDetectorsCore"));
  off_1EE1DD3C0 = result;
  return result;
}

void *sub_190687F38()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultHasType", CFSTR("DataDetectorsCore"));
  off_1EE1DD3C8 = result;
  return result;
}

uint64_t sub_190687F64(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *inited;
  const char *v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  const char *v35;

  v5 = a1;
  v6 = a3;
  objc_msgSend_dataDetector(IMIDSLog, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1906B68DC();

  v11 = 0;
  if (v5 && a2)
  {
    if (qword_1EE1DD3B0 != -1)
      dispatch_once(&qword_1EE1DD3B0, &unk_1E2C441E8);
    v12 = (void *)MEMORY[0x19400E788]();
    v13 = (void *)IMWeakLinkClass(CFSTR("DDScannerResult"), CFSTR("DataDetectorsCore"));
    objc_msgSend_resultFromCoreResult_(v13, v14, a2, v15);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB36F8]);
      inited = (void *)objc_msgSend_initRequiringSecureCoding_(v16, v17, 0, v18);
      objc_msgSend_encodeObject_forKey_(inited, v20, v11, (uint64_t)CFSTR("dd-result"));
      objc_msgSend_encodeObject_forKey_(inited, v21, (uint64_t)&unk_1E2C5D0E0, (uint64_t)CFSTR("version"));
      v22 = objc_alloc(MEMORY[0x1E0C99D50]);
      objc_msgSend_encodedData(inited, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend_initWithData_(v22, v27, (uint64_t)v26, v28);

      if (!v29)
      {
        objc_msgSend_dataDetector(IMIDSLog, v30, v31, v32);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          sub_1906B685C();

        v29 = 0;
      }

      if (v29)
      {
        v34 = off_1EE1DD3A8(a2);
        objc_msgSend_addAttribute_value_range_(v5, v35, (uint64_t)v6, (uint64_t)v29, v34, v35);

        v11 = 1;
      }
      else
      {
        v11 = 0;
      }
    }
    objc_autoreleasePoolPop(v12);
  }

  return v11;
}

#error "1906881C0: call analysis failed (funcsize=17)"

uint64_t sub_1906881E4(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  char v60;

  v3 = a1;
  objc_msgSend_dataDetector(IMIDSLog, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1906B699C();

  v8 = 0;
  if (v3 && a2)
  {
    if (qword_1EE1DDA08 != -1)
      dispatch_once(&qword_1EE1DDA08, &unk_1E2C44208);
    if (qword_1EE1DDA18 != -1)
      dispatch_once(&qword_1EE1DDA18, &unk_1E2C44228);
    v9 = (void *)MEMORY[0x19400E788]();
    v10 = off_1EE1DDA00(a2);
    v12 = v11;
    v13 = (void *)off_1EE1DDA10(a2);
    v17 = v13;
    if (!v13)
    {
      v8 = 0;
LABEL_31:

      objc_autoreleasePoolPop(v9);
      goto LABEL_32;
    }
    objc_msgSend_urlFromString(v13, v14, v15, v16);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scheme(v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_isEqualToString_(v26, v27, (uint64_t)CFSTR("http"), v28) & 1) == 0
      && !objc_msgSend_isEqualToString_(v26, v29, (uint64_t)CFSTR("https"), v30))
    {
      v42 = 0;
LABEL_23:

      if (v18)
        v54 = v42;
      else
        v54 = 1;
      if ((v54 & 1) == 0)
      {
        objc_msgSend_addAttribute_value_range_(v3, v53, (uint64_t)CFSTR("__kIMLinkAttributeName"), (uint64_t)v18, v10, v12);
        objc_msgSend_dataDetector(IMIDSLog, v55, v56, v57);
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          sub_1906B693C();

      }
      v8 = v54 ^ 1u;

      goto LABEL_31;
    }
    v31 = objc_alloc((Class)IMWeakLinkClass(CFSTR("NSURL"), CFSTR("URLFormatting")));
    objc_msgSend_absoluteString(v18, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend_initWithString_(v31, v36, (uint64_t)v35, v37);

    if (v38)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v42 = objc_msgSend__lp_userVisibleStringUsesEncodedHost(v38, v39, v40, v41);
LABEL_22:

        goto LABEL_23;
      }
      if (_IMWillLog(CFSTR("IMFoundationUtil")))
        _IMAlwaysLog(0, CFSTR("IMFoundationUtil"), CFSTR("Unable to invoke NSURL (LPExtras)"), v48, v49, v50, v51, v52, v60);
    }
    else if (_IMWillLog(CFSTR("IMFoundationUtil")))
    {
      _IMAlwaysLog(0, CFSTR("IMFoundationUtil"), CFSTR("Either invalid URL:%@ OR URLForLP:%@"), v43, v44, v45, v46, v47, (char)v18);
    }
    v42 = 0;
    goto LABEL_22;
  }
LABEL_32:

  return v8;
}

uint64_t sub_1906884A4(void *a1, uint64_t a2, uint64_t a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t buf[8];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v8 = a1;
  if (qword_1EE1DDA38 != -1)
    dispatch_once(&qword_1EE1DDA38, &unk_1E2C44268);
  if (qword_1EE1DDA48 != -1)
    dispatch_once(&qword_1EE1DDA48, &unk_1E2C44288);
  if (qword_1EE1DDA58 != -1)
    dispatch_once(&qword_1EE1DDA58, &unk_1E2C442A8);
  objc_msgSend_dataDetector(IMIDSLog, v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v9, OS_LOG_TYPE_DEFAULT, "Found an one time code result", buf, 2u);
  }

  v10 = 0;
  if (v8 && a2)
  {
    v11 = (void *)MEMORY[0x19400E788]();
    off_1EE1DDA40(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    off_1EE1DDA50(a2);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    v10 = !v15;
    if (!v15)
    {
      off_1EE1DDA50(a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v16, v17, v18, v19))
      {
        v32[0] = CFSTR("code");
        v32[1] = CFSTR("displayCode");
        v33[0] = v12;
        v33[1] = v14;
        v32[2] = CFSTR("displayMoneyAmount");
        v33[2] = v16;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v33, (uint64_t)v32, 3);
      }
      else
      {
        v30[0] = CFSTR("code");
        v30[1] = CFSTR("displayCode");
        v31[0] = v12;
        v31[1] = v14;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v31, (uint64_t)v30, 2);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = off_1EE1DDA30(a2);
      off_1EE1DDA30(a2);
      objc_msgSend_addAttribute_value_range_(v8, v23, (uint64_t)CFSTR("__kIMOneTimeCodeAttributeName"), (uint64_t)v21, v22, v23);
      sub_190687F64(v8, a2, CFSTR("__kIMDataDetectedAttributeName"));
      objc_msgSend_dataDetector(IMIDSLog, v24, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        sub_1906B69FC();

    }
    objc_autoreleasePoolPop(v11);
  }

  return v10;
}

id sub_190688778(uint64_t a1)
{
  void *v2;

  if (qword_1EE1DD990 != -1)
    dispatch_once(&qword_1EE1DD990, &unk_1E2C44168);
  v2 = (void *)off_1EE1DD988(a1);
  if (v2)
    v2 = (void *)CFRetain(v2);
  return v2;
}

void *sub_1906887D4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultGetMatchedString", CFSTR("DataDetectorsCore"));
  off_1EE1DD988 = result;
  return result;
}

void sub_190688800(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  void *v28;
  void **v29;
  void *v30;
  void **v31;
  void *v32;
  void **v33;
  void *v34;
  void **v35;
  void *v36;
  void **v37;
  void *v38;
  void **v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  char v84;
  id v85;
  id v86;
  id v87;

  v87 = a1;
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v85 = a6;
  if (!v12 || !v13 || !v11 || !v14 || !v87 || !v85)
    _IMWarn(CFSTR("Trying to add event to core recents with missing arguments"), v15, v16, v17, v18, v19, v20, v21, v84);
  v22 = v11;
  v23 = v12;
  v86 = v13;
  if (!qword_1EE1DD9A8)
  {
    v27 = (void **)IMWeakLinkSymbol("CRAddressKindEmail", CFSTR("CoreRecents"));
    if (v27)
      v28 = *v27;
    else
      v28 = 0;
    objc_storeStrong((id *)&qword_1EE1DD9A8, v28);
  }
  if (!qword_1EE1DD9B0)
  {
    v29 = (void **)IMWeakLinkSymbol("CRAddressKindPhoneNumber", CFSTR("CoreRecents"));
    if (v29)
      v30 = *v29;
    else
      v30 = 0;
    objc_storeStrong((id *)&qword_1EE1DD9B0, v30);
  }
  if (!qword_1EE1DD9B8)
  {
    v31 = (void **)IMWeakLinkSymbol("CRRecentContactMetadataEventTime", CFSTR("CoreRecents"));
    if (v31)
      v32 = *v31;
    else
      v32 = 0;
    objc_storeStrong((id *)&qword_1EE1DD9B8, v32);
  }
  if (!qword_1EE1DD9C0)
  {
    v33 = (void **)IMWeakLinkSymbol("CRRecentContactMetadataReferenceURL", CFSTR("CoreRecents"));
    if (v33)
      v34 = *v33;
    else
      v34 = 0;
    objc_storeStrong((id *)&qword_1EE1DD9C0, v34);
  }
  if (!qword_1EE1DD9C8)
  {
    v35 = (void **)IMWeakLinkSymbol("CRRecentContactMetadataFromAddress", CFSTR("CoreRecents"));
    if (v35)
      v36 = *v35;
    else
      v36 = 0;
    objc_storeStrong((id *)&qword_1EE1DD9C8, v36);
  }
  if (!qword_1EE1DD9D0)
  {
    v37 = (void **)IMWeakLinkSymbol("CRRecentContactMetadataFromAddressKind", CFSTR("CoreRecents"));
    if (v37)
      v38 = *v37;
    else
      v38 = 0;
    objc_storeStrong((id *)&qword_1EE1DD9D0, v38);
  }
  if (!qword_1EE1DD9D8)
  {
    v39 = (void **)IMWeakLinkSymbol("CRRecentContactMetadataFrom", CFSTR("CoreRecents"));
    if (v39)
      v40 = *v39;
    else
      v40 = 0;
    objc_storeStrong((id *)&qword_1EE1DD9D8, v40);
  }
  v41 = objc_msgSend__appearsToBePhoneNumber(v23, v24, v25, v26);
  if (v41)
    v42 = 3;
  else
    v42 = 2;
  if (v41)
    v43 = &qword_1EE1DD9B0;
  else
    v43 = &qword_1EE1DD9A8;
  IMNormalizeFormattedString(v23, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v45, (uint64_t)CFSTR("sms:/open?message-guid=%@"), v46, v22);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99D80], v48, (uint64_t)v44, v49, qword_1EE1DD9C8, *v43, qword_1EE1DD9D0, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99D80], v51, (uint64_t)v86, v52, qword_1EE1DD9B8, v50, qword_1EE1DD9D8, v47, qword_1EE1DD9C0, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataDetector(IMIDSLog, v54, v55, v56);
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    sub_1906B6ABC();

  v58 = IMWeakLinkClass(CFSTR("CRRecentContactsLibrary"), CFSTR("CoreRecents"));
  if (v58)
  {
    v62 = (void *)v58;
    objc_msgSend_date(MEMORY[0x1E0C99D68], v59, v60, v61);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)MEMORY[0x1E0CB37E8];
    if (qword_1EE1DD9E0 != -1)
      dispatch_once(&qword_1EE1DD9E0, &unk_1E2C441C8);
    objc_msgSend_numberWithDouble_(v67, v63, v64, v65, *(double *)&qword_1EE1DD9E8);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recentEventForAddress_displayName_kind_date_weight_metadata_options_(v62, v69, (uint64_t)v87, 0, v14, v66, v68, v53, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultInstance(v62, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    IMSingleObjectArray(v70, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordContactEvents_recentsDomain_sendingAddress_completion_(v74, v79, (uint64_t)v78, (uint64_t)v85, 0, &unk_1E2C441A8);

    objc_msgSend_dataDetector(IMIDSLog, v80, v81, v82);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
      sub_1906B6A5C();

  }
}

void sub_190688CD0(uint64_t a1, void *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;

  v5 = a2;
  if (v5)
  {
    objc_msgSend_dataDetector(IMIDSLog, v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1906B6B1C();

  }
}

double sub_190688D2C()
{
  double result;

  result = *(double *)IMWeakLinkSymbol("CRRecentWeightMessagesReceivedAddress", CFSTR("CoreRecents"));
  qword_1EE1DD9E8 = *(_QWORD *)&result;
  return result;
}

void *sub_190688D5C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultGetRangeForURLification", CFSTR("DataDetectorsCore"));
  off_1EE1DD3A8 = result;
  return result;
}

void *sub_190688D88()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultGetRangeForURLification", CFSTR("DataDetectorsCore"));
  off_1EE1DDA00 = result;
  return result;
}

void *sub_190688DB4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultCopyExtractedURL", CFSTR("DataDetectorsCore"));
  off_1EE1DDA10 = result;
  return result;
}

void *sub_190688DE0()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultCurrencyExtraction", CFSTR("DataDetectorsCore"));
  off_1EE1DDA20 = result;
  return result;
}

void *sub_190688E0C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultGetRangeForURLification", CFSTR("DataDetectorsCore"));
  off_1EE1DDA30 = result;
  return result;
}

void *sub_190688E38()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultCopyAuthCode", CFSTR("DataDetectorsCore"));
  off_1EE1DDA40 = result;
  return result;
}

void *sub_190688E64()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("DDResultGetMatchedString", CFSTR("DataDetectorsCore"));
  off_1EE1DDA50 = result;
  return result;
}

void sub_190688E90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_190688EA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

_BYTE *sub_190688EB4(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_190688EE4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_190688F28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_190688F34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_190689154(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 8))
  {
    objc_msgSend_timer(IMIDSLog, a2, a3, a4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v16 = 134217984;
      v17 = v7;
      _os_log_impl(&dword_19066D000, v6, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer fired] {self: %p}", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v5 + 9))
  {
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], a2, a3, a4, (double)*(unint64_t *)(a1 + 48));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;

  }
  else
  {
    objc_msgSend_timer(IMIDSLog, a2, a3, a4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v16 = 134217984;
      v17 = v12;
      _os_log_impl(&dword_19066D000, v11, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer invalidating] {self: %p}", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14, v15);
  }
}

void sub_190689780()
{
  IMFileManager *v0;
  void *v1;

  v0 = objc_alloc_init(IMFileManager);
  v1 = (void *)qword_1EE1DD888;
  qword_1EE1DD888 = (uint64_t)v0;

}

void *sub_190689960()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("UTTypeCreatePreferredIdentifierForTag", CFSTR("MobileCoreServices"));
  off_1EE1DDA60 = result;
  return result;
}

void *sub_190689B30()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("UTTypeCopyPreferredTagWithClass", CFSTR("MobileCoreServices"));
  off_1EE1DD5F8 = result;
  return result;
}

void *sub_190689C50()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("UTTypeCreatePreferredIdentifierForTag", CFSTR("MobileCoreServices"));
  off_1EE1DD6E8 = result;
  return result;
}

void *sub_190689D24()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("UTTypeCreatePreferredIdentifierForTag", CFSTR("MobileCoreServices"));
  off_1EE1DDA70 = result;
  return result;
}

uint64_t sub_190689D50(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_objectForKey_(a1, a2, (uint64_t)CFSTR("HFSFileFlags"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_unsignedShortValue(v4, v5, v6, v7);

  return v8;
}

uint64_t sub_190689D8C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend_objectForKey_(a1, a2, (uint64_t)CFSTR("HFSResourceForkSize"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
    v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7);
  else
    v9 = 0;

  return v9;
}

CFTypeRef sub_190689DD8()
{
  CFTypeRef result;

  result = *(CFTypeRef *)IMWeakLinkSymbol("kUTTagClassMIMEType", CFSTR("MobileCoreServices"));
  qword_1EE1DDA88 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef sub_190689E14()
{
  CFTypeRef result;

  result = *(CFTypeRef *)IMWeakLinkSymbol("kUTTagClassFilenameExtension", CFSTR("MobileCoreServices"));
  qword_1EE1DD700 = (uint64_t)result;
  if (result)
    return CFRetain(result);
  return result;
}

void sub_19068A7C0()
{
  IMWeakObjectCache *v0;
  void *v1;

  v0 = objc_alloc_init(IMWeakObjectCache);
  v1 = (void *)qword_1ECD90FB0;
  qword_1ECD90FB0 = (uint64_t)v0;

}

const __CFString *MachineNameString()
{
  return CFSTR("Home");
}

CFTypeRef IMStringForSocketAddress(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  int v8;
  id v9;
  size_t v10;
  const char *v11;
  CFTypeRef v12;
  char *v13;
  id v14;
  size_t v15;
  const char *v16;
  id v17;
  char __s[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[27];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = objc_retainAutorelease(a1);
  v5 = objc_msgSend_bytes(v1, v2, v3, v4);
  v6 = v5;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v34[11] = v7;
  *(_OWORD *)v34 = v7;
  v33 = v7;
  v32 = v7;
  v31 = v7;
  v30 = v7;
  v29 = v7;
  v28 = v7;
  v27 = v7;
  v26 = v7;
  v25 = v7;
  v24 = v7;
  v23 = v7;
  v22 = v7;
  v21 = v7;
  v20 = v7;
  *(_DWORD *)__s = 0;
  if (v5)
  {
    v8 = *(unsigned __int8 *)(v5 + 1);
    if (v8 == 2)
    {
      v13 = (char *)malloc_type_calloc(1uLL, 0x11uLL, 0x842C5DDBuLL);
      if (inet_ntop(2, (const void *)(v6 + 4), v13, 0x11u))
      {
        v14 = objc_alloc(MEMORY[0x1E0CB3940]);
        v15 = strlen(v13);
        v6 = objc_msgSend_initWithBytes_length_encoding_(v14, v16, (uint64_t)v13, v15, 1);
      }
      else
      {
        v6 = 0;
      }
      free(v13);
    }
    else if (v8 == 30 && inet_ntop(30, (const void *)(v5 + 8), __s, 0x2Fu))
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      v10 = strlen(__s);
      v6 = objc_msgSend_initWithBytes_length_encoding_(v9, v11, (uint64_t)__s, v10, 1);
    }
    else
    {
      v6 = 0;
    }
  }
  v17 = (id)v6;
  v12 = CFAutorelease(v17);

  return v12;
}

uint64_t IsPersonalFirewallOn(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], a2, (uint64_t)CFSTR("/Library/Preferences/com.apple.sharing.firewall.plist"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("state"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);

  return v11;
}

uint64_t IsPersonalFirewallBlockingPort(int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  void *v52;

  objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], a2, (uint64_t)CFSTR("/Library/Preferences/com.apple.sharing.firewall.plist"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("state"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);

  if (!v12)
  {
    v50 = 0;
    goto LABEL_24;
  }
  objc_msgSend_objectForKey_(v5, v13, (uint64_t)CFSTR("allports"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_count(v15, v16, v17, v18);
  v22 = v19 - 1;
  if (v19 < 1)
  {
    v50 = 1;
    goto LABEL_23;
  }
  v52 = v5;
  v23 = v19 + 1;
  while (1)
  {
    objc_msgSend_objectAtIndex_(v15, v20, v22, v21);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_rangeOfString_(v24, v25, (uint64_t)CFSTR("-"), v26);
    if (v28)
      break;
    if ((objc_msgSend_isEqualToString_(v24, 0, (uint64_t)CFSTR("*"), v29) & 1) != 0)
    {

    }
    else
    {
      v49 = objc_msgSend_intValue(v24, v42, v43, v44);

      if (v49 == a1)
        goto LABEL_21;
    }
LABEL_17:
    --v23;
    --v22;
    if (v23 <= 1)
    {
      v50 = 1;
      goto LABEL_22;
    }
  }
  v30 = v27;
  objc_msgSend_substringToIndex_(v24, v28, v27, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringFromIndex_(v24, v32, v30 + 1, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v31, v35, v36, v37))
    v41 = objc_msgSend_intValue(v31, v38, v39, v40);
  else
    v41 = 0;
  if (objc_msgSend_length(v34, v38, v39, v40))
    v48 = objc_msgSend_intValue(v34, v45, v46, v47);
  else
    v48 = 0xFFFF;

  if (v41 > a1 || v48 < a1)
    goto LABEL_17;
LABEL_21:
  v50 = 0;
LABEL_22:
  v5 = v52;
LABEL_23:

LABEL_24:
  return v50;
}

uint64_t OpenSystemPreferencePaneAnchor()
{
  return 1;
}

uint64_t IMPCInterfaceName()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (void *)IMWeakLinkClass(CFSTR("PCInterfaceMonitor"), CFSTR("PersistentConnection"));
  objc_msgSend_sharedInstanceForIdentifier_(v0, v1, 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend_wwanInterfaceName(v3, v4, v5, v6);
  else
    v7 = 0;

  return v7;
}

BOOL IMPCDoesInterfaceExist()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  IMPCInterfaceName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v0;
  if (v0)
    v5 = objc_msgSend_length(v0, v1, v2, v3) != 0;
  else
    v5 = 0;

  return v5;
}

BOOL IMGetIDSSettings(_QWORD *a1, char *a2, _QWORD *a3, _BYTE *a4, _BYTE *a5)
{
  void *v10;
  _BOOL8 v11;

  objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], a2, (uint64_t)CFSTR("com.apple.private.ids"), (uint64_t)a4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = sub_19066FE40(a1, a2, a3, a4, a5, CFSTR("/AppleInternal/Library/Conference/Environments.plist"), v10, CFSTR("https://init.ess.apple.com/WebObjects/VCInit.woa/wa/getBag?ix=3"));

  return v11;
}

id IMGetiMessageTopic()
{
  id v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v6;

  v6 = 0;
  IMGetiMessageSettings(0, 0, &v6, 0, 0);
  v0 = v6;
  objc_msgSend_lastObject(v0, v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id IMGetSPSEnvironmentName()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t isEqualToIgnoringCase;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  char v28;
  id v29;
  char v31;

  if (_IMWillLog(CFSTR("Settings")))
    _IMAlwaysLog(0, CFSTR("Settings"), CFSTR("in IMGetSPSEnvironmentName"), v2, v3, v4, v5, v6, v31);
  v7 = (void *)qword_1EE1DDA90;
  if (!qword_1EE1DDA90)
  {
    IMGetCachedDomainValueForKey(CFSTR("com.apple.ids"), CFSTR("sps-env"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)qword_1EE1DDA90;
    qword_1EE1DDA90 = v8;

    v7 = (void *)qword_1EE1DDA90;
  }
  v10 = objc_msgSend_length(v7, v0, v1, v2);
  if (!v10)
    goto LABEL_10;
  isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_((void *)qword_1EE1DDA90, v11, (uint64_t)CFSTR("canary"), v13);
  if (!(_DWORD)isEqualToIgnoringCase)
    goto LABEL_11;
  IMGetEnvironmentName(isEqualToIgnoringCase, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_isEqualToIgnoringCase_(v18, v19, (uint64_t)CFSTR("ven1-external"), v20);
  if (!(_DWORD)v21)
  {
    IMGetEnvironmentName(v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_isEqualToIgnoringCase_(v25, v26, (uint64_t)CFSTR("ven2-external"), v27);

    if ((v28 & 1) != 0)
      goto LABEL_10;
LABEL_11:
    v29 = (id)qword_1EE1DDA90;
    return v29;
  }

LABEL_10:
  IMGetEnvironmentName(v10, v11, v12, v13);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  return v29;
}

id IMGetSPSCustomURL()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)qword_1EE1DD4D8;
  if (!qword_1EE1DD4D8)
  {
    IMGetCachedDomainValueForKey(CFSTR("com.apple.ids"), CFSTR("custom-sps-bag-url"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)qword_1EE1DD4D8;
    qword_1EE1DD4D8 = v1;

    v0 = (void *)qword_1EE1DD4D8;
  }
  return v0;
}

uint64_t IMShouldUseSystemAuthentication()
{
  return 1;
}

uint64_t IMShouldUseCustomAuthentication()
{
  return 0;
}

void IMTimingStartTimingForKey(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  id v22;
  id v23;
  const char *v24;
  void *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (IMShouldLog(v14, a2))
  {
    v17 = v13;
    v18 = v14;
    v19 = v15;
    v22 = v16;
    if (qword_1EE1DDAA0 != -1)
      dispatch_once(&qword_1EE1DDAA0, &unk_1E2C42C88);
    objc_msgSend_startTimingForKey_((void *)qword_1EE1DDA98, v20, (uint64_t)v17, v21);
    v23 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v25 = (void *)objc_msgSend_initWithFormat_arguments_(v23, v24, (uint64_t)v22, (uint64_t)&a9);
    v26 = IMTimeOfDay();
    objc_msgSend_appendFormat_(v25, v27, (uint64_t)CFSTR(" (Time Started: %f)"), v28, *(_QWORD *)&v26, &a9);
    IMLogString();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("Timing");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl(&dword_19066D000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

    }
    if (IMShouldLog(CFSTR("Messages"), 0))
      sub_19068B8CC();
    if (_IMWillLog(CFSTR("Timing")))
      _IMAlwaysLog(0, CFSTR("Timing"), CFSTR("%@"), v30, v31, v32, v33, v34, (char)v25);

  }
}

void IMTimingStopTimingForKey(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  void *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (IMShouldLog(v14, a2))
  {
    v17 = v13;
    v18 = v14;
    v19 = v15;
    v20 = v16;
    if (objc_msgSend_hasKey_((void *)qword_1EE1DDA98, v21, (uint64_t)v17, v22))
    {
      objc_msgSend_stopTimingForKey_((void *)qword_1EE1DDA98, v23, (uint64_t)v17, v24);
      objc_msgSend_totalTimeForKey_((void *)qword_1EE1DDA98, v25, (uint64_t)v17, v26);
      v28 = v27;
      v29 = objc_alloc(MEMORY[0x1E0CB37A0]);
      v31 = (void *)objc_msgSend_initWithFormat_arguments_(v29, v30, (uint64_t)v20, (uint64_t)&a9);
      v32 = IMTimeOfDay();
      objc_msgSend_appendFormat_(v31, v33, (uint64_t)CFSTR(" (Time Finished: %f   Total Time: %f)"), v34, *(_QWORD *)&v32, v28);
      v42 = 0;
      IMLogString();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory("Timing");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v31;
          _os_log_impl(&dword_19066D000, v35, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }

      }
      if (IMShouldLog(CFSTR("Messages"), 0))
      {
        v42 = v31;
        sub_19068B8CC();
      }
      if (_IMWillLog(CFSTR("Timing")))
        _IMAlwaysLog(0, CFSTR("Timing"), CFSTR("%@"), v37, v38, v39, v40, v41, (char)v31);
      objc_msgSend_removeTimingForKey_((void *)qword_1EE1DDA98, v36, (uint64_t)v17, v37, v42);

    }
  }

}

void sub_19068B8A4()
{
  IMTimingCollection *v0;
  void *v1;

  v0 = objc_alloc_init(IMTimingCollection);
  v1 = (void *)qword_1EE1DDA98;
  qword_1EE1DDA98 = (uint64_t)v0;

}

uint64_t sub_19068B8CC()
{
  uint64_t result;

  result = IMShouldLog(CFSTR("Messages"), 0);
  if ((_DWORD)result)
    return IMLogString_V();
  return result;
}

id sub_19068BE9C(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CC_LONG v9;
  const char *v10;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(v12, 170, 20);
  v1 = objc_retainAutorelease(a1);
  v5 = (const void *)objc_msgSend_bytes(v1, v2, v3, v4, *(_QWORD *)v12, *(_QWORD *)&v12[8], *(_QWORD *)&v12[16], v13);
  v9 = objc_msgSend_length(v1, v6, v7, v8);
  CC_SHA1(v5, v9, v12);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v10, (uint64_t)v12, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_19068BF34(void *a1)
{
  __int128 v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CC_LONG v10;
  const char *v11;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13 = v1;
  v14 = v1;
  v2 = objc_retainAutorelease(a1);
  v6 = (const void *)objc_msgSend_bytes(v2, v3, v4, v5, v13, v14);
  v10 = objc_msgSend_length(v2, v7, v8, v9);
  CC_SHA256(v6, v10, (unsigned __int8 *)&v13);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v11, (uint64_t)&v13, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_19068BFC8(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  __int128 v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  CC_LONG len[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CC_SHA256_CTX c;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v5;
  *(_OWORD *)&c.wbuf[10] = v5;
  *(_OWORD *)&c.hash[6] = v5;
  *(_OWORD *)&c.wbuf[2] = v5;
  *(_OWORD *)c.count = v5;
  *(_OWORD *)&c.hash[2] = v5;
  CC_SHA256_Init(&c);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = a1;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, (uint64_t)v29, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v15 = objc_msgSend_maximumLengthOfBytesUsingEncoding_(v14, v9, 4, v10);
        v16 = malloc_type_malloc(2 * v15, 0x1000040BDFB0063uLL);
        *(_QWORD *)len = 0;
        v20 = objc_msgSend_length(v14, v17, v18, v19);
        if (objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(v14, v21, (uint64_t)v16, v15, len, 4, 0, 0, v20, 0))CC_SHA256_Update(&c, v16, len[0]);
        free(v16);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v24, (uint64_t)v29, 16);
    }
    while (v11);
  }

  return CC_SHA256_Final(a3, &c);
}

id sub_19068C168(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __int128 v4;
  const char *v5;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v4;
  v7[1] = v4;
  objc_msgSend__SHA256Bytes_(a1, a2, (uint64_t)v7, a4);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v5, (uint64_t)v7, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_19068C1D4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __int128 v4;
  const char *v5;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v4;
  v7[1] = v4;
  objc_msgSend__SHA256Bytes_(a1, a2, (uint64_t)v7, a4);
  objc_msgSend___imHexStringOfBytes_withLength_(MEMORY[0x1E0C99D50], v5, (uint64_t)v7, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_19068C280()
{
  IMDeviceSupport *v0;
  void *v1;

  v0 = objc_alloc_init(IMDeviceSupport);
  v1 = (void *)qword_1ECD90FB8;
  qword_1ECD90FB8 = (uint64_t)v0;

}

void *sub_19068C51C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("IOServiceMatching", CFSTR("IOKit"));
  off_1ECD90BE8 = result;
  return result;
}

void *sub_19068C548()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("IOServiceGetMatchingService", CFSTR("IOKit"));
  off_1ECD90BF8 = result;
  return result;
}

void *sub_19068C574()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("IORegistryEntryCreateCFProperty", CFSTR("IOKit"));
  off_1ECD90C08 = result;
  return result;
}

void *sub_19068C5A0()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("IOObjectRelease", CFSTR("IOKit"));
  off_1ECD90C18 = result;
  return result;
}

void sub_19068C638(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2] || !v2[4] || !v2[3])
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D80]);
    v21 = (id)objc_msgSend_initWithContentsOfFile_(v3, v4, (uint64_t)CFSTR("/System/Library/CoreServices/SystemVersion.plist"), v5);
    objc_msgSend_objectForKey_(v21, v6, (uint64_t)CFSTR("ProductBuildVersion"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

    objc_msgSend_objectForKey_(v21, v11, (uint64_t)CFSTR("ProductVersion"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 24);
    *(_QWORD *)(v14 + 24) = v13;

    objc_msgSend_objectForKey_(v21, v16, (uint64_t)CFSTR("ProductName"), v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 16);
    *(_QWORD *)(v19 + 16) = v18;

  }
}

int *sub_19068CAF4()
{
  int *result;

  result = (int *)IMWeakLinkSymbol("kIOMasterPortDefault", CFSTR("IOKit"));
  dword_1ECD90AC0 = *result;
  return result;
}

BOOL sub_19068CB24(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;

  objc_msgSend_methodSignature(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_methodReturnLength(v4, v5, v6, v7) != 0;

  return v8;
}

void sub_19068D2EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19068D4D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19068D62C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19068D73C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19068D810(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19068D8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t IMGetKeychainPassword(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  NSObject *v21;
  id v23;
  OSStatus v24;
  uint8_t buf[4];
  OSStatus v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v9 = a3;
  if (a1 && objc_msgSend_length(v5, v6, v7, v8) && objc_msgSend_length(v9, v10, v11, v12))
  {
    v24 = 0;
    v23 = 0;
    v13 = IMGetKeychainData(&v23, v5, v9, 0, &v24);
    v14 = v23;
    v18 = v14;
    if ((_DWORD)v13)
    {
      if (objc_msgSend_length(v14, v15, v16, v17))
      {
        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        *a1 = (id)objc_msgSend_initWithData_encoding_(v19, v20, (uint64_t)v18, 4);
      }
    }
    else
    {
      objc_msgSend_keychain(IMRGLog, v15, v16, v17);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v26 = v24;
        _os_log_impl(&dword_19066D000, v21, OS_LOG_TYPE_DEFAULT, "IMGetKeychainPassword: Could not get password (error %d)", buf, 8u);
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t IMGetKeychainData(_QWORD *a1, void *a2, void *a3, void *a4, OSStatus *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  NSObject *v25;
  const __CFAllocator *v26;
  id v27;
  id v28;
  __CFDictionary *Mutable;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  OSStatus v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFTypeRef result;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = v9;
  v13 = v10;
  v17 = v11;
  if (a5)
    *a5 = 0;
  if (!objc_msgSend_length(v12, v14, v15, v16))
  {
    objc_msgSend_warning(IMRGLog, v18, v19, v20);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_1906B6B7C((uint64_t)v13, v25, v37, v38, v39, v40, v41, v42);
    goto LABEL_25;
  }
  if (!objc_msgSend_length(v13, v18, v19, v20))
  {
    objc_msgSend_warning(IMRGLog, v21, v22, v23);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_1906B6BE4((uint64_t)v12, v25, v43, v44, v45, v46, v47, v48);
LABEL_25:
    v36 = 0;
    goto LABEL_26;
  }
  v24 = (const void *)*MEMORY[0x1E0CD6B88];
  v25 = v17;
  v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v27 = v13;
  v28 = v12;
  Mutable = CFDictionaryCreateMutable(v26, 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], v24);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v28);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v27);
  if (objc_msgSend_length(v25, v30, v31, v32))
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], v25);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  result = 0;
  v33 = SecItemCopyMatching(Mutable, &result);
  v34 = (void *)result;
  if (Mutable)
    CFRelease(Mutable);
  if (a5)
    *a5 = v33;
  if (v33)
    v35 = 1;
  else
    v35 = v34 == 0;
  v36 = !v35;
  if (a1 && (_DWORD)v36)
    *a1 = objc_retainAutorelease(v34);

LABEL_26:
  return v36;
}

BOOL IMSetKeychainPassword(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  NSObject *v24;
  OSStatus v26;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (objc_msgSend_length(v5, v8, v9, v10)
    && objc_msgSend_length(v6, v11, v12, v13)
    && objc_msgSend_length(v7, v14, v15, v16))
  {
    objc_msgSend_dataUsingEncoding_(v5, v17, 4, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v23 = sub_19068F064(v19, v6, v7, CFSTR("apple"), &v26, 1, 1, 2);
    if (!v23)
    {
      objc_msgSend_warning(IMRGLog, v20, v21, v22);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        sub_1906B6C4C();

    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

BOOL IMRemoveKeychainPassword(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  NSObject *v17;
  OSStatus v19;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v4;
  if (objc_msgSend_length(v5, v7, v8, v9) && objc_msgSend_length(v6, v10, v11, v12))
  {
    v19 = 0;
    v16 = sub_19068F710(v5, v6, (const void *)*MEMORY[0x1E0CD6B88], &v19);
    if (!v16)
    {
      objc_msgSend_warning(IMRGLog, v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        sub_1906B6CAC();

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t IMGetKeychainAuthToken(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((sub_19068E164(a1, v5, v6) & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend_hasMobileMeSuffix(v6, v7, v8, v9))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    ValidMobileMeDomains();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v13)
    {
      v17 = v13;
      v18 = *(_QWORD *)v27;
      while (2)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v11);
          v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19);
          objc_msgSend_stripMobileMSuffixIfPresent(v6, v14, v15, v16);
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingFormat_((void *)v21, v22, (uint64_t)CFSTR("@%@"), v23, v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v21) = sub_19068E164(a1, v5, v24);
          if ((v21 & 1) != 0)
          {
            v10 = 1;
            goto LABEL_15;
          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v26, (uint64_t)v30, 16);
        if (v17)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_15:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t sub_19068E164(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  const char *v31;
  NSObject *v32;
  id v34;
  OSStatus v35;
  uint8_t buf[4];
  OSStatus v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v9 = a3;
  if (a1 && objc_msgSend_length(v5, v6, v7, v8) && objc_msgSend_length(v9, v10, v11, v12))
  {
    objc_msgSend_lowercaseString(v9, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v16, v17, (uint64_t)CFSTR("e:"), v18))
    {
      objc_msgSend_substringFromIndex_(v16, v19, 2, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v21;
    }

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v22, (uint64_t)CFSTR("%@-AuthToken"), v23, v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    v34 = 0;
    v24 = IMGetKeychainData(&v34, v5, v9, CFSTR("apple"), &v35);
    v25 = v34;
    v29 = v25;
    if ((_DWORD)v24)
    {
      if (objc_msgSend_length(v25, v26, v27, v28))
      {
        v30 = objc_alloc(MEMORY[0x1E0CB3940]);
        *a1 = (id)objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v29, 4);
      }
    }
    else
    {
      objc_msgSend_keychain(IMRGLog, v26, v27, v28);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v37 = v35;
        _os_log_impl(&dword_19066D000, v32, OS_LOG_TYPE_DEFAULT, "IMGetKeychainAuthToken: Could not get auth token (error: %d)", buf, 8u);
      }

    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

BOOL IMSetKeychainAuthToken(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  _BOOL8 v64;
  NSObject *v65;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  OSStatus v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (objc_msgSend_length(v6, v8, v9, v10) && objc_msgSend_length(v7, v11, v12, v13))
  {
    if (objc_msgSend_hasMobileMeSuffix(v7, v14, v15, v16))
    {
      v67 = v5;
      objc_msgSend_mobileMeDomain(v7, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      ValidMobileMeDomains();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v68, (uint64_t)v73, 16);
      if (v23)
      {
        v26 = v23;
        v27 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v69 != v27)
              objc_enumerationMutation(v21);
            v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            if ((objc_msgSend_hasSuffix_(v29, v24, (uint64_t)v20, v25) & 1) == 0)
            {
              objc_msgSend_stripMobileMSuffixIfPresent(v7, v24, v30, v25);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringByAppendingFormat_(v31, v32, (uint64_t)CFSTR("@%@"), v33, v29);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              sub_19068E61C(v6, v34);
            }
          }
          v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v68, (uint64_t)v73, 16);
        }
        while (v26);
      }

      v5 = v67;
    }
    v35 = v5;
    v36 = v6;
    v37 = v7;
    if (objc_msgSend_length(v35, v38, v39, v40)
      && objc_msgSend_length(v36, v41, v42, v43)
      && objc_msgSend_length(v37, v44, v45, v46))
    {
      objc_msgSend_lowercaseString(v37, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_hasPrefix_(v50, v51, (uint64_t)CFSTR("e:"), v52))
      {
        objc_msgSend_substringFromIndex_(v50, v53, 2, v54);
        v55 = objc_claimAutoreleasedReturnValue();

        v50 = (void *)v55;
      }

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v56, (uint64_t)CFSTR("%@-AuthToken"), v57, v50);
      v37 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_dataUsingEncoding_(v35, v58, 4, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      v64 = sub_19068F064(v60, v36, v37, CFSTR("apple"), &v72, 0, 1, 2);
      if (!v64)
      {
        objc_msgSend_warning(IMRGLog, v61, v62, v63);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          sub_1906B6D0C();

      }
    }
    else
    {
      v64 = 0;
    }

  }
  else
  {
    v64 = 0;
  }

  return v64;
}

BOOL sub_19068E61C(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  NSObject *v26;
  OSStatus v28;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend_length(v3, v5, v6, v7) && objc_msgSend_length(v4, v8, v9, v10))
  {
    objc_msgSend_lowercaseString(v4, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v14, v15, (uint64_t)CFSTR("e:"), v16))
    {
      objc_msgSend_substringFromIndex_(v14, v17, 2, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v19;
    }

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("%@-AuthToken"), v21, v14);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v25 = sub_19068F710(v3, v4, (const void *)*MEMORY[0x1E0CD6B88], &v28);
    if (!v25)
    {
      objc_msgSend_warning(IMRGLog, v22, v23, v24);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        sub_1906B6D6C();

    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

BOOL IMRemoveKeychainAuthToken(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  _BOOL8 v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend_length(v3, v5, v6, v7) && objc_msgSend_length(v4, v8, v9, v10))
  {
    if (objc_msgSend_hasMobileMeSuffix(v4, v11, v12, v13))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      ValidMobileMeDomains();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v16)
      {
        v20 = v16;
        v21 = *(_QWORD *)v31;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v14);
            v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v22);
            objc_msgSend_stripMobileMSuffixIfPresent(v4, v17, v18, v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByAppendingFormat_(v24, v25, (uint64_t)CFSTR("@%@"), v26, v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            sub_19068E61C(v3, v27);
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v34, 16);
        }
        while (v20);
      }

    }
    v28 = sub_19068E61C(v3, v4);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void IMSetKeychainDataWithProtectionWithCompletion(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const void **v25;
  const void **v26;
  __CFDictionary *Mutable;
  const void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  OSStatus v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  __CFString *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  __CFString *v59;
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, uint64_t, uint64_t);
  void *v65;
  id v66;
  uint64_t *v67;
  CFTypeRef result;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  int v72;
  _QWORD block[4];
  id v74;
  uint8_t buf[4];
  CFTypeRef v76;
  __int16 v77;
  int v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (objc_msgSend_length(v12, v16, v17, v18)
    && objc_msgSend_length(v13, v19, v20, v21)
    && objc_msgSend_length(v11, v22, v23, v24))
  {
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 0;
    v25 = (const void **)MEMORY[0x1E0CD68B0];
    if (a5)
      v25 = (const void **)MEMORY[0x1E0CD68C8];
    if (a5 == 1)
      v26 = (const void **)MEMORY[0x1E0CD68F0];
    else
      v26 = v25;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    v28 = (const void *)*MEMORY[0x1E0CD6B80];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0CD6B88]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], *v26);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v12);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v13);
    if (objc_msgSend_length(v14, v29, v30, v31))
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], v14);
    v32 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7010], (const void *)*MEMORY[0x1E0C9AE50]);
    result = 0;
    v33 = SecItemCopyMatching(Mutable, &result);
    *((_DWORD *)v70 + 6) = v33;
    objc_msgSend_keychain(IMRGLog, v34, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = *((_DWORD *)v70 + 6);
      *(_DWORD *)buf = 134218240;
      v76 = result;
      v77 = 1024;
      v78 = v38;
      _os_log_impl(&dword_19066D000, v37, OS_LOG_TYPE_DEFAULT, "Found existing item %p error: %d", buf, 0x12u);
    }

    objc_msgSend_keychain(IMRGLog, v39, v40, v41);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v42, OS_LOG_TYPE_DEFAULT, "Trying to add query as item", buf, 2u);
    }

    CFDictionarySetValue(Mutable, v28, v32);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v11);
    v43 = MEMORY[0x1E0C809B0];
    v62 = MEMORY[0x1E0C809B0];
    v63 = 3221225472;
    v64 = sub_19068EE68;
    v65 = &unk_1E2C445F0;
    v67 = &v69;
    v44 = v15;
    v66 = v44;
    *((_DWORD *)v70 + 6) = _SecItemAddAndNotifyOnSync();
    objc_msgSend_keychain(IMRGLog, v45, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = *((_DWORD *)v70 + 6);
      *(_DWORD *)buf = 67109120;
      LODWORD(v76) = v49;
      _os_log_impl(&dword_19066D000, v48, OS_LOG_TYPE_DEFAULT, "   _SecItemAddAndNotifyOnSync result: %d", buf, 8u);
    }

    if (objc_msgSend_length(v14, v50, v51, v52))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v53, (uint64_t)CFSTR("   accessGroup: %@"), v54, v14);
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = &stru_1E2C46CC8;
    }
    if (*((_DWORD *)v70 + 6))
    {
      v56[0] = v43;
      v56[1] = 3221225472;
      v56[2] = sub_19068EFD0;
      v56[3] = &unk_1E2C44618;
      v61 = &v69;
      v57 = v12;
      v58 = v13;
      v59 = v55;
      v60 = v44;
      dispatch_async(MEMORY[0x1E0C80D38], v56);

    }
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
    if (Mutable)
      CFRelease(Mutable);

    _Block_object_dispose(&v69, 8);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19068EE24;
    block[3] = &unk_1E2C43CA0;
    v74 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void sub_19068EDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_19068EE24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t IMGetSecAttrDataProtectionClassFromKeychainDataProtectionClass(int a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = MEMORY[0x1E0CD68F0];
  v2 = MEMORY[0x1E0CD68B0];
  if (a1)
    v2 = MEMORY[0x1E0CD68C8];
  if (a1 != 1)
    v1 = v2;
  return *(_QWORD *)v1;
}

void sub_19068EE68(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v5;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  NSObject *v10;
  _QWORD block[4];
  NSObject *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v5 = (int)a2;
  v21 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend_warning(IMRGLog, a2, a3, a4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = CFSTR("NO");
      v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v5)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 67109634;
      v16 = v9;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = a3;
      _os_log_fault_impl(&dword_19066D000, v7, OS_LOG_TYPE_FAULT, "IMSetKeychainData: %d -- Got callback from _SecItemAddAndNotifyOnSync despite original call failing. didSync: %@ CallbackError: %@", buf, 0x1Cu);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19068EFBC;
    block[3] = &unk_1E2C445C8;
    v10 = *(id *)(a1 + 32);
    v14 = v5;
    v12 = v10;
    v13 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7 = v12;
  }

}

uint64_t sub_19068EFBC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t sub_19068EFD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;

  objc_msgSend_warning(IMRGLog, a2, a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    sub_1906B6DCC();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

BOOL IMSetKeychainData(void *a1, void *a2, void *a3, void *a4, int a5, OSStatus *a6)
{
  return sub_19068F064(a1, a2, a3, a4, a6, a5, 1, 2);
}

BOOL IMSetKeychainDataWithProtection(void *a1, void *a2, void *a3, void *a4, int a5, char a6, int a7, OSStatus *a8)
{
  return sub_19068F064(a1, a2, a3, a4, a8, a5, a6, a7);
}

BOOL sub_19068F064(void *a1, void *a2, void *a3, void *a4, OSStatus *a5, int a6, char a7, int a8)
{
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  void **v29;
  __CFDictionary *Mutable;
  const void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  const void *v36;
  OSStatus v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const void *v45;
  __CFDictionary *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  OSStatus v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  NSObject *v63;
  const void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  __CFString *v72;
  NSObject *v73;
  const void *v75;
  const __CFAllocator *allocator;
  const void *v77;
  void *key;
  void *value;
  char v80;
  const void *v81;
  CFTypeRef result;
  uint8_t buf[4];
  _BYTE v84[24];
  __int16 v85;
  __CFString *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v16 = a2;
  v17 = a3;
  v21 = a4;
  if (a5)
    *a5 = 0;
  if (objc_msgSend_length(v16, v18, v19, v20)
    && objc_msgSend_length(v17, v22, v23, v24)
    && objc_msgSend_length(v15, v25, v26, v27))
  {
    v80 = a7;
    v81 = v15;
    v28 = (void **)MEMORY[0x1E0CD68B0];
    if (a8)
      v28 = (void **)MEMORY[0x1E0CD68C8];
    if (a8 == 1)
      v29 = (void **)MEMORY[0x1E0CD68F0];
    else
      v29 = v28;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    v77 = (const void *)*MEMORY[0x1E0CD6B88];
    v75 = (const void *)*MEMORY[0x1E0C9AE40];
    if (a6)
      v31 = (const void *)*MEMORY[0x1E0CD6B88];
    else
      v31 = (const void *)*MEMORY[0x1E0C9AE40];
    key = (void *)*MEMORY[0x1E0CD6B80];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], v31);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v16);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v17);
    if (objc_msgSend_length(v21, v32, v33, v34))
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], v21);
    value = *v29;
    v35 = (const void *)*MEMORY[0x1E0CD7010];
    v36 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7010], (const void *)*MEMORY[0x1E0C9AE50]);
    result = 0;
    v37 = SecItemCopyMatching(Mutable, &result);
    objc_msgSend_keychain(IMRGLog, v38, v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v84 = result;
      *(_WORD *)&v84[8] = 1024;
      *(_DWORD *)&v84[10] = v37;
      _os_log_impl(&dword_19066D000, v41, OS_LOG_TYPE_DEFAULT, "Found item %p  error: %d", buf, 0x12u);
    }

    if (result)
    {
      CFDictionaryRemoveValue(Mutable, v35);
      v45 = (const void *)*MEMORY[0x1E0CD6898];
      CFDictionaryRemoveValue(Mutable, (const void *)*MEMORY[0x1E0CD6898]);
      v46 = CFDictionaryCreateMutable(allocator, 0, 0, 0);
      if (objc_msgSend_length(v21, v47, v48, v49))
        CFDictionaryAddValue(v46, v45, v21);
      CFDictionaryAddValue(Mutable, key, v77);
      if ((v80 & 1) == 0)
        CFDictionaryAddValue(v46, (const void *)*MEMORY[0x1E0CD6B90], &unk_1E2C5D110);
      CFDictionaryAddValue(v46, (const void *)*MEMORY[0x1E0CD68A0], value);
      objc_msgSend_keychain(IMRGLog, v50, v51, v52);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v84 = Mutable;
        *(_WORD *)&v84[8] = 2112;
        *(_QWORD *)&v84[10] = v46;
        _os_log_impl(&dword_19066D000, v53, OS_LOG_TYPE_DEFAULT, "Trying to update item with query: %@   update: %@", buf, 0x16u);
      }

      CFDictionaryAddValue(v46, (const void *)*MEMORY[0x1E0CD70D8], v81);
      v54 = SecItemUpdate(Mutable, v46);
      objc_msgSend_keychain(IMRGLog, v55, v56, v57);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v84 = v54;
        _os_log_impl(&dword_19066D000, v58, OS_LOG_TYPE_DEFAULT, "   Result: %d", buf, 8u);
      }

      if (v46)
        CFRelease(v46);
    }
    else
    {
      objc_msgSend_keychain(IMRGLog, v42, v43, v44);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v63, OS_LOG_TYPE_DEFAULT, "Trying to add query as item", buf, 2u);
      }

      if (a6)
        v64 = v36;
      else
        v64 = v75;
      CFDictionarySetValue(Mutable, key, v64);
      if ((v80 & 1) == 0)
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B90], &unk_1E2C5D110);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v81);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], value);
      v54 = SecItemAdd(Mutable, 0);
      objc_msgSend_keychain(IMRGLog, v65, v66, v67);
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v84 = v54;
        _os_log_impl(&dword_19066D000, v68, OS_LOG_TYPE_DEFAULT, "   Result: %d", buf, 8u);
      }

    }
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
    if (objc_msgSend_length(v21, v59, v60, v61))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v69, (uint64_t)CFSTR("   accessGroup: %@"), v71, v21);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = &stru_1E2C46CC8;
    }
    v62 = v54 == 0;
    if (v54)
    {
      objc_msgSend_warning(IMRGLog, v69, v70, v71);
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v84 = v54;
        *(_WORD *)&v84[4] = 2112;
        *(_QWORD *)&v84[6] = v16;
        *(_WORD *)&v84[14] = 2112;
        *(_QWORD *)&v84[16] = v17;
        v85 = 2112;
        v86 = v72;
        _os_log_fault_impl(&dword_19066D000, v73, OS_LOG_TYPE_FAULT, "IMSetKeychainData: %d -- Could not store data for service: %@   account: %@%@", buf, 0x26u);
      }
    }
    else
    {
      objc_msgSend_keychain(IMRGLog, v69, v70, v71);
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v84 = v16;
        *(_WORD *)&v84[8] = 2112;
        *(_QWORD *)&v84[10] = v17;
        _os_log_impl(&dword_19066D000, v73, OS_LOG_TYPE_DEFAULT, "Stored password data for service: %@   account: %@", buf, 0x16u);
      }
    }

    if (Mutable)
      CFRelease(Mutable);
    if (a5)
      *a5 = v54;

    v15 = (id)v81;
  }
  else
  {
    v62 = 0;
  }

  return v62;
}

BOOL IMRemoveKeychainData(void *a1, void *a2, OSStatus *a3)
{
  return sub_19068F710(a1, a2, (const void *)*MEMORY[0x1E0CD6B88], a3);
}

BOOL sub_19068F710(void *a1, void *a2, const void *a3, OSStatus *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  __CFDictionary *Mutable;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  OSStatus v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  OSStatus v26;
  _BOOL8 v27;
  NSObject *v28;
  int v30;
  _BYTE v31[14];
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v11 = a2;
  if (a4)
    *a4 = 0;
  if (objc_msgSend_length(v7, v8, v9, v10) && objc_msgSend_length(v11, v12, v13, v14))
  {
    v15 = v7;
    v16 = v11;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v15);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v16);
    objc_msgSend_keychain(IMRGLog, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      *(_QWORD *)v31 = Mutable;
      _os_log_impl(&dword_19066D000, v21, OS_LOG_TYPE_DEFAULT, "IMRemoveKeychainData: Removing item matching: %@", (uint8_t *)&v30, 0xCu);
    }

    v22 = SecItemDelete(Mutable);
    if (v22 == -25300)
      v26 = 0;
    else
      v26 = v22;
    v27 = v26 == 0;
    if (v26)
    {
      objc_msgSend_warning(IMRGLog, v23, v24, v25);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        v30 = 67109634;
        *(_DWORD *)v31 = v26;
        *(_WORD *)&v31[4] = 2112;
        *(_QWORD *)&v31[6] = v15;
        v32 = 2112;
        v33 = v16;
        _os_log_fault_impl(&dword_19066D000, v28, OS_LOG_TYPE_FAULT, "IMRemoveKeychainData: %d -- Could not remove data for service: %@   account: %@", (uint8_t *)&v30, 0x1Cu);
      }

    }
    if (Mutable)
      CFRelease(Mutable);
    if (a4)
      *a4 = v26;

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t IMGetTemporaryKeychainPassword(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  sub_19068F9D4(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = IMGetKeychainPassword(a1, v6, v10);
  return v11;
}

id sub_19068F9D4(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("%@_temporary"), v6, v1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v1;
  }
  v8 = v7;

  return v8;
}

BOOL IMSetTemporaryKeychainPassword(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL8 v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  OSStatus v31;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (objc_msgSend_length(v5, v8, v9, v10)
    && objc_msgSend_length(v6, v11, v12, v13)
    && objc_msgSend_length(v7, v14, v15, v16))
  {
    sub_19068F9D4(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dataUsingEncoding_(v5, v18, 4, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend_lowercaseString(v7, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = sub_19068F064(v20, v17, v24, CFSTR("apple"), &v31, 0, 1, 2);

    if (!v25)
    {
      objc_msgSend_warning(IMRGLog, v26, v27, v28);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        sub_1906B6E6C();

    }
    v6 = v17;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

BOOL IMRemoveTemporaryKeychainPassword(void *a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  sub_19068F9D4(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = IMRemoveKeychainPassword(v4, v3);

  return v5;
}

uint64_t IMIterateOverItemsOfService(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(id, void *);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFDictionary *Mutable;
  OSStatus v20;
  CFTypeRef v21;
  BOOL v22;
  uint64_t v23;
  CFIndex v24;
  void *v25;
  char v27;
  CFTypeRef result;

  v3 = a1;
  v11 = a2;
  if (!v11)
  {
    _IMWarn(CFSTR("Empty iterator for service iteration: %@"), (uint64_t)v4, v5, v6, v7, v8, v9, v10, (char)v3);
LABEL_20:
    v23 = 0;
    goto LABEL_21;
  }
  if (!objc_msgSend_length(v3, v4, v5, v6))
  {
    _IMWarn(CFSTR("Empty service query"), v12, v13, v14, v15, v16, v17, v18, v27);
    goto LABEL_20;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0CD6B88]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v3);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6F30], (const void *)*MEMORY[0x1E0CD6F38]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7010], (const void *)*MEMORY[0x1E0C9AE50]);
  result = 0;
  v20 = SecItemCopyMatching(Mutable, &result);
  if (Mutable)
    CFRelease(Mutable);
  v21 = result;
  if (v20)
    v22 = 1;
  else
    v22 = result == 0;
  v23 = !v22;
  if (!v22)
  {
    if (CFArrayGetCount((CFArrayRef)result) >= 1)
    {
      v24 = 0;
      do
      {
        CFArrayGetValueAtIndex((CFArrayRef)result, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v25);

        ++v24;
      }
      while (v24 < CFArrayGetCount((CFArrayRef)result));
    }
    v21 = result;
  }
  if (v21)
    CFRelease(v21);
LABEL_21:

  return v23;
}

uint64_t IMDeleteItemsForService(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_19068FDFC;
  v5[3] = &unk_1E2C43A70;
  v6 = v1;
  v2 = v1;
  v3 = IMIterateOverItemsOfService(v2, v5);

  return v3;
}

void sub_19068FDFC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend_objectForKey_(a2, (const char *)a2, *MEMORY[0x1E0CD68F8], a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  sub_19068F710(v4, v5, (const void *)*MEMORY[0x1E0CD6B88], 0);

}

uint64_t IMGetKeychainDataProtectionClassFromSecAttrDataProtectionClass(CFStringRef theString2)
{
  if (CFStringCompare((CFStringRef)*MEMORY[0x1E0CD68F0], theString2, 0))
    return 2 * (CFStringCompare((CFStringRef)*MEMORY[0x1E0CD68B0], theString2, 0) != kCFCompareEqualTo);
  else
    return 1;
}

void sub_19068FEC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void sub_19068FEE8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1906901D4(uint64_t a1, char a2, void *a3)
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void *)MEMORY[0x19400E788]();
  v6 = a3;
  if (_IMWillLog(CFSTR("Network")))
    _IMAlwaysLog(0, CFSTR("Network"), CFSTR("Change to %@, posting notification in %f seconds"), v9, v10, v11, v12, v13, a2);
  objc_msgSend__clearIPCache(v6, v7, v8, v9);

  objc_autoreleasePoolPop(v5);
}

void sub_190690794(const __SCDynamicStore *a1, char *a2, CFTypeRef *a3)
{
  CFTypeRef *v3;
  const __CFAllocator *v5;
  const CFArrayCallBacks *v6;
  __CFArray *Mutable;
  const __CFString *v8;
  __CFString *NetworkGlobalEntity;
  __CFString *v10;
  __CFArray *v11;
  CFStringRef NetworkServiceEntity;
  const __CFDictionary *v13;
  __CFString *Value;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CFTypeID v35;
  const void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  CFTypeID v58;
  char v59;
  char *v60;
  CFStringRef v61;
  CFTypeRef *v62;
  const void *v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  CFTypeRef *v70;
  const __CFString *entity;

  v3 = a3;
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v8 = (const __CFString *)*MEMORY[0x1E0CE8B30];
  NetworkGlobalEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(v5, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
  CFArrayAppendValue(Mutable, NetworkGlobalEntity);
  v10 = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(v5, v8, (CFStringRef)*MEMORY[0x1E0CE8B80]);
  CFArrayAppendValue(Mutable, v10);
  v11 = CFArrayCreateMutable(v5, 0, v6);
  entity = (const __CFString *)*MEMORY[0x1E0CE8B60];
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v5, v8, (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B60]);
  CFArrayAppendValue(v11, NetworkServiceEntity);
  CFRelease(NetworkServiceEntity);
  v13 = SCDynamicStoreCopyMultiple(a1, Mutable, v11);
  CFRelease(Mutable);
  CFRelease(v11);
  Value = (__CFString *)CFDictionaryGetValue(v13, NetworkGlobalEntity);
  if (_IMWillLog(CFSTR("Network")))
  {
    objc_msgSend_description(NetworkGlobalEntity, v15, v16, v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend_UTF8String(v18, v19, v20, v21);
    objc_msgSend_description(Value, v23, v24, v25);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_UTF8String(v26, v27, v28, v29);
    _IMAlwaysLog(0, CFSTR("Network"), CFSTR("UpdateNetworkLinkQuality - IPv4 netKey: %s, netValue: %s"), v30, v31, v32, v33, v34, v22);

  }
  if (!Value)
    goto LABEL_11;
  v35 = CFGetTypeID(Value);
  if (v35 != CFDictionaryGetTypeID())
  {
    Value = 0;
LABEL_11:
    v36 = 0;
    goto LABEL_12;
  }
  v36 = CFDictionaryGetValue((CFDictionaryRef)Value, (const void *)*MEMORY[0x1E0CE8B40]);
  Value = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, (const void *)*MEMORY[0x1E0CE8B48]);
LABEL_12:
  CFRelease(NetworkGlobalEntity);
  if (!v36 || !Value)
  {
    v37 = (void *)CFDictionaryGetValue(v13, v10);
    if (_IMWillLog(CFSTR("Network")))
    {
      objc_msgSend_description(v10, v38, v39, v40);
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v45 = objc_msgSend_UTF8String(v41, v42, v43, v44);
      objc_msgSend_description(v37, v46, v47, v48);
      v70 = v3;
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend_UTF8String(v49, v50, v51, v52);
      _IMAlwaysLog(0, CFSTR("Network"), CFSTR("UpdateNetworkLinkQuality - IPv6 netKey: %s, netValue: %s"), v53, v54, v55, v56, v57, v45);

      v3 = v70;
    }
    if (v37)
    {
      v58 = CFGetTypeID(v37);
      if (v58 == CFDictionaryGetTypeID())
      {
        v36 = CFDictionaryGetValue((CFDictionaryRef)v37, (const void *)*MEMORY[0x1E0CE8B40]);
        Value = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v37, (const void *)*MEMORY[0x1E0CE8B48]);
      }
    }
  }
  CFRelease(v10);
  v59 = 0;
  if (!v36)
  {
    v60 = a2;
    if (!a2)
      goto LABEL_26;
    goto LABEL_25;
  }
  v60 = a2;
  if (Value)
  {
    v61 = SCDynamicStoreKeyCreateNetworkServiceEntity(v5, v8, Value, entity);
    v62 = v3;
    v63 = CFDictionaryGetValue(v13, v61);
    CFRelease(v61);
    v64 = v63 == 0;
    v3 = v62;
    v59 = !v64;
  }
  if (a2)
LABEL_25:
    *v60 = v59;
LABEL_26:
  if (v3 && v36)
    *v3 = CFRetain(v36);
  if (_IMWillLog(CFSTR("Network")))
    _IMAlwaysLog(0, CFSTR("Network"), CFSTR("UpdateNetworkLinkQuality - primaryLinkIsCellular = %d"), v65, v66, v67, v68, v69, v59);
  if (v13)
    CFRelease(v13);
}

const __CFString *MobileMeBrandName(int a1)
{
  if (a1 == 1)
    return CFSTR("me.com");
  else
    return CFSTR("Mac.com");
}

id MobileMeSuffix(uint64_t a1, char a2)
{
  unsigned int v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v2 = a1;
  if ((a2 & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    MobileMeSuffix(a1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("@%@"), v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ValidMobileMeDomains();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_count(v4, v8, v9, v10);
    ValidMobileMeDomains();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    if (v11 <= v2)
      objc_msgSend_objectAtIndex_(v12, v13, 0, v14);
    else
      objc_msgSend_objectAtIndex_(v12, v13, v2, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id sub_190690F54(void *a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  char hasSuffix;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  ValidMobileMeDomains();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("@%@"), v6, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        hasSuffix = objc_msgSend_hasSuffix_(a1, v12, (uint64_t)v11, v13);

        if ((hasSuffix & 1) != 0)
        {
          v15 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

BOOL sub_19069109C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  _BOOL8 v5;

  objc_msgSend_mobileMeDomain(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

id sub_1906910CC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;
  void *v16;

  objc_msgSend_mobileMeDomain(a1, a2, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend_length(a1, v5, v6, v7);
    v13 = objc_msgSend_length(v8, v10, v11, v12);
    objc_msgSend_substringWithRange_(a1, v14, 0, v9 + ~v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = a1;
  }
  v16 = v15;

  return v16;
}

void sub_19069121C()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_1EE1DDAA8;
  qword_1EE1DDAA8 = (uint64_t)v0;

}

uint64_t IMSetAssertionFailureHandler(uint64_t result)
{
  qword_1EE1DDAB8 = result;
  return result;
}

uint64_t IMGetAssertionFailureHandler()
{
  return qword_1EE1DDAB8;
}

void sub_190691774(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1906917DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_190691B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](a2, sel__postScreenLocked, a3, a4);
}

uint64_t sub_190691B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](a2, sel__postScreenSaverStarted, a3, a4);
}

void sub_190691BE8()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
  if (dword_1EE1DD798)
  {
    IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_1EE1DD7A0, 0);
    IODeregisterForSystemPower(dword_1EE1DD7A8);
    IOServiceClose(dword_1EE1DD798);
    IONotificationPortDestroy((IONotificationPortRef)qword_1EE1DD7A0);
    dword_1EE1DD798 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
}

void sub_190691E60(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v4;
  uint64_t v5;
  id v6;

  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWatchesSystemLockState_(v6, v4, 1, v5);

}

void sub_190692178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  IONotificationPort *v7;
  NSObject *v8;
  char v9;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
  if (!dword_1EE1DD798)
  {
    dword_1EE1DD798 = IORegisterForSystemPower(0, (IONotificationPortRef *)&qword_1EE1DD7A0, (IOServiceInterestCallback)sub_190693C68, dword_1EE1DD7A8);
    if (dword_1EE1DD798)
    {
      v7 = (IONotificationPort *)qword_1EE1DD7A0;
      im_primary_queue();
      v8 = objc_claimAutoreleasedReturnValue();
      IONotificationPortSetDispatchQueue(v7, v8);

    }
    else
    {
      _IMWarn(CFSTR("IORegisterForSystemPower failed"), v0, v1, v2, v3, v4, v5, v6, v9);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
}

uint64_t sub_190693014(uint64_t a1)
{
  uint64_t result;
  const char *v3;
  uint64_t v4;

  result = IMGetDomainBoolForKey(CFSTR("com.apple.conference"), CFSTR("restoredFromBackup"));
  if ((_DWORD)result)
    return objc_msgSend__deliverNotificationSelector_(*(void **)(a1 + 32), v3, (uint64_t)sel_systemDidFinishMigration, v4);
  return result;
}

uint64_t sub_19069311C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__deliverNotificationSelector_(*(void **)(a1 + 32), a2, (uint64_t)sel_systemDidStopBackup, a4);
}

uint64_t sub_190693180(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__deliverNotificationSelector_(*(void **)(a1 + 32), a2, (uint64_t)sel_systemRestoreStateDidChange, a4);
}

void sub_19069327C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Setup state changed"), v4, v5, v6, v7, v8, v9);
  if (a2)
    MEMORY[0x1E0DE7D20](a2, sel__setupStateChanged, v3, v4);
}

id sub_1906932D4()
{
  if (qword_1EE1DD550 != -1)
    dispatch_once(&qword_1EE1DD550, &unk_1E2C45280);
  return (id)qword_1EE1DD548;
}

void sub_190693314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    MEMORY[0x1E0DE7D20](a2, sel__checkRestoredFromBackup, a3, a4);
}

void sub_190693324(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Restore started"), v4, v5, v6, v7, v8, v9);
  if (a2)
    MEMORY[0x1E0DE7D20](a2, sel__restoreDidStart, v3, v4);
}

void sub_19069337C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (_IMWillLog(CFSTR("SystemMonitor")))
    _IMAlwaysLog(0, CFSTR("SystemMonitor"), CFSTR("Restore stopped"), v4, v5, v6, v7, v8, v9);
  if (a2)
    MEMORY[0x1E0DE7D20](a2, sel__restoreDidStop, v3, v4);
}

void sub_190693630()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    byte_1EE1DDAD0 = CFEqual(v0, CFSTR("AppleTV")) != 0;
    byte_1EE1DDAD1 = CFEqual(v1, CFSTR("AudioAccessory")) != 0;
    CFRelease(v1);
  }
}

void *sub_1906936AC()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BYSetupAssistantIsRunningSilentTokenUpgrade", CFSTR("SetupAssistant"));
  off_1EE1DD2B0 = result;
  return result;
}

void *sub_1906936D8()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BYSetupAssistantNeedsToRun", CFSTR("SetupAssistant"));
  off_1EE1DD2B8 = result;
  return result;
}

void sub_1906938AC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__receivedMemoryNotification(v7, v4, v5, v6);

}

void sub_190693A60(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend_registration(IMRGLog, a2, a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19066D000, v4, OS_LOG_TYPE_DEFAULT, "IMSystemMonitor: Received IMSystemMonitorSBShutdownCallback", v5, 2u);
  }

  sub_190693B40();
}

void sub_190693AD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend_registration(IMRGLog, a2, a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19066D000, v4, OS_LOG_TYPE_DEFAULT, "IMSystemMonitor: kMobileObliterationNotification received", v5, 2u);
  }

  sub_190693B40();
}

void sub_190693B40()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD90E00);
  if ((byte_1EE1DDACC & 1) != 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
  }
  else
  {
    objc_msgSend_registration(IMRGLog, v0, v1, v2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "IMSystemMonitor: Updating to note that system is currently shutting down", v12, 2u);
    }

    byte_1EE1DDACC = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD90E00);
    objc_msgSend_sharedInstance(IMSystemMonitor, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__systemWillShutdown(v7, v8, v9, v10);

    im_primary_queue();
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v11, &unk_1E2C42B48);

  }
}

void sub_190693C28(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v5, v4, (uint64_t)CFSTR("IMSystemShuttingDownNotification"), 0);

}

void sub_190693C68(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  IOReturn v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint8_t buf[2];
  __int16 v66;
  __int16 v67;

  v6 = (void *)MEMORY[0x19400E788]();
  if (a3 > -536870273)
  {
    switch(a3)
    {
      case -536870272:
        if (_IMWillLog(CFSTR("IMSystemMonitor")))
          _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("SLEEP -- going to sleep now"), v26, v27, v28, v29, v30, v64);
        objc_msgSend_sharedInstance(IMSystemMonitor, v24, v25, v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__systemWillSleep(v31, v32, v33, v34);
        break;
      case -536870144:
        if (_IMWillLog(CFSTR("IMSystemMonitor")))
          _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("WAKE -- just woke up!"), v37, v38, v39, v40, v41, v64);
        objc_msgSend_sharedInstance(IMSystemMonitor, v35, v36, v37);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___im_afterDelay_(v31, v42, v43, v44, 0.0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__systemDidWake(v45, v46, v47, v48);

        break;
      case -536870128:
        if (_IMWillLog(CFSTR("IMSystemMonitor")))
          _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("SYSTEM RESTART -- posting"), v9, v10, v11, v12, v13, v64);
        objc_msgSend_registration(IMRGLog, v7, v8, v9);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        v67 = 0;
        v15 = "IMSystemMonitor: SYSTEM RESTART -- posting";
        v16 = (uint8_t *)&v67;
        goto LABEL_26;
      default:
        goto LABEL_28;
    }

    goto LABEL_28;
  }
  if (a3 == -536870384)
  {
    if (_IMWillLog(CFSTR("IMSystemMonitor")))
      _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("DEVICE POWER OFF -- posting"), v51, v52, v53, v54, v55, v64);
    objc_msgSend_registration(IMRGLog, v49, v50, v51);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v15 = "IMSystemMonitor: DEVICE POWER OFF -- posting";
    v16 = buf;
  }
  else
  {
    if (a3 != -536870320)
      goto LABEL_28;
    if (_IMWillLog(CFSTR("IMSystemMonitor")))
      _IMAlwaysLog(0, CFSTR("IMSystemMonitor"), CFSTR("SYSTEM POWER OFF -- posting"), v19, v20, v21, v22, v23, v64);
    objc_msgSend_registration(IMRGLog, v17, v18, v19);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v66 = 0;
    v15 = "IMSystemMonitor: SYSTEM POWER OFF -- posting";
    v16 = (uint8_t *)&v66;
  }
LABEL_26:
  _os_log_impl(&dword_19066D000, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
LABEL_27:

  sub_190693B40();
LABEL_28:
  v56 = IOAllowPowerChange(dword_1EE1DD798, a4);
  if (v56)
    _IMWarn(CFSTR("IOAllowPowerChange failed!  Error: %d"), v57, v58, v59, v60, v61, v62, v63, v56);
  objc_autoreleasePoolPop(v6);
}

#error "190693F40: call analysis failed (funcsize=16)"

void sub_190693F60()
{
  int v0;
  NSObject *v1;
  _QWORD block[4];
  int v3;

  v0 = MKBGetDeviceLockState();
  im_primary_queue();
  v1 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190693FD4;
  block[3] = &unk_1E2C45220;
  v3 = v0;
  dispatch_async(v1, block);

}

void sub_190693FD4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDataProtectionLockState_(v7, v5, *(unsigned int *)(a1 + 32), v6);

}

void sub_190694018(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setSystemLockState_(v7, v5, a3 != 0, v6);

}

void sub_190694060(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setSystemScreenState_(v7, v5, a3 == 0, v6);

}

void sub_1906940A8()
{
  void **v0;
  void *v1;

  if (!qword_1EE1DD548)
  {
    v0 = (void **)IMWeakLinkSymbol("BYSetupAssistantExitedDarwinNotification", CFSTR("SetupAssistant"));
    if (v0)
      v1 = *v0;
    else
      v1 = 0;
    objc_storeStrong((id *)&qword_1EE1DD548, v1);
  }
}

void sub_190694A34()
{
  IMUserNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(IMUserNotificationCenter);
  v1 = (void *)qword_1ECD90FC8;
  qword_1ECD90FC8 = (uint64_t)v0;

}

void sub_190695398(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v6;
  id v7;

  objc_msgSend_sharedInstance(IMUserNotificationCenter, a2, a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__handleUserNotification_responseFlags_(v7, v6, a1, (uint64_t)a2);

}

void *sub_190695F0C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierCancelCopy", CFSTR("Bom"));
  off_1EE1DDAD8 = result;
  return result;
}

void *sub_190695F38()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierFree", CFSTR("Bom"));
  off_1EE1DD478 = result;
  return result;
}

void *sub_190696230()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierCancelCopy", CFSTR("Bom"));
  off_1EE1DDAE8 = result;
  return result;
}

uint64_t sub_1906963B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
}

uint64_t sub_1906967CC()
{
  uint64_t result;

  result = IMWeakLinkSymbol("BOMCopierFree", CFSTR("Bom"));
  qword_1EE1DD3F8 = result;
  return result;
}

void *sub_1906967F8()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierNew", CFSTR("Bom"));
  off_1EE1DD400 = result;
  return result;
}

void *sub_190696824()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierSetUserData", CFSTR("Bom"));
  off_1EE1DD430 = result;
  return result;
}

void *sub_190696850()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierSetFatalErrorHandler", CFSTR("Bom"));
  off_1EE1DD410 = result;
  return result;
}

void *sub_19069687C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierSetFatalFileErrorHandler", CFSTR("Bom"));
  off_1EE1DD418 = result;
  return result;
}

void *sub_1906968A8()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierSetFileErrorHandler", CFSTR("Bom"));
  off_1EE1DD428 = result;
  return result;
}

void *sub_1906968D4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierSetFileConflictErrorHandler", CFSTR("Bom"));
  off_1EE1DD420 = result;
  return result;
}

void *sub_190696900()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierSetCopyFileStartedHandler", CFSTR("Bom"));
  off_1EE1DD408 = result;
  return result;
}

void *sub_19069692C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierCopyWithOptions", CFSTR("Bom"));
  off_1EE1DD3F0 = result;
  return result;
}

uint64_t sub_190696958(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (qword_1EE1DD488 != -1)
    dispatch_once(&qword_1EE1DD488, &unk_1E2C453A8);
  off_1EE1DD480(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  v7 = 2;
  if (v2)
  {
    if (objc_msgSend_wasCancelled(v2, v3, v4, v5))
      v7 = 2;
    else
      v7 = 0;
  }

  return v7;
}

uint64_t sub_1906969D4(uint64_t a1, uint64_t a2, int a3)
{
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1DDB00 != -1)
    dispatch_once(&qword_1EE1DDB00, &unk_1E2C431C8);
  off_1EE1DDAF8(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_190696EC8();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = v6;
    v11 = 2080;
    v12 = a2;
    v13 = 1024;
    v14 = a3;
    _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "%@: File Error: %s, %d", (uint8_t *)&v9, 0x1Cu);
  }

  return 0;
}

uint64_t sub_190696AE4(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1DDB20 != -1)
    dispatch_once(&qword_1EE1DDB20, &unk_1E2C453E8);
  off_1EE1DDB18(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_190696EC8();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2080;
    v10 = a2;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "%@: File Conflict Error: %s", (uint8_t *)&v7, 0x16u);
  }

  return 3;
}

void sub_190696BE4(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  if (qword_1EE1DDB30 != -1)
    dispatch_once(&qword_1EE1DDB30, &unk_1E2C45408);
  off_1EE1DDB28(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_190696EC8();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1906B6ECC((uint64_t)v2, v3);

}

void sub_190696C70(uint64_t a1, uint64_t a2, int a3)
{
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1DDB40 != -1)
    dispatch_once(&qword_1EE1DDB40, &unk_1E2C43208);
  off_1EE1DDB38(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_190696EC8();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412802;
    v9 = v6;
    v10 = 2080;
    v11 = a2;
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "%@: Fatal File Error: %s, %d", (uint8_t *)&v8, 0x1Cu);
  }

}

void *sub_190696E70()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierUserData", CFSTR("Bom"));
  off_1EE1DD480 = result;
  return result;
}

void *sub_190696E9C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierUserData", CFSTR("Bom"));
  off_1EE1DDAF8 = result;
  return result;
}

id sub_190696EC8()
{
  if (qword_1EE1DDB10 != -1)
    dispatch_once(&qword_1EE1DDB10, &unk_1E2C453C8);
  return (id)qword_1EE1DDB08;
}

void sub_190696F08()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.imfoundation", "fileCopier");
  v1 = (void *)qword_1EE1DDB08;
  qword_1EE1DDB08 = (uint64_t)v0;

}

void *sub_190696F38()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierUserData", CFSTR("Bom"));
  off_1EE1DDB18 = result;
  return result;
}

void *sub_190696F64()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierUserData", CFSTR("Bom"));
  off_1EE1DDB28 = result;
  return result;
}

void *sub_190696F90()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("BOMCopierUserData", CFSTR("Bom"));
  off_1EE1DDB38 = result;
  return result;
}

void sub_190697284(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x19400E788]();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_190697A34;
  v7[3] = &unk_1E2C44088;
  v6 = v4;
  v8 = v6;
  v9 = a1;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_autoreleasePoolPop(v5);
}

uint64_t sub_19069731C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__handleCallbackForSCNetworkReachability_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4);
}

void sub_190697A34(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_object(*(void **)(a1 + 32), a2, a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__handleCallbackForSCNetworkReachability_(v7, v5, *(_QWORD *)(a1 + 40), v6);

}

void sub_190697B88()
{
  IMPerfProfiler *v0;
  void *v1;

  v0 = objc_alloc_init(IMPerfProfiler);
  v1 = (void *)qword_1EE1DDB48;
  qword_1EE1DDB48 = (uint64_t)v0;

}

void sub_190697E1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_190698D88(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__doCallbackNow(a2, (const char *)a2, a3, a4);
}

dispatch_queue_t sub_190699588()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = im_primary_base_queue();
  result = dispatch_queue_create_with_target_V2("IMLocalObjectQueueWithTargetWorkloop", v0, v1);
  qword_1EE1DDB60 = (uint64_t)result;
  return result;
}

uint64_t sub_1906999DC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int isMainThread;
  void *v16;

  if ((dword_1ECD90A78 & 0x80000000) == 0)
  {
    if (!dword_1ECD90A78)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (qword_1ECD90F20 != -1)
    dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
  if (dword_1ECD90A78 > 0)
LABEL_3:
    _IMWarn(CFSTR("IMLocalObject died: %@"), (uint64_t)a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
LABEL_4:
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], a2, *(_QWORD *)(a1 + 32), (uint64_t)sel__handleNewInvocations, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 100) = 0;
  isMainThread = objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v9, v10, v11);
  v16 = *(void **)(a1 + 32);
  if (isMainThread)
    return objc_msgSend__portDidBecomeInvalid(v16, v12, v13, v14);
  else
    return MEMORY[0x1E0DE7D20](v16, sel_performSelectorOnMainThread_withObject_waitUntilDone_modes_, sel__portDidBecomeInvalid, 0);
}

void sub_190699AC4(uint64_t a1, xpc_connection_t connection, void *a3, uint64_t a4)
{
  void **p_cache;
  char context;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (connection)
  {
    im_configure_connection_with_local_object(connection, *(const char **)(a1 + 32), (uint64_t)a3, a4);
    p_cache = IMTimer.cache;
    if (dword_1ECD90A78 < 0)
    {
      if (qword_1ECD90F20 != -1)
      {
        dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
        p_cache = (void **)(IMTimer + 16);
      }
      if (*((int *)p_cache + 670) <= 0)
        goto LABEL_5;
    }
    else if (!dword_1ECD90A78)
    {
LABEL_5:
      im_local_object_peer_event_handler_is_syncReply(connection, a3, 0);
      return;
    }
    context = xpc_connection_get_context(connection);
    _IMLog(CFSTR("* Incoming event for IMLocalObject: %@   (object: %p)"), v8, v9, v10, v11, v12, v13, v14, context);
    goto LABEL_5;
  }
}

uint64_t sub_190699B8C(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint8_t v9[16];

  v2 = OSLogHandleForIDSCategory("IMLocalObject");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19066D000, v2, OS_LOG_TYPE_DEFAULT, "_clearPort posting IMLocalObjectDidDisconnectNotification after waking main thread", v9, 2u);
  }
  v6 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v3, v4, v5);
  return objc_msgSend___mainThreadPostNotificationName_object_(v6, v7, (uint64_t)CFSTR("IMLocalObjectDidDisconnect"), *(_QWORD *)(a1 + 32));
}

void sub_190699E60(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_190699E70(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t sub_19069A268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__handleNewInvocations, a3, a4);
}

uint64_t sub_19069A4DC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_invalidate(*(void **)(a1 + 32), a2, a3, a4);
}

uint64_t sub_19069A4E4(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const char *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = OSLogHandleForIDSCategory("IMLocalObject");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v6 + 101))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (*(_BYTE *)(v6 + 100))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_19066D000, v2, OS_LOG_TYPE_DEFAULT, "Posting IMLocalObjectDidDisconnectNotification as we detected run loop was blocked. _localInternal(busyForwarding) %@ or had pending component processing %@ ", (uint8_t *)&v12, 0x16u);
  }
  v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v3, v4, v5);
  return objc_msgSend___mainThreadPostNotificationName_object_(v9, v10, (uint64_t)CFSTR("IMLocalObjectDidDisconnect"), *(_QWORD *)(a1 + 32));
}

uint64_t sub_19069A660(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_1ECD90A78 < 0)
  {
    if (qword_1ECD90F20 != -1)
      dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
    if (dword_1ECD90A78 > 0)
      goto LABEL_3;
  }
  else if (dword_1ECD90A78)
  {
LABEL_3:
    _IMLog(CFSTR("Remote object died: %@"), (uint64_t)a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  }
  return objc_msgSend__portDidBecomeInvalid(*(void **)(a1 + 32), a2, a3, a4);
}

dispatch_queue_t sub_19069A934()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create(0, v0);
  qword_1EE1DD6B0 = (uint64_t)result;
  return result;
}

void sub_19069A964(uint64_t a1, void *a2)
{
  im_local_object_peer_event_handler_is_syncReply(*(_xpc_connection_s **)(a1 + 32), a2, 0);
}

void sub_19069AD90(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void (**v33)(_QWORD);
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  _QWORD block[9];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  if (!v4)
    return;
  v5 = *(_QWORD **)(a1 + 40);
  v6 = (void *)v5[1];
  v7 = (void *)v5[4];
  v8 = v5[6];
  if (objc_msgSend_count(v6, a2, a3, a4))
    v12 = (void *)objc_msgSend__copyForEnumerating(v6, v9, v10, v11);
  else
    v12 = 0;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v9, (uint64_t)&v48, (uint64_t)v52, 16);
  if (!v13)
    goto LABEL_29;
  v17 = v13;
  v18 = *(_QWORD *)v49;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v49 != v18)
        objc_enumerationMutation(v12);
      v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      if ((objc_msgSend_isValid(v20, v14, v15, v16) & 1) == 0)
      {
        if (dword_1ECD90A78 < 0)
        {
          if (qword_1ECD90F20 != -1)
            dispatch_once(&qword_1ECD90F20, &unk_1E2C455D0);
          if (dword_1ECD90A78 <= 0)
            goto LABEL_29;
        }
        else if (!dword_1ECD90A78)
        {
          goto LABEL_29;
        }
        _IMLog(CFSTR("* Object is no longer valid, skipping this enqueue: %@"), (uint64_t)v21, v22, v23, v24, v25, v26, v27, (char)v20);
        goto LABEL_29;
      }
      v28 = objc_msgSend__queue(v20, v21, v22, v23);
      if (v28)
      {
        v29 = v28;
        dispatch_retain(v28);
        xpc_retain(v4);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1906735CC;
        block[3] = &unk_1E2C455F8;
        block[4] = v20;
        block[5] = v4;
        block[7] = v29;
        block[8] = v8;
        block[6] = v7;
        v33 = (void (**)(_QWORD))dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        if (v7
          && ((objc_msgSend_isReply(v7, v30, v31, v32) & 1) != 0 || objc_msgSend_isSync(v7, v34, v35, v36)))
        {
          if ((_os_feature_enabled_impl() & 1) != 0
            || (v40 = (void *)objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v37, v38, v39),
                v44 = (void *)objc_msgSend_threadDictionary(v40, v41, v42, v43),
                (void *)objc_msgSend_objectForKey_(v44, v45, (uint64_t)CFSTR("com.apple.IMRemoteObjectDeliveringMessageKey"), v46) == v20))
          {
            v33[2](v33);
LABEL_22:
            _Block_release(v33);
            continue;
          }
          dispatch_sync(v29, v33);
        }
        else
        {
          dispatch_async(v29, v33);
        }
        if (v33)
          goto LABEL_22;
      }
    }
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v48, (uint64_t)v52, 16);
    if (v17)
      continue;
    break;
  }
LABEL_29:

}

void sub_19069B070()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "Registration-oversized");
  v1 = (void *)qword_1EE1DD348;
  qword_1EE1DD348 = (uint64_t)v0;

}

void sub_19069B0E4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Warning");
  v1 = (void *)qword_1ECD90B68;
  qword_1ECD90B68 = (uint64_t)v0;

}

void sub_19069B154()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "ACKTracker");
  v1 = (void *)qword_1EE1DDB68;
  qword_1EE1DDB68 = (uint64_t)v0;

}

void sub_19069B1C4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Engram");
  v1 = (void *)qword_1EE1DDB78;
  qword_1EE1DDB78 = (uint64_t)v0;

}

void sub_19069B234()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "FTMessageDelivery-oversized");
  v1 = (void *)qword_1EE1DD1F0;
  qword_1EE1DD1F0 = (uint64_t)v0;

}

void sub_19069B2A4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "GDR");
  v1 = (void *)qword_1EE1DD200;
  qword_1EE1DD200 = (uint64_t)v0;

}

void sub_19069B314()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "GDR-oversized");
  v1 = (void *)qword_1EE1DD210;
  qword_1EE1DD210 = (uint64_t)v0;

}

void sub_19069B384()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "IDSService");
  v1 = (void *)qword_1EE1DD6D0;
  qword_1EE1DD6D0 = (uint64_t)v0;

}

void sub_19069B3F4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "IDSService-oversized");
  v1 = (void *)qword_1ECD90DC8;
  qword_1ECD90DC8 = (uint64_t)v0;

}

void sub_19069B464()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "NRPairing");
  v1 = (void *)qword_1EE1DD5A0;
  qword_1EE1DD5A0 = (uint64_t)v0;

}

void sub_19069B4D4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "NSUUID");
  v1 = (void *)qword_1ECD90CE8;
  qword_1ECD90CE8 = (uint64_t)v0;

}

void sub_19069B544()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "OTRStore");
  v1 = (void *)qword_1EE1DDB88;
  qword_1EE1DDB88 = (uint64_t)v0;

}

void sub_19069B5B4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "AccountCleanup");
  v1 = (void *)qword_1EE1DD4C8;
  qword_1EE1DD4C8 = (uint64_t)v0;

}

void sub_19069B624()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "AccountSync");
  v1 = (void *)qword_1EE1DD220;
  qword_1EE1DD220 = (uint64_t)v0;

}

void sub_19069B694()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "AccountUpdate");
  v1 = (void *)qword_1EE1DD230;
  qword_1EE1DD230 = (uint64_t)v0;

}

void sub_19069B704()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "AccountsDebugging");
  v1 = (void *)qword_1EE1DD518;
  qword_1EE1DD518 = (uint64_t)v0;

}

void sub_19069B774()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "ActiveID");
  v1 = (void *)qword_1ECD90D18;
  qword_1ECD90D18 = (uint64_t)v0;

}

void sub_19069B7E4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "AppleCare");
  v1 = (void *)qword_1EE1DDB98;
  qword_1EE1DDB98 = (uint64_t)v0;

}

void sub_19069B854()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "ClassKeys");
  v1 = (void *)qword_1EE1DDBA8;
  qword_1EE1DDBA8 = (uint64_t)v0;

}

void sub_19069B8C4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "DataProtectionClass");
  v1 = (void *)qword_1EE1DD260;
  qword_1EE1DD260 = (uint64_t)v0;

}

void sub_19069B934()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "DeviceHeartbeat");
  v1 = (void *)qword_1EE1DD270;
  qword_1EE1DD270 = (uint64_t)v0;

}

void sub_19069B9A4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "DeviceIDMap");
  v1 = (void *)qword_1EE1DDBB8;
  qword_1EE1DDBB8 = (uint64_t)v0;

}

void sub_19069BA14()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "DeviceState");
  v1 = (void *)qword_1EE1DD280;
  qword_1EE1DD280 = (uint64_t)v0;

}

void sub_19069BA84()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "HealthDebug");
  v1 = (void *)qword_1EE1DD290;
  qword_1EE1DD290 = (uint64_t)v0;

}

void sub_19069BAF4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "HealthDebugging");
  v1 = (void *)qword_1EE1DD4E8;
  qword_1EE1DD4E8 = (uint64_t)v0;

}

void sub_19069BB64()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "iCloud");
  v1 = (void *)qword_1EE1DD580;
  qword_1EE1DD580 = (uint64_t)v0;

}

void sub_19069BBD4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "IMMacNotificationCenterManager");
  v1 = (void *)qword_1EE1DDBC8;
  qword_1EE1DDBC8 = (uint64_t)v0;

}

void sub_19069BC44()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "iMessageSpam");
  v1 = (void *)qword_1EE1DDBD8;
  qword_1EE1DDBD8 = (uint64_t)v0;

}

void sub_19069BCB4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "SpamReporting");
  v1 = (void *)qword_1EE1DDBE8;
  qword_1EE1DDBE8 = (uint64_t)v0;

}

void sub_19069BD24()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "InternalCleanup");
  v1 = (void *)qword_1EE1DD2A0;
  qword_1EE1DD2A0 = (uint64_t)v0;

}

void sub_19069BD94()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "isActive");
  v1 = (void *)qword_1EE1DDBF8;
  qword_1EE1DDBF8 = (uint64_t)v0;

}

void sub_19069BE04()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "KeyRoll");
  v1 = (void *)qword_1EE1DDC08;
  qword_1EE1DDC08 = (uint64_t)v0;

}

void sub_19069BE74()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Keychain");
  v1 = (void *)qword_1EE1DD2D8;
  qword_1EE1DD2D8 = (uint64_t)v0;

}

void sub_19069BEE4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "KeychainManager");
  v1 = (void *)qword_1EE1DD8B0;
  qword_1EE1DD8B0 = (uint64_t)v0;

}

void sub_19069BF54()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "LiveMigration");
  v1 = (void *)qword_1EE1DD2E8;
  qword_1EE1DD2E8 = (uint64_t)v0;

}

void sub_19069BFC4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "MessageDelivery-oversized");
  v1 = (void *)qword_1EE1DD2F8;
  qword_1EE1DD2F8 = (uint64_t)v0;

}

void sub_19069C034()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Migration");
  v1 = (void *)qword_1EE1DD308;
  qword_1EE1DD308 = (uint64_t)v0;

}

void sub_19069C0A4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Nonce");
  v1 = (void *)qword_1EE1DD6C0;
  qword_1EE1DD6C0 = (uint64_t)v0;

}

void sub_19069C114()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "PairedDeviceRepo");
  v1 = (void *)qword_1EE1DDC18;
  qword_1EE1DDC18 = (uint64_t)v0;

}

void sub_19069C184()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "PairedIdentities");
  v1 = (void *)qword_1EE1DDC28;
  qword_1EE1DDC28 = (uint64_t)v0;

}

void sub_19069C1F4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Pairing");
  v1 = (void *)qword_1EE1DDC38;
  qword_1EE1DDC38 = (uint64_t)v0;

}

void sub_19069C264()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "PairingIdentities");
  v1 = (void *)qword_1EE1DDC48;
  qword_1EE1DDC48 = (uint64_t)v0;

}

void sub_19069C2D4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "PairingProtocolDebug");
  v1 = (void *)qword_1EE1DD528;
  qword_1EE1DD528 = (uint64_t)v0;

}

void sub_19069C344()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "PhoneRepair");
  v1 = (void *)qword_1EE1DD318;
  qword_1EE1DD318 = (uint64_t)v0;

}

void sub_19069C3B4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "PushToken");
  v1 = (void *)qword_1EE1DD328;
  qword_1EE1DD328 = (uint64_t)v0;

}

void sub_19069C424()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "QueryRetry");
  v1 = (void *)qword_1EE1DDC58;
  qword_1EE1DDC58 = (uint64_t)v0;

}

void sub_19069C494()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Regeneration");
  v1 = (void *)qword_1EE1DDC68;
  qword_1EE1DDC68 = (uint64_t)v0;

}

void sub_19069C504()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "RegistrationAuthKit");
  v1 = (void *)qword_1EE1DD498;
  qword_1EE1DD498 = (uint64_t)v0;

}

void sub_19069C574()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "RegistrationListener");
  v1 = (void *)qword_1EE1DD338;
  qword_1EE1DD338 = (uint64_t)v0;

}

void sub_19069C5E4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "ReloadAccounts");
  v1 = (void *)qword_1EE1DDC78;
  qword_1EE1DDC78 = (uint64_t)v0;

}

void sub_19069C654()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "ServerBag");
  v1 = (void *)qword_1ECD90D38;
  qword_1ECD90D38 = (uint64_t)v0;

}

void sub_19069C6C4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "SMS");
  v1 = (void *)qword_1ECD90CB0;
  qword_1ECD90CB0 = (uint64_t)v0;

}

void sub_19069C734()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Sub-services");
  v1 = (void *)qword_1EE1DD360;
  qword_1EE1DD360 = (uint64_t)v0;

}

void sub_19069C7A4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Sysdiagnose-oversized");
  v1 = (void *)qword_1EE1DD370;
  qword_1EE1DD370 = (uint64_t)v0;

}

void sub_19069C814()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "Sysdiagnose-KeyTransparency");
  v1 = (void *)qword_1EE1DD500;
  qword_1EE1DD500 = (uint64_t)v0;

}

void sub_19069C884()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "UniqueID");
  v1 = (void *)qword_1EE1DDC88;
  qword_1EE1DDC88 = (uint64_t)v0;

}

void sub_19069C8F4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "VoicemailSync");
  v1 = (void *)qword_1EE1DDC98;
  qword_1EE1DDC98 = (uint64_t)v0;

}

void sub_19069C964()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "WatchPairing");
  v1 = (void *)qword_1EE1DD650;
  qword_1EE1DD650 = (uint64_t)v0;

}

void sub_19069C9D4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "SignInController");
  v1 = (void *)qword_1EE1DD8E0;
  qword_1EE1DD8E0 = (uint64_t)v0;

}

void sub_19069CA44()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Registration", "VM");
  v1 = (void *)qword_1EE1DDCA8;
  qword_1EE1DDCA8 = (uint64_t)v0;

}

void _IMLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_19067AA90(0, a1, &a9);
}

void _IMAlwaysLog(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _IMAlwaysLogV(a1, a2, a3, &a9);
}

void _IMSyncLoggingSettings()
{
  dword_1ECD90A84 = -1;
  dword_1EE1DCD20 = -1;
}

id _IMLogCategoryFromMessage(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;

  v1 = a1;
  if (objc_msgSend_hasPrefix_(v1, v2, (uint64_t)CFSTR("["), v3)
    && (v7 = objc_msgSend_length(v1, v4, v5, v6),
        v9 = objc_msgSend_rangeOfString_options_range_(v1, v8, (uint64_t)CFSTR("]"), 0, 1, v7 - 1),
        v10))
  {
    objc_msgSend_substringWithRange_(v1, v10, 1, v9 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id _IMLogMessageFromMessage(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;

  v1 = a1;
  if (objc_msgSend_hasPrefix_(v1, v2, (uint64_t)CFSTR("["), v3)
    && (v7 = objc_msgSend_length(v1, v4, v5, v6),
        v9 = objc_msgSend_rangeOfString_options_range_(v1, v8, (uint64_t)CFSTR("]"), 0, 1, v7 - 1),
        v10))
  {
    objc_msgSend_substringFromIndex_(v1, v10, v9 + 1, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v1;
  }
  v13 = v12;

  return v13;
}

void _IMLogBacktraceForException(void *a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  int ClassList;
  Class *v5;
  int v6;
  __CFArray *Mutable;
  __CFDictionary *v8;
  __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  Method *v12;
  Method *v13;
  unint64_t v14;
  SEL Name;
  IMP Implementation;
  int Count;
  CFIndex v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  const char *v33;
  uint64_t v34;
  unsigned int v35;
  CFIndex v36;
  uint64_t v37;
  int v38;
  const void *ValueAtIndex;
  _BYTE *v40;
  objc_class *Value;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  const char *v70;
  id v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  Dl_info outCount;
  CFRange v77;
  CFRange v78;

  v71 = a1;
  objc_msgSend_callStackReturnAddresses(v71, v1, v2, v3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  ClassList = objc_getClassList(0, -1);
  v5 = (Class *)malloc_type_calloc(8uLL, ClassList, 0x85B97272uLL);
  v6 = objc_getClassList(v5, ClassList);
  Mutable = CFArrayCreateMutable(0, 0, 0);
  v8 = CFDictionaryCreateMutable(0, 0, 0, 0);
  v9 = CFDictionaryCreateMutable(0, 0, 0, 0);
  v73 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (v6 >= 1)
  {
    v10 = 0;
    v11 = v6;
    while (1)
    {
      LODWORD(outCount.dli_fname) = 0;
      v12 = class_copyMethodList(v5[v10], (unsigned int *)&outCount);
      v13 = v12;
      if (LODWORD(outCount.dli_fname))
        break;
      if (v12)
        goto LABEL_8;
LABEL_9:
      if (++v10 == v11)
        goto LABEL_10;
    }
    v14 = 0;
    do
    {
      Name = method_getName(v13[v14]);
      Implementation = method_getImplementation(v13[v14]);
      CFDictionarySetValue(v8, Implementation, Name);
      CFDictionarySetValue(v9, Implementation, v5[v10]);
      CFArrayAppendValue(Mutable, Implementation);
      ++v14;
    }
    while (v14 < LODWORD(outCount.dli_fname));
LABEL_8:
    free(v13);
    goto LABEL_9;
  }
LABEL_10:
  Count = CFArrayGetCount(Mutable);
  v18 = Count;
  v77.location = 0;
  v77.length = Count;
  CFArraySortValues(Mutable, v77, (CFComparatorFunction)sub_19069CFF4, 0);
  v19 = v72;
  v23 = objc_msgSend_count(v72, v20, v21, v22);
  v74 = v23 - 1;
  v75 = v23;
  v26 = v73;
  if (v23 >= 1)
  {
    for (i = 0; v75 != i; ++i)
    {
      memset(&outCount, 0, sizeof(outCount));
      objc_msgSend_objectAtIndex_(v19, v24, i, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (const void *)objc_msgSend_integerValue(v28, v29, v30, v31);

      if (!dladdr(v32, &outCount))
        goto LABEL_30;
      v78.location = 0;
      v78.length = v18;
      v35 = CFArrayBSearchValues(Mutable, v78, v32, (CFComparatorFunction)sub_19069CFF4, 0);
      v38 = v35;
      if ((v35 & 0x80000000) != 0 || (v36 = v35, v35 >= v18))
        ValueAtIndex = 0;
      else
        ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v35);
      if (ValueAtIndex == v32)
      {
        v40 = v32;
        if (!v32)
          goto LABEL_25;
      }
      else if (v38 < 1
             || (v36 = (v38 - 1), v36 >= v18)
             || (v40 = CFArrayGetValueAtIndex(Mutable, v36)) == 0)
      {
LABEL_25:
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], (const char *)v36, (uint64_t)CFSTR("%s"), v37, outCount.dli_sname, v69);
        goto LABEL_26;
      }
      if ((_BYTE *)v32 - v40 >= (unint64_t)v32 - (unint64_t)outCount.dli_saddr)
        goto LABEL_25;
      Value = (objc_class *)CFDictionaryGetValue(v9, v40);
      v42 = (const char *)CFDictionaryGetValue(v8, v40);
      v43 = (void *)MEMORY[0x1E0CB3940];
      v68 = class_getName(Value);
      v70 = sel_getName(v42);
      v44 = v43;
      v19 = v72;
      v26 = v73;
      objc_msgSend_stringWithFormat_(v44, v45, (uint64_t)CFSTR("[%s %s]"), v46, v68, v70);
LABEL_26:
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v47;
      if (!outCount.dli_fname || !outCount.dli_sname)
      {

LABEL_30:
        v69 = "???";
        objc_msgSend_appendFormat_(v26, v33, (uint64_t)CFSTR("%3d. %-24s %lu"), v34, i);
        goto LABEL_31;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v48, (uint64_t)CFSTR("%s"), v49, outCount.dli_fname);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v51, v52, v53, v54);
      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v69 = (const char *)objc_msgSend_UTF8String(v55, v56, v57, v58);
      objc_msgSend_appendFormat_(v73, v59, (uint64_t)CFSTR("%3d. %-24s 0x%08lx %@"), v60, i);

      v26 = v73;
      v19 = v72;

LABEL_31:
      if (v74 != i)
        objc_msgSend_appendString_(v26, v24, (uint64_t)CFSTR("\n"), v25);
    }
  }
  if (v8)
    CFRelease(v8);
  if (v9)
    CFRelease(v9);
  if (Mutable)
    CFRelease(Mutable);
  free(v5);
  _IMLog(CFSTR("Backtrace:\n%@"), v61, v62, v63, v64, v65, v66, v67, (char)v26);

}

uint64_t sub_19069CFF4(unint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = 1;
  if (a1 <= a2)
    v2 = -1;
  if (a1 == a2)
    return 0;
  else
    return v2;
}

void IMSetBacktraceLogBlock(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = a1;
  v5 = (void *)qword_1EE1DDCC8;
  v8 = v1;
  if (qword_1EE1DDCC8)
  {
    qword_1EE1DDCC8 = 0;

    v1 = v8;
  }
  if (v1)
  {
    v6 = objc_msgSend_copy(v8, v2, v3, v4);
    v7 = (void *)qword_1EE1DDCC8;
    qword_1EE1DDCC8 = v6;

    v1 = v8;
  }

}

void IMSetBacktraceWarnBlock(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = a1;
  v5 = (void *)qword_1EE1DDCC0;
  v8 = v1;
  if (qword_1EE1DDCC0)
  {
    qword_1EE1DDCC0 = 0;

    v1 = v8;
  }
  if (v1)
  {
    v6 = objc_msgSend_copy(v8, v2, v3, v4);
    v7 = (void *)qword_1EE1DDCC0;
    qword_1EE1DDCC0 = v6;

    v1 = v8;
  }

}

id sub_19069D0C0(uint64_t a1)
{
  uint64_t v1;
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  size_t v6;
  uint64_t v7;
  void **v8;
  int v9;
  char **v10;
  char **v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a1 + 1) < 0x80)
    v1 = a1 + 1;
  else
    v1 = 128;
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend_initWithCapacity_(v2, v3, v1, v4);
  MEMORY[0x1E0C80A78]();
  v8 = (void **)((char *)v23 - v7);
  if (v1)
    memset((char *)v23 - v7, 170, v6);
  v9 = backtrace(v8, v1);
  v10 = backtrace_symbols(v8, v9);
  v11 = v10;
  if (v9 >= 2)
  {
    v12 = v9;
    v13 = (uint64_t *)(v10 + 1);
    v14 = v12 - 1;
    do
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v16 = *v13++;
      v19 = (void *)objc_msgSend_initWithUTF8String_(v15, v17, v16, v18);
      objc_msgSend_addObject_(v5, v20, (uint64_t)v19, v21);

      --v14;
    }
    while (v14);
  }
  free(v11);
  return v5;
}

void sub_19069D1FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  const char *v11;
  void *v12;

  v9 = a1;
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = (void *)objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)CFSTR("%@"), (uint64_t)&a9);
  if (qword_1EE1DDCC8)
    (*(void (**)(void))(qword_1EE1DDCC8 + 16))();

}

void sub_19069D270(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a1;
  v11 = [v9 alloc];
  v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v10, (uint64_t)&a9);

  if (qword_1EE1DDCC0)
    (*(void (**)(void))(qword_1EE1DDCC0 + 16))();

}

uint64_t IMCurrentBacktraceHasSelector(const char *a1)
{
  void *v1;
  id v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19069D0C0(128);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v10, (uint64_t)v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v2);
        if (objc_msgSend_rangeOfString_(*(void **)(*((_QWORD *)&v10 + 1) + 8 * i), v4, (uint64_t)v1, v5, (_QWORD)v10) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v4, (uint64_t)&v10, (uint64_t)v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

void IMLogExceptionBacktrace(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v1 = a1;
  v22 = v1;
  if (qword_1EE1DDCC0)
    sub_19069D270(CFSTR("Exception: %@"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)v1);
  else
    _IMWarn(CFSTR("Exception: %@"), v2, v3, v4, v5, v6, v7, v8, (char)v1);
  v12 = qword_1EE1DDCC0;
  objc_msgSend_callStackSymbols(v22, v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v13;
  if (v12)
    sub_19069D270(CFSTR("  Symbols: %@"), v14, v15, v16, v17, v18, v19, v20, v13);
  else
    _IMWarn(CFSTR("  Symbols: %@"), v14, v15, v16, v17, v18, v19, v20, v13);

}

void IMLogGenerateStackshotWithReason(void *a1, uint64_t a2)
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = a1;
  if (qword_1EE1DD4B0 != -1)
  {
    v5 = v3;
    dispatch_once(&qword_1EE1DD4B0, &unk_1E2C42DC8);
    v3 = v5;
  }
  if (off_1EE1DD4A8)
  {
    v4 = v3;
    if (!v3)
      v3 = CFSTR("IMGeneratedStackShot");
    off_1EE1DD4A8(v3, a2);
    v3 = v4;
  }

}

void *sub_19069D528()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("WriteStackshotReport", CFSTR("CrashReporterSupport"));
  off_1EE1DD4A8 = result;
  return result;
}

void IMLogSimulateCrashForException(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;

  v1 = a1;
  v33 = v1;
  if (qword_1EE1DDCC0)
    sub_19069D270(CFSTR("Exception: %@"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)v1);
  else
    _IMWarn(CFSTR("Exception: %@"), v2, v3, v4, v5, v6, v7, v8, (char)v1);
  v12 = qword_1EE1DDCC0;
  objc_msgSend_callStackSymbols(v33, v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v13;
  if (v12)
    sub_19069D270(CFSTR("  Symbols: %@"), v14, v15, v16, v17, v18, v19, v20, v13);
  else
    _IMWarn(CFSTR("  Symbols: %@"), v14, v15, v16, v17, v18, v19, v20, v13);

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = getpid();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], (const char *)v33, (uint64_t)CFSTR("Exception: %@"), v31, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  IMLogSimulateCrashForProcessAndPID(v29, v30, v32, 4277006349);

}

void IMLogSimulateCrashForProcessAndPID(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  __CFString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;

  v23 = a1;
  v7 = a3;
  if (objc_msgSend_length(v23, v8, v9, v10))
  {
    if (qword_1EE1DDCC0)
      sub_19069D270(CFSTR("Simulating crash for process: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v23);
    else
      _IMWarn(CFSTR("Simulating crash for process: %@"), v11, v12, v13, v14, v15, v16, v17, (char)v23);
    if (!objc_msgSend_length(v7, v18, v19, v20))
    {

      v7 = CFSTR("None Supplied");
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("Simulating crash for %@ from IMLogSimulateCrashForProcess (Reason: %@)"), v21, v23, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EE1DD6D8 != -1)
      dispatch_once(&qword_1EE1DD6D8, &unk_1E2C43748);
    if (off_1EE1DD6E0)
      off_1EE1DD6E0(a2, a4, v22);

  }
}

void IMLogSimulateCrashForProcess(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t size;
  int v21[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (!objc_msgSend_length(v5, v7, v8, v9))
    goto LABEL_12;
  v10 = objc_retainAutorelease(v5);
  v14 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13);
  *(_OWORD *)v21 = xmmword_1906BC890;
  v22 = 0;
  size = 0xAAAAAAAAAAAAAAAALL;
  v15 = sysctl(v21, 3u, 0, &size, 0, 0);
  if (!(_DWORD)v15)
  {
    v16 = (char *)malloc_type_malloc(size, 0x91FF846DuLL);
    v17 = sysctl(v21, 3u, v16, &size, 0, 0);
    if ((_DWORD)v17)
    {
      v15 = v17;
LABEL_5:
      free(v16);
      goto LABEL_13;
    }
    if ((int)(size / 0x288) >= 1)
    {
      v18 = 0;
      v19 = 648 * (size / 0x288);
      do
      {
        v15 = *(unsigned int *)&v16[v18 + 40];
        if ((int)v15 >= 1 && !strncmp(v14, &v16[v18 + 243], 0x10uLL))
          goto LABEL_5;
        v18 += 648;
      }
      while (v19 != v18);
    }
    free(v16);
LABEL_12:
    v15 = 0xFFFFFFFFLL;
  }
LABEL_13:
  IMLogSimulateCrashForProcessAndPID(v5, v15, v6, a3);

}

void *sub_19069D928()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SimulateCrash", CFSTR("CrashReporterSupport"));
  off_1EE1DD6E0 = result;
  return result;
}

void IMPrintf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = (void *)MEMORY[0x19400E788]();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&a9));
  v17 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16);
  puts(v17);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = v17;
    _os_log_impl(&dword_19066D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  fflush((FILE *)*MEMORY[0x1E0C80C20]);

  objc_autoreleasePoolPop(v10);
}

uint64_t _IMLogForceWriteToStdout(uint64_t result)
{
  byte_1EE1DDCD8 = result;
  return result;
}

uint64_t _IMLogForceEnable(uint64_t result)
{
  byte_1EE1DDCD0 = result;
  return result;
}

uint64_t _IMLogForceEnableEverything(uint64_t result)
{
  byte_1EE1DDCD1 = result;
  return result;
}

void _IMLogForceEnableCategory(void *a1, int a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CFMutableDictionaryRef Mutable;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a1;
  v3 = (void *)MEMORY[0x19400E788]();
  if (objc_msgSend_length(v18, v4, v5, v6))
  {
    if (!qword_1EE1DDCB8)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v10 = (void *)qword_1EE1DDCB8;
      qword_1EE1DDCB8 = (uint64_t)Mutable;

    }
    v11 = (void *)qword_1EE1DDCB8;
    if (a2)
    {
      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v7, 1, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v11, v13, (uint64_t)v12, (uint64_t)v18);

    }
    else
    {
      objc_msgSend_removeObjectForKey_((void *)qword_1EE1DDCB8, v7, (uint64_t)v18, v8);
    }
    if (!objc_msgSend_count((void *)qword_1EE1DDCB8, v14, v15, v16))
    {
      v17 = (void *)qword_1EE1DDCB8;
      qword_1EE1DDCB8 = 0;

    }
  }
  objc_autoreleasePoolPop(v3);

}

void IMLogRegisterStateToSysdiagnoseBlock(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v7)
  {
    dispatch_get_global_queue(-32768, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v5 && v7)
  {
    v9 = v5;
    v8 = v6;
    os_state_add_handler();

  }
}

_DWORD *sub_19069DC2C(uint64_t a1, uint64_t a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  _DWORD *v11;
  const char *v12;
  uint64_t v13;
  _DWORD *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const void *v31;

  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v3, v4, 4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_length(v6, v7, v8, v9);
  v11 = malloc_type_calloc(1uLL, v10 + 200, 0xC5BFDEEBuLL);
  v14 = v11;
  if (v11)
  {
    *v11 = 1;
    v11[1] = v10;
    objc_msgSend_dataUsingEncoding_(*(void **)(a1 + 32), v12, 4, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = objc_retainAutorelease(v15);
      v21 = (const void *)objc_msgSend_bytes(v17, v18, v19, v20);
      v25 = objc_msgSend_length(v17, v22, v23, v24);
      if (v25 >= 0x3F)
        v26 = 63;
      else
        v26 = v25;
      memcpy(v14 + 34, v21, v26);
    }
    v27 = objc_retainAutorelease(v6);
    v31 = (const void *)objc_msgSend_bytes(v27, v28, v29, v30);
    memcpy(v14 + 50, v31, v10);

  }
  return v14;
}

id IMTruncatedLoggingStringForString(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  objc_msgSend_description(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_length(v4, v5, v6, v7) > 0x1D)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_substringToIndex_(v4, v8, 30, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("<%@...>"), v14, v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

id JWEncodeCodableObject(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_archivedDataWithRootObject_(MEMORY[0x1E0CB3480], a2, (uint64_t)a1, a4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id JWDecodeKeyedCodableObject(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v1 = a1;
  v5 = v1;
  if (v1 && objc_msgSend_length(v1, v2, v3, v4))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3710]);
    v8 = (void *)objc_msgSend_initForReadingFromData_error_(v6, v7, (uint64_t)v5, 0);
    objc_msgSend_setDecodingFailurePolicy_(v8, v9, 0, v10);
    objc_msgSend_setRequiresSecureCoding_(v8, v11, 0, v12);
    objc_msgSend_decodeObjectForKey_(v8, v13, *MEMORY[0x1E0CB2CD0], v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id JWDecodeKeyedCodableObjectWithSecureCodingAllowedClasses(void *a1, void *a2)
{
  return sub_19067A2F4(a1, 0, a2);
}

id JWDecodeKeyedCodableObjectWithStrictSecureCoding(void *a1, uint64_t a2)
{
  return sub_19069E4C0(a1, a2, 0);
}

id JWDecodeKeyedCodableObjectWithStrictSecureCodingAllowedClasses(void *a1, void *a2)
{
  return sub_19069E4C0(a1, 0, a2);
}

__CFString *StringGUID()
{
  const __CFUUID *v0;
  __CFString *v1;

  v0 = CFUUIDCreate(0);
  v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

uint64_t jw_string_to_uuid(const char *a1, uint64_t a2)
{
  char v4;
  __int16 v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t result;
  char v9;
  int v10;

  if (!a1)
    return 22;
  if (strlen(a1) > 0x25)
    return 22;
  v4 = *a1;
  if (!*a1)
    return 22;
  v5 = 0;
  v6 = (unsigned __int8 *)(a1 + 1);
  v7 = 1;
  result = 22;
  do
  {
    v9 = v4 - 48;
    if ((v4 - 48) < 0xAu)
      goto LABEL_8;
    if ((v4 - 65) <= 5u)
    {
      v9 = v4 - 55;
LABEL_8:
      if (v7)
        goto LABEL_12;
LABEL_9:
      *(_BYTE *)(a2 + v5++) |= v9;
      v7 = 1;
      goto LABEL_14;
    }
    if ((v4 - 97) <= 5u)
    {
      v9 = v4 - 87;
      if (v7)
      {
LABEL_12:
        v7 = 0;
        *(_BYTE *)(a2 + v5) = 16 * v9;
        goto LABEL_14;
      }
      goto LABEL_9;
    }
    if (v4 != 45)
      return result;
LABEL_14:
    v10 = *v6++;
    v4 = v10;
  }
  while (v10 && v5 < 16);
  if (v5 == 16)
    return 0;
  else
    return 22;
}

uint64_t jw_cfstring_to_uuid(const __CFString *a1, uint64_t a2)
{
  __int128 v3;
  _OWORD v5[4];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v5[2] = v3;
  v5[3] = v3;
  v5[0] = v3;
  v5[1] = v3;
  if (CFStringGetCString(a1, (char *)v5, 64, 0x600u))
    return jw_string_to_uuid((const char *)v5, a2);
  else
    return 22;
}

uint64_t jw_data_to_uuid(void *a1, const char *a2)
{
  objc_msgSend_getBytes_length_(a1, a2, (uint64_t)a2, 16);
  return 0;
}

uint64_t jw_uuid_to_data(uint64_t a1, char *a2)
{
  id v3;

  if (!a2)
    return 22;
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], a2, a1, 16);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)a2 = v3;
  if (v3)
    return 0;
  else
    return 22;
}

id JWUUIDPushObjectToString(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  __int128 v6;
  __CFString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  _OWORD out[4];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    v13[0] = 0;
    v13[1] = 0;
    objc_msgSend_getBytes_length_(v1, v5, (uint64_t)v13, 16);
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    out[2] = v6;
    out[3] = v6;
    out[0] = v6;
    out[1] = v6;
    uuid_unparse_upper((const unsigned __int8 *)v13, (char *)out);
    v7 = (__CFString *)CFStringCreateWithCString(0, (const char *)out, 0x8000100u);
    objc_msgSend_uppercaseString(v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      CFRelease(v7);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_19069E248()
{
  id v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  v3 = objc_msgSend_initWithObjects_(v0, v1, (uint64_t)CFSTR("NSString"), v2, CFSTR("NSNumber"), CFSTR("NSArray"), CFSTR("NSDictionary"), CFSTR("NSNull"), 0);
  v4 = (void *)qword_1EE1DD8F0;
  qword_1EE1DD8F0 = v3;

}

void sub_19069E2B0()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  v1 = (void *)qword_1ECD90B80;
  qword_1ECD90B80 = (uint64_t)v0;

}

void sub_19069E2D8()
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v28 = (void *)MEMORY[0x1E0C99E60];
  v27 = objc_opt_class();
  v26 = objc_opt_class();
  v25 = objc_opt_class();
  v24 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend_setWithObjects_(v28, v11, v27, v12, v26, v25, v24, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ECD90E70;
  qword_1ECD90E70 = v13;

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend_setWithObjects_(v15, v20, v16, v21, v17, v18, v19, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)qword_1ECD90E68;
  qword_1ECD90E68 = v22;

}

id sub_19069E4C0(void *a1, uint64_t a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;

  v5 = a1;
  v9 = a3;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8))
  {
    if (qword_1EE1DDCE0 != -1)
      dispatch_once(&qword_1EE1DDCE0, &unk_1E2C432C8);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = v10;
    if (v9)
      objc_msgSend_addObjectsFromArray_(v10, v11, (uint64_t)v9, v12);
    if (a2)
    {
      if (objc_msgSend_containsObject_((void *)qword_1EE1DDCF0, v11, a2, v12))
        objc_msgSend_unionSet_(v13, v14, qword_1EE1DDCE8, v15);
      objc_msgSend_addObject_(v13, v14, a2, v15);
    }
    else
    {
      objc_msgSend_unionSet_(v13, v11, qword_1EE1DDCE8, v12);
    }
    v30 = 0;
    objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v16, (uint64_t)v13, (uint64_t)v5, &v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v30;
    if (v21)
    {
      objc_msgSend_XPC(IMIDSLog, v18, v19, v20);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1906B702C((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28);

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void sub_19069E62C()
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v36 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  v34 = objc_opt_class();
  v33 = objc_opt_class();
  v32 = objc_opt_class();
  v31 = objc_opt_class();
  v30 = objc_opt_class();
  v29 = objc_opt_class();
  v28 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend_setWithObjects_(v36, v11, v35, v12, v34, v33, v32, v31, v30, v29, v28, v0, v1, v2, v3, v4, v5, v6, v7,
    v8,
    v9,
    v10,
    0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1EE1DDCE8;
  qword_1EE1DDCE8 = v13;

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend_setWithObjects_(v15, v24, v16, v25, v17, v18, v19, v20, v21, v22, v23, 0);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)qword_1EE1DDCF0;
  qword_1EE1DDCF0 = v26;

}

void sub_19069E8BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t IMRegisterForPreferredAccountChangeNotificationsInternal()
{
  if (qword_1ECD90A88 != -1)
    dispatch_once(&qword_1ECD90A88, &unk_1E2C42E08);
  return 1;
}

void sub_19069E908()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_19069E938, CFSTR("__k_IMPreferredAccountForServiceChangedNotificationInternal"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_19069E938()
{
  im_main_thread(&unk_1E2C435E8);
}

id IMPreferredAccountMap()
{
  if (qword_1ECD90A88 != -1)
    dispatch_once(&qword_1ECD90A88, &unk_1E2C42E08);
  return IMGetCachedDomainValueForKey(CFSTR("com.apple.conference"), CFSTR("registration.callerIDMap"));
}

BOOL IMUpdatePreferredAccountForService(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *Mutable;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v4;
  v13 = objc_msgSend_length(v5, v7, v8, v9);
  if (v13)
  {
    if (objc_msgSend_length(v6, v10, v11, v12))
    {
      objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99D80], v14, (uint64_t)v6, v15, CFSTR("guid"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    IMGetCachedDomainValueForKey(CFSTR("com.apple.conference"), CFSTR("registration.callerIDMap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (void *)objc_msgSend_mutableCopy(v17, v18, v19, v20);

    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (objc_msgSend_count(v16, v22, v23, v24))
      objc_msgSend_setObject_forKey_(Mutable, v25, (uint64_t)v16, (uint64_t)v5);
    else
      objc_msgSend_removeObjectForKey_(Mutable, v25, (uint64_t)v5, v26);
    IMSetDomainValueForKey(CFSTR("com.apple.conference"), CFSTR("registration.callerIDMap"), Mutable);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__k_IMPreferredAccountForServiceChangedNotificationInternal"), 0, 0, 1u);

  }
  return v13 != 0;
}

void sub_19069EAF8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v5, v4, (uint64_t)CFSTR("__kIMPreferredAccountForServiceChangedNotificationInternal"), 0);

}

void sub_19069FA3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("Network");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = a2;
    v8 = 2112;
    v9 = a3;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "Received CTServerConnection callback { notification: %@, notificationInfo: %@ }", (uint8_t *)&v6, 0x16u);
  }

}

void sub_1906A0FB0(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1906A15A8;
  v2[3] = &unk_1E2C444F8;
  v2[4] = a2;
  im_dispatch_after(v2, 0.0);
}

void *sub_1906A12A4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("MAEGetActivationStateWithError", CFSTR("MobileActivation"));
  off_1EE1DD4B8 = result;
  return result;
}

uint64_t sub_1906A15A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__resetActivationState, a3, a4);
}

id IMLocalizedStringFromTableInBundleForLanguage(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFArray *v22;
  const char *v23;
  uint64_t v24;
  const __CFArray *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  CFArrayRef v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend_length(v7, v11, v12, v13))
    goto LABEL_13;
  if (!objc_msgSend_length(v8, v14, v15, v16))
    goto LABEL_13;
  v19 = objc_msgSend_length(v10, v14, v17, v18);
  if (!v9 || !v19)
    goto LABEL_13;
  objc_msgSend_localizations(v9, v14, v20, v21);
  v22 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v23, (uint64_t)v10, v24);
  v25 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v22, v26, v27, v28))
  {
    v32 = CFBundleCopyLocalizationsForPreferences(v22, v25);
    v36 = objc_msgSend_count(v32, v33, v34, v35);
  }
  else
  {
    v32 = 0;
    v36 = objc_msgSend_count(0, v29, v30, v31);
  }
  if (v36
    && (objc_msgSend___imFirstObject(v32, v37, v38, v39),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_pathForResource_ofType_inDirectory_forLocalization_(v9, v41, (uint64_t)v8, (uint64_t)CFSTR("strings"), 0, v40), v42 = (void *)objc_claimAutoreleasedReturnValue(), v40, v42))
  {
    objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], v43, (uint64_t)v42, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v45, v46, (uint64_t)v7, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = 0;
  }

  if (!v48)
  {
LABEL_13:
    objc_msgSend_localizedStringForKey_value_table_(v9, v14, (uint64_t)v7, (uint64_t)&stru_1E2C46CC8, v8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v48;
}

id IMLocalizedStringFromTableInBundle(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  IMCurrentPreferredLanguage();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMLocalizedStringFromTableInBundleForLanguage(v7, v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id IMCurrentPreferredLanguage()
{
  if (qword_1EE1DD758 != -1)
    dispatch_once(&qword_1EE1DD758, &unk_1E2C42E68);
  return (id)qword_1EE1DDEF0;
}

void sub_1906A1810()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)sub_1906A184C, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  sub_1906A1854(0);
}

void sub_1906A184C()
{
  sub_1906A1854(1);
}

void sub_1906A1854(int a1)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  v22 = (id)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v2 = (id)qword_1EE1DDEF0;
  v3 = (void *)qword_1EE1DDEF0;
  qword_1EE1DDEF0 = 0;

  objc_msgSend___imFirstObject(v22, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EE1DDEF0;
  qword_1EE1DDEF0 = v7;

  if (qword_1EE1DDEF0)
    goto LABEL_3;
  objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x1E0C99DC8], v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v13, *MEMORY[0x1E0C997E8], v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)qword_1EE1DDEF0;
  qword_1EE1DDEF0 = v15;

  if (qword_1EE1DDEF0)
  {
LABEL_3:
    if (!a1)
      goto LABEL_8;
  }
  else
  {
    qword_1EE1DDEF0 = (uint64_t)CFSTR("en");

    if (!a1)
      goto LABEL_8;
  }
  if ((id)qword_1EE1DDEF0 != v2 && (objc_msgSend_isEqualToString_(v2, v9, qword_1EE1DDEF0, v11) & 1) == 0)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v20, v21, (uint64_t)CFSTR("__kIMCurrentPreferredLanguageChangedNotification"), 0);

  }
LABEL_8:

}

void sub_1906A19D4()
{
  _IMLogFileCompressor *v0;
  void *v1;

  v0 = objc_alloc_init(_IMLogFileCompressor);
  v1 = (void *)qword_1ECD90FE0;
  qword_1ECD90FE0 = (uint64_t)v0;

}

id IMCreateStringFromDate(unint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (qword_1EE1DDD00 != -1)
    dispatch_once(&qword_1EE1DDD00, &unk_1E2C45C38);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1906A1D78;
  v14 = sub_1906A1D88;
  v15 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1906A1D90;
  block[3] = &unk_1E2C45C60;
  block[4] = &v10;
  dispatch_sync((dispatch_queue_t)qword_1EE1DDCF8, block);
  if (a1)
  {
    if (qword_1EE1DDD20 != -1)
      dispatch_once(&qword_1EE1DDD20, &unk_1E2C45C80);
    v2 = (id)v11[5];
    objc_msgSend_stringByAppendingFormat_(v2, v3, (uint64_t)CFSTR(" [%013.06f]"), v4, *(double *)&qword_1EE1DDD18 * (double)a1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11[5];
    v11[5] = v5;

  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void sub_1906A1D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1906A1D4C()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.FileLoggingDateQueue", 0);
  v1 = (void *)qword_1EE1DDCF8;
  qword_1EE1DDCF8 = (uint64_t)v0;

}

uint64_t sub_1906A1D78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1906A1D88(uint64_t a1)
{

}

void sub_1906A1D90(uint64_t a1)
{
  BOOL v2;
  time_t v3;
  __int128 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  tm v10;
  time_t v11;
  char v12[16];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1DDD08)
    v2 = *(double *)&qword_1EE1DDD10 < 1.0;
  else
    v2 = 1;
  if (v2 || vabdd_f64(floor(CFAbsoluteTimeGetCurrent()), floor(*(double *)&qword_1EE1DDD10)) > 0.9)
  {
    qword_1EE1DDD10 = floor(CFAbsoluteTimeGetCurrent());
    v3 = (uint64_t)(*(double *)&qword_1EE1DDD10 + *MEMORY[0x1E0C9ADF8]);
    v10.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
    v11 = v3;
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v10.tm_mon = v4;
    *(_OWORD *)&v10.tm_isdst = v4;
    *(_OWORD *)&v10.tm_sec = v4;
    *(_OWORD *)v12 = 0u;
    v13 = 0u;
    localtime_r(&v11, &v10);
    strftime(v12, 0x20uLL, "%Y-%m-%d %X %z", &v10);
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = objc_msgSend_initWithUTF8String_(v5, v6, (uint64_t)v12, v7);
    v9 = (void *)qword_1EE1DDD08;
    qword_1EE1DDD08 = v8;

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)qword_1EE1DDD08);
}

double sub_1906A1EC0()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 / 1000000000.0;
  qword_1EE1DDD18 = *(_QWORD *)&result;
  return result;
}

void sub_1906A2158(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v9, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EE1DDD28;
  qword_1EE1DDD28 = v7;

}

void sub_1906A2254(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;

  objc_msgSend_stringByAppendingPathComponent_(CFSTR("/var/mobile/Library"), a2, (uint64_t)CFSTR("Logs"), a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1EE1DDD40;
  qword_1EE1DDD40 = v4;

}

void sub_1906A2510(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  timespec v22;
  int v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  int v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  id v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const void *v103;
  const char *v104;
  uint64_t v105;
  size_t v106;
  uint64_t v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  __CFString *v113;
  id v114;
  stat v115;

  v2 = (void *)MEMORY[0x19400E788]();
  v3 = (__CFString *)*(id *)(a1 + 32);
  if (v3)
    v7 = v3;
  else
    v7 = CFSTR("FaceTime");
  objc_msgSend_logFileDirectory(*(void **)(a1 + 56), v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v8, v9, (uint64_t)v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v11, v16, *(_QWORD *)(a1 + 40), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!sub_1906A2954(v18) && (objc_msgSend_fileExistsAtPath_(v15, v19, (uint64_t)v11, v20) & 1) == 0)
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v15, v21, (uint64_t)v11, 1, 0, 0);
  v22.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v22.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v115.st_blksize = v22;
  *(timespec *)v115.st_qspare = v22;
  v115.st_birthtimespec = v22;
  *(timespec *)&v115.st_size = v22;
  v115.st_mtimespec = v22;
  v115.st_ctimespec = v22;
  *(timespec *)&v115.st_uid = v22;
  v115.st_atimespec = v22;
  *(timespec *)&v115.st_dev = v22;
  v23 = dword_1EE1DDD50++;
  if (v23 >= 1001)
  {
    v24 = objc_retainAutorelease(v18);
    v28 = (const char *)objc_msgSend_fileSystemRepresentation(v24, v25, v26, v27);
    if (stat(v28, &v115))
    {
      sub_1906A29AC(v24);
      dword_1EE1DDD50 = 0;
    }
    else
    {
      dword_1EE1DDD50 = 0;
      if (v115.st_size > 10485760)
      {
        v112 = v11;
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v29, (uint64_t)CFSTR("%d.zip"), v30, 9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathExtension_(v24, v32, (uint64_t)v31, v33);
        v34 = objc_claimAutoreleasedReturnValue();

        v35 = v24;
        if (sub_1906A2954(v35))
        {
          v36 = sub_1906A29E8(v35);
          close(v36);
          sub_1906A29AC(v35);
        }
        v113 = v7;

        if ((objc_msgSend_fileExistsAtPath_(v15, v37, v34, v38) & 1) != 0)
          objc_msgSend_removeItemAtPath_error_(v15, v39, v34, 0);
        v111 = (void *)v34;
        v41 = 9;
        do
        {
          v42 = v41 - 1;
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v39, (uint64_t)CFSTR("%d.zip"), v40, v41 - 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingPathExtension_(v35, v44, (uint64_t)v43, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v47, (uint64_t)CFSTR("%d.zip"), v48, v41);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingPathExtension_(v35, v50, (uint64_t)v49, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_fileExistsAtPath_(v15, v53, (uint64_t)v46, v54))
            objc_msgSend_moveItemAtPath_toPath_error_(v15, v55, (uint64_t)v46, (uint64_t)v52, 0);

          v41 = v42;
        }
        while (v42 > 1);
        objc_msgSend_lastPathComponent(v35, v39, v56, v40);
        v57 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = (void *)v57;
        objc_msgSend__randomTemporaryPathWithFileName_(v61, v62, v57, v63);
        v64 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_stringByAppendingPathExtension_(v35, v65, (uint64_t)CFSTR("1.zip"), v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = 0;
        objc_msgSend_moveItemAtPath_toPath_error_(v15, v68, (uint64_t)v35, v64, &v114);
        v69 = v114;
        v77 = v69;
        if (v69)
        {
          v107 = v64;
          v108 = v69;
          _IMWarn(CFSTR("Failed to move main item from %@ to %@ (%@)"), (uint64_t)v70, v71, v72, v73, v74, v75, v76, (char)v35);
        }
        objc_msgSend_sharedInstance(_IMLogFileCompressor, v70, v71, v72);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = (void *)v64;
        objc_msgSend_compressPath_toPath_(v78, v79, v64, (uint64_t)v67);

        v82 = 10;
        do
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v80, (uint64_t)CFSTR("%d"), v81, --v82, v107, v108);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingPathExtension_(v35, v84, (uint64_t)v83, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_fileExistsAtPath_(v15, v87, (uint64_t)v86, v88))
            objc_msgSend_removeItemAtPath_error_(v15, v89, (uint64_t)v86, 0);

        }
        while (v82 > 1);

        v7 = v113;
        v11 = v112;
      }
    }
  }
  v90 = sub_1906A29E8(v18);
  if (v90 == -1)
  {
    _IMWarn(CFSTR("Unable to open logging file '%@'"), v91, v92, v93, v94, v95, v96, v97, (char)v18);
  }
  else
  {
    v98 = v90;
    v99 = objc_retainAutorelease(*(id *)(a1 + 48));
    v103 = (const void *)objc_msgSend_UTF8String(v99, v100, v101, v102);
    v106 = objc_msgSend_lengthOfBytesUsingEncoding_(*(void **)(a1 + 48), v104, 4, v105);
    write(v98, v103, v106);
  }

  objc_autoreleasePoolPop(v2);
}

BOOL sub_1906A2954(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    objc_msgSend_objectForKey_((void *)qword_1EE1DDD48, v5, (uint64_t)v1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1906A29AC(void *a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  id v6;

  v6 = a1;
  if (objc_msgSend_length(v6, v1, v2, v3))
    objc_msgSend_removeObjectForKey_((void *)qword_1EE1DDD48, v4, (uint64_t)v6, v5);

}

uint64_t sub_1906A29E8(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    if (qword_1EE1DDD68 != -1)
      dispatch_once(&qword_1EE1DDD68, &unk_1E2C439E8);
    objc_msgSend_objectForKey_((void *)qword_1EE1DDD48, v5, (uint64_t)v1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v11 = v7;
      v12 = objc_msgSend_intValue(v7, v8, v9, v10);
    }
    else
    {
      v13 = objc_retainAutorelease(v1);
      v17 = (const char *)objc_msgSend_fileSystemRepresentation(v13, v14, v15, v16);
      v12 = open(v17, 521, 384);
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v18, v12, v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_((void *)qword_1EE1DDD48, v20, (uint64_t)v11, (uint64_t)v13);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_1906A2AE4()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.IMFileLoggingQueue", 0);
  v1 = (void *)qword_1EE1DDD58;
  qword_1EE1DDD58 = (uint64_t)v0;

  v2 = qword_1EE1DDD58;
  if (qword_1EE1DDD58)
  {
    dispatch_get_global_queue(-2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v2, v3);

  }
}

void sub_1906A2B60()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1EE1DDD48;
  qword_1EE1DDD48 = (uint64_t)v0;

}

void sub_1906A2C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (_IMWillLog(CFSTR("IMRemoteURLMockScheduler")))
    _IMAlwaysLog(0, CFSTR("IMRemoteURLMockScheduler"), CFSTR("URL Loading service disconnected"), v9, v10, v11, v12, v13, a9);
}

void sub_1906A2DEC()
{
  IMCallMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(IMCallMonitor);
  v1 = (void *)qword_1ECD90FE8;
  qword_1ECD90FE8 = (uint64_t)v0;

}

uint64_t IMInsertOptionallyCodableDictionariesToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  __int128 v11;
  char v12;
  id *v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char **v28;
  __int128 v30;
  id *v31;
  _QWORD *v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v12 = 0;
  if (v10 && a2)
  {
    v31 = (id *)&a9;
    v12 = 1;
    *(_QWORD *)&v11 = 138412290;
    v30 = v11;
    do
    {
      v13 = v31;
      v32 = v31 + 1;
      v14 = *v13;
      JWEncodeDictionary(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_length(v15, v16, v17, v18))
      {
        JWEncodeKeyedCodableObject(v14);
        v22 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v22;
      }
      if (!objc_msgSend_length(v15, v19, v20, v21, v30))
      {
        OSLogHandleForIDSCategory("Warning");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v30;
          v34 = v14;
          _os_log_impl(&dword_19066D000, v23, OS_LOG_TYPE_DEFAULT, "Failed to encode codable: %@", buf, 0xCu);
        }

        objc_msgSend_data(MEMORY[0x1E0C99D50], v24, v25, v26);
        v27 = objc_claimAutoreleasedReturnValue();

        v12 = 0;
        v15 = (void *)v27;
      }
      sub_190673110(v15, a2, v10);

      v28 = (const char **)v32;
      v31 = (id *)(v32 + 1);
      a2 = *v28;
    }
    while (*v28);
  }

  return v12 & 1;
}

uint64_t IMCreateInvocationFromXPCObject(void *a1, void *a2)
{
  return IMCreateInvocationFromXPCObjectWithProtocol(a1, a2, 0, 0);
}

id IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses(void *a1, const char *a2, void *a3)
{
  void *v3;
  id v6;
  void *v7;

  v3 = 0;
  if (a1 && a2)
  {
    v6 = a3;
    sub_190671E18(a2, a1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    JWDecodeKeyedCodableObjectWithSecureCodingAllowedClasses(v7, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

int64_t IMGetXPCIntFromDictionary(void *a1, const char *a2)
{
  if (a1 && a2)
    return xpc_dictionary_get_int64(a1, a2);
  else
    return 0;
}

uint64_t IMInsertStringsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  BOOL v11;
  uint64_t v12;
  const char **v13;
  const char **v14;
  const char **v16;
  const char **v17;

  v10 = a1;
  if (v10)
    v11 = a2 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    v16 = (const char **)&a9;
    do
    {
      v13 = v16;
      v17 = v16 + 1;
      if (*v13)
        xpc_dictionary_set_string(v10, a2, *v13);
      v14 = v17;
      v16 = v17 + 1;
      a2 = *v14;
    }
    while (*v14);
  }

  return v12;
}

uint64_t IMInsertDatasToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  BOOL v11;
  uint64_t v12;
  id *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char **v18;
  id *v20;
  _QWORD *v21;

  v10 = a1;
  if (v10)
    v11 = a2 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    v20 = (id *)&a9;
    do
    {
      v13 = v20;
      v21 = v20 + 1;
      v17 = *v13;
      if (!v17)
      {
        objc_msgSend_data(MEMORY[0x1E0C99D50], v14, v15, v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      sub_190673110(v17, a2, v10);

      v18 = (const char **)v21;
      v20 = (id *)(v21 + 1);
      a2 = *v18;
    }
    while (*v18);
  }

  return v12;
}

uint64_t IMInsertIntsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v9;
  uint64_t v10;
  const char **v12;
  uint64_t *v14;

  if (xdict)
    v9 = a2 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    v14 = &a9;
    do
    {
      xpc_dictionary_set_int64(xdict, a2, *(int *)v14);
      v12 = (const char **)(v14 + 1);
      v14 += 2;
      a2 = *v12;
    }
    while (*v12);
  }
  return v10;
}

uint64_t IMInsertBoolsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v9;
  uint64_t v10;
  const char **v12;
  uint64_t *v14;

  if (xdict)
    v9 = a2 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    v14 = &a9;
    do
    {
      xpc_dictionary_set_BOOL(xdict, a2, *(_DWORD *)v14 != 0);
      v12 = (const char **)(v14 + 1);
      v14 += 2;
      a2 = *v12;
    }
    while (*v12);
  }
  return v10;
}

void sub_1906A3B94(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  const char *name;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *string;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x19400EE48]() != MEMORY[0x1E0C81310])
  {
    OSLogHandleForIDSCategory("XPC");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      name = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
      v16 = 136315394;
      v17 = name;
      v18 = 2048;
      v19 = v3;
      _os_log_impl(&dword_19066D000, v4, OS_LOG_TYPE_DEFAULT, "Received unexpected event in hander for service %s: %p", (uint8_t *)&v16, 0x16u);
    }

    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, char *))(v6 + 16))(v6, v3);
    goto LABEL_6;
  }
  if (v3 == (char *)MEMORY[0x1E0C81258])
  {
    OSLogHandleForIDSCategory("XPC");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
      v16 = 136315138;
      v17 = v11;
      _os_log_impl(&dword_19066D000, v10, OS_LOG_TYPE_DEFAULT, "Interrupted connection to service %s", (uint8_t *)&v16, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      goto LABEL_16;
  }
  else
  {
    if (v3 != (char *)MEMORY[0x1E0C81260])
    {
      if (v3 == (char *)MEMORY[0x1E0C81288])
      {
        OSLogHandleForIDSCategory("XPC");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v15 = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
          v16 = 136315138;
          v17 = v15;
          _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "Imminent connection termination for service %s", (uint8_t *)&v16, 0xCu);
        }
      }
      else
      {
        OSLogHandleForIDSCategory("XPC");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
          string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
          v16 = 136315394;
          v17 = v8;
          v18 = 2080;
          v19 = string;
          _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "Unxpected error for service %s: %s", (uint8_t *)&v16, 0x16u);
        }
      }

      goto LABEL_6;
    }
    OSLogHandleForIDSCategory("XPC");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
      v16 = 136315138;
      v17 = v14;
      _os_log_impl(&dword_19066D000, v13, OS_LOG_TYPE_DEFAULT, "Connection Invalid error for service %s", (uint8_t *)&v16, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
LABEL_16:
      (*(void (**)(void))(v12 + 16))();
  }
LABEL_6:

}

void sub_1906A3E90(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1906A3C58);
  }
  _Unwind_Resume(a1);
}

_xpc_connection_s *IMXPCCreateConnectionForService(char a1, const char *a2, void *a3, void *a4)
{
  return IMXPCCreateConnectionForServiceWithQueue(a1, 1, a2, 0, a3, a4);
}

uint64_t IMXPCCreateServerConnectionWithQueue(const char *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  sub_190670CC0(a1, a2, a3, a4, a5, a6, 0);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t IMXPCCreateSim2HostServerConnection(const char *a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v10;
  uint64_t v11;

  dispatch_get_global_queue(2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_190670CC0(a1, v10, a2, a3, a4, a5, 1);
  v11 = objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1906A3FF0()
{
  IMURLRequestSession *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = [IMURLRequestSession alloc];
  objc_msgSend_defaultSessionConfiguration(MEMORY[0x1E0CB39F8], v1, v2, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  sub_1906A406C();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_initWithConfiguration_queue_requiresIDSHost_(v0, v5, (uint64_t)v8, (uint64_t)v4, 0);
  v7 = (void *)qword_1EE1DDD70;
  qword_1EE1DDD70 = v6;

}

id sub_1906A406C()
{
  if (qword_1EE1DDD98 != -1)
    dispatch_once(&qword_1EE1DDD98, &unk_1E2C45E20);
  return (id)qword_1EE1DDD90;
}

void sub_1906A40EC()
{
  IMURLRequestSession *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = [IMURLRequestSession alloc];
  objc_msgSend_defaultSessionConfiguration(MEMORY[0x1E0CB39F8], v1, v2, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  sub_1906A406C();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_initWithConfiguration_queue_requiresIDSHost_(v0, v5, (uint64_t)v8, (uint64_t)v4, 1);
  v7 = (void *)qword_1EE1DDD80;
  qword_1EE1DDD80 = v6;

}

uint64_t sub_1906A432C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1906A4434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1906A444C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1906A445C(uint64_t a1)
{

}

void sub_1906A4464(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend__timingData(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
  {
    v17 = objc_msgSend_statusCode(v7, v12, v13, v14);
    (*(void (**)(uint64_t, id, uint64_t, id, id, void *))(v16 + 16))(v16, v7, v17, v18, v8, v15);
  }

}

void sub_1906A4CAC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int isInternalInstall;

  objc_msgSend_sharedInstance(IMLockdownManager, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalInstall = objc_msgSend_isInternalInstall(v4, v5, v6, v7);

  if (isInternalInstall)
    byte_1ECD90AC8 = 1;
}

void sub_1906A4CF4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v5;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int v24;
  _BYTE v25[14];
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend_URLLoading(IMIDSLog, a2, a3, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a4 || (v5 & 1) == 0)
  {
    if (v8)
    {
      v23 = *(_QWORD *)(a1 + 48);
      v24 = 67109634;
      *(_DWORD *)v25 = v5;
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = a4;
      v26 = 2048;
      v27 = v23;
      _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "SecTrustEvaluateAsyncWithError() failed with result=%d error=%@ {identifier: %llu}", (uint8_t *)&v24, 0x1Cu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 48);
      v24 = 134217984;
      *(_QWORD *)v25 = v9;
      _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "Server trust validation succeeded {identifier: %llu}", (uint8_t *)&v24, 0xCu);
    }

    v10 = (void *)MEMORY[0x1E0CB39A8];
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend_protectionSpace(*(void **)(a1 + 32), v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_serverTrust(v15, v16, v17, v18);
    objc_msgSend_credentialForTrust_(v10, v20, v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v22);

  }
}

void sub_1906A4EA4()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.IdentityServices.SessionQ", v2);
  v1 = (void *)qword_1EE1DDD90;
  qword_1EE1DDD90 = (uint64_t)v0;

}

void sub_1906A4F34()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "Encryption");
  v1 = (void *)qword_1EE1DD8C8;
  qword_1EE1DD8C8 = (uint64_t)v0;

}

void sub_1906A4FA4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "Daemon");
  v1 = (void *)qword_1EE1DD490;
  qword_1EE1DD490 = (uint64_t)v0;

}

void sub_1906A4FD4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "Daemon-oversized");
  v1 = (void *)qword_1EE1DD250;
  qword_1EE1DD250 = (uint64_t)v0;

}

void sub_1906A5044()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "DataDetector");
  v1 = (void *)qword_1EE1DD810;
  qword_1EE1DD810 = (uint64_t)v0;

}

void sub_1906A50B4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "ActivityMonitor");
  v1 = (void *)qword_1EE1DD240;
  qword_1EE1DD240 = (uint64_t)v0;

}

void sub_1906A5124()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "Security");
  v1 = (void *)qword_1EE1DD4F8;
  qword_1EE1DD4F8 = (uint64_t)v0;

}

void sub_1906A5194()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "URLLoading");
  v1 = (void *)qword_1ECD90B58;
  qword_1ECD90B58 = (uint64_t)v0;

}

void sub_1906A5204()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "timer");
  v1 = (void *)qword_1EE1DD8A0;
  qword_1EE1DD8A0 = (uint64_t)v0;

}

void sub_1906A5274()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.IDS", "XPC");
  v1 = (void *)qword_1EE1DD610;
  qword_1EE1DD610 = (uint64_t)v0;

}

void *sub_1906A52CC()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CPPhoneNumberCopyHomeCountryCode", CFSTR("AppSupport"));
  off_1ECD90CA0 = result;
  return result;
}

void *sub_1906A52F8()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CPPhoneNumberCopyActiveCountryCode", CFSTR("AppSupport"));
  off_1ECD90C98 = result;
  return result;
}

void *sub_1906A5324()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CPPhoneNumberCopyNetworkCountryCode", CFSTR("AppSupport"));
  off_1ECD90CF0 = result;
  return result;
}

void *sub_1906A5350()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CFPhoneNumberCreate", CFSTR("PhoneNumbers"));
  off_1ECD90D10 = result;
  return result;
}

id IMUnformattedPhoneNumberForCFPhoneNumberRef(void *a1)
{
  void *v1;

  if (a1)
  {
    v1 = a1;
    if (qword_1EE1DD750 != -1)
      dispatch_once(&qword_1EE1DD750, &unk_1E2C436E8);
    a1 = (void *)off_1EE1DD748(v1);
  }
  return a1;
}

void *sub_1906A53D4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CFPhoneNumberCopyUnformattedRepresentation", CFSTR("PhoneNumbers"));
  off_1EE1DD748 = result;
  return result;
}

id IMCountryCodeCFPhoneNumberRef(void *a1)
{
  void *v1;

  if (a1)
  {
    v1 = a1;
    if (qword_1EE1DD740 != -1)
      dispatch_once(&qword_1EE1DD740, &unk_1E2C45EE8);
    a1 = (void *)off_1EE1DD738(v1);
  }
  return a1;
}

void *sub_1906A5458()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CFPhoneNumberCopyCountryCode", CFSTR("PhoneNumbers"));
  off_1EE1DD738 = result;
  return result;
}

void *sub_1906A5484()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CFPhoneNumberCopyUnformattedInternationalRepresentation", CFSTR("PhoneNumbers"));
  off_1ECD90CC8 = result;
  return result;
}

void *sub_1906A54B0()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CFPhoneNumberCopyUnformattedRepresentation", CFSTR("PhoneNumbers"));
  off_1ECD90CD0 = result;
  return result;
}

id IMFormattedPhoneNumberForCFPhoneNumberRef(uint64_t a1)
{
  void *v2;

  if (qword_1EE1DD5C0 != -1)
    dispatch_once(&qword_1EE1DD5C0, &unk_1E2C437C8);
  if (qword_1EE1DD5C8 == -1)
  {
    if (a1)
      goto LABEL_5;
LABEL_8:
    v2 = 0;
    return v2;
  }
  dispatch_once(&qword_1EE1DD5C8, &unk_1E2C43808);
  if (!a1)
    goto LABEL_8;
LABEL_5:
  v2 = (void *)off_1EE1DD5B0(a1);
  if (!v2)
    v2 = (void *)off_1EE1DD5B8(a1);
  return v2;
}

void *sub_1906A5578()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CFPhoneNumberCopyFormattedRepresentation", CFSTR("PhoneNumbers"));
  off_1EE1DD5B0 = result;
  return result;
}

void *sub_1906A55A4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CFPhoneNumberCopyUnformattedRepresentation", CFSTR("PhoneNumbers"));
  off_1EE1DD5B8 = result;
  return result;
}

id IMCountryCodeForNumber(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1)
  {
    if (qword_1EE1DD7B8 != -1)
      dispatch_once(&qword_1EE1DD7B8, &unk_1E2C45F28);
    v2 = (void *)off_1EE1DD7B0(v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void *sub_1906A5640()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("PNCopyBestGuessCountryCodeForNumber", CFSTR("PhoneNumbers"));
  off_1EE1DD7B0 = result;
  return result;
}

id IMNormalizedPhoneNumberForPhoneNumber(void *a1)
{
  return IMFormatPhoneNumber(a1, 0);
}

__CFString *IMUnformattedDisplayStringForID(void *a1, _QWORD *a2)
{
  return IMUnformattedDisplayStringForIDWithCountryCode(a1, 0, a2);
}

__CFString *IMUnformattedDisplayStringForIDWithCountryCode(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;

  v5 = a1;
  v6 = a2;
  if (IMStringIsEmail(v5))
  {
    if (a3)
      *a3 = 2;
    objc_msgSend_lowercaseString(v5, v7, v8, v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v21 = v10;
    goto LABEL_20;
  }
  if (!IMStringIsPhoneNumber(v5))
  {
LABEL_16:
    if (a3)
      *a3 = 0;
    v10 = (__CFString *)v5;
    goto LABEL_19;
  }
  if (a3)
    *a3 = 3;
  v11 = (void *)IMPhoneNumberRefCopyForPhoneNumber(v5, v6, 0);
  IMUnformattedPhoneNumberForCFPhoneNumberRef(v11);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFRelease(v11);
  if (!objc_msgSend_length(v15, v12, v13, v14))
  {

    goto LABEL_16;
  }
  v16 = IMCopyStringWithLocalizedNumbers(v15);
  if (objc_msgSend_length(v16, v17, v18, v19))
    v20 = v16;
  else
    v20 = v15;
  v21 = v20;

LABEL_20:
  return v21;
}

id IMUnformattedNumberForUnformattedNumber(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1)
  {
    if (qword_1EE1DDDA8 != -1)
      dispatch_once(&qword_1EE1DDDA8, &unk_1E2C43848);
    v2 = (void *)off_1EE1DDDA0(v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void *sub_1906A57F4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CPPhoneNumberCopyUnformattedStringForTextMessage", CFSTR("AppSupport"));
  off_1EE1DDDA0 = result;
  return result;
}

id IMUnformattedDisplayStringForNumber(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a1;
  v7 = v3;
  switch(a2)
  {
    case 3:
      v12 = (void *)IMPhoneNumberRefCopyForPhoneNumber(v3, 0, 0);
      IMUnformattedPhoneNumberForCFPhoneNumberRef(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        CFRelease(v12);
      break;
    case 2:
      objc_msgSend_lowercaseString(v3, v4, v5, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      v8 = v3;
LABEL_8:
      v13 = v8;
      v14 = objc_msgSend_length(v8, v9, v10, v11);
      goto LABEL_11;
    default:
      v13 = 0;
      break;
  }
  v14 = objc_msgSend_length(v13, v4, v5, v6);
LABEL_11:
  if (!v14)
  {
    if (IMStringIsEmail(v7))
    {
      objc_msgSend_lowercaseString(v7, v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (IMStringIsPhoneNumber(v7))
      {
        v24 = (void *)IMPhoneNumberRefCopyForPhoneNumber(v7, 0, 0);
        IMUnformattedPhoneNumberForCFPhoneNumberRef(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          CFRelease(v24);
        if (objc_msgSend_length(v25, v26, v27, v28))
        {
          v15 = v25;
          goto LABEL_13;
        }
        v13 = v25;
      }
      objc_msgSend_trimmedString(v7, v21, v22, v23);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v20;
    goto LABEL_24;
  }
  v15 = v13;
LABEL_13:
  v16 = v15;
  v13 = v15;
LABEL_24:

  return v16;
}

__CFString *IMFormattedDisplayStringForID(void *a1, _QWORD *a2)
{
  return IMFormattedDisplayStringForIDWithCountryCode(a1, 0, a2);
}

__CFString *IMFormattedDisplayStringForIDWithCountryCode(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  __CFString *v15;
  __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;

  v5 = a1;
  v6 = a2;
  if (IMStringIsEmail(v5))
  {
    if (a3)
      *a3 = 2;
    objc_msgSend_lowercaseString(v5, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (!IMStringIsPhoneNumber(v5))
  {
    objc_msgSend_trimmedString(v5, v11, v12, v13);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v21 = (__CFString *)v10;
    goto LABEL_16;
  }
  v14 = (const void *)IMPhoneNumberRefCopyForPhoneNumber(v5, v6, 0);
  IMFormattedPhoneNumberForCFPhoneNumberRef((uint64_t)v14);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v14)
    CFRelease(v14);
  if (a3)
    *a3 = 3;
  v16 = IMCopyStringWithLocalizedNumbers(v15);
  if (objc_msgSend_length(v16, v17, v18, v19))
    v20 = v16;
  else
    v20 = v15;
  v21 = v20;

LABEL_16:
  return v21;
}

uint64_t sub_1906A5FC8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 8), a2, (uint64_t)a2, a4);
}

uint64_t sub_1906A6280(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_postNotificationName_object_(a1, a2, a3, 0);
}

void _IMNotificationObservationHelperHelper(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _IMNotificationObservationHelper *v11;
  const char *v12;
  id value;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = a1;
  v11 = [_IMNotificationObservationHelper alloc];
  value = (id)objc_msgSend_initWithObserver_name_object_block_(v11, v12, (uint64_t)v10, (uint64_t)v9, v8, v7);

  objc_setAssociatedObject(v10, value, value, (void *)0x301);
}

_BYTE *IMFileLocationTrimFileName(_BYTE *result)
{
  unsigned __int8 **v1;
  int v2;
  unsigned __int8 *v3;
  int v4;

  if (result)
  {
    v1 = (unsigned __int8 **)result;
    result = (_BYTE *)*((_QWORD *)result + 1);
    if (!result)
    {
      result = *v1;
      v2 = **v1;
      if (**v1)
      {
        v3 = result + 1;
        do
        {
          if (v2 == 47)
            result = v3;
          v4 = *v3++;
          v2 = v4;
        }
        while (v4);
      }
      v1[1] = result;
    }
  }
  return result;
}

void _IMDebugLog(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = qword_1EE1DDDB8;
  v2 = a1;
  v3 = v2;
  if (v1 != -1)
  {
    dispatch_once(&qword_1EE1DDDB8, &unk_1E2C42F48);
    v2 = v3;
  }
  NSLog(CFSTR("%@: %@"), qword_1EE1DDDB0, v2);

}

void sub_1906A65B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v9, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EE1DDDB0;
  qword_1EE1DDDB0 = v7;

}

__n128 IMPerfMeasurementInit(uint64_t a1, __int128 *a2, const __CFString *a3)
{
  const __CFString *v5;
  __n128 result;
  __int128 v7;

  if (a1)
  {
    if (a3)
      v5 = a3;
    else
      v5 = &stru_1E2C46CC8;
    *(_QWORD *)(a1 + 56) = CFRetain(v5);
    *(_QWORD *)(a1 + 40) = ++qword_1EE1DDDC0;
    v7 = *a2;
    result = (__n128)a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(__n128 *)(a1 + 16) = result;
    *(_QWORD *)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 80) = 0;
    *(_QWORD *)(a1 + 64) = 0;
  }
  return result;
}

uint64_t IMPerfMeasurementStart(uint64_t result, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v4 = result;
    *(_QWORD *)(result + 72) = 0;
    *(_QWORD *)(result + 80) = 0;
    result = objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], a2, a3, a4);
    *(_QWORD *)(v4 + 64) = v5;
  }
  return result;
}

uint64_t IMPerfMeasurementInitAndStart(uint64_t result, __int128 *a2, const __CFString *a3)
{
  uint64_t v3;
  const __CFString *v4;
  CFTypeRef v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v11 = *a2;
  v12 = a2[1];
  v13 = *((_QWORD *)a2 + 4);
  if (result)
  {
    v3 = result;
    if (a3)
      v4 = a3;
    else
      v4 = &stru_1E2C46CC8;
    v5 = CFRetain(v4);
    v6 = ++qword_1EE1DDDC0;
    *(_OWORD *)v3 = v11;
    *(_OWORD *)(v3 + 16) = v12;
    *(_QWORD *)(v3 + 32) = v13;
    *(_QWORD *)(v3 + 40) = v6;
    *(_QWORD *)(v3 + 56) = v5;
    *(_QWORD *)(v3 + 64) = 0;
    *(_QWORD *)(v3 + 72) = 0;
    *(_QWORD *)(v3 + 80) = 0;
    result = objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v7, v8, v9);
    *(_QWORD *)(v3 + 64) = v10;
  }
  return result;
}

double IMPerfMeasurementStop(double *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  double result;
  double v6;

  if (a1)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], a2, a3, a4);
    v6 = result - a1[8];
    a1[9] = result;
    a1[10] = v6;
  }
  return result;
}

void IMPerfMeasurementRelease(uint64_t a1)
{
  const void *v2;

  if (a1)
  {
    v2 = *(const void **)(a1 + 56);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
}

void IMAVDaemonRequestConnection(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  _xpc_connection_s *v15;
  uint64_t v16;
  xpc_object_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _xpc_connection_s *v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  _QWORD handler[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  _xpc_connection_s *v48;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v13 = a4;
  if (qword_1EE1DDDD0 != -1)
    dispatch_once(&qword_1EE1DDDD0, &unk_1E2C42F68);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1906A6A84;
  v47 = sub_1906A6A94;
  v48 = (_xpc_connection_s *)0xAAAAAAAAAAAAAAAALL;
  v14 = (const char *)objc_msgSend_UTF8String(CFSTR("com.apple.imavagent.embedded.auth"), v10, v11, v12);
  v48 = IMXPCCreateConnectionForServiceWithQueue(1, 0, v14, (void *)qword_1EE1DDDC8, 0, 0);
  v15 = (_xpc_connection_s *)v44[5];
  if (v15)
  {
    v16 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1906A6A9C;
    handler[3] = &unk_1E2C46170;
    handler[4] = &v43;
    xpc_connection_set_event_handler(v15, handler);
    xpc_connection_resume((xpc_connection_t)v44[5]);
    v17 = xpc_dictionary_create(0, 0, 0);
    v18 = v17;
    if (v17)
    {
      xpc_dictionary_set_BOOL(v17, "setup-request", 1);
      IMInsertNSStringsToXPCDictionary(v18, "portName", v19, v20, v21, v22, v23, v24, (uint64_t)v7);
      if (objc_msgSend_count(v8, v25, v26, v27))
        IMInsertDictionariesToXPCDictionary(v18, "setupInfo", v28, v29, v30, v31, v32, v33, (uint64_t)v8);
      v34 = (_xpc_connection_s *)v44[5];
      dispatch_get_global_queue(2, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      v39[0] = v16;
      v39[1] = 3221225472;
      v39[2] = sub_1906A6AAC;
      v39[3] = &unk_1E2C46198;
      v40 = v13;
      v41 = &v43;
      xpc_connection_send_message_with_reply(v34, v18, v35, v39);

      v36[0] = v16;
      v36[1] = 3221225472;
      v36[2] = nullsub_4;
      v36[3] = &unk_1E2C461C0;
      v37 = v18;
      v38 = &v43;
      im_dispatch_after(v36, 2.0);

    }
  }
  else if (v13)
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }
  _Block_object_dispose(&v43, 8);

}

void sub_1906A6A18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1906A6A34()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.IMAVDaemonRequestConnectionQueue", v2);
  v1 = (void *)qword_1EE1DDDC8;
  qword_1EE1DDDC8 = (uint64_t)v0;

}

uint64_t sub_1906A6A84(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1906A6A94(uint64_t a1)
{

}

void sub_1906A6A9C(uint64_t a1, void *a2)
{
  im_local_object_peer_event_handler(*(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1906A6AAC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  id v33;

  v3 = a2;
  v33 = v3;
  if (v3)
  {
    xpc_dictionary_get_value(v3, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)IMCreateDictionaryFromXPCObjectWithStandardAllowlist(v11);
    if (objc_msgSend_count(v12, v13, v14, v15))
    {
      v16 = v12;
    }
    else
    {
      if (_IMWillLog(CFSTR("IMAVDaemon")))
        _IMAlwaysLog(0, CFSTR("IMAVDaemon"), CFSTR(" => Empty response, trying codable response"), v17, v18, v19, v20, v21, v32);
      IMGetXPCCodableFromDictionaryWithStandardAllowlist(v33, "response");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (_IMWillLog(CFSTR("IMAVDaemon")))
      {
        v25 = objc_msgSend_count(v16, v22, v23, v24);
        _IMAlwaysLog(0, CFSTR("IMAVDaemon"), CFSTR(" => Found response with %d keys"), v26, v27, v28, v29, v30, v25);
      }
    }

  }
  else
  {
    _IMWarn(CFSTR("Failed IMAVDaemonRequestPortConnection, no reply"), v4, v5, v6, v7, v8, v9, v10, v32);
    v16 = 0;
  }
  v31 = *(_QWORD *)(a1 + 32);
  if (v31)
    (*(void (**)(uint64_t, _QWORD, void *))(v31 + 16))(v31, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v16);

}

void IMDaemonRequestConnectionWithSync(void *a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  _xpc_connection_s *v17;
  uint64_t v18;
  xpc_object_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (**v33)(void *, NSObject *);
  _xpc_connection_s *v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _QWORD aBlock[4];
  id v40;
  uint64_t *v41;
  _QWORD handler[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  _xpc_connection_s *v48;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v15 = a5;
  if (qword_1ECD90AB0 != -1)
    dispatch_once(&qword_1ECD90AB0, &unk_1E2C432A8);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1906A6A84;
  v47 = sub_1906A6A94;
  v48 = (_xpc_connection_s *)0xAAAAAAAAAAAAAAAALL;
  v16 = (const char *)objc_msgSend_UTF8String(CFSTR("com.apple.imagent.embedded.auth"), v12, v13, v14);
  v48 = IMXPCCreateConnectionForServiceWithQueue(1, 0, v16, (void *)qword_1ECD90AA8, 0, 0);
  v17 = (_xpc_connection_s *)v44[5];
  if (v17)
  {
    v18 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1906A6F04;
    handler[3] = &unk_1E2C46170;
    handler[4] = &v43;
    xpc_connection_set_event_handler(v17, handler);
    xpc_connection_resume((xpc_connection_t)v44[5]);
    v19 = xpc_dictionary_create(0, 0, 0);
    v26 = v19;
    if (v19)
    {
      IMInsertNSStringsToXPCDictionary(v19, "portName", v20, v21, v22, v23, v24, v25, (uint64_t)v9);
      IMInsertDictionariesToXPCDictionary(v26, "setupInfo", v27, v28, v29, v30, v31, v32, (uint64_t)v10);
      xpc_dictionary_set_BOOL(v26, "setup-request", 1);
      aBlock[0] = v18;
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1906A6F14;
      aBlock[3] = &unk_1E2C461E8;
      v41 = &v43;
      v40 = v15;
      v33 = (void (**)(void *, NSObject *))_Block_copy(aBlock);
      v34 = (_xpc_connection_s *)v44[5];
      if (a4)
      {
        v35 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v44[5], v26);
        v33[2](v33, v35);
      }
      else
      {
        dispatch_get_global_queue(2, 0);
        v35 = objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message_with_reply(v34, v26, v35, v33);
      }

      v36[0] = v18;
      v36[1] = 3221225472;
      v36[2] = nullsub_5;
      v36[3] = &unk_1E2C461C0;
      v37 = v26;
      v38 = &v43;
      im_dispatch_after(v36, 2.0);

    }
  }
  else if (v15)
  {
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
  }
  _Block_object_dispose(&v43, 8);

}

void sub_1906A6E94(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1906A6EB4()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.IMDaemonRequestConnectionQueue", v2);
  v1 = (void *)qword_1ECD90AA8;
  qword_1ECD90AA8 = (uint64_t)v0;

}

void sub_1906A6F04(uint64_t a1, void *a2)
{
  im_local_object_peer_event_handler(*(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1906A6F14(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  xpc_object_t xdict;

  xdict = a2;
  if (!xdict || MEMORY[0x19400EE48](xdict) != MEMORY[0x1E0C812F8])
  {
    _IMWarn(CFSTR("Failed IMDRequestPortConnection, no reply"), v3, v4, v5, v6, v7, v8, v9, v39);
    xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)(a1 + 32);
    if (!v12)
      goto LABEL_16;
    goto LABEL_15;
  }
  xpc_dictionary_get_value(xdict, "response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)IMCreateDictionaryFromXPCObjectWithStandardAllowlist(v13);
  if (objc_msgSend_count(v14, v15, v16, v17))
  {
    v10 = v14;
  }
  else
  {
    if (_IMWillLog(CFSTR("IMDaemon")))
      _IMAlwaysLog(0, CFSTR("IMDaemon"), CFSTR(" => Empty response, trying codable response"), v18, v19, v20, v21, v22, v39);
    IMGetXPCCodableFromDictionaryWithStandardAllowlist(xdict, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (_IMWillLog(CFSTR("IMDaemon")))
    {
      v26 = objc_msgSend_count(v10, v23, v24, v25);
      _IMAlwaysLog(0, CFSTR("IMDaemon"), CFSTR(" => Found response with %d keys"), v27, v28, v29, v30, v31, v26);
    }
    if (!objc_msgSend_count(v10, v23, v24, v25))
      _IMWarn(CFSTR("Bad response from daemon for setup info"), v32, v33, v34, v35, v36, v37, v38, v39);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
LABEL_15:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v11, v10);
  }
LABEL_16:

}

void IMDaemonRequestConnection(void *a1, void *a2, void *a3, void *a4)
{
  IMDaemonRequestConnectionWithSync(a1, a2, a3, 0, a4);
}

void IMDaemonRequestPlugInConnection(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  _xpc_connection_s *v15;
  uint64_t v16;
  xpc_object_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _xpc_connection_s *v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _QWORD handler[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  _xpc_connection_s *v45;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v13 = a4;
  if (qword_1EE1DDDE0 != -1)
    dispatch_once(&qword_1EE1DDDE0, &unk_1E2C46208);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_1906A6A84;
  v44 = sub_1906A6A94;
  v45 = (_xpc_connection_s *)0xAAAAAAAAAAAAAAAALL;
  v14 = (const char *)objc_msgSend_UTF8String(CFSTR("com.apple.imagent.embedded.auth"), v10, v11, v12);
  v45 = IMXPCCreateConnectionForServiceWithQueue(1, 0, v14, (void *)qword_1EE1DDDD8, 0, 0);
  v15 = (_xpc_connection_s *)v41[5];
  if (v15)
  {
    v16 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1906A7368;
    handler[3] = &unk_1E2C46170;
    handler[4] = &v40;
    xpc_connection_set_event_handler(v15, handler);
    xpc_connection_resume((xpc_connection_t)v41[5]);
    v17 = xpc_dictionary_create(0, 0, 0);
    v18 = v17;
    if (v17)
    {
      xpc_dictionary_set_BOOL(v17, "setup-request", 1);
      xpc_dictionary_set_BOOL(v18, "plugin-request", 1);
      IMInsertNSStringsToXPCDictionary(v18, "portName", v19, v20, v21, v22, v23, v24, (uint64_t)v7);
      if (objc_msgSend_count(v8, v25, v26, v27))
        IMInsertDictionariesToXPCDictionary(v18, "setupInfo", v28, v29, v30, v31, v32, v33, (uint64_t)v8);
      v34 = (_xpc_connection_s *)v41[5];
      dispatch_get_global_queue(2, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      v36[0] = v16;
      v36[1] = 3221225472;
      v36[2] = sub_1906A7378;
      v36[3] = &unk_1E2C46198;
      v37 = v13;
      v38 = &v40;
      xpc_connection_send_message_with_reply(v34, v18, v35, v36);

    }
  }
  else if (v13)
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }
  _Block_object_dispose(&v40, 8);

}

void sub_1906A72FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1906A7318()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.IMDaemonPlugInRequestConnectionQueue", v2);
  v1 = (void *)qword_1EE1DDDD8;
  qword_1EE1DDDD8 = (uint64_t)v0;

}

void sub_1906A7368(uint64_t a1, void *a2)
{
  im_local_object_peer_event_handler(*(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1906A7378(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;

  v3 = a2;
  v15 = v3;
  if (v3)
  {
    xpc_dictionary_get_value(v3, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)IMCreateDictionaryFromXPCObjectWithStandardAllowlist(v11);
  }
  else
  {
    _IMWarn(CFSTR("Failed IMDRequestPortConnection, no reply"), v4, v5, v6, v7, v8, v9, v10, v14);
    v12 = 0;
    v11 = 0;
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v12);

}

id IMRKAttributedTokenTypeKey()
{
  if (qword_1EE1DD680 != -1)
    dispatch_once(&qword_1EE1DD680, &unk_1E2C42F88);
  return (id)qword_1EE1DD678;
}

void sub_1906A7450()
{
  id *v0;

  v0 = (id *)IMWeakLinkSymbol("RKAttributedTokenTypeKey", CFSTR("ResponseKit"));
  if (v0)
    objc_storeStrong((id *)&qword_1EE1DD678, *v0);
}

id IMRKAttributedTokenPhotosharingType()
{
  if (qword_1EE1DD670 != -1)
    dispatch_once(&qword_1EE1DD670, &unk_1E2C43468);
  return (id)qword_1EE1DD668;
}

void sub_1906A74CC()
{
  id *v0;

  v0 = (id *)IMWeakLinkSymbol("RKAttributedTokenPhotosharingType", CFSTR("ResponseKit"));
  if (v0)
    objc_storeStrong((id *)&qword_1EE1DD668, *v0);
}

const __CFString *IMRKAttributedTokenPhotosharingKeywordsKey()
{
  return CFSTR("keywords");
}

const __CFString *IMRKAttributedTokenPhotosharingKeywordRangesKey()
{
  return CFSTR("keywordranges");
}

uint64_t sub_1906A7560()
{
  uint64_t result;

  result = IMWeakLinkClass(CFSTR("RKMessageResponseManager"), CFSTR("ResponseKit"));
  qword_1EE1DD660 = result;
  return result;
}

uint64_t sub_1906A75F4()
{
  uint64_t result;

  result = IMWeakLinkClass(CFSTR("RKResponse"), CFSTR("ResponseKit"));
  qword_1EE1DDDE8 = result;
  return result;
}

const void *IMSharedResourcesDirectory()
{
  uid_t v0;
  const void *Value;
  char *pw_dir;
  passwd *v3;

  pthread_mutex_lock(&stru_1EE1DC8A8);
  v0 = geteuid();
  if (!v0)
    v0 = getuid();
  if (qword_1EE1DD8A8)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_1EE1DD8A8, (const void *)v0);
    if (Value)
      goto LABEL_13;
  }
  else
  {
    qword_1EE1DD8A8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  }
  pw_dir = getenv("IPHONE_SHARED_RESOURCES_DIRECTORY");
  if (pw_dir || (v3 = getpwuid(v0)) != 0 && (pw_dir = v3->pw_dir) != 0)
  {
    Value = CFStringCreateWithFileSystemRepresentation(0, pw_dir);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1EE1DD8A8, (const void *)v0, Value);
      CFRelease(Value);
    }
  }
  else
  {
    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&stru_1EE1DC8A8);
  return Value;
}

void IMResetCachedUserSettings()
{
  dword_1EE1DC850 = -1;
}

uint64_t IMResetCachedCarrierSettings()
{
  uint64_t result;

  result = CFPreferencesSynchronize(CFSTR("com.apple.carrier"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  dword_1EE1DC854 = -1;
  dword_1EE1DC800 = -1;
  dword_1EE1DD114 = -1;
  dword_1EE1DD118 = -1;
  dword_1EE1DC7FC = -1;
  dword_1EE1DC848 = -1;
  return result;
}

uint64_t IMSMSEnabled()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = (void *)IMWeakLinkClass(CFSTR("FTDeviceSupport"), CFSTR("FTServices"));
  objc_msgSend_sharedInstance(v0, v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_supportsSMS(v4, v5, v6, v7);

  return v8;
}

const __CFString *IMSMSFallbackEnabled()
{
  const void *v0;
  const __CFString *result;
  const __CFString *v2;
  uint64_t v3;

  v0 = IMSharedResourcesDirectory();
  result = CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"), v0, CFSTR("com.apple.MobileSMS"));
  if (result)
  {
    v2 = result;
    v3 = IMGetDomainBoolForKeyWithDefaultValue(result, CFSTR("SendAsSMS"), 0);
    CFRelease(v2);
    return (const __CFString *)v3;
  }
  return result;
}

uint64_t IMMMSMaximumSlideCount()
{
  int v0;
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFNumber *Value;
  int valuePtr;

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    return 0;
  v0 = dword_1EE1DC7FC;
  if (dword_1EE1DC7FC == -1)
  {
    dword_1EE1DC7FC = 0x7FFFFFFF;
    v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.carrier"));
    if (v1)
    {
      v2 = v1;
      valuePtr = 0;
      Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("MaxSlidesPerMessage"));
      if (Value)
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      CFRelease(v2);
      if (valuePtr >= 1)
        dword_1EE1DC7FC = valuePtr;
    }
    sub_1906A79BC();
    return dword_1EE1DC7FC;
  }
  return v0;
}

BOOL IMMMSEnabled()
{
  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  return qword_1ECD90AA0 != 0;
}

void sub_1906A79BC()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if ((byte_1EE1DD781 & 1) == 0)
  {
    byte_1EE1DD781 = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1906AB420, (CFStringRef)*MEMORY[0x1E0CA7488], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

uint64_t IMMMSMaximumSlideDuration()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const __CFNumber *Value;
  int valuePtr;

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    return 0;
  v0 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.carrier"));
  if (!v0)
    return 0x7FFFFFFFLL;
  v1 = v0;
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(v0, CFSTR("MaxSMILDuration"));
  if (Value)
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  CFRelease(v1);
  if (valuePtr <= 0)
    return 0x7FFFFFFFLL;
  else
    return valuePtr;
}

uint64_t IMMMSMaximumMessageByteCount(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  SInt32 IntValue;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  const __CFNumber *Value;
  CFTypeID v25;
  char v26;
  int v27;
  SInt32 valuePtr;
  uint8_t buf[16];

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    return 0x7FFFFFFFLL;
  if (qword_1EE1DD710 != -1)
    dispatch_once(&qword_1EE1DD710, &unk_1E2C42FA8);
  objc_msgSend_sharedInstance((void *)qword_1EE1DD708, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_deviceType(v4, v5, v6, v7);

  if (v8 == 2)
  {
    if (dword_1EE1DC848 != -1)
      return dword_1EE1DC848;
    dword_1EE1DC848 = 0x100000;
    v9 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.mms_override"));
    v10 = v9;
    if (!v9 || !CFDictionaryGetValue(v9, CFSTR("MaxMessageSize")))
    {
      v22 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.carrier"));
      if (v22)
      {
        v23 = v22;
        Value = (const __CFNumber *)CFDictionaryGetValue(v22, CFSTR("MaxMessageSize"));
        v27 = 0;
        if (Value)
          CFNumberGetValue(Value, kCFNumberIntType, &v27);
        CFRelease(v23);
        if (v27 >= 1)
          dword_1EE1DC848 = v27;
      }
      sub_1906A79BC();
      if (!v10)
        return dword_1EE1DC848;
      goto LABEL_32;
    }
    v11 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("MaxMessageSize"));
    valuePtr = 0;
    if (v11)
    {
      v12 = v11;
      v13 = CFGetTypeID(v11);
      if (v13 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        IntValue = valuePtr;
        goto LABEL_30;
      }
      v25 = CFGetTypeID(v12);
      if (v25 == CFStringGetTypeID())
      {
        IntValue = CFStringGetIntValue((CFStringRef)v12);
LABEL_30:
        if (IntValue >= 1)
          dword_1EE1DC848 = IntValue;
      }
    }
LABEL_32:
    CFRelease(v10);
    return dword_1EE1DC848;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("MMS Max Size");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v16, OS_LOG_TYPE_INFO, "We are a relay device, returning 2 Megabytes", buf, 2u);
    }

  }
  IMLogString();
  if (_IMWillLog(CFSTR("MMS Max Size")))
    _IMAlwaysLog(0, CFSTR("MMS Max Size"), CFSTR("We are a relay device, returning 2 Megabytes"), v17, v18, v19, v20, v21, v26);
  return 0x200000;
}

uint64_t sub_1906A7D64()
{
  uint64_t result;

  result = IMWeakLinkClass(CFSTR("FTDeviceSupport"), CFSTR("FTServices"));
  qword_1EE1DD708 = result;
  return result;
}

id IMMMSAllowableImageDimensions(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = IMMMSMaxImageDimension();
  if ((int)v7 >= 160)
  {
    do
    {
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v9, (uint64_t)v8, v10);

      v7 = (int)((double)(int)v7 * 0.9);
    }
    while ((int)v7 > 159);
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_19066D000, v11, OS_LOG_TYPE_INFO, "Allowable image dimensions: %@", buf, 0xCu);
    }

  }
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("Allowable image dimensions: %@"), v12, v13, v14, v15, v16, (char)v4);
  return v4;
}

uint64_t IMMMSMaxImageDimension()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    return 0x7FFFFFFFLL;
  IMGetDomainValueForKey(CFSTR("com.apple.carrier"), CFSTR("MMS"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v0;
  if (v0)
  {
    objc_msgSend_objectForKey_(v0, v1, (uint64_t)CFSTR("MaxImageDimension"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    if (v4)
      LODWORD(v9) = objc_msgSend_intValue(v4, v5, v6, v7);
    else
      LODWORD(v9) = 0x7FFFFFFF;

  }
  else
  {
    LODWORD(v9) = 0x7FFFFFFF;
  }
  v9 = (int)v9;

  return v9;
}

uint64_t IMMMSMaxVideoBitrate()
{
  int v0;
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFNumber *Value;
  int v4;
  int valuePtr;

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    return 0x7FFFFFFFLL;
  v0 = dword_1EE1DD114;
  if (dword_1EE1DD114 == -1)
  {
    dword_1EE1DD114 = 0x20000;
    v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.carrier"));
    if (v1)
    {
      v2 = v1;
      valuePtr = 0;
      Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("MaxVideoBitrate"));
      if (Value)
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      CFRelease(v2);
      v4 = valuePtr;
      if (valuePtr >= 1)
      {
        if (valuePtr <= 0x10000)
          v4 = 0x10000;
        dword_1EE1DD114 = v4;
      }
    }
    sub_1906A79BC();
    return dword_1EE1DD114;
  }
  return v0;
}

BOOL IMMMSSupportsH264Video()
{
  int v0;
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFNumber *Value;
  int valuePtr;

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    return 0;
  v0 = dword_1EE1DD118;
  if (dword_1EE1DD118 == -1)
  {
    dword_1EE1DD118 = 0;
    v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.carrier"));
    if (v1)
    {
      v2 = v1;
      valuePtr = 0;
      Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("SupportsH264Video"));
      if (Value)
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      CFRelease(v2);
      if (valuePtr >= 1)
        dword_1EE1DD118 = 1;
    }
    sub_1906A79BC();
    v0 = dword_1EE1DD118;
  }
  return v0 != 0;
}

uint64_t IMMMSMaxRecipients()
{
  int v0;
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFNumber *Value;
  int v4;
  int valuePtr;

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    return 0x7FFFFFFFLL;
  v0 = dword_1EE1DC854;
  if (dword_1EE1DC854 == -1)
  {
    dword_1EE1DC854 = 0x7FFFFFFF;
    v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.carrier"));
    if (v1)
    {
      v2 = v1;
      valuePtr = 0;
      Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("MaxRecipients"));
      if (Value)
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      CFRelease(v2);
      v4 = valuePtr;
      if (valuePtr >= 1)
      {
        if (valuePtr <= 10)
          v4 = 10;
        dword_1EE1DC854 = v4;
      }
    }
    sub_1906A79BC();
    return dword_1EE1DC854;
  }
  return v0;
}

uint64_t IMSMSMaxRecipients()
{
  int v0;
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFNumber *Value;
  int v4;
  int valuePtr;

  v0 = dword_1EE1DC800;
  if (dword_1EE1DC800 == -1)
  {
    dword_1EE1DC800 = 0x7FFFFFFF;
    v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("SMS"), CFSTR("com.apple.carrier"));
    if (v1)
    {
      v2 = v1;
      valuePtr = 0;
      Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("MaxRecipients"));
      if (Value)
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      CFRelease(v2);
      v4 = valuePtr;
      if (valuePtr >= 1)
      {
        if (valuePtr <= 10)
          v4 = 10;
        dword_1EE1DC800 = v4;
      }
    }
    sub_1906A79BC();
    return dword_1EE1DC800;
  }
  return v0;
}

BOOL IMMMSRestrictedModeEnabled()
{
  return sub_1906A8330(0);
}

BOOL sub_1906A8330(int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v9;
  const __CFString *v10;
  const __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (dword_1EE1DC850 == -1 || a1 != 0)
  {
    if ((byte_1EE1DD622 & 1) == 0)
    {
      byte_1EE1DD622 = 1;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory("Restricted");
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19066D000, v2, OS_LOG_TYPE_INFO, "Now listening for restricted mode changed notifications", buf, 2u);
        }

      }
      IMLogString();
      if (_IMWillLog(CFSTR("Restricted")))
        _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("Now listening for restricted mode changed notifications"), v3, v4, v5, v6, v7, v19);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1906AB488, CFSTR("com.apple.MobileSMS.MMSRestricted.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v9 = IMSharedResourcesDirectory();
    v10 = CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"), v9, CFSTR("com.apple.MobileSMS"));
    v11 = v10;
    if (v10)
    {
      dword_1EE1DC850 = IMGetDomainBoolForKey(v10, CFSTR("MMSRestricted"));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory("Restricted");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v21 = dword_1EE1DC850;
          _os_log_impl(&dword_19066D000, v12, OS_LOG_TYPE_INFO, "Restricted Mode enabled: %d", buf, 8u);
        }

      }
      IMLogString();
      if (_IMWillLog(CFSTR("Restricted")))
        _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("Restricted Mode enabled: %d"), v13, v14, v15, v16, v17, dword_1EE1DC850);
      CFRelease(v11);
    }
  }
  return dword_1EE1DC850 != 0;
}

BOOL IMMMSPartCanBeSent(void *a1, uint64_t a2, double a3, double a4)
{
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  const __CFString *v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v57;
  uint8_t buf[4];
  double v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  if (!sub_1906A8330(0))
  {
    v21 = 1;
    goto LABEL_64;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Restricted");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v59 = *(double *)&v7;
      v60 = 2048;
      v61 = a2;
      v62 = 2048;
      v63 = a3;
      v64 = 2048;
      v65 = a4;
      _os_log_impl(&dword_19066D000, v8, OS_LOG_TYPE_INFO, "will check conformance for %@: %lld bytes, (%.0f,%.0f)", buf, 0x2Au);
    }

  }
  v57 = (char)v7;
  IMLogString();
  if (_IMWillLog(CFSTR("Restricted")))
    _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("will check conformance for %@: %lld bytes, (%.0f,%.0f)"), v9, v10, v11, v12, v13, (char)v7);
  v14 = 0;
  while (CFStringCompare(*(__CFString **)((char *)&off_1E2C46268 + v14), v7, 1uLL))
  {
    v14 += 16;
    if (v14 == 208)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory("Restricted");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19066D000, v15, OS_LOG_TYPE_INFO, "Not found in restricted content class", buf, 2u);
        }

      }
      IMLogString();
      if (_IMWillLog(CFSTR("Restricted")))
        _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("Not found in restricted content class"), v16, v17, v18, v19, v20, v57);
      v21 = 0;
      goto LABEL_64;
    }
  }
  v22 = *((_BYTE *)&off_1E2C46268 + v14 + 8);
  if (a2 > 307200)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("Restricted");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v59 = *(double *)&a2;
        v60 = 1024;
        LODWORD(v61) = 307200;
        _os_log_impl(&dword_19066D000, v23, OS_LOG_TYPE_INFO, "exceeds max message size (%lld, max: %d)", buf, 0x12u);
      }

    }
    v57 = a2;
    IMLogString();
    if (_IMWillLog(CFSTR("Restricted")))
      _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("exceeds max message size (%lld, max: %d)"), v24, v25, v26, v27, v28, a2);
    v29 = 0;
    if ((v22 & 1) == 0)
      goto LABEL_51;
    goto LABEL_29;
  }
  v29 = 1;
  if ((v22 & 1) != 0)
  {
LABEL_29:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("Restricted");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v30, OS_LOG_TYPE_INFO, "will check image conformance", buf, 2u);
      }

    }
    IMLogString();
    if (_IMWillLog(CFSTR("Restricted")))
      _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("will check image conformance"), v31, v32, v33, v34, v35, v57);
    if (a3 > 640.0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory("Restricted");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v59 = a3;
          v60 = 2048;
          v61 = 0x4084000000000000;
          _os_log_impl(&dword_19066D000, v36, OS_LOG_TYPE_INFO, "exceeds dimension width (%.0f, max: %.0f)", buf, 0x16u);
        }

      }
      IMLogString();
      if (_IMWillLog(CFSTR("Restricted")))
        _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("exceeds dimension width (%.0f, max: %.0f)"), v37, v38, v39, v40, v41, SLOBYTE(a3));
      v29 = 0;
    }
    if (a4 > 480.0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory("Restricted");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v59 = a4;
          v60 = 2048;
          v61 = 0x407E000000000000;
          _os_log_impl(&dword_19066D000, v42, OS_LOG_TYPE_INFO, "exceeds dimension height (%.0f, max: %.0f)", buf, 0x16u);
        }

      }
      IMLogString();
      if (_IMWillLog(CFSTR("Restricted")))
        _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("exceeds dimension height (%.0f, max: %.0f)"), v43, v44, v45, v46, v47, SLOBYTE(a4));
      v29 = 0;
    }
  }
LABEL_51:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Restricted");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      if (v29)
        v49 = CFSTR("YES");
      else
        v49 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v59 = *(double *)&v49;
      _os_log_impl(&dword_19066D000, v48, OS_LOG_TYPE_INFO, "Accepted? %@", buf, 0xCu);
    }

  }
  if (v29)
    v50 = CFSTR("YES");
  else
    v50 = CFSTR("NO");
  IMLogString();
  if (_IMWillLog(CFSTR("Restricted")))
    _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("Accepted? %@"), v51, v52, v53, v54, v55, (char)v50);
  v21 = v29 != 0;
LABEL_64:

  return v21;
}

void sub_1906A8CDC()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  im_notify_register_dispatch("com.apple.MobileSMS.MMSCapable", (int *)&unk_1ECD90A90, (uint64_t *)&qword_1ECD90AA0, 1, MEMORY[0x1E0C80D38], &unk_1E2C438E8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1906A8DB4, CFSTR("com.apple.MobileSMS.MMSEnabled.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t sub_1906A8D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  qword_1ECD90AA0 = a3;
  result = CFPreferencesSynchronize(CFSTR("com.apple.carrier"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  dword_1EE1DC854 = -1;
  dword_1EE1DC800 = -1;
  dword_1EE1DD114 = -1;
  dword_1EE1DD118 = -1;
  dword_1EE1DC7FC = -1;
  dword_1EE1DC848 = -1;
  dword_1EE1DC850 = -1;
  return result;
}

void sub_1906A8DB4()
{
  void *v0;
  CFStringRef v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint8_t buf[16];

  v0 = (void *)MEMORY[0x19400E788]();
  v8 = IMSharedResourcesDirectory();
  v1 = CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"));
  CFRelease(v1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Enablement");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v2, OS_LOG_TYPE_INFO, "Refresh: User setting for MMS changed", buf, 2u);
    }

  }
  IMLogString();
  if (_IMWillLog(CFSTR("Enablement")))
    _IMAlwaysLog(0, CFSTR("Enablement"), CFSTR("Refresh: User setting for MMS changed"), v3, v4, v5, v6, v7, v8);
  dispatch_async(MEMORY[0x1E0C80D38], &unk_1E2C46358);
  objc_autoreleasePoolPop(v0);
}

BOOL IMReadMMSUserOverride()
{
  const void *v0;
  const __CFString *v1;
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v0 = IMSharedResourcesDirectory();
  v1 = CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"), v0, CFSTR("com.apple.MobileSMS"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MMSEnabled"), v1, &keyExistsAndHasValidFormat);
  CFRelease(v1);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

uint64_t IMReadSMSRelayUserOverride()
{
  return 1;
}

uint64_t IMShouldShowSMSRelayRestriction()
{
  return 0;
}

uint64_t IMSMSRelayDisabled()
{
  return 0;
}

const __CFBoolean *IMShouldURLifyUnquotedShorts()
{
  const __CFBoolean *result;
  const __CFBoolean *v1;
  int Value;

  result = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("URLifyUnquotedShorts"), CFSTR("com.apple.carrier"));
  if (result)
  {
    v1 = result;
    Value = CFBooleanGetValue(result);
    CFRelease(v1);
    return (const __CFBoolean *)(Value != 0);
  }
  return result;
}

uint64_t IMMMSGroupTextOnlyMessagesSendAsMMS(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  const __CFString *v10;
  int AppBooleanValue;
  _BOOL8 v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const __CFBoolean *Value;
  Boolean keyExistsAndHasValidFormat;

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    return 0;
  if (qword_1EE1DD730 != -1)
    dispatch_once(&qword_1EE1DD730, &unk_1E2C46338);
  objc_msgSend_sharedInstance((void *)qword_1EE1DD728, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_deviceType(v4, v5, v6, v7);

  if (v8 != 2)
    return 1;
  v9 = IMSharedResourcesDirectory();
  v10 = CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"), v9, CFSTR("com.apple.MobileSMS"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MMSGroupModeOverride"), v10, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v12 = AppBooleanValue != 0;
  }
  else
  {
    v13 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.carrier"));
    if (v13)
    {
      v14 = v13;
      Value = (const __CFBoolean *)CFDictionaryGetValue(v13, CFSTR("GroupModeEnabled"));
      if (Value)
        v12 = CFBooleanGetValue(Value) != 0;
      else
        v12 = 1;
      CFRelease(v14);
    }
    else
    {
      v12 = 1;
    }
  }
  if (v10)
    CFRelease(v10);
  return v12;
}

uint64_t sub_1906A912C()
{
  uint64_t result;

  result = IMWeakLinkClass(CFSTR("FTDeviceSupport"), CFSTR("FTServices"));
  qword_1EE1DD728 = result;
  return result;
}

double IMMMSMaximumAudioDuration()
{
  void *v0;
  void **v1;
  void *v2;

  v0 = (void *)qword_1EE1DDDF8;
  if (!qword_1EE1DDDF8)
  {
    v1 = (void **)IMWeakLinkSymbol("AVAssetExportPresetAudioOnlyMMS", CFSTR("AVFoundation"));
    if (v1)
      v2 = *v1;
    else
      v2 = 0;
    objc_storeStrong((id *)&qword_1EE1DDDF8, v2);
    v0 = (void *)qword_1EE1DDDF8;
  }
  return sub_1906A91B4(v0);
}

double sub_1906A91B4(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  double v15;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[24];

  v1 = a1;
  if (qword_1EE1DDE18 != -1)
    dispatch_once(&qword_1EE1DDE18, &unk_1E2C46378);
  if (qword_1EE1DDE28 != -1)
    dispatch_once(&qword_1EE1DDE28, &unk_1E2C46398);
  v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v6 = IMMMSMaximumMessageByteCount((uint64_t)v2, v3, v4, v5);
  v9 = (void *)objc_msgSend_initWithLongLong_(v2, v7, v6, v8);
  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  v14 = (void *)objc_msgSend_initWithObjectsAndKeys_(v10, v11, (uint64_t)v9, v12, CFSTR("fileLengthLimit"), 0);
  memset(v19, 170, sizeof(v19));
  if (qword_1EE1DDE10)
    objc_msgSend_maximumDurationForPreset_properties_((void *)qword_1EE1DDE10, v13, (uint64_t)v1, (uint64_t)v14);
  else
    memset(v19, 0, sizeof(v19));
  v17 = *(_OWORD *)v19;
  v18 = *(_QWORD *)&v19[16];
  v15 = off_1EE1DDE20(&v17);

  return v15;
}

double IMMMSMaximumVideoDuration()
{
  void *v0;
  void **v1;
  void *v2;

  v0 = (void *)qword_1EE1DDE00;
  if (!qword_1EE1DDE00)
  {
    v1 = (void **)IMWeakLinkSymbol("AVAssetExportPresetMMS", CFSTR("AVFoundation"));
    if (v1)
      v2 = *v1;
    else
      v2 = 0;
    objc_storeStrong((id *)&qword_1EE1DDE00, v2);
    v0 = (void *)qword_1EE1DDE00;
  }
  return sub_1906A91B4(v0);
}

id IMMMSEmailAddressToMatch()
{
  const __CFDictionary *v0;
  CFStringRef v1;
  const __CFBoolean *Value;
  int v3;
  const void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (qword_1ECD90A98 != -1)
    dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
  if (!qword_1ECD90AA0)
    goto LABEL_11;
  v0 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("MMS"), CFSTR("com.apple.carrier"));
  if (!v0)
    goto LABEL_11;
  v1 = (CFStringRef)v0;
  Value = (const __CFBoolean *)CFDictionaryGetValue(v0, CFSTR("ShowMMSEmailAddress"));
  if (!Value)
  {
    v5 = 0;
LABEL_13:
    CFRelease(v1);
    return v5;
  }
  v3 = CFBooleanGetValue(Value);
  CFRelease(v1);
  if (!v3)
  {
LABEL_11:
    v5 = 0;
    return v5;
  }
  v4 = IMSharedResourcesDirectory();
  v1 = CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"), v4, CFSTR("com.apple.MobileSMS"));
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("MMSEmailAddress"), v1);
  if ((byte_1EE1DDE08 & 1) == 0)
  {
    byte_1EE1DDE08 = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1906A9470, CFSTR("com.apple.MobileSMS.MMSEmailAddress.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  if (v1)
    goto LABEL_13;
  return v5;
}

void sub_1906A9470()
{
  const void *v0;
  CFStringRef v1;

  v0 = IMSharedResourcesDirectory();
  v1 = CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"), v0, CFSTR("com.apple.MobileSMS"));
  if (v1)
    CFRelease(v1);
}

uint64_t IMiMessageShouldSendLowResolutionOnly()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int isHostingWiFiHotSpot;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  if (IMGetCachedDomainBoolForKey(CFSTR("com.apple.imessage"), CFSTR("AlwaysDownloadHighResolutionImages")))
    return 0;
  objc_msgSend_sharedInstance(IMMobileNetworkManager, v0, v1, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isWiFiEnabled(v4, v5, v6, v7))
  {
    objc_msgSend_sharedInstance(IMMobileNetworkManager, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isWiFiUsable(v11, v12, v13, v14))
    {
      objc_msgSend_sharedInstance(IMMobileNetworkManager, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      isHostingWiFiHotSpot = objc_msgSend_isHostingWiFiHotSpot(v18, v19, v20, v21);

    }
    else
    {
      isHostingWiFiHotSpot = 1;
    }

  }
  else
  {
    isHostingWiFiHotSpot = 1;
  }

  objc_msgSend_sharedInstance(IMMobileNetworkManager, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = isHostingWiFiHotSpot & (objc_msgSend_hasLTEDataConnection(v26, v27, v28, v29) ^ 1);

  return v3;
}

void IMiMessageMaxTransferFileSizeForWifi(unint64_t *a1, unint64_t *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v5 = a3;
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("att-wifi-max-file-size"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);

  objc_msgSend_objectForKey_(v5, v13, (uint64_t)CFSTR("att-cellular-max-file-size"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
  if (v12)
    v24 = v12;
  else
    v24 = 10485760;
  if (!v19)
    v19 = 0x400000;
  if (a1)
  {
    if (qword_1ECD90A98 != -1)
      dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
    if (qword_1ECD90AA0)
    {
      v20 = IMMMSMaximumMessageByteCount(v20, v21, v22, v23);
      if (v24 <= v20)
        v24 = v20;
    }
    *a1 = v24;
  }
  if (a2)
  {
    if (qword_1ECD90A98 != -1)
      dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
    if (qword_1ECD90AA0)
    {
      v25 = IMMMSMaximumMessageByteCount(v20, v21, v22, v23);
      if (v19 <= v25)
        v19 = v25;
    }
    *a2 = v19;
  }
}

uint64_t IMiMessageMaxTransferAudioFileSizeForWifi(uint64_t *a1, unint64_t *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v5 = a3;
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("att-wifi-audio-max-file-size"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);

  objc_msgSend_objectForKey_(v5, v13, (uint64_t)CFSTR("att-wifi-audio-cellular-file-size"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
  if (v12)
    v24 = v12;
  else
    v24 = 10485760;
  if (v19)
    v25 = v19;
  else
    v25 = 0x400000;
  if (a1)
    *a1 = v24;
  if (a2)
  {
    if (qword_1ECD90A98 != -1)
      dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
    if (qword_1ECD90AA0)
    {
      v26 = IMMMSMaximumMessageByteCount(v20, v21, v22, v23);
      if (v25 <= v26)
        v25 = v26;
    }
    *a2 = v25;
  }
  return v24;
}

uint64_t IMiMessageMaxTransferVideoFileSizeForWifi(uint64_t *a1, unint64_t *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v5 = a3;
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("att-wifi-video-max-file-size"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);

  objc_msgSend_objectForKey_(v5, v13, (uint64_t)CFSTR("att-wifi-video-cellular-file-size"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
  if (v12)
    v24 = v12;
  else
    v24 = 10485760;
  if (v19)
    v25 = v19;
  else
    v25 = 0x400000;
  if (a1)
    *a1 = v24;
  if (a2)
  {
    if (qword_1ECD90A98 != -1)
      dispatch_once(&qword_1ECD90A98, &unk_1E2C43868);
    if (qword_1ECD90AA0)
    {
      v26 = IMMMSMaximumMessageByteCount(v20, v21, v22, v23);
      if (v25 <= v26)
        v25 = v26;
    }
    *a2 = v25;
  }
  return v24;
}

unint64_t IMiMessageMaxFileSizeForUTI(void *a1, _BYTE *a2)
{
  __CFString *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char isWiFiUsable;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int hasLTEDataConnection;
  int v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  const __CFString *v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  const __CFString *v63;
  const __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  const __CFString *v71;
  const __CFString *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v113;
  uint64_t v114;
  NSObject *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  NSObject *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int isEqualToString;
  int v138;
  NSObject *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  const __CFString *v152;
  uint8_t buf[4];
  const __CFString *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend_sharedInstance(IMMobileNetworkManager, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isWiFiEnabled(v7, v8, v9, v10) & 1) != 0)
  {
    objc_msgSend_sharedInstance(IMMobileNetworkManager, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    isWiFiUsable = objc_msgSend_isWiFiUsable(v14, v15, v16, v17);

    if ((isWiFiUsable & 1) != 0)
    {
      hasLTEDataConnection = 0;
      v23 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend_sharedInstance(IMMobileNetworkManager, v19, v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  hasLTEDataConnection = objc_msgSend_hasLTEDataConnection(v24, v25, v26, v27);

  v23 = 1;
LABEL_6:
  objc_msgSend_sharedInstance(IMMobileNetworkManager, v19, v20, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_isWiFiUsable(v28, v29, v30, v31);

  v33 = (void *)IMWeakLinkClass(CFSTR("FTUserConfiguration"), CFSTR("FTServices"));
  objc_msgSend_sharedInstance(v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_allowAnyNetwork(v37, v38, v39, v40);

  if (v41)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("Attachments");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v42, OS_LOG_TYPE_INFO, "Forcing wifi", buf, 2u);
      }

    }
    IMLogString();
    if (_IMWillLog(CFSTR("Attachments")))
      _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("Forcing wifi"), v43, v44, v45, v46, v47, v151);
    v32 = 1;
  }
  if (a2)
    *a2 = 0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v154 = v3;
      _os_log_impl(&dword_19066D000, v48, OS_LOG_TYPE_INFO, "Max File Size For UTI: %@", buf, 0xCu);
    }

  }
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("Max File Size For UTI: %@"), v49, v50, v51, v52, v53, (char)v3);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      if (v23)
        v55 = CFSTR("YES");
      else
        v55 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v154 = v55;
      _os_log_impl(&dword_19066D000, v54, OS_LOG_TYPE_INFO, "  Low Bandwidth Cell: %@", buf, 0xCu);
    }

  }
  if (v23)
    v56 = CFSTR("YES");
  else
    v56 = CFSTR("NO");
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("  Low Bandwidth Cell: %@"), v57, v58, v59, v60, v61, (char)v56);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      if (hasLTEDataConnection)
        v63 = CFSTR("YES");
      else
        v63 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v154 = v63;
      _os_log_impl(&dword_19066D000, v62, OS_LOG_TYPE_INFO, " High Bandwidth Cell: %@", buf, 0xCu);
    }

  }
  if (hasLTEDataConnection)
    v64 = CFSTR("YES");
  else
    v64 = CFSTR("NO");
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR(" High Bandwidth Cell: %@"), v65, v66, v67, v68, v69, (char)v64);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      if (v32)
        v71 = CFSTR("YES");
      else
        v71 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v154 = v71;
      _os_log_impl(&dword_19066D000, v70, OS_LOG_TYPE_INFO, "      High Bandwidth: %@", buf, 0xCu);
    }

  }
  if (v32)
    v72 = CFSTR("YES");
  else
    v72 = CFSTR("NO");
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      High Bandwidth: %@"), v73, v74, v75, v76, v77, (char)v72);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v154 = CFSTR("YES");
      _os_log_impl(&dword_19066D000, v78, OS_LOG_TYPE_INFO, "    Wants Misc Types: %@", buf, 0xCu);
    }

  }
  v152 = CFSTR("YES");
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("    Wants Misc Types: %@"), v79, v80, v81, v82, v83, (char)CFSTR("YES"));
  if (sub_1906AA740(v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("Attachments");
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v154 = v3;
        _os_log_impl(&dword_19066D000, v84, OS_LOG_TYPE_INFO, "      ** This is an image type: %@", buf, 0xCu);
      }

    }
    IMLogString();
    if (_IMWillLog(CFSTR("Attachments")))
      _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      ** This is an image type: %@"), v85, v86, v87, v88, v89, (char)v3);
LABEL_71:
    if ((v23 ^ 1 | hasLTEDataConnection | v32) != 1)
    {
      v99 = 0x400000;
      goto LABEL_97;
    }
    v90 = (hasLTEDataConnection ^ 1 | v32) == 0;
    v91 = 6291456;
LABEL_73:
    v92 = 10485760;
LABEL_91:
    if (v90)
      v99 = v91;
    else
      v99 = v92;
    if (a2)
      goto LABEL_95;
    goto LABEL_97;
  }
  if (sub_1906AA7EC(v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("Attachments");
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v154 = v3;
        _os_log_impl(&dword_19066D000, v93, OS_LOG_TYPE_INFO, "      ** This is an audio type: %@", buf, 0xCu);
      }

    }
    IMLogString();
    if (_IMWillLog(CFSTR("Attachments")))
      _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      ** This is an audio type: %@"), v94, v95, v96, v97, v98, (char)v3);
LABEL_89:
    if ((v23 ^ 1 | hasLTEDataConnection | v32) != 1)
    {
      v99 = 5242880;
      goto LABEL_97;
    }
    v90 = (hasLTEDataConnection ^ 1 | v32) == 0;
    v91 = 20971520;
    v92 = 41943040;
    goto LABEL_91;
  }
  if (sub_1906AA898(v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("Attachments");
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v154 = v3;
        _os_log_impl(&dword_19066D000, v100, OS_LOG_TYPE_INFO, "      ** This is an video type: %@", buf, 0xCu);
      }

    }
    IMLogString();
    if (_IMWillLog(CFSTR("Attachments")))
      _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      ** This is an video type: %@"), v101, v102, v103, v104, v105, (char)v3);
    goto LABEL_89;
  }
  if (sub_1906AA944(v3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("Attachments");
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v154 = v3;
        _os_log_impl(&dword_19066D000, v115, OS_LOG_TYPE_INFO, "      ** This is a vcard type: %@", buf, 0xCu);
      }

    }
    IMLogString();
    if (_IMWillLog(CFSTR("Attachments")))
      _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      ** This is a vcard type: %@"), v116, v117, v118, v119, v120, (char)v3);
    v99 = 0x100000;
    if (!a2)
      goto LABEL_97;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v3, v113, (uint64_t)CFSTR("com.apple.pkpass"), v114, v152))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory("Attachments");
        v123 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v154 = v3;
          _os_log_impl(&dword_19066D000, v123, OS_LOG_TYPE_INFO, "      ** This is a pass type: %@", buf, 0xCu);
        }

      }
      IMLogString();
      if (_IMWillLog(CFSTR("Attachments")))
        _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      ** This is a pass type: %@"), v124, v125, v126, v127, v128, (char)v3);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v3, v121, (uint64_t)CFSTR("com.apple.watchface"), v122))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory("Attachments");
          v131 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v154 = v3;
            _os_log_impl(&dword_19066D000, v131, OS_LOG_TYPE_INFO, "      ** This is a watchface type: %@", buf, 0xCu);
          }

        }
        IMLogString();
        if (_IMWillLog(CFSTR("Attachments")))
          _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      ** This is a watchface type: %@"), v132, v133, v134, v135, v136, (char)v3);
        goto LABEL_71;
      }
      isEqualToString = objc_msgSend_isEqualToString_(v3, v129, (uint64_t)CFSTR("com.apple.workout"), v130);
      v138 = IMOSLoggingEnabled();
      if (!isEqualToString)
      {
        if (v138)
        {
          OSLogHandleForIMFoundationCategory("Attachments");
          v145 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v154 = v3;
            _os_log_impl(&dword_19066D000, v145, OS_LOG_TYPE_INFO, "      ** This is a misc type: %@", buf, 0xCu);
          }

        }
        IMLogString();
        if (_IMWillLog(CFSTR("Attachments")))
          _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      ** This is a misc type: %@"), v146, v147, v148, v149, v150, (char)v3);
        if ((v23 ^ 1 | hasLTEDataConnection | v32) != 1)
        {
          v99 = 0x100000;
          goto LABEL_97;
        }
        v90 = (hasLTEDataConnection ^ 1 | v32) == 0;
        v91 = 0x100000;
        goto LABEL_73;
      }
      if (v138)
      {
        OSLogHandleForIMFoundationCategory("Attachments");
        v139 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v154 = v3;
          _os_log_impl(&dword_19066D000, v139, OS_LOG_TYPE_INFO, "      ** This is a workout type: %@", buf, 0xCu);
        }

      }
      IMLogString();
      if (_IMWillLog(CFSTR("Attachments")))
        _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("      ** This is a workout type: %@"), v140, v141, v142, v143, v144, (char)v3);
    }
    v99 = 10485760;
    if (!a2)
      goto LABEL_97;
  }
  if (v23 ^ 1 | hasLTEDataConnection | v32)
LABEL_95:
    *a2 = 1;
LABEL_97:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v154 = (const __CFString *)(v99 >> 10);
      _os_log_impl(&dword_19066D000, v106, OS_LOG_TYPE_INFO, "  Max File Size: %lld kb", buf, 0xCu);
    }

  }
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("  Max File Size: %lld kb"), v107, v108, v109, v110, v111, v99 >> 10);

  return v99;
}

BOOL sub_1906AA740(void *a1)
{
  id v1;
  void **v2;
  void *v3;
  _BOOL8 v4;

  v1 = a1;
  if (qword_1EE1DD198 != -1)
    dispatch_once(&qword_1EE1DD198, &unk_1E2C463B8);
  if (!qword_1EE1DD1A0)
  {
    v2 = (void **)IMWeakLinkSymbol("kUTTypeImage", CFSTR("MobileCoreServices"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&qword_1EE1DD1A0, v3);
  }
  v4 = off_1EE1DD190(v1) != 0;

  return v4;
}

BOOL sub_1906AA7EC(void *a1)
{
  id v1;
  void **v2;
  void *v3;
  _BOOL8 v4;

  v1 = a1;
  if (qword_1EE1DD1B0 != -1)
    dispatch_once(&qword_1EE1DD1B0, &unk_1E2C463D8);
  if (!qword_1EE1DD1B8)
  {
    v2 = (void **)IMWeakLinkSymbol("kUTTypeAudio", CFSTR("MobileCoreServices"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&qword_1EE1DD1B8, v3);
  }
  v4 = off_1EE1DD1A8(v1) != 0;

  return v4;
}

BOOL sub_1906AA898(void *a1)
{
  id v1;
  void **v2;
  void *v3;
  _BOOL8 v4;

  v1 = a1;
  if (qword_1EE1DD1C8 != -1)
    dispatch_once(&qword_1EE1DD1C8, &unk_1E2C463F8);
  if (!qword_1EE1DD1D0)
  {
    v2 = (void **)IMWeakLinkSymbol("kUTTypeAudiovisualContent", CFSTR("MobileCoreServices"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&qword_1EE1DD1D0, v3);
  }
  v4 = off_1EE1DD1C0(v1) != 0;

  return v4;
}

BOOL sub_1906AA944(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  _BOOL8 v4;
  void **v5;
  void *v6;

  v1 = a1;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("public.vlocation"), v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (qword_1EE1DDE38 != -1)
      dispatch_once(&qword_1EE1DDE38, &unk_1E2C46418);
    if (!qword_1EE1DDE40)
    {
      v5 = (void **)IMWeakLinkSymbol("kUTTypeVCard", CFSTR("MobileCoreServices"));
      if (v5)
        v6 = *v5;
      else
        v6 = 0;
      objc_storeStrong((id *)&qword_1EE1DDE40, v6);
    }
    v4 = off_1EE1DDE30(v1) != 0;
  }

  return v4;
}

void IMiMessageSizeLimitsForTransferType(void *a1, unint64_t *a2, _QWORD *a3, void *a4)
{
  char v4;

  v4 = 0;
  sub_1906AAA30(a1, a2, a3, a4, 1, &v4);
}

void sub_1906AAA30(void *a1, unint64_t *a2, _QWORD *a3, void *a4, int a5, _BYTE *a6)
{
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a4;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  if (sub_1906AA7EC(v11))
  {
    IMiMessageMaxTransferAudioFileSizeForWifi((uint64_t *)&v30, &v29, v12);
  }
  else if (sub_1906AA898(v11))
  {
    IMiMessageMaxTransferVideoFileSizeForWifi((uint64_t *)&v30, &v29, v12);
  }
  else
  {
    IMiMessageMaxTransferFileSizeForWifi(&v30, &v29, v12);
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v11;
      v33 = 2048;
      v34 = v30 >> 10;
      v35 = 2048;
      v36 = v29 >> 10;
      _os_log_impl(&dword_19066D000, v13, OS_LOG_TYPE_INFO, "Server bag File Size Limits for type: %@   big: %lld kb  small: %lld kb", buf, 0x20u);
    }

  }
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("Server bag File Size Limits for type: %@   big: %lld kb  small: %lld kb"), v14, v15, v16, v17, v18, (char)v11);
  v19 = IMiMessageMaxFileSizeForUTI(v11, a6);
  if (a3)
    *a3 = v29;
  if (a2)
  {
    if (a5 && IMiMessageShouldSendLowResolutionOnly())
    {
      v20 = v29;
    }
    else
    {
      v20 = v30;
      if (v30 <= v19)
        v20 = v19;
    }
    *a2 = v20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Attachments");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = *a2 >> 10;
      v23 = *a3 >> 10;
      *(_DWORD *)buf = 138412802;
      v32 = v11;
      v33 = 2048;
      v34 = v22;
      v35 = 2048;
      v36 = v23;
      _os_log_impl(&dword_19066D000, v21, OS_LOG_TYPE_INFO, "Max File Size Limits for type: %@   big: %lld kb  small: %lld kb", buf, 0x20u);
    }

  }
  IMLogString();
  if (_IMWillLog(CFSTR("Attachments")))
    _IMAlwaysLog(0, CFSTR("Attachments"), CFSTR("Max File Size Limits for type: %@   big: %lld kb  small: %lld kb"), v24, v25, v26, v27, v28, (char)v11);

}

void IMiMessageSizeLimitsForTransferTypeDisableLargeSizeNetworkRestriction(void *a1, unint64_t *a2, _QWORD *a3, void *a4, _BYTE *a5)
{
  sub_1906AAA30(a1, a2, a3, a4, 0, a5);
}

uint64_t IMMMSPartCombinationCanBeSent(void *a1, uint64_t *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  NSObject *v25;
  BOOL v26;
  NSObject *v27;
  BOOL v28;
  _BOOL4 v29;
  int v30;
  NSObject *v31;
  BOOL v32;
  BOOL v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v56;
  uint64_t *v57;
  int v58;
  void *v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[16];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v59 = v3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    v57 = a2;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v3;
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v61, (uint64_t)v66, 16);
    if (v8)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v62;
LABEL_4:
      v13 = 0;
      v14 = v11;
      v58 = v11 + v8;
      while (1)
      {
        if (*(_QWORD *)v62 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v13);
        if (sub_1906AA740(v15))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory("MMSValidation");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19066D000, v16, OS_LOG_TYPE_INFO, "Located an Image", buf, 2u);
            }

          }
          IMLogString();
          v17 = _IMWillLog(CFSTR("MMSValidation"));
          v24 = CFSTR("Located an Image");
          if (!v17)
            goto LABEL_35;
        }
        else if (sub_1906AA7EC(v15))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory("MMSValidation");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19066D000, v25, OS_LOG_TYPE_INFO, "Located an Audio File", buf, 2u);
            }

          }
          IMLogString();
          v26 = _IMWillLog(CFSTR("MMSValidation"));
          ++v10;
          v24 = CFSTR("Located an Audio File");
          if (!v26)
            goto LABEL_35;
        }
        else if (sub_1906AA898(v15))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory("MMSValidation");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19066D000, v27, OS_LOG_TYPE_INFO, "Located an Video File", buf, 2u);
            }

          }
          IMLogString();
          v28 = _IMWillLog(CFSTR("MMSValidation"));
          ++v9;
          v24 = CFSTR("Located an Video File");
          if (!v28)
            goto LABEL_35;
        }
        else
        {
          v29 = sub_1906AA944(v15);
          v30 = IMOSLoggingEnabled();
          if (!v29)
          {
            if (v30)
            {
              OSLogHandleForIMFoundationCategory("MMSValidation");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19066D000, v49, OS_LOG_TYPE_INFO, "Found an invalid attachment for MMS in this message, failing message", buf, 2u);
              }

            }
            IMLogString();
            if (_IMWillLog(CFSTR("MMSValidation")))
              _IMAlwaysLog(0, CFSTR("MMSValidation"), CFSTR("Found an invalid attachment for MMS in this message, failing message"), v50, v51, v52, v53, v54, (char)v57);
            v47 = v57;
            if (v57)
            {
              v48 = 1001;
              goto LABEL_58;
            }
            goto LABEL_67;
          }
          if (v30)
          {
            OSLogHandleForIMFoundationCategory("MMSValidation");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19066D000, v31, OS_LOG_TYPE_INFO, "Located an vCard File", buf, 2u);
            }

          }
          IMLogString();
          v32 = _IMWillLog(CFSTR("MMSValidation"));
          v24 = CFSTR("Located an vCard File");
          if (!v32)
            goto LABEL_35;
        }
        _IMAlwaysLog(0, CFSTR("MMSValidation"), v24, v19, v20, v21, v22, v23, (char)v57);
LABEL_35:
        v33 = v9 <= 0 && v10 <= 0;
        if (!v33 && v14 + (int)v13 >= 1)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory("MMSValidation");
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19066D000, v41, OS_LOG_TYPE_INFO, "Attempeted to send Mixed Type MMS, Not allowing to send", buf, 2u);
            }

          }
          IMLogString();
          if (_IMWillLog(CFSTR("MMSValidation")))
            _IMAlwaysLog(0, CFSTR("MMSValidation"), CFSTR("Attempeted to send Mixed Type MMS, Not allowing to send"), v42, v43, v44, v45, v46, (char)v57);
          v47 = v57;
          if (v57)
          {
            v48 = 2004;
LABEL_58:
            v34 = 0;
            *v47 = v48;
            goto LABEL_68;
          }
LABEL_67:
          v34 = 0;
          goto LABEL_68;
        }
        if (v8 == ++v13)
        {
          v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v61, (uint64_t)v66, 16);
          v11 = v58;
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }
    v34 = 1;
LABEL_68:

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory("MMSValidation");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v35, OS_LOG_TYPE_INFO, "This message has no types, fine to send", buf, 2u);
      }

    }
    IMLogString();
    if (_IMWillLog(CFSTR("MMSValidation")))
      _IMAlwaysLog(0, CFSTR("MMSValidation"), CFSTR("This message has no types, fine to send"), v36, v37, v38, v39, v40, v56);
    v34 = 1;
  }

  return v34;
}

uint64_t sub_1906AB420()
{
  uint64_t result;

  result = CFPreferencesSynchronize(CFSTR("com.apple.carrier"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  dword_1EE1DC854 = -1;
  dword_1EE1DC800 = -1;
  dword_1EE1DD114 = -1;
  dword_1EE1DD118 = -1;
  dword_1EE1DC7FC = -1;
  dword_1EE1DC848 = -1;
  return result;
}

uint64_t sub_1906AB488()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  CFStringRef v7;
  char v9;
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory("Restricted");
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v0, OS_LOG_TYPE_INFO, "Restricted Mode changed, reloading", buf, 2u);
    }

  }
  IMLogString();
  if (_IMWillLog(CFSTR("Restricted")))
    _IMAlwaysLog(0, CFSTR("Restricted"), CFSTR("Restricted Mode changed, reloading"), v1, v2, v3, v4, v5, v9);
  v6 = IMSharedResourcesDirectory();
  v7 = CFStringCreateWithFormat(0, 0, CFSTR("%@/Library/Preferences/%@"), v6, CFSTR("com.apple.MobileSMS"));
  if (v7)
    CFRelease(v7);
  return sub_1906A8330(1);
}

BOOL sub_1906AB598()
{
  _BOOL8 result;

  CFPreferencesSynchronize(CFSTR("com.apple.carrier"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  dword_1EE1DC854 = -1;
  dword_1EE1DC800 = -1;
  dword_1EE1DD114 = -1;
  dword_1EE1DD118 = -1;
  dword_1EE1DC7FC = -1;
  dword_1EE1DC848 = -1;
  dword_1EE1DC850 = -1;
  result = IMReadMMSUserOverride();
  qword_1ECD90AA0 = result;
  return result;
}

uint64_t sub_1906AB618()
{
  uint64_t result;

  result = IMWeakLinkClass(CFSTR("AVAssetExportSession"), CFSTR("AVFoundation"));
  qword_1EE1DDE10 = result;
  return result;
}

void *sub_1906AB644()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("CMTimeGetSeconds", CFSTR("CoreMedia"));
  off_1EE1DDE20 = result;
  return result;
}

void *sub_1906AB670()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("UTTypeConformsTo", CFSTR("MobileCoreServices"));
  off_1EE1DD190 = result;
  return result;
}

void *sub_1906AB69C()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("UTTypeConformsTo", CFSTR("MobileCoreServices"));
  off_1EE1DD1A8 = result;
  return result;
}

void *sub_1906AB6C8()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("UTTypeConformsTo", CFSTR("MobileCoreServices"));
  off_1EE1DD1C0 = result;
  return result;
}

void *sub_1906AB6F4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("UTTypeConformsTo", CFSTR("MobileCoreServices"));
  off_1EE1DDE30 = result;
  return result;
}

uint64_t sub_1906AB7B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1906AC2AC(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint8_t buf[4];
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_URLLoading(IMIDSLog, v14, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138412290;
    v80 = v18;
    _os_log_impl(&dword_19066D000, v17, OS_LOG_TYPE_DEFAULT, "Finished loading direct request: %@", buf, 0xCu);
  }

  objc_msgSend_URLLoading(IMIDSLog, v19, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_bundleIdentifierForDataUsage(*(void **)(a1 + 32), v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v80 = v26;
    _os_log_impl(&dword_19066D000, v22, OS_LOG_TYPE_DEFAULT, " Data Usage identifier: %@", buf, 0xCu);

  }
  objc_msgSend_URLLoading(IMIDSLog, v27, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v10;
    _os_log_impl(&dword_19066D000, v30, OS_LOG_TYPE_DEFAULT, "              Response: %@", buf, 0xCu);
  }

  objc_msgSend_URLLoading(IMIDSLog, v31, v32, v33);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend_length(v11, v35, v36, v37);
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v38;
    _os_log_impl(&dword_19066D000, v34, OS_LOG_TYPE_DEFAULT, "     ResultData Length: %d", buf, 8u);
  }

  objc_msgSend_URLLoading(IMIDSLog, v39, v40, v41);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = a3;
    _os_log_impl(&dword_19066D000, v42, OS_LOG_TYPE_DEFAULT, "            StatusCode: %d", buf, 8u);
  }

  objc_msgSend_URLLoading(IMIDSLog, v43, v44, v45);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v12;
    _os_log_impl(&dword_19066D000, v46, OS_LOG_TYPE_DEFAULT, "                 Error: %@", buf, 0xCu);
  }

  objc_msgSend_URLLoading(IMIDSLog, v47, v48, v49);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_boundInterfaceIdentifier(*(void **)(*(_QWORD *)(a1 + 32) + 40), v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v80 = v54;
    _os_log_impl(&dword_19066D000, v50, OS_LOG_TYPE_DEFAULT, "       Bound interface: %@", buf, 0xCu);

  }
  objc_msgSend_URLLoading(IMIDSLog, v55, v56, v57);
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(NetworkChangeNotifier, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_linkQualityValueForInterfaceType_(v62, v63, 3, v64);
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v65;
    _os_log_impl(&dword_19066D000, v58, OS_LOG_TYPE_DEFAULT, "     Cell Link Quality: %d", buf, 8u);

  }
  objc_msgSend_URLLoading(IMIDSLog, v66, v67, v68);
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(NetworkChangeNotifier, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_linkQualityValueForInterfaceType_(v73, v74, 2, v75);
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v76;
    _os_log_impl(&dword_19066D000, v69, OS_LOG_TYPE_DEFAULT, "     WiFi Link Quality: %d", buf, 8u);

  }
  v77 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v77)
    (*(void (**)(uint64_t, id, uint64_t, id, id, id))(v77 + 16))(v77, v10, a3, v11, v12, v13);

}

void *sub_1906AC7D4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SCNetworkReachabilityCreateWithName", CFSTR("SystemConfiguration"));
  off_1EE1DDE48 = result;
  return result;
}

void *sub_1906AC880()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SCNetworkReachabilityCreateWithAddress", CFSTR("SystemConfiguration"));
  off_1EE1DD1D8 = result;
  return result;
}

void sub_1906AC9B0(int a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("NetworkAvailability");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((a1 & 0x40000) != 0)
      v5 = 87;
    else
      v5 = 45;
    v14[0] = 67111426;
    v14[1] = v5;
    if ((a1 & 2) != 0)
      v6 = 82;
    else
      v6 = 45;
    v15 = 1024;
    v16 = v6;
    if ((a1 & 1) != 0)
      v7 = 116;
    else
      v7 = 45;
    v17 = 1024;
    v18 = v7;
    if ((a1 & 4) != 0)
      v8 = 99;
    else
      v8 = 45;
    v19 = 1024;
    v20 = v8;
    if ((a1 & 8) != 0)
      v9 = 67;
    else
      v9 = 45;
    v21 = 1024;
    if ((a1 & 0x10) != 0)
      v10 = 105;
    else
      v10 = 45;
    v22 = v9;
    v23 = 1024;
    if ((a1 & 0x20) != 0)
      v11 = 68;
    else
      v11 = 45;
    v24 = v10;
    if ((a1 & 0x10000) != 0)
      v12 = 108;
    else
      v12 = 45;
    v25 = 1024;
    v26 = v11;
    if ((a1 & 0x20000) != 0)
      v13 = 100;
    else
      v13 = 45;
    v27 = 1024;
    v28 = v12;
    v29 = 1024;
    v30 = v13;
    v31 = 2080;
    v32 = a2;
    _os_log_impl(&dword_19066D000, v4, OS_LOG_TYPE_DEFAULT, "Reachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n", (uint8_t *)v14, 0x42u);
  }

}

void *sub_1906ACCA0()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("SCNetworkReachabilityGetFlags", CFSTR("SystemConfiguration"));
  off_1EE1DD1E0 = result;
  return result;
}

uint64_t sub_1906AF130(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__timerHit_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
}

void sub_1906AF900(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  dispatch_block_t v4;
  dispatch_time_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1906AFA48;
  block[3] = &unk_1E2C46120;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v17 = v3;
  v18 = *(id *)(a1 + 48);
  v4 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
  dispatch_after(v5, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v4);
  v12[0] = v2;
  v12[1] = 3221225472;
  v12[2] = sub_1906AFA58;
  v12[3] = &unk_1E2C464B8;
  v6 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v7 = v4;
  v11 = (void *)objc_msgSend_copy(v12, v8, v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t sub_1906AFA48(_QWORD *a1)
{
  return MEMORY[0x1E0DE7D20](a1[4], sel__popEnqueuedBlockWithGUID_key_, a1[5], a1[6]);
}

void sub_1906AFA58(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1906AFAF8;
  block[3] = &unk_1E2C46120;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t sub_1906AFAF8(_QWORD *a1)
{
  return MEMORY[0x1E0DE7D20](a1[4], sel__popEnqueuedBlockWithGUID_key_, a1[5], a1[6]);
}

void sub_1906AFC2C(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1906AFCC8;
  v7[3] = &unk_1E2C46120;
  v2 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  v6 = (void *)objc_msgSend_copy(v7, v3, v4, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_1906AFCC8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1906AFD60;
  block[3] = &unk_1E2C46120;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t sub_1906AFD60(_QWORD *a1)
{
  return MEMORY[0x1E0DE7D20](a1[4], sel__popEnqueuedBlockWithGUID_key_, a1[5], a1[6]);
}

void im_set_primary_queue(void *a1)
{
  id v1;
  unsigned __int8 v2;
  void *v3;

  v1 = a1;
  v2 = atomic_load(byte_1ECD90E90);
  if ((v2 & 1) != 0)
    abort();
  v3 = (void *)qword_1EE1DD5F0;
  qword_1EE1DD5F0 = (uint64_t)v1;

}

void im_set_primary_base_queue(void *a1)
{
  id v1;
  unsigned __int8 v2;
  void *v3;

  v1 = a1;
  v2 = atomic_load(byte_1EE1DD510);
  if ((v2 & 1) != 0)
    abort();
  v3 = (void *)qword_1EE1DD5D0;
  qword_1EE1DD5D0 = (uint64_t)v1;

}

void im_assert_primary_queue()
{
  NSObject *v0;

  im_primary_queue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v0);

}

void sub_1906B02B8()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_1EE1DDE58;
  qword_1EE1DDE58 = (uint64_t)v0;

}

uint64_t sub_1906B04F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
}

uint64_t sub_1906B0508(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
}

const void *__IMCopyCachedStringKey(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  CFHashCode v8;
  const void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (qword_1EE1DD638 != -1)
    dispatch_once(&qword_1EE1DD638, &unk_1E2C42FE8);
  v8 = CFHash(v5);
  v9 = (const void *)(CFHash(v6) + v8);
  v10 = NSMapGet((NSMapTable *)qword_1EE1DD648, v9);
  if (!v10 || (v14 = CFRetain(v10)) == 0)
  {
    if (objc_msgSend_length(v7, v11, v12, v13))
    {
      objc_msgSend_stringByAppendingString_(v5, v15, (uint64_t)v7, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v17, v18, (uint64_t)v6, v19);
      v14 = (const void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_stringByAppendingString_(v5, v15, (uint64_t)v6, v16);
      v14 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    pthread_mutex_lock(&stru_1EE1DC808);
    v20 = (id)qword_1EE1DD648;
    v27 = qword_1EE1DD648;
    NSMapInsert((NSMapTable *)qword_1EE1DD640, v9, v14);
    v21 = qword_1EE1DD648;
    v22 = qword_1EE1DD640;
    while (1)
    {
      v23 = __ldaxr((unint64_t *)&v27);
      if (v23 != v21)
        break;
      if (!__stlxr(v22, (unint64_t *)&v27))
        goto LABEL_13;
    }
    __clrex();
LABEL_13:
    v24 = (void *)qword_1EE1DD640;
    qword_1EE1DD640 = (uint64_t)v20;
    v25 = v20;

    NSMapInsert((NSMapTable *)qword_1EE1DD640, v9, v14);
    pthread_mutex_unlock(&stru_1EE1DC808);
  }

  return v14;
}

void sub_1906B0854()
{
  id v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v0 = objc_alloc(MEMORY[0x1E0CB3748]);
  v2 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v0, v1, 1282, 0, 100);
  v3 = (void *)qword_1EE1DD648;
  qword_1EE1DD648 = v2;

  v4 = objc_alloc(MEMORY[0x1E0CB3748]);
  v6 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v4, v5, 1282, 0, 100);
  v7 = (void *)qword_1EE1DD640;
  qword_1EE1DD640 = v6;

}

BOOL IMShouldLogCategory(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  _BOOL8 v21;

  v5 = a1;
  v6 = a2;
  if ((byte_1ECD90E39 & 1) == 0 && qword_1ECD90E48 != -1)
    dispatch_once(&qword_1ECD90E48, &unk_1E2C46550);
  if (dword_1ECD90A70 >= 1)
  {
    if ((byte_1ECD90E39 & 1) == 0 && qword_1ECD90E48 != -1)
      dispatch_once(&qword_1ECD90E48, &unk_1E2C46550);
    pthread_mutex_lock(&stru_1ECD90A30);
    objc_msgSend_objectForKey_((void *)qword_1ECD90E28, v7, (uint64_t)v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && v9)
    {
      objc_msgSend_objectForKey_((void *)qword_1EE1DDE70, v10, (uint64_t)v5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);

      if ((v16 & 1) == 0)
      {
        v17 = (void *)__IMCopyCachedStringKey(v5, v6, CFSTR("."));
        objc_msgSend_objectForKey_((void *)qword_1ECD90E28, v18, (uint64_t)v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_12;
      }
    }
    else if (!v9)
    {
LABEL_12:
      v21 = 0;
LABEL_16:
      pthread_mutex_unlock(&stru_1ECD90A30);
      goto LABEL_17;
    }
    v21 = sub_1906B0A3C(v5) >= a3;
    goto LABEL_16;
  }
  v21 = 0;
LABEL_17:

  return v21;
}

uint64_t sub_1906B0A3C(void *a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v1 = (void *)__IMCopyCachedStringKey(a1, CFSTR("LogLevel"), &stru_1E2C46CC8);
  objc_msgSend_objectForKey_((void *)qword_1EE1DDE68, v2, (uint64_t)v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
    v9 = (int)objc_msgSend_intValue(v4, v5, v6, v7);
  else
    v9 = 0;

  return v9;
}

BOOL IMShouldLogEvent(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;

  v3 = a1;
  if ((byte_1ECD90E39 & 1) == 0 && qword_1ECD90E48 != -1)
    dispatch_once(&qword_1ECD90E48, &unk_1E2C46550);
  if (dword_1ECD90A70 < 1)
  {
    v9 = 0;
  }
  else
  {
    if ((byte_1ECD90E39 & 1) == 0 && qword_1ECD90E48 != -1)
      dispatch_once(&qword_1ECD90E48, &unk_1E2C46550);
    pthread_mutex_lock(&stru_1ECD90A30);
    objc_msgSend_objectForKey_((void *)qword_1ECD90E30, v4, (uint64_t)v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend_objectForKey_((void *)qword_1ECD90E28, v7, (uint64_t)v3, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v9 = sub_1906B0A3C(v3) >= a2;
      else
        v9 = 0;
    }
    pthread_mutex_unlock(&stru_1ECD90A30);
  }

  return v9;
}

BOOL IMShouldLog(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;

  v3 = a1;
  if ((byte_1ECD90E39 & 1) == 0 && qword_1ECD90E48 != -1)
    dispatch_once(&qword_1ECD90E48, &unk_1E2C46550);
  if (dword_1ECD90A70 < 1)
  {
    v7 = 0;
  }
  else
  {
    if ((byte_1ECD90E39 & 1) == 0 && qword_1ECD90E48 != -1)
      dispatch_once(&qword_1ECD90E48, &unk_1E2C46550);
    pthread_mutex_lock(&stru_1ECD90A30);
    objc_msgSend_objectForKey_((void *)qword_1ECD90E28, v4, (uint64_t)v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = sub_1906B0A3C(v3) >= a2;
    else
      v7 = 0;
    pthread_mutex_unlock(&stru_1ECD90A30);
  }

  return v7;
}

uint64_t IMLogLevelForType(void *a1)
{
  id v1;
  uint64_t v3;

  v1 = a1;
  if ((byte_1ECD90E39 & 1) == 0 && qword_1ECD90E48 != -1)
    dispatch_once(&qword_1ECD90E48, &unk_1E2C46550);
  if (dword_1ECD90A70 < 1 || byte_1ECD90E38 == 0)
  {
    v3 = 0;
  }
  else
  {
    if ((byte_1ECD90E39 & 1) == 0 && qword_1ECD90E48 != -1)
      dispatch_once(&qword_1ECD90E48, &unk_1E2C46550);
    pthread_mutex_lock(&stru_1ECD90A30);
    v3 = sub_1906B0A3C(v1);
    pthread_mutex_unlock(&stru_1ECD90A30);
  }

  return v3;
}

uint64_t IMSyncLoggingsPreferences()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  timespec v9;
  void **p_cache;
  void *v11;
  CFArrayRef v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __CFString *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  const char *v26;
  uint64_t v27;
  CFMutableDictionaryRef Mutable;
  void *v29;
  CFIndex AppIntegerValue;
  void *v31;
  uint64_t v32;
  const char *v33;
  CFMutableDictionaryRef v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  CFMutableDictionaryRef v42;
  void *v43;
  int AppBooleanValue;
  const char *v45;
  uint64_t v46;
  void *v47;
  CFMutableDictionaryRef v48;
  void *v49;
  const char *v50;
  int v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  CFMutableDictionaryRef v60;
  void *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  const char *v65;
  char v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  CFMutableDictionaryRef v71;
  void *v72;
  CFMutableDictionaryRef v73;
  void *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  id v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t k;
  void *v91;
  CFMutableDictionaryRef v92;
  void *v93;
  id v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t m;
  int isCarrierInstall;
  const __CFArray *obj;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  stat v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  byte_1ECD90E39 = 1;
  pthread_mutex_lock(&stru_1ECD90A30);
  objc_msgSend_sharedInstance(IMLockdownManager, v0, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isCarrierInstall = objc_msgSend_isCarrierInstall(v3, v4, v5, v6);

  if (dword_1ECD90A70 != -1)
    CFPreferencesAppSynchronize(CFSTR("com.apple.logging"));
  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v121.st_blksize = v9;
  *(timespec *)v121.st_qspare = v9;
  v121.st_birthtimespec = v9;
  *(timespec *)&v121.st_size = v9;
  v121.st_mtimespec = v9;
  v121.st_ctimespec = v9;
  *(timespec *)&v121.st_uid = v9;
  v121.st_atimespec = v9;
  *(timespec *)&v121.st_dev = v9;
  dword_1ECD90A70 = 0;
  p_cache = IMTimer.cache;
  if (!byte_1ECD90E38 || lstat("/var/mobile/Library/PPTDevice", &v121) && lstat("/var/db/disableAppleInternal", &v121))
  {
    objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E0C99D80], v7, (uint64_t)CFSTR("Registration"), v8, CFSTR("RegistrationLogging"), CFSTR("RegistrationLogLevel"), CFSTR("RegistrationLoggingLevel"), CFSTR("LocalPreview"), CFSTR("LocalPreviewLogging"), CFSTR("Phone"), CFSTR("PhoneLogging"), CFSTR("VisualVoicemail"), CFSTR("VisualVoicemailLogging"), CFSTR("FaceTime"), CFSTR("CallLogging"), CFSTR("MessagesEvent"), CFSTR("MadridEventLogging"), CFSTR("Messages"), CFSTR("MadridLogging"),
      CFSTR("MessagesLogLevel"),
      CFSTR("MadridLoggingLevel"),
      CFSTR("IDS"),
      CFSTR("IDSLogging"),
      CFSTR("IDSLogLevel"),
      CFSTR("IDSLoggingLevel"),
      CFSTR("Transport"),
      CFSTR("TransportLogging"),
      0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFPreferencesCopyKeyList(CFSTR("com.apple.logging"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    obj = v12;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v117, (uint64_t)v125, 16);
    if (!v14)
      goto LABEL_37;
    v15 = v14;
    v16 = *(_QWORD *)v118;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v118 != v16)
          objc_enumerationMutation(obj);
        v18 = (__CFString *)*(id *)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v11, v19, (uint64_t)v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v21;
        v25 = v18;
        if (v21)
        {
          v25 = v21;

        }
        if (objc_msgSend_hasSuffix_(v25, v22, (uint64_t)CFSTR("LogLevel"), v23))
        {
          if (byte_1ECD90E38)
          {
            if (!qword_1EE1DDE68)
            {
              Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              v29 = (void *)qword_1EE1DDE68;
              qword_1EE1DDE68 = (uint64_t)Mutable;

            }
            AppIntegerValue = CFPreferencesGetAppIntegerValue(v18, CFSTR("com.apple.logging"), 0);
            if (AppIntegerValue >= 1)
            {
              v31 = (void *)qword_1EE1DDE68;
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v26, AppIntegerValue, v27);
              v32 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            }
          }
        }
        else if (objc_msgSend_hasSuffix_(v25, v26, (uint64_t)CFSTR(".AllCategories"), v27))
        {
          if (byte_1ECD90E38)
          {
            if (!qword_1EE1DDE70)
            {
              v34 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              v35 = (void *)qword_1EE1DDE70;
              qword_1EE1DDE70 = (uint64_t)v34;

            }
            v36 = objc_msgSend_rangeOfString_(v25, v26, (uint64_t)CFSTR(".AllCategories"), v27);
            v37 = (void *)qword_1EE1DDE70;
            objc_msgSend_substringToIndex_(v25, v38, v36, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v37, v41, MEMORY[0x1E0C9AAB0], (uint64_t)v40);
            goto LABEL_29;
          }
        }
        else
        {
          if (!p_cache[453])
          {
            v42 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            v43 = p_cache[453];
            p_cache[453] = v42;

          }
          AppBooleanValue = CFPreferencesGetAppBooleanValue(v18, CFSTR("com.apple.logging"), 0);
          dword_1ECD90A70 |= AppBooleanValue != 0;
          if (AppBooleanValue)
          {
            v31 = p_cache[453];
            objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v26, 1, v27);
            v32 = objc_claimAutoreleasedReturnValue();
LABEL_28:
            v40 = (void *)v32;
            objc_msgSend_setObject_forKey_(v31, v33, v32, (uint64_t)v25);
LABEL_29:

            p_cache = (void **)(IMTimer + 16);
          }
        }
        if ((objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("Messages"), v27) & 1) != 0
          || objc_msgSend_isEqualToString_(v25, v45, (uint64_t)CFSTR("FaceTime"), v46))
        {
          v47 = (void *)qword_1EE1DDE70;
          if (!qword_1EE1DDE70)
          {
            v48 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            v49 = (void *)qword_1EE1DDE70;
            qword_1EE1DDE70 = (uint64_t)v48;

            v47 = (void *)qword_1EE1DDE70;
          }
          objc_msgSend_setObject_forKey_(v47, v45, MEMORY[0x1E0C9AAB0], (uint64_t)v25);
        }

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v117, (uint64_t)v125, 16);
      if (!v15)
      {
LABEL_37:

        v51 = 0;
        goto LABEL_39;
      }
    }
  }
  dword_1ECD90A70 = 0;
  v51 = 1;
LABEL_39:
  objc_msgSend_objectForKey_(p_cache[453], v7, (uint64_t)CFSTR("Messages"), v8);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_intValue(v52, v53, v54, v55);

  if (v56 >= 1)
  {
    v59 = p_cache[453];
    if (!v59)
    {
      v60 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v61 = p_cache[453];
      p_cache[453] = v60;

      v59 = p_cache[453];
    }
    v62 = MEMORY[0x1E0C9AAB0];
    objc_msgSend_setObject_forKey_(v59, v57, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("MessagesEvent"));
    objc_msgSend_setObject_forKey_(p_cache[453], v63, v62, (uint64_t)CFSTR("IDS"));
    objc_msgSend_setObject_forKey_(p_cache[453], v64, v62, (uint64_t)CFSTR("IDSIDQuery"));
    objc_msgSend_setObject_forKey_(p_cache[453], v65, v62, (uint64_t)CFSTR("Transport"));
    dword_1ECD90A70 = 1;
  }
  if (byte_1ECD90E38)
    v66 = v51;
  else
    v66 = 1;
  if ((v66 & 1) == 0)
  {
    objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v57, (uint64_t)CFSTR("Registration"), v58, CFSTR("Transport"), CFSTR("LocalPreview"), CFSTR("IDSIDQuery"), CFSTR("CallFilter"), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v68, (uint64_t)CFSTR("Messages"), v69, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (!p_cache[453])
    {
      v71 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v72 = p_cache[453];
      p_cache[453] = v71;

    }
    if (!qword_1ECD90E30)
    {
      v73 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v74 = (void *)qword_1ECD90E30;
      qword_1ECD90E30 = (uint64_t)v73;

    }
    dword_1ECD90A70 = 1;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v75 = v67;
    v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v113, (uint64_t)v124, 16);
    if (v77)
    {
      v79 = v77;
      v80 = *(_QWORD *)v114;
      v81 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (j = 0; j != v79; ++j)
        {
          if (*(_QWORD *)v114 != v80)
            objc_enumerationMutation(v75);
          objc_msgSend_setObject_forKey_(p_cache[453], v78, v81, *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j));
        }
        v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v78, (uint64_t)&v113, (uint64_t)v124, 16);
      }
      while (v79);
    }

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v83 = v70;
    v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v109, (uint64_t)v123, 16);
    if (v85)
    {
      v87 = v85;
      v88 = *(_QWORD *)v110;
      v89 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (k = 0; k != v87; ++k)
        {
          if (*(_QWORD *)v110 != v88)
            objc_enumerationMutation(v83);
          objc_msgSend_setObject_forKey_((void *)qword_1ECD90E30, v86, v89, *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * k));
        }
        v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v109, (uint64_t)v123, 16);
      }
      while (v87);
    }

  }
  if (((v51 | isCarrierInstall ^ 1) & 1) == 0)
  {
    objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v57, (uint64_t)CFSTR("Registration"), v58, CFSTR("Transport"), 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (!p_cache[453])
    {
      v92 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v93 = p_cache[453];
      p_cache[453] = v92;

    }
    dword_1ECD90A70 = 1;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v94 = v91;
    v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v105, (uint64_t)v122, 16);
    if (v96)
    {
      v98 = v96;
      v99 = *(_QWORD *)v106;
      v100 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (m = 0; m != v98; ++m)
        {
          if (*(_QWORD *)v106 != v99)
            objc_enumerationMutation(v94);
          objc_msgSend_setObject_forKey_(p_cache[453], v97, v100, *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * m));
        }
        v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v97, (uint64_t)&v105, (uint64_t)v122, 16);
      }
      while (v98);
    }

  }
  if (qword_1ECD90E40 != -1)
    dispatch_once(&qword_1ECD90E40, &unk_1E2C46530);
  return pthread_mutex_unlock(&stru_1ECD90A30);
}

void sub_1906B1710()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)j__IMSyncLoggingsPreferences, CFSTR("kMarcoSyncLoggingPrefs"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void _IMOverrideCanLogMessageBodies(uint64_t a1, char a2)
{
  byte_1EE1DDE78 = a2;
}

BOOL IMShouldLogMessageBodies()
{
  BOOL v0;

  if (byte_1ECD90E38)
    v0 = byte_1EE1DDE78 == 0;
  else
    v0 = 1;
  return !v0 || IMShouldLog(CFSTR("Messages"), 1);
}

__CFString *IMLoggingStringForMessageData(void *a1)
{
  id v1;
  BOOL v2;
  __CFString *v3;

  v1 = a1;
  if (byte_1ECD90E38)
    v2 = byte_1EE1DDE78 == 0;
  else
    v2 = 1;
  if (v2 && !IMShouldLog(CFSTR("Messages"), 1))
    v3 = CFSTR("<< Message Not Loggable >>");
  else
    v3 = (__CFString *)v1;

  return v3;
}

uint64_t IMWarnString_V()
{
  return 0;
}

uint64_t _IMWarnString_V()
{
  return 0;
}

uint64_t IMLogStringWithFileAndLine_V()
{
  return 0;
}

uint64_t _IMLogStringWithFileAndLine_V()
{
  return 1;
}

uint64_t IMLogString_V()
{
  return 0;
}

uint64_t _IMLogString_V()
{
  return 0;
}

uint64_t IMLogString()
{
  return 0;
}

uint64_t IMLogEventString_V()
{
  return 0;
}

uint64_t _IMLogEventString_V()
{
  return 0;
}

uint64_t IMLogEventString()
{
  return 0;
}

uint64_t IMLogCurrentBacktrace_V()
{
  return 0;
}

uint64_t IMLogCurrentBacktrace()
{
  return 0;
}

uint64_t sub_1906B1850(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_sharedInstance(IMLockdownManager, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD90E38 = objc_msgSend_isInternalInstall(v4, v5, v6, v7);

  return IMSyncLoggingsPreferences();
}

void sub_1906B188C(void *a1, void *a2, void *a3, void *a4, void *a5, int64_t a6, int64_t a7)
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  xpc_object_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _xpc_connection_s *connection;

  connection = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (connection)
  {
    v17 = xpc_dictionary_create(0, 0, 0);
    v18 = v17;
    if (v17)
    {
      xpc_dictionary_set_int64(v17, "__xpc__event_code__", 0);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v18, "sessionType", v19, v20, v21, v22, v23, v24, (uint64_t)v15);
      if (v16)
        IMInsertNSStringsToXPCDictionary(v18, "sender", v19, v20, v21, v22, v23, v24, (uint64_t)v16);
      xpc_dictionary_set_int64(v18, "beginSessionFlags", a6);
      xpc_dictionary_set_int64(v18, "endSessionFlags", a7);
      if (v14)
      {
        if (!v13)
        {
          v13 = MEMORY[0x1E0C80D38];
          v25 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v18, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v18);
      }
    }

  }
}

void sub_1906B19E0(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _xpc_connection_s *connection;

  connection = a1;
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (connection)
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    v14 = v13;
    if (v13)
    {
      xpc_dictionary_set_int64(v13, "__xpc__event_code__", 1);
      if (v11)
        IMInsertNSStringsToXPCDictionary(v14, "sessionType", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
      if (v12)
        IMInsertNSStringsToXPCDictionary(v14, "sender", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
      if (v10)
      {
        if (!v9)
        {
          v9 = MEMORY[0x1E0C80D38];
          v21 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v14, v9, v10);
      }
      else
      {
        xpc_connection_send_message(connection, v14);
      }
    }

  }
}

void sub_1906B1AFC(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, double a7)
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_object_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _xpc_connection_s *connection;

  connection = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (connection)
  {
    v18 = xpc_dictionary_create(0, 0, 0);
    v19 = v18;
    if (v18)
    {
      xpc_dictionary_set_int64(v18, "__xpc__event_code__", 2);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v19, "checkpoint", v20, v21, v22, v23, v24, v25, (uint64_t)v15);
      if (v16)
        IMInsertNSStringsToXPCDictionary(v19, "session", v20, v21, v22, v23, v24, v25, (uint64_t)v16);
      if (v17)
        IMInsertNSStringsToXPCDictionary(v19, "sender", v20, v21, v22, v23, v24, v25, (uint64_t)v17);
      xpc_dictionary_set_double(v19, "time", a7);
      if (v14)
      {
        if (!v13)
        {
          v13 = MEMORY[0x1E0C80D38];
          v26 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v19, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v19);
      }
    }

  }
}

void sub_1906B1C60(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, double a8)
{
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  xpc_object_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _xpc_connection_s *connection;

  connection = a1;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  if (connection)
  {
    v21 = xpc_dictionary_create(0, 0, 0);
    v22 = v21;
    if (v21)
    {
      xpc_dictionary_set_int64(v21, "__xpc__event_code__", 3);
      if (v17)
        IMInsertNSStringsToXPCDictionary(v22, "description", v23, v24, v25, v26, v27, v28, (uint64_t)v17);
      if (v18)
        IMInsertNSStringsToXPCDictionary(v22, "logString", v23, v24, v25, v26, v27, v28, (uint64_t)v18);
      if (v19)
        IMInsertNSStringsToXPCDictionary(v22, "sessionType", v23, v24, v25, v26, v27, v28, (uint64_t)v19);
      if (v20)
        IMInsertNSStringsToXPCDictionary(v22, "sender", v23, v24, v25, v26, v27, v28, (uint64_t)v20);
      xpc_dictionary_set_double(v22, "time", a8);
      if (v16)
      {
        if (!v15)
        {
          v15 = MEMORY[0x1E0C80D38];
          v29 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v22, v15, v16);
      }
      else
      {
        xpc_connection_send_message(connection, v22);
      }
    }

  }
}

void sub_1906B1DF4(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  xpc_object_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _xpc_connection_s *connection;

  connection = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (connection)
  {
    v19 = xpc_dictionary_create(0, 0, 0);
    v20 = v19;
    if (v19)
    {
      xpc_dictionary_set_int64(v19, "__xpc__event_code__", 4);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v20, "category", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
      if (v16)
        IMInsertNSStringsToXPCDictionary(v20, "callInfo", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
      if (v17)
        IMInsertNSStringsToXPCDictionary(v20, "session", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
      if (v18)
        IMInsertNSStringsToXPCDictionary(v20, "sender", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      if (v14)
      {
        if (!v13)
        {
          v13 = MEMORY[0x1E0C80D38];
          v27 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v20, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v20);
      }
    }

  }
}

void sub_1906B1F68(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  xpc_object_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _xpc_connection_s *connection;

  connection = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (connection)
  {
    v19 = xpc_dictionary_create(0, 0, 0);
    v20 = v19;
    if (v19)
    {
      xpc_dictionary_set_int64(v19, "__xpc__event_code__", 5);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v20, "description", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
      if (v16)
        IMInsertNSStringsToXPCDictionary(v20, "logString", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
      if (v17)
        IMInsertNSStringsToXPCDictionary(v20, "session", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
      if (v18)
        IMInsertNSStringsToXPCDictionary(v20, "sender", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      if (v14)
      {
        if (!v13)
        {
          v13 = MEMORY[0x1E0C80D38];
          v27 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v20, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v20);
      }
    }

  }
}

void sub_1906B20DC(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  xpc_object_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _xpc_connection_s *connection;

  connection = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (connection)
  {
    v19 = xpc_dictionary_create(0, 0, 0);
    v20 = v19;
    if (v19)
    {
      xpc_dictionary_set_int64(v19, "__xpc__event_code__", 6);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v20, "description", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
      if (v16)
        IMInsertCodableObjectsToXPCDictionary(v20, "number", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
      if (v17)
        IMInsertNSStringsToXPCDictionary(v20, "session", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
      if (v18)
        IMInsertNSStringsToXPCDictionary(v20, "sender", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      if (v14)
      {
        if (!v13)
        {
          v13 = MEMORY[0x1E0C80D38];
          v27 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v20, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v20);
      }
    }

  }
}

void sub_1906B2250(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _xpc_connection_s *connection;

  connection = a1;
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (connection)
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    v14 = v13;
    if (v13)
    {
      xpc_dictionary_set_int64(v13, "__xpc__event_code__", 7);
      if (v11)
        IMInsertNSStringsToXPCDictionary(v14, "session", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
      if (v12)
        IMInsertNSStringsToXPCDictionary(v14, "sender", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
      if (v10)
      {
        if (!v9)
        {
          v9 = MEMORY[0x1E0C80D38];
          v21 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v14, v9, v10);
      }
      else
      {
        xpc_connection_send_message(connection, v14);
      }
    }

  }
}

void sub_1906B236C(void *a1, void *a2, void *a3, int64_t a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  xpc_object_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _xpc_connection_s *connection;

  connection = a1;
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (connection)
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    v16 = v15;
    if (v15)
    {
      xpc_dictionary_set_int64(v15, "__xpc__event_code__", 8);
      if (a4)
        xpc_dictionary_set_int64(v16, "action", a4);
      if (v13)
        IMInsertNSStringsToXPCDictionary(v16, "session", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
      if (v14)
        IMInsertNSStringsToXPCDictionary(v16, "sender", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
      if (v12)
      {
        if (!v11)
        {
          v11 = MEMORY[0x1E0C80D38];
          v23 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v16, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v16);
      }
    }

  }
}

void sub_1906B24A4(void *a1, void *a2, void *a3, int64_t a4, void *a5, void *a6, void *a7)
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_object_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _xpc_connection_s *connection;

  connection = a1;
  v13 = a2;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (connection)
  {
    v18 = xpc_dictionary_create(0, 0, 0);
    v19 = v18;
    if (v18)
    {
      xpc_dictionary_set_int64(v18, "__xpc__event_code__", 9);
      if (a4)
        xpc_dictionary_set_int64(v19, "action", a4);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v19, "session", v20, v21, v22, v23, v24, v25, (uint64_t)v15);
      if (v16)
        IMInsertNSStringsToXPCDictionary(v19, "sender", v20, v21, v22, v23, v24, v25, (uint64_t)v16);
      if (v17)
        IMInsertDictionariesToXPCDictionary(v19, "userInfo", v20, v21, v22, v23, v24, v25, (uint64_t)v17);
      if (v14)
      {
        if (!v13)
        {
          v13 = MEMORY[0x1E0C80D38];
          v26 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v19, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v19);
      }
    }

  }
}

void sub_1906B260C(void *a1, void *a2, void *a3, int64_t a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  xpc_object_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _xpc_connection_s *connection;

  connection = a1;
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (connection)
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    v16 = v15;
    if (v15)
    {
      xpc_dictionary_set_int64(v15, "__xpc__event_code__", 10);
      if (a4)
        xpc_dictionary_set_int64(v16, "event", a4);
      if (v13)
        IMInsertNSStringsToXPCDictionary(v16, "session", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
      if (v14)
        IMInsertNSStringsToXPCDictionary(v16, "sender", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
      if (v12)
      {
        if (!v11)
        {
          v11 = MEMORY[0x1E0C80D38];
          v23 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v16, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v16);
      }
    }

  }
}

void sub_1906B2744(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  xpc_object_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _xpc_connection_s *connection;

  connection = a1;
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (connection)
  {
    v16 = xpc_dictionary_create(0, 0, 0);
    v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_int64(v16, "__xpc__event_code__", 13);
      if (v13)
        IMInsertNSStringsToXPCDictionary(v17, "failureReason", v18, v19, v20, v21, v22, v23, (uint64_t)v13);
      if (v14)
        IMInsertNSStringsToXPCDictionary(v17, "session", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v17, "sender", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      if (v12)
      {
        if (!v11)
        {
          v11 = MEMORY[0x1E0C80D38];
          v24 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v17, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v17);
      }
    }

  }
}

void sub_1906B2888(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  xpc_object_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _xpc_connection_s *connection;

  connection = a1;
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (connection)
  {
    v16 = xpc_dictionary_create(0, 0, 0);
    v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_int64(v16, "__xpc__event_code__", 11);
      if (v13)
        IMInsertNSStringsToXPCDictionary(v17, "initiator", v18, v19, v20, v21, v22, v23, (uint64_t)v13);
      if (v14)
        IMInsertNSStringsToXPCDictionary(v17, "session", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v17, "sender", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      if (v12)
      {
        if (!v11)
        {
          v11 = MEMORY[0x1E0C80D38];
          v24 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v17, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v17);
      }
    }

  }
}

void sub_1906B29CC(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  xpc_object_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _xpc_connection_s *connection;

  connection = a1;
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (connection)
  {
    v16 = xpc_dictionary_create(0, 0, 0);
    v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_int64(v16, "__xpc__event_code__", 12);
      if (v13)
        IMInsertNSStringsToXPCDictionary(v17, "receiver", v18, v19, v20, v21, v22, v23, (uint64_t)v13);
      if (v14)
        IMInsertNSStringsToXPCDictionary(v17, "session", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v17, "sender", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      if (v12)
      {
        if (!v11)
        {
          v11 = MEMORY[0x1E0C80D38];
          v24 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v17, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v17);
      }
    }

  }
}

void sub_1906B2B10(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  xpc_object_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _xpc_connection_s *connection;

  connection = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (connection)
  {
    v19 = xpc_dictionary_create(0, 0, 0);
    v20 = v19;
    if (v19)
    {
      xpc_dictionary_set_int64(v19, "__xpc__event_code__", 14);
      if (v15)
        IMInsertNSStringsToXPCDictionary(v20, "session", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
      if (v16)
        IMInsertNSStringsToXPCDictionary(v20, "sender", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
      if (v17)
        IMInsertNSStringsToXPCDictionary(v20, "category", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
      if (v18)
        IMInsertNSStringsToXPCDictionary(v20, "path", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      if (v14)
      {
        if (!v13)
        {
          v13 = MEMORY[0x1E0C80D38];
          v27 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v20, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v20);
      }
    }

  }
}

void sub_1906B2C84(void *a1, void *a2, void *a3, void *a4, void *a5, int a6, uint64_t a7, void *a8, void *a9)
{
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  xpc_object_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _xpc_connection_s *connection;

  connection = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  if (connection)
  {
    v22 = xpc_dictionary_create(0, 0, 0);
    v23 = v22;
    if (v22)
    {
      xpc_dictionary_set_int64(v22, "__xpc__event_code__", 15);
      if (a7)
        xpc_dictionary_set_uint64(v23, "time", a7);
      if (v18)
        IMInsertNSStringsToXPCDictionary(v23, "type", v24, v25, v26, v27, v28, v29, (uint64_t)v18);
      if (v19)
        IMInsertNSStringsToXPCDictionary(v23, "logString", v24, v25, v26, v27, v28, v29, (uint64_t)v19);
      if (a6)
        xpc_dictionary_set_int64(v23, "level", a6);
      if (v20)
        IMInsertNSStringsToXPCDictionary(v23, "category", v24, v25, v26, v27, v28, v29, (uint64_t)v20);
      if (v21)
        IMInsertNSStringsToXPCDictionary(v23, "sender", v24, v25, v26, v27, v28, v29, (uint64_t)v21);
      if (v17)
      {
        if (!v16)
        {
          v16 = MEMORY[0x1E0C80D38];
          v30 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v23, v16, v17);
      }
      else
      {
        xpc_connection_send_notification();
      }
    }

  }
}

void sub_1906B2E38(void *a1, void *a2, void *a3, void *a4, void *a5, int a6, uint64_t a7, void *a8, void *a9)
{
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  xpc_object_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _xpc_connection_s *connection;

  connection = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  if (connection)
  {
    v22 = xpc_dictionary_create(0, 0, 0);
    v23 = v22;
    if (v22)
    {
      xpc_dictionary_set_int64(v22, "__xpc__event_code__", 16);
      if (a7)
        xpc_dictionary_set_uint64(v23, "time", a7);
      if (v18)
        IMInsertNSStringsToXPCDictionary(v23, "type", v24, v25, v26, v27, v28, v29, (uint64_t)v18);
      if (v19)
        IMInsertNSStringsToXPCDictionary(v23, "eventString", v24, v25, v26, v27, v28, v29, (uint64_t)v19);
      if (a6)
        xpc_dictionary_set_int64(v23, "level", a6);
      if (v20)
        IMInsertNSStringsToXPCDictionary(v23, "category", v24, v25, v26, v27, v28, v29, (uint64_t)v20);
      if (v21)
        IMInsertNSStringsToXPCDictionary(v23, "sender", v24, v25, v26, v27, v28, v29, (uint64_t)v21);
      if (v17)
      {
        if (!v16)
        {
          v16 = MEMORY[0x1E0C80D38];
          v30 = MEMORY[0x1E0C80D38];
        }
        xpc_connection_send_message_with_reply(connection, v23, v16, v17);
      }
      else
      {
        xpc_connection_send_message(connection, v23);
      }
    }

  }
}

uint64_t _IMLoggingBeginSession()
{
  return 0;
}

uint64_t _IMLoggingEndSession()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric_Double()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric_Float()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric_Int()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric_Short()
{
  return 0;
}

uint64_t _IMLoggingNoteQuality_V()
{
  return 0;
}

uint64_t _IMLoggingNoteQuality()
{
  return 0;
}

uint64_t _IMLoggingLogCallInfo()
{
  return 0;
}

uint64_t _IMLoggingNoteCheckpoint_V()
{
  return 0;
}

uint64_t _IMLoggingNoteCheckpoint()
{
  return 0;
}

uint64_t _IMLoggingLog_V()
{
  return 0;
}

uint64_t _IMLoggingLog()
{
  return 0;
}

uint64_t _IMLoggingPulse()
{
  return 0;
}

uint64_t _IMLoggingEvent()
{
  return 0;
}

uint64_t _IMLoggingAction()
{
  return 0;
}

uint64_t _IMLoggingActionWithUserInfo()
{
  return 0;
}

uint64_t _IMLoggingSetInitiator()
{
  return 0;
}

uint64_t _IMLoggingSetFailureReason()
{
  return 0;
}

uint64_t _IMLoggingSetRecipient()
{
  return 0;
}

uint64_t _IMLoggingAddLogFile()
{
  return 0;
}

double sub_1906B313C(uint64_t a1)
{
  int v2;
  BOOL v3;
  int v4;
  int v5;
  timeval v7;

  v7.tv_sec = 0;
  *(_QWORD *)&v7.tv_usec = 0;
  gettimeofday(&v7, 0);
  v2 = *(_DWORD *)(a1 + 8);
  v4 = v7.tv_usec - v2;
  v3 = v7.tv_usec < v2;
  v5 = v7.tv_usec - v2 + 1000000;
  if (!v3)
    v5 = v4;
  return (double)v5 / 1000000.0 + (double)(v7.tv_sec - *(_QWORD *)a1 + (v4 >> 31));
}

uint64_t IMPerformPingTest(void *a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  IMPingTest *v12;
  const char *v13;
  void *v14;
  double v15;
  id v16;
  id v17;
  NSObject *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[4];
  dispatch_semaphore_t v25;
  id v26;
  id v27;

  v9 = a4;
  v10 = a1;
  v11 = dispatch_semaphore_create(0);
  v12 = [IMPingTest alloc];
  v14 = (void *)objc_msgSend_initWithAddress_wifi_(v12, v13, (uint64_t)v10, a3);

  v15 = (double)a2;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1906B3398;
  v24[3] = &unk_1E2C46578;
  v25 = v11;
  v26 = v14;
  v27 = v9;
  v16 = v9;
  v17 = v14;
  v18 = v11;
  objc_msgSend_startWithTimeout_queue_completionHandler_(v17, v19, 0, (uint64_t)v24, v15);
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_pingStats(v17, v20, v21, v22);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  return 1;
}

void sub_1906B3398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend_writeResultsToFile_error_(*(void **)(a1 + 40), v10, *(_QWORD *)(a1 + 48), 0);
  if (_IMWillLog(CFSTR("IMPingTest")))
    _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("completion handler"), v11, v12, v13, v14, v15, a9);
}

void sub_1906B3858(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1906B3874()
{
  __int128 v0;
  const char *v1;
  uint64_t v2;
  timeval v4;
  tm v5;

  v5.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v0 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v5.tm_mon = v0;
  *(_OWORD *)&v5.tm_isdst = v0;
  *(_OWORD *)&v5.tm_sec = v0;
  v4.tv_sec = 0;
  *(_QWORD *)&v4.tv_usec = 0;
  gettimeofday(&v4, 0);
  localtime_r(&v4.tv_sec, &v5);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v1, (uint64_t)CFSTR("%02d:%02d:%02d.%06d"), v2, v5.tm_hour, v5.tm_min, v5.tm_sec, v4.tv_usec);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1906B39E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1906B3BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1906B3D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1906B3F60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1906B4008(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1906B421C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1906B42C4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  v4 = a3;
  objc_msgSend_rtt(a2, v5, v6, v7);
  v9 = v8;
  objc_msgSend_rtt(v4, v10, v11, v12);
  v14 = v13;

  if (v9 <= v14)
    return 1;
  else
    return -1;
}

void sub_1906B4730(uint64_t a1, const char *a2)
{
  id v3;
  const char *v4;
  int v5;
  const char *v6;
  id v7;

  if (*(_BYTE *)(a1 + 64))
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    v5 = objc_msgSend__setupAndPerformPing_queue_completionHandler_(*(void **)(a1 + 32), v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    objc_sync_exit(v3);

    if (!v5)
      return;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, IMPingTestErrorDomain, 2, 0);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 48))
      return;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, IMPingTestErrorDomain, 1, 0);
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1906B480C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1906B4DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1906B4E0C(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  ssize_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  timeval v23;
  uint16x8_t v24;
  uint16x8_t v25;
  timeval v26;
  sockaddr v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (IMTimeOfDay() - *(double *)(a1 + 56) >= *(double *)(a1 + 64))
  {
    objc_msgSend_stop(*(void **)(a1 + 32), v2, v3, v4);
    return;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
    return;
  v5 = *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v6 = *(_DWORD *)(a1 + 96);
  v7 = *(unsigned __int16 *)(a1 + 100);
  v27 = *(sockaddr *)(a1 + 80);
  v24 = 0u;
  v25 = 0u;
  v23.tv_sec = 0;
  *(_QWORD *)&v23.tv_usec = 0;
  gettimeofday(&v23, 0);
  v24.i16[0] = 8;
  v24.i16[3] = bswap32(v5) >> 16;
  v24.i16[2] = bswap32(v7) >> 16;
  v26 = v23;
  if (!gettimeofday(&v26, 0))
  {
    v14 = vaddvq_s32(vaddq_s32((int32x4_t)vaddw_u16(vaddl_u16(*(uint16x4_t *)v24.i8, *(uint16x4_t *)v25.i8), (uint16x4_t)v26.tv_sec), (int32x4_t)vaddw_high_u16(vaddl_high_u16(v24, v25), (uint16x8_t)v26)));
    v24.i16[1] = ~(HIWORD(v14) + v14 + ((HIWORD(v14) + (unsigned __int16)v14) >> 16));
    v15 = sendto(v6, &v24, 0x30uLL, 0, &v27, 0x10u);
    v16 = 0;
    if (v15 == 48)
    {
LABEL_11:
      objc_msgSend_addEchoPacket_packetTimestamp_error_(*(void **)(a1 + 40), v8, *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v23.tv_sec, *(_QWORD *)&v23.tv_usec, v16);
      goto LABEL_12;
    }
    if (_IMWillLog(CFSTR("IMPingTest")))
    {
      v17 = __error();
      _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("Error(%d) sending sequence %d"), v18, v19, v20, v21, v22, *v17);
    }
  }
  if (!*__error())
  {
    v16 = 1;
    goto LABEL_11;
  }
  v9 = *__error();
  objc_msgSend_addEchoPacket_packetTimestamp_error_(*(void **)(a1 + 40), v10, *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v23.tv_sec, *(_QWORD *)&v23.tv_usec, v9);
LABEL_12:
  objc_msgSend_timeoutOldSequenceNumbers_(*(void **)(a1 + 40), v11, v12, v13, *(double *)(a1 + 72));
  ++*(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

void sub_1906B5150(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  id v10;
  id v11;

  close(*(_DWORD *)(a1 + 48));
  objc_msgSend_pingStats(*(void **)(*(_QWORD *)(a1 + 32) + 24), v2, v3, v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v9 = (int)objc_msgSend_packetsSuccessfullySent(v11, v5, v6, v7) > 0;
    (*(void (**)(uint64_t, id, _BOOL8, _QWORD))(v8 + 16))(v8, v11, v9, 0);
  }
  v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  objc_sync_exit(v10);

}

void sub_1906B51E4(uint64_t a1)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  id v4;
  unsigned int v5;
  ssize_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _BYTE *v11;
  socklen_t v12;
  sockaddr v13;
  _BYTE __b[2048];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 32))
  {
    v2 = *(_DWORD *)(a1 + 40);
    v3 = *(unsigned __int16 *)(a1 + 60);
    v4 = *(id *)(v1 + 24);
    v5 = bswap32(v3) >> 16;
    while (1)
    {
      memset(__b, 170, sizeof(__b));
      *(_QWORD *)&v13.sa_len = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v13.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
      v12 = 16;
      v6 = recvfrom(v2, __b, 0x800uLL, 0, &v13, &v12);
      v9 = v6;
      if (v6 < 0)
      {
        if (*__error())
          break;
      }
      v10 = 4 * (__b[0] & 0xF);
      if (((v9 - (_DWORD)v10) & 0xFFFFFFF0) >= 0x30uLL)
      {
        v11 = &__b[v10];
        if (!*v11 && *((unsigned __int16 *)v11 + 2) == v5)
          objc_msgSend_addEchoReplyPacket_(v4, v7, bswap32(*((unsigned __int16 *)v11 + 3)) >> 16, v8);
      }
    }

  }
}

void sub_1906B53AC()
{
  OSLogHandleManager *v0;
  void *v1;

  v0 = objc_alloc_init(OSLogHandleManager);
  v1 = (void *)qword_1ECD90FF0;
  qword_1ECD90FF0 = (uint64_t)v0;

}

id OSLogHandleForIMFoundationCategory(const void *a1)
{
  return sub_190679084(a1, qword_1ECD90D48, "com.apple.Messages");
}

id OSLogHandleForIMEventCategory(const void *a1)
{
  return sub_190679084(a1, qword_1ECD90C30, "com.apple.MessagesEvents");
}

id OSLogHandleForFaceTimeCategory(const void *a1)
{
  return sub_190679084(a1, qword_1EE1DDE80, "com.apple.FaceTime");
}

id OSLogHandleForRegistrationCategory(const void *a1)
{
  return sub_190679084(a1, qword_1ECD90B90, "com.apple.Registration");
}

id OSLogHandleForPDSCategory(const void *a1)
{
  return sub_190679084(a1, qword_1ECD90B90, "com.apple.PDS");
}

void sub_1906B5900(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v9);
  }

}

void sub_1906B5AB4(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (objc_msgSend_count(a3, v5, v6, v7))
    objc_msgSend_addObject_(*(void **)(a1 + 32), v8, (uint64_t)v10, v9);

}

void *sub_1906B5CBC()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("IOPMAssertionCreateWithName", CFSTR("IOKit"));
  off_1EE1DDED0 = result;
  return result;
}

void *sub_1906B5CE8()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("IOPMAssertionCreateWithDescription", CFSTR("IOKit"));
  off_1EE1DD560 = result;
  return result;
}

void *sub_1906B5FE4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("IOPMAssertionCreateWithProperties", CFSTR("IOKit"));
  off_1EE1DDEE0 = result;
  return result;
}

void *sub_1906B60E4()
{
  void *result;

  result = (void *)IMWeakLinkSymbol("IOPMAssertionRelease", CFSTR("IOKit"));
  off_1EE1DD570 = result;
  return result;
}

void sub_1906B6234(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 136315138;
  v4 = v2;
  _os_log_error_impl(&dword_19066D000, a2, OS_LOG_TYPE_ERROR, "Dispatch registration invoked - missing handler {name: %s}", (uint8_t *)&v3, 0xCu);
  sub_190688EAC();
}

void sub_1906B62A8(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *a2;
  v5 = 136315394;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_19066D000, log, OS_LOG_TYPE_ERROR, "Dispatch registration invoked - fetched state, missing handler {name: %s, state: %u}", (uint8_t *)&v5, 0x12u);
  sub_190688EAC();
}

void sub_1906B6330()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_190688ED8();
  sub_190688EA0(&dword_19066D000, v0, v1, "Skipping photo sharing results for outgoing message", v2);
  sub_190688ED0();
}

void sub_1906B6360(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = 0;
  v5 = 2112;
  v6 = CFSTR("NO");
  sub_190688F34(&dword_19066D000, a1, a3, "Failed to get photo sharing responses due to invalid preconditions. string: %@, isOutgoing: %@", (uint8_t *)&v3);
  sub_190688EAC();
}

void sub_1906B63E0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_190688ED8();
  sub_190688F28(&dword_19066D000, v0, v1, "Failed to get photo sharing responses. Timed out.", v2);
  sub_190688ED0();
}

void sub_1906B6410()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_190688ED8();
  sub_190688EA0(&dword_19066D000, v0, v1, "Getting photo sharing results", v2);
  sub_190688ED0();
}

void sub_1906B6440()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  sub_190688F10();
  sub_190688F34(&dword_19066D000, v0, (uint64_t)v0, "Failed to add photo sharing results due to invalid preconditions. attributedString: %@, responses: %@", v1);
  sub_190688EAC();
}

void sub_1906B64A8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_190688ED8();
  sub_190688EA0(&dword_19066D000, v0, v1, "No photo sharing intent found", v2);
  sub_190688ED0();
}

void sub_1906B64D8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_190688EB4(a1, a2);
  sub_190688F28(&dword_19066D000, v2, (uint64_t)v2, "Mismatched count between photoKeywords and photoKeywordRanges!", v3);
}

void sub_1906B6504(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_190688E90(&dword_19066D000, a2, a3, " => Out attributed string: %@", a5, a6, a7, a8, 2u);
  sub_190688EAC();
}

void sub_1906B656C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "    Adding Photo Sharing Results: %@", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B65CC(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_190688EB4(a1, a2);
  sub_190688EA0(&dword_19066D000, v2, (uint64_t)v2, "Not adding to core recents, message is from me", v3);
}

void sub_1906B65F8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_190688EB4(a1, a2);
  sub_190688EA0(&dword_19066D000, v2, (uint64_t)v2, "Found an address category", v3);
}

void sub_1906B6624(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_190688EB4(a1, a2);
  sub_190688EA0(&dword_19066D000, v2, (uint64_t)v2, "Result with money category was not handled", v3);
}

void sub_1906B6650(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_190688EB4(a1, a2);
  sub_190688EA0(&dword_19066D000, v2, (uint64_t)v2, "Found a result with money category", v3);
}

void sub_1906B667C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, " => Results: %@", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B66DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "    Final DD Results: %@", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B673C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "    PhoneScannerResults: %@", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B679C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "       DDScannerResults: %@", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B67FC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_190688ED8();
  sub_190688EA0(&dword_19066D000, v0, v1, " => Hit!", v2);
  sub_190688ED0();
}

void sub_1906B682C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_190688ED8();
  sub_190688EA0(&dword_19066D000, v0, v1, " => No hit", v2);
  sub_190688ED0();
}

void sub_1906B685C()
{
  os_log_t v0;
  uint8_t v1[22];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  sub_190688EF8();
  v2 = 2112;
  v3 = 0;
  _os_log_debug_impl(&dword_19066D000, v0, OS_LOG_TYPE_DEBUG, "_DDScannerResultClass = %p, ddScannerResult = %p, keyedArchivedData = %@", v1, 0x20u);
}

void sub_1906B68DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "Found an address category %@", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B693C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "Appended link attribute (%@)", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B699C()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  sub_190688EF8();
  sub_190688EE4(&dword_19066D000, v0, v1, "* Found link result category %p, %p", v2, v3);
  sub_190688EAC();
}

void sub_1906B69FC()
{
  uint64_t v0;
  os_log_t v1;

  sub_190688F10();
  sub_190688EE4(&dword_19066D000, v0, v1, "Found one time code:%@(%@)");
  sub_190688EAC();
}

void sub_1906B6A5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "Adding Events to core recent (event %@)", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B6ABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "CoreRecents metadata:%@", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B6B1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_190688EC4();
  sub_190688E90(&dword_19066D000, v0, v1, "recordContactEvents:recentsDomain:sendingAddress:completion: error %@", v2, v3, v4, v5, v6);
  sub_190688EAC();
}

void sub_1906B6B7C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19068FEE8(&dword_19066D000, a2, a3, "Empty service query with account: %@", a5, a6, a7, a8, 2u);
}

void sub_1906B6BE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19068FEE8(&dword_19066D000, a2, a3, "Empty account query with service: %@", a5, a6, a7, a8, 2u);
}

void sub_1906B6C4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19068FEDC();
  sub_19068FED0();
  sub_19068FEC0(&dword_19066D000, v0, v1, "IMSetKeychainPassword: Could not store password (error: %d)", v2, v3, v4, v5, v6);
  sub_190688ED0();
}

void sub_1906B6CAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19068FEDC();
  sub_19068FED0();
  sub_19068FEC0(&dword_19066D000, v0, v1, "IMRemoveKeychainPassword: Could not remove password (error %d)", v2, v3, v4, v5, v6);
  sub_190688ED0();
}

void sub_1906B6D0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19068FEDC();
  sub_19068FED0();
  sub_19068FEC0(&dword_19066D000, v0, v1, "IMSetKeychainAuthToken: Could not store auth token (error %d)", v2, v3, v4, v5, v6);
  sub_190688ED0();
}

void sub_1906B6D6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19068FEDC();
  sub_19068FED0();
  sub_19068FEC0(&dword_19066D000, v0, v1, "IMRemoveKeychainAuthToken: Could not remove auth token (error %d)", v2, v3, v4, v5, v6);
  sub_190688ED0();
}

void sub_1906B6DCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[8];
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sub_19068FED0();
  v5 = 2112;
  v6 = v0;
  v7 = 2112;
  v8 = v1;
  v9 = 2112;
  v10 = v2;
  _os_log_fault_impl(&dword_19066D000, v3, OS_LOG_TYPE_FAULT, "IMSetKeychainData: %d -- Could not perform synchronized store for service: %@   account: %@%@", v4, 0x26u);
}

void sub_1906B6E6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19068FEDC();
  sub_19068FED0();
  sub_19068FEC0(&dword_19066D000, v0, v1, "IMSetKeychainPassword: Could not store temporary password (error: %d)", v2, v3, v4, v5, v6);
  sub_190688ED0();
}

void sub_1906B6ECC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19066D000, a2, OS_LOG_TYPE_ERROR, "Fatal Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1906B6F40()
{
  __assert_rtn("-[IMLocalObject _enqueueInvocationWithPriority:xpcMessage:priority:]", "IMRemoteObjects.m", 1130, "[invocation selector] == @selector(sendMessageWithSendParameters:)");
}

void sub_1906B6F68(void *a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  id v5;

  objc_begin_catch(a1);
  if (qword_1ECD90B88 != -1)
    dispatch_once(&qword_1ECD90B88, &unk_1E2C431E8);
  v4 = (void *)qword_1ECD90B80;
  *a3 = qword_1ECD90B80;
  v5 = v4;
  objc_end_catch();
}

void sub_1906B6FC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19069E8BC(&dword_19066D000, a2, a3, "IMRemoteObjectXPC Error - Exception caught unarchiving: %@", a5, a6, a7, a8, 2u);
}

void sub_1906B702C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19069E8BC(&dword_19066D000, a2, a3, "IMRemoteObjectXPC Error - Error caught unarchiving: %@", a5, a6, a7, a8, 2u);
}

void sub_1906B7094(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19069E8BC(&dword_19066D000, a2, a3, "Called into MAEGetActivationStateWithError {value: %@}", a5, a6, a7, a8, 2u);
}

void sub_1906B70FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_19069E8BC(&dword_19066D000, a2, a3, "Error calling into MAEGetActivationStateWithError {error: %@}", a5, a6, a7, a8, 2u);
}

void sub_1906B7164(void *a1)
{

  objc_end_catch();
}

void sub_1906B7184(void *a1)
{

  objc_end_catch();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1E0C97D08](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1E0C98AF0](plist, format);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1E0C98C28](rl);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x1E0C98C58](rl);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  MEMORY[0x1E0C98EF8](theString, formatOptions, format, arguments);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x1E0C99258](theString);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99400](allocator, originalString, charactersToLeaveEscaped);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x1E0C995D8](userNotification);
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1E0D131E0]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x1E0D131E8]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x1E0CE8758](store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE8768](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE8798](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87A8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87B0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddressPair(CFAllocatorRef allocator, const sockaddr *localAddress, const sockaddr *remoteAddress)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C0](allocator, localAddress, remoteAddress);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE88F8](target, queue);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

uint64_t SecPolicyCreateAppleIDSServiceContext()
{
  return MEMORY[0x1E0CD6490]();
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1E0CD66B8](trust, queue, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1E0CD6748](trust, policies);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFDictionaryIsMutable()
{
  return MEMORY[0x1E0C9A110]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1E0C9A7F0]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1E0C9A808]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1E0CA6F40]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x1E0CA6F88]();
}

uint64_t _CTServerConnectionIsPhoneNumberCredentialValid()
{
  return MEMORY[0x1E0CA7008]();
}

uint64_t _CTServerConnectionIsUserIdentityModuleRequired()
{
  return MEMORY[0x1E0CA7010]();
}

uint64_t _CTServerConnectionPacketContextAssertionCreate()
{
  return MEMORY[0x1E0CA7020]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1E0CA7078]();
}

uint64_t _NSNewStringByAppendingStrings()
{
  return MEMORY[0x1E0CB3C40]();
}

uint64_t _SecItemAddAndNotifyOnSync()
{
  return MEMORY[0x1E0CD67F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x1E0DE7A40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void asl_close(asl_object_t obj)
{
  MEMORY[0x1E0C815C0](obj);
}

void asl_free(asl_object_t obj)
{
  MEMORY[0x1E0C815C8](obj);
}

asl_object_t asl_new(uint32_t type)
{
  return (asl_object_t)MEMORY[0x1E0C815D8](*(_QWORD *)&type);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x1E0C815E0](ident, facility, *(_QWORD *)&opts);
}

int asl_send(asl_object_t obj, asl_object_t msg)
{
  return MEMORY[0x1E0C815E8](obj, msg);
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  return MEMORY[0x1E0C815F0](obj, key, value);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x1E0C836B0](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

protoent *__cdecl getprotobyname(const char *a1)
{
  return (protoent *)MEMORY[0x1E0C83780](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1E0C83910](a1);
}

in_addr_t inet_addr(const char *a1)
{
  return MEMORY[0x1E0C83950](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

uint64_t lockdown_copy_activationState()
{
  return MEMORY[0x1E0DE6C50]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

int objc_getClassList(Class *buffer, int bufferCount)
{
  return MEMORY[0x1E0DE7CB8](buffer, *(_QWORD *)&bufferCount);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1E0C849E8]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x1E0C84AE8](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C84B28](a1, a2);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE80A0](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1E0C84DB8](a1, a2, a3);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1E0C85068](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1E0C85310](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

void srandom(unsigned int a1)
{
  MEMORY[0x1E0C85488](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1E0DE5958](*(_QWORD *)&c);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C85B10]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_enable_sim2host_4sim()
{
  return MEMORY[0x1E0C85FC0]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1E0C86000](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1E0C86058]();
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1E0C864B0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

