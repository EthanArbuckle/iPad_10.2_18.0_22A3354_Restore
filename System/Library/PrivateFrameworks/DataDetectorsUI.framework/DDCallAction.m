@implementation DDCallAction

- (double)_systemFontSize
{
  void *v2;
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 21.0;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB410]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB438]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB428]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB420]) & 1) == 0)
  {
    v4 = 22.0;
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB408]) & 1) == 0)
    {
      if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB400]))
        v4 = 23.0;
      else
        v4 = 24.0;
    }
  }

  return v4;
}

- (BOOL)_titleFitsInActionSheet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CEA5E8];
  v5 = a3;
  -[DDCallAction _systemFontSize](self, "_systemFontSize");
  objc_msgSend(v4, "systemFontOfSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CEA098];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeWithAttributes:", v7);
  v9 = v8;

  return v9 <= 304.0;
}

- (id)localizedCallStringForName:(id)a3 usingCallRelay:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  if (!v4
    || (objc_msgSend(MEMORY[0x1E0DBD1B0], "supplementalDialTelephonyCallStringForDestination:isPhoneNumber:", v5, 0),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    DDLocalizedStringWithDefaultValue(CFSTR("CALL_PERSON"), 0, 0, CFSTR("Call %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)subtitle
{
  void *v2;
  void *v3;

  -[DDTelephoneNumberAction bizItem](self, "bizItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedName
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSString *v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  NSString *phoneNumber;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD activity_block[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3;
  v38 = __Block_byref_object_dispose__3;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3;
  v32 = __Block_byref_object_dispose__3;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __29__DDCallAction_localizedName__block_invoke;
  activity_block[3] = &unk_1E4258990;
  activity_block[4] = self;
  activity_block[5] = &v22;
  activity_block[6] = &v34;
  activity_block[7] = &v28;
  _os_activity_initiate(&dword_19EFBB000, "searching for name in Contacts to display Call label", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  v3 = objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsPrimaryCalling");
  if (!objc_msgSend((id)v35[5], "length"))
  {
    v9 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend((id)v23[5], "length"))
  {
    v7 = 0;
    goto LABEL_9;
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  DDLocalizedString(CFSTR("%@ (%@)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v35[5], v23[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DDCallAction localizedCallStringForName:usingCallRelay:](self, "localizedCallStringForName:usingCallRelay:", v6, v3 ^ 1u);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !-[DDCallAction _titleFitsInActionSheet:](self, "_titleFitsInActionSheet:", v7))
  {

LABEL_9:
    -[DDCallAction localizedCallStringForName:usingCallRelay:](self, "localizedCallStringForName:usingCallRelay:", v35[5], v3 ^ 1u);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && -[DDCallAction _titleFitsInActionSheet:](self, "_titleFitsInActionSheet:", v9))
      goto LABEL_34;
LABEL_11:
    if (objc_msgSend((id)v29[5], "length"))
    {
      -[DDCallAction localizedCallStringForName:usingCallRelay:](self, "localizedCallStringForName:usingCallRelay:", v29[5], v3 ^ 1u);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (-[DDCallAction _titleFitsInActionSheet:](self, "_titleFitsInActionSheet:", v10))
        {
          v11 = v10;
LABEL_35:
          v8 = v11;
          goto LABEL_36;
        }
        v9 = v10;
        if ((v3 & 1) != 0)
          goto LABEL_20;
        goto LABEL_17;
      }
      v9 = 0;
    }
    if ((v3 & 1) != 0)
    {
LABEL_20:
      if (v9)
        goto LABEL_41;
      if (-[DDCallAction isEmail](self, "isEmail"))
      {
        v14 = self->super._phoneNumber;
      }
      else
      {
        -[NSURL dd_formattedPhoneNumber](self->super.super._url, "dd_formattedPhoneNumber");
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        phoneNumber = v15;
        if (!v15)
          phoneNumber = self->super._phoneNumber;
        v14 = phoneNumber;

      }
      if (!-[NSString length](v14, "length"))
      {

        v9 = 0;
        if ((v3 & 1) != 0)
        {
LABEL_32:
          if (!v9)
          {
            DDLocalizedString(CFSTR("Call"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_34;
        }
LABEL_31:
        objc_msgSend(MEMORY[0x1E0DBD1B0], "supplementalDialTelephonyCallString");
        v19 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v19;
        goto LABEL_32;
      }
      v17 = (void *)MEMORY[0x1E0CB3940];
      DDLocalizedStringWithDefaultValue(CFSTR("CALL_NUMBER"), 0, 0, CFSTR("Call %@"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v18, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
LABEL_41:
        if (-[DDCallAction _titleFitsInActionSheet:](self, "_titleFitsInActionSheet:", v9))
        {
LABEL_34:
          v11 = v9;
          goto LABEL_35;
        }
      }
      if ((v3 & 1) != 0)
        goto LABEL_32;
      goto LABEL_31;
    }
LABEL_17:
    v12 = self->super._phoneNumber;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0DBD1B0], "supplementalDialTelephonyCallStringForDestination:isPhoneNumber:", v12, 1);
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    goto LABEL_20;
  }
  v8 = v7;

LABEL_36:
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v8;
}

void __29__DDCallAction_localizedName__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = (void *)a1[4];
  if (objc_msgSend(v2, "treatAsMenu"))
  {
    objc_msgSend(v2, "contactAndLabelForPhoneNumber:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v4 + 40);
    objc_msgSend(v2, "contactAndLabelForPhoneNumber:", &obj);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v4 + 40), obj);
  }
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 1000);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)notificationTitleTargetString
{
  _BOOL4 v3;
  NSString *phoneNumber;
  __CFString *v5;
  NSString *v6;
  NSString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  _QWORD activity_block[7];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__3;
  v13[4] = __Block_byref_object_dispose__3;
  v14 = 0;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __45__DDCallAction_notificationTitleTargetString__block_invoke;
  activity_block[3] = &unk_1E42589B8;
  activity_block[4] = self;
  activity_block[5] = v13;
  activity_block[6] = &v15;
  _os_activity_initiate(&dword_19EFBB000, "searching for name in Contacts to display Call label", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  v3 = -[DDCallAction isEmail](self, "isEmail");
  phoneNumber = self->super._phoneNumber;
  if (v3)
  {
    v5 = phoneNumber;
  }
  else if (phoneNumber)
  {
    TUFormattedPhoneNumber();
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v7 = self->super._phoneNumber;
    v5 = v7;

  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend((id)v16[5], "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v16[5], v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E4259460;
    if (v5)
      v9 = v5;
    v8 = v9;
  }
  v10 = v8;

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __45__DDCallAction_notificationTitleTargetString__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "contactAndLabelForPhoneNumber:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)notificationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  DDLocalizedString(CFSTR("Call %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDCallAction notificationTitleTargetString](self, "notificationTitleTargetString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dialRequest
{
  void *v3;
  void *v4;

  if (self->super._phoneNumber)
  {
    objc_msgSend((id)objc_opt_class(), "callProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDCallAction dialRequestWithProvider:](self, "dialRequestWithProvider:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)dialRequestWithProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && self->super._phoneNumber)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithProvider:", v4);
    objc_msgSend(MEMORY[0x1E0DBD2F8], "handleWithDestinationID:", self->super._phoneNumber);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHandle:", v6);

    objc_msgSend(v5, "setPerformDialAssist:", 1);
    objc_msgSend(v5, "setTtyType:", -[DDCallAction TTYType](self, "TTYType"));
    objc_msgSend(v5, "setShowUIPrompt:", self->super.super._isDefaultAction);
    objc_msgSend(v5, "setVideo:", 0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)performFromView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DDCallAction *v11;
  id v12;

  v4 = a3;
  -[DDCallAction dialRequest](self, "dialRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDCallAction performFromView:].cold.1();
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__DDCallAction_performFromView___block_invoke;
  v9[3] = &unk_1E42589E0;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "launchAppForDialRequest:completion:", v8, v9);

}

void __32__DDCallAction_performFromView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __32__DDCallAction_performFromView___block_invoke_cold_1(a1, v3);
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v6 = *(void **)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_performFromView:byOpeningURL:", v5, v7);

    }
  }

}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (id)notificationIconBundleIdentifier
{
  return CFSTR("com.apple.mobilephone");
}

- (id)notificationURL
{
  void *v3;
  void *url;
  void *v5;
  id v6;

  -[DDCallAction dialRequest](self, "dialRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  url = (void *)objc_claimAutoreleasedReturnValue();
  v5 = url;
  if (!url)
    url = self->super.super._url;
  v6 = url;

  return v6;
}

- (int)interactionType
{
  return 0;
}

- (int64_t)TTYType
{
  return !self->super.super._isDefaultAction;
}

+ (id)callProvider
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DBD1E0]);
  objc_msgSend(v2, "telephonyProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isAvailable
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;

  if (objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsTelephonyCalls")
    && (objc_msgSend(a1, "callProvider"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    os_unfair_lock_lock(&isAvailable__unfairLock);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!isAvailable__lastCheckDate || (objc_msgSend(v4, "timeIntervalSinceDate:"), v6 > 60.0))
    {
      objc_storeStrong((id *)&isAvailable__lastCheckDate, v5);
      isAvailable__canCallOrNotSure = 0;
      if ((objc_msgSend(MEMORY[0x1E0DBD1B8], "canAttemptTelephonyCallsWithoutCellularConnection") & 1) == 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
        v8 = v7;
        if (v7)
        {
          v13 = 0;
          objc_msgSend(v7, "isAnySimReadyWithError:", &v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!v13 && (objc_msgSend(v9, "BOOLValue") & 1) == 0)
            isAvailable__canCallOrNotSure = 1;

        }
      }
    }
    v11 = isAvailable__canCallOrNotSure ^ 1;
    os_unfair_lock_unlock(&isAvailable__unfairLock);

  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

- (BOOL)isEmail
{
  return -[NSString containsString:](self->super._phoneNumber, "containsString:", CFSTR("@"));
}

- (void)performFromView:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Will initiate call with dial request '%@'", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __32__DDCallAction_performFromView___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[14];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  v5 = v3;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "An error occurred while trying to launch external app with dial request '%@': %@", v4, 0x16u);

  OUTLINED_FUNCTION_6();
}

@end
