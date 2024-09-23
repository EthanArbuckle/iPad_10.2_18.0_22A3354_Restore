@implementation IMBlastdoor

+ (id)logger
{
  if (qword_1ED935FA8 != -1)
    dispatch_once(&qword_1ED935FA8, &unk_1E922B1B8);
  return (id)qword_1ED935F98;
}

+ (BOOL)supportsFeature:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  id v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D4D8A0], "supportsFeature:", v3);
  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "Installed BlastDoor supports feature %@ (%@)", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

+ (BOOL)_commandReadyForBlastdoor:(int64_t)a3
{
  BOOL result;
  BOOL v4;
  BOOL v5;

  result = 0;
  if (a3 > 133)
  {
    v4 = a3 == 139 || a3 == 170;
    v5 = a3 == 134 || a3 == 135;
    if (a3 <= 138)
      return v5;
    else
      return v4;
  }
  else
  {
    switch(a3)
    {
      case 'd':
      case 'e':
      case 'f':
      case 'i':
      case 'o':
      case 'p':
      case 'q':
      case 't':
      case 'v':
      case 'w':
      case 'z':
        result = 1;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (id)blastdoorInterfaceForSenderContext:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  uint64_t *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUnknownSenderBlastDoorEnabled");

  if (v5)
  {
    if (qword_1ED936258 != -1)
      dispatch_once(&qword_1ED936258, &unk_1E922B1D8);
    if (qword_1ED936270 != -1)
      dispatch_once(&qword_1ED936270, &unk_1E922B1F8);
    v6 = objc_msgSend(v3, "isTrustedSender");
    v7 = &qword_1ED936260;
    if (!v6)
      v7 = &qword_1ED936268;
    v8 = (void *)*v7;
  }
  else
  {
    if (qword_1EFC63D38 != -1)
      dispatch_once(&qword_1EFC63D38, &unk_1E922B218);
    v8 = (void *)qword_1EFC63D40;
  }
  v9 = v8;

  return v9;
}

+ (BOOL)_messageBlastdoorMetricsEnabled
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("disable-bd-metrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v3, "BOOLValue");

  IMGetCachedDomainValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "BOOLValue");
    +[IMBlastdoor logger](IMBlastdoor, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEFAULT, "Metrics manually enabled (%@)", (uint8_t *)&v10, 0xCu);
    }

  }
  return v4 ^ 1;
}

+ (int64_t)_convertErrorToBlastdoorError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code") == 4864;
    v7 = 13001;
    v8 = 13003;
LABEL_3:
    if (v6)
      v9 = v8;
    else
      v9 = v7;
    goto LABEL_6;
  }
  objc_msgSend(v3, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D35A00]);

  if (!v12)
  {
    objc_msgSend(v3, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D37C50]);

    if ((v15 & 1) != 0)
    {
      v9 = 13300;
      goto LABEL_6;
    }
    objc_msgSend(v3, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("BlastDoor.Explosion")))
    {

    }
    else
    {
      objc_msgSend(v3, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.BlastDoor"));

      if ((v18 & 1) == 0)
      {
        objc_msgSend(v3, "domain");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D359F8]);

        if ((v20 & 1) != 0)
        {
          v9 = 13600;
          goto LABEL_6;
        }
        objc_msgSend(v3, "userInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("errorMetric"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v22 == 0;
        v7 = 13250;
        v8 = 13000;
        goto LABEL_3;
      }
    }
    v9 = 13500;
    goto LABEL_6;
  }
  v13 = objc_msgSend(v3, "code");
  if ((unint64_t)(v13 - 1) >= 0x17)
    v9 = 13250;
  else
    v9 = qword_1D1683118[v13 - 1];
LABEL_6:

  return v9;
}

+ (void)_askToTapToRadarForGUID:(id)a3 messageTypeString:(id)a4 sender:(id)a5 errorString:(id)a6 payloadAttachmentURL:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isInternalInstall"))
  {
LABEL_16:

    goto LABEL_17;
  }
  v17 = IMGetCachedDomainBoolForKeyWithDefaultValue();

  if ((v17 & 1) != 0)
  {
    IMGetCachedDomainValueForKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "timeIntervalSinceDate:", v16),
          v20 = v19,
          v18,
          v20 < 3600.0))
    {
      +[IMBlastdoor logger](IMBlastdoor, "logger");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v36 = v20;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_DEFAULT, "Skipping blastdoor validation prompt because last fire date was %f seconds ago", buf, 0xCu);
      }
    }
    else
    {
      if (qword_1EFC63D50 != -1)
        dispatch_once(&qword_1EFC63D50, &unk_1E922B238);
      v21 = (void *)MEMORY[0x1E0D36B00];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An incoming iMessage from %@ failed validation.\n\nA copy of the message will be attached."), v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", CFSTR("com.apple.Messages.BlastdoorValidationFailureInternalPrompt"), CFSTR("iMessage Validation Failure"), v22, CFSTR("File a Radar"), CFSTR("Dismiss"), 0);
      v23 = objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countForIdentifier:", CFSTR("com.apple.Messages.BlastdoorValidationFailureInternalPrompt"));

        if (!v25)
        {
          +[IMBlastdoor logger](IMBlastdoor, "logger");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_DEFAULT, "Presenting BD TTR UI", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          IMSetDomainValueForKey();

          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "trackEvent:", *MEMORY[0x1E0D38798]);

          -[NSObject setUsesNotificationCenter:](v23, "setUsesNotificationCenter:", 0);
          -[NSObject setRepresentedApplicationBundle:](v23, "setRepresentedApplicationBundle:", *MEMORY[0x1E0D36C08]);
          objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = sub_1D14BDD88;
          v30[3] = &unk_1E922B260;
          v31 = v14;
          v32 = v12;
          v33 = v11;
          v34 = v15;
          objc_msgSend(v29, "addUserNotification:listener:completionHandler:", v23, 0, v30);

        }
      }
    }

    goto LABEL_16;
  }
LABEL_17:

}

+ (void)sendBlastDoorError:(id)a3 guid:(id)a4 messageTypeString:(id)a5 senderURI:(id)a6 senderToken:(id)a7 messageContext:(id)a8 payloadAttachmentURL:(id)a9
{
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  dispatch_time_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  NSObject *v53;
  _QWORD block[4];
  NSObject *v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  uint8_t buf[4];
  NSObject *v61;
  __int16 v62;
  NSObject *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if ((objc_msgSend((id)objc_opt_class(), "_messageBlastdoorMetricsEnabled") & 1) == 0)
  {
    +[IMBlastdoor logger](IMBlastdoor, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Wanted to send BlastDoor metric, but disabled via server bag.";
LABEL_12:
    v23 = v21;
    v24 = 2;
    goto LABEL_13;
  }
  if (!-[NSObject length](v15, "length"))
  {
    +[IMBlastdoor logger](IMBlastdoor, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Wanted to send BlastDoor metric, guid was nil";
    goto LABEL_12;
  }
  if (qword_1EFC63D60 != -1)
    dispatch_once(&qword_1EFC63D60, &unk_1E922B280);
  if (objc_msgSend((id)qword_1EFC63D58, "containsObject:", v15))
  {
    +[IMBlastdoor logger](IMBlastdoor, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v15;
      v22 = "Already submitted metric for GUID, ignoring (%@)";
      v23 = v21;
      v24 = 12;
LABEL_13:
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend((id)qword_1EFC63D58, "addObject:", v15);
  im_checkpointIDSService();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_msgSend((id)objc_opt_class(), "_convertErrorToBlastdoorError:", v14);
    if (v26 != -1)
    {
      v27 = v26;
      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v46 = v27;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v28, CFSTR("fR"));

      IDSGetUUIDData();
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
        -[NSObject setObject:forKey:](v21, "setObject:forKey:", v29, CFSTR("fU"));
      v50 = (void *)v29;
      if (v18)
        -[NSObject setObject:forKey:](v21, "setObject:forKey:", v18, CFSTR("t"));
      objc_msgSend(v14, "userInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("errorMetric"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown");
      v33 = &stru_1E92346B0;
      if (v32)
        v33 = CFSTR("-Lockdown");
      v51 = v31;
      v52 = v33;
      v34 = objc_msgSend(v31, "length");
      v47 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "domain");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "code"));
      v35 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v35;
      if (v34)
        objc_msgSend(v47, "stringWithFormat:", CFSTR("type-%@-%@-%@-%@%@"), v16, v49, v35, v51, v52);
      else
        objc_msgSend(v47, "stringWithFormat:", CFSTR("type-%@-%@-%@%@"), v16, v49, v35, v52, v45);
      v36 = objc_claimAutoreleasedReturnValue();

      v53 = v36;
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v36, CFSTR("fRM"));
      +[IMBlastdoor logger](IMBlastdoor, "logger");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v61 = v15;
        v62 = 2112;
        v63 = v21;
        _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_DEFAULT, "Sending BlastDoor metric (guid: %@): %@", buf, 0x16u);
      }

      im_checkpointIDSService();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sendServerMessage:command:fromAccount:", v21, &unk_1E9271218, 0);

      if (v15 && v19)
      {
        im_checkpointIDSService();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        im_sendCertifiedDeliveryReceiptIfPossible();

      }
      objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isInternalInstall");

      if (v42)
      {
        if ((objc_msgSend(v51, "containsString:", CFSTR("AVFoundationErrorDomain--11869")) & 1) != 0
          || objc_msgSend(v16, "containsString:", CFSTR("131")))
        {
          +[IMBlastdoor logger](IMBlastdoor, "logger");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v61 = v53;
            v62 = 2112;
            v63 = v15;
            _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_DEFAULT, "Don't show BlastDoor TTR for error metric: %@ (guid: %@)", buf, 0x16u);
          }

          goto LABEL_40;
        }
        v44 = dispatch_time(0, 5000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1D14BE6E0;
        block[3] = &unk_1E922B2A8;
        v55 = v15;
        v56 = v16;
        v57 = v17;
        v58 = v53;
        v59 = v20;
        dispatch_after(v44, MEMORY[0x1E0C80D38], block);

      }
LABEL_40:

      goto LABEL_14;
    }
  }
LABEL_15:

}

+ (void)sendDictionary:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void (*v26)(id, uint64_t, void *, id);
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30 = a4;
  v9 = a5;
  if (!v9)
    goto LABEL_28;
  if (!v8)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D359F8], 1, 0);
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v19);

    goto LABEL_28;
  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D34890]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D34A38]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D344F0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = objc_msgSend(v11, "integerValue", v11);
  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = v29;
    _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEFAULT, "Piping command through BlastDoor: %ld", buf, 0xCu);
  }

  objc_msgSend(v10, "objectForKey:", CFSTR("U"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v10, "objectForKey:", CFSTR("U"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_IDSDataFromBase64String:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("U"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = 0;
      v20 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("U"));
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v17;
  v21 = isKindOfClass ^ 1;
LABEL_14:
  JWUUIDPushObjectToString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v21 & 1) != 0)

  if ((isKindOfClass & 1) != 0)
  objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v34 = 0;
    objc_msgSend(v23, "defuseTopLevelDictionary:error:", v8, &v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v34;
    v26 = (void (*)(id, uint64_t, void *, id))*((_QWORD *)v9 + 2);
    if (v24)
      v26(v9, v29, v24, 0);
    else
      v26(v9, v29, 0, v25);

  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D14BEB64;
    aBlock[3] = &unk_1E922B2F8;
    v32 = v22;
    v33 = v9;
    v27 = _Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown"))
      objc_msgSend(v23, "decontaminateTopLevelDictionary:resultHandler:", v8, v27);
    else
      objc_msgSend(v23, "defuseTopLevelDictionary:resultHandler:", v8, v27);

    v25 = v32;
  }

LABEL_28:
}

+ (void)sendSMSDictionary:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void (*v14)(_QWORD *, void *, id);
  id v15;
  void *v16;
  _QWORD block[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("g"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      +[IMBlastdoor logger](IMBlastdoor, "logger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_DEFAULT, "Piping SMS/MMS dictionary for GUID (%@) through BlastDoor", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:serviceName:", 0, *MEMORY[0x1E0D38F58]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v23 = 0;
        objc_msgSend(v11, "defuseSMSDictionary:error:", v6, &v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v23;
        v14 = (void (*)(_QWORD *, void *, id))v7[2];
        if (v12)
          v14(v7, v12, 0);
        else
          v14(v7, 0, v13);

      }
      else
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = sub_1D14BF0F4;
        v20[3] = &unk_1E922B320;
        v21 = v8;
        v22 = v7;
        objc_msgSend(v11, "defuseSMSDictionary:resultHandler:", v6, v20);

        v13 = v21;
      }

    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D359F8], 2, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D14BF26C;
      block[3] = &unk_1E92290A8;
      v18 = v16;
      v19 = v7;
      v8 = v16;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

+ (void)sendClearNoticeData:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (!v8)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D359F8], 8, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D14BF5C4;
      block[3] = &unk_1E92290A8;
      v19 = v12;
      v20 = v10;
      v13 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    +[IMBlastdoor logger](IMBlastdoor, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_DEFAULT, "Piping Clear Notices through Blastdoor", buf, 2u);
    }

    objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D14BF5D8;
    v16[3] = &unk_1E922B348;
    v17 = v10;
    objc_msgSend(v15, "defuseCollaborationClearNoticePayload:resultHandler:", v8, v16);

  }
}

+ (void)sendCollaborationNoticeData:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (!v8)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D359F8], 4, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D14BFA84;
      block[3] = &unk_1E92290A8;
      v19 = v12;
      v20 = v10;
      v13 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    +[IMBlastdoor logger](IMBlastdoor, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_DEFAULT, "Piping Collaboration Notices through Blastdoor", buf, 2u);
    }

    objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D14BFA98;
    v16[3] = &unk_1E922B370;
    v17 = v10;
    objc_msgSend(v15, "defuseCollaborationNoticePayload:resultHandler:", v8, v16);

  }
}

+ (void)sendCollaborationNoticeActionDictionary:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (!v8)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D359F8], 6, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D14BFF44;
      block[3] = &unk_1E92290A8;
      v19 = v12;
      v20 = v10;
      v13 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    +[IMBlastdoor logger](IMBlastdoor, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_DEFAULT, "Piping Collaboration Notice Action through Blastdoor", buf, 2u);
    }

    objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1D14BFF5C;
    v16[3] = &unk_1E922B3C0;
    v17 = v10;
    objc_msgSend(v15, "defuseCollaborationNoticeActionDictionary:resultHandler:", v8, v16);

  }
}

+ (id)sendLiteData:(id)a3 senderContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEFAULT, "Piping lite message through Blastdoor", (uint8_t *)&v15, 2u);
  }

  objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defuseLiteTextMessage:error:", v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = v12;
    _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "Blastdoor lite message response %p received", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

+ (id)sendSatelliteSMSDictionary:(id)a3 senderContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEFAULT, "Piping lite message through Blastdoor", (uint8_t *)&v15, 2u);
  }

  objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defuseSatelliteSMSTextMessageDictionary:error:", v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = v12;
    _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEFAULT, "Blastdoor satellite SMS message response %p received", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

+ (id)sendRelayGroupMutationData:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEFAULT, "Piping group relay message through Blastdoor", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:serviceName:", 0, *MEMORY[0x1E0D38F50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defuseRelayGroupMutationPayload:error:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = v10;
    _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEFAULT, "Blastdoor group relay message response %p received", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

+ (id)sendRelayReachabilityRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEFAULT, "Piping relay reachability request through Blastdoor", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:serviceName:", 1, *MEMORY[0x1E0D38F50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defuseRelayReachabilityRequestPayload:error:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = v10;
    _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEFAULT, "Blastdoor relay reachability request response %p received", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

+ (id)sendRelayReachabilityResponse:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEFAULT, "Piping relay reachability response through Blastdoor", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:serviceName:", 1, *MEMORY[0x1E0D38F50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defuseRelayReachabilityResponsePayload:error:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMBlastdoor logger](IMBlastdoor, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = v10;
    _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEFAULT, "Blastdoor relay reachability response response %p received", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

@end
