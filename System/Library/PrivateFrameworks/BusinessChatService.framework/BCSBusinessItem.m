@implementation BCSBusinessItem

- (BCSBusinessItem)initWithChatSuggestMessage:(id)a3 bucketID:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BCSOpenHours *v10;
  void *v11;
  void *v12;
  void *v13;
  BCSOpenHours *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BCSCallToActionItem *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BCSVisibilityItem *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;
  void *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  BCSBusinessItem *v51;
  BCSOpenHours *v52;
  BCSOpenHours *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "chatOpenHours");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v5, "phoneOpenHours");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7)
  {
    v10 = [BCSOpenHours alloc];
    objc_msgSend(v5, "chatOpenHours");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[BCSOpenHours initWithHoursPeriodMessage:timeZone:](v10, "initWithHoursPeriodMessage:timeZone:", v12, v13);

    if (v9)
    {
LABEL_3:
      v14 = [BCSOpenHours alloc];
      objc_msgSend(v5, "phoneOpenHours");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[BCSOpenHours initWithHoursPeriodMessage:timeZone:](v14, "initWithHoursPeriodMessage:timeZone:", v16, v17);

      goto LABEL_6;
    }
  }
  else
  {
    v53 = 0;
    if (v9)
      goto LABEL_3;
  }
  v52 = 0;
LABEL_6:
  v18 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v5, "callToActions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v59;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v59 != v22)
          objc_enumerationMutation(v19);
        v24 = -[BCSCallToActionItem initWithCallToAction:]([BCSCallToActionItem alloc], "initWithCallToAction:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v23));
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v21);
  }

  v25 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v5, "visibilities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v55;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v55 != v29)
          objc_enumerationMutation(v26);
        v31 = -[BCSVisibilityItem initWithVisibility:]([BCSVisibilityItem alloc], "initWithVisibility:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v30));
        objc_msgSend(v25, "addObject:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v28);
  }

  objc_msgSend(v5, "tintColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[BCSBusinessItem _integerForHexString:](self, "_integerForHexString:", v32);

  objc_msgSend(v5, "backgroundColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[BCSBusinessItem _integerForHexString:](self, "_integerForHexString:", v33);

  v34 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "squareLogoUrl");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "URLWithString:", v35);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "wideLogoUrl");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "URLWithString:", v37);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bizId");
  v38 = v5;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "name");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v38, "phoneHash");
  v42 = objc_msgSend(v38, "isVerified");
  objc_msgSend(v38, "intentId");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "group");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v46) = v42;
  v51 = -[BCSBusinessItem initWithBizID:phoneNumber:name:phoneHash:squareLogoURL:wideLogoURL:tintColor:backgroundColor:callToActions:messagingOpenHours:callingOpenHours:isVerified:intentID:groupID:visibilityItems:](self, "initWithBizID:phoneNumber:name:phoneHash:squareLogoURL:wideLogoURL:tintColor:backgroundColor:callToActions:messagingOpenHours:callingOpenHours:isVerified:intentID:groupID:visibilityItems:", v39, &stru_24C39D888, v40, v41, v48, v47, v50, v49, v18, v53, v52, v46, v43, v44, v25);

  return v51;
}

+ (id)businessItemsFromChatSuggestJSONObj:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  BCSChatSuggestMessage *v15;
  BCSBusinessItem *v16;
  void *v17;
  BCSBusinessItem *v18;
  NSObject *v19;
  id v21;
  uint64_t v22;
  id obj;
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v7 = CFSTR("message");
    do
    {
      v8 = 0;
      v22 = v5;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v8), "objectForKeyedSubscript:", 0x24C39F068);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v11 = v7;
          v12 = v6;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v13, 0);
          v15 = -[BCSChatSuggestMessage initWithData:]([BCSChatSuggestMessage alloc], "initWithData:", v14);
          v16 = [BCSBusinessItem alloc];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), -[BCSChatSuggestMessage phoneHash](v15, "phoneHash"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[BCSBusinessItem initWithChatSuggestMessage:bucketID:](v16, "initWithChatSuggestMessage:bucketID:", v15, v17);

          if (v18)
          {
            objc_msgSend(v21, "addObject:", v18);
          }
          else
          {
            ABSLogCommon();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20ACAD000, v19, OS_LOG_TYPE_ERROR, "BCSBusinessItemFromChatSuggestJSONObj: BusinessItem object didn't initialize correctly", buf, 2u);
            }

          }
          v6 = v12;
          v7 = v11;
          v5 = v22;
        }
        else
        {
          ABSLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_20ACAD000, v13, OS_LOG_TYPE_ERROR, "BCSBusinessItemFromChatSuggestJSONObj: Message object is not a dictionary or not initialized", buf, 2u);
          }
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  return v21;
}

+ (id)businessItemsFromChatSuggestMessageDictionary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  BCSBusinessItem *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BCSChatSuggestMessage *v10;
  uint64_t v11;
  BCSBusinessItem *v12;
  BCSBusinessItem *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  id obj;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("records"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v23;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectForKeyedSubscript:", 0x24C39F068);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("message"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v21, 0);
            v10 = -[BCSChatSuggestMessage initWithData:]([BCSChatSuggestMessage alloc], "initWithData:", v20);
            v11 = v4;
            v12 = v5;
            v13 = [BCSBusinessItem alloc];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BCSChatSuggestMessage phoneHash](v10, "phoneHash"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringValue");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = -[BCSBusinessItem initWithChatSuggestMessage:bucketID:](v13, "initWithChatSuggestMessage:bucketID:", v10, v15);

            v4 = v11;
            v6 = v18;

          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)businessItemsFromRecords:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BCSChatSuggestMessage *v10;
  BCSBusinessItem *v11;
  void *v12;
  void *v13;
  BCSBusinessItem *v14;
  NSObject *v15;
  void *v16;
  id obj;
  uint8_t buf[16];
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
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v8), "objectForKeyedSubscript:", CFSTR("message"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[BCSChatSuggestMessage initWithData:]([BCSChatSuggestMessage alloc], "initWithData:", v9);
        v11 = [BCSBusinessItem alloc];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[BCSChatSuggestMessage phoneHash](v10, "phoneHash"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[BCSBusinessItem initWithChatSuggestMessage:bucketID:](v11, "initWithChatSuggestMessage:bucketID:", v10, v13);

        if (v14)
        {
          objc_msgSend(v4, "addObject:", v14);
        }
        else
        {
          ABSLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_ERROR, "BCSBusinessItemFromRecords: BusinessItem object didn't initialize correctly", buf, 2u);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

- (NSString)callSubtitle
{
  void *v3;
  void *v4;
  void *v5;

  if (-[BCSBusinessItem isAvailableForCalling](self, "isAvailableForCalling")
    || (-[BCSBusinessItem dateWhenCallingAvailableNext](self, "dateWhenCallingAvailableNext"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    v5 = 0;
  }
  else
  {
    -[BCSBusinessItem dateWhenCallingAvailableNext](self, "dateWhenCallingAvailableNext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSBusinessItem _availableNextStringFromAvailableNextDate:]((uint64_t)self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (id)_availableNextStringFromAvailableNextDate:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  __CFString *v10;
  objc_class *v11;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;

  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDBCE60];
    v3 = a2;
    objc_msgSend(v2, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v34 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSLocale isDevice24HourTime](v34);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSLocalizedStringProvider sharedInstance](BCSLocalizedStringProvider, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    v9 = v7;
    v10 = CFSTR("h:mm a");
    if (v5)
      v10 = CFSTR("H:mm");
    v11 = (objc_class *)MEMORY[0x24BDD1500];
    v12 = v10;
    v13 = v6;
    v14 = v4;
    v15 = objc_alloc_init(v11);
    objc_msgSend(v15, "setDateFormat:", v12);

    objc_msgSend(v15, "stringFromDate:", v8);
    v33 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "component:fromDate:", 32, v8);
    if (v5)
      v17 = v16;
    else
      v17 = v16 % 12;

    v18 = (objc_class *)MEMORY[0x24BDD1500];
    v19 = v8;
    v20 = v14;
    v21 = objc_alloc_init(v18);
    objc_msgSend(v21, "setDateFormat:", CFSTR("EEEE"));
    objc_msgSend(v21, "stringFromDate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromDate:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v20);
    v25 = v24;

    v26 = objc_msgSend(v23, "isEqualToString:", v22);
    if (v26 && fabs(v25) < 86400.0)
    {
      if (v17 == 1)
      {
        v27 = (void *)v33;
        objc_msgSend(v9, "willOpenAtSameDaySingularWithFormattedTime:", v33);
      }
      else
      {
        v27 = (void *)v33;
        objc_msgSend(v9, "willOpenAtSameDayPluralWithFormattedTime:", v33);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v34;
    }
    else
    {
      v28 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v28, "setDateFormat:", CFSTR("EEEE"));
      objc_msgSend(v28, "stringFromDate:", v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == 1)
      {
        v27 = (void *)v33;
        objc_msgSend(v9, "willOpenAtDifferentDaySingularWithFormattedTime:formattedDay:", v33, v29);
      }
      else
      {
        v27 = (void *)v33;
        objc_msgSend(v9, "willOpenAtDifferentDayPluralWithFormattedTime:formattedDay:", v33, v29);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)v34;

    }
  }
  else
  {
    v30 = 0;
  }
  return v30;
}

- (NSString)messageTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BCSBusinessItem callToAction](self, "callToAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[BCSBusinessItem callToAction](self, "callToAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CHAT_NOW"), &stru_24C39D888, 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)messageSubtitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (-[BCSBusinessItem isAvailableForMessaging](self, "isAvailableForMessaging"))
  {
    -[BCSBusinessItem callToAction](self, "callToAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subtitle");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BCSBusinessItem dateWhenMessagingAvailableNext](self, "dateWhenMessagingAvailableNext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = 0;
      return (NSString *)v6;
    }
    -[BCSBusinessItem dateWhenMessagingAvailableNext](self, "dateWhenMessagingAvailableNext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSBusinessItem _availableNextStringFromAvailableNextDate:]((uint64_t)self, v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

  return (NSString *)v6;
}

- (BCSBusinessItem)initWithBizID:(id)a3 phoneNumber:(id)a4 name:(id)a5 phoneHash:(int64_t)a6 squareLogoURL:(id)a7 wideLogoURL:(id)a8 tintColor:(unint64_t)a9 backgroundColor:(unint64_t)a10 callToActions:(id)a11 messagingOpenHours:(id)a12 callingOpenHours:(id)a13 isVerified:(BOOL)a14 intentID:(id)a15 groupID:(id)a16 visibilityItems:(id)a17
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BCSBusinessItem *v27;
  void *v28;
  uint64_t v29;
  NSString *bizID;
  uint64_t v31;
  NSString *phoneNumber;
  uint64_t v33;
  NSString *name;
  uint64_t v35;
  NSURL *squareLogoURL;
  uint64_t v37;
  NSURL *wideLogoURL;
  uint64_t v39;
  NSArray *callToActions;
  uint64_t v41;
  BCSOpenHours *messagingOpenHours;
  uint64_t v43;
  BCSOpenHours *callingOpenHours;
  uint64_t v45;
  NSString *intentID;
  uint64_t v47;
  NSString *groupID;
  uint64_t v49;
  NSArray *visibilityItems;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  objc_super v59;

  v58 = a3;
  v57 = a4;
  v56 = a5;
  v55 = a7;
  v54 = a8;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a15;
  v25 = a16;
  v26 = a17;
  v59.receiver = self;
  v59.super_class = (Class)BCSBusinessItem;
  v27 = -[BCSItem init](&v59, sel_init);
  if (v27)
  {
    objc_msgSend(v58, "prefixedBizID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    bizID = v27->_bizID;
    v27->_bizID = (NSString *)v29;

    v31 = objc_msgSend(v57, "copy");
    phoneNumber = v27->_phoneNumber;
    v27->_phoneNumber = (NSString *)v31;

    v33 = objc_msgSend(v56, "copy");
    name = v27->_name;
    v27->_name = (NSString *)v33;

    v27->_phoneHash = a6;
    v35 = objc_msgSend(v55, "copy");
    squareLogoURL = v27->_squareLogoURL;
    v27->_squareLogoURL = (NSURL *)v35;

    v37 = objc_msgSend(v54, "copy");
    wideLogoURL = v27->_wideLogoURL;
    v27->_wideLogoURL = (NSURL *)v37;

    v27->_tintColor = a9;
    v27->_backgroundColor = a10;
    v39 = objc_msgSend(v21, "copy");
    callToActions = v27->_callToActions;
    v27->_callToActions = (NSArray *)v39;

    v41 = objc_msgSend(v22, "copy");
    messagingOpenHours = v27->_messagingOpenHours;
    v27->_messagingOpenHours = (BCSOpenHours *)v41;

    v43 = objc_msgSend(v23, "copy");
    callingOpenHours = v27->_callingOpenHours;
    v27->_callingOpenHours = (BCSOpenHours *)v43;

    v27->_isVerified = a14;
    v45 = objc_msgSend(v24, "copy");
    intentID = v27->_intentID;
    v27->_intentID = (NSString *)v45;

    v47 = objc_msgSend(v25, "copy");
    groupID = v27->_groupID;
    v27->_groupID = (NSString *)v47;

    v49 = objc_msgSend(v26, "copy");
    visibilityItems = v27->_visibilityItems;
    v27->_visibilityItems = (NSArray *)v49;

  }
  return v27;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)BCSBusinessItem;
  -[BCSBusinessItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem bizID](self, "bizID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - bizID:%@ - name:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v30 = (id)MEMORY[0x24BDD17C8];
  -[BCSBusinessItem bizID](self, "bizID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem name](self, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[BCSBusinessItem phoneHash](self, "phoneHash");
  -[BCSBusinessItem squareLogoURL](self, "squareLogoURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "absoluteString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem wideLogoURL](self, "wideLogoURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "absoluteString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%lX"), -[BCSBusinessItem tintColor](self, "tintColor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%lX"), -[BCSBusinessItem backgroundColor](self, "backgroundColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem callToAction](self, "callToAction");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "language");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem callToAction](self, "callToAction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem callToAction](self, "callToAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subtitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem messagingOpenHours](self, "messagingOpenHours");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "debugDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem callingOpenHours](self, "callingOpenHours");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "debugDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BCSBusinessItem isVerified](self, "isVerified");
  -[BCSBusinessItem groupID](self, "groupID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItem intentID](self, "intentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[BCSBusinessItem visibilityItems](self, "visibilityItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v40;
      v7 = &stru_24C39D888;
      do
      {
        v8 = 0;
        v9 = v7;
        do
        {
          if (*(_QWORD *)v40 != v6)
            objc_enumerationMutation(v3);
          v10 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v8), "description");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("Visibility %@\n"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v12);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v8;
          v9 = v7;
        }
        while (v5 != v8);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v5);
    }
    else
    {
      v7 = &stru_24C39D888;
    }

  }
  else
  {
    v7 = 0;
  }
  v13 = CFSTR("NO");
  if (v15)
    v13 = CFSTR("YES");
  objc_msgSend(v30, "stringWithFormat:", CFSTR("ID : \"%@\"\nName : \"%@\"\nBucket ID: %lld\nSquare Logo URL : \"%@\"\nWide Logo URL : \"%@\"\nTint color : %@\nBackground color: %@\nCall to Action (%@) : \"%@\" - \"%@\"\nMessaging Open Hours:\n%@\nCalling Open Hours:\n%@\nVerified : %@\nGroup ID : \"%@\"\nIntent ID : \"%@\"\nConfigured Visibility Items : \n%@\n"), v38, v37, v28, v36, v35, v32, v29, v26, v24, v22, v20, v18, v13, v17, v16, v7);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[BCSBusinessItem bizID](self, "bizID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v7;

    -[BCSBusinessItem phoneNumber](self, "phoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    -[BCSBusinessItem name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v13;

    *(_QWORD *)(v5 + 40) = -[BCSBusinessItem phoneHash](self, "phoneHash");
    -[BCSBusinessItem squareLogoURL](self, "squareLogoURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v16;

    -[BCSBusinessItem wideLogoURL](self, "wideLogoURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copyWithZone:", a3);
    v20 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v19;

    *(_QWORD *)(v5 + 64) = -[BCSBusinessItem tintColor](self, "tintColor");
    *(_QWORD *)(v5 + 72) = -[BCSBusinessItem backgroundColor](self, "backgroundColor");
    -[BCSBusinessItem callToActions](self, "callToActions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v22;

    -[BCSBusinessItem messagingOpenHours](self, "messagingOpenHours");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copyWithZone:", a3);
    v26 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v25;

    -[BCSBusinessItem callingOpenHours](self, "callingOpenHours");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copyWithZone:", a3);
    v29 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v28;

    *(_BYTE *)(v5 + 112) = -[BCSBusinessItem isVerified](self, "isVerified");
    -[BCSBusinessItem intentID](self, "intentID");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = v30;

    -[BCSBusinessItem groupID](self, "groupID");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v32;

    -[BCSBusinessItem visibilityItems](self, "visibilityItems");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "copyWithZone:", a3);
    v36 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v35;

  }
  return (id)v5;
}

- (BOOL)isAvailableForMessaging
{
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[BCSBusinessItem messagingOpenHours](self, "messagingOpenHours");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[BCSBusinessItem messagingOpenHours](self, "messagingOpenHours");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = objc_msgSend(v5, "isOpenAtDate:", v3);

    }
    else
    {
      LOBYTE(self) = 1;
    }
  }

  return (char)self;
}

- (NSDate)dateWhenMessagingAvailableNext
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = v3;
    -[BCSBusinessItem messagingOpenHours](self, "messagingOpenHours");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateWhenOpenNextAfterDate:", v5);
    self = (BCSBusinessItem *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)self;
}

- (BOOL)isAvailableForCalling
{
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[BCSBusinessItem callingOpenHours](self, "callingOpenHours");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[BCSBusinessItem callingOpenHours](self, "callingOpenHours");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = objc_msgSend(v5, "isOpenAtDate:", v3);

    }
    else
    {
      LOBYTE(self) = 1;
    }
  }

  return (char)self;
}

- (NSDate)dateWhenCallingAvailableNext
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = v3;
    -[BCSBusinessItem callingOpenHours](self, "callingOpenHours");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateWhenOpenNextAfterDate:", v5);
    self = (BCSBusinessItem *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)self;
}

- (NSURL)messagesOpenURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BCSBusinessItem bizID](self, "bizID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prefixedBizID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[BCSBusinessItem intentID](self, "intentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[BCSBusinessItem intentID](self, "intentID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSBusinessItem _escapedVersionOfInputString:](v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("&biz-intent-id=%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&stru_24C39D888, "stringByAppendingString:", v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = &stru_24C39D888;
    }
    -[BCSBusinessItem groupID](self, "groupID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      -[BCSBusinessItem groupID](self, "groupID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSBusinessItem _escapedVersionOfInputString:](v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("&biz-group-id=%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v19;
    }
    -[BCSBusinessItem callToAction](self, "callToAction");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "body");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22)
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      -[BCSBusinessItem callToAction](self, "callToAction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "body");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSBusinessItem _escapedVersionOfInputString:](v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("&body=%@"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v28;
    }
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sms://open?service=iMessage&recipient=%@%@"), v5, v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v30;
}

- (id)_escapedVersionOfInputString:(void *)a1
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "alphanumericCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)itemIdentifier
{
  void *v2;
  void *v3;

  -[BCSBusinessItem _businessItemIdentifier](self, "_businessItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)truncatedHash
{
  void *v2;
  int64_t v3;

  -[BCSBusinessItem _businessItemIdentifier](self, "_businessItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "truncatedHash");

  return v3;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[BCSBusinessItem _businessItemIdentifier](self, "_businessItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BCSBusinessItem _businessItemIdentifier](self, "_businessItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "matchesItemIdentifying:", v4);

  return v6;
}

- (BCSBusinessItemIdentifier)_businessItemIdentifier
{
  BCSBusinessItemIdentifier *itemIdentifier;
  BCSBusinessItemIdentifier *v4;
  BCSBusinessItemIdentifier *v5;

  itemIdentifier = self->_itemIdentifier;
  if (!itemIdentifier)
  {
    +[BCSBusinessItemIdentifier identifierWithBusinessItem:]((uint64_t)BCSBusinessItemIdentifier, self);
    v4 = (BCSBusinessItemIdentifier *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemIdentifier;
    self->_itemIdentifier = v4;

    itemIdentifier = self->_itemIdentifier;
  }
  return itemIdentifier;
}

- (id)callToAction
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[NSLocale currentLanguage]();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[BCSBusinessItem callToActions](self, "callToActions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "language");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v3);

          if ((v12 & 1) != 0)
          {
            v14 = v10;

            goto LABEL_16;
          }
          if (objc_msgSend(v10, "isDefault"))
          {
            v13 = v10;

            v7 = v13;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v7 = 0;
    }

    v7 = v7;
    v14 = v7;
LABEL_16:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_isChatSuggestVisibleForVisibilityItem:(id)a3 messagesIdentifier:(id)a4 bizID:(id)a5
{
  id v7;
  void *v8;

  if (!a3)
    return 0;
  v7 = a3;
  objc_msgSend(a4, "stringByAppendingString:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "isVisibleForDSID:", v8);

  return (char)a4;
}

- (id)_selectedVisibilityItemForLanguage:(id)a3 country:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  id v25;
  NSObject *v26;
  const char *v27;
  id obj;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v30 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[BCSBusinessItem visibilityItems](self, "visibilityItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (!v6)
  {
    v25 = 0;
    goto LABEL_26;
  }
  v7 = v6;
  v8 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v33 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v10, "language");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      objc_msgSend(v10, "country");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lowercaseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      objc_msgSend(v10, "language");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("*"));

      objc_msgSend(v10, "country");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("*"));

      v23 = v18 ^ 1;
      if (((v14 ^ 1) & 1) == 0 && (v23 & 1) == 0)
      {
        ABSLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[BCSBusinessItem _selectedVisibilityItemForLanguage:country:]";
          v27 = "%s Selecting visibility item - equal language and country code";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v24 = v22 ^ 1;
      if (((v20 ^ 1) & 1) == 0 && (v24 & 1) == 0)
      {
        ABSLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[BCSBusinessItem _selectedVisibilityItemForLanguage:country:]";
          v27 = "%s Selecting visibility item - language and country code are wildcard";
          goto LABEL_24;
        }
LABEL_25:

        v25 = v10;
        goto LABEL_26;
      }
      if (((v14 ^ 1 | v24) & 1) == 0)
      {
        ABSLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        *(_DWORD *)buf = 136315138;
        v37 = "-[BCSBusinessItem _selectedVisibilityItemForLanguage:country:]";
        v27 = "%s Selecting visibility item - equal language and country code is wildcard";
LABEL_24:
        _os_log_impl(&dword_20ACAD000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
        goto LABEL_25;
      }
      if (((v20 ^ 1 | v23) & 1) == 0)
      {
        ABSLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        *(_DWORD *)buf = 136315138;
        v37 = "-[BCSBusinessItem _selectedVisibilityItemForLanguage:country:]";
        v27 = "%s Selecting visibility item - wildcard language and country code is equal";
        goto LABEL_24;
      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    v25 = 0;
    if (v7)
      continue;
    break;
  }
LABEL_26:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bizID;
  id v5;

  bizID = self->_bizID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bizID, CFSTR("kBCSBusinessItemBizIDCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("kBCSBusinessItemPhoneNumberCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("kBCSBusinessItemNameCodingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_phoneHash, CFSTR("kBCSBusinessItemBucketIDCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_squareLogoURL, CFSTR("kBCSBusinessItemSquareLogoURLCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wideLogoURL, CFSTR("kBCSBusinessItemWideLogoURLCodingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tintColor, CFSTR("kBCSBusinessItemTintColorCodingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_backgroundColor, CFSTR("kBCSBusinessItemBackgroundColorCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callToActions, CFSTR("kBCSBusinessItemCallToActionCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messagingOpenHours, CFSTR("kBCSBusinessItemMessagingOpenHoursCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callingOpenHours, CFSTR("kBCSBusinessItemCallingOpenHoursCodingKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isVerified, CFSTR("kBCSBusinessItemIsVerifiedCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentID, CFSTR("kBCSBusinessItemIntentIDCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupID, CFSTR("kBCSBusinessItemGroupIDCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visibilityItems, CFSTR("visibilityItems"));

}

- (BCSBusinessItem)initWithCoder:(id)a3
{
  id v4;
  BCSBusinessItem *v5;
  uint64_t v6;
  NSString *bizID;
  uint64_t v8;
  NSString *phoneNumber;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSURL *squareLogoURL;
  uint64_t v14;
  NSURL *wideLogoURL;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *callToActions;
  uint64_t v21;
  BCSOpenHours *messagingOpenHours;
  uint64_t v23;
  BCSOpenHours *callingOpenHours;
  uint64_t v25;
  NSString *intentID;
  uint64_t v27;
  NSString *groupID;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *visibilityItems;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BCSBusinessItem;
  v5 = -[BCSItem init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemBizIDCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    bizID = v5->_bizID;
    v5->_bizID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemPhoneNumberCodingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemNameCodingKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    v5->_phoneHash = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kBCSBusinessItemBucketIDCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemSquareLogoURLCodingKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    squareLogoURL = v5->_squareLogoURL;
    v5->_squareLogoURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemWideLogoURLCodingKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    wideLogoURL = v5->_wideLogoURL;
    v5->_wideLogoURL = (NSURL *)v14;

    v5->_tintColor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kBCSBusinessItemTintColorCodingKey"));
    v5->_backgroundColor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kBCSBusinessItemBackgroundColorCodingKey"));
    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kBCSBusinessItemCallToActionCodingKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    callToActions = v5->_callToActions;
    v5->_callToActions = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemMessagingOpenHoursCodingKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    messagingOpenHours = v5->_messagingOpenHours;
    v5->_messagingOpenHours = (BCSOpenHours *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemCallingOpenHoursCodingKey"));
    v23 = objc_claimAutoreleasedReturnValue();
    callingOpenHours = v5->_callingOpenHours;
    v5->_callingOpenHours = (BCSOpenHours *)v23;

    v5->_isVerified = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kBCSBusinessItemIsVerifiedCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemIntentIDCodingKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    intentID = v5->_intentID;
    v5->_intentID = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBCSBusinessItemGroupIDCodingKey"));
    v27 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v27;

    v29 = (void *)MEMORY[0x24BDBCF20];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("visibilityItems"));
    v32 = objc_claimAutoreleasedReturnValue();
    visibilityItems = v5->_visibilityItems;
    v5->_visibilityItems = (NSArray *)v32;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bizID
{
  return self->_bizID;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)phoneHash
{
  return self->_phoneHash;
}

- (NSURL)squareLogoURL
{
  return self->_squareLogoURL;
}

- (NSURL)wideLogoURL
{
  return self->_wideLogoURL;
}

- (unint64_t)tintColor
{
  return self->_tintColor;
}

- (unint64_t)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)callToActions
{
  return self->_callToActions;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (NSString)intentID
{
  return self->_intentID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (BCSOpenHours)messagingOpenHours
{
  return self->_messagingOpenHours;
}

- (BCSOpenHours)callingOpenHours
{
  return self->_callingOpenHours;
}

- (NSArray)visibilityItems
{
  return self->_visibilityItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_intentID, 0);
  objc_storeStrong((id *)&self->_callingOpenHours, 0);
  objc_storeStrong((id *)&self->_messagingOpenHours, 0);
  objc_storeStrong((id *)&self->_visibilityItems, 0);
  objc_storeStrong((id *)&self->_callToActions, 0);
  objc_storeStrong((id *)&self->_wideLogoURL, 0);
  objc_storeStrong((id *)&self->_squareLogoURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_bizID, 0);
}

- (unint64_t)_integerForHexString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  unsigned int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scanHexInt:", &v8);
    v5 = v8;

  }
  else
  {
    ABSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_ERROR, "BCSBusinessItem hex string length <= 0 - %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (BCSBusinessItem)initWithJSONObj:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BCSBusinessItem *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BCSBusinessItem *v24;
  BCSBusinessItem *v25;
  NSObject *v26;
  uint64_t v28;
  BCSOpenHours *v29;
  BCSOpenHours *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", 0x24C39F068);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", 0x24C3A07C8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", 0x24C39F048);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A07E8);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", 0x24C39F048);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A0808);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", 0x24C39F048);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A0828);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", 0x24C39F048);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A0868);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", 0x24C39F048);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A0848);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", 0x24C39F048);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A0768);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", 0x24C39F048);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A0788);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", 0x24C39F048);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C39FAE8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", 0x24C39F048);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A0888);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A08A8);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[BCSBusinessItem _integerForHexString:](self, "_integerForHexString:", v43);
      v37 = -[BCSBusinessItem _integerForHexString:](self, "_integerForHexString:", v42);
      v44 = v4;
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v50);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v49);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v41, "BOOLValue");
      v30 = -[BCSOpenHours initWithJSONObj:timeZone:]([BCSOpenHours alloc], "initWithJSONObj:timeZone:", v40, v47);
      v29 = -[BCSOpenHours initWithJSONObj:timeZone:]([BCSOpenHours alloc], "initWithJSONObj:timeZone:", v39, v47);
      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A0748);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", 0x24C39F048);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C39D8E8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", 0x24C39F048);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C39DB68);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", 0x24C39F048);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v48, "longLongValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", 0x24C3A07A8);
      v20 = self;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", 0x24C39F048);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v28) = v32;
      v23 = v19;
      v4 = v44;
      v24 = -[BCSBusinessItem initWithBizID:phoneNumber:name:phoneHash:squareLogoURL:wideLogoURL:tintColor:backgroundColor:callToActions:messagingOpenHours:callingOpenHours:isVerified:intentID:groupID:visibilityItems:](v20, "initWithBizID:phoneNumber:name:phoneHash:squareLogoURL:wideLogoURL:tintColor:backgroundColor:callToActions:messagingOpenHours:callingOpenHours:isVerified:intentID:groupID:visibilityItems:", v16, v17, v18, v23, v36, v35, v38, v37, v22, v30, v29, v28, v46, v45, MEMORY[0x24BDBD1A8]);

      self = v24;
      v25 = v24;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    ABSLogCommon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20ACAD000, v26, OS_LOG_TYPE_ERROR, "BCSBusinessItem init JSON object is not dictionary", buf, 2u);
    }

    v25 = 0;
  }

  return v25;
}

@end
