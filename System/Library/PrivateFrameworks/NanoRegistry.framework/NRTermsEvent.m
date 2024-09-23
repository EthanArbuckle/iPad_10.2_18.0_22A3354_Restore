@implementation NRTermsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)pathToTermsCache
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0C99E98];
  +[NRDataFilePaths pathToNanoRegistryStateDirectory](NRDataFilePaths, "pathToNanoRegistryStateDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("termsCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pathToTermsWithDigest:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addCharactersInString:", CFSTR("%."));
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".termsText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[NRTermsEvent pathToTermsCache]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t eventType;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->super._eventDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  eventType = self->super._eventType;
  objc_opt_self();
  if ((unint64_t)(eventType - 1) > 4)
    v8 = CFSTR("Not Set");
  else
    v8 = off_1E4494E98[eventType - 1];
  -[NRTermsEvent termsText](self, "termsText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NRTermsEvent digestFromData:](NRTermsEvent, "digestFromData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NRTermsEvent[%@] \"%@\": digest(%@) docID(%@) process(%@) displayDeviceName(%@) acknowlegedDeviceName(%@) presentationReason(%@)"), v6, v8, v10, self->super._documentationID, self->super._loggingProcessName, self->super._displayDeviceName, self->super._acknowledgedDeviceName, self->super._presentationReason);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)digestFromData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "NRSHA256");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isTermsAlreadyArchived
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = *(void **)&self->_flaggedForSend;
  if (!v2)
    return 0;
  +[NRTermsEvent pathToTermsWithDigest:]((uint64_t)NRTermsEvent, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  return v6;
}

- (id)termsText
{
  NSData *termsText;
  void *v4;
  NSData *v5;

  termsText = self->super._termsText;
  if (termsText)
    goto LABEL_5;
  if ((+[NRTermsEvent shouldAllowArchivingOfTermsTextToFile]() & 1) == 0)
  {
    termsText = self->super._termsText;
LABEL_5:
    v5 = termsText;
    return v5;
  }
  +[NRTermsEvent pathToTermsWithDigest:]((uint64_t)NRTermsEvent, *(void **)&self->_flaggedForSend);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "loadTermsWithPath:", v4);
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)shouldAllowArchivingOfTermsTextToFile
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  objc_opt_self();
  v0 = getpid();
  NRProcessNameForPID(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("nanoregistryd"), "isEqualToString:", v2) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(CFSTR("pairtool"), "isEqualToString:", v2);

  return v3;
}

- (void)saveTerms
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (-[NRTermsEvent isTermsAlreadyArchived](self, "isTermsAlreadyArchived"))
    return;
  v17 = *MEMORY[0x1E0CB2AD8];
  v18[0] = *MEMORY[0x1E0CB2AE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NRTermsEvent pathToTermsCache]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, v3, &v16);
  v6 = v16;

  if (v6)
  {
    v11 = v6;
    goto LABEL_10;
  }
  -[NRTermsEvent termsText](self, "termsText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "digestFromData:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)&self->_flaggedForSend;
    *(_QWORD *)&self->_flaggedForSend = v8;

  }
  +[NRTermsEvent pathToTermsWithDigest:]((uint64_t)NRTermsEvent, *(void **)&self->_flaggedForSend);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "writeToURL:options:error:", v10, 1073741825, &v15);
  v11 = v15;
  if (v11)
LABEL_10:
    objc_exception_throw(objc_retainAutorelease(v11));
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "matchesDataAtFilePath:", v12);

  if ((v13 & 1) == 0)
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }

}

+ (id)loadTermsWithPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  id v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (!v6)
    objc_exception_throw(objc_retainAutorelease(v5));

  return v4;
}

- (NRTermsEvent)initWithCoder:(id)a3
{
  id v4;
  NRTermsEvent *v5;
  NRTermsEvent *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NRTermsEvent;
  v5 = -[NRTermsEvent initWithCoder:](&v12, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    if (!v5->super._termsText && +[NRTermsEvent shouldAllowArchivingOfTermsTextToFile]())
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsDigest"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)&v6->_flaggedForSend;
      *(_QWORD *)&v6->_flaggedForSend = v7;

    }
    if ((+[NRTermsEvent shouldAllowArchivingOfTermsTextToFile]() & 1) == 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsDigest"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 4);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v11);
      }
    }
  }

  return v6;
}

+ (id)eventWithProtobuf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setWritable:", 1);
  objc_msgSend(v4, "mergeFrom:", v3);

  if (objc_msgSend(v4, "hasTermsText"))
  {
    objc_msgSend(v4, "termsText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NRTermsEvent digestFromData:](NRTermsEvent, "digestFromData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTermsDigest:", v6);

  }
  objc_msgSend(v4, "setWritable:", 0);
  return v4;
}

- (void)saveEventTextToFileIfNeeded
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  void *v7;

  if (!-[NRTermsEvent isTermsAlreadyArchived](self, "isTermsAlreadyArchived"))
  {
    -[NRTermsEvent termsText](self, "termsText");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3 || self->super._eventDate == 0.0)
    {
      +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
    v4 = (void *)v3;
    if (*(_QWORD *)&self->_flaggedForSend)
    {
      v7 = (void *)v3;
      v5 = +[NRTermsEvent shouldAllowArchivingOfTermsTextToFile]();
      v4 = v7;
      if (v5)
      {
        -[NRTermsEvent saveTerms](self, "saveTerms");
        v4 = v7;
      }
    }

  }
}

- (NRTermsEvent)initWithDeviceID:(id)a3
{
  id v4;
  NRTermsEvent *v5;
  NRTermsEvent *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  NSString *acknowledgedDeviceName;
  uint64_t v20;
  NSString *acknowledgedDeviceSerialNumber;
  uint64_t v22;
  NSString *displayDeviceName;
  uint64_t v24;
  NSString *displayDeviceSerialNumber;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString *loggingProcessName;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  objc_super v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  NSString *v44;
  __int16 v45;
  NSString *v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  NSString *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRTermsEvent init](self, "init");
  v6 = v5;
  if (v5)
  {
    *((_BYTE *)&v5->super._has + 5) = 1;
    +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getAllDevicesWithArchivedAltAccountDevicesMatching:", &__block_literal_global);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v14, "valueForProperty:", CFSTR("pairingID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v4);

          if (v16)
          {
            v17 = v14;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        if (v11)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_12:

    objc_msgSend(v17, "valueForProperty:", CFSTR("localizedModel"));
    v18 = objc_claimAutoreleasedReturnValue();
    acknowledgedDeviceName = v6->super._acknowledgedDeviceName;
    v6->super._acknowledgedDeviceName = (NSString *)v18;

    objc_msgSend(v17, "valueForProperty:", CFSTR("serialNumber"));
    v20 = objc_claimAutoreleasedReturnValue();
    acknowledgedDeviceSerialNumber = v6->super._acknowledgedDeviceSerialNumber;
    v6->super._acknowledgedDeviceSerialNumber = (NSString *)v20;

    v22 = MGCopyAnswer();
    displayDeviceName = v6->super._displayDeviceName;
    v6->super._displayDeviceName = (NSString *)v22;

    v24 = MGCopyAnswer();
    displayDeviceSerialNumber = v6->super._displayDeviceSerialNumber;
    v6->super._displayDeviceSerialNumber = (NSString *)v24;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v38.receiver = v6;
    v38.super_class = (Class)NRTermsEvent;
    -[NRPBTermsEvent setEventDate:](&v38, sel_setEventDate_);
    v26 = getpid();
    NRProcessNameForPID(v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    loggingProcessName = v6->super._loggingProcessName;
    v6->super._loggingProcessName = (NSString *)v28;

    if (v4
      && (!v6->super._acknowledgedDeviceName
       || !v6->super._acknowledgedDeviceSerialNumber
       || !v6->super._displayDeviceName
       || !v6->super._displayDeviceSerialNumber))
    {
      nr_daemon_log();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

      if (v31)
      {
        nr_daemon_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v6->super._acknowledgedDeviceName;
          v34 = v6->super._acknowledgedDeviceSerialNumber;
          v35 = v6->super._displayDeviceName;
          v36 = v6->super._displayDeviceSerialNumber;
          *(_DWORD *)buf = 138413058;
          v44 = v33;
          v45 = 2112;
          v46 = v34;
          v47 = 2112;
          v48 = v35;
          v49 = 2112;
          v50 = v36;
          _os_log_impl(&dword_1A0BDB000, v32, OS_LOG_TYPE_DEFAULT, "_acknowledgedDeviceName: %@ _acknowledgedDeviceSerialNumber: %@ _displayDeviceName:%@ _displayDeviceSerialNumber:%@", buf, 0x2Au);
        }

      }
    }

  }
  return v6;
}

uint64_t __33__NRTermsEvent_initWithDeviceID___block_invoke()
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->super._acknowledgedDeviceName
    || !self->super._acknowledgedDeviceSerialNumber
    || !self->super._displayDeviceName
    || !self->super._displayDeviceSerialNumber)
  {
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_DEFAULT, "Terms saved with missing device info.  This is not fatal: %@", buf, 0xCu);

      }
    }
  }
  v9 = *(_QWORD *)&self->_flaggedForSend;
  if (v9)
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("termsDigest"));
  v10.receiver = self;
  v10.super_class = (Class)NRTermsEvent;
  -[NRTermsEvent encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);

}

- (void)setEventType:(int)a3
{
  id v3;
  objc_super v4;

  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setEventType:](&v4, sel_setEventType_, *(_QWORD *)&a3);
}

- (void)_setEventType:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setEventType:](&v3, sel_setEventType_, a3);
}

- (void)setTermsText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setTermsText:](&v7, sel_setTermsText_, v4);

}

- (void)setDocumentationID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setDocumentationID:](&v7, sel_setDocumentationID_, v4);

}

- (void)setPresentationReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setPresentationReason:](&v7, sel_setPresentationReason_, v4);

}

- (void)setPresentationLocation:(int)a3
{
  id v3;
  objc_super v4;

  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setPresentationLocation:](&v4, sel_setPresentationLocation_, *(_QWORD *)&a3);
}

- (void)setAcknowledgedDeviceName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setAcknowledgedDeviceName:](&v7, sel_setAcknowledgedDeviceName_, v4);

}

- (void)setAcknowledgedDeviceSerialNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setAcknowledgedDeviceSerialNumber:](&v7, sel_setAcknowledgedDeviceSerialNumber_, v4);

}

- (void)setDisplayDeviceName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setDisplayDeviceName:](&v7, sel_setDisplayDeviceName_, v4);

}

- (void)setDisplayDeviceSerialNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setDisplayDeviceSerialNumber:](&v7, sel_setDisplayDeviceSerialNumber_, v4);

}

- (void)setEventDate:(double)a3
{
  id v3;
  objc_super v4;

  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5, a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setEventDate:](&v4, sel_setEventDate_, a3);
}

- (void)updateEventDate
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3.receiver = self;
  v3.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setEventDate:](&v3, sel_setEventDate_);
}

- (void)setLoggingProcessName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  if (!*((_BYTE *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setLoggingProcessName:](&v7, sel_setLoggingProcessName_, v4);

}

- (void)_setLoggingProcessName:(id)a3
{
  objc_storeStrong((id *)&self->super._loggingProcessName, a3);
}

- (NSString)termsDigest
{
  return *(NSString **)&self->_flaggedForSend;
}

- (void)setTermsDigest:(id)a3
{
  objc_storeStrong((id *)&self->_flaggedForSend, a3);
}

- (BOOL)flaggedForSend
{
  return *((_BYTE *)&self->super._has + 4);
}

- (void)setFlaggedForSend:(BOOL)a3
{
  *((_BYTE *)&self->super._has + 4) = a3;
}

- (BOOL)writable
{
  return *((_BYTE *)&self->super._has + 5);
}

- (void)setWritable:(BOOL)a3
{
  *((_BYTE *)&self->super._has + 5) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flaggedForSend, 0);
}

@end
