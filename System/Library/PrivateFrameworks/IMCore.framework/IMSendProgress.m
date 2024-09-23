@implementation IMSendProgress

- (unint64_t)_sGetNumberOfDataGrams:(unint64_t)a3
{
  if (!a3)
    return 0;
  if (a3 >= 0xD)
    return (unint64_t)(ceil((double)(a3 - 11) / 17.0) + 1.0);
  return 1;
}

- (unint64_t)_sGetEstimatedNumberOfRetries:(unint64_t)a3
{
  double v3;

  if (!a3)
    return 0;
  v3 = ((double)a3 + -1.0) / 0.7 + 2.04081633 - (double)a3;
  if (v3 < 0.0)
    v3 = 0.0;
  return vcvtpd_u64_f64(v3);
}

- (double)_getEstimatedSendTimeOverStewieInSeconds
{
  void *v3;
  unint64_t v4;
  double v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[IMSendProgress sendingItems](self, "sendingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A20F2F5C;
  v7[3] = &unk_1E47220E0;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  v4 = -[IMSendProgress _sGetNumberOfDataGrams:](self, "_sGetNumberOfDataGrams:", *((int *)v9 + 6));
  v5 = ceil(((double)(2 * -[IMSendProgress _sGetEstimatedNumberOfRetries:](self, "_sGetEstimatedNumberOfRetries:", v4))+ (double)v4 * 2.0)* 2.56)+ 2.56;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_sendProgressTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)IMSendProgress;
  -[IMSendProgress dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return -[NSDictionary description](self->_sendingItems, "description");
}

- (IMSendProgress)initWithDelegate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  IMSendProgress *v8;
  IMSendProgress *v9;
  IMSendProgressTimeDataSource *v10;
  IMSendProgressTimeDataSource *timeDataSource;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMSendProgress;
  v8 = -[IMSendProgress init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak(&v9->_context, v7);
    v10 = (IMSendProgressTimeDataSource *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_timeDataSourceClass"));
    timeDataSource = v9->_timeDataSource;
    v9->_timeDataSource = v10;

  }
  return v9;
}

- (void)updateForItems:(id)a3 forced:(BOOL)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  void *v12;
  int v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSDictionary *v26;
  IMSendProgress *v27;
  NSObject *v28;
  id WeakRetained;
  id v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  _BOOL4 v35;
  _BOOL4 v36;
  IMSendProgress *v37;
  void *v38;
  NSDictionary *v39;
  id obj;
  _QWORD v41[4];
  NSDictionary *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[4];
  id v49;
  __int128 *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  IMSendProgress *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  _BOOL4 v70;
  __int16 v71;
  _BOOL4 v72;
  uint64_t v73;

  v36 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = self;
  v39 = self->_sendingItems;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, buf, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v52;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = objc_msgSend(v10, "isTypingOrCancelTypingMessage") ^ 1;
        else
          v11 = 0;
        +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isSatelliteConnectionActive");

        if (((v13 | v11 ^ 1) & 1) == 0)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            goto LABEL_28;
LABEL_13:
          objc_msgSend(v10, "guid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_senderHandle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "service");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v10;
          -[NSDictionary objectForKey:](v39, "objectForKey:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "isFromMe") && !objc_msgSend(v18, "errorCode"))
            v20 = objc_msgSend(v18, "isSent") ^ 1;
          else
            LOBYTE(v20) = 0;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v19)
              v22 = 1;
            else
              v22 = v20;
            if ((v22 & 1) == 0)
              objc_msgSend(v18, "isLocatingMessage");
            goto LABEL_27;
          }
          v21 = objc_msgSend(v17, "isDiscontinued");
          if (v20 & 1 | (v19 != 0))
          {
            if ((v21 & 1) != 0)
              goto LABEL_27;
LABEL_26:
            objc_msgSend(v38, "setObject:forKey:", v18, v15);
          }
          else if (((objc_msgSend(v18, "isLocatingMessage") ^ 1 | v21) & 1) == 0)
          {
            goto LABEL_26;
          }
LABEL_27:

          goto LABEL_28;
        }

        if ((v13 & v11) != 0)
          goto LABEL_13;
LABEL_28:
        ++v9;
      }
      while (v7 != v9);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, buf, 16);
      v7 = v23;
    }
    while (v23);
  }

  *(_QWORD *)&v51 = 0;
  *((_QWORD *)&v51 + 1) = &v51;
  *(_QWORD *)&v52 = 0x2020000000;
  BYTE8(v52) = 0;
  v24 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = sub_1A214A348;
  v48[3] = &unk_1E47230A8;
  v25 = v38;
  v49 = v25;
  v50 = &v51;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v39, "enumerateKeysAndObjectsUsingBlock:", v48);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v41[0] = v24;
  v41[1] = 3221225472;
  v41[2] = sub_1A214A3A0;
  v41[3] = &unk_1E47230A8;
  v26 = v39;
  v42 = v26;
  v43 = &v44;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v41);
  v27 = self;
  if (*((_BYTE *)v45 + 24))
    goto LABEL_33;
  if (*(_BYTE *)(*((_QWORD *)&v51 + 1) + 24))
  {
    if (self->_cachedSendProgress <= 0.0 || objc_msgSend(v25, "count"))
    {
LABEL_33:
      self->_cachedSendProgress = 0.0;
      goto LABEL_34;
    }
    self->_cachedSendProgress = 1.0;
  }
LABEL_34:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v30 = objc_loadWeakRetained(&self->_context);
      -[NSDictionary allKeys](self->_sendingItems, "allKeys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(unsigned __int8 *)(*((_QWORD *)&v51 + 1) + 24);
      v34 = *((unsigned __int8 *)v45 + 24);
      v35 = -[IMSendProgress _hasSendingMessages](v37, "_hasSendingMessages");
      *(_DWORD *)buf = 134220034;
      v56 = v37;
      v57 = 2048;
      v58 = WeakRetained;
      v59 = 2048;
      v60 = v30;
      v61 = 2112;
      v62 = v31;
      v63 = 2112;
      v64 = v32;
      v65 = 1024;
      v66 = v33;
      v67 = 1024;
      v68 = v34;
      v69 = 1024;
      v70 = v36;
      v71 = 1024;
      v72 = v35;
      _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "IMSendProgress: %p (delegate: %p, context: %p) is updating sending items from %@ to %@. (removed? %d, inserted? %d, forced? %d, hasSendingMessages? %d)", buf, 0x4Cu);

    }
    v27 = v37;
  }
  -[IMSendProgress setSendingItems:](v27, "setSendingItems:", v25);
  -[IMSendProgress _scheduleSendProgressTimerIfNeeded](v27, "_scheduleSendProgressTimerIfNeeded");
  if (*(_BYTE *)(*((_QWORD *)&v51 + 1) + 24)
    || *((_BYTE *)v45 + 24)
    || -[IMSendProgress _hasSendingMessages](v27, "_hasSendingMessages")
    || v36)
  {
    -[IMSendProgress _updateSendProgress](v27, "_updateSendProgress");
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v51, 8);

}

- (void)invalidate
{
  NSTimer *sendProgressTimer;

  -[NSTimer invalidate](self->_sendProgressTimer, "invalidate");
  sendProgressTimer = self->_sendProgressTimer;
  self->_sendProgressTimer = 0;

}

- (BOOL)_hasSendingMessages
{
  return -[NSDictionary count](self->_sendingItems, "count") != 0;
}

- (void)_resetSendProgress
{
  self->_cachedSendProgress = 0.0;
  self->_wasShowing = 0;
  -[IMSendProgress setSendingItems:](self, "setSendingItems:", 0);
}

- (void)_updateSendProgress
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  double v8;
  float v9;
  NSDictionary *sendingItems;
  void *v11;
  NSDictionary *v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  char v20;
  float cachedSendProgress;
  _BOOL8 v22;
  id WeakRetained;
  double v24;
  NSObject *v25;
  id v26;
  id v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE buf[24];
  void *v56;
  _BYTE v57[24];
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = 0;
  -[IMSendProgress timeDataSource](self, "timeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v28 = v5;
  +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSatelliteConnectionActive");

  if (v7)
  {
    -[IMSendProgress _getEstimatedSendTimeOverStewieInSeconds](self, "_getEstimatedSendTimeOverStewieInSeconds");
    v9 = IMSendProgressProgressForSatellite(self->_sendingItems, &v30, &v29, &v28, v8);
  }
  else
  {
    sendingItems = self->_sendingItems;
    -[IMSendProgress timeDataSource](self, "timeDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = sendingItems;
    v13 = v11;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v35 = 0;
    v36 = (float *)&v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0;
    v32 = (double *)&v31;
    v33 = 0x2020000000;
    v34 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_1A214AB04;
    v56 = &unk_1E47230D0;
    *(_QWORD *)&v57[8] = &v31;
    *(_QWORD *)&v57[16] = &v51;
    v58 = &v47;
    v59 = &v43;
    v14 = v13;
    *(_QWORD *)v57 = v14;
    v60 = &v35;
    v61 = &v39;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", buf);
    v15 = v48[3] + v52[3];
    v16 = v40[3] + v44[3];
    v17 = v16 + v15;
    if (v16)
    {
      v9 = (float)((float)(v36[6] / (float)v16) + (float)v15) / (float)v17;
    }
    else
    {
      if (v17)
        v9 = 1.0;
      else
        v9 = 0.0;
      v17 = 0;
    }
    if (v17 >= v15 + 1)
      v18 = v15 + 1;
    else
      v18 = v17;
    v29 = v17;
    v30 = v18;
    if (v32[3] > 0.0)
      v28 = v32[3];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);

  }
  v19 = -[IMSendProgress startSendProgressImmediately](self, "startSendProgressImmediately");
  v20 = v5 - v28 > 5.0 || v19;
  cachedSendProgress = self->_cachedSendProgress;
  if (v9 > cachedSendProgress)
    cachedSendProgress = v9;
  self->_cachedSendProgress = cachedSendProgress;
  if ((v20 & 1) == 0)
  {
    if (cachedSendProgress != 1.0)
      return;
    if (!self->_wasShowing)
      goto LABEL_31;
  }
  v22 = cachedSendProgress == 1.0;
  self->_wasShowing = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&v24 = self->_cachedSendProgress;
  objc_msgSend(WeakRetained, "sendProgress:progressDidChange:sendingMessages:sendCount:totalCount:finished:", self, self->_sendingItems, v30, v29, v22, v24);

  if (v22)
  {
LABEL_31:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_loadWeakRetained((id *)&self->_delegate);
        v27 = objc_loadWeakRetained(&self->_context);
        *(_DWORD *)buf = 134219008;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 2048;
        v56 = v27;
        *(_WORD *)v57 = 2048;
        *(_QWORD *)&v57[2] = v30;
        *(_WORD *)&v57[10] = 2048;
        *(_QWORD *)&v57[12] = v29;
        _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "IMSendProgress: %p (delegate: %p, context: %p) finished! (sendCount = %tu, totalCount = %tu)", buf, 0x34u);

      }
    }
    -[IMSendProgress _resetSendProgress](self, "_resetSendProgress");
  }
}

- (void)_scheduleSendProgressTimerIfNeeded
{
  id WeakRetained;
  void *v4;
  _BOOL4 v5;
  NSTimer *v6;
  NSTimer *sendProgressTimer;
  id v8;

  if (!self->_sendProgressTimer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v4 = WeakRetained;
      v5 = -[IMSendProgress _hasSendingMessages](self, "_hasSendingMessages");

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__sendProgressTimerFired_, 0, 1, 0.0166666667);
        v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        sendProgressTimer = self->_sendProgressTimer;
        self->_sendProgressTimer = v6;

        -[NSTimer setTolerance:](self->_sendProgressTimer, "setTolerance:", 0.0333333333);
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addTimer:forMode:", self->_sendProgressTimer, *MEMORY[0x1E0C99860]);

      }
    }
  }
}

- (void)_sendProgressTimerFired:(id)a3
{
  NSTimer *sendProgressTimer;

  if (-[IMSendProgress _hasSendingMessages](self, "_hasSendingMessages", a3))
  {
    -[IMSendProgress _updateSendProgress](self, "_updateSendProgress");
  }
  else
  {
    -[NSTimer invalidate](self->_sendProgressTimer, "invalidate");
    sendProgressTimer = self->_sendProgressTimer;
    self->_sendProgressTimer = 0;

  }
}

+ (Class)_timeDataSourceClass
{
  return (Class)objc_opt_class();
}

- (IMSendProgressDelegate)delegate
{
  return (IMSendProgressDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)context
{
  return objc_loadWeakRetained(&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak(&self->_context, a3);
}

- (NSDictionary)sendingItems
{
  return self->_sendingItems;
}

- (void)setSendingItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)startSendProgressImmediately
{
  return self->_startSendProgressImmediately;
}

- (void)setStartSendProgressImmediately:(BOOL)a3
{
  self->_startSendProgressImmediately = a3;
}

- (IMSendProgressTimeDataSource)timeDataSource
{
  return self->_timeDataSource;
}

- (void)setTimeDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_timeDataSource, a3);
}

- (NSTimer)sendProgressTimer
{
  return self->_sendProgressTimer;
}

- (void)setSendProgressTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sendProgressTimer, a3);
}

- (float)cachedSendProgress
{
  return self->_cachedSendProgress;
}

- (void)setCachedSendProgress:(float)a3
{
  self->_cachedSendProgress = a3;
}

- (BOOL)wasShowing
{
  return self->_wasShowing;
}

- (void)setWasShowing:(BOOL)a3
{
  self->_wasShowing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendProgressTimer, 0);
  objc_storeStrong((id *)&self->_timeDataSource, 0);
  objc_storeStrong((id *)&self->_sendingItems, 0);
  objc_destroyWeak(&self->_context);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
