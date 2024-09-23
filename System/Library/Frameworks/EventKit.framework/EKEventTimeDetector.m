@implementation EKEventTimeDetector

+ (id)resultDictionaryForString:(id)a3 referenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "resultDictionaryForString:referenceDate:ignoreDurationForApproximateTime:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)resultDictionaryForString:(id)a3 referenceDate:(id)a4 ignoreDurationForApproximateTime:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  id v52;
  double v53;
  double v54;
  uint64_t v55;
  char v56;
  char v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  id v66;
  double v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  char v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
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
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;
  NSRange v123;
  NSRange v124;

  v82 = a5;
  v122 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v85 = a1;
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v7;
  objc_msgSend((id)objc_opt_class(), "dateResultsFromString:referenceDate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
  v12 = v10;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v114;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v114 != v14)
          objc_enumerationMutation(v10);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i), "date");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isSameDayAsDate:inCalendar:", v8, v88);

          if (!v17)
          {

            objc_msgSend((id)objc_opt_class(), "dateResultsFromString:referenceDate:", v87, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
      if (v13)
        continue;
      break;
    }
    v12 = v10;
  }
LABEL_12:

  v83 = v12;
  v84 = v8;
  if (!objc_msgSend(v12, "count"))
  {
    v21 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = (void *)MEMORY[0x1E0C9AA60];
    v92 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_90;
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
  if (!v19)
  {

    v21 = 0;
LABEL_38:
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v45 = v18;
    v46 = v18;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
    if (v47)
    {
      v48 = v47;
      v38 = 0;
      v49 = *(_QWORD *)v102;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v102 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
          if (!v38 || (objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * j), "timeIsApproximate") & 1) == 0)
          {
            v52 = v51;

            v38 = v52;
          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
      }
      while (v48);
    }
    else
    {
      v38 = 0;
    }

    v18 = v45;
    goto LABEL_51;
  }
  v20 = v19;
  v21 = 0;
  v22 = *(_QWORD *)v110;
  v89 = 0;
  v91 = *(_QWORD *)v110;
  do
  {
    v23 = 0;
    v93 = v20;
    do
    {
      if (*(_QWORD *)v110 != v22)
        objc_enumerationMutation(v18);
      v24 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v23);
      if ((objc_msgSend(v24, "timeIsSignificant") & 1) == 0)
      {
        v95 = v21;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v25 = v18;
        v26 = v18;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v106;
LABEL_21:
          v30 = 0;
          while (1)
          {
            if (*(_QWORD *)v106 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v30);
            if (v24 != v31)
            {
              v32 = objc_msgSend(v24, "range");
              v34 = v33;
              v124.location = objc_msgSend(v31, "range");
              v124.length = v35;
              v123.location = v32;
              v123.length = v34;
              if (NSIntersectionRange(v123, v124).length)
                break;
            }
            if (v28 == ++v30)
            {
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
              if (v28)
                goto LABEL_21;
              goto LABEL_28;
            }
          }
        }
        else
        {
LABEL_28:

          v26 = v89;
          v89 = v24;
        }

        v20 = v93;
        v21 = v95;
        v18 = v25;
        v22 = v91;
      }
      objc_msgSend(v24, "timeZone");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v24, "timeZone");
        v37 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v37;
      }
      ++v23;
    }
    while (v23 != v20);
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
  }
  while (v20);

  v38 = v89;
  if (!v89)
    goto LABEL_38;
LABEL_51:
  objc_msgSend(v38, "date");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "duration");
  v54 = v53;
  rangesSafeToRemove(v38);
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v38, "timeIsApproximate");
  v90 = v38;
  v92 = (void *)v55;
  if ((objc_msgSend(v38, "timeIsSignificant") & 1) != 0)
  {
    v57 = 1;
LABEL_70:
    v44 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_73;
  }
  if ((unint64_t)objc_msgSend(v18, "count") < 2)
  {
    v57 = 0;
    goto LABEL_70;
  }
  v94 = v56;
  v96 = v21;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v58 = v18;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
  if (v59)
  {
    v60 = v59;
    v57 = 0;
    v61 = 0;
    v62 = *(_QWORD *)v98;
    v44 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (k = 0; k != v60; ++k)
      {
        if (*(_QWORD *)v98 != v62)
          objc_enumerationMutation(v58);
        v64 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * k);
        if (objc_msgSend(v64, "timeIsSignificant"))
        {
          if (!objc_msgSend(v64, "timeIsApproximate") || v61 == 0)
          {
            v66 = v64;

            objc_msgSend(v66, "duration");
            v54 = v67;
            v68 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v66, "date");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v39, v69, v88);
            v70 = objc_claimAutoreleasedReturnValue();

            rangesSafeToRemove(v66);
            v71 = objc_claimAutoreleasedReturnValue();

            v94 = objc_msgSend(v66, "timeIsApproximate");
            v57 = 1;
            v44 = (void *)v71;
            v39 = (void *)v70;
            v61 = v66;
          }
        }
      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
    }
    while (v60);
  }
  else
  {
    v57 = 0;
    v61 = 0;
    v44 = (void *)MEMORY[0x1E0C9AA60];
  }

  v21 = v96;
  v55 = (uint64_t)v92;
  v56 = v94;
LABEL_73:

  v40 = v56 & 1;
  v41 = (v57 & 1) == 0;
  if (!v39)
  {
    v41 = 0;
    v42 = 0;
    v43 = 0;
    goto LABEL_90;
  }
  if (v82)
  {
    v72 = v40;
    if (!objc_msgSend(v84, "isSameDayAsDate:inCalendar:", v39, 0))
    {
      v72 = 0;
      v43 = 0;
      if ((v57 & 1) != 0)
        goto LABEL_82;
      goto LABEL_81;
    }
  }
  else
  {
    v72 = 0;
  }
  v43 = v39;
  objc_msgSend(v86, "addObjectsFromArray:", v55);
  objc_msgSend(v86, "addObjectsFromArray:", v44);
  if ((v57 & 1) == 0)
  {
LABEL_81:
    objc_msgSend((id)v43, "dateRemovingTimeComponentsInCalendar:", v88);
    v73 = objc_claimAutoreleasedReturnValue();

    v43 = v73;
  }
LABEL_82:
  if (v54 <= 0.0)
    v74 = 1;
  else
    v74 = v72;
  if ((v74 & 1) != 0)
  {
    v42 = 0;
  }
  else
  {
    objc_msgSend((id)v43, "dateByAddingTimeInterval:", v54);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (uint64_t)v75;
    if ((v57 & 1) != 0)
    {
      v41 = 0;
    }
    else
    {
      v41 = 1;
      objc_msgSend(v75, "dateByAddingDays:inCalendar:", 1, v88);
      v76 = objc_claimAutoreleasedReturnValue();

      v42 = v76;
    }
  }
LABEL_90:
  v77 = (void *)objc_opt_new();
  objc_msgSend(v85, "stripRanges:fromString:", v86, v87);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setValue:forKey:", v78, CFSTR("EKEventTimeDetectorResultTitleKey"));
  objc_msgSend(v77, "setValue:forKey:", v43, CFSTR("EKEventTimeDetectorResultStartDateKey"));
  objc_msgSend(v77, "setValue:forKey:", v42, CFSTR("EKEventTimeDetectorResultEndDateKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v40);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setValue:forKey:", v79, CFSTR("EKEventTimeDetectorResultTimeIsApproximateKey"));

  if (v43 | v42)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v41);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setValue:forKey:", v80, CFSTR("EKEventTimeDetectorResultAllDayKey"));

  }
  if (v21)
    objc_msgSend(v77, "setValue:forKey:", v21, CFSTR("EKEventTimeDetectorResultTimeZoneKey"));

  return v77;
}

+ (id)dateResultsFromString:(id)a3 referenceDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    if (dateResultsFromString_referenceDate__onceToken != -1)
      dispatch_once(&dateResultsFromString_referenceDate__onceToken, &__block_literal_global_19);
    v8 = dateResultsFromString_referenceDate__dateScannerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__EKEventTimeDetector_dateResultsFromString_referenceDate___block_invoke_2;
    block[3] = &unk_1E4785400;
    v14 = v5;
    v15 = v6;
    v9 = v7;
    v16 = v9;
    dispatch_sync(v8, block);
    v10 = v16;
    v11 = v9;

  }
  return v7;
}

void __59__EKEventTimeDetector_dateResultsFromString_referenceDate___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  dateResultsFromString_referenceDate__s_dateScanner = DDScannerCreate();
  v0 = dispatch_queue_create("EKEventTimeDetectorDateScannerQueue", 0);
  v1 = (void *)dateResultsFromString_referenceDate__dateScannerQueue;
  dateResultsFromString_referenceDate__dateScannerQueue = (uint64_t)v0;

}

void __59__EKEventTimeDetector_dateResultsFromString_referenceDate___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  void *v4;
  id v5;
  CFIndex v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  const __CFArray *v13;
  CFIndex Count;

  if (dateResultsFromString_referenceDate__s_dateScanner)
  {
    if (DDScannerScanString())
    {
      v2 = DDScannerCopyResultsWithOptions();
      if (v2)
      {
        v3 = (const __CFArray *)v2;
        v4 = *(void **)(a1 + 48);
        v5 = *(id *)(a1 + 40);
        v12 = v4;
        Count = CFArrayGetCount(v3);
        if (Count >= 1)
        {
          v6 = 0;
          v13 = v3;
          do
          {
            CFArrayGetValueAtIndex(v3, v6);
            DDResultGetRange();
            DDResultGetType();
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(CFSTR("Date"), "isEqualToString:", v7) & 1) != 0
              || (objc_msgSend(CFSTR("Time"), "isEqualToString:", v7) & 1) != 0
              || (objc_msgSend(CFSTR("DateTime"), "isEqualToString:", v7) & 1) != 0
              || (objc_msgSend(CFSTR("DateDuration"), "isEqualToString:", v7) & 1) != 0
              || (objc_msgSend(CFSTR("TimeDuration"), "isEqualToString:", v7) & 1) != 0
              || objc_msgSend(CFSTR("Timestamp"), "isEqualToString:", v7))
            {
              v8 = v5;
              if (!v5)
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v8 = (id)objc_claimAutoreleasedReturnValue();
              }
              v9 = v8;
              objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "rangeOfString:", CFSTR("Duration"));
              if (!v11 || !DDResultCopyExtractedStartDateEndDate())
                DDResultCopyExtractedDateFromReferenceDate();
              if (resultHasApproxTime())
                resultHasExactTime();
              DDResultIsPastDate();

              v3 = v13;
            }

            ++v6;
          }
          while (Count != v6);
        }

        CFRelease(v3);
      }
    }
  }
}

+ (id)stripRanges:(id)a3 fromString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v18;
  NSRange v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  NSRange v43;
  NSRange v44;
  NSRange v45;
  NSRange v46;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_18_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") && objc_msgSend(v8, "count") != 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "rangeValue");
      v13 = v12;

      objc_msgSend(v8, "objectAtIndexedSubscript:", v9 + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "rangeValue");
      v17 = v16;

      v43.location = v11;
      v43.length = v13;
      v45.location = v15;
      v45.length = v17;
      if (NSIntersectionRange(v43, v45).length)
      {
        v18 = (void *)MEMORY[0x1E0CB3B18];
        v44.location = v11;
        v44.length = v13;
        v46.location = v15;
        v46.length = v17;
        v19 = NSUnionRange(v44, v46);
        objc_msgSend(v18, "valueWithRange:", v19.location, v19.length);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v20, v9);

        objc_msgSend(v8, "removeObjectAtIndex:", v9 + 1);
      }
      else
      {
        ++v9;
      }
    }
    while (v9 < objc_msgSend(v8, "count") - 1);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  v23 = v5;
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v38;
    v23 = v5;
    do
    {
      v26 = 0;
      v27 = v23;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v21);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v26), "rangeValue", (_QWORD)v37);
        objc_msgSend(v27, "stringByReplacingCharactersInRange:withString:", v28, v29, &stru_1E4789A58);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        ++v26;
        v27 = v23;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsSeparatedByCharactersInSet:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != ''"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "filteredArrayUsingPredicate:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "componentsJoinedByString:", CFSTR(" "));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v34, "length"))
      v35 = v34;
    else
      v35 = v5;
    v23 = v35;

  }
  return v23;
}

uint64_t __46__EKEventTimeDetector_stripRanges_fromString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  if (v5 > v6)
    return -1;
  else
    return v5 != v6;
}

@end
