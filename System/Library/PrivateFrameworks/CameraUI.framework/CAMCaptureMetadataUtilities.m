@implementation CAMCaptureMetadataUtilities

+ (id)metadataFromRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heading");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CAMLocationController locationMetadataForLocation:heading:device:](CAMLocationController, "locationMetadataForLocation:heading:device:", v5, v6, objc_msgSend(v3, "captureDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, *MEMORY[0x1E0CBCD68]);

  }
  if (objc_msgSend(v3, "capturedFromPhotoBooth"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKey:", v8, *MEMORY[0x1E0CBCED8]);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0CBCF10]);
    objc_msgSend(v9, "addObject:", CFSTR("Photo Booth"));

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F038AD80))
  {
    objc_msgSend(v3, "burstIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D03CE8]);

  }
  if (!objc_msgSend(v3, "type"))
  {
    v12 = v3;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "semanticStyleSupportForMode:devicePosition:", objc_msgSend(v12, "captureMode"), objc_msgSend(v12, "captureDevicePosition"));

    objc_msgSend(v12, "semanticStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if ((v14 & 2) != 0)
      {
        objc_msgSend(v12, "semanticStyle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v12, "semanticStyle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *MEMORY[0x1E0D03D98];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "makerPreset"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D03D90]);

        }
      }
    }

  }
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CBCF70]);
  v21 = (void *)objc_msgSend(v4, "copy");

  return v21;
}

+ (id)preciseCaptureDateFromStillImageMetadata:(id)a3
{
  void *v3;
  const __CFDictionary *v4;
  OpaqueCMClock *HostTimeClock;
  void *v6;
  CMTime v8;
  CMTime lhs;
  CMTime v10;
  CMTime v11;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CBCF70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D03DE8]);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    HostTimeClock = CMClockGetHostTimeClock();
    memset(&v11, 0, sizeof(v11));
    CMTimeMakeFromDictionary(&v11, v4);
    memset(&v10, 0, sizeof(v10));
    CMClockGetTime(&lhs, HostTimeClock);
    v8 = v11;
    CMTimeSubtract(&v10, &lhs, &v8);
    v8 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -CMTimeGetSeconds(&v8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)removeUnwantedKeysForPersistenceFromMetadata:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("{Diagnostic}"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("AddDebugInfoToUserComments"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("{ApplePortrait}"));
  v3 = *MEMORY[0x1E0CF1318];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CF1318]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D051C8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D051C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v5);
    objc_msgSend(v8, "setObject:forKey:", v7, v3);

  }
}

+ (id)metadataFromPanoramaRequest:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0CBCB50]);
  +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", 0, objc_msgSend(v3, "captureDevice"), objc_msgSend(v3, "captureOrientation"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PLExifOrientationFromImageOrientation());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, *MEMORY[0x1E0CBCFF0]);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKey:", v7, *MEMORY[0x1E0CBD090]);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MGCopyAnswer();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v8, "localizedModel");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v7, "setObject:forKey:", CFSTR("Apple"), *MEMORY[0x1E0CBD0B0]);
  objc_msgSend(v7, "setObject:forKey:", v12, *MEMORY[0x1E0CBD0B8]);
  objc_msgSend(v8, "systemVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v13, *MEMORY[0x1E0CBD0D8]);

  if (metadataFromPanoramaRequest__onceToken != -1)
    dispatch_once(&metadataFromPanoramaRequest__onceToken, &__block_literal_global_3);
  v23 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)metadataFromPanoramaRequest__exifDateTimeFormatter, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && objc_msgSend(v15, "length"))
  {
    objc_msgSend(v5, "setObject:forKey:", v16, *MEMORY[0x1E0CBCB40]);
    objc_msgSend(v5, "setObject:forKey:", v16, *MEMORY[0x1E0CBCB38]);
    objc_msgSend(v7, "setObject:forKey:", v16, *MEMORY[0x1E0CBD088]);
  }
  v17 = v12;
  objc_msgSend((id)metadataFromPanoramaRequest__exifSubsecTimeFormatter, "stringFromDate:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && objc_msgSend(v18, "length"))
  {
    objc_msgSend(v5, "setObject:forKey:", v19, *MEMORY[0x1E0CBCCA0]);
    objc_msgSend(v5, "setObject:forKey:", v19, *MEMORY[0x1E0CBCC98]);
  }
  +[CAMCaptureMetadataUtilities metadataFromRequest:](CAMCaptureMetadataUtilities, "metadataFromRequest:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v20);
  v21 = (void *)objc_msgSend(v4, "copy");

  return v21;
}

uint64_t __59__CAMCaptureMetadataUtilities_metadataFromPanoramaRequest___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)metadataFromPanoramaRequest__exifDateTimeFormatter;
  metadataFromPanoramaRequest__exifDateTimeFormatter = (uint64_t)v0;

  v2 = (void *)metadataFromPanoramaRequest__exifDateTimeFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)metadataFromPanoramaRequest__exifDateTimeFormatter;
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = *MEMORY[0x1E0C996C8];
  v7 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "setCalendar:", v7);

  objc_msgSend((id)metadataFromPanoramaRequest__exifDateTimeFormatter, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss"));
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v9 = (void *)metadataFromPanoramaRequest__exifSubsecTimeFormatter;
  metadataFromPanoramaRequest__exifSubsecTimeFormatter = (uint64_t)v8;

  v10 = (void *)metadataFromPanoramaRequest__exifSubsecTimeFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocale:", v11);

  v12 = (void *)metadataFromPanoramaRequest__exifSubsecTimeFormatter;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v6);
  objc_msgSend(v12, "setCalendar:", v13);

  return objc_msgSend((id)metadataFromPanoramaRequest__exifSubsecTimeFormatter, "setDateFormat:", CFSTR("SSS"));
}

@end
