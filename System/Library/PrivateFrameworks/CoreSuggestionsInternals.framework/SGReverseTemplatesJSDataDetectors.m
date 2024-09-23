@implementation SGReverseTemplatesJSDataDetectors

- (SGReverseTemplatesJSDataDetectors)init
{
  SGReverseTemplatesJSDataDetectors *v2;
  uint64_t v3;
  NSMutableDictionary *scanners;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSDateFormatter *dateFormatter;
  uint64_t v11;
  NSDateFormatter *naiveDateFormatter;
  uint64_t v13;
  NSDateFormatter *noTimeFormatter;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SGReverseTemplatesJSDataDetectors;
  v2 = -[SGReverseTemplatesJSDataDetectors init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    scanners = v2->_scanners;
    v2->_scanners = (NSMutableDictionary *)v3;

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C99D48]);
    v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v9 = objc_opt_new();
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = (NSDateFormatter *)v9;

    -[NSDateFormatter setLocale:](v2->_dateFormatter, "setLocale:", v5);
    -[NSDateFormatter setDateFormat:](v2->_dateFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZZZ"));
    -[NSDateFormatter setCalendar:](v2->_dateFormatter, "setCalendar:", v8);
    v11 = objc_opt_new();
    naiveDateFormatter = v2->_naiveDateFormatter;
    v2->_naiveDateFormatter = (NSDateFormatter *)v11;

    -[NSDateFormatter setLocale:](v2->_naiveDateFormatter, "setLocale:", v5);
    -[NSDateFormatter setDateFormat:](v2->_naiveDateFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss"));
    -[NSDateFormatter setTimeZone:](v2->_naiveDateFormatter, "setTimeZone:", v6);
    -[NSDateFormatter setCalendar:](v2->_naiveDateFormatter, "setCalendar:", v8);
    v13 = objc_opt_new();
    noTimeFormatter = v2->_noTimeFormatter;
    v2->_noTimeFormatter = (NSDateFormatter *)v13;

    -[NSDateFormatter setLocale:](v2->_noTimeFormatter, "setLocale:", v5);
    -[NSDateFormatter setDateFormat:](v2->_noTimeFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd"));
    -[NSDateFormatter setTimeZone:](v2->_noTimeFormatter, "setTimeZone:", v6);
    -[NSDateFormatter setCalendar:](v2->_noTimeFormatter, "setCalendar:", v8);
    DDForce24HrsFormatProcessWideForExtraction();

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_scanners, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        CFRelease((CFTypeRef)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "pointerValue"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SGReverseTemplatesJSDataDetectors;
  -[SGReverseTemplatesJSDataDetectors dealloc](&v8, sel_dealloc);
}

- (id)runDataDetectors:(id)a3 locale:(id)a4 epoch:(double)a5 metadataForTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  SGReverseTemplatesJSDataDetectors *v29;
  id v30;
  NSObject *v31;
  _QWORD buf[4];

  buf[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  if (!v11 || (v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v11)) == 0)
  {
    v24 = v14;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No locale found for: %@"), v11);
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v21;
      _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)buf, 0xCu);
    }
    v17 = 0;
    goto LABEL_11;
  }
  v17 = (id)v16;
  if (!v13)
    goto LABEL_14;
  v24 = v14;
  v18 = objc_opt_new();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("extractions"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_scanners, "objectForKeyedSubscript:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "pointerValue");

  if (v20)
  {
    v21 = 0;
LABEL_10:
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __84__SGReverseTemplatesJSDataDetectors_runDataDetectors_locale_epoch_metadataForTypes___block_invoke;
    v25[3] = &unk_1E7DB0F48;
    v26 = v13;
    v27 = v24;
    v17 = v17;
    v28 = v17;
    v29 = self;
    v30 = v12;
    v18 = v18;
    v31 = v18;
    SGDataDetectorsScan(v20, v26, 0, v25);

    goto LABEL_11;
  }
  buf[0] = 0;
  v20 = DDScannerCreateWithLocale();
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scanners, "setObject:forKeyedSubscript:", v22, v17);

  if (v20)
    goto LABEL_10;
LABEL_11:

  if (v21)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("error"));

  }
  v14 = v24;
LABEL_14:

  return v15;
}

- (id)_result:(__DDResult *)a3 containsTypes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    -[SGReverseTemplatesJSDataDetectors _result:containsTypes:foundTypes:](self, "_result:containsTypes:foundTypes:", a3, v6, v8);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "containsObject:", v14, (_QWORD)v18));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v16 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_result:(__DDResult *)a3 containsTypes:(id)a4 foundTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  const __CFArray *SubResults;
  const __CFArray *v17;
  unint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsObject:", v15, (_QWORD)v19) & 1) == 0)
          {
            if (DDResultHasType())
            {
              objc_msgSend(v9, "addObject:", v15);
            }
            else
            {
              SubResults = (const __CFArray *)DDResultGetSubResults();
              if (SubResults)
              {
                v17 = SubResults;
                if (CFArrayGetCount(SubResults) >= 1)
                {
                  for (j = 0; j < CFArrayGetCount(v17); ++j)
                    -[SGReverseTemplatesJSDataDetectors _result:containsTypes:foundTypes:](self, "_result:containsTypes:foundTypes:", CFArrayGetValueAtIndex(v17, j), v10, v9);
                }
              }
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noTimeFormatter, 0);
  objc_storeStrong((id *)&self->_naiveDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_scanners, 0);
}

uint64_t __84__SGReverseTemplatesJSDataDetectors_runDataDetectors_locale_epoch_metadataForTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t RangeForURLification;
  uint64_t v5;
  uint64_t v6;
  uint64_t Type;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  const __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CFTimeZoneRef v21;
  id v22;
  id v23;
  id v24;
  id v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v42;
  CFTimeZoneRef v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  int Category;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[8];
  _QWORD v65[10];

  v65[8] = *MEMORY[0x1E0C80C00];
  RangeForURLification = DDResultGetRangeForURLification();
  v6 = v5;
  Type = SGDataDetectorsGetType();
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", RangeForURLification, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (Type)
  {
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    v50 = (void *)objc_opt_new();
    addAddressResultsToComponents(a2, v50);
    if (Type != 8)
    {
      if (Type != 32)
      {
        v44 = v10;
        v64[0] = CFSTR("type");
        v26 = CFSTR("NSTextCheckingTypeTransitInformation");
        v27 = CFSTR("NSTextCheckingTypePhoneNumber");
        if (Type != 2048)
          v27 = 0;
        if (Type != 4096)
          v26 = v27;
        v15 = &stru_1E7DB83A8;
        v16 = &stru_1E7DB83A8;
        v12 = &stru_1E7DB83A8;
        v13 = 0;
        if (Type == 16)
          v14 = CFSTR("NSTextCheckingTypeAddress");
        else
          v14 = (__CFString *)v26;
        goto LABEL_35;
      }
      v11 = DDResultCopyExtractedURL();
      if (v11)
      {
        v12 = (__CFString *)v11;
        v44 = v10;
        v13 = 0;
        v64[0] = CFSTR("type");
        v14 = CFSTR("NSTextCheckingTypeLink");
        v15 = &stru_1E7DB83A8;
        v16 = &stru_1E7DB83A8;
LABEL_35:
        v33 = v14;
        v65[0] = v33;
        v64[1] = CFSTR("ddType");
        v34 = (void *)objc_msgSend((id)DDResultGetType(), "copy");
        v65[1] = v34;
        v65[2] = v9;
        v47 = v9;
        v49 = (__CFString *)v15;
        v64[2] = CFSTR("text");
        v64[3] = CFSTR("iso8601");
        v65[3] = v15;
        v65[4] = v16;
        v64[4] = CFSTR("endIso8601");
        v64[5] = CFSTR("components");
        v65[5] = v50;
        v65[6] = v12;
        v64[6] = CFSTR("url");
        v64[7] = CFSTR("range");
        v62[0] = CFSTR("start");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", RangeForURLification);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v62[1] = CFSTR("end");
        v63[0] = v35;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", RangeForURLification + v6);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v63[1] = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v65[7] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 8);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v39 = (void *)objc_msgSend(v38, "mutableCopy");
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v13, CFSTR("metadata"));
          v40 = objc_msgSend(v39, "copy");

          v38 = (void *)v40;
        }
        objc_msgSend(*(id *)(a1 + 72), "addObject:", v38);

        objc_autoreleasePoolPop(v44);
        v9 = v47;
        goto LABEL_39;
      }
      v13 = 0;
      v16 = &stru_1E7DB83A8;
      goto LABEL_38;
    }
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    buf[0] = 0;
    if ((DDResultHasType() & 1) != 0 || DDResultHasType())
    {
      v20 = v10;
      v21 = CFTimeZoneCreateWithTimeIntervalFromGMT(0, 0.0);
      v54 = 0;
      v55 = 0;
      v52 = 0;
      v53 = 0;
      v43 = v21;
      SGDataDetectorsGetIntervalDatesAndTimeZoneWithLocale(a2, v19, &v55, &v54, &v53, &v52, v18, buf);
      v22 = v55;
      v23 = v54;
      v24 = v53;
      v45 = v52;
      if (v21)
        CFRelease(v21);
      v10 = v20;
      v25 = v24;
    }
    else
    {
      v51 = 0;
      SGDataDetectorsGetDateAndTimeZoneWithLocale(a2, v19, v18, &v51, buf);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = v51;
      v25 = 0;
      v45 = 0;
    }
    v46 = v23;
    if (buf[0])
    {
      v28 = a1 + 56;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "stringFromDate:", v22);
      v48 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v29 = 32;
LABEL_31:
        v31 = v22;
        objc_msgSend(*(id *)(*(_QWORD *)v28 + v29), "stringFromDate:", v25, v43, v45, v46);
        v32 = v25;
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
    }
    else
    {
      v28 = a1 + 56;
      v30 = *(_QWORD *)(a1 + 56);
      if (v23)
      {
        objc_msgSend(*(id *)(v30 + 16), "setTimeZone:", v23);
        objc_msgSend(*(id *)(*(_QWORD *)v28 + 16), "stringFromDate:", v22);
        v48 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v29 = 16;
          goto LABEL_31;
        }
      }
      else
      {
        objc_msgSend(*(id *)(v30 + 24), "stringFromDate:", v22);
        v48 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v29 = 24;
          goto LABEL_31;
        }
      }
    }
    v31 = v22;
    v32 = v25;
    v16 = &stru_1E7DB83A8;
LABEL_33:
    objc_msgSend(*(id *)(a1 + 56), "_result:containsTypes:", a2, *(_QWORD *)(a1 + 64), v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v44 = v10;
      v64[0] = CFSTR("type");
      v14 = CFSTR("NSTextCheckingTypeDate");
      v12 = &stru_1E7DB83A8;
      v15 = (const __CFString *)v48;
      goto LABEL_35;
    }
LABEL_38:

    objc_autoreleasePoolPop(v10);
    goto LABEL_39;
  }
  sgLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    Category = DDResultGetCategory();
    v58 = 2112;
    v59 = (id)DDResultGetType();
    v60 = 2112;
    v61 = v9;
    v42 = v59;
    _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "No extraction for %d:%@ = %@", buf, 0x1Cu);

  }
LABEL_39:

  return 1;
}

@end
