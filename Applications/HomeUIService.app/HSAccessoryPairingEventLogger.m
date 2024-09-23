@implementation HSAccessoryPairingEventLogger

+ (id)sharedLogger
{
  if (qword_1000C3568 != -1)
    dispatch_once(&qword_1000C3568, &stru_1000A2B50);
  return (id)qword_1000C3560;
}

- (HSAccessoryPairingEventLogger)init
{
  HSAccessoryPairingEventLogger *v2;
  void *v3;
  id v4;
  _QWORD *v5;
  void *v6;
  NSArray *v7;
  NSArray *accessoryPairingEventLoggerTimeHistogramBins;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  v10.receiver = self;
  v10.super_class = (Class)HSAccessoryPairingEventLogger;
  v2 = -[HSAccessoryPairingEventLogger init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003C9B8;
    v11[3] = &unk_1000A2BD8;
    v12 = v3;
    v4 = v3;
    v5 = objc_retainBlock(v11);
    ((void (*)(_QWORD *, _QWORD, uint64_t, uint64_t))v5[2])(v5, 0, 10, 1);
    ((void (*)(_QWORD *, uint64_t, uint64_t, uint64_t))v5[2])(v5, 10, 300, 10);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 300));
    objc_msgSend(v4, "addObject:", v6);

    v7 = (NSArray *)objc_msgSend(v4, "copy");
    accessoryPairingEventLoggerTimeHistogramBins = v2->_accessoryPairingEventLoggerTimeHistogramBins;
    v2->_accessoryPairingEventLoggerTimeHistogramBins = v7;

  }
  return v2;
}

- (id)bucketizeValueIntoHistogramBin:(double)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  id v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger accessoryPairingEventLoggerTimeHistogramBins](self, "accessoryPairingEventLoggerTimeHistogramBins"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 >= 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger accessoryPairingEventLoggerTimeHistogramBins](self, "accessoryPairingEventLoggerTimeHistogramBins"));
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
LABEL_7:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1000 * (_QWORD)objc_msgSend(v15, "unsignedIntegerValue")));
    }
    else
    {
      v9 = 0;
      while (1)
      {
        v10 = v9 + 1;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9 + 1));
        v12 = (double)(unint64_t)objc_msgSend(v11, "unsignedIntegerValue");

        if (v12 > a3)
          break;
        v13 = objc_msgSend(v8, "count");
        v14 = v9 + 2;
        ++v9;
        if (v14 >= (unint64_t)v13)
          goto LABEL_7;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
      v16 = objc_msgSend(v15, "unsignedIntegerValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v10));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)(1000 * ((uint64_t)v16 + (_QWORD)objc_msgSend(v17, "unsignedIntegerValue"))) >> 1));

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)logHUISUserType:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[HSAccessoryPairingEventLogger setHuisUserType:](self, "setHuisUserType:", v4);

}

- (void)logLaunchedToSetupASpecificAccessory:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[HSAccessoryPairingEventLogger setIsLaunchedToSetupASpecificAccessory:](self, "setIsLaunchedToSetupASpecificAccessory:", v4);

}

- (void)logIsUsingCHIPCommunicationProtocol:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[HSAccessoryPairingEventLogger setIsUsingCHIPCommunicationProtocol:](self, "setIsUsingCHIPCommunicationProtocol:", v4);

}

- (void)logCodeInputMethod:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[HSAccessoryPairingEventLogger setCodeInputMethod:](self, "setCodeInputMethod:", v4);

}

- (void)logHUISLaunchWithReason:(int64_t)a3 accessoryDescription:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v12 = v6;
  if (a3)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v6, "hf_isLaunchedByHomeApp"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "setupAccessoryPayload"));

    if (v8)
      v7 = 3;
    else
      v7 = 2;
  }
  else if (objc_msgSend(v12, "hf_isLaunchedByHomeDaemon"))
  {
    v7 = 1;
  }
  else
  {
    v7 = 100;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[HSAccessoryPairingEventLogger setHuisLaunchReason:](self, "setHuisLaunchReason:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  -[HSAccessoryPairingEventLogger setHuisLaunchType:](self, "setHuisLaunchType:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[HSAccessoryPairingEventLogger setHuisLaunchDate:](self, "setHuisLaunchDate:", v11);

}

- (unint64_t)launchType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisLaunchType](self, "huisLaunchType"));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (BOOL)isHUISLaunchedByFirstParty
{
  return (char *)-[HSAccessoryPairingEventLogger launchType](self, "launchType") - 1 < (char *)3;
}

- (BOOL)isHUISLaunchedByThirdParty
{
  return (id)-[HSAccessoryPairingEventLogger launchType](self, "launchType") == (id)100;
}

- (void)logHUISDismiss
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisDismissDate](self, "huisDismissDate"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[HSAccessoryPairingEventLogger setHuisDismissDate:](self, "setHuisDismissDate:", v4);

    -[HSAccessoryPairingEventLogger _sendEvent](self, "_sendEvent");
  }
}

- (void)logPairingBegin
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[HSAccessoryPairingEventLogger setPairingBeginDate:](self, "setPairingBeginDate:", v3);

}

- (void)logPairingComplete
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[HSAccessoryPairingEventLogger setPairingCompleteDate:](self, "setPairingCompleteDate:", v3);

}

- (void)logNumberOfPairedAccessories:(unint64_t)a3
{
  id v5;

  -[HSAccessoryPairingEventLogger setPairingSuccess:](self, "setPairingSuccess:", a3 != 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[HSAccessoryPairingEventLogger setNumPairedAccessories:](self, "setNumPairedAccessories:", v5);

}

- (void)logExitStep:(int64_t)a3
{
  id v5;

  -[HSAccessoryPairingEventLogger logStepStart:](self, "logStepStart:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", a3));
  -[HSAccessoryPairingEventLogger setExitCardString:](self, "setExitCardString:", v5);

}

- (void)logTransportFlagsFromPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "supportsIP")));
    -[HSAccessoryPairingEventLogger setSupportsIP:](self, "setSupportsIP:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "supportsWAC")));
    -[HSAccessoryPairingEventLogger setSupportsWAC:](self, "setSupportsWAC:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "supportsBTLE")));
    -[HSAccessoryPairingEventLogger setSupportsBTLE:](self, "setSupportsBTLE:", v7);

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "threadIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9 != 0));
    -[HSAccessoryPairingEventLogger setSupportsThread:](self, "setSupportsThread:", v8);

  }
}

- (void)logAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  -[HSAccessoryPairingEventLogger setAccessoryName:](self, "setAccessoryName:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manufacturer"));
  -[HSAccessoryPairingEventLogger setAccessoryManufacturer:](self, "setAccessoryManufacturer:", v6);

}

- (void)logStepStart:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (-[HSAccessoryPairingEventLogger currentStep](self, "currentStep") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    if (-[HSAccessoryPairingEventLogger currentStep](self, "currentStep"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger currentStepStartTime](self, "currentStepStartTime"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger cardTime](self, "cardTime"));

        if (!v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          -[HSAccessoryPairingEventLogger setCardTime:](self, "setCardTime:", v8);

        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", -[HSAccessoryPairingEventLogger currentStep](self, "currentStep")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger currentStepStartTime](self, "currentStepStartTime"));
        objc_msgSend(v5, "timeIntervalSinceDate:", v10);
        v12 = v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger cardTime](self, "cardTime"));
        v16 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger bucketizeValueIntoHistogramBin:](self, "bucketizeValueIntoHistogramBin:", v12));
        v17 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
        objc_msgSend(v13, "na_safeAddObject:", v15);

      }
    }
    -[HSAccessoryPairingEventLogger setCurrentStep:](self, "setCurrentStep:", a3);
    -[HSAccessoryPairingEventLogger setCurrentStepStartTime:](self, "setCurrentStepStartTime:", v5);

  }
}

- (void)logCardCount:(unint64_t)a3
{
  -[HSAccessoryPairingEventLogger setNumCards:](self, "setNumCards:", a3);
}

- (void)_sendEvent
{
  void *v3;
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
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger cardTime](self, "cardTime"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisDismissDate](self, "huisDismissDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisLaunchDate](self, "huisLaunchDate"));
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger bucketizeValueIntoHistogramBin:](self, "bucketizeValueIntoHistogramBin:"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, HFAnalyticsDataHUISSessionTimeKey);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisLaunchReason](self, "huisLaunchReason"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, HFAnalyticsDataHUISLaunchReasonKey);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisLaunchType](self, "huisLaunchType"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, HFAnalyticsDataHUISLaunchTypeKey);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisUserType](self, "huisUserType"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, HFAnalyticsDataHUISUserTypeKey);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger exitCardString](self, "exitCardString"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, HFAnalyticsDataHUISExitCardKey);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger cardTime](self, "cardTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "na_flatMap:", &stru_1000A2B90));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, HFAnalyticsDataCardNameKey);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger cardTime](self, "cardTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "na_flatMap:", &stru_1000A2BB0));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, HFAnalyticsDataCardTimeKey);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[HSAccessoryPairingEventLogger numCards](self, "numCards")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, HFAnalyticsDataCardCountKey);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisLaunchReason](self, "huisLaunchReason"));
    if (!v18)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger isLaunchedToSetupASpecificAccessory](self, "isLaunchedToSetupASpecificAccessory"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, HFAnalyticsDataHUISIsLaunchedToSetupASpecificAccessory);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger isUsingCHIPCommunicationProtocol](self, "isUsingCHIPCommunicationProtocol"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, HFAnalyticsDataHUISIsUsingCHIPCommunicationProtocol);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger codeInputMethod](self, "codeInputMethod"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, HFAnalyticsDataHUISCodeInputMethod);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger supportsIP](self, "supportsIP"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, HFAnalyticsDataAccessoryTransportIPKey);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger supportsWAC](self, "supportsWAC"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, HFAnalyticsDataAccessoryTransportWACKey);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger supportsBTLE](self, "supportsBTLE"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, HFAnalyticsDataAccessoryTransportBTLEKey);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger supportsThread](self, "supportsThread"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, HFAnalyticsDataAccessoryTransportThreadKey);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger pairingBeginDate](self, "pairingBeginDate"));
      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[HSAccessoryPairingEventLogger pairingSuccess](self, "pairingSuccess")));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, HFAnalyticsDataSuccessKey);

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger pairingBeginDate](self, "pairingBeginDate"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger huisLaunchDate](self, "huisLaunchDate"));
        objc_msgSend(v31, "timeIntervalSinceDate:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger bucketizeValueIntoHistogramBin:](self, "bucketizeValueIntoHistogramBin:"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, HFAnalyticsDataPrePairingTimeKey);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger numPairedAccessories](self, "numPairedAccessories"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, HFAnalyticsDataNumPairedAccessoriesKey);

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger pairingCompleteDate](self, "pairingCompleteDate"));
        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger pairingCompleteDate](self, "pairingCompleteDate"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger pairingBeginDate](self, "pairingBeginDate"));
          objc_msgSend(v36, "timeIntervalSinceDate:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryPairingEventLogger bucketizeValueIntoHistogramBin:](self, "bucketizeValueIntoHistogramBin:"));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, HFAnalyticsDataPairingTimeKey);

        }
      }
    }
    AnalyticsSendEvent(CFSTR("com.apple.Home.AccessoryPairing"), v5);
    v20 = HFLogForCategory(6, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138412546;
      v40 = CFSTR("com.apple.Home.AccessoryPairing");
      v41 = 2112;
      v42 = v5;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Event:%@ payload:%@", (uint8_t *)&v39, 0x16u);
    }

  }
}

- (NSDate)huisLaunchDate
{
  return self->_huisLaunchDate;
}

- (void)setHuisLaunchDate:(id)a3
{
  objc_storeStrong((id *)&self->_huisLaunchDate, a3);
}

- (NSDate)huisDismissDate
{
  return self->_huisDismissDate;
}

- (void)setHuisDismissDate:(id)a3
{
  objc_storeStrong((id *)&self->_huisDismissDate, a3);
}

- (NSNumber)isLaunchedToSetupASpecificAccessory
{
  return self->_isLaunchedToSetupASpecificAccessory;
}

- (void)setIsLaunchedToSetupASpecificAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_isLaunchedToSetupASpecificAccessory, a3);
}

- (NSNumber)isUsingCHIPCommunicationProtocol
{
  return self->_isUsingCHIPCommunicationProtocol;
}

- (void)setIsUsingCHIPCommunicationProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_isUsingCHIPCommunicationProtocol, a3);
}

- (NSNumber)codeInputMethod
{
  return self->_codeInputMethod;
}

- (void)setCodeInputMethod:(id)a3
{
  objc_storeStrong((id *)&self->_codeInputMethod, a3);
}

- (NSNumber)huisLaunchReason
{
  return self->_huisLaunchReason;
}

- (void)setHuisLaunchReason:(id)a3
{
  objc_storeStrong((id *)&self->_huisLaunchReason, a3);
}

- (NSNumber)huisLaunchType
{
  return self->_huisLaunchType;
}

- (void)setHuisLaunchType:(id)a3
{
  objc_storeStrong((id *)&self->_huisLaunchType, a3);
}

- (NSNumber)huisUserType
{
  return self->_huisUserType;
}

- (void)setHuisUserType:(id)a3
{
  objc_storeStrong((id *)&self->_huisUserType, a3);
}

- (NSDate)pairingBeginDate
{
  return self->_pairingBeginDate;
}

- (void)setPairingBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_pairingBeginDate, a3);
}

- (NSDate)pairingCompleteDate
{
  return self->_pairingCompleteDate;
}

- (void)setPairingCompleteDate:(id)a3
{
  objc_storeStrong((id *)&self->_pairingCompleteDate, a3);
}

- (BOOL)pairingSuccess
{
  return self->_pairingSuccess;
}

- (void)setPairingSuccess:(BOOL)a3
{
  self->_pairingSuccess = a3;
}

- (NSNumber)numPairedAccessories
{
  return self->_numPairedAccessories;
}

- (void)setNumPairedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_numPairedAccessories, a3);
}

- (NSString)exitCardString
{
  return self->_exitCardString;
}

- (void)setExitCardString:(id)a3
{
  objc_storeStrong((id *)&self->_exitCardString, a3);
}

- (NSNumber)supportsIP
{
  return self->_supportsIP;
}

- (void)setSupportsIP:(id)a3
{
  objc_storeStrong((id *)&self->_supportsIP, a3);
}

- (NSNumber)supportsWAC
{
  return self->_supportsWAC;
}

- (void)setSupportsWAC:(id)a3
{
  objc_storeStrong((id *)&self->_supportsWAC, a3);
}

- (NSNumber)supportsBTLE
{
  return self->_supportsBTLE;
}

- (void)setSupportsBTLE:(id)a3
{
  objc_storeStrong((id *)&self->_supportsBTLE, a3);
}

- (NSNumber)supportsThread
{
  return self->_supportsThread;
}

- (void)setSupportsThread:(id)a3
{
  objc_storeStrong((id *)&self->_supportsThread, a3);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryName, a3);
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (void)setAccessoryManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryManufacturer, a3);
}

- (NSMutableArray)cardTime
{
  return self->_cardTime;
}

- (void)setCardTime:(id)a3
{
  objc_storeStrong((id *)&self->_cardTime, a3);
}

- (int64_t)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(int64_t)a3
{
  self->_currentStep = a3;
}

- (NSDate)currentStepStartTime
{
  return self->_currentStepStartTime;
}

- (void)setCurrentStepStartTime:(id)a3
{
  self->_currentStepStartTime = (NSDate *)a3;
}

- (unint64_t)numCards
{
  return self->_numCards;
}

- (void)setNumCards:(unint64_t)a3
{
  self->_numCards = a3;
}

- (NSArray)accessoryPairingEventLoggerTimeHistogramBins
{
  return self->_accessoryPairingEventLoggerTimeHistogramBins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryPairingEventLoggerTimeHistogramBins, 0);
  objc_storeStrong((id *)&self->_cardTime, 0);
  objc_storeStrong((id *)&self->_accessoryManufacturer, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_supportsThread, 0);
  objc_storeStrong((id *)&self->_supportsBTLE, 0);
  objc_storeStrong((id *)&self->_supportsWAC, 0);
  objc_storeStrong((id *)&self->_supportsIP, 0);
  objc_storeStrong((id *)&self->_exitCardString, 0);
  objc_storeStrong((id *)&self->_numPairedAccessories, 0);
  objc_storeStrong((id *)&self->_pairingCompleteDate, 0);
  objc_storeStrong((id *)&self->_pairingBeginDate, 0);
  objc_storeStrong((id *)&self->_huisUserType, 0);
  objc_storeStrong((id *)&self->_huisLaunchType, 0);
  objc_storeStrong((id *)&self->_huisLaunchReason, 0);
  objc_storeStrong((id *)&self->_codeInputMethod, 0);
  objc_storeStrong((id *)&self->_isUsingCHIPCommunicationProtocol, 0);
  objc_storeStrong((id *)&self->_isLaunchedToSetupASpecificAccessory, 0);
  objc_storeStrong((id *)&self->_huisDismissDate, 0);
  objc_storeStrong((id *)&self->_huisLaunchDate, 0);
}

@end
