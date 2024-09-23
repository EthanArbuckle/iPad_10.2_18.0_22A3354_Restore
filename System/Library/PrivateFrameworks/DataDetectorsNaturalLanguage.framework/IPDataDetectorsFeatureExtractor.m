@implementation IPDataDetectorsFeatureExtractor

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  NSUInteger v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v89;
  id obj;
  void *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD block[5];
  id v102;
  id v103;
  id v104;
  id v105;
  _QWORD *v106;
  uint64_t *v107;
  id v108;
  char v109;
  char v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  _QWORD v115[5];
  id v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;
  NSRange v120;
  NSRange v121;

  v119 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v83 = a4;
  v87 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 30);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "originalMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateSent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x3032000000;
  v115[3] = __Block_byref_object_copy__1;
  v115[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v116 = (id)objc_claimAutoreleasedReturnValue();
  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  objc_msgSend(v87, "objectForKey:", CFSTR("IPFeatureExtractorDetectedDateInSubjectFeatureData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v11;
  objc_msgSend(v11, "contextDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v82, "contextDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timeIsApproximate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  v19 = objc_msgSend(v7, "length");
  objc_msgSend(v87, "objectForKey:", CFSTR("IPFeatureExtractorContextText"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v7, "copy");
  v85 = v20;
  if (v20)
  {
    v19 = objc_msgSend(v7, "length");
    objc_msgSend(v20, "stringByAppendingString:", v7);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v8;
    v20 = (void *)(objc_msgSend(v20, "length") + 1);
    v7 = (id)v21;
  }
  else
  {
    v22 = (void *)v8;
  }
  v23 = sStandardScannerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__IPDataDetectorsFeatureExtractor_featuresForTextString_inMessageUnit_context___block_invoke;
  block[3] = &unk_24DAA5438;
  v108 = v7;
  block[4] = self;
  v106 = v115;
  v86 = v7;
  v102 = v86;
  v24 = v22;
  v103 = v24;
  v80 = v12;
  v104 = v80;
  v109 = v15;
  v110 = v18;
  v89 = v10;
  v105 = v89;
  v107 = &v111;
  dispatch_sync(v23, block);
  v25 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(v86, "lowercaseString");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v25);
  if (!*((_BYTE *)v112 + 24))
  {
    if (v89)
    {
      v27 = -[IPDataDetectorsFeatureExtractor textRangeReferencingTomorrow:](self, "textRangeReferencingTomorrow:", v84, v80);
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = v26;
        -[IPDataDetectorsFeatureExtractor tomorrowDateFromReferenceDate:](self, "tomorrowDateFromReferenceDate:", v89);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v29, v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "contextDictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("allDay"));

        objc_msgSend(v30, "contextDictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("dateTimeIsTenseDependent"));

        objc_msgSend(v30, "contextDictionary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IPFeatureDataContextDateTimeFromIpsosOverlay"));

        objc_msgSend(v30, "setTextUnit:", v86);
        objc_msgSend(v24, "addObject:", v30);

      }
    }
  }
  if (!*((_BYTE *)v112 + 24))
  {
    if (v89)
    {
      v35 = -[IPDataDetectorsFeatureExtractor textRangeReferencingValentineDay:](self, "textRangeReferencingValentineDay:", v84);
      if (v35 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v36 = v34;
        -[IPDataDetectorsFeatureExtractor valentineDayDateFromReferenceDate:](self, "valentineDayDateFromReferenceDate:", v89);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v37, v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "contextDictionary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("allDay"));

        objc_msgSend(v37, "dateByAddingTimeInterval:", 10800.0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "contextDictionary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("endDate"));

        objc_msgSend(v38, "contextDictionary");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("dateTimeIsTenseDependent"));

        objc_msgSend(v38, "contextDictionary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IPFeatureDataContextDateTimeFromIpsosOverlay"));

        objc_msgSend(v38, "setTextUnit:", v86);
        objc_msgSend(v24, "addObject:", v38);

      }
    }
  }
  if (!*((_BYTE *)v112 + 24) && v89)
  {
    if (IPGregorianCalendar_once_0 != -1)
      dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_138);
    v44 = (id)IPGregorianCalendar_calendar_0;
    objc_msgSend(v44, "components:fromDate:", 8, v89);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "month") == 12)
    {
      v47 = -[IPDataDetectorsFeatureExtractor textRangeReferencingNewYearsEve:](self, "textRangeReferencingNewYearsEve:", v84);
      if (v47 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = v46;
        v49 = -[IPDataDetectorsFeatureExtractor newYearsEveDayDateFromReferenceDate:](self, "newYearsEveDayDateFromReferenceDate:", v89);
        +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v49, v47, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "contextDictionary");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("allDay"));

        objc_msgSend(v49, "dateByAddingTimeInterval:", 21600.0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "contextDictionary");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v52, CFSTR("endDate"));

        objc_msgSend(v50, "contextDictionary");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("dateTimeIsTenseDependent"));

        objc_msgSend(v50, "contextDictionary");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IPFeatureDataContextDateTimeFromIpsosOverlay"));

        objc_msgSend(v50, "setTextUnit:", v86);
        objc_msgSend(v24, "addObject:", v50);

      }
    }

  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = v24;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
  if (!v56)
  {
LABEL_42:
    v65 = 0;
    v66 = obj;
LABEL_43:

    goto LABEL_44;
  }
  v57 = 0;
  v58 = *(_QWORD *)v98;
  while (2)
  {
    for (i = 0; i != v56; ++i)
    {
      if (*(_QWORD *)v98 != v58)
        objc_enumerationMutation(obj);
      v60 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
      if (!objc_msgSend(v60, "type", v80) || objc_msgSend(v60, "type") == 1)
      {
        objc_msgSend(v60, "contextDictionary");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("allDay"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "BOOLValue");

        if (v57)
          v64 = 0;
        else
          v64 = v63;
        if ((v64 & 1) == 0)
        {

          goto LABEL_42;
        }
        v57 = v60;
      }
    }
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
    if (v56)
      continue;
    break;
  }

  v65 = v57;
  if (v57)
  {
    if (-[IPDataDetectorsFeatureExtractor textRangeReferencingMorning:](self, "textRangeReferencingMorning:", v84) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[IPDataDetectorsFeatureExtractor textRangeReferencingNoon:](self, "textRangeReferencingNoon:", v84) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[IPDataDetectorsFeatureExtractor textRangeReferencingAfternoon:](self, "textRangeReferencingAfternoon:", v84) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (-[IPDataDetectorsFeatureExtractor textRangeReferencingEvening:](self, "textRangeReferencingEvening:", v84) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (-[IPDataDetectorsFeatureExtractor textRangeReferencingAllDay:](self, "textRangeReferencingAllDay:", v84) == 0x7FFFFFFFFFFFFFFFLL)goto LABEL_44;
            -[IPDataDetectorsFeatureExtractor featureDataComplementingFeatureData:hour:minute:duration:](self, "featureDataComplementingFeatureData:hour:minute:duration:", v57, 8, 0, 43200.0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "contextDictionary");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("allDay"));

            objc_msgSend(v66, "contextDictionary");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("prefersAllDay"));

            objc_msgSend(v66, "setTextUnit:", v86);
            v65 = v57;
            objc_msgSend(obj, "addObject:", v66);
            objc_msgSend(obj, "removeObject:", v57);
          }
          else
          {
            -[IPDataDetectorsFeatureExtractor featureDataComplementingFeatureData:hour:minute:duration:](self, "featureDataComplementingFeatureData:hour:minute:duration:", v57, 19, 0, 7200.0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setTextUnit:", v86);
            objc_msgSend(obj, "addObject:", v66);
            objc_msgSend(obj, "removeObject:", v57);
          }
        }
        else
        {
          -[IPDataDetectorsFeatureExtractor featureDataComplementingFeatureData:hour:minute:duration:](self, "featureDataComplementingFeatureData:hour:minute:duration:", v57, 15, 0, 7200.0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setTextUnit:", v86);
          objc_msgSend(obj, "addObject:", v66);
          objc_msgSend(obj, "removeObject:", v57);
        }
      }
      else
      {
        -[IPDataDetectorsFeatureExtractor featureDataComplementingFeatureData:hour:minute:duration:](self, "featureDataComplementingFeatureData:hour:minute:duration:", v57, 12, 0, 3600.0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setTextUnit:", v86);
        objc_msgSend(obj, "addObject:", v66);
        objc_msgSend(obj, "removeObject:", v57);
      }
    }
    else
    {
      -[IPDataDetectorsFeatureExtractor featureDataComplementingFeatureData:hour:minute:duration:](self, "featureDataComplementingFeatureData:hour:minute:duration:", v57, 9, 0, 7200.0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setTextUnit:", v86);
      objc_msgSend(obj, "addObject:", v66);
      objc_msgSend(obj, "removeObject:", v57);
    }
    goto LABEL_43;
  }
LABEL_44:
  -[IPDataDetectorsFeatureExtractor standardizeTimezonesForDetectedFeatures:](self, "standardizeTimezonesForDetectedFeatures:", obj, v80);
  if (v85)
  {
    v91 = v65;
    v69 = objc_msgSend(v85, "length");
    v70 = (void *)objc_opt_new();
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v71 = obj;
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
    if (v72)
    {
      v73 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v72; ++j)
        {
          if (*(_QWORD *)v94 != v73)
            objc_enumerationMutation(v71);
          v75 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
          v120.location = objc_msgSend(v75, "matchRange");
          v121.location = (NSUInteger)v20;
          v121.length = v19;
          if (NSIntersectionRange(v120, v121).length)
          {
            v76 = objc_msgSend(v75, "matchRange");
            objc_msgSend(v75, "matchRange");
            objc_msgSend(v75, "setMatchRange:", v76 - v69, v77);
            objc_msgSend(v75, "setTextUnit:", v92);
            objc_msgSend(v70, "addObject:", v75);
          }
        }
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
      }
      while (v72);
    }

    obj = (id)objc_msgSend(v70, "copy");
    v65 = v91;
  }
  v78 = obj;

  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(v115, 8);

  return v78;
}

- (IPDataDetectorsFeatureExtractor)init
{
  IPDataDetectorsFeatureExtractor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IPDataDetectorsFeatureExtractor;
  v2 = -[IPDataDetectorsFeatureExtractor init](&v4, sel_init);
  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_3);
  return v2;
}

void __39__IPDataDetectorsFeatureExtractor_init__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.Ipsos.IPDataDetectorsFeatureExtractor", v2);
  v1 = (void *)sStandardScannerQueue;
  sStandardScannerQueue = (uint64_t)v0;

}

- (__DDScanner)standardScanner
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  __DDScanner *result;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (sScanner)
  {
    v2 = sLastPreferredLanguage;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayForKey:", CFSTR("AppleLanguages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = objc_msgSend((id)v2, "isEqualToString:", v5);

    result = (__DDScanner *)sScanner;
    if ((v2 & 1) != 0)
    {
      if (sScanner)
        return result;
    }
    else
    {
      CFRelease((CFTypeRef)sScanner);
      sScanner = 0;
    }
  }
  sScanner = DDScannerCreate();
  if (sScanner)
  {
    DDScannerEnableOptionalSource();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayForKey:", CFSTR("AppleLanguages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)sLastPreferredLanguage;
    sLastPreferredLanguage = v9;

  }
  else
  {
    v11 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v11 = _IPLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = 0;
      _os_log_impl(&dword_219581000, v11, OS_LOG_TYPE_ERROR, "standardScanner creation failed: %@ #Generic", buf, 0xCu);
    }
    CFRelease(0);
  }
  return (__DDScanner *)sScanner;
}

- (__DDScanner)timeScanner
{
  return 0;
}

- (BOOL)stringContainsNonTimeStrings:(id)a3 aroundRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("stringContainsNonTimeStrings:aroundRange:"), &__block_literal_global_7_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (location <= 1)
    v8 = length;
  else
    v8 = length + 2;
  if (location <= 1)
    v9 = location;
  else
    v9 = location - 2;
  v10 = objc_msgSend(v6, "length") - (v9 + v8);
  if (v10 >= 2)
    v10 = 2;
  v11 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v6, 2, v9, v10 + v8);

  return v11 != 0x7FFFFFFFFFFFFFFFLL;
}

id __76__IPDataDetectorsFeatureExtractor_stringContainsNonTimeStrings_aroundRange___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([£%$€#]| (sera))"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __79__IPDataDetectorsFeatureExtractor_featuresForTextString_inMessageUnit_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t i;
  uint64_t v14;
  const __CFString *Type;
  uint64_t Range;
  uint64_t v17;
  CFIndex v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex v22;
  uint64_t v23;
  uint64_t v24;
  CFIndex v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  int Category;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  const void *MatchedString;
  void *v58;
  unsigned int ParsecDomain;
  uint64_t v60;
  const void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  unsigned int HasType;
  CFComparisonResult v75;
  CFComparisonResult v76;
  _BOOL4 v77;
  _BOOL4 v78;
  BOOL v79;
  int v80;
  void *v81;
  id v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const __CFString *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  int v96;
  char v97;
  uint64_t v98;
  id v99;
  int IsApprox;
  char v101;
  void *v102;
  id v104;
  BOOL v105;
  int v106;
  void *v107;
  double v108;
  id v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  CFTypeRef v134;
  uint64_t v135;
  BOOL v136;
  int v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  uint64_t v154;
  CFTypeRef v155;
  uint64_t v156;
  unsigned int v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  const __CFString *v162;
  const __CFString *v163;
  const __CFString *theString2;
  void *v165;
  _BOOL4 v166;
  _BOOL4 v167;
  id v168;
  unsigned int v169;
  id v170;
  uint64_t v171;
  __CFString *v172;
  const __CFString *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  CFComparisonResult v178;
  const __CFString *v179;
  void *v180;
  uint64_t v181;
  unsigned int v182;
  uint64_t v183;
  _BOOL4 v184;
  uint64_t v185;
  uint64_t v186;
  CFComparisonResult v187;
  unsigned int v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _QWORD v201[2];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  uint64_t v205;
  CFRange v206;

  v1 = a1;
  v205 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "standardScanner");
  v2 = objc_msgSend(*(id *)(v1 + 32), "timeScanner");
  if (DDScannerScanString())
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40);
    v4 = (void *)DDScannerCopyResultsWithOptions();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), "count"))
    v5 = v2 == 0;
  else
    v5 = 1;
  if (!v5 && DDScannerScanString())
  {
    v6 = (void *)DDScannerCopyResultsWithOptions();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = 0u;
    v198 = 0u;
    v199 = 0u;
    v200 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v197, v204, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v198;
      v12 = (const __CFString *)*MEMORY[0x24BE2B228];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v198 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * i);
          Type = (const __CFString *)DDResultGetType();
          if (CFStringCompare(Type, v12, 0) == kCFCompareEqualTo)
          {
            Range = DDResultGetRange();
            if ((objc_msgSend(*(id *)(v1 + 32), "stringContainsNonTimeStrings:aroundRange:", *(_QWORD *)(v1 + 40), Range, v17) & 1) == 0)objc_msgSend(v7, "addObject:", v14);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v197, v204, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40));
      v206.length = CFArrayGetCount((CFArrayRef)v7);
      v206.location = 0;
      CFArraySortValues((CFMutableArrayRef)v7, v206, (CFComparatorFunction)IPDDResultRangeCompare, 0);
      if (CFArrayGetCount((CFArrayRef)v7) >= 2)
      {
        v18 = 0;
        do
        {
          CFArrayGetValueAtIndex((CFArrayRef)v7, v18);
          v19 = DDResultGetRange();
          v21 = v20;
          v22 = v18 + 1;
          CFArrayGetValueAtIndex((CFArrayRef)v7, v18 + 1);
          v23 = DDResultGetRange();
          if (v23 < v19 + v21)
          {
            if (v24 >= v21 && v19 == v23)
              v26 = v18;
            else
              v26 = v18 + 1;
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)v7, v26);
            v22 = v18;
          }
          v18 = v22;
        }
        while (v22 < CFArrayGetCount((CFArrayRef)v7) - 1);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), v7);
    }

  }
  v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), "count"));
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = 0u;
  v195 = 0u;
  v196 = 0u;
  v194 = 0u;
  v28 = *(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40);
  v183 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v193, v203, 16);
  v185 = v1;
  v176 = v27;
  if (v183)
  {
    v181 = *(_QWORD *)v194;
    v170 = v28;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v194 != v181)
          objc_enumerationMutation(v28);
        v30 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * v29);
        Category = DDResultGetCategory();
        v32 = DDResultGetRange();
        v186 = v33;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld %ld"), v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v27, "containsObject:", v34) & 1) == 0)
        {
          objc_msgSend(v27, "addObject:", v34);
          switch(Category)
          {
            case 0:
              if (DDResultHasType())
                goto LABEL_40;
              break;
            case 1:
              v35 = (void *)DDResultCopyExtractedURLWithOptions();
              if (!v35)
              {
                v54 = 0;
LABEL_77:

                goto LABEL_78;
              }
              objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v36)
              {
                v54 = 0;
LABEL_76:

                goto LABEL_77;
              }
              v37 = v36;
              objc_msgSend(v36, "scheme");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "lowercaseString");
              v172 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v168 = v37;
              objc_msgSend(v37, "resourceSpecifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v39, "hasPrefix:", CFSTR("//")))
              {
                objc_msgSend(v39, "substringFromIndex:", 2);
                v40 = objc_claimAutoreleasedReturnValue();
                v41 = v39;
                v39 = (void *)v40;

              }
              v174 = v39;
              v42 = objc_msgSend(v39, "length");
              v43 = v172;
              if (v42 && -[__CFString length](v172, "length"))
              {
                if (-[__CFString isEqualToString:](v172, "isEqualToString:", CFSTR("mailto")))
                {
                  v165 = v35;
                  objc_msgSend(v174, "componentsSeparatedByString:", CFSTR("?"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "firstObject");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "componentsSeparatedByString:", CFSTR(","));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  v191 = 0u;
                  v192 = 0u;
                  v189 = 0u;
                  v190 = 0u;
                  v47 = v46;
                  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v189, v202, 16);
                  if (v48)
                  {
                    v49 = v48;
                    v50 = *(_QWORD *)v190;
                    do
                    {
                      for (j = 0; j != v49; ++j)
                      {
                        if (*(_QWORD *)v190 != v50)
                          objc_enumerationMutation(v47);
                        v52 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * j);
                        if (objc_msgSend(v52, "containsString:", CFSTR("@")))
                        {
                          +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 5, v52, v32, v186);
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v53, "setTextUnit:", *(_QWORD *)(v185 + 40));
                          objc_msgSend(*(id *)(v185 + 48), "addObject:", v53);

                        }
                      }
                      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v189, v202, 16);
                    }
                    while (v49);
                  }

                  v54 = 0;
                  v1 = v185;
                  v27 = v176;
                  v28 = v170;
                  v43 = v172;
                  v35 = v165;
                  goto LABEL_75;
                }
                if ((-[__CFString isEqualToString:](v172, "isEqualToString:", CFSTR("tel")) & 1) != 0
                  || -[__CFString isEqualToString:](v172, "isEqualToString:", CFSTR("telprompt")))
                {
                  v62 = 6;
                  v63 = v174;
                }
                else
                {
                  if ((-[__CFString isEqualToString:](v172, "isEqualToString:", CFSTR("facetime")) & 1) != 0
                    || -[__CFString isEqualToString:](v172, "isEqualToString:", CFSTR("facetime-audio")))
                  {
                    objc_msgSend(v174, "componentsSeparatedByString:", CFSTR("?"));
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "firstObject");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();

                    v43 = v172;
                    if (objc_msgSend(v65, "containsString:", CFSTR("@")))
                      v66 = 5;
                    else
                      v66 = 6;
                    +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", v66, v65, v32, v186);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();

                    v27 = v176;
                    goto LABEL_75;
                  }
                  v62 = 4;
                  v63 = v37;
                }
                +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", v62, v63, v32, v186);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v54 = 0;
              }
LABEL_75:

              v36 = v168;
              goto LABEL_76;
            case 2:
              DDResultCopyPhoneValue();
              v54 = 0;
              goto LABEL_78;
            case 3:
              if (DDResultGetSubresultWithType() && DDResultGetSubresultWithType())
                break;
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              DDResultCopyFullAddressComponents();
              v56 = 3;
              goto LABEL_61;
            case 4:
LABEL_40:
              objc_msgSend(v180, "addObject:", v30);
              break;
            case 5:
              if (DDResultHasType())
              {
                MatchedString = (const void *)DDResultGetMatchedString();
                v58 = (void *)CFRetain(MatchedString);
                +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 11, v58, v32, v186);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                v27 = v176;
              }
              else
              {
                ParsecDomain = DDResultGetParsecDomain();
                if (ParsecDomain > 8 || ((0x19Bu >> ParsecDomain) & 1) == 0)
                  break;
                v60 = qword_2195AA088[ParsecDomain];
                v61 = (const void *)DDResultGetMatchedString();
                v55 = (void *)CFRetain(v61);
                v27 = v176;
                v56 = v60;
LABEL_61:
                +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", v56, v55, v32, v186);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                v28 = v170;
              }
LABEL_78:
              if (v54)
              {
                objc_msgSend(v54, "setTextUnit:", *(_QWORD *)(v1 + 40));
                objc_msgSend(*(id *)(v1 + 48), "addObject:", v54);

              }
              break;
            default:
              break;
          }
        }

        ++v29;
      }
      while (v29 != v183);
      v67 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v193, v203, 16);
      v183 = v67;
    }
    while (v67);
  }

  v68 = objc_msgSend(v180, "count");
  v154 = v68 - 1;
  if (v68 >= 1)
  {
    v69 = v68;
    v70 = 0;
    v159 = 0;
    v171 = 0;
    theString2 = (const __CFString *)*MEMORY[0x24BE2B228];
    v163 = (const __CFString *)*MEMORY[0x24BE2B220];
    v179 = (const __CFString *)*MEMORY[0x24BE2B1D8];
    v162 = (const __CFString *)*MEMORY[0x24BE2B1D0];
    v173 = (const __CFString *)*MEMORY[0x24BE2B1E0];
    v175 = -1;
    v71 = -3;
    v156 = v68;
    do
    {
      objc_msgSend(v180, "objectAtIndexedSubscript:", v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v73 = (const __CFString *)DDResultGetType();
      HasType = DDResultHasType();
      v75 = CFStringCompare(v73, theString2, 0);
      v76 = CFStringCompare(v73, v163, 0);
      v187 = CFStringCompare(v73, v179, 0);
      v178 = CFStringCompare(v73, v162, 0);
      v182 = HasType;
      if ((HasType & 1) != 0)
      {
        v77 = 0;
        v184 = 1;
      }
      else
      {
        v184 = CFStringCompare(v73, v173, 0) == kCFCompareEqualTo;
        v77 = DDResultTimeIsApprox() != 0;
      }
      v167 = v77;
      v78 = (v187 == kCFCompareEqualTo || v184 && v77) && DDResultDateExtractionDependsOnContextTense() != 0;
      if (v75)
        v79 = v76 == kCFCompareEqualTo;
      else
        v79 = 1;
      v80 = v79;
      v169 = v80;
      v177 = v71;
      v166 = v78;
      if (v79)
      {
        v81 = *(void **)(v1 + 56);
        if (v81)
        {
          v82 = v81;
          v83 = 0;
          goto LABEL_126;
        }
        v84 = v70 + ~v71;
        if (v84 >= 2)
          v84 = 2;
        v85 = v84 + v70;
        if (v85 >= v154)
          v85 = v154;
        if (v70 < v85)
        {
          v86 = v175 - v71;
          if (v175 - v71 >= 2)
            v86 = 2;
          v87 = v86 + v70;
          if (v87 >= v154)
            v88 = v154;
          else
            v88 = v87;
          v89 = v70;
          do
          {
            objc_msgSend(v180, "objectAtIndexedSubscript:", ++v89);

            v90 = (const __CFString *)DDResultGetType();
            if (CFStringCompare(v90, v173, 0) == kCFCompareEqualTo
              || CFStringCompare(v90, v179, 0) == kCFCompareEqualTo)
            {
              DDResultCopyExtractedDateFromReferenceDate();
            }
          }
          while (v88 != v89);
        }
        v27 = v176;
        v69 = v156;
        v177 = v71;
        v171 = 0;
      }
      v82 = *(id *)(v1 + 64);
      v83 = 1;
LABEL_126:
      v91 = DDResultGetRange();
      v93 = v91;
      v94 = v92;
      v95 = v182;
      if (v187 == kCFCompareEqualTo)
        v95 = 1;
      v96 = v95 | v184;
      if (v75)
        v97 = 1;
      else
        v97 = v83;
      if (v96 != 1 && (v97 & 1) != 0)
      {
        if (v76 && v178)
        {
          v71 = v177;
        }
        else
        {
          v135 = v91;
          if (DDResultCopyExtractedStartDateEndDate())
          {
            if (DDResultDateExtractionDependsOnContextTense())
              v136 = 1;
            else
              v136 = v75 == kCFCompareEqualTo;
            v137 = v136;
            v188 = v137;
            DDResultIsPartialDateRangeOrTimeRange();
            +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, 0, v135, v94);
            v113 = (void *)objc_claimAutoreleasedReturnValue();

            v138 = v169 & v83;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", 0);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "contextDictionary");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "setObject:forKeyedSubscript:", v139, CFSTR("allDay"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v167);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "contextDictionary");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "setObject:forKeyedSubscript:", v141, CFSTR("timeIsApproximate"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v188);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "contextDictionary");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "setObject:forKeyedSubscript:", v143, CFSTR("dateTimeIsTenseDependent"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v138);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "contextDictionary");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "setObject:forKeyedSubscript:", v145, CFSTR("dateIsTimeOnlyAndReferrengingToSentDate"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v169);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "contextDictionary");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "setObject:forKeyedSubscript:", v147, CFSTR("dateOnlyContainsTimeInformation"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v178 == kCFCompareEqualTo);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "contextDictionary");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "setObject:forKeyedSubscript:", v149, CFSTR("isDateRange"));

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", DDResultNeedsMeridianGuess() != 0);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "contextDictionary");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "setObject:forKeyedSubscript:", v151, CFSTR("timeNeedsMeridianGuess"));

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
            v27 = v176;
            v71 = v177;
            v69 = v156;
            if (!v113)
              goto LABEL_189;
            goto LABEL_188;
          }
          v71 = v177;
        }
        goto LABEL_189;
      }
      v160 = v91;
      v161 = v92;
      if (!v159 || v75)
      {
        if (!v159)
        {
          v102 = *(void **)(v1 + 56);
          if (v102 && v166)
            v82 = (id)objc_msgSend(v102, "dateByAddingTimeInterval:", v93, -86399.0);
        }
LABEL_147:
        v101 = 0;
        goto LABEL_148;
      }
      if ((DDResultHasType() & 1) == 0)
      {
        v98 = v69;
        v99 = v82;
        IsApprox = DDResultTimeIsApprox();
        v5 = IsApprox == DDResultTimeIsApprox();
        v82 = v99;
        v69 = v98;
        if (v5)
          goto LABEL_147;
      }
      v201[0] = v72;
      v201[1] = v159;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v201, 2);
      v72 = (void *)DDResultCreateFromDateTimeResults();
      CFAutorelease(v72);
      v101 = 1;
LABEL_148:
      if (DDResultCopyExtractedDateFromReferenceDate())
      {
        v104 = 0;
        if (DDResultDateExtractionDependsOnContextTense())
          v105 = 1;
        else
          v105 = v75 == kCFCompareEqualTo;
        v106 = v105;
        v157 = v106;
        v107 = *(void **)(v1 + 56);
        v158 = v104;
        if (!v107
          || (objc_msgSend(v107, "timeIntervalSinceDate:", v104), fabs(v108) >= 43200.0)
          || *(_BYTE *)(v1 + 96)
          || *(_BYTE *)(v1 + 97))
        {
          v109 = v104;
        }
        else
        {
          v109 = v104;
          if (v167)
          {
            v1 = v185;
            v153 = *(id *)(v185 + 56);

            v167 = 0;
            v109 = v153;
          }
          else
          {
            v167 = 0;
            v1 = v185;
          }
        }
        v110 = v169 & v83;
        v155 = v82;
        if (v182)
        {
          objc_msgSend(v109, "timeIntervalSinceReferenceDate");
          objc_msgSend(v109, "dateByAddingTimeInterval:", -(v111 + -round(v111 / 600.0) * 600.0));
          v112 = objc_claimAutoreleasedReturnValue();

          v109 = (id)v112;
        }
        +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v109, v160, v161);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", 0);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "contextDictionary");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setObject:forKeyedSubscript:", v114, CFSTR("allDay"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v167);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "contextDictionary");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setObject:forKeyedSubscript:", v116, CFSTR("timeIsApproximate"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v182);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "contextDictionary");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "setObject:forKeyedSubscript:", v118, CFSTR("isTimeOffset"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v157);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "contextDictionary");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "setObject:forKeyedSubscript:", v120, CFSTR("dateTimeIsTenseDependent"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v110);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "contextDictionary");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setObject:forKeyedSubscript:", v122, CFSTR("dateIsTimeOnlyAndReferrengingToSentDate"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v169 | v182);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "contextDictionary");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setObject:forKeyedSubscript:", v124, CFSTR("dateOnlyContainsTimeInformation"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v178 == kCFCompareEqualTo);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "contextDictionary");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "setObject:forKeyedSubscript:", v126, CFSTR("isDateRange"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", DDResultNeedsMeridianGuess() != 0);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "contextDictionary");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "setObject:forKeyedSubscript:", v128, CFSTR("timeNeedsMeridianGuess"));

        v130 = v184;
        if (v187 == kCFCompareEqualTo)
          v130 = 1;
        v131 = 0;
        v5 = v130 == 0;
        v27 = v176;
        v132 = v177;
        if (v5)
          v131 = v171;
        else
          v132 = v70;
        if (v178)
          v71 = v132;
        else
          v71 = -3;
        if (v178)
          v133 = v131;
        else
          v133 = 0;
        v171 = v133;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
        v69 = v156;
        if ((v101 & 1) == 0)
        {
          if (v155)
          {
            v134 = CFRetain(v155);
            CFAutorelease(v134);
          }
          v159 = v72;
        }

        if (!v113)
          goto LABEL_189;
LABEL_188:
        objc_msgSend(v113, "setTextUnit:", *(_QWORD *)(v1 + 40));
        objc_msgSend(*(id *)(v1 + 48), "addObject:", v113);

        goto LABEL_189;
      }
      v71 = v177;
LABEL_189:
      ++v70;
      ++v175;
    }
    while (v70 != v69);
  }

}

- (void)standardizeTimezonesForDetectedFeatures:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  obj = v5;
  if (!v6)
  {
LABEL_20:

    goto LABEL_21;
  }
  v7 = v6;
  v5 = 0;
  v8 = *(_QWORD *)v21;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
      if (!objc_msgSend(v10, "type") || objc_msgSend(v10, "type") == 1)
      {
        objc_msgSend(v10, "contextDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startDateTimeZone"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "contextDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("endDateTimeZone"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v15 = v12;
          goto LABEL_12;
        }
        if (v14)
        {
          v15 = v14;
LABEL_12:
          v16 = v15;

          -[IPDataDetectorsFeatureExtractor setTimeZone:forDateFeatures:](self, "setTimeZone:forDateFeatures:", v16, v4);
          objc_msgSend(v4, "removeAllObjects");
          v5 = v16;
        }
        else
        {
          objc_msgSend(v4, "addObject:", v10);
        }

      }
      ++v9;
    }
    while (v7 != v9);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v7 = v17;
  }
  while (v17);

  if (v5)
  {
    -[IPDataDetectorsFeatureExtractor setTimeZone:forDateFeatures:](self, "setTimeZone:forDateFeatures:", v5, v4);
    goto LABEL_20;
  }
LABEL_21:

}

- (void)setTimeZone:(id)a3 forDateFeatures:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "secondsFromGMT");
  v29 = v7;
  v9 = objc_msgSend(v7, "secondsFromGMT");
  v32 = v5;
  v10 = objc_msgSend(v5, "secondsFromGMT");
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("GMT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "secondsFromGMT");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v31 = v10 - v12 + 82800;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v17, "contextDictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("allDay"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        v21 = v8 - v9;
        if (v20)
          v21 = v31;
        v22 = (double)v21;
        objc_msgSend(v17, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dateByAddingTimeInterval:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setValue:", v24);

        objc_msgSend(v17, "contextDictionary");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, CFSTR("startDateTimeZone"));

        objc_msgSend(v17, "contextDictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("endDate"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v17, "contextDictionary");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, CFSTR("endDate"));

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

}

- (id)featureDataComplementingFeatureData:(id)a3 hour:(unint64_t)a4 minute:(unint64_t)a5 duration:(double)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v9 = a3;
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (IPGregorianCalendar_once_0 != -1)
    dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_138);
  v11 = (id)IPGregorianCalendar_calendar_0;
  objc_msgSend(v11, "components:fromDate:", 2097182, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDay:", objc_msgSend(v12, "day"));
  objc_msgSend(v13, "setMonth:", objc_msgSend(v12, "month"));
  objc_msgSend(v13, "setYear:", objc_msgSend(v12, "year"));
  objc_msgSend(v13, "setEra:", objc_msgSend(v12, "era"));
  objc_msgSend(v12, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeZone:", v14);

  objc_msgSend(v13, "setHour:", a4);
  objc_msgSend(v13, "setMinute:", a5);
  objc_msgSend(v11, "dateFromComponents:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v9, "matchRange");
  +[IPFeatureData featureDataWithType:value:matchRange:](IPFeatureData, "featureDataWithType:value:matchRange:", 1, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contextDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("allDay"));

  objc_msgSend(v18, "contextDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("timeIsApproximate"));

  objc_msgSend(v18, "contextDictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("dateTimeComplement"));

  objc_msgSend(v9, "contextDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("dateTimeIsTenseDependent"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contextDictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("dateTimeIsTenseDependent"));

  if (a6 > 0.0)
  {
    objc_msgSend(v15, "dateByAddingTimeInterval:", a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contextDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("endDate"));

  }
  return v18;
}

- (id)stringByReplacingDetectedDataWithNGramMarkersInString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IPDataDetectorsFeatureExtractor featuresForTextString:inMessageUnit:context:](self, "featuresForTextString:inMessageUnit:context:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "matchRange", (_QWORD)v20) >= v10 && v10 < objc_msgSend(v13, "matchRange"))
        {
          objc_msgSend(v4, "substringWithRange:", v10, objc_msgSend(v13, "matchRange") - v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v14);

          objc_msgSend(v13, "nGramMarker");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v15);

          v16 = objc_msgSend(v13, "matchRange");
          v10 = v16 + v17;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v4, "substringWithRange:", v10, objc_msgSend(v4, "length") - v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v18);

  return v6;
}

- (id)thisSaturdayDateFromReferenceDate:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = IPGregorianCalendar_once_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_138);
  v5 = (id)IPGregorianCalendar_calendar_0;
  objc_msgSend(v5, "components:fromDate:", 25088, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWeekday:", 7);
  objc_msgSend(v5, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tomorrowDateFromReferenceDate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDay:", 1);
  v5 = objc_alloc(MEMORY[0x24BDBCE48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v4, v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)valentineDayDateFromReferenceDate:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = IPGregorianCalendar_once_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_138);
  v5 = (id)IPGregorianCalendar_calendar_0;
  objc_msgSend(v5, "components:fromDate:", 4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDay:", 14);
  objc_msgSend(v7, "setMonth:", 2);
  objc_msgSend(v7, "setYear:", objc_msgSend(v6, "year"));
  objc_msgSend(v7, "setHour:", 19);
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)newYearsEveDayDateFromReferenceDate:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = IPGregorianCalendar_once_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&IPGregorianCalendar_once_0, &__block_literal_global_138);
  v5 = (id)IPGregorianCalendar_calendar_0;
  objc_msgSend(v5, "components:fromDate:", 4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDay:", 31);
  objc_msgSend(v7, "setMonth:", 12);
  objc_msgSend(v7, "setYear:", objc_msgSend(v6, "year"));
  objc_msgSend(v7, "setHour:", 20);
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_NSRange)textRangeReferencingTomorrow:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingTomorrow"), &__block_literal_global_57);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __64__IPDataDetectorsFeatureExtractor_textRangeReferencingTomorrow___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:tomorrow|demain|(?<!la)mañana|domani|morgen)"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingThisWeekEnd:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingThisWeekEnd"), &__block_literal_global_62);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __67__IPDataDetectorsFeatureExtractor_textRangeReferencingThisWeekEnd___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:(?:this|(?<!de)ce) week-?end|(?:este|pr[óo]ximo) (?:finde|week-?end|fin de semana)|(?:quest|prossim)o (?:week- ?end|weekend|fine settimana)|(?:diese[sm]|kommende[sn]) w(?:eek-?end|ochenende))"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingNextWeekEnd:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingNextWeekEnd"), &__block_literal_global_67);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __67__IPDataDetectorsFeatureExtractor_textRangeReferencingNextWeekEnd___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:next week-?end|le week-?end prochain|n(?:ae|ä)chste[sn] w(?:eek-?end|ochenende))"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingAllDay:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingAllDay"), &__block_literal_global_72);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __62__IPDataDetectorsFeatureExtractor_textRangeReferencingAllDay___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:all day|toute la journée)"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingValentineDay:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingValentineDay"), &__block_literal_global_77);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __68__IPDataDetectorsFeatureExtractor_textRangeReferencingValentineDay___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:valentine(?:['’]?s)? day|s(?:ain)?t[ \\-]valentin|san valent[ií]n|san valentino|valentinstag)"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingNewYearsEve:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingNewYearsEve"), &__block_literal_global_82);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __67__IPDataDetectorsFeatureExtractor_textRangeReferencingNewYearsEve___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:new year(?:['’]s)? eve|le nouvel an|du jour de l['’]an|du nouvel an|nochevieja|año nuevo|capodanno|l['’]ultimo dell['’]anno|silvester)"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingMorning:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingMorning"), &__block_literal_global_87);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __63__IPDataDetectorsFeatureExtractor_textRangeReferencingMorning___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:morning|matin|(début|fin) de matinée|la mañana|mattina|morgen früh|清晨|上午|朝)"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingNoon:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingNoon"), &__block_literal_global_92);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __60__IPDataDetectorsFeatureExtractor_textRangeReferencingNoon___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:lunch|(?<!after)noon|(?<!petit( |-))déjeuner|(?<!après-)midi|migdia|mezzogiorno|alla mezza|mitta(?:g(?:essen)?|ch)|中午|正午)"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingAfternoon:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingAfternoon"), &__block_literal_global_97);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __65__IPDataDetectorsFeatureExtractor_textRangeReferencingAfternoon___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:after(?:noon| lunch)|après(?:-midi| d[eé]jeuner)|tarde|después de comer|pomeriggio|nachmittag|下午|午後)"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeReferencingEvening:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = a3;
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("textRangeReferencingEvening"), &__block_literal_global_102);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 2, 0, objc_msgSend(v3, "length"));
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

id __63__IPDataDetectorsFeatureExtractor_textRangeReferencingEvening___block_invoke()
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:evening|dinner|(?<!bonne)soirée|ce soir|tomar algo|cenar|(?:una |la |sta)sera|晚|夜)"), 65, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queue
{
  if (queue__onceToken_0 != -1)
    dispatch_once(&queue__onceToken_0, &__block_literal_global_105);
  return (id)queue__ipExprOnceResult_0;
}

void __40__IPDataDetectorsFeatureExtractor_queue__block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x219A2F708]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("IPDataDetectorsFeatureExtractor", v1);
  v3 = (void *)queue__ipExprOnceResult_0;
  queue__ipExprOnceResult_0 = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

@end
