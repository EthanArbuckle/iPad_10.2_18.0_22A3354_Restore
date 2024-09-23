@implementation APRKPlayerItem

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_UUIDString);
}

+ (id)UUIDFromItemDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDC1040]);
}

- (APRKPlayerItem)initWithDictionary:(id)a3 resourceLoaderHelper:(id)a4 contentKeyHelper:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  APRKPlayerItem *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  APRKPlayerItem *v37;
  APRKPlayerItem *v38;
  const __CFDictionary *v39;
  const __CFDictionary *v40;
  void *v41;
  const __CFDictionary *v42;
  __int128 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  objc_super v58;
  CMTime v59;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC1040]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      memset(&v59, 0, sizeof(v59));
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC1000]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v18, *MEMORY[0x24BDB21E0]);

      objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC0FE0]);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v15, "setObject:forKey:", v19, *MEMORY[0x24BDB21B0]);
      v54 = (void *)v19;
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC0FC0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD16E0];
      v53 = v20;
      if (v20)
        v22 = objc_msgSend(v20, "BOOLValue");
      else
        v22 = 0;
      objc_msgSend(v21, "numberWithBool:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v24, *MEMORY[0x24BDB2198]);

      if (v13)
        objc_msgSend(v15, "addEntriesFromDictionary:", v13);
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC0FB8]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[APRKReachability reachabilityForInternetConnection](APRKReachability, "reachabilityForInternetConnection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "currentReachabilityStatus");

      if ((v25 && v27
         || (objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC0FA0]),
             v28 = objc_claimAutoreleasedReturnValue(),
             v25,
             (v25 = (void *)v28) != 0))
        && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v25), (v29 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v30 = (void *)v29;
        v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDB26C8]), "initWithURL:options:", v29, v15);
        v50 = v30;
        v51 = v11;
        v52 = (void *)v31;
        if (v31)
        {
          v32 = (void *)v31;
          objc_msgSend(v11, "registerAVURLAsset:", v31);
          objc_msgSend(v12, "registerAVURLAsset:", v32);
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC0F70]);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            v34 = objc_msgSend(v33, "longValue");
            objc_msgSend(v32, "resourceLoader");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setAllowedCommonMediaClientDataKeys:", v34);

            if (gLogCategory_AirPlayReceiverKit <= 30
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              v49 = objc_msgSend(v33, "longValue");
              LogPrintF();
            }
            v30 = v50;
          }
        }
        else
        {
          objc_msgSend(v12, "registerAVURLAsset:", 0);
          v33 = v25;
        }
        v58.receiver = self;
        v58.super_class = (Class)APRKPlayerItem;
        v37 = -[APRKPlayerItem initWithAsset:](&v58, sel_initWithAsset_, v52, v49);
        v38 = v37;
        if (v37)
        {
          -[APRKPlayerItem setUUIDString:](v37, "setUUIDString:", v14);
          objc_storeStrong((id *)&v38->_contentLocation, v30);
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC10F0]);
          v39 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            CMTimeMakeFromDictionary(&v59, v39);
            v57 = v59;
            -[APRKPlayerItem setForwardPlaybackEndTime:](v38, "setForwardPlaybackEndTime:", &v57);
          }
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC1120]);
          v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            CMTimeMakeFromDictionary(&v56, v40);
            v59 = v56;
            v55 = v56;
            -[APRKPlayerItem setReversePlaybackEndTime:](v38, "setReversePlaybackEndTime:", &v55);
          }
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC1018]);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            objc_storeStrong((id *)&v38->_startDate, v41);
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC1020]);
          v42 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            CMTimeMakeFromDictionary(&v56, v42);
            v43 = *(_OWORD *)&v56.value;
            v38->_startPosition.epoch = v56.epoch;
            *(_OWORD *)&v38->_startPosition.value = v43;
          }
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC0E18]);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
            v38->_expectsSecureStop = objc_msgSend(v44, "BOOLValue");
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC10C8]);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
            v38->_isAudioOnly = objc_msgSend(v45, "BOOLValue");
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC10C0]);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v38->_actionAtItemEnd = (int64_t)v46;
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC1130]);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
            -[APRKPlayerItem setTextStyleRulesUsingArray:](v38, "setTextStyleRulesUsingArray:", v47);
          objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC0FE8]);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            -[APRKPlayerItem setRestrictions:](v38, "setRestrictions:", objc_msgSend(v33, "integerValue"));
          v30 = v50;
        }
        self = v38;

        v25 = v33;
        v23 = self;
        v36 = v53;
        v11 = v51;
      }
      else
      {
        if (gLogCategory_AirPlayReceiverKit <= 90
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v23 = 0;
        v36 = v53;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)outOfBandAlternateTracks
{
  return self->_outOfBandAlternateTracks;
}

- (id)playbackAccessLog
{
  void *v2;
  void *v3;

  -[APRKPlayerItem accessLog](self, "accessLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessLogArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)playbackErrorLog
{
  void *v2;
  void *v3;

  -[APRKPlayerItem errorLog](self, "errorLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_errorLogArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)UUIDOnlyDictionaryRepresentation
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setValue:forKey:", self->_UUIDString, *MEMORY[0x24BDC1040]);
  return v3;
}

- (void)setTextStyleRulesUsingArray:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  APRKPlayerItem *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v14 = self;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDB26B0], "textStyleRuleWithTextMarkupAttributes:", v11, v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v5, "addObject:", v12);
            if (gLogCategory_AirPlayReceiverKit <= 10
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v12, "debugDescription");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF();

            }
          }
          else if (gLogCategory_AirPlayReceiverKit <= 60
                 && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            v13 = v11;
            LogPrintF();
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      -[APRKPlayerItem setTextStyleRules:](v14, "setTextStyleRules:", v5);

  }
}

- (BOOL)enabledStateForTrackWithID:(int)a3
{
  uint64_t v3;
  void *v5;
  dispatch_semaphore_t v6;
  dispatch_time_t v7;
  void *v8;
  NSObject *v9;
  char v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = *(_QWORD *)&a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[APRKPlayerItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    v7 = dispatch_time(0, 60000000000);
    -[APRKPlayerItem asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __45__APRKPlayerItem_enabledStateForTrackWithID___block_invoke;
    v12[3] = &unk_24FA1C2F8;
    v14 = &v15;
    v9 = v6;
    v13 = v9;
    objc_msgSend(v8, "loadTrackWithTrackID:completionHandler:", v3, v12);

    if (dispatch_semaphore_wait(v9, v7)
      && gLogCategory_AirPlayReceiverKit <= 60
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  v10 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v10;
}

intptr_t __45__APRKPlayerItem_enabledStateForTrackWithID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "isEnabled");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setEnabledState:(BOOL)a3 forTrackWithID:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  -[APRKPlayerItem asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[APRKPlayerItem asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackWithTrackID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[APRKPlayerItem tracks](self, "tracks");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v15, "assetTrack", (_QWORD)v18);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqual:", v9);

            if (v17)
            {
              objc_msgSend(v15, "setEnabled:", v5);
              goto LABEL_13;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }
}

- (id)selectedMediaArray
{
  void *v2;
  void *v3;

  -[APRKPlayerItem currentMediaSelection](self, "currentMediaSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)naturalSize
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[APRKPlayerItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "naturalSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)actionAtItemEnd
{
  return self->_actionAtItemEnd;
}

- (void)setActionAtItemEnd:(int64_t)a3
{
  self->_actionAtItemEnd = a3;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (BOOL)expectsSecureStop
{
  return self->_expectsSecureStop;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startPosition
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setStartPosition:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_startPosition.value = *(_OWORD *)&a3->var0;
  self->_startPosition.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_outOfBandAlternateTracks, 0);
  objc_storeStrong((id *)&self->_contentLocation, 0);
}

@end
